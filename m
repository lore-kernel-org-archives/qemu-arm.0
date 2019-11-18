Received: by 2002:a05:6512:48d:0:0:0:0 with SMTP id v13csp2570325lfq;
        Mon, 18 Nov 2019 00:41:56 -0800 (PST)
X-Received: by 2002:a7b:c10e:: with SMTP id w14mr7025325wmi.40.1574066516883;
        Mon, 18 Nov 2019 00:41:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574066516; cv=none;
        d=google.com; s=arc-20160816;
        b=Qm7yTmp8HXWBNREapiEsYmnPbpaPERJltsvnw6eMZqo+FzwOpNymr3Hy5Hoqga6vZV
         rIFJnS9vreQzSzhl5ZJjCmyytE41+guY0Rp153xIyEZDlEgTjwrIVGJ6wNQIt4rvmFDO
         FrZDmNPgZVoCQV1zxZVQGCogkSNZ53HVgn6sR1C0WRiywcDhuL50Txtmd/ltjCrObcYO
         mH8acnLEtvyUocDQxbojQzgV4TZK4Vr4L9I3OpM0V2DGBNSb2oXDFS0HWfLt+dcN0lg0
         VKuDu0jO1NC9QkKCPsVgH7A7I8tWr7XkPjSohkNh6/ColU/Q4GVerqmQohgGqy5To5y7
         Tu2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=CzM2VI0idBWgtiGfAq6Zv0yTI6qF2bsxDrGTUD/vAro=;
        b=Q6haMpGobzayCcR6TgQMYJdlRh5QDgxqg1V7XX3L+2M+FupJeIpekBWefwgKMpqffx
         lXnLDno+zkckGi8N5BbizOTgWuZmuAsSLe/DFJhiyhbveHdf66Zw3EQVbpxI532S6P2Z
         wS9DeoTwLdAIaEOlqMKnzGtfzldTto73ETuJmMKBBjtu8bmumEdh2Ab08BVZlVDhCpZU
         8DEK8POQltwP8eUqJKl9ALIX8PQLkCDhJ6sNOKtwR2EAm/iPQ8nyJ78tJ6HUup4th1MP
         ux6TOWcqpiF4Fv2i1Zbt8R05SLr/iHMvVAB3NCBeDPSJKGk45bYQdqz+HxtyBHN0GWLr
         p+Bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oBadPYev;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w8sor10789423wrc.35.2019.11.18.00.41.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Nov 2019 00:41:56 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oBadPYev;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CzM2VI0idBWgtiGfAq6Zv0yTI6qF2bsxDrGTUD/vAro=;
        b=oBadPYevT8fKQqJiBXlA+INjxrVybiuIDrugYv/ONDJ+JbfoICu4QeTyRCgK+GCF7T
         lshDcOitjr3ztkHPv2Ea45wHG1/WUVS2YGppovKprk+76ESftDM+pYSPS7EUzdwOAuGd
         oDdyjeiA8yf2c4Vpbin6n4ivAK8A+IcflRkftt0Bt3+n0zgQOFPiSSVjjOWIjqJQaP55
         8DIJZ5gOp+6lHyk1QzmmzflzgkaSAFSRm+kGIAizd6qkM6w0m+OMIKlpFCblYyKtWuuX
         JtMclux1vjxw/F0htyFiTdpvhTf4w3wR+WGd5eejNJkJTMUeY5vwZJ2PWpvCSV+ZxccY
         Z7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CzM2VI0idBWgtiGfAq6Zv0yTI6qF2bsxDrGTUD/vAro=;
        b=KQ7D0bF0QL5ELiSsVQS88pdnEM1JO2sIn6vM0EdtBjiXevFx7GWaemI2UsMfsibtiX
         bnm1QzHQtHQe0DPlOG0QWALtw0AaHGYDYHctgpUteaTLQ8dzhgeUJO/FZqrTU+oAADp1
         Lz/94pf2Or9joCTiqL6+unYOaqPd5QUIfHrcdm0v5XvaAUs1Fx/HpSg2JmDs3/wrISH8
         2QYyDWSoHsbMzk2tPmmG/iOfHbU+5sWWX2Krn8H2ScVJEaCN0eYgLebzs5xHj+Awq0Kc
         H4NxznYbKWU5PEvgTqjsriZfesDvkR1nyDWeFZiLwrxeu6TDbJdP7z9zTIn63KzVsRIm
         E09Q==
X-Gm-Message-State: APjAAAVOL3LGU7Bz0eoAoM4SYff/ZruXjJiSKtOFsbPSfDH/baPvWMV9
	aPIHtpo18dZk5gju26xDM1lcu9OQ
X-Google-Smtp-Source: APXvYqwfuXWhOQ/+Ftbt4HEkYyX+Qk+RemfsHItJbleagb0H94bb64znOuJRgW3bPyWYv9uDdUlKyw==
X-Received: by 2002:adf:e68d:: with SMTP id r13mr30535284wrm.199.1574066516544;
        Mon, 18 Nov 2019 00:41:56 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.8.102] (65.red-79-149-41.dynamicip.rima-tde.net. [79.149.41.65])
        by smtp.gmail.com with ESMTPSA id n23sm19237841wmc.18.2019.11.18.00.41.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Nov 2019 00:41:55 -0800 (PST)
Subject: Re: [RFC PATCH 08/11] gdbstub: extend GByteArray to read register
 helpers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: alan.hayward@arm.com, luis.machado@linaro.org,
 damien.hedde@greensocs.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Peter Maydell
 <peter.maydell@linaro.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Walle <michael@walle.cc>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20191115173000.21891-1-alex.bennee@linaro.org>
 <20191115173000.21891-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <026f7fc7-082c-c277-bbfa-f51eb0c058c4@linaro.org>
Date: Mon, 18 Nov 2019 09:41:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191115173000.21891-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: oRyGRN8DEPRn

On 11/15/19 6:29 PM, Alex Bennée wrote:
> +++ b/target/arm/helper.c
> @@ -47,30 +47,27 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>  
>  static void switch_mode(CPUARMState *env, int mode);
>  
> -static int vfp_gdb_get_reg(CPUARMState *env, uint8_t *buf, int reg)
> +static int vfp_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
>  {
>      int nregs;
>  
>      /* VFP data registers are always little-endian.  */
>      nregs = arm_feature(env, ARM_FEATURE_VFP3) ? 32 : 16;
>      if (reg < nregs) {
> -        stq_le_p(buf, *aa32_vfp_dreg(env, reg));
> -        return 8;
> +        return gdb_get_reg64(buf, *aa32_vfp_dreg(env, reg));
>      }
>      if (arm_feature(env, ARM_FEATURE_NEON)) {
>          /* Aliases for Q regs.  */
>          nregs += 16;
>          if (reg < nregs) {
>              uint64_t *q = aa32_vfp_qreg(env, reg - 32);
> -            stq_le_p(buf, q[0]);
> -            stq_le_p(buf + 8, q[1]);
> -            return 16;
> +            return gdb_get_reg128(buf, q[0], q[1]);
>          }

Mostly ok, except for this change, which has the same endianness problem that
the other ARM change did.  Why is this not done in patch 6 with the other?


r~
