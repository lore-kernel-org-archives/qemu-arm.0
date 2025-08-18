Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00978CA0EE4
	for <qemu-arm@archiver.kernel.org>; Mon, 18 Aug 2025 06:18:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1untBn-0001yy-0F; Mon, 18 Aug 2025 02:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1untBd-0001v2-NT
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 02:17:42 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1untBa-0007PV-DQ
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 02:17:39 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3b9edf0e4efso2643789f8f.2
 for <qemu-arm@nongnu.org>; Sun, 17 Aug 2025 23:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755497850; x=1756102650; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UaYRKbe3ZCB4ljIMRd5az/DexuULkRPJeujHDq9qu7c=;
 b=Mbvo9Ws2SthGGsCSFaxl1KFh98ONC/tOCUF6zKeg2DlGqrxP15J0vpsbWKa6PWiucV
 SlAiQYhNB4Idz9fGMA8i8xspe+WTeVq73nZqg/viMekoDGtwf3z3xCLHgpKh94F0+/qV
 8lKbgJ4HndPN2HozwH6lOvg7EAoiYdvnorS9kOlOEKIZeLM5NQ0A1cxMQKHEjMP8Mpme
 wJs9o3ciMIoWRZHgeod0s4p4zNTX2MJ/bo4ePQxfP0tPqeZbKr+Wz4uAJlEXFLFrcjaG
 bbUEJkQPQQ2NWUtIuDrzby5xbDVkbWxWQ9aL/LtQVecqDeTwXoYzCEWDACBvINehAze6
 O2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755497850; x=1756102650;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UaYRKbe3ZCB4ljIMRd5az/DexuULkRPJeujHDq9qu7c=;
 b=SWhV5QhNGz38BaVqwgCvEhfzmlYcBFBEt0LJ7uS3x00xcwbzuP1gypvqivkemWF22K
 cGF1lWntxd+HNxxahnixYvlqDnUaaz3hO8sc8Nj9cjkPE0Em0F0SYnzfmQj9gXwHSEhp
 sQyfs1DmrKpl7klKDFXCM7fQtokF+DMo0FLJKC7Qgz1UrlxaO66acMcFK/SFvXdimkEz
 BRMGpuEhF8sLPhLgZ+TYgHvZsX3ok3SDq0f4YFJjiTZnAC3nFsluMaO/rFE9T2F5WsrJ
 LPUOtg7e2MPosQ57dhwK+AoFiKZCLGemmmcfP/l1CYRzn+kpVztTvlmYnQG/Aw+QlZDd
 ZPfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnBDrMF4Nk5INMHWWm7+b3GWAqIlVex8rRhGpiUnXtP1G9/pTlt3WpD7MoZ94aPaD/eLEL6t9JTw==@nongnu.org
X-Gm-Message-State: AOJu0YyiQ0Nxy/kkt4U5X7DRbIgZD+X6FifWC4CF8wIadL7KBnCW07lF
 Zyb1PtJYoJ1xtgNXQS/fn5k1GDAz6ZKtbH0BCnJfJu/muwfAb2aJNlzMV4lQLpuAW9c=
X-Gm-Gg: ASbGncsXTV+UaIIlViLaInmrvo5QMqAd6QWMbGpL6sH49c55TN9kYlQRsMsrOIcnyo0
 DYbq5J7Fp2u804990KSsiAay9E19SG4IraAJ90rMe7wZHjgBNCaKLApEwsuCPC0da+8ngpYESQL
 qVOxYtSlQxuLJpioanfPayBklWJaTlIS3rEu1adjNhji4nkxoH9Svx75SUFQ5FDOQBBZkiOu7tq
 1Tksh1hwHjg1r9jin+YcaUDqtyqSiPT6ufRa1u5rZm/8jJqHsd8HWdbqeoHEJBRlfZPPJwyZTjB
 gDT1qMzOr4sFtYJTkAmzp24bdtLKx+uPgx1ZwbS49NnoivA6DpOs/l82/JrmZAVIkuZdgDwR4S5
 kNkz8lEnn9vePOjwdkl5o1loMyxfPncQ/+hZfamNV2kq7SeNDTffqdLSOJXDsAbHMTg==
X-Google-Smtp-Source: AGHT+IGEwDxNzKN5K+myiRAR+Hrj9Wt1aNQEiTltR27F1w7KqIpz42O5hiYroHOOLHmcs8KrKUaoYw==
X-Received: by 2002:a05:6000:250e:b0:3b5:dd38:3523 with SMTP id
 ffacd0b85a97d-3bb66567ae3mr8083337f8f.8.1755497849949; 
 Sun, 17 Aug 2025 23:17:29 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c748a9esm156887465e9.19.2025.08.17.23.17.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Aug 2025 23:17:29 -0700 (PDT)
Message-ID: <d1a1b9cc-578c-4aea-a1c3-f4323fc89e06@linaro.org>
Date: Mon, 18 Aug 2025 08:17:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] target/arm/hvf: Replace hvf_sreg_match with
 hvf_sreg_list
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: mads@ynddal.dk, agraf@csgraf.de, qemu-arm@nongnu.org
References: <20250818041354.2393041-1-richard.henderson@linaro.org>
 <20250818041354.2393041-7-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250818041354.2393041-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

On 18/8/25 06:13, Richard Henderson wrote:
> Change hvf_get_registers and hvf_put_registers to iterate over
> cpregs_indexes instead of hvf_sreg_match.
> 
> This lets us drop the cp_idx member of hvf_sreg_match, which leaves
> only one member in the struct.  Replace the struct with a const array.
> Instead of int, use the proper enum type: hv_sys_reg_t.
> Rename from hvf_sreg_match to hvf_sreg_list because there is no
> longer any matching going on.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/hvf/hvf.c | 45 +++++++++++++++-----------------------------
>   1 file changed, 15 insertions(+), 30 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


