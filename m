Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEC9C5DF81
	for <qemu-arm@archiver.kernel.org>; Wed, 19 Aug 2026 15:14:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wwi07-0001wq-HW; Wed, 19 Aug 2026 11:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wwi06-0001wY-Mo
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 11:14:46 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wwi05-0003Sr-1W
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 11:14:46 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-ca12086c06eso768602a12.0
 for <qemu-arm@nongnu.org>; Wed, 19 Aug 2026 08:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787152483; x=1787757283; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=qLA6W8XnPxw+EqnKqnSERuQr4BxGOLl6nrJnSPvMXO4=;
 b=W0WbOPK5DQRqtHnb9Pfs2JsJR2WLK5OAjZouKQ3l0J0UfW6XJB1YlrXJDoQ+7j8MSV
 dQAGfreGNQzbtcnq4gPNmLg28lhfopzKTgTeIN7pwsrhrgSwv9VuIkeb7LbMW6yicQFZ
 YoyEkYxBNQ3rzt01hfn9t7j4/jGBklBgHO9Jc3C2RdMDp8ptqrNgO6c6PR8lyADrng7P
 w9x0oPXjiatM84Xv3B0n66q/i/MpuMUJ7nn5tyvdLOEMVkvG41Is2qfav8AXNNOSJ/OE
 0pTwIEu+1xeMWYcjzxeU6HDc+x/Pk0fbM6pyz60wLKwHqAjAdGc6694AyYhY60zCB1eV
 XWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787152483; x=1787757283;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=qLA6W8XnPxw+EqnKqnSERuQr4BxGOLl6nrJnSPvMXO4=;
 b=fmxPbyVBWANJeFRkOJs5WpLO0tTkWmdYvFIhHYisydm/daTcy2TANbkmHayBLGlu+n
 Sm7zNfNB8T+k+S3m55YSIIZ8lKoujgqUi8SVaXLD8pO5lPAolqUwcOMdcboU1rOgzOJi
 rNQNmE+OKq7QJrely5s1rc3wpsHjbQHXvlHLtGYKSOkwsuKv814S0czDY5flR51AUDAc
 0fnumGkiiDV7W6AOli9DlVsnWpZyoCE3Z4tL1mkUCl7c+jCYx9yZhBZ6r+vwlgXsav/T
 fcB6pSGsboT6co3W1HSUh/TmXDUu8zj+6ibX8luaMPSJqHUaqMt4Y7DJ1c3fYdJ9atKz
 zlEA==
X-Forwarded-Encrypted: i=1;
 AHgh+RocBc4EXlLG/h9ScXSsjv7jF7ghVngR37ioIb9+Tqk1AiboAG9thiAgnj+jKNuYknjU1gjnC2ZA3Q==@nongnu.org
X-Gm-Message-State: AOJu0YyzvhK5UPYgbQjLKgfLmXlu+N36BHG7MXKFpq5aIH/0lu3QTz8V
 wPH1uxnFaadXTuZHMtKiy8XPV23c1E3Wo1DYni7f55bqjmFW4Kbt/6elSLZTZI1GIzg=
X-Gm-Gg: AR+sD13EaybmGY0nmwq+hq1yduNmNyJDcJ5o8qv4IYtmAukxKjusDhCaX/qL73eg7HQ
 ZeTHal5Desyo4Deoy9SQF+0QreXF1IK51WDCIjJPbalpX24480/02EcKK5PSbsy8B/NfTINzrxV
 ShJB3Mmqf/AQBuDmvuocP6NiCTamrSdqjeN1IjWCz0BcmDXGwkdCFn+SgIiP6ZJ/o4UsKDktJqe
 GvDBS58tMHYoc75nkob8XyjegU+WDBHw9Kvdz5RdcOAWGZQ7HnZADx24787pxyNmsAnuRUTkMYM
 XxmaZCEX+HhCSe3+gaaVp51h1nCQ5VQ2YMRnVvaLjQ+l5L2EdsZ9DE3PBU2YaPXETmsC1l48R9d
 KCuUrAo/qoRflXG0eYABI4oiUpIdgkKVWtLabRPCMRMfOEusNr6TdzxM7BwS08JZ9opydeYITv8
 krrc2yWfbNTrjyQuWF5r63iNcFrT5uiCONiueo/SNZiPF9R5SmPjl2wbpnmN3/Tbgq1wgaKovx+
 ZLqkv4dyQ==
X-Received: by 2002:a05:6a21:6b0f:b0:3c3:8c91:5da0 with SMTP id
 adf61e73a8af0-3cd012342ecmr10291651637.15.1787152483263; 
 Wed, 19 Aug 2026 08:14:43 -0700 (PDT)
Received: from [192.168.122.51] ([173.164.107.233])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cc1593060e8sm626901a12.32.2026.08.19.08.14.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 08:14:42 -0700 (PDT)
Message-ID: <ed456dd1-fee4-4fae-afdd-cb30936576ca@linaro.org>
Date: Wed, 19 Aug 2026 08:14:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] target/arm: Implement CPACR.ASEDIS and HCPTR.TASE
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260817123838.1578060-1-peter.maydell@linaro.org>
 <20260817123838.1578060-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260817123838.1578060-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

On 8/17/26 05:38, Peter Maydell wrote:
> When executing at AArch32, there are optional trap bits for Neon
> instructions in CPACR and HCPTR. We don't currently implement these.
> 
> Now we have a separate code path for access checks for Neon insns, we
> can straightforwardly add the check there.  We need to track the
> target EL for Neon-specific trapping in a new TB flag.
> 
> Resolves:https://gitlab.com/qemu-project/qemu/-/work_items/1499
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h               |  6 +++
>   target/arm/tcg/hflags.c        | 82 ++++++++++++++++++++++++++++++++++
>   target/arm/tcg/translate-vfp.c | 16 +++++--
>   target/arm/tcg/translate.c     |  1 +
>   target/arm/tcg/translate.h     |  1 +
>   5 files changed, 103 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

