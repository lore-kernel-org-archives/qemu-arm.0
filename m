Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805E4C61DD3
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 14:07:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1P9I-000341-1M; Tue, 01 Sep 2026 10:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1x1P9H-00033p-5W
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 10:07:39 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1x1P9F-0006BB-Cg
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 10:07:38 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6a5dce0aacdso11015a12.0
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 07:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1788271656; x=1788876456; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=AEt1qZR6SklRukD117ZdbyRQvFGvQ34bNaz4f4Ccpyg=;
 b=VjmlkAxTZqKdOJl4BpWWJGIHhveX8+OktmdYjxJ40IoZhGMIWA4mYslrjb8bC6CQP5
 ZLbwsxJxOz13gk6MYdEjQn2FQJjmAR8ABZTXgyT/YWCE/3cA07yLE/iC2tnyzLIzdZdm
 kTdCT6z9HURHFaXzAdSgAVd8VnOZZKx3p+OBnPekxP+PiiGi9GupAchP6yBGOVGnA2vq
 CTPZKYOCQPn3Pw5TEiv/toAOIa+UZ3wvSHNSqQAoX4ngoo/O71YNnT4CFgWjCQVUeFNH
 jDfuyc8z6FdFFNSXWCAhHugRQjFIJ4MkUicGJt7SoZBXpig4jCFgYhbgXcynIx9FmQHV
 t4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788271656; x=1788876456;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=AEt1qZR6SklRukD117ZdbyRQvFGvQ34bNaz4f4Ccpyg=;
 b=JsPZFhTukntLj3ufoxJYVoRYFxIS5Pp+NtQ12VSBmHM8AfolEitP0cnAKgqVlOZryM
 4ox0irOVP9BbcuF5V3m9l9juZ8tBJSlf/Nrf5cws86nbD7W3YL/9mO0ECj4f7LGIgvjh
 0aqVoYXuyNT9zRqB5ingYOBjKtWODxJTYrLEbeAqQq+Ilpk/Ui7QpnNDPCVGgk4qmmlE
 8qyaCBFM39n77BbAet/d7huK+LSFEvMvuecyzLhvwFMO9pUpQzm6vRmqoAeX8Dbr0ehW
 WTET1fCZSftMBBrWDD1KiCcYeEt5Vqn/S/8netYjFPv9ijB159UttDv6Y9lRsJswJ9NX
 /ztg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxtysenwhmSNA55A6MdpaDvbthw/kpUGsdwhzD37JfCvzDnr3vikz6HxOas7EMD8bIlCe2gFWRfNg==@nongnu.org
X-Gm-Message-State: AFuF++lJSJyA8guWfiZuhoWd12ImUhfoWhOK2wKf12D1akFZ0wr1ZvQD
 K3gia7guxAoLWDqkufI6AQ4evt9U4BWrjC5SfOBHB2st+S9SmB6ks3bIs3GxCUT5Hw==
X-Gm-Gg: AYBFou3pWQXJzAgXbapqGSqBSBiBmuUQQbA9XXOS75F4rIHbQTN6YyCXM5DQpPHk56K
 naL7kyAfhzgHoMMPYIvKaWOvinqZwHt2tqI2FfzAD5isaolwY0yXClbob18GtxHb7X33jE5tIoT
 ZRzbwFQdLj4aoc7QHCvdOPYoJsNzLWrm7EAbBkTmq22GlQqGuC/v+a9PRnzd0OhfszBNHtLMjBh
 TuoEp59gxSxmNqrMDNt6CUj9Qm3KTGU4hqWrtxSvKAUyZj3i+XIXMmMCjS9mGfyGtI7XrLOdRCM
 bJtXt4CxO/sMDTQb2ZYrbmC0ltKfloLEFUtc7ErngP5Jbf4TWwOWxeWwzaUFlMqJKDO9eAdcevt
 MoJbYHB4SBySxfh1kctvrefBw4aAG0p3GJbSCT3ckeUypNfOrrM+11gKpS9YBj/BoqVhKW5ri6U
 MeHKFg6mcTu5fsjvBnFZoD4nKibRv3rN8xhwo8m5YfeaZDNld59otUALC2XZ3utHUYiDvNa57sb
 shyQyhLiU+h/w9gxInZuTDm3dCxQQ==
X-Received: by 2002:a05:6402:a2cc:10b0:69a:df95:f1f8 with SMTP id
 4fb4d7f45d1cf-6a66a11c4e4mr41527a12.2.1788271655366; 
 Tue, 01 Sep 2026 07:07:35 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com.
 [35.189.192.250]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a67c74bf97sm262117a12.30.2026.09.01.07.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 07:07:34 -0700 (PDT)
Date: Tue, 1 Sep 2026 14:07:31 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Tao Tang <tangtao1634@phytium.com.cn>
Cc: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@mailo.com>,
 Chao Liu <chao.liu@processmission.com>,
 Jim MacArthur <jim.macarthur@linaro.org>
Subject: Re: [RFC v5 10/28] hw/arm/smmuv3: Store CD NSCFG in TT info
Message-ID: <apbcI5qqD6UX5Als@google.com>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162446.2806393-5-tangtao1634@phytium.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813162446.2806393-5-tangtao1634@phytium.com.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=smostafa@google.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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

On Fri, Aug 14, 2026 at 12:24:46AM +0800, Tao Tang wrote:
> With NSCFG definitions in place, record the per-table NSCFG bits
> in SMMUTransTableInfo during CD decode for later use.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  hw/arm/smmuv3.c              | 1 +
>  include/hw/arm/smmu-common.h | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index a01175cc672..6b34f76f11b 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -881,6 +881,7 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
>              tt->ttb = CACHED_ENTRY_TO_ADDR(entry, tt->ttb);
>          }
>  
> +        tt->nscfg = CD_NSCFG(cd, i);
>          tt->had = CD_HAD(cd, i);
>          trace_smmuv3_decode_cd_tt(i, tt->tsz, tt->ttb, tt->granule_sz, tt->had);
>      }
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index bd83648b14c..1aa4e3208da 100644
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

