Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CB8CAC5A5
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 11:30:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1kB2-0004wj-5p; Thu, 25 Sep 2025 07:30:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1kB0-0004w8-BB
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 07:30:18 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1kAq-0007nV-Ch
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 07:30:17 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-46e2e6a708fso4809915e9.0
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 04:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758799802; x=1759404602; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q8Vup0Q61M8S6hCwZhwkkM5Ub4PCL6HuDPo5o7nxj7A=;
 b=vb2+/D4gQ1eLefHUh2j14oLVw/lN+2gwc4+m+vT4h9+Qw9NLYM2r1sb/xqQXE/2/C6
 8ahkJJ8B25aXQtacJyu+UB5YVwe7RP/Vr3c4EZEvDF5drsUQVPSGS/jFKoYJB96mwCE3
 bVYsch2YVLxIz7SJ83bW/dPk4i2fD0ZipF/XmS9CnWcvWJPUV5j6luu6SciLQCrnalpc
 EM4eWvihh46TeMk1lGDGS28dzap8PlSDZbMURC72mxWhNF2X8stsBmRLK4s/cGflxMWQ
 l9kJT6hzqF1RzoF8wYIihsgmfgzZMVMdyuYJU7w9wzHWNHFMTuloG/QB4tg9xyOVX1aN
 Gr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758799802; x=1759404602;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q8Vup0Q61M8S6hCwZhwkkM5Ub4PCL6HuDPo5o7nxj7A=;
 b=WrW0qKd/HleKg1kx38Uv6t3N4XWMSpWg5K9mxdbou4erec1ArjBauyyz35JMaC8A6I
 QMciXzf4lV5R7TDbFU4JWLfQL3G7E+ByszEUKobUAUR16P9EsECGxqVhhuc4pFgqSGW8
 xl3Xi6R8pC7EbGfdrYtHbaRke391PTaHuh4/wqXwOrqWYmROSYNLd3n2M6asYPRSpK+v
 5zhDKtQCw7zxEASAn02edBwDGtyyrAvDLFxviAG+vFkDfYa6l70mLvOo4JNeocfGOm1J
 eLZaMFU3H/rR8Zhn9oZf7BMiUZ+lnMcwF4mWEkbTmJjRCdfdygk/xPQLBOAM4IIhfSB/
 7LXg==
X-Gm-Message-State: AOJu0YyYQF84XgTSegLnQwd3ER33CBeV5dl+1cgGODXgj1qqltbroofN
 DmFg9E3+vd5eAjKPR9bo6Bc+lHXJ0BjY26TYhlhSbXlEVeIreGiFY5ssLau8cKC+HoM=
X-Gm-Gg: ASbGncvrLBemnI69WD70NaDiaCS9cQhImMj3lCMsbLQoL63ZmddRoyTTGYE+fIQPiLB
 PFkrZt8qSDaCdXfVEsPypWZ8v30kz+EH4Jd+7ReGXRkacfgNsCWSNi1iRoU0iX0QNhexr69wjsk
 TWGldeZzk+9zCwV6C4/mYuWuBuSAMv3IN4z9vW9KvOKPRkON4b/QY5sMzkQs6jLH1zLhwINPlyb
 bpyxMCwER68Q3wP7Vw54mG5lu7RLDuQp3ktwdPyuoOOBUBhvRMVHF+04mUnLQ9yLheeY13X+5v2
 k4DX7qhQ9lDBI55OtJWx07gH1xwXu8kFn91iadmmPpNASD9hTqxBfu3GBS/qI03Ugg44/MM7JV+
 Rb50sojafVbZIo+Oj2llIy7C/km5HOFV0EXe8139A12a8ValkocsLt05s8rfs3fiaMA==
X-Google-Smtp-Source: AGHT+IFtsyyRfhYblHgq6axwXWt7/za+nAbvZGw6pjwI7AdX11Hy1UVGDZ+XIL7WyQUP+SmYcutlmA==
X-Received: by 2002:a05:600c:1d01:b0:45d:d9ab:b86d with SMTP id
 5b1f17b1804b1-46e32a0bda9mr38571885e9.31.1758799802114; 
 Thu, 25 Sep 2025 04:30:02 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab62233sm74011505e9.21.2025.09.25.04.30.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 04:30:01 -0700 (PDT)
Message-ID: <c61a120c-e196-4815-9f27-0a5c763cb36d@linaro.org>
Date: Thu, 25 Sep 2025 13:30:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 32/36] target/arm: Split out redirect_cpreg
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-33-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-33-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

On 16/9/25 16:22, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 17 ++++++++++++++---
>   1 file changed, 14 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

