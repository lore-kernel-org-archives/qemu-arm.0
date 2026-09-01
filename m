Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2ECC624D4
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 14:06:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1P7b-0002IL-Ei; Tue, 01 Sep 2026 10:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1x1P7a-0002Hq-5v
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 10:05:54 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1x1P7Y-0005Xu-Jb
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 10:05:53 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6a5f9b036f9so2735a12.1
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 07:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1788271551; x=1788876351; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=yGM4cNT0iV8pE9yltcSfvu9CgBaiZ5zk96nOQRB2F6I=;
 b=LzM2cpN+rb3faps6C/p6LvUDArlTNW0Lo+uowL+tOrsh4QSMmtzWKJe0mxu+yaFntk
 Fl7sErFfvOzzem02g315B9GB/SBBqAayJtfcJvWoD4HFfF/SJZQ4HhsUoF1JrpGjj1uz
 a3Sj+xErdP/bzXErj9HvaV9SjjHn0nojV7gxm6s068kTK6pBmglirtGnHVpwUhWR8qtA
 2PRYqNt5IunmDskl0C/Up5Cit//r+cxyOzzETv8fK525ZsT51NWj1GnT8k8MnhF3NPYX
 DcRx02y+SRrSnRtofH+ApnnXTsY7ci1cI3UYF2TMuIzu5ptdx8ZPUu5OZnFx0QIP3l8p
 EjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788271551; x=1788876351;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yGM4cNT0iV8pE9yltcSfvu9CgBaiZ5zk96nOQRB2F6I=;
 b=I08Smv/CAPKTnp64Q3OuH/bAPFX/wSNlWNF8KTdysw3iXTYRogJmNpmMdBEgFirIWs
 o3zNHu9C1r9x+fwP8skIOyjWH8vgezBWqKsOcg/61ORvLvPvZPb96PKAdp4n5hY+9dAc
 HE9AvLmSEbzDEpvFrhNGq50fYQ1/JxmUuRHEksPRDBM8nyUwI0Tc+ua31Bn/YTVjHNhm
 n2qfb3LMw9CwIjy8jxZK0oqgzXvUBNneCu8O84Va86zzbigx0aVJvhxPkQWyRrI0FrO9
 PIboZkO4pF0AkhxDf0IUkANxmLHuFWFIFiskUTz/g7PqzNRMyO452B9SsGwLhJFPfeAU
 jcZA==
X-Forwarded-Encrypted: i=1;
 AKwUvBz4ulkTdffJYlJgR8dgq0Yp6nIpT/g8Cl9ucutDwrbvy3VwR8xnpU5VpgKHFG8hU1vYPxNa2GoI7Q==@nongnu.org
X-Gm-Message-State: AFuF++mGt+jfs3tNJKiUtUoafiv+WpI2saGGZE+aIhu6LY2JigyjTUdu
 i27Cs6aZlNEp2WCJ+Z0pL9V4JsRLvueP6wkDFe9250mYKw7Z/klqpKhmg2j80ktUyg==
X-Gm-Gg: AYBFou25rvEVVRiApB2x3b/CXboIvjJQY5PymS+1DgJ0RxHO4urXg/mbo/zYs+vlrj4
 NF8Dz4L3kGhtR/V0jMZOunejQ4O/5La5tJNYcCphdtSF3fR2vVZjp9y1Z/X0ELbElYpBZmmsVta
 NSUT91tOC40vztZUS9spxmxSGkw8nsn0NqO4IYO4g0mnbhNZxFBBFjrpvYtBJBRXyP5YxF56N55
 CsrixlLIPW4iYhbLywcFGRya6w1a2jEdbSxfy62c0qpmmgsIzyRCjzxMhEvQvu96JichNBro4ey
 lIgvR0P/vD5+ep8iC1mSEmZOv2KP1SxkpqFdeRYaIxF9Bg/x9apAINsGDmfPYR7DKQVzF4yw0Bc
 KEDYXYeH0Y1GGIJ0bGnDlFPb2X06iNs9zvJrZHLH30ydl3vZAEtijRqXl2SXRSNBADuY1U2cZW4
 zFDLoGLejZkf4idojT/PIOXsAF2isH7WOIhq1ZgHGMmn/ZolV5yzX5/KOvX9IshxjAqKuMySAod
 X0DR4Ktu3kYFRcPamLu41Qk8qy/gQ==
X-Received: by 2002:a05:6402:a18f:b0:69e:98c8:e958 with SMTP id
 4fb4d7f45d1cf-6a66d8db181mr34907a12.7.1788271550320; 
 Tue, 01 Sep 2026 07:05:50 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com.
 [35.189.192.250]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c255ee2865dsm615871766b.25.2026.09.01.07.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 07:05:49 -0700 (PDT)
Date: Tue, 1 Sep 2026 14:05:45 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Tao Tang <tangtao1634@phytium.com.cn>
Cc: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@mailo.com>,
 Chao Liu <chao.liu@processmission.com>,
 Jim MacArthur <jim.macarthur@linaro.org>
Subject: Re: [RFC v5 09/28] hw/arm/smmu: Add PTE NS/NSTable helpers
Message-ID: <apbbuRSwfGzzaJZy@google.com>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162446.2806393-4-tangtao1634@phytium.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813162446.2806393-4-tangtao1634@phytium.com.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=smostafa@google.com; helo=mail-ed1-x52f.google.com
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

On Fri, Aug 14, 2026 at 12:24:45AM +0800, Tao Tang wrote:
> Add helper macros for NS and NSTable bits and group PTE attribute
> accessors for clarity. No functional change beyond the new helpers.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  hw/arm/smmu-internal.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
> index d143d296f34..004abd58bca 100644
> --- a/hw/arm/smmu-internal.h
> +++ b/hw/arm/smmu-internal.h
> @@ -58,16 +58,27 @@
>      ((level == 3) &&                                                    \
>       ((pte & ARM_LPAE_PTE_TYPE_MASK) == ARM_LPAE_L3_PTE_TYPE_PAGE))
>  
> +/* Stage 1 attribute fields in VMSAv8-64 Block and Page descriptors */
> +/* Non-secure bit */
> +#define PTE_NS(pte) \
> +    (extract64(pte, 5, 1))
> +
>  /* access permissions */
>  
>  #define PTE_AP(pte) \
>      (extract64(pte, 6, 2))
>  
> +/* Stage 1 VMSAv8-64 Table descriptor fields */
>  #define PTE_APTABLE(pte) \
>      (extract64(pte, 61, 2))
>  
> +#define PTE_NSTABLE(pte) \
> +    (extract64(pte, 63, 1))
> +
> +/* Access flag: defined for both Block/Page and Table descriptors. */
>  #define PTE_AF(pte) \
>      (extract64(pte, 10, 1))
> +
>  /*
>   * TODO: At the moment all transactions are considered as privileged (EL1)
>   * as IOMMU translation callback does not pass user/priv attributes.
> -- 
> 2.34.1
> 

