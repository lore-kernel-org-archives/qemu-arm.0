Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07131FEFB58
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Feb 2026 14:40:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvz0s-0004i5-O9; Fri, 27 Feb 2026 09:40:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1vvz0f-0004X8-Qt
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 09:40:11 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1vvz0b-00073j-Rd
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 09:40:04 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-48318d08ec2so54075e9.1
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 06:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772203200; x=1772808000; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ueeGORz1qHGSO37qrsNHxFeroIopIDdSyjZQXkLPTcc=;
 b=g+mH5BPtGWSdY9tWr07yux3FkMcj+0YISGkFujWwvWStA+AhRhvNX1yzcsdTq93lTi
 kJSLaoK6g48ROQKv/YjKvziBGK0Z6Bf+WS4RtelR+ggddB8ksbKPVLooU7dLxTg7uOkF
 9eUCNH8x9yB4BfXIwaXup7fZ/NslA6dOzuPQqRWR1JQUXxGW5LJADUtlLy35f5KwSc1/
 HCG+Lf2ZbHNFg/2lmk/GS4THxee+wkh3k+OOx2f5YFrTKnVZVtRApEfXiDZ6eQKKeyK2
 HwmY4qf9D78ed5MGdhrC4uFyaOFPSuj88k5AnhRLakCnL8iBaWEpm5T7YL7etoXGchp2
 oMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772203200; x=1772808000;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ueeGORz1qHGSO37qrsNHxFeroIopIDdSyjZQXkLPTcc=;
 b=T5YyRmszrnav313fS+/m+Gj6+xZTpdp74nL1Gldcp0On5mrDzJcEOAdpFqycgO/0xx
 YooIyWYhQpp9W1Z3i6wsjfLQgYMaqMultfy4uwXrCq0O+2jCCGVFbil2yLZ7VlfiKsgE
 PVrLGmQL2VdJIkVXC0WFp2D4haDSU2V3A7i3wpT3WSwyaLTS6TNQEtizSDqTp87qir6v
 1xeysMsUQHNdivilLXJG9nsb0zdh1j33DIOSuzfAuLCVokxY3I5kFHGBypks1aYoPc5z
 Qwz8FE0OOyfDLlI3nfpHIXPXvCAUybRr2SonnFgFDn5GUhk/GOqFvuiVRJCqTunU+wwq
 nW2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoAV3mrG32QnJROA96jSn5mIxJObKrLVLD+LDYd5YHjoioF9YYNeu5D420HVaWEZ6qo2vUyToLGw==@nongnu.org
X-Gm-Message-State: AOJu0YyUV/KiJ9mKa1O1ARb/DZ6/Vv9yZ8745Z6kys7SJpngmKKFKUO9
 +GRiionzfwWzET6u0VAZ34dKRAnIPGfTogVc/kHo3/UG/a4kkDk0U4fikpo1+rRdrQ==
X-Gm-Gg: ATEYQzwC61HWZXKR2d12PK0ZKFdYsgmorKK2dPQNyhvxAisEo+/o2UHNATKnJD43bkT
 V5chSsTH80uK2X2ttkKC+TIybMplLfDjV7H6oQNNFtO+5gH7G6iZuObbnNGEt4IHjm84fxQcryy
 fq/qhV9L9Rf0alc8ERwhn/ulCVfZWJwWR28QbNhmmJmgelSldinAqKzVKfEiEOUC3DI2uWYYttB
 MdcOjocU7NRCjPrxjkUz8EEDfVUSyBD4MK81l10JBLPVZQeddzb7j/bnDIUrtatXqB7FCnrDpLb
 4oQYvDy4LSy1WActEAw3RvOf0UawgzX5EIRRDE7rv6TooOAYjBKN5mM8HcF5a6exeKm3wBSSiSW
 dyODKapT4hv7lPVcDcUquyQVDBlEmdHAl9mw/ZcY8EoLVxMPfe6VHHBuyWQzUT1NYqK2FuUxITP
 Hgs5VMXXn3V/y+Wnwm/Jb21QlWlec9tuMCvUijM3mihYF2e0NASNnFhOr+70SlpbeQJbQoD5Irw
 jw=
X-Received: by 2002:a05:600c:500d:b0:477:86fd:fb48 with SMTP id
 5b1f17b1804b1-483c39f0306mr2062845e9.9.1772203199604; 
 Fri, 27 Feb 2026 06:39:59 -0800 (PST)
Received: from google.com (206.56.155.104.bc.googleusercontent.com.
 [104.155.56.206]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c76c714sm7803386f8f.39.2026.02.27.06.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 06:39:58 -0800 (PST)
Date: Fri, 27 Feb 2026 14:39:55 +0000
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
Subject: Re: [RFC v4 09/31] hw/arm/smmuv3: Enforce Secure stage 2 capability
 check when decoding STE
Message-ID: <aaGsu9u91KsDJMNm@google.com>
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221100250.2976287-10-tangtao1634@phytium.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260221100250.2976287-10-tangtao1634@phytium.com.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=smostafa@google.com; helo=mail-wm1-x334.google.com
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

On Sat, Feb 21, 2026 at 06:02:28PM +0800, Tao Tang wrote:
> When decoding a Stream Table Entry (STE) from the Secure stream table
> that enables stage-2 translation, verify that the SMMU implementation
> advertises Secure stage-2 support via S_IDR1.SEL2. If stage-2 is
> requested but S_IDR1.SEL2 is 0, mark the STE as ILLEGAL.
> 
> This implements the requirement from the Arm SMMUv3 architecture
> specification (IHI 0070G.b, Section 5.2, Page 218) that a Secure STE
> with stage-2 enabled is only valid when the implementation supports
> Secure stage-2 translation.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>  hw/arm/smmuv3.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 2192bec2368..d011357253e 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -623,6 +623,16 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>          if (ret) {
>              goto bad_ste;
>          }
> +
> +        /*
> +         * Stage 2 is implemented but Secure stage 2 is not supported while
> +         * STE is from Secure stream table. STE is ILLEGAL in this case
> +         * according to (IHI 0070G.b) 5.2 STE, Stream Table Entry, Page 218.
> +         */
> +        if ((cfg->sec_sid == SMMU_SEC_SID_S) &&
> +            !(FIELD_EX32(s->bank[SMMU_SEC_SID_S].idr[1], S_IDR1, SEL2))) {
> +            goto bad_ste;
> +        }
The IDR is not currently set, we can just safely return bad_ste for
“SMMU_SEC_SID_S”, no need to complicate things until SEL2 is supported.

Thanks,
Mostafa

>      }
>  
>      /* Multiple context descriptors require SubstreamID support */
> -- 
> 2.34.1
> 

