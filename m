Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp318368wrq;
        Wed, 11 Jul 2018 08:09:50 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdRNYjiSySdfDYa6TJ+W+Ywzg6UvsP86IVjpfsdRNOUWzE02U/H8NMiTYfJ7ny6CZZwmh1d
X-Received: by 2002:a37:2121:: with SMTP id h33-v6mr26087331qkh.319.1531321790224;
        Wed, 11 Jul 2018 08:09:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531321790; cv=none;
        d=google.com; s=arc-20160816;
        b=AfsbKW8ofTMpYutINNVIMHsFEYTVXbCEsVIinq2cvmmBbrq9jvgwNm5GbWxyZru+Rm
         xtoPJ6X35CKUCOUtElGqXP1NNopQzXwhsWRkSPN2VcXIu/BLslWr81m2o0uXwwUEZSpW
         f83S7CQbTdV77tQSMLgwp22rbRkUDEF0+zlPt2Gj/eQbCUuSZO/Qt2aQ94Ok5v94jPVE
         Lvh06L79uveNCa1RDlTbCvtfiuULxCA+6IYQI6LVxliCqqTolKk0usb34MVAvaIJ3W4F
         fUoCkkuwysOYnjv+WaEsPpuuEspz0SW4Q+1z5LnKl5myS5Bp/IHQKwA2MnzTmL+A5CfV
         7DTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=lVvTgCaMDFqxDWbCsUYUU7aGtmy+UrVomIkASFlUNIc=;
        b=yxP/sFv1pI7Tg6qVWmnV7gzmAyt1Z7SZKoGDxaQy4KCXuPkzvEeyp7sDjTAO10gFaC
         ivc8QMI0Hr90h1ykxjtQ7LgJWnqcicfDDEFrj+b6KCxEPmaPkvu4d/XNJXkXiHuQ9nV2
         B71I4t8Dp/iUaaKAw1uF7TijNffOgMkF/2H3X4DRKSsd0UO4+UlHtNjb0a4XxYRj8fwf
         FP1bbDTVVNXGok4wEpccbzgyUCntd2AjhuvN24ZBkQfSbODJ8OgHIGH0DUuv3Ld6LOhG
         xWD3v9Vh3/5vdhgQAOJRcJHLWeGQkirup85Jom9Hb3/U7B7qOiCH6g5vBeyfB81HAnSG
         GO4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GsSVrlqf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a23-v6si2680476qtp.143.2018.07.11.08.09.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Jul 2018 08:09:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GsSVrlqf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54286 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdGkX-0002tF-Nf
	for alex.bennee@linaro.org; Wed, 11 Jul 2018 11:09:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fdGkO-0002qH-95
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 11:09:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fdGkN-00009z-5m
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 11:09:40 -0400
Received: from mail-qt0-x232.google.com ([2607:f8b0:400d:c0d::232]:39135)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fdGkH-00008X-Vj; Wed, 11 Jul 2018 11:09:34 -0400
Received: by mail-qt0-x232.google.com with SMTP id q12-v6so21368019qtp.6;
	Wed, 11 Jul 2018 08:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=lVvTgCaMDFqxDWbCsUYUU7aGtmy+UrVomIkASFlUNIc=;
	b=GsSVrlqfViB0k3a4ZxOuHHrlAL2dcYiOeVK+tbNP5Rg+uZ6/z+35zKDB4Nk0Wlk4nD
	srY34wmA8XM99hmLBTZZGW2V/rFF5o2x6BTanUN+FpuywL+UHHkQa96V2jkQyf2M7e59
	iVMDtrK/9ARsBQsukvPDqiLz/UH4CSqHbIiEWXhQDbrp3Wg1VlYBYM5queG4DLW+CthW
	hhJGlaAwMXcTTQXRbwNPiYKADi3lPRutoDL1N2zT+xY+ghbXp+0c3TfG9UGE/OlV/gYV
	5p6P5tLc+frdGV9ViGwOGOby5nWik37OXNevmlGci4M6GRNLLZQAqhFeNjeAnAw+doN5
	eboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=lVvTgCaMDFqxDWbCsUYUU7aGtmy+UrVomIkASFlUNIc=;
	b=umy/x1+aLbhCCYYZZ8xzzfWHwNrzTqjrPjfjl1tJlsxkqlo4GmPjP8sAJPSoLTpfcl
	gq010RGFh+RUF4wx+UJfXIHLgHhZ313GcSBsqR//YIldD5aRPOmTopW6z15cpgGSRlfk
	e1jNKFcwk/rLdnSPia/tAPsl1bKFSq/ZHutB1ELx2sBWyZu/IvgAcOSTViRgvPP0VWU1
	b16wp/hrd2hjz7/pguuoyBsMDnk0L56aYpVPH2ijwcV52KAW5OECOmHvgmQhUHRPOuPP
	uVcrh6+nMCmx7vqzmQfFOtqEgr7ccGP0ogVh3yyDn+wgDDigo9dq01BtTasjr2UAAL3X
	cTjA==
X-Gm-Message-State: APt69E129677993hbPkiKmYb2NCZWfhEoFvDy+tgekjx2XX1mCkYFge2
	iRo60xxEnHEiHzWU7+El3n4=
X-Received: by 2002:ac8:230b:: with SMTP id
	a11-v6mr28633518qta.123.1531321773370; 
	Wed, 11 Jul 2018 08:09:33 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	p14-v6sm6723727qtn.81.2018.07.11.08.09.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Jul 2018 08:09:32 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180710160013.26559-1-peter.maydell@linaro.org>
	<20180710160013.26559-7-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <a35204d3-1496-3b16-57c8-82bff18b8677@amsat.org>
Date: Wed, 11 Jul 2018 12:09:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.0
MIME-Version: 1.0
In-Reply-To: <20180710160013.26559-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::232
Subject: Re: [Qemu-arm] [PATCH 6/6] target/arm: Allow execution from small
 regions
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
Cc: patches@linaro.org, KONRAD Frederic <frederic.konrad@adacore.com>,
	"Emilio G . Cota" <cota@braap.org>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PL/wLRD/UvNm

On 07/10/2018 01:00 PM, Peter Maydell wrote:
> Now that we have full support for small regions, including execution,
> we can remove the workarounds where we marked all small regions as
> non-executable for the M-profile MPU and SAU.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/helper.c | 23 -----------------------
>  1 file changed, 23 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index a2ac96084e7..ed96e6c02fb 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -9784,17 +9784,6 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
>  
>      fi->type = ARMFault_Permission;
>      fi->level = 1;
> -    /*
> -     * Core QEMU code can't handle execution from small pages yet, so
> -     * don't try it. This way we'll get an MPU exception, rather than
> -     * eventually causing QEMU to exit in get_page_addr_code().
> -     */
> -    if (*page_size < TARGET_PAGE_SIZE && (*prot & PAGE_EXEC)) {
> -        qemu_log_mask(LOG_UNIMP,
> -                      "MPU: No support for execution from regions "
> -                      "smaller than 1K\n");
> -        *prot &= ~PAGE_EXEC;
> -    }
>      return !(*prot & (1 << access_type));
>  }
>  
> @@ -10014,18 +10003,6 @@ static bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
>  
>      fi->type = ARMFault_Permission;
>      fi->level = 1;
> -    /*
> -     * Core QEMU code can't handle execution from small pages yet, so
> -     * don't try it. This means any attempted execution will generate
> -     * an MPU exception, rather than eventually causing QEMU to exit in
> -     * get_page_addr_code().
> -     */
> -    if (*is_subpage && (*prot & PAGE_EXEC)) {
> -        qemu_log_mask(LOG_UNIMP,
> -                      "MPU: No support for execution from regions "
> -                      "smaller than 1K\n");
> -        *prot &= ~PAGE_EXEC;
> -    }
>      return !(*prot & (1 << access_type));
>  }
>  
> 
