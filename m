Received: by 10.28.71.155 with SMTP id m27csp2155475wmi;
        Thu, 12 Apr 2018 10:17:46 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49NOcgl+2+6NzUoOHEyIUj/5QT3SNZCEuvfZY8Ql4REP/DaFejQMRarmVVf38LgVAENPMhX
X-Received: by 10.55.109.129 with SMTP id i123mr2333584qkc.114.1523553466350;
        Thu, 12 Apr 2018 10:17:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523553466; cv=none;
        d=google.com; s=arc-20160816;
        b=H1WfdGhVXdqkqGFrU+mvC0b3JhzzXvuY3SABA0+9GJ/H4uC3qJJtHs8vJP5d/fGxwR
         JCG1O4Jz88pPdQ5V7fACYNi3AUOKPyFC4p60w9TM0QcdKKrZUkh13QE4HEx71xAKIVDQ
         wX9FjV7Gznv/m0B5t4mYVXHCspEogWmCR2RXxCpOqx354yFJLhZ9EAV0I/VGa2VQNs4s
         5qVfjte6Sh801L5f3L3D1HbQgVycN6bHPkDalFX82FWEc6tJB5JJlejBzLWFKayCoGKZ
         +sUtg8xQ/ZuHzmECHujOGiVSj2yxlG3E2PcMYi3LZOvZCsv0Hx1OGnrVRKchkJPqE2S9
         YjzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=OC+BKEh9fCAnnAYj63dmU6Z0ckoq8BnJimAfCsaulNI=;
        b=VwKKFfdouI/i2oxSdAAV7jvuOR4X0JhJ4dKQXVDGdIIeD4SYmLUwumVdRxPkRAvMaC
         J0DGmimmXvNu05J9RxaYBc3A8O1zdpvLgRXDf0oy8vhWTl/U6HURkqa1BX8MS1VjbiIG
         eEncnUAlSZM36pgL+bZhjVZ4oV/maJCSrFk8W3bbrILvvGtOXotOZJqrxKxHymEJwO2X
         QJcQjZ6oktkWbv0x14TGUC1SsUuCYPOYggXaMwNEdfRBQlgl0tcDIh9EQGJfqT/mBZN+
         G+dTupobcpFB0uZA1TKH79Zyo8ICDocQeqo1YxaDH7madnX4xKPFAgJHAONeF/idvafu
         xHXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PxWYYtXB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p57si1030005qtf.335.2018.04.12.10.17.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 10:17:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PxWYYtXB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56238 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6fqz-0005yK-QN
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 13:17:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60152)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6fqh-0005wm-JK
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 13:17:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6fqg-00011O-Ke
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 13:17:27 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:39948)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f6fqg-000113-Ew
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 13:17:26 -0400
Received: by mail-oi0-x242.google.com with SMTP id x9-v6so5883083oig.7
	for <qemu-arm@nongnu.org>; Thu, 12 Apr 2018 10:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OC+BKEh9fCAnnAYj63dmU6Z0ckoq8BnJimAfCsaulNI=;
	b=PxWYYtXB18hj6I5E5uSEOM49RetsuskQxUMoH8DlXEPXInUzPkRJCTeooh1p5/iD6y
	5JFN4H7gW7m6WP69czbO61O4UE01+QKbXVFv9NTCNH7LSgfaB2vt5+6UnmdzQQuRYE21
	KUXWRxoaKe82sEI11/lx78zSyd6AUxd9iq6n4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OC+BKEh9fCAnnAYj63dmU6Z0ckoq8BnJimAfCsaulNI=;
	b=WLPO4a0zhi6IAF8pwIZaHtD9PY9IE3SXX+Yzg6SgSHrDH1zYtLHxl0Rt4z56g5reJq
	0BPdntq6fm117WNKUsr990YTylB1JRhI/CKG1WUB9KlkKYM3DZGlvLTxj/sJoJK0Q38V
	7K9lKN5rEgtGaVTyKNK+UpNbnGR4FNbBwFNvcLxe9vkfqDjgUTG5XqSJtj0tfgPpAcnu
	47eUnpTJqfuaTZnBP/D1qLy7/XKmYfcMyLafDNNYky9dHJ0maEW7ADdbnSNJAN++z7RQ
	Wpa8aZdFkKbSq2ZGKv4FpGoVcgjPlpMhrlo6+SqXheqn/TEbdQOIgrzdKIus6V4nEMfU
	YbLg==
X-Gm-Message-State: ALQs6tD5ucIcX/3oti7wn4nByD9x6fw/hcvSoEJXgguomCLUemQh46uq
	V85qC+GdsHbXmDyMb9LWC81Zs37dCEz3VrPd64w5RQ==
X-Received: by 2002:aca:1c7:: with SMTP id 190-v6mr6623857oib.80.1523553445826;
	Thu, 12 Apr 2018 10:17:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 12 Apr 2018 10:17:05
	-0700 (PDT)
In-Reply-To: <1521232280-13089-16-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-16-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Apr 2018 18:17:05 +0100
Message-ID: <CAFEAcA9bYdwByseqCMKSVtWV59mNruT3jJfWWLju1koCnwSb=Q@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
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
X-TUID: 2XMc9RXLhm1u

On 16 March 2018 at 20:31, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/cpu.c | 3 +++
>  target/arm/cpu.h | 1 +
>  2 files changed, 4 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index b0d032c..e544f1d 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -765,6 +765,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>      /* Some features automatically imply others: */
>      if (arm_feature(env, ARM_FEATURE_V8)) {
>          set_feature(env, ARM_FEATURE_V7);
> +        set_feature(env, ARM_FEATURE_V7VE);
>          set_feature(env, ARM_FEATURE_ARM_DIV);
>          set_feature(env, ARM_FEATURE_LPAE);
>      }
> @@ -1481,6 +1482,7 @@ static void cortex_a7_initfn(Object *obj)
>
>      cpu->dtb_compatible = "arm,cortex-a7";
>      set_feature(&cpu->env, ARM_FEATURE_V7);
> +    set_feature(&cpu->env, ARM_FEATURE_V7VE);
>      set_feature(&cpu->env, ARM_FEATURE_VFP4);
>      set_feature(&cpu->env, ARM_FEATURE_NEON);
>      set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
> @@ -1526,6 +1528,7 @@ static void cortex_a15_initfn(Object *obj)
>
>      cpu->dtb_compatible = "arm,cortex-a15";
>      set_feature(&cpu->env, ARM_FEATURE_V7);
> +    set_feature(&cpu->env, ARM_FEATURE_V7VE);
>      set_feature(&cpu->env, ARM_FEATURE_VFP4);
>      set_feature(&cpu->env, ARM_FEATURE_NEON);
>      set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index fb2f983..cc1e2fb 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1439,6 +1439,7 @@ enum arm_features {
>      ARM_FEATURE_OMAPCP, /* OMAP specific CP15 ops handling.  */
>      ARM_FEATURE_THUMB2EE,
>      ARM_FEATURE_V7MP,    /* v7 Multiprocessing Extensions */
> +    ARM_FEATURE_V7VE,    /* v7 with Virtualization Extensions */
>      ARM_FEATURE_V4T,
>      ARM_FEATURE_V5,
>      ARM_FEATURE_STRONGARM,

What's the difference between this and ARM_FEATURE_EL2 ?

thanks
-- PMM
