Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207A7CCA476
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Oct 2025 10:14:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v64hM-0004b8-SD; Tue, 07 Oct 2025 06:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v64hL-0004al-26
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 06:13:35 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v64hJ-0005fD-Hu
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 06:13:34 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-749399349ddso78083697b3.3
 for <qemu-arm@nongnu.org>; Tue, 07 Oct 2025 03:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759832012; x=1760436812; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MU2SNYZpn/hA1jxyI/T3LhwbWp9Pf3dNlmcOfsZd9CM=;
 b=ZiAQROiLzJxBc340AOh8TbhRu8iPKW3PcKmNVM9NWTPaSLuIwlnbnELBIoZX8fwfLq
 G2ffM81gcGcH4Yhc+6hUJTqmOUaL5WpSf4tBb4jqFzqFeRIGhqkv74kNzXsHzVjnr6lq
 1ZJHsHB5a9Zl3o/O2PQ77EWe7kWG3ZczYb2QpKDP0BQ7ufM09vBuBtVQFjQWXNrq1OAN
 3iVUlnr9g08Zn4nGTiWajam8kSGcoF3FnsFDFnef3Q1iskUv0XLSo3SK/M0yozqGRcYG
 k3+SoymwsYvSdpzVGl1068h3BIHuaL2kC3f2TvgS+05ltsr09hdt1a+OdodNZVlobUJH
 b6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759832012; x=1760436812;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MU2SNYZpn/hA1jxyI/T3LhwbWp9Pf3dNlmcOfsZd9CM=;
 b=pDAgmt9KHB9n5ItEUeJWkk61K75jVm+6Q3TZbTsJ1ZQ7SBCq6PMiRC04brtcNZbU78
 6YUI8sVcig+1DtA++U4EX3TouB0e1JistwPeCY77M6/spdtjPBOTggBjqe/5h458IpiO
 0r079qwh6/LHJYlx4B6bnKjXjKCWmrxJpILKaUv4EvlokbiucWdlx7ZwFkVocaFgUdzA
 KJMssZtl4ITheYsTT42bnk5BendM8jLI2T5DWuFRx98BQuHxvgJ1R8jbtfhuInK4ztdV
 7or/2a4v7iWkL2g6qSlGAe7IbWB9eBQM3NocZ4Ra6moPgXeOzyko+DRM4MSkCk9YUZV4
 4QOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPanFM4Zj4Prr7Q8pYf6CNls90amoFYRum8SJEz8FzalLd5gBqDorzlPYrF7nU34mP0gOdB0LDwA==@nongnu.org
X-Gm-Message-State: AOJu0YwdrEOAmSoolZmoEC97UPt5R4B75Ji5Qbc2JbRLR9aitCmB0hgT
 hrIZhv/Wd1dPJTkNOBARvEQiYR9DfR35+yQh34Dtmrae1u7ZoY9eUS3/CkqCkhhHrmY4iauOsMi
 RUJ3525U3Ct6NqGjo8Sutpj/pzQW0eV3Som2/wA4zqNA6+j0E/K98
X-Gm-Gg: ASbGncv85Wzhuh17BWo43EGE/d5RoPvvh4M/gTc1pCYq37ILYZ+76DPJ3sY6M0lC7dk
 VSD23QDu8pm8iJO1f40SIjPBjJ9KbV2UjNkQteQWANwxjLttf+m1dwR2VLMViwKsP3g/TyIML2b
 lWV2V72cYYVpncjcURzAcVhK5FsO+IIqfQXzzxCXSSDqtta93cpGAxS1bXB+4HNnKWQEOa+V/CP
 qFGR/kTfT6BjykFoDuW9TZLM6AA5fybSYJ+
X-Google-Smtp-Source: AGHT+IGSyA7h4JkuIhXWF8AJj7jwP0nk0r0UGmxuI+FsGWY9MOTlbK3LBlq76PCz9ulHyv+hona9kf8bJ72o0Z1akXI=
X-Received: by 2002:a53:c40d:0:b0:636:1fd9:1bc with SMTP id
 956f58d0204a3-63b9a060cbbmr9929473d50.8.1759832012052; Tue, 07 Oct 2025
 03:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <20251003170800.997167-1-richard.henderson@linaro.org>
 <20251003170800.997167-39-richard.henderson@linaro.org>
In-Reply-To: <20251003170800.997167-39-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Oct 2025 11:13:20 +0100
X-Gm-Features: AS18NWBlNgrnsKg8CRJZ0w1WHOOTpWO9DgSuUWsSpP6nqVKKYYwH08v0KfkuOss
Message-ID: <CAFEAcA_7iEN6VqXW=urCG6=wB2=Xgt1WMp0yxpJnd_34hddL2w@mail.gmail.com>
Subject: Re: [PATCH v6 38/73] target/arm: Add arm_hcr_el2_nvx_eff
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 3 Oct 2025 at 18:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Implement the pseudocode function EffectiveHCR_EL2_NVx.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

