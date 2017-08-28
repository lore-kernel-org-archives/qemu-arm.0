Received: by 10.223.188.70 with SMTP id a6csp4815323wrh;
        Mon, 28 Aug 2017 11:08:08 -0700 (PDT)
X-Received: by 10.84.224.205 with SMTP id k13mr1737276pln.203.1503943688435;
        Mon, 28 Aug 2017 11:08:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503943688; cv=none;
        d=google.com; s=arc-20160816;
        b=C9G36DPqOo71x7es3lrodgVYzzOgmjWLdo1ACCBFDDHvOeCEWEpRNuCR+/5GgRYtbF
         VafR/k708Id9QU2ccz6jyn/nGyUAWImfrekNICoq2l1NcReQt4Mge3OeX6iGxwUkLVTE
         6mnxUfOksA4R4TztVXG0sApHQewabXE8VXrPV+zh5b5TrETf/oe85w67CsOHl3QZR9am
         NeZiyTxSSyTKEpiL4joNtfrTjhVIFxtPPymeUXFrWbk5WKjBNoDM4qLxIkTkDTgyXlu3
         THSmt6rY9+D98kKPD03yE8hRbtVZ5Jal/I2dtUyAlIZU/RYN1G1Jh0tPHYBMvMpYPAGm
         rVgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=omy4xWpeOupyA2rLXxgMwKUL4Dnl3JvLpxki57+EgIc=;
        b=bUiwuW4wiNWnlf5LOmq7WduNlr0dNqTLDdl3WzUIXB7tPDqkp3x4yEGbLDSbWCYOoK
         MktpZnOK6ErszbyAyDWDGoIokU7sRDBYM/AXR5MAGchb9/8pksvpbiDrEEQDUxjlVOeb
         5p844YZctiskuLTTE0YntKbcZrJSeE2UD8/DJxQp3onRF+5r8jUDDK+9+NuyJ+WpqV9e
         d6BmGK7JJV4fKu/uvYZSQfaQpSfuyFkUwgHfXeouwmfRN36D4H0gQvCMVShXy3VlhPd5
         m2rnQ3+JGZICWr6h/8xRIohqtXk32d3VVRC2KGqM7YMTaB0t0fkwjRbtD5UeLAIRnliV
         UODA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=mumHNLNb;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c05::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com. [2607:f8b0:400e:c05::242])
        by mx.google.com with ESMTPS id s1si725269pge.251.2017.08.28.11.08.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Aug 2017 11:08:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c05::242 as permitted sender) client-ip=2607:f8b0:400e:c05::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=mumHNLNb;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c05::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-pg0-x242.google.com with SMTP id r133so895803pgr.2
        for <alex.bennee@linaro.org>; Mon, 28 Aug 2017 11:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=omy4xWpeOupyA2rLXxgMwKUL4Dnl3JvLpxki57+EgIc=;
        b=mumHNLNb5TFdEeI0gdmo2Q9nXubOXb01gGG2n74w/nBtfm0Ipk5vTcIvsIVr7ZWV1J
         Os0CXEWBiZMmSj9Aon+XQW0SgrDvSyEFdtRLVt9TNyifBmZT0Uii8DfIq+7Luyy7xb32
         d40EzzP5HU5FAEX9evM2Juzo2zbdf+75ry2whB+SCzqmIjArXMEK1XU4UQPXnfqfmfiU
         FjG+fQ4XG0ggGXZvCnT8i4y9MAUwZs4xGk+N8J/sJNLiYhmkCoWVpeV65d/He2BTEQj3
         D0oFcishXqq+ZaEBJsM2Q/F4hOfBHOm55UCd8rbQ7urra/+vx4+SscQWQ40k1kqL3+7f
         HeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=omy4xWpeOupyA2rLXxgMwKUL4Dnl3JvLpxki57+EgIc=;
        b=STB03NJn+/To/wN0E5yPfvZGLjUhl+Ld1JKS1REa6pE3ippWU75HqANsz+knuLt4f3
         u6HpaUJAE98/Oj6+rEMWWL9LPyeexr3avN1tAn4J2ksrSmHOBg/ZuXMAi9Wl2JuEAIuW
         Es+tjbVsTm8JX1QXE140oPLNghnvmgW42qAuAflm9RwGFI+HqH7u5InyN0jX+1s7uIV3
         oWQxabQatV90hQy2aFd+RG7e62KkQMvjO/I/VBihLgBx6cqSHfyR5r0MBBNRH3WM9Nao
         tR3dBPIEfEA4l9kYB86PuZWlQMwijJRCEQOcENXhQxHVWbFKHXxHjjdVoCX1TVV0GsPJ
         K51g==
X-Gm-Message-State: AHYfb5jbwWmbfquPsBJzqPSiOO8/3936nejSPxo3j0WKUs5Yy5JMIXEZ
	TDdoQc5S4Fpg7Q==
X-Received: by 10.98.16.72 with SMTP id y69mr1456230pfi.78.1503943687886;
        Mon, 28 Aug 2017 11:08:07 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net ([172.56.42.6])
        by smtp.googlemail.com with ESMTPSA id m21sm1694609pfg.28.2017.08.28.11.08.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Aug 2017 11:08:07 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [RFC v2 PATCH] tcg/softmmu: Increase size of TLB caches
To: Pranith Kumar <bobby.prani@gmail.com>, alex.bennee@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Claudio Fontana <claudio.fontana@huawei.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Alexander Graf <agraf@suse.de>,
 Stefan Weil <sw@weilnetz.de>, "open list:Overall" <qemu-devel@nongnu.org>,
 "open list:AArch64 target" <qemu-arm@nongnu.org>
References: <20170824155849.30799-1-bobby.prani@gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <34d6f244-4dd7-1701-30b8-bb9cdc089681@twiddle.net>
Date: Mon, 28 Aug 2017 11:08:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170824155849.30799-1-bobby.prani@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 8Lq2G1PBUE/O

On 08/24/2017 08:58 AM, Pranith Kumar wrote:
> | TLB bits\vTLB entires |             8 |            16  |            32 |
> |                     8 | 952.94(+0.0%) | 929.99(+2.4%)  | 919.02(+3.6%) |
> |                    10 | 898.92(+5.6%) | 886.13(+7.0%)  | 887.03(+6.9%) |
> |                    12 | 878.56(+7.8%) | 873.53(+8.3%)* | 875.34(+8.1%) |

Thanks for collecting this.


> @@ -89,7 +89,7 @@ typedef uint64_t target_ulong;
>   * of tlb_table inside env (which is non-trivial but not huge).
>   */
>  #define CPU_TLB_BITS                                             \
> -    MIN(8,                                                       \
> +    MIN(CPU_TLB_BITS_MAX,                                        \
>          TCG_TARGET_TLB_DISPLACEMENT_BITS - CPU_TLB_ENTRY_BITS -  \
>          (NB_MMU_MODES <= 1 ? 0 :                                 \
>           NB_MMU_MODES <= 2 ? 1 :                                 \
> diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
> index 55a46ac825..f428e09c98 100644
> --- a/tcg/aarch64/tcg-target.h
> +++ b/tcg/aarch64/tcg-target.h
> @@ -15,6 +15,7 @@
>  
>  #define TCG_TARGET_INSN_UNIT_SIZE  4
>  #define TCG_TARGET_TLB_DISPLACEMENT_BITS 24
> +#define CPU_TLB_BITS_MAX 12

I'd rather the definition in tcg-target.h reflect the actual maximum and limit
that to what we want (12) within cpu-defs.h.  So, here maybe

#define TCG_TARGET_TLB_MAX_INDEX_BITS  32

etc.


r~
