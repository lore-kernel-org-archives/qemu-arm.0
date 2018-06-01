Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp378993wre;
        Fri, 1 Jun 2018 01:58:17 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIfsydU7/IKvFPOnEaRdtNs6J1TNkNOymUt1eIG08ayMzspnOcJeuRn5LmTMA2J6JUo8K3z
X-Received: by 2002:a0c:cd13:: with SMTP id b19-v6mr4148860qvm.83.1527843497040;
        Fri, 01 Jun 2018 01:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527843497; cv=none;
        d=google.com; s=arc-20160816;
        b=EEYKYn8UDW5c7IOoSF8Z+yzyyfzssm9uQhMaRPKJb28zmZx2ZExI1V6CWKYXQrmPab
         B6CshVVmfywziIe1n6BVg7S2JRdPsQFn9cY7VGFdu914cduEYTkaChqNq1F9HFgn2hVU
         hTwmANlx7ps8945PanyAocWklSsVBM9COppQnQgoSOT9k2kPv6gQ6zfVt97LfX1EDOjX
         qhDZ34H6J1m3jgrloqYwomFq6Zb90fkZ0wk7iqNJWBQ8KMruXqr1i1SU2S6scfTBX2Uq
         AU6ab3Vfn1sx4D68xl69adDKxqIc/uCeAQW2iH+T15PjqE/amQSf4SNEQDPBUthAWCOk
         dwOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=XJHTWJ+fCxFBtlWyEh+ugViKZ1jFmwFeN2YmoLzOs4A=;
        b=jWmK0CwEhilzFy91ztBYvKQNIMKnq4OPiBA7uOGcLNwcTPJGJ+DSPJtnaUuV+D59jp
         UpA0adhoR0naI/i7hj1fFDbHTqggl1hMdyOEtUYdCzSdvt3PIxsLiqff2uNJ5MF5e8Ui
         /VA1IfKjeTQ50ZWtrgMrI+MiGLIA4qAfoB/SKib+ss5bexuxFS5+f1arIM7f0O9zvqFz
         gC6MBF5S/CvL0klJXPX6hFLQiC4GxDaXsUJXmOwWJeGuIWGywCl9euZv+i7j3AEllBlv
         8uY46lNSDrBsmb1DBzex1hVz8h88NT3f/KBqrf45Qib4a09lwrVre/CMUAZiv8tDMjSw
         TKdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IyMVsM5H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z19-v6si36723qtm.214.2018.06.01.01.58.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jun 2018 01:58:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IyMVsM5H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48247 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOft2-00066D-KG
	for alex.bennee@linaro.org; Fri, 01 Jun 2018 04:58:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fOfst-000662-KH
	for qemu-arm@nongnu.org; Fri, 01 Jun 2018 04:58:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fOfss-0005vl-HV
	for qemu-arm@nongnu.org; Fri, 01 Jun 2018 04:58:07 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:36134)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fOfss-0005v9-0t
	for qemu-arm@nongnu.org; Fri, 01 Jun 2018 04:58:06 -0400
Received: by mail-ot0-x244.google.com with SMTP id m11-v6so28451484otf.3
	for <qemu-arm@nongnu.org>; Fri, 01 Jun 2018 01:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XJHTWJ+fCxFBtlWyEh+ugViKZ1jFmwFeN2YmoLzOs4A=;
	b=IyMVsM5HMFyh/SkUsWfak+nF7r08VTpKdTTD3QkJPdEYIPXk1nWUdQZAVx3rI9aSWI
	vmaEgJxglxptcOUQssQXLnfHsXBbKij/VhdurF+CygAs+rZje0YHVyi1aDTOquDNNqcl
	Hz/7odpyPVq3RdWhz9JP2+uwf6/p6EkfVoP0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XJHTWJ+fCxFBtlWyEh+ugViKZ1jFmwFeN2YmoLzOs4A=;
	b=P6CxSOrJ3MGJk5+1v6s8dWlw0AnjYRKrJyrbJ7I7WynChwEo2T0tXoaqRaNkIYV1pE
	MW6Q4ar58BbssAeXxN5F+H30CrDIYy1TPtFvh9psYAxDAvhvRFSKSURLmUAx0dggaCFt
	ZFDUhWw6UbRO1/l6iCsBasaENOyDhK5giNs1APiJjV3kPof0mw23ziuwKvY20g3dR04w
	ddqKwdIDPzHomRwzab+JOC4JHiCoRay1x6FHOAzgH2YA8XxURfCpbUt1lbBWG8Bm88HK
	pyGJiPWOekRByR1DrBhTkTlEB9aMi7v6aeGFm+pbx7aKr9qUO0V/dRfySMR1+UJ9OpFw
	tXKQ==
X-Gm-Message-State: ALKqPwdJxj8aNvJwwJyGR/3G8b5qof2zajR020phYrVePxOf7sf6OJ6t
	XTfgwj11Qqwx5jnTJd8wnfoKHihDDLo4S4J3BtR86g==
X-Received: by 2002:a9d:16d0:: with SMTP id
	s16-v6mr7047323ots.294.1527843485085; 
	Fri, 01 Jun 2018 01:58:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Fri, 1 Jun 2018 01:57:44 -0700 (PDT)
In-Reply-To: <20180531203906.GA12424@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-16-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA9bYdwByseqCMKSVtWV59mNruT3jJfWWLju1koCnwSb=Q@mail.gmail.com>
	<20180417142318.GO24561@codeaurora.org>
	<CAFEAcA8RwC7DSbo+mMqYUS6tL5UwfQGMa_r5AnAkJqm7v63HWw@mail.gmail.com>
	<20180517193104.GB4771@codeaurora.org>
	<CAFEAcA-+sO3oUqfQXHcHRBu2i-WFzvFKObcBz26qeLS_0+3s2Q@mail.gmail.com>
	<20180531203906.GA12424@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jun 2018 09:57:44 +0100
Message-ID: <CAFEAcA_2z-2utCiPQM0DtZGXgiE2qbVsB=Nn81j9DP7Z8keRqw@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH v3 15/22] target/arm: Add ARM_FEATURE_V7VE
 for v7 Virtualization Extensions
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0ZTEskMK/Jkm

On 31 May 2018 at 21:39, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> On May 31 15:18, Peter Maydell wrote:
>>    if (arm_feature(env, ARM_FEATURE_V7VE) {
>>        /* v7 Virtualization Extensions. In real hardware this implies
>>         * EL2 and also the presence of the Security Extensions.
>>         * For QEMU, for backwards-compatibility we implement some
>>         * CPUs or CPU configs which have no actual EL2 or EL3 but do
>>         * include the various other features that V7VE implies.
>>         * Presence of EL2 itself is ARM_FEATURE_EL2, and of the
>>         * Security Extensions is ARM_FEATURE_EL3.
>>         */
>>        set_feature(env, ARM_FEATURE_ARM_DIV);
>
> Is it safe to assume from your comment above regarding keeping ARM_DIV
> separate from V7VE that the inclusion of it here is an oversight and
> that only LPAE and V7 should be set if V7VE is? (and that V8 should
> now directly imply both V7VE and ARM_DIV?)

No; V7VE always implies ARM_DIV. (ARM_DIV doesn't imply V7VE,
though, which is why it is a separate feature bit.)

thanks
-- PMM
