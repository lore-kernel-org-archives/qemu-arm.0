Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D1E606A20B
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Nov 2026 16:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=F5yfKB+T
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQooH-0003oJ-LC; Tue, 10 Nov 2026 11:35:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1xQooF-0003nb-3Q
 for qemu-arm@nongnu.org; Tue, 10 Nov 2026 11:34:59 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1xQooD-0005tj-Em
 for qemu-arm@nongnu.org; Tue, 10 Nov 2026 11:34:58 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a3517554f7so23625815e9.2
 for <qemu-arm@nongnu.org>; Tue, 10 Nov 2026 08:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794328495; x=1794933295; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=O4VqeB37CpQ42k1egu7OtnYs9i15ePxXbF8O9zUkyis=;
 b=F5yfKB+TsKYofrYgPJVsVYZIoedcOFNW8BZ9Y51CAwizlsD1iuz6J8WtiYAmvY/DTZ
 TEGPwKAatM/dSnP9mTQUXchvqtQYy2LboOQCSU+le6J/0mYah5cV0DprSxFGrCGIuL7D
 Hl0HHC8AO52qSW1nOwyCZyadiBLqUU20dRZRR03ZGr6hWYilb51/xF+5RPX0TvYYaL7u
 o6U3TgAIuHgRtnIXmYaK7inBkFJMAMx/RjQsDKIupV6SvHvvolF/xDphLu4DmP92Oln9
 C8NODOdaULWXEJuuSRY/WKeHvRByEDulL56/x8Pro103X5jV3nqVnaBt6XYyT5tHycZC
 JjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794328495; x=1794933295;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=O4VqeB37CpQ42k1egu7OtnYs9i15ePxXbF8O9zUkyis=;
 b=IkAFHlx7G+97nyE11ImYfhvt28nmHFi4kTvxARBTSVIW/DjRwDzkY8D+abyEHEvcrv
 zmJCrJ8lRDwh7TFZkfzzpEYduiY8wm9ArAQlO+r+wlr3PXVbp6t8+EJG43MiRm19iAo4
 OMx9Mrb6V97/bFr2eawZodIlYcD+YE3d8sclxTRmFVM2ZSYEoiEQQgodn93NZepitc+V
 wu6yMHJMZpseUck59o8Q4mFUyfRGd1AHaDeIyNWthkE+GIQtBOCHXRCfXv3bm5//JvDK
 Z+i/TMtJkNwn+eZhbo9EsbXSXRbaw6+7npfn8n2J0qx/tZEXirB+1l986mJwE+urzv8c
 y5Hw==
X-Gm-Message-State: APuU4Z9tLLODrU+YoEUydCHidSedaxfOKwD8kc/B3EEgCaNuzlocc6YQ
 YfqR/ezDS07xlAVnCVkDGSEzyS2DDScWv2gUSTRDm5tg/zGrPL9Bys6wj4isbXzdxrw=
X-Gm-Gg: AYBFou0eT4hnirVmUXNxilVtCjgWt8C/mmjT820FidT+OL45XCrmHZpzXxM3eaBoyeW
 d+fXgLnKm3DgYjFm3onfYUrsDviON4DDZNf4rZ4vk0o/hg1NjGAajeF6efXOE6rTG9KETkITuEe
 hq98cYZFikUCwrC4kdLjX73HnfymiE/5509lPjUXrLWBs+HCPbB+ohCmDAFYBdouEx50ECLg1Cy
 9mNH5PEMgveinN2YwOtBXMgTcBzzk1t2dCrvBvVPNU9F53yCJpPpNF6HKWNkzSBuVJbCrvOklUd
 Fz4uon73iA2BhSZa5g4pwNgEM9gCPKM/u4uR83V84VT4XkOxM5h1al53yy9aOZSoMUdk/B3rjjg
 raCcK4Z+1RDPKX+VSygTmgTy5TgMX1KIqJSUazQGkCGBVluxjQriNh0u9llnygFZGRET+rsAF29
 EV4gWj/79LZdCc+QLecYXwW3dOorGmSbENjWLXM0yj/FMaEM/Zv5ofdVGGW+hyGweOIRfc5CeMw
 kZb6g2OXqITO1OfLdk6k0ugbslqkzQdkq+1x3J2IEDv0EosauzrUB8KvfjWtIaA3VkfIzv2o1Q5
 VusOrsgxO0zg9NriyGzVbYDDTs06Xemf
X-Received: by 2002:a05:600c:46d2:b0:4a3:5aee:2c25 with SMTP id
 5b1f17b1804b1-4ba02355f3emr49365415e9.31.1794328494968; 
 Tue, 10 Nov 2026 08:34:54 -0800 (PST)
Received: from linaro.org ([2a10:d582:31e:0:aa96:7f3b:af27:16e8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498369a4238sm6141492f8f.54.2026.11.10.08.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 08:34:53 -0800 (PST)
Date: Tue, 10 Nov 2026 16:34:51 +0000
From: Jim MacArthur <jim.macarthur@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH for-11.2 2/4] hw/intc/arm_gicv5: Free memory in finalize
Message-ID: <avNHq9ukmSPmqPXW@linaro.org>
References: <20261103172616.2400758-1-peter.maydell@linaro.org>
 <20261103172616.2400758-3-peter.maydell@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103172616.2400758-3-peter.maydell@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 05:26:14PM +0000, Peter Maydell wrote:
> The GICv5 allocates memory and creates hashtables during realize and
> as part of its operation.  Free those resources in finalize.
> 
> Since the GICv5 is created at QEMU startup and remains in existence
> for the lifetime of the process, this isn't an in-practice leak,
> only a theoretical one.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv5.c        | 11 +++++++++++
>  hw/intc/arm_gicv5_common.c |  3 +++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
> index d0a8574916b..fd6456cd8aa 100644
> --- a/hw/intc/arm_gicv5.c
> +++ b/hw/intc/arm_gicv5.c
> @@ -1970,6 +1970,17 @@ static void gicv5_init(Object *obj)
>  
>  static void gicv5_finalize(Object *obj)
>  {
> +    GICv5 *s = ARM_GICV5(obj);
> +
> +    for (int i = 0; i < NUM_GICV5_DOMAINS; i++) {
> +        GHashTable *ht = s->phys_lpi_config[i].lpi_cache;
> +
> +        if (ht) {
> +            g_hash_table_destroy(ht);
> +        }
> +
> +        g_free(s->hppi[i]);
> +    }
>  }
>  
>  static void gicv5_class_init(ObjectClass *oc, const void *data)
> diff --git a/hw/intc/arm_gicv5_common.c b/hw/intc/arm_gicv5_common.c
> index 2920b11cc39..cfadfee4f05 100644
> --- a/hw/intc/arm_gicv5_common.c
> +++ b/hw/intc/arm_gicv5_common.c
> @@ -112,6 +112,9 @@ static void gicv5_common_init(Object *obj)
>  
>  static void gicv5_common_finalize(Object *obj)
>  {
> +    GICv5Common *cs = ARM_GICV5_COMMON(obj);
> +
> +    g_free(cs->spi);
>  }
>  

Reviewed-by: Jim MacArthur <jim.macarthur@linaro.org>


