Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E09CC61DE2
	for <qemu-arm@archiver.kernel.org>; Mon, 31 Aug 2026 08:54:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x0xmX-0004tm-C8; Mon, 31 Aug 2026 04:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x0xmW-0004tQ-8m
 for qemu-arm@nongnu.org; Mon, 31 Aug 2026 04:54:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x0xmU-0000GI-Ty
 for qemu-arm@nongnu.org; Mon, 31 Aug 2026 04:54:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788166457;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ypHefSVLWO2Yy9zA2OvHe8f0RiTMYJbPgnjt9FHvuU=;
 b=XYxUm8gPv0s0hziACXjh1DhdB3hOHxjj8i0Q2cw3+ZSoam+a0En4Q+YBnwm1ouxkP5ejq4
 10VJHpJdt64Ls549LVhp2Q9MvgD9c83qT22AnYQpSFGfIzTzHvWPOVhQhw0SmiieO/CQI5
 OzZNp+df7JQRrl+sdssZZMrNp+djojo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-qN9uuY7FOpWDa-UgZzwydQ-1; Mon, 31 Aug 2026 04:54:15 -0400
X-MC-Unique: qN9uuY7FOpWDa-UgZzwydQ-1
X-Mimecast-MFC-AGG-ID: qN9uuY7FOpWDa-UgZzwydQ_1788166455
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-4843d9ab895so534314f8f.0
 for <qemu-arm@nongnu.org>; Mon, 31 Aug 2026 01:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788166454; x=1788771254;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6ypHefSVLWO2Yy9zA2OvHe8f0RiTMYJbPgnjt9FHvuU=;
 b=oZYckfmX6yDp85N1XD/ZpzE9LfDCsTQLJ+gXFdFSDKXV8A9s9jBckgkxb3LmTsZP+Y
 El3jztcU9NjwbPYAvQM1cKt6mQASjkFdw6rC1jxidm6Q/qH/JoFZGZqST+eZJ5CVy2ku
 VG6pSmOwUdBg9IWIUeqhJ82ZZEbD2xbYHuc9Eqv/qyk9cYX7fcLDxB4rCVFLlL9hzNfk
 aumEYppy/U92YuHZjvu0zDZN98+rZSebBGW0GXcKHm6LsuN3ewKASNGSU9o2CrwbAD5V
 c617Et3IeH6dmBqQkvvYR9fx4UjASJGE+eOYEbwQZgPayZVJOfY0zxIwBqB+qfSVXI8+
 Ke3Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBz4Y6qpj+GAOlnMLjZvF30AZPKlPJjVxGLxesiMtG7oKuZlHlQqZeH/eM6RGvPEyx5roiglPZe3sg==@nongnu.org
X-Gm-Message-State: AFuF++k2pnvrCEG2C7L+m2YZNyOy2SSmqLWzu54olE3bHIT48n42m+Q7
 59h9yy+OAHzq3EpqKHudnzKfeZNxkIuLvKAEMVn/9j8sw7waoOEKD5o9euK9UVQaIT/55cczahq
 wDxnJy/lfrap6YWsmrVb1lKs/h7HWwk6aeFmpyEUg+kt1hGNV6vmShA==
X-Gm-Gg: AYBFou0NkUZ9EV1JWMhq3yOr3GuwazDsjrMXmHyAUlHnZ1h5MEh7jkjQZvPlzl2sQqc
 cxWAykOF6ZO9p1papSR+WBtxpRjibn27gj0ssyUDvyFwUDrqCwASarjUs0LbW7SLonjyss2p7ij
 MQ7Gz2nqUjNFcu51wfBf8XhslIQG510MePxADqwGpKtkimUngdbmqXsFigPMvZZuh8byjUnH2zK
 c6NTOKsTs/tCqjbzw3n+9rwYQ7e7M9VlWyrnHovd6jUhBhVKhErQY13xpiN6X18RuyvRjw0Kz/0
 Tj26hoXllq8lWZhUZR2cMKQt50fRVO3Y3HQYtOC7PPz0ZzzMvG7PFbRc2PmSvL8WFxxU925d8Pl
 BH3g1qaHR0iNGoONgvAFKI0Uumb9rfSszPR9YNEMrMmn0IEVo
X-Received: by 2002:a05:6000:4819:b0:47f:96e3:530e with SMTP id
 ffacd0b85a97d-4843c7bc7ffmr6416560f8f.8.1788166454533; 
 Mon, 31 Aug 2026 01:54:14 -0700 (PDT)
X-Received: by 2002:a05:6000:4819:b0:47f:96e3:530e with SMTP id
 ffacd0b85a97d-4843c7bc7ffmr6416493f8f.8.1788166454153; 
 Mon, 31 Aug 2026 01:54:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbb2794dsm22217997f8f.25.2026.08.31.01.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2026 01:54:13 -0700 (PDT)
Message-ID: <a328d6e7-fa27-4279-b0da-bd68cf73e207@redhat.com>
Date: Mon, 31 Aug 2026 10:54:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 28/28] [NOT-MERGE] hw/arm/smmuv3: temporarily enable SEL2
 bit and some other features
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu@processmission.com>,
 Jim MacArthur <jim.macarthur@linaro.org>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162644.2810021-2-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260813162644.2810021-2-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NzEqx97VLpuKasgvocVswy_3IiU9o7P0OUUJoUOm3ho_1788166455
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Tao,

On 8/13/26 6:26 PM, Tao Tang wrote:
> Temporarily:
> - enable S_IDR1.SEL2,
> - change AIDR to 0x2 to indicate SMMUv3.2,
> - use smaller SID size and Cmd/Evt queue size.
Each of those changes shall be carefully justified. 

Weren't there any assumpion in previous patches that we supported 3.2.
tbh I did not notice you changed it in the last patch. wrt that change
we would need to be careful the 3.2 does not require us to implement new
features besides secure stuff.

Thanks

Eric
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>  hw/arm/smmuv3.c                | 3 ++-
>  include/hw/arm/smmuv3-common.h | 6 +++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 8e1de94fd17..19e080b6d25 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -350,6 +350,7 @@ static void smmuv3_init_id_regs(SMMUv3State *s)
>                                 SMMU_IDR1_SIDSIZE);
>      sbank->idr[1] = FIELD_DP32(sbank->idr[1], S_IDR1, SECURE_IMPL,
>                                 s->secure_impl == ON_OFF_AUTO_ON);
> +    sbank->idr[1] = FIELD_DP32(sbank->idr[1], S_IDR1, SEL2, 1);
>      smmuv3_accel_idr_override(s);
>  }
>  
> @@ -400,7 +401,7 @@ static void smmuv3_reset(SMMUv3State *s)
>      sbank->gerrorn = 0;
>      sbank->gbpa = SMMU_GBPA_RESET_VAL;
>  
> -    s->aidr = 0x1;
> +    s->aidr = 0x2; /* SMMUv3.2 */
>      s->statusr = 0;
>  }
>  
> diff --git a/include/hw/arm/smmuv3-common.h b/include/hw/arm/smmuv3-common.h
> index ec442a85586..1afaece3df7 100644
> --- a/include/hw/arm/smmuv3-common.h
> +++ b/include/hw/arm/smmuv3-common.h
> @@ -311,9 +311,9 @@ REG32(IDR1,                0x4)
>      FIELD(IDR1, TABLES_PRESET, 30, 1)
>      FIELD(IDR1, ECMDQ,        31, 1)
>  
> -#define SMMU_IDR1_SIDSIZE 16
> -#define SMMU_CMDQS   19
> -#define SMMU_EVENTQS 19
> +#define SMMU_IDR1_SIDSIZE 6
> +#define SMMU_CMDQS   10
> +#define SMMU_EVENTQS 10
>  
>  REG32(IDR2,                0x8)
>       FIELD(IDR2, BA_VATOS, 0, 10)


