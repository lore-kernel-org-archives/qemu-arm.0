Received: by 10.25.0.6 with SMTP id 6csp907127lfa;
        Sat, 13 May 2017 22:37:30 -0700 (PDT)
X-Received: by 10.55.169.193 with SMTP id s184mr26458qke.118.1494740250712;
        Sat, 13 May 2017 22:37:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494740250; cv=none;
        d=google.com; s=arc-20160816;
        b=KNc5QENJoDdQLS0VQYD+62WqdrcutA4ZYSiOYkCH8mTAJ/DFEv496qWOIjaSGp1V2E
         GDz386NJtnhSry7ibdrCi2jRxMg3cAHcjNOaESalVvP5OrnMkjFADCjlA1Epi8ZidgxR
         7vFYwuCTq2ktOYukgLRPqvsnTO1mGK0wkd24TIMIqRyolyECagMYcC21nQ9MSrPbwBwp
         og8Wjb1ebvXyxo91jxb4wQ9uVzC9HIvmIwppqGFBg6qtjNpw+rX7zmgL1+4D29icJWql
         Piv3JW5n3BSe81phW3JVC7zt++RtOaCo4kNdOWDatQZtToS1ygn2XgAEEHv0FlrA3oED
         Uinw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=uzU2dbNRwuxd+yjd55rMmBaxR6qeNzXEeHjLFTDqXnU=;
        b=skrR6USt+gEYoBlEckBujgfJtRgJQqbbeTukmZpRkCsUIBL3gsVO1xf9R5XZY5YFAl
         BOM/QaEh+mVoi0r5m4J1dG6IHeq80GDdIbZJ8D+y+fauuGANRTtk88vlztXQXKJ6Omgn
         7scNGNuubiUrbMbp+ggDWHrMbaySMYEvMRMYxhvCM6ISioOsJqUBZcA7+6T2ik4SGsc4
         rvnr5qa2Oonfn0d5pTEPlCJSiJhg6H0ERAItfUFZ9Jh181BO5GTuFUxbHn82AN7xQY9L
         k/F3GNKoCH+vupEkY5VAEZQ7s99UvBxDTz/OrOa79nyVsuv24otf131IZ6p8GDdjgEzz
         2FNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 1si7560607qkm.14.2017.05.13.22.37.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 13 May 2017 22:37:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59813 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d9mDg-0002nm-9X
	for alex.bennee@linaro.org; Sun, 14 May 2017 01:37:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9mCp-0002Ka-Ql
	for qemu-devel@nongnu.org; Sun, 14 May 2017 01:36:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9mCl-0008AW-4g
	for qemu-devel@nongnu.org; Sun, 14 May 2017 01:36:35 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:36851)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9mCk-0008AG-Tr; Sun, 14 May 2017 01:36:31 -0400
Received: by mail-qk0-x244.google.com with SMTP id y128so13042409qka.3;
	Sat, 13 May 2017 22:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=uzU2dbNRwuxd+yjd55rMmBaxR6qeNzXEeHjLFTDqXnU=;
	b=dLboKHmRr8NJgDFbdFtAbFATq52rLudgGIwaOdb28ISzCNkRlMD4QqumnwSsKz90he
	dYLLH0gdK3rKLw5mUNLZDtt9KzH0TPpYQF/z6wTl+Slfv/wGO/3EIlXr6md8b3z5hNE+
	N/pMT6JFJhA/YRBrpbu4iaN6sll6mi1JolGYeXsyHo70AdYilI8DGIDgUcheUZHlHQol
	Nary8qVegruDKgJeSZD+YwFaXfaygD6YJMQivgsSZHsKfvNJqrHKcIz3qt+IXAHwxWlQ
	ji3f8mlY7I5H5sgBxEtPZnYIQgvURANlIqQLpeXDc36OxbA6HhpGJORlKO1Ka32uc/sN
	lBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=uzU2dbNRwuxd+yjd55rMmBaxR6qeNzXEeHjLFTDqXnU=;
	b=DXRgeX5dsGd7eJ9f2ih+ICvEZcolkXC7XYVavGpXHoSq4EV8So1hgDEBaflmimVIiZ
	iB+8M6jRKeAbonOrpc7vgAN09UznWpQfd2KPUUQ/eIGR9NnsW9KGdnb+3iWfBsJMGlfN
	BeDIXnrxjm5A/VT0I4p04AOOBoYhLSHKBcoivUDxjJN3RDd4OjSoG/3XsRTpT1oLNlRd
	X0yISxLtT1cbza73KaYZlTMFaXTBrlFGT6YLHUiHw3j8uDVYshnTADqoEskceMo02LGM
	UQbdhdNBZArtdt1jnDXUdxtcg9SgDaDlNqsdzelMaeRKspDOkQHRGzd+WatfQ1KaXcdr
	4Big==
X-Gm-Message-State: AODbwcC9CiDnP/tML5VFaSbb56kjiFObsEGMAUYe0UqPypiZm/PVFkjD
	dJdeYBJ3Ttki7w==
X-Received: by 10.55.101.143 with SMTP id z137mr28623qkb.50.1494740189922;
	Sat, 13 May 2017 22:36:29 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	x53sm5861127qta.36.2017.05.13.22.36.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 13 May 2017 22:36:29 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1493226792-3237-1-git-send-email-peter.maydell@linaro.org>
	<1493226792-3237-2-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <58ed86e6-0b92-152e-2238-302554651306@amsat.org>
Date: Sun, 14 May 2017 02:36:26 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1493226792-3237-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 1/3] hw/intc/arm_gicv3_cpuif:
 Fix reset value for VMCR_EL2.VBPR1
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kFUd1bj9jOBM

On 04/26/2017 02:13 PM, Peter Maydell wrote:
> We were setting the VBPR1 field of VMCR_EL2 to icv_min_vbpr()
> on reset, but this is not correct. The field should reset to
> the minimum value of ICV_BPR0_EL1 plus one.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_cpuif.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index 0b20856..d31eba0 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -2014,7 +2014,7 @@ static void icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
>      cs->ich_hcr_el2 = 0;
>      memset(cs->ich_lr_el2, 0, sizeof(cs->ich_lr_el2));
>      cs->ich_vmcr_el2 = ICH_VMCR_EL2_VFIQEN |
> -        (icv_min_vbpr(cs) << ICH_VMCR_EL2_VBPR1_SHIFT) |
> +        ((icv_min_vbpr(cs) + 1) << ICH_VMCR_EL2_VBPR1_SHIFT) |

Indeed "a BPR of 0 is impossible (the minimum value is 1)"

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>          (icv_min_vbpr(cs) << ICH_VMCR_EL2_VBPR0_SHIFT);
>  }
>
>
