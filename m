Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7421075wrv;
        Wed, 7 Aug 2019 22:47:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxuagV16zdfXUA4noZGfV3RXCjHvryuwQb1VbBuCpI2dqjhGR8kyLPDhhHpymnXaTz6p2Yc
X-Received: by 2002:a37:8fc5:: with SMTP id r188mr10341786qkd.141.1565243274583;
        Wed, 07 Aug 2019 22:47:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565243274; cv=none;
        d=google.com; s=arc-20160816;
        b=EJAhKVwCEPjOxYQMk/XClw21BOMBUYjzXexdYkBMYUKsmBvJU51OUwSoimTaQvvmH8
         FtiFDDLjzJakEstEIvMhZg8XfhywuWser4acIVMC0Pq8Jb35DEQqbiA1z1BoHC8O50S1
         tuRGQ0MeLtl6CpMdS/i4XDYPd8TnPuiy7jvNQo4+a3xwpFfap+tv4/KfzqVAwh7+TvAG
         qD/pMDlCpkPCGua+MsaOnWdX2Qil3vfvBhIEYsFd7uDOrQMilc6HiSsbVYg16+8Y9dc9
         lMpuHEQkmOk2bfpjaVr1Q9JyZKdvDHMWi4WgfoxFjtmSzBDVfGrRDAQopBjKFotJDI+7
         QUhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=nT8CFJH0PbI6qES+XnXT2/ec7olOa95JWIULhILjm9I=;
        b=MhHiDm5esqLUxHTt3Avof6l2/0SDOzfMQUq32GgLahs/9f18kY2XzEHb0Nna1J83Ij
         ZxxaHFWlL/9eqII/KgaT2JTyPhhvpb1ereVGnnGa6ViRbb8QcyfFMWPgr/zDNOom4kXA
         noBiQHsARga8Q44ddESufBq/KW0yjRtjKJdqdT9G+wBNeKyH5OodB/QbG3sg9WQ6Ka4u
         ZuHoEcRJUu7/ErfmGH0qzmCDQhkYyxyG0jyxldn+e/oZg5+CxvJHC7VlnVaoNiOm2kyw
         W9KvmhlU0kMzcNxWeCDMsXPttbdGHkRT7UN7ywYaqCzD289ptFEEfgDQicghcSEjVDkC
         dC/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 73si38303242qkf.25.2019.08.07.22.47.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 22:47:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvbHG-0002X5-2Y
	for alex.bennee@linaro.org; Thu, 08 Aug 2019 01:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33040)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hvbH6-0002We-5Q
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 01:47:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hvbH4-0003NZ-83
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 01:47:44 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52696)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hvbH3-0003My-UN
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 01:47:42 -0400
Received: by mail-wm1-f68.google.com with SMTP id s3so1087248wms.2
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 22:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nT8CFJH0PbI6qES+XnXT2/ec7olOa95JWIULhILjm9I=;
 b=mucjMh/J4Wsx7eTXKflIpmUPemsb2wnLqy4MoqSiVbNG8NAE9QGRHSAlQdpbedFgry
 xFy6MGALpgSDAL1QatzrXoUP3YsLGEOpegDNfjRG82aGkEleXl3N/k/6lLxe+lFzwI0u
 1zLj9c9FO/MH65f0fqNUInpC4DD0QjHuTfUJ8+ZdXukVI0A+1aR6dnKzHBQxyLXiSwtL
 2GSzdHmgwPTkeENR5593s0JvtaIc4RHZFwzav/kJH6gdoreLyHcYe2nwhv1N9MeYrqEr
 Vfm/RCwnjkARERGj2mEZBn6n+KrZFnGtys8fnTbUvMjcP4RggIHSuu2a6vxPq/T7KZRq
 FJBg==
X-Gm-Message-State: APjAAAXWoBWZO92STfIHv0u8J4KeQ04clC3+w8NK60GqGzBeipMFUnW8
 yc/Jd1Y797A/Oq+U7s1AMd7YEsCREWY=
X-Received: by 2002:a1c:c005:: with SMTP id q5mr1920839wmf.59.1565243259768;
 Wed, 07 Aug 2019 22:47:39 -0700 (PDT)
Received: from [192.168.1.39] (214.red-83-51-160.dynamicip.rima-tde.net.
 [83.51.160.214])
 by smtp.gmail.com with ESMTPSA id g7sm2085858wmg.8.2019.08.07.22.47.38
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 22:47:39 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190807045335.1361-1-richard.henderson@linaro.org>
 <20190807045335.1361-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <f1eaba6a-6f7d-b37d-52d5-88f16dbaf871@redhat.com>
Date: Thu, 8 Aug 2019 07:47:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190807045335.1361-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 01/11] target/arm: Pass in pc to
 thumb_insn_is_16bit
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HSuQ/6uPvMVr

On 8/7/19 6:53 AM, Richard Henderson wrote:
> This function is used in two different contexts, and it will be
> clearer if the function is given the address to which it applies.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  target/arm/translate.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 7853462b21..1f15f14022 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -9261,11 +9261,11 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>      }
>  }
>  
> -static bool thumb_insn_is_16bit(DisasContext *s, uint32_t insn)
> +static bool thumb_insn_is_16bit(DisasContext *s, uint32_t pc, uint32_t insn)
>  {
> -    /* Return true if this is a 16 bit instruction. We must be precise
> -     * about this (matching the decode).  We assume that s->pc still
> -     * points to the first 16 bits of the insn.
> +    /*
> +     * Return true if this is a 16 bit instruction. We must be precise
> +     * about this (matching the decode).
>       */
>      if ((insn >> 11) < 0x1d) {
>          /* Definitely a 16-bit instruction */
> @@ -9285,7 +9285,7 @@ static bool thumb_insn_is_16bit(DisasContext *s, uint32_t insn)
>          return false;
>      }
>  
> -    if ((insn >> 11) == 0x1e && s->pc - s->page_start < TARGET_PAGE_SIZE - 3) {
> +    if ((insn >> 11) == 0x1e && pc - s->page_start < TARGET_PAGE_SIZE - 3) {
>          /* 0b1111_0xxx_xxxx_xxxx : BL/BLX prefix, and the suffix
>           * is not on the next page; we merge this into a 32-bit
>           * insn.
> @@ -11824,7 +11824,7 @@ static bool insn_crosses_page(CPUARMState *env, DisasContext *s)
>       */
>      uint16_t insn = arm_lduw_code(env, s->pc, s->sctlr_b);
>  
> -    return !thumb_insn_is_16bit(s, insn);
> +    return !thumb_insn_is_16bit(s, s->pc, insn);
>  }
>  
>  static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
> @@ -12122,7 +12122,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>      }
>  
>      insn = arm_lduw_code(env, dc->pc, dc->sctlr_b);
> -    is_16bit = thumb_insn_is_16bit(dc, insn);
> +    is_16bit = thumb_insn_is_16bit(dc, dc->pc, insn);
>      dc->pc += 2;
>      if (!is_16bit) {
>          uint32_t insn2 = arm_lduw_code(env, dc->pc, dc->sctlr_b);
> 
