Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6097797wrt;
        Wed, 3 Oct 2018 02:57:21 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61lizRR70wP9GBlXFZ4T9Do0Jl6FCDkcEIqdBSqtw8nIuqQHNsBrjw/6+XgpFwcjPOK8dDN
X-Received: by 2002:a0c:93c1:: with SMTP id g1-v6mr515360qvg.136.1538560641264;
        Wed, 03 Oct 2018 02:57:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538560641; cv=none;
        d=google.com; s=arc-20160816;
        b=nmVCnTXaqAZfVJohiHiXX4UAEEZxIWZ7nNTGJge8Fjaj0NtY2HjHTkTeuf0p8N67no
         IOlJn7PClU49J/4Cag8QsMWCa0EwHBKUVjJX2+MR/Vhr5jECp6mNI5MTbplGkaIy6mEO
         +R41oOvpr7C80fg1qnNL0+rYWXoq9HkY8Ug85IrqxUCoLIp3fhhzSIpo6T1EOjdES6ac
         UPcnWT+8Wm9gtcN2g3BhyaN9GXUD8R8Jw1vHFduYVLc+BVCGsMWEWgW6O9A7/43p53ZB
         YvHs8T4RQZ2wDkvqnCFenYl0AxIRX+sCP0ckHJznxXqZ7Tt+b507kfhORicEEZtWlZiT
         s5kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=ENK+Z3WCAE/rGXrKmwcjNVDvZoiz8wxswjTTba3TMuY=;
        b=fWXou3/Dpw3jGJHKwbMhtoh/E36lBqS50Lg0ujDpuWCO0mprlTqXH8NDixHiq0KTft
         T9Q3g40eSy3VhLqgO7/2/X3EHtjqp4PhANF8Y0YvMXoKHVtyf19B27/Sy/lkKsVkPEPo
         BMNPVu8daNzHqIpGBdajHXLmQxH8/q1+4nQwXv2fUIckQN4nLBSy6CM7jZQtQL0kfQ1E
         7HaIQjvyiQNBSvG5d2L6IgjXj5fpI0SnpWVd25CvL9CyPHEMtgr/XmFeWDiXCg0hDnWu
         qQA7Jw66h5gEXzgWOWFazY3mrwxDcfT3jnPTaC5jmTmLTvrAdzVdq7FG0q1Da7NeB1sX
         02Gw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g38-v6si542405qve.248.2018.10.03.02.57.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 02:57:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47720 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7duC-000228-Pm
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 05:57:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57604)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7dsq-0001SK-UJ
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 05:55:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7dsm-0001hA-UY
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 05:55:56 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51263)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g7dsm-0001gw-NP
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 05:55:52 -0400
Received: by mail-wm1-f68.google.com with SMTP id 143-v6so5055479wmf.1
	for <qemu-devel@nongnu.org>; Wed, 03 Oct 2018 02:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ENK+Z3WCAE/rGXrKmwcjNVDvZoiz8wxswjTTba3TMuY=;
	b=P27sMYao6t97nZAmE6bzDZR7Tx1FieJiF1Cu8PPdXEHTo41OV4k1xcUytYhm0+iwev
	tQnYSKkgan2+WkagN1ZLCAdzwapqafPF2mzCDg+wQ9GlQLVnz6GqDI4+r1Cm4V4ePwlY
	bx4ocLz8/crsezqE/7Nj78wgKfcrAWLB89bD+rC7WUQPr9VAo5InEMFWtgu9ECkTULpp
	6SiMxoTrUb/x+ZpON/BtUR7tEWymOmYrawzN6YC8be9IYLyV37lbKMbzqooIsVUH4bh7
	wyQIaH514F4nCBmmbmpHRhlGf14JPI7+HSk54sPQ7wq+6pwizw/uLSczn6X5ECBRK4CG
	5V0A==
X-Gm-Message-State: ABuFfojcusTwWvC1PLHOHZXH4PHjTPYqbLgVaomlqmvTE0NL34eUSwPT
	nhwcMBZZBzUB4T1d+DAd4eD3hQ==
X-Received: by 2002:a1c:d986:: with SMTP id
	q128-v6mr953730wmg.110.1538560551659; 
	Wed, 03 Oct 2018 02:55:51 -0700 (PDT)
Received: from [192.168.2.33] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	e7-v6sm1218096wra.37.2018.10.03.02.55.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 02:55:50 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181002163556.10279-1-peter.maydell@linaro.org>
	<20181002163556.10279-13-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <35235ad8-c104-05a9-3f9e-677a743b73e2@redhat.com>
Date: Wed, 3 Oct 2018 11:55:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002163556.10279-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-devel] [PATCH 12/13] target/arm: Add v8M stack checks for
 VLDM/VSTM
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
X-TUID: YJXI86l/bU6c

On 02/10/2018 18:35, Peter Maydell wrote:
> Add the v8M stack checks for the VLDM/VSTM
> (aka VPUSH/VPOP) instructions. This code is currently
> unreachable because we haven't yet implemented M profile
> floating point support, but since the change is simple,
> we add it now because otherwise we're likely to forget to
> do it later.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index ef64d2559de..2d3a1be518b 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -4229,6 +4229,18 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
>                  if (insn & (1 << 24)) /* pre-decrement */
>                      tcg_gen_addi_i32(addr, addr, -((insn & 0xff) << 2));
>  
> +                if (rn == 13 && w && s->v8m_stackcheck) {

Following previous patches style:

                   if (s->v8m_stackcheck && rn == 13 && w) {

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +                    /*
> +                     * Here 'addr' is the lowest address we will store to,
> +                     * and is either the old SP (if post-increment) or
> +                     * the new SP (if pre-decrement). For post-increment
> +                     * where the old value is below the limit and the new
> +                     * value is above, it is UNKNOWN whether the limit check
> +                     * triggers; we choose to trigger.
> +                     */
> +                    gen_helper_v8m_stackcheck(cpu_env, addr);
> +                }
> +
>                  if (dp)
>                      offset = 8;
>                  else
> 
