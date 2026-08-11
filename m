Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE3EC5AC67
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 10:25:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtjfc-0007KO-5F; Tue, 11 Aug 2026 06:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wtjfY-0007Es-Sm
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 06:25:17 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wtjfW-0004yl-0N
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 06:25:16 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-8234e9ea616so15340297b3.0
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 03:25:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786443912; cv=none;
 d=google.com; s=arc-20260327;
 b=NzpdidLg60AOCJYTE05DVKtEzaHatUJ636eNsRcEZjGRqmzmmrXzM6uCHopW1Xij1Q
 8zT+tw88PpR5wn0i+2dUdGY7iGpCBzCCNCuNaxAYUZwIBGI7MTs0N3Q6IflSLKAnb8GU
 DLmGhaHZWezHkGT8tvShBoaJf/L/4kRXS60gh3hRcsv3QIf0eszuQl+bWjgc1agcFYxd
 nKtW3sk3BcLlgjCoOzFSa5O3X4WGAnVPsUji0OPRWQ41Ddje47QTgnBq3k6JdFcdcI+t
 7bfF+aSOVjOgROECxJZrsh3AtS7eE2CbJs5OQUnnCXFb+KH29FpN1VK+WwOLKSM2Mp9+
 Gn6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=uvdRbPu+mAOcN5Hl36DJm5zpu8FZi6IK1n/F9YxiBk4=;
 fh=biCLlQgY92YN7Dr+zieDCtd7kWAfeNDHegdwnYx01Po=;
 b=NNRk46/TuPGDXhZtICj8F9GiDTP0KfP2oujRIJVzSJskXmVquFAe8MxpaV6VH63O6d
 IX3cYlBQdzIDkrpNqtPO8QO4dDdMd5Qdxzq0gxCE1h80twseqaNm/fHEkfW0Uhnw23Nm
 GXa4SHFmodyEXTXPbRlAbvPLEt7XXkdA32Yk085EfhhKl1GxgA8RyvSpgaAW+N67hUed
 4qBN6/L1BNojkPdJehVBWvQOT+NFpo2CwkaPmwerPkyJSJsSRSv4ohpf33w9tKahzhk1
 Jx8nHHcDhAQxHu39EwFNt1gb35B1fyqoVz5Qcci8ZwntOzI0JUN8dDU/JtrRxZrmAw97
 uwHw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786443912; x=1787048712; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=uvdRbPu+mAOcN5Hl36DJm5zpu8FZi6IK1n/F9YxiBk4=;
 b=Md5isdlwasTyvDwcPDdQK0L52NB3CxIv0De+AvteCXmg5skXfGgAeC0JyrGNT4Ve4g
 1EjCF2JJLZ64LOBgTrgSRIVNTB7MzR6e0eEL5Iin+JJ4I777F1t4zWmnqcgaqUjgeoW6
 r4FWfAO3ckTgaLI97J/3+OyLHR8wVqlwCfT625Pxl+n6x99L1gRVqWzZDAlSoBs4giiR
 OV50y354mIzxM1CIyfobiU2q8zUr7fwtT430fnlExKTaSHQV22R/QME+0VKYVmXxOcVu
 xPI7REVFcJxr3j0bgdbgl7CO3dg+MTN8Z8ZOg+wXKrDOaiDg7/rzh9fKCslljfvGv9cf
 su/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786443912; x=1787048712;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=uvdRbPu+mAOcN5Hl36DJm5zpu8FZi6IK1n/F9YxiBk4=;
 b=sFnkWU28fOeU1MNasgCaJ2KQtMHlxcN6m65qofrAaViyE7nj02nZP2nl5fNARcdeV3
 k4c3ozkLcG2ZM7Mjt2I8c+5kKi6HZiw8tAQ8li52jcPGvwmdsR6BLKsJYea+T1RDv2FO
 b10Ie4MdXmvXI6ePeUJwfaXBdSZbrpqiNzNBbUHC8P60ocwh39RPVVlMIx9k/p8pG1DC
 /rbTl3HiueTLywaQ7+Xa3QHE6kIF8aU3Vk+2az/tmr4rdVf7QaQ8ijQCoYcgwhwbDD6h
 OeuF1K1sN96gHVezvC9EATHueGDFycIYCK1XPHbiDyc7Zj4ZX6Jxz7CB2Pt6igchNAyY
 1TsA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrifMZNX3Lb6yRHkFBt00CqzCYf2N1tjkpYTD8myLo+Wg97Vbo/vPorq/rPIQ2c32TmiN+E35jfgw==@nongnu.org
X-Gm-Message-State: AOJu0YzVwVSVA5guzvqwwDwH1hmSGQ88nXAUSJl1RtECzT/xex2/blfd
 ErXbAujB+L84VdxDThmUSLyl7dqhwz6FUBdVIfv4GuqwKQzAG3gEQW388IRZDDoueEsAu12/lr8
 NtKhZeDdhuoauy6PoRX+/fbp0Rm0Ap7br7CrN+PKtvg==
X-Gm-Gg: AR+sD12JQ1aeffNKgL0/j64s+NQlhcG7fROXUCTT/05l+g612Ix58TtTLbnaq5fYKlE
 iM2IdJ469vqCHJ4kjX5yZO4EZKcGGyxIirC1Q4zqW2DMZHlY0u0P/OMCSIv8tHAX22MsSXWLFXn
 6b2gmskd57cUZPBeAqwktKLbUbIoFq+HVKZcyBfUzSDTz85FQ5/G3Q6ddA8Pl3eZVYcvxJroeZt
 Y5l3T83I3WvFvoECv5WDH+jswVnTobxuIFw+lQZdPlGpVqGGuyy0Ga6YPR4NxmqduoQPxx/KnVp
 LUesEASfdk/xCkbiFCES4KgEKJ4Xq8NBorjf3yAbKXg39XvweLuGiDDdz0TmfjjY/+XqnODIoN5
 gU/nfAI3H6npV+uhi9SKHT++ji6TH
X-Received: by 2002:a05:690c:9988:b0:7f0:38f7:6ca6 with SMTP id
 00721157ae682-82f215a85dcmr12427017b3.5.1786443912517; Tue, 11 Aug 2026
 03:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260805191257.11303-1-simonxhy0404@gmail.com>
 <20260805191257.11303-3-simonxhy0404@gmail.com>
In-Reply-To: <20260805191257.11303-3-simonxhy0404@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Aug 2026 11:25:00 +0100
X-Gm-Features: AUfX_mxVmi4XCGO_W80vDo7hanxtZJqVL-uOwAqlMX5bxcLjVhMqkmM0gydN6j8
Message-ID: <CAFEAcA_f6S0XTL-v6Wa9n=vKJMob4xm4FhDDSyC3MwBbgOH4ag@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/arm/armsse.c: fix SSE-300 PPU addresses
To: Simon Xu <simonxhy0404@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Wed, 5 Aug 2026 at 20:13, Simon Xu <simonxhy0404@gmail.com> wrote:
>
> The SSE-300 CPU0_PPU, MGMT_PPU, DEBUG_PPU had the wrong addresses
> that were the same as the SSE-200 addresses.
> Page 146 of the SSE-300 TRM defines the addresses of the PPUs.
>
> SSE-300 TRM: https://support.arm.com/documentation/101773/latest/
>
> Fixes: 8901bb414a24 ("hw/arm/armsse: Add SSE-300 support")
> Signed-off-by: Simon Xu <simonxhy0404@gmail.com>

I got the SYS_PPU address right, at least :-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

