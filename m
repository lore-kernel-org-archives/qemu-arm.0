Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0C7C61DD3
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 14:01:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1P3D-0000ri-5W; Tue, 01 Sep 2026 10:01:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1x1P39-0000qo-Gi
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 10:01:19 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1x1P32-0003zq-MO
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 10:01:14 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4996e2575dbso55805e9.0
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 07:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1788271271; x=1788876071; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=IJmCYHpIBIuHNDmQQer1TWt7CH9bYiWDHysJqGNW7C4=;
 b=A0WMRa3ZiB7mzeA6hdMZjJZReaRzXDVDRYPbwX32UdN73cok/B7JFLJr+Qfz1OZvca
 12koqR6/4PJS0Pz4IRT0n0TkxCpP3YBXv89Q+hbMovNG6f8aZvo7f/7FEFbiZfB7vEpO
 5MGYBXGeXTq9k2l8e61yuMhspPlJQwCZAvcXBGQTb8hfJFwJ1IONh6+Y8kbR/Uhgkatc
 hzVGqTGY7VUG0RHPt722ciUc10xeCBxAFLf2OiOSd6N8HwM6XWqRI9VcfpsFeWUBdHjt
 /x3X9BNQpYRjDPNIDurQIMOxX04gxyQMyd/56Psi4JBMdX3e+euN9apu1k4Z+k8JAh7U
 b3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788271271; x=1788876071;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=IJmCYHpIBIuHNDmQQer1TWt7CH9bYiWDHysJqGNW7C4=;
 b=ObnHasIqrlekNBKbQUuvkNZsTP/730AlPBFNn+9PwCR1XxckWfrcbUeWgtP1xnVswD
 ADdZgpUbtSMz8pc3DBzA3m2CWelVdvS15p2h3Ve50364Cqd/JIqJABTM0DGrsRle4ti4
 c4xQdALKn1UFDHa4IVLk25XomgU01BUjNDuwPaqfb6tcNMz+WD8eiTNB/Iu7MQs3efkv
 +4Q5Ybt361b11hFbCzNphSsxawe/xBG99+V8XpZw/oVSnor16Rug1YJ7JAeIYu6XuEzq
 umKduv6FQDBBon67qylntjeRfXtmUina5U4NkbqNDC3o/VHS3vwI/T4JQCIZcK/uAQl9
 yxLQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr4QWeBrWQq4dcDp3BDAFfcuFiBMnzH+IWFlprXTSnMjecl9Ci3IBKMmOUJVaDO4JJhBOLDeqafdg==@nongnu.org
X-Gm-Message-State: AFuF++kY1Fqmiaons0gCz18JO2hH944CCByAD47wXBsVT8chBEdMelyl
 5qzdd9BZ2Zmi9TYm/Ssk2op2U1kc48H8Vgjn/hPq/FBuAAhyrIIDb3r301JjoGmn4Q==
X-Gm-Gg: AR+sD11UkRCbcRg0MltRIiZgrKKEDHMuoN2L5oP6P/9xyXT5jeP4XwfEP4yrY9ds1/0
 jLr7VvFTFlHQh9FFYkXRU0ZXErEPPNBYFdHjxs2PkoEC6nLmxgM/9Fqug7PB3dwy3rEtVX4tUfo
 WlhnUL1T0rFHVYUlPF7cru0F+0hH4UXWEzG7dvwmCJbicTolKzD8AM+JdtbuTgSrUewUAjNoCP4
 LJrXT8TknTCuaX00wdIVnGDSQ7Qzln9rjea2+BzYNtXW+TWrZsuvzRIrCnIOVUv1RzuEbqx/HlL
 Wgo7lJWdHqrGRIGAdLVrkwFdyyxMnfH2KYycFYyVycTeOF37FWmktbMjiH6nkeNugLurvDfSd1o
 UYw20WM2PFNc9otIZWQ3QdQRxwC5PERXk1OTPjtQkkSzInERvHowhVSzd3EI+cYFSLg2HqtaWkY
 gzLqSC6otFl2yEno5OQywyX8Wo4p8SGoOgsa2CIAG0Md4ST2dPlajSngwKHJzfiZavBJzezbsAh
 a1dBZnW93xl92ox/BbtvTYyLrw/lQ==
X-Received: by 2002:a05:600c:8a09:20b0:499:cb15:4511 with SMTP id
 5b1f17b1804b1-49cdd269ad3mr705285e9.8.1788271269221; 
 Tue, 01 Sep 2026 07:01:09 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com.
 [35.189.192.250]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce0d22dsm69399515e9.4.2026.09.01.07.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 07:01:07 -0700 (PDT)
Date: Tue, 1 Sep 2026 14:01:01 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Tao Tang <tangtao1634@phytium.com.cn>
Cc: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@mailo.com>,
 Chao Liu <chao.liu@processmission.com>,
 Jim MacArthur <jim.macarthur@linaro.org>
Subject: Re: [RFC v5 07/28] hw/arm/smmuv3: Reject secure STEs with stage-2
 enabled
Message-ID: <apbanfZIyTlA5fvk@google.com>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162446.2806393-2-tangtao1634@phytium.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260813162446.2806393-2-tangtao1634@phytium.com.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=smostafa@google.com; helo=mail-wm1-x335.google.com
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

On Fri, Aug 14, 2026 at 12:24:43AM +0800, Tao Tang wrote:
> Pass sec_sid into decode_ste() and treat a secure STE that enables stage-2
> translation as an illegal STE.
> 
> The current model does not implement Secure stage-2 translation, so reject
> Secure STE configurations that enable stage 2 and report BAD_STE. This
> restriction can be relaxed when SEL2 and Secure stage-2 support are
> implemented.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>  hw/arm/smmuv3.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index b5dc67dcb01..3ff2f498a3b 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -597,7 +597,7 @@ static void decode_ste_config(SMMUTransCfg *cfg, uint32_t config)
>  
>  /* Returns < 0 in case of invalid STE, 0 otherwise */
>  static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
> -                      STE *ste, SMMUEventInfo *event)
> +                      STE *ste, SMMUEventInfo *event, SMMUSecSID sec_sid)
>  {
>      uint32_t config;
>      /* OAS field only presents on NS-IDR5 so we use hardcoded SMMU_SEC_SID_NS */
> @@ -651,6 +651,14 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>          if (ret) {
>              goto bad_ste;
>          }
> +
> +        /*
> +         * It is ILLEGAL to set STE.Config == 0b11x according to (IHI 0070G.b)
> +         * 5.2 STE, Stream Table Entry, Page 218.
> +         */

This is not the latest spec, and there is no need to mention the page.
It might be more clear to mention that Qemu doesn’t support secure
stage-2 rather than say it is ILLEGAL.

Thanks,
Mostafa

> +        if (sec_sid == SMMU_SEC_SID_S) {
> +            goto bad_ste;
> +        }
>      }
>  
>      /* Multiple context descriptors require SubstreamID support */
> @@ -916,7 +924,7 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
>          return ret;
>      }
>  
> -    ret = decode_ste(s, cfg, &ste, event);
> +    ret = decode_ste(s, cfg, &ste, event, sec_sid);
>      if (ret) {
>          return ret;
>      }
> -- 
> 2.34.1
> 

