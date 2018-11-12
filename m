Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2546111wrw;
        Sun, 11 Nov 2018 16:24:59 -0800 (PST)
X-Google-Smtp-Source: AJdET5eN4wY8WvYaf07FNvQl5bmgcSKyQAi9bCPprHn+ckiXGmv5WAUYWvNLhTJs5pWmk6mL2vSi
X-Received: by 2002:a37:2b5b:: with SMTP id r88mr17046017qkh.336.1541982299394;
        Sun, 11 Nov 2018 16:24:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541982299; cv=none;
        d=google.com; s=arc-20160816;
        b=cBMuJ3EdnOoFZBB7oxXu129fD/qCS+6cjyVopHUfcW5sLcjUmh4F35yxYA9L10/iTu
         sSjvhx3LzbsfXZYpDBBW0p+D7IimgpNqrg5fyBcjwcmkldXsUk0hcoLSyZez3LYmF3HJ
         YJxmG33O/yCyslhFYLMGJtBR60r2cl2Zv00t+cCvpwl7ZMJCfZtubmp3wZDTF9A5YxJe
         1MmKcRfiY0iTnTqGMX9tlCfoq3HY8NN+eCitNvV15r7IZvBCljs9zTKSSnQzprTInZPl
         T2/WpTQsTEJ3VJY2tc4jgJL1zsqLApfFplFlUxjrrBvFUkcq403z6sLokztAA+LbhSPW
         0eIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version;
        bh=iK+7Na6eDI58frO/tYOdLJ9f01xH1dRRcPLNDvemA/g=;
        b=W1Y3FRrusKj1s+fgwlXTr+fHY+VX8istNdLPRG6/ZzZ0Ar0rjI4sBgiGjMyiLClhUY
         Y3CSosJdik6pxOlbPxbVh9gEByLC6WJ5ubdtXVShdiyKSxUwFcuQ6jaoNEjhA8ZV5zB8
         jlEQw8Hd4syckvXb7zJwHkWbH/O8oFMxjbsF/Tdsb4ah/sHWp2Z32v9nXHHFURIympvB
         WzgYFaCn7UPaVj4eCK6m3ECsyBZnCnRKxH4qbfcO/R6Nm/oem+lgFSzeJOdTQ2WjiYb8
         onEq12DZ8/tvNXqYvQ1gGj46+d+IHvrtvMS29r4HlaHPIrt59ENQYNcWL7ivTUo0So+7
         E2Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e1si6057426qta.181.2018.11.11.16.24.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 11 Nov 2018 16:24:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44174 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gM02E-00084o-SN
	for alex.bennee@linaro.org; Sun, 11 Nov 2018 19:24:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gM027-00081C-EL
	for qemu-arm@nongnu.org; Sun, 11 Nov 2018 19:24:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gM023-00012b-B8
	for qemu-arm@nongnu.org; Sun, 11 Nov 2018 19:24:51 -0500
Received: from mail-yb1-f194.google.com ([209.85.219.194]:39923)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gM021-0000vG-6p; Sun, 11 Nov 2018 19:24:47 -0500
Received: by mail-yb1-f194.google.com with SMTP id w17-v6so3263177ybl.6;
	Sun, 11 Nov 2018 16:24:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=iK+7Na6eDI58frO/tYOdLJ9f01xH1dRRcPLNDvemA/g=;
	b=R90lUb5+n5vqj/FGobuz5Kc4RsbZd+apFdK0kH8d+fOajWMDjD+Yk5P46KQapMcuSx
	KGWwoiOAZsFvYYwzAxoLk9m/rXfg9DvtJo94Y7KjTib+GBrPMT4z2xI1LfxaJKAPwB4A
	+GmW3kua+k60FcG2UXpyvwVM5vPXhR8KEDIjfjbAW6udNPu9KWgo0b2CvDZ5vbOPorlP
	y8fS5bL5k5SIZmLV+eDet1H8wM4so7Y/35de6aMNX21hA//Pl1QaiSdRdmoSEKbA+uoD
	pBbBpla7G8rUbMRDI6Of8ynNE1TVPNhQWXDBG6sEkKp8O59hGLHVrwtu8QTKw/RrA2fl
	ezLA==
X-Gm-Message-State: AGRZ1gIzGSVP+HfYg5Pa7CDTuVYuaqwSi2gfpHfcVemNaneMFGpL2R9J
	oz2DKCdPu0/xZ31zBKS6iG1H9PzALqvOZeij7y4=
X-Received: by 2002:a25:348b:: with SMTP id
	b133-v6mr16999703yba.269.1541982273617; 
	Sun, 11 Nov 2018 16:24:33 -0800 (PST)
MIME-Version: 1.0
References: <20181109173553.22341-1-peter.maydell@linaro.org>
	<20181109173553.22341-3-peter.maydell@linaro.org>
In-Reply-To: <20181109173553.22341-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 12 Nov 2018 01:24:22 +0100
Message-ID: <CAAdtpL5y_F01pnQz-t-8JiQEXxSrijYWuGQ6fWq8t80E_GheGA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.219.194
Subject: Re: [Qemu-arm] [PATCH 2/2] target/arm/cpu: Give Cortex-A15 and -A7
 the EL2 feature
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
Cc: qemu-arm <qemu-arm@nongnu.org>, adam.lackorzynski@kernkonzept.com,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 66fvHL9emf7d

On Fri, Nov 9, 2018 at 6:42 PM Peter Maydell <peter.maydell@linaro.org> wro=
te:
>
> The Cortex-A15 and Cortex-A7 both have EL2; now we've implemented

still PL2 there :)

> it properly we can enable the feature bit.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> ---
>  target/arm/cpu.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 784a4c2dfcc..b7185234d85 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1587,6 +1587,7 @@ static void cortex_a7_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
>      set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
>      set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
> +    set_feature(&cpu->env, ARM_FEATURE_EL2);
>      set_feature(&cpu->env, ARM_FEATURE_EL3);
>      cpu->kvm_target =3D QEMU_KVM_ARM_TARGET_CORTEX_A7;
>      cpu->midr =3D 0x410fc075;
> @@ -1633,6 +1634,7 @@ static void cortex_a15_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
>      set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
>      set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
> +    set_feature(&cpu->env, ARM_FEATURE_EL2);
>      set_feature(&cpu->env, ARM_FEATURE_EL3);
>      cpu->kvm_target =3D QEMU_KVM_ARM_TARGET_CORTEX_A15;
>      cpu->midr =3D 0x412fc0f1;
> --
> 2.19.1
>
>
