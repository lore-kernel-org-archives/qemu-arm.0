Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AD1CCF2F2
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Jan 2026 12:22:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vhoGM-0005cg-Nw; Mon, 19 Jan 2026 07:21:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vhoGL-0005cR-Dq
 for qemu-arm@nongnu.org; Mon, 19 Jan 2026 07:21:41 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vhoGJ-00038u-By
 for qemu-arm@nongnu.org; Mon, 19 Jan 2026 07:21:41 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47ee807a4c5so30897985e9.2
 for <qemu-arm@nongnu.org>; Mon, 19 Jan 2026 04:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768825296; x=1769430096; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kV71xEhQHf/cZb4fuDtl4xSNy/zYzrpI8vgqn6T1PzE=;
 b=kJF9onYLIOzJ3lxqqkRGtL//XmkAfxHycVR2IjsVTasnCRGEVipcb5NU4sDpA1FEzn
 Czjd17QlUr0JsXiL/dGKuhM2im5yv8ORRPgODpX2zL4UAwiy2XNA53YJ3NWMiKw2EaM+
 ZgcFuPi1ZU61dbNY53NX/qXJpSagPqoG4O8PGzJP6IdyUwYytnQTzSZ8i4pTfp04pDrd
 jfmpz84137PTXmMfvjZRepY13uL6fbCvrrTHsuRAyBXWNnkGZhT9w/6IIKP9PovbtvFy
 S1JqUEkX0Q8YdsVNMj0s5SnSUlSFmyYSUi57fAbkVr2i1Nzfsg6tAdjkg2NEyZLy/aHw
 Kgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768825296; x=1769430096;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kV71xEhQHf/cZb4fuDtl4xSNy/zYzrpI8vgqn6T1PzE=;
 b=YrG18Ktlew9XIr1gbPehTooRzQ1YyX+1E/bkiogLhwBVaHen5zbXnnwoPW7rY3/FXe
 /9cyyJ99ds8jVjkw0VD6wvILybXIfyBjONQqmtCuMnAgCyolKlVmu6hudVArc6t24v02
 d7UJXIK4YN1iK0xzVsU3qV0svLDY5YKlviPoPFOcYVyLqeWsOBD3eC7KwuFcaECsiFvx
 xzKbIF1ANV2jNuO4F+6hP6K2IodPL97O1VExqOVXwvtpxTmPVZ7djJLSpJgo2JCUykwG
 AJ6SN7mbRhNydVQ+5raNKkcVWZRVM6/ME38UlyHhIelpmSy6/g/vRoTGByH0X1eYjFpO
 aIFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCXnGy5Gh7j5FoDsXK9C+F7nSZXQG2POgxNfNaAfiR18gheQXHagEadgOqLJVlQ6OyPfAXcERXSg==@nongnu.org
X-Gm-Message-State: AOJu0YwxSCuMuZBq/PG05NemQrA6VRJ/iq2GJy3IY47NWGoXhng2PpPJ
 AH4imj0InVzilIuUlN5DNVwYcXLdywgdMP/nfVhxkS0Gg3gF2IsNx8irLG25FuybypIeOz34HDt
 5MmvPx6o=
X-Gm-Gg: AY/fxX7UEjSiSqbElOl77qrxgQScz1xjJsC+JBru9tLscMFY0ttiS8jH8QwY5ByWlqP
 UOuFDDbled1i6djb/wOp43UMgmic+2KoqInwk9RRUTpiNAp7j0KNWAgVbOjQdr0iGueaqU8Qulf
 rSjMoMv4ALcxIsHy60QI/l41kb8JJ8+SvZymNTRLjseQ6/ERl95nb1w1kn+1ImjdofeSlJAfnYs
 KteUbZVfHTh/ffxfrMNvyQDj2Qn97RvkWorXMEN/uo+pPcOJYX1i5NAZ/GHLSbwe69MoiXDwpUK
 MgJLP0168kNPQ8m4EIyrX+Dyahgnsbb2jaEw8Gntp9G08YBYTitiR3AoTUAoDGdG6kxStONsioh
 GdbGFwOaIQLsNqUJMe8Sn8HKxkfMquID10W8Yekm0rfbVMdihpt37PmEvDapT0QecyqawlEwvKU
 9NsW+liEYQOOpAUhcL1qENXBxvvosljFzja3G/erugNpBtrGatwy8qRQ==
X-Received: by 2002:a05:600c:6206:b0:47a:9560:5944 with SMTP id
 5b1f17b1804b1-4801eb14c40mr133063625e9.34.1768825295896; 
 Mon, 19 Jan 2026 04:21:35 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801e8c0499sm195008685e9.9.2026.01.19.04.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 04:21:35 -0800 (PST)
Message-ID: <2d379a95-d3ec-4f6b-8b21-188540656019@linaro.org>
Date: Mon, 19 Jan 2026 13:21:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] hw/intc: avoid byte swap fiddling in gicv3 its path
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM cores" <qemu-arm@nongnu.org>
References: <20260119120030.2593993-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260119120030.2593993-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 19/1/26 13:00, Alex Bennée wrote:
> The GIC should always be a little-endian device as big-endian
> behaviour is a function of the current CPU configuration not the
> system as a whole. This allows us to keep the MSI data in plain host
> order rather then potentially truncating with multiple byte swaps of
> different sizes.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/intc/arm_gicv3_its_common.c | 4 ++--
>   hw/intc/arm_gicv3_its_kvm.c    | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
> index e946e3fb87b..60a5abd8d3e 100644
> --- a/hw/intc/arm_gicv3_its_common.c
> +++ b/hw/intc/arm_gicv3_its_common.c
> @@ -81,7 +81,7 @@ static MemTxResult gicv3_its_trans_write(void *opaque, hwaddr offset,
>       if (offset == 0x0040 && ((size == 2) || (size == 4))) {
>           GICv3ITSState *s = ARM_GICV3_ITS_COMMON(opaque);
>           GICv3ITSCommonClass *c = ARM_GICV3_ITS_COMMON_GET_CLASS(s);
> -        int ret = c->send_msi(s, le64_to_cpu(value), attrs.requester_id);
> +        int ret = c->send_msi(s, value, attrs.requester_id);
>   
>           if (ret <= 0) {
>               qemu_log_mask(LOG_GUEST_ERROR,
> @@ -97,7 +97,7 @@ static MemTxResult gicv3_its_trans_write(void *opaque, hwaddr offset,
>   static const MemoryRegionOps gicv3_its_trans_ops = {
>       .read_with_attrs = gicv3_its_trans_read,
>       .write_with_attrs = gicv3_its_trans_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
>   };
>   
>   void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops,
> diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
> index ae12d41eee1..a8d6d4fb540 100644
> --- a/hw/intc/arm_gicv3_its_kvm.c
> +++ b/hw/intc/arm_gicv3_its_kvm.c
> @@ -58,7 +58,7 @@ static int kvm_its_send_msi(GICv3ITSState *s, uint32_t value, uint16_t devid)
>   
>       msi.address_lo = extract64(s->gits_translater_gpa, 0, 32);
>       msi.address_hi = extract64(s->gits_translater_gpa, 32, 32);
> -    msi.data = le32_to_cpu(value);
> +    msi.data = value;
>       msi.flags = KVM_MSI_VALID_DEVID;
>       msi.devid = devid;
>       memset(msi.pad, 0, sizeof(msi.pad));

Could we also clean the other GIC uses in the same patch?

$ git grep DEVICE_NATIVE_ENDIAN hw/intc/arm_gic*
hw/intc/arm_gic.c:2065:        .endianness = DEVICE_NATIVE_ENDIAN,
hw/intc/arm_gic.c:2070:        .endianness = DEVICE_NATIVE_ENDIAN,
hw/intc/arm_gic.c:2077:    .endianness = DEVICE_NATIVE_ENDIAN,
hw/intc/arm_gic.c:2084:        .endianness = DEVICE_NATIVE_ENDIAN,
hw/intc/arm_gic.c:2089:        .endianness = DEVICE_NATIVE_ENDIAN,
hw/intc/arm_gic.c:2096:    .endianness = DEVICE_NATIVE_ENDIAN,
hw/intc/arm_gicv3.c:420:        .endianness = DEVICE_NATIVE_ENDIAN,
hw/intc/arm_gicv3.c:429:        .endianness = DEVICE_NATIVE_ENDIAN,
hw/intc/arm_gicv3_its.c:1909:    .endianness = DEVICE_NATIVE_ENDIAN,
hw/intc/arm_gicv3_its.c:1919:    .endianness = DEVICE_NATIVE_ENDIAN,
hw/intc/arm_gicv3_its_common.c:100:    .endianness = DEVICE_NATIVE_ENDIAN,


