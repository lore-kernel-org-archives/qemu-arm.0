Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp785944wre;
        Fri, 1 Jun 2018 09:01:04 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKLh9E4I+Sl32l6s4YAYg/kYaoof61ijytK2jv54YVzhwQ8zGpk3zmjhGVKGLLYo3z/QB2T
X-Received: by 2002:a0c:f94d:: with SMTP id i13-v6mr7198484qvo.95.1527868864497;
        Fri, 01 Jun 2018 09:01:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527868864; cv=none;
        d=google.com; s=arc-20160816;
        b=sSZBuW/PnLybkPWt86BYLZlChnCNuKIoxTvg4GbAtamWLia0OXdWMCKXmfxsnpHcwZ
         vkhs9PWnfHzduhAYKKUriyk++X+/8vLrD0Z8PuZeX/1VR++lwsQNX3+a0RpbHl9gTx67
         XFhrXnFwhj1y5hBUMCUiYEhRj8m2wc4ov0UhaEEDVj3R+i2wV5QYDrw6EN8zAvZlCOwD
         Wl4yi+4i3hco+oAd1Dr0pBEDWrT3BWcg/fTyoE1dno6NscX9Qe8sCLGO7oCM9yft+vfg
         bH1y0QZv57UyZq74wnBacsNKt3TWLOj/sL0/uuLs+MWhT+6Oglu5EOXpfAR5J7v+geiA
         jVpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=rJuBiswprH4WLs6XJekKhIH+mpDnAFxFrXmfFcm+E5g=;
        b=dlY2llFf51ahUlP82Yl1oGoYw5L16r+E/N2/CEMIsKAZbr60qUod88onJYVG7YF9/k
         YY8AFToLLMdLQ3q3cft/U/AdpTVi67UGD9704fQynmR9Ektse4EfUQqr3csjSAF5HwU5
         SSr7DHwCkGZRpX0bpOOYsXgWSEXbK1HRZ4EkMsJrL0nwR3T5Qf+K8ufJ0KGDcBS//GmZ
         xBW1LQZ1x20gc8IHyXD9wNTp2SU+QGkFFpfa1pwLmWIXx9v+rMOoULCdLubzhBFxwnOc
         dU3kpfKEOtasRppsdAgelTolJIcfQJP7PkS0AzgLuRcIu9PK6VQW/mC2ifbHb+B/AaFm
         zTQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QNmXXj8j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i7-v6si2414384qtb.85.2018.06.01.09.01.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jun 2018 09:01:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QNmXXj8j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56342 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOmUB-00038d-Uz
	for alex.bennee@linaro.org; Fri, 01 Jun 2018 12:01:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fOmTC-0002rk-H2
	for qemu-devel@nongnu.org; Fri, 01 Jun 2018 12:00:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fOmTB-0007Iy-Ha
	for qemu-devel@nongnu.org; Fri, 01 Jun 2018 12:00:02 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:43511)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fOmTB-0007I8-Cs
	for qemu-devel@nongnu.org; Fri, 01 Jun 2018 12:00:01 -0400
Received: by mail-oi0-x242.google.com with SMTP id t133-v6so19304161oif.10
	for <qemu-devel@nongnu.org>; Fri, 01 Jun 2018 09:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rJuBiswprH4WLs6XJekKhIH+mpDnAFxFrXmfFcm+E5g=;
	b=QNmXXj8jcXqbypD2x2D3pqCXCdaJrvyt7YNaemdZxobU4F0Kb2hpjpn5B/57Iz1TtM
	5TXmj334np/GX92++Pw9+5ddMtTkrss3uHvZGS1AJ49bk4/vMhQZ0pFWNMhQP/aeJmWV
	YMj0spkquIquUa9p5KfSqc4SDd2TRqUZuVPrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rJuBiswprH4WLs6XJekKhIH+mpDnAFxFrXmfFcm+E5g=;
	b=iM4/3+fgsYKUDAsIzUuuX5IGayQqD5XDVI17heEfWb2ONRQHLiNqNOeAxGPTjnFIwp
	tDsxG0x1P4sLJIOE0EdTYTujhoaAONwy8YWvWWr4q19D9puW/VMCCVmjhEgT3KJCoCsK
	mAjkyn3gf0coY+al7YQ6UBRcIE0jjO29Rj4xEprxQzREZbIDL2W0lZHvWvpYyGSkBl4n
	Et74NX4pHYGSzZRF05Z5JXZkUwgpiQfzex5BY2OA2wQXCt27LBw0OX7tyMWuiF67yqWJ
	Fzrc24yYNV66jfQka6gNkYdkpKStEESEdewRvDVPXlo+eU1/6ooIbqX2K3FW7A1bRxy9
	7VEg==
X-Gm-Message-State: APt69E2fU66eALTWB6mGH4kVoOMwUxXnCCMIbQqPK9/X9wp+omtZJzkc
	Mor2dGycWp91JnfsbH4Lj6D6ZzJGuEoQv/bFYd64LQ==
X-Received: by 2002:aca:d4c7:: with SMTP id
	l190-v6mr6945413oig.102.1527868800586; 
	Fri, 01 Jun 2018 09:00:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Fri, 1 Jun 2018 08:59:39 -0700 (PDT)
In-Reply-To: <20180601153423.GB12424@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-16-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA9bYdwByseqCMKSVtWV59mNruT3jJfWWLju1koCnwSb=Q@mail.gmail.com>
	<20180417142318.GO24561@codeaurora.org>
	<CAFEAcA8RwC7DSbo+mMqYUS6tL5UwfQGMa_r5AnAkJqm7v63HWw@mail.gmail.com>
	<20180517193104.GB4771@codeaurora.org>
	<CAFEAcA-+sO3oUqfQXHcHRBu2i-WFzvFKObcBz26qeLS_0+3s2Q@mail.gmail.com>
	<20180531203906.GA12424@codeaurora.org>
	<CAFEAcA_2z-2utCiPQM0DtZGXgiE2qbVsB=Nn81j9DP7Z8keRqw@mail.gmail.com>
	<20180601153423.GB12424@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jun 2018 16:59:39 +0100
Message-ID: <CAFEAcA-A824jUKK1bTg4-fVs10iotYu0wMkSk-tUfj+tZkpbug@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-devel] [PATCH v3 15/22] target/arm: Add ARM_FEATURE_V7VE
 for v7 Virtualization Extensions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Wei Huang <wei@redhat.com>, Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n136TBzajdAH

On 1 June 2018 at 16:34, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> On Jun 01 09:57, Peter Maydell wrote:
>> No; V7VE always implies ARM_DIV. (ARM_DIV doesn't imply V7VE,
>> though, which is why it is a separate feature bit.)
>
> Okay, then I'm confused about some of the preexisting logic in
> kvm_arm_get_host_cpu_features. The preexisting code in that function
> sets ARM_DIV and THUMB_DIV based on the appropriate bits in ID_ISAR0. If
> we already knew that
>>    (by definition a host CPU which supports KVM has v7VE.)
> and that all V7VE CPUs have ARM_DIV, why did the code there bother
> checking ID_ISAR0 to begin with?

Good question. I suspect I'd just forgotten that at the point
when I wrote that KVM code.

>> switch (extract32(id_isar0, 24, 4)) {
>> case 1:
>>     set_feature(&features, ARM_FEATURE_THUMB_DIV);
>>     break;
>> case 2:
>>     set_feature(&features, ARM_FEATURE_ARM_DIV);
>>     set_feature(&features, ARM_FEATURE_THUMB_DIV);
>>     break;
>> default:
>>     break;
>> }
>
> Should this switch/case be removed entirely?

Yes, I think so (and also the id_isar0 variable and the
idregs[] entry which arranges to initialize it). We should
just set the THUMB_DIV and ARM_DIV features explicitly.

thanks
-- PMM
