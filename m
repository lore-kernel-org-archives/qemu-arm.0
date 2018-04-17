Received: by 10.28.4.212 with SMTP id 203csp3922609wme;
        Tue, 17 Apr 2018 08:01:36 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+OXqGZjHjUSFc+Ny4B3VDFfnhgTKSqdp7ZebDCspFuMEzBMavStasiAn6CWi346d6py0zX
X-Received: by 2002:a25:a568:: with SMTP id h95-v6mr1531102ybi.515.1523977295931;
        Tue, 17 Apr 2018 08:01:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523977295; cv=none;
        d=google.com; s=arc-20160816;
        b=0AJabtPf7ZSQLrm18G+ZW+EGfkPDGZpDg4f0SIBKCzfwrT9D83qtq1aLmjheLEyxtS
         vhkiBjZIAqk47i7gBgzzFem9CohuS6AUriUR65aP0p6jsAUNJqLbbJUWxHp+Zn1O1Qrq
         +752/VEBouEnIhPVUlxqFsSdfmKOakwpB0iIy7Fhz8ZLU/6FrxdRYS0QitFVeTbxCtUY
         ddtmO7eNp381ZmiuzXKRljZMso6MbSzvYo2Qb9mRLwyYV7s5eyhStiI26I18VmEMPy6f
         F7Dp3C7iuiR/OIpGVGCQTjhuwizs+d8wKjPyEU4VwZYqfyemHYwkPktgbnYxqQx19pws
         hKvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=8PYDPbLm4VJxpTbS3tZmKyLOEixSCgfr7iJVZk2jEv4=;
        b=lNNbw8D5CF1QgzUIP6OfmlALQuQqG4aAjL5vn7OdLg80QXrrmfpLRsuaoRUtqvrZTm
         3jAnx6KatSBNmG5+dAgUnRfmtHgy/rNs8zCRDH4wGvKqChjW2s0jHhyFoiS+9mcVpc8a
         4PslM1EnST8FPnfTkXeHvQUePnJgSCdPbPtVBR2fHLlXkzzhhMMWZYLLNzyATIYVuxTT
         m5fY4UX1Z7w3vKLBIZYhFz63nxvoNm75tW9N4tXKSbj4P70flDvjNF2dSlBFUpjw9Yoe
         wGTzaVLNWQB3fSdoxlu1S/ziwiIwsLq5RT6zqF12kEWWpkgnRi9wJFyf3QJIyzQc1QYE
         BvHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DJOcCQ43;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f5-v6si3174367ybq.401.2018.04.17.08.01.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 08:01:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DJOcCQ43;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43857 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8S6x-0002jG-BX
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 11:01:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34298)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f8S6d-0002gr-HL
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 11:01:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f8S6T-0002Nj-Uf
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 11:01:15 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:35495)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f8S6T-0002Mw-NI
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 11:01:05 -0400
Received: by mail-ot0-x243.google.com with SMTP id f69-v6so595311otf.2
	for <qemu-arm@nongnu.org>; Tue, 17 Apr 2018 08:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8PYDPbLm4VJxpTbS3tZmKyLOEixSCgfr7iJVZk2jEv4=;
	b=DJOcCQ43hg4R10U7DoqTypiYGxxvYiwYe3gNPd0gkHNkJxpFg8EyJ2LKMLsQvx85qo
	ZpybSea/mGcpbrmgB1Kp/cDzDyLopCFTE3hPFYx3IfrHrVA/7cjugfovU7mqGwTaOj8G
	eUSM4lzM5spz8GgqOcg/Rgga/pq/6aaF07z70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8PYDPbLm4VJxpTbS3tZmKyLOEixSCgfr7iJVZk2jEv4=;
	b=UaRqxt2VvQIkd+798w7rvfTSp/gpFNgmNDHGY8im5uBm+cLRS1ulZBVov5TokcB3iS
	0YVXwrXVyLMHi8gZIc97Zoa2j8jBOUNwCB0JabT41YOHbi+ly8RpikgD9VrfknZG2xrV
	lodBs0CFrI7gt4VWEHImAGdZ/4N99awrLpXBeD1uTJbBZ8SrryYMWNwPCmtRW9Wgwcbl
	j1aEfMBHX0Ww+J1S7mBzbQWPVgODteMTL3FC/XptsLedEWVZP8HdobdFilpzVZViV2fP
	ryHqKlRI7ysFIz+rrYjjCsbINIdSjhlb8aHzlSoN9OHOwpteeMjCctuV8TsBfpSYy/b1
	6+Vw==
X-Gm-Message-State: ALQs6tBVKqxmyBU7ZKCnM1OjmGb4RX2fQKndYnV409CI6AnIZuyfMyhW
	hWvOTY2XOSaD6o9DaE1Kk63A8TsG5A3tpZkHbce60A==
X-Received: by 2002:a9d:5cc1:: with SMTP id
	r1-v6mr1364043oti.258.1523977264138; 
	Tue, 17 Apr 2018 08:01:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:3104:0:0:0:0:0 with HTTP; Tue, 17 Apr 2018 08:00:43
	-0700 (PDT)
In-Reply-To: <20180417142318.GO24561@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-16-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA9bYdwByseqCMKSVtWV59mNruT3jJfWWLju1koCnwSb=Q@mail.gmail.com>
	<20180417142318.GO24561@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Apr 2018 16:00:43 +0100
Message-ID: <CAFEAcA8RwC7DSbo+mMqYUS6tL5UwfQGMa_r5AnAkJqm7v63HWw@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
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
X-TUID: CTKUsDxziyw1

On 17 April 2018 at 15:23, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> On Apr 12 18:17, Peter Maydell wrote:
>> What's the difference between this and ARM_FEATURE_EL2 ?
>
> I use ARM_FEATURE_V7VE in a later patch to guard against implementing
> PMOVSSET on v7 machines which don't implement the virtualization
> extensions
> (http://lists.nongnu.org/archive/html/qemu-devel/2018-03/msg04917.html).
> I could use ARM_FEATURE_EL2, but declaring that v7 machines supported
> EL2 didn't feel right. I don't feel strongly one way or the other - how
> do you prefer to handle this?

So, the underlying issue here is that there's a QEMU specific
fudge going on. Architecturally, if the CPU implements the
Virtualization Extensions, then:
 * it has Hyp mode
 * it must also implement the Security Extensions
 * on reset it starts in the Secure world
 * it has LPAE
 * it has some stuff that is not inherently tied to having EL2,
   like the SDIV and UDIV instructions, and the presence of
   PMOVSSET

In an ideal world, we'd just have a feature flag that turned
all that on. Unfortunately, a combination of backwards compatibility
issues, the order in which various features were implemented
in QEMU, and the fact that KVM can't emulate a guest CPU with
the Security Extensions means that we want to be able to model
variants of some CPUs that don't really exist in real hardware:
Cortex-A15 and -A7 which only implement EL0/EL1 but still have
all the v7VE features that you can see from those ELs. But we
didn't really properly lay out guidelines for how the feature
bits should work in this case, with the result that we have
a bunch of local hacks (for instance get_S1prot() has a check
on the LPAE feature bit, since in practice that bit is set in
exactly the CPUs that have v7VE; and the UDIV/SDIV insns have
their own feature bits.)

So we should probably sort out this mess first, either by:

(a) state that we use ARM_FEATURE_LPAE for all checks for
features that are architecturally v7VE but which we want to
exist even on our v7VE-no-Hyp-no-Secure oddballs
(b) define an ARM_FEATURE_V7VE for them
(c) define separate feature bits for them individually

In any case we'd retain ARM_FEATURE_EL2 for "and really
has EL2/Hyp mode", and we'd want to do an audit of current
uses of various feature bits to see whether they followed
the new rules.

(For AArch64 things are a bit less awkward because the
architecture allows the idea of an implementation that
has EL2 but not EL3.)

thanks
-- PMM
