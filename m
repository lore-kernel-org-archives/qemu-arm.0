Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2142FC83F03
	for <qemu-arm@archiver.kernel.org>; Wed,  9 Jul 2025 15:52:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZX5L-0008HB-Ah; Wed, 09 Jul 2025 11:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uZX0z-0004Wh-78
 for qemu-arm@nongnu.org; Wed, 09 Jul 2025 11:47:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uZX0x-00043o-Au
 for qemu-arm@nongnu.org; Wed, 09 Jul 2025 11:47:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752076037;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HP21awq+TtEC7SuksenmV4h/ixKkxjFyFP0jA7q713E=;
 b=HC7JnsBxxB4U/W9nX/Z7W1qFGZCfv9YM7TMKhqatzo/wC0BFteJn1h8D309O8X9hhyy2PY
 TcVf3w3uwR98wJZFvf4LL4lpuutCCQLuZtF9t9ndzhXwa8pBft29xmxo/is3nOJK9gx1YP
 Hg/lT/MCDwCyo89hrRmj+WGV5zNGl1M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-TdQD4esvOm-lGMDxw5L8TQ-1; Wed, 09 Jul 2025 11:47:16 -0400
X-MC-Unique: TdQD4esvOm-lGMDxw5L8TQ-1
X-Mimecast-MFC-AGG-ID: TdQD4esvOm-lGMDxw5L8TQ_1752076035
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-454d910ea8dso4418415e9.3
 for <qemu-arm@nongnu.org>; Wed, 09 Jul 2025 08:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752076034; x=1752680834;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HP21awq+TtEC7SuksenmV4h/ixKkxjFyFP0jA7q713E=;
 b=ShwStmdwB8WWbi/ESCvsBZGFiGpsejr0cE65n51LD0m3UskWyn4LPj4RXBRizMh7jD
 RncTBjuH52oot6Fq9wT52SD3MZlAc+i0iu3fLCAehQj33ZOgdiNYTGCB+w1IO0atTzEK
 TDPD4DSULwtMH1WINWkG0pw/2Upa+33J2KC+NucilDPACKf8jCkAvaoBnTI22seOppse
 Pk8dblQEhRTOrNaGu7N41bHkrX/WFGX7WIPeaNFrfk6/7oUrtYI8INaUttOscLlJUtaY
 HgM6lWtjlcbpry/o+yT6R/qFc7gn4ZqkOccONZa7pY3WUsKsA8pmv2uvk66bv1o6LLvX
 tu9g==
X-Gm-Message-State: AOJu0Yzy4cEcbOyoFmDZTjNy872ZKyM5CJdlvILvvjZ8nGV7ZWeRomP4
 ium9PHXXtjwHv8Ta+kOrhoICHGKYnMVvQJ04I3q8QCGAu4ErXi5JRXxPMdN0MV03+evq41GiKKG
 PKhKzh4HpEXOGSukfaj3sohuxXyKTzlIVfGN3ZZbrsWCB4h7zZEdAoqZRQnXDjg==
X-Gm-Gg: ASbGncvfi1uiGYHxd+lEUmVxe1PLEv5nwB1ucAvQ83o/kfOZ7TfJaiEwK4pT44CSiHI
 /TCE6uhfE9g//11/OfdnmIEeNnE6oh39sLIQxuaWGEQR28hy3WBlETL9OwhnVP3NSizedgdgORL
 6mvjws8s2rluDnrrc607iuH7ZXKI+rLUSF7DjfFvCBt3dD+8eCVVBtvcin4PWSbSZ4IExxJbRue
 1wDTjEmXvKnbhEFSDKUFXzsmpIw++4f6ppzRPiEcwqV4dhzH7lvp3EVN6cWlRTxuxKRQEm15UDV
 Hl5ROWgbZd4mK8yrP1zwbVqc22TIbK5P4FnDyRdFHpeIfqNb73JXVgMj/xnlyuZXPXVUsg==
X-Received: by 2002:a05:600c:1988:b0:450:cd25:e68f with SMTP id
 5b1f17b1804b1-454d5384f3dmr30767195e9.27.1752076034355; 
 Wed, 09 Jul 2025 08:47:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2bpU8X6ofz4fcR4oWNeGY+3x3WsQDXQ461cTPmfSbFX+gH5QJ9Cv+SA1s2NzEsq9vYAXJgw==
X-Received: by 2002:a05:600c:1988:b0:450:cd25:e68f with SMTP id
 5b1f17b1804b1-454d5384f3dmr30766835e9.27.1752076033934; 
 Wed, 09 Jul 2025 08:47:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cdb31d21sm51556175e9.1.2025.07.09.08.47.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jul 2025 08:47:13 -0700 (PDT)
Message-ID: <13bc4f63-f6be-4746-852a-6ac96253d1da@redhat.com>
Date: Wed, 9 Jul 2025 17:47:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm/cpu: fix trailing ',' for SET_IDREG
To: Cornelia Huck <cohuck@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Sebastian Ott <sebott@redhat.com>
References: <20250704141927.38963-1-cohuck@redhat.com>
 <20250704141927.38963-4-cohuck@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250704141927.38963-4-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PfLoNtr-UCqO-4bj3A1Fthp5WX4vFUQO8v3Q1hzYnB4_1752076035
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 7/4/25 4:19 PM, Cornelia Huck wrote:
> While a trailing comma is not broken for SET_IDREG invocations, it
> does look odd; use a semicolon instead.
>
> Fixes: f1fd81291c91 ("arm/cpu: Store aa64mmfr0-3 into the idregs array")
> Fixes: def3f1c1026a ("arm/cpu: Store aa64dfr0/1 into the idregs array")
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  target/arm/tcg/cpu64.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> index 00e12ed44ae8..d2f743fb3913 100644
> --- a/target/arm/tcg/cpu64.c
> +++ b/target/arm/tcg/cpu64.c
> @@ -352,7 +352,7 @@ static void aarch64_a76_initfn(Object *obj)
>      cpu->clidr = 0x82000023;
>      cpu->ctr = 0x8444C004;
>      cpu->dcz_blocksize = 4;
> -    SET_IDREG(isar, ID_AA64DFR0, 0x0000000010305408ull),
> +    SET_IDREG(isar, ID_AA64DFR0, 0x0000000010305408ull);
>      SET_IDREG(isar, ID_AA64ISAR0, 0x0000100010211120ull);
>      SET_IDREG(isar, ID_AA64ISAR1, 0x0000000000100001ull);
>      SET_IDREG(isar, ID_AA64MMFR0, 0x0000000000101122ull);
> @@ -426,8 +426,8 @@ static void aarch64_a64fx_initfn(Object *obj)
>      cpu->reset_sctlr = 0x30000180;
>      SET_IDREG(isar, ID_AA64PFR0, 0x0000000101111111); /* No RAS Extensions */
>      SET_IDREG(isar, ID_AA64PFR1, 0x0000000000000000);
> -    SET_IDREG(isar, ID_AA64DFR0, 0x0000000010305408),
> -    SET_IDREG(isar, ID_AA64DFR1, 0x0000000000000000),
> +    SET_IDREG(isar, ID_AA64DFR0, 0x0000000010305408);
> +    SET_IDREG(isar, ID_AA64DFR1, 0x0000000000000000);
>      SET_IDREG(isar, ID_AA64AFR0, 0x0000000000000000);
>      SET_IDREG(isar, ID_AA64AFR1, 0x0000000000000000);
>      SET_IDREG(isar, ID_AA64MMFR0, 0x0000000000001122);
> @@ -678,13 +678,13 @@ static void aarch64_neoverse_v1_initfn(Object *obj)
>      cpu->dcz_blocksize = 4;
>      SET_IDREG(isar, ID_AA64AFR0, 0x00000000);
>      SET_IDREG(isar, ID_AA64AFR1, 0x00000000);
> -    SET_IDREG(isar, ID_AA64DFR0, 0x000001f210305519ull),
> -    SET_IDREG(isar, ID_AA64DFR1, 0x00000000),
> +    SET_IDREG(isar, ID_AA64DFR0, 0x000001f210305519ull);
> +    SET_IDREG(isar, ID_AA64DFR1, 0x00000000);
>      SET_IDREG(isar, ID_AA64ISAR0, 0x1011111110212120ull); /* with FEAT_RNG */
>      SET_IDREG(isar, ID_AA64ISAR1, 0x0011000001211032ull);
>      SET_IDREG(isar, ID_AA64MMFR0, 0x0000000000101125ull);
> -    SET_IDREG(isar, ID_AA64MMFR1, 0x0000000010212122ull),
> -    SET_IDREG(isar, ID_AA64MMFR2, 0x0220011102101011ull),
> +    SET_IDREG(isar, ID_AA64MMFR1, 0x0000000010212122ull);
> +    SET_IDREG(isar, ID_AA64MMFR2, 0x0220011102101011ull);
>      SET_IDREG(isar, ID_AA64PFR0, 0x1101110120111112ull); /* GIC filled in later */
>      SET_IDREG(isar, ID_AA64PFR1, 0x0000000000000020ull);
>      SET_IDREG(isar, ID_AFR0, 0x00000000);


