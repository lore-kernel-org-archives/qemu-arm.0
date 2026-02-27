Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BA7FEFB56
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Feb 2026 14:41:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvz1o-0005Ao-DL; Fri, 27 Feb 2026 09:41:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1vvz1m-00057y-0Z
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 09:41:15 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1vvz1j-0007MC-RF
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 09:41:13 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4806b0963a9so72805e9.0
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 06:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772203270; x=1772808070; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GQQbfcwvbcw197IHf2LD5m727K43QJQ5sXW4L4E5hwk=;
 b=k3KWRv7MBwAb2ca2tEDjStbCfgmQ0tkpD+YItdeLFQ+z3pWc0w6AZO+B/101htAPY8
 bsHDZKmloto+0gz05TGN3imu2gRxW9/Ok+Uyb29zbL4cUsonU2i3/gfeKyUF/XQSYHds
 L6iIlGS7k/FiSVDL5BRIPnvcFGJJMbx+kCaH+OyUOj7vBeb8VmnEaWka6KW7Eqib9bnR
 FibUKUTOrFAEDyrfVD+UolR0cOrItATM/Fc22GY8R+4QC2poSI+/jGIzJDxIz6n5y4Br
 q9oxAtilKsNQ7Yun1xarfPZK0kXVXhn7ZZTDgySVHsn3dfh8rafFMCDWxYkZUolpGRHV
 cHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772203270; x=1772808070;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GQQbfcwvbcw197IHf2LD5m727K43QJQ5sXW4L4E5hwk=;
 b=WsSU23WecyQfHq3K1ZAfFZYa6GMow7EtJJ7/FUnC6OJ0ZCApurbLA/DPZfZQlgPaHR
 ofBYGMF0+QNdJAcCkaZKYpckglvECzy9mjff3XgH6+WAT1S8J5YmDQbISpR22+fyMCxq
 70IfT3gVVasJCbJvhy5yaYeBsomYRWPa73e5qFpHqH5T0pJ77U77Vpi30lD7sQDFpANx
 SftOSfGNCGyvxiGc0dQUUHoU1L76LCkF+UNi8GDPPpDyb+FuuVaLzJpxX0hFvo0SRtx/
 GbimG7Jnny76MU+ePxNOsMvDugXpBA5q/kGSWqYqBQmXle9+ws4ejWpQW82mjroiQFt5
 zeJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsZftc1PNYOib7A/lzsO8B+pgLuCbBTPFPL5CSveDlU3ZfszQo71N0bbQ3QbtDWAwQ/ybWurlF0g==@nongnu.org
X-Gm-Message-State: AOJu0YwSfVAFMU/xgEEFErOfehbg+2MnT72Y8O0jfW6Gbv5cQRZ3QkDW
 bPHgquPObMvd/phNf4wKQvLAmmjtOnRO0QzvN9PF+tjupUaaxf1MeRRLCYjqClEO7g==
X-Gm-Gg: ATEYQzwKADXYsQhMntzWECmwuT8cPpoOBCKMy5m1KcQ+GNKIhMXvCMVjp3508+z8pJy
 uj8WblhjX3tvxdHHWjPW3z0Tn9IRmK5zixS93Q9QYX+F1M5EDUApawBrqdeGj4egLst00e89j0O
 dvejmbfV/YhkBtZtFaLI51i9q7jYGoVsIdTz7hf4zL9zGxJsFLfQrbaL6tNQoJg8UXTG48gIeM3
 ZBwBYqgYiNQhNJjjLNShM/e59x3TXQwfNm1/ka7Ck6AvPJADwD7FOCfkjfT3dTXWkZVFyGt7QWE
 hqsH/3ksZKy19WnJGs/0225blmkWHHOYtuFo2exp/XkSawKS6Ma/hfOXnjDITA8radT3U3F7yPS
 G0BSn5UGlgK1C/Qe06mq8hXeFQfAfeD4Eb0zAANnQP/Ml738IXXiXp/VOCE/JjBHPgnhj6RHqd7
 SO/6e4qbiPY/5MJEkHAkuRWqMkmLRTAUAKGf+lhXtnZOxelF+XN2/cnQQaLfFmPPJF
X-Received: by 2002:a05:600c:6b1a:b0:483:6a76:11aa with SMTP id
 5b1f17b1804b1-483c39edf99mr1484085e9.7.1772203269171; 
 Fri, 27 Feb 2026 06:41:09 -0800 (PST)
Received: from google.com (206.56.155.104.bc.googleusercontent.com.
 [104.155.56.206]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfcbf5fbsm60302005e9.18.2026.02.27.06.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 06:41:08 -0800 (PST)
Date: Fri, 27 Feb 2026 14:41:04 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Tao Tang <tangtao1634@phytium.com.cn>
Cc: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Chao Liu <chao.liu.zevorn@gmail.com>
Subject: Re: [RFC v4 12/31] hw/arm/smmuv3: Store CD NSCFG in TT info
Message-ID: <aaGtANCP87L-_gtp@google.com>
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221101632.2993305-1-tangtao1634@phytium.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260221101632.2993305-1-tangtao1634@phytium.com.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=smostafa@google.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Sat, Feb 21, 2026 at 06:16:32PM +0800, Tao Tang wrote:
> With NSCFG definitions in place, record the per-table NSCFG bits
> in SMMUTransTableInfo during CD decode for later use.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>

I feel this patch would be better squashed with how it’s used,
but no strong opinion.

Thanks,
Mostafa

> ---
>  hw/arm/smmuv3.c              | 1 +
>  include/hw/arm/smmu-common.h | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index aa1a95a0093..b8f2fae9a1d 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -838,6 +838,7 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
>              tt->ttb = CACHED_ENTRY_TO_ADDR(entry, tt->ttb);
>          }
>  
> +        tt->nscfg = i ? CD_NSCFG(cd, 1) : CD_NSCFG(cd, 0);
>          tt->had = CD_HAD(cd, i);
>          trace_smmuv3_decode_cd_tt(i, tt->tsz, tt->ttb, tt->granule_sz, tt->had);
>      }
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 9e44c9f7710..bd88e599c77 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -83,6 +83,7 @@ typedef struct SMMUTransTableInfo {
>      uint8_t tsz;               /* input range, ie. 2^(64 -tsz)*/
>      uint8_t granule_sz;        /* granule page shift */
>      bool had;                  /* hierarchical attribute disable */
> +    int nscfg;                 /* Non-secure attribute of Starting-level TT */
>  } SMMUTransTableInfo;
>  
>  typedef struct SMMUTLBEntry {
> -- 
> 2.34.1
> 

