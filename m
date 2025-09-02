Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A92CA0FFE
	for <qemu-arm@archiver.kernel.org>; Tue,  2 Sep 2025 10:46:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utOX2-00086a-Rs; Tue, 02 Sep 2025 06:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utOX1-00085V-7x
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 06:46:31 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utOWz-0002hi-Ae
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 06:46:31 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3d17731ac0fso2955877f8f.0
 for <qemu-arm@nongnu.org>; Tue, 02 Sep 2025 03:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756809987; x=1757414787; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DEiHQIGlRJ6Sj5wIFF4qDACPjox2v/CBmFEmEPfHJ3o=;
 b=WJGnKFlY4GWXuyh2VNfNID3qBGOnHRDBFdu3ApKM0FhU7hxwIMTSO+nKKV4nY6KZx5
 2vaWzUk99s3kj/lzEjmK598NxgbyyQiNzrawLJ4qqGjQXxCKFqOqo89zZLxbdA6VZwS2
 OT/LQxuGFDRLljAI2Hzv2kpUJAFY1qsZDN9KFWg8M8JnYaTTuVGagAnktTJiY2SdyGBC
 zxJjHatlyFIJ/0LjlKmN6qTAkRgy8ZYsLRoDtvSQNaCqfgis+ul6dBJc3Pl/RkBun74o
 /bK7nAl4gosqiTLUAxj5pMpcrhNQIAmB5JUiVyVf3TrQhp6WgojACjV9enE99ba2MxNk
 JT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756809987; x=1757414787;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DEiHQIGlRJ6Sj5wIFF4qDACPjox2v/CBmFEmEPfHJ3o=;
 b=WsCSFPzFRAJrZlLeOy2/hULhrYDex4ByZsxMwhyIs4dfG9del0cLbUCr+alCknNAny
 ewQqwW3VE/OfhtYSD+KyvIdjv5bvRO7w/aKQKat1AoseLhvhJ7krh16KiSJIjOUPQkLp
 l2r4/G9ynvBBE8F6D/2nciSnQFLpuOvAmnbVFGYfuMkgZwGAjXwdNIqemU0vIqe/g6og
 YY10z1cKyuNtzPSe9pInqbsU12Zz5pbgQU7YU2o7jxHdN9s73r39VyHTZlzeNZBrw1hf
 YXX4mbL0lT0rM0c3y676fQASHFpyTQHrflpCKI2oZLEcpUQXVtppN4ozxDUuhIieFzi/
 W20Q==
X-Gm-Message-State: AOJu0Ywqm7UZs8dbKGEBbRTWWqK3U8rKPn53I6asBJOtrQAW+JGlYqSL
 d3U8k4FVAc18xWAxIncvQkV//KyUySTgTnMzojGtS5VCe9MD14rVKVMzskxfUVhNKhE=
X-Gm-Gg: ASbGncvo5epJ+i7sDTyPicWTEYyVHHFQfYrV7Ua1x4IZOsbzDm4wn6Xj9fc2vZYLraV
 GVLP2FymboXLvpw/lUFGHj5z3TopV0RtIRtfc9EFDBHjVGWJCZkoXIThiJ+AoiZc3UC5TzIbDBK
 0R6kpGbOG2Hb/KTimUuKKlrOu+zxv3rTKoPt9ciMIrBS6ijD1VLmGRfZcVli5biSG04cSmujp7M
 IIaSYRtULgWAa+pi6VJxq4NeldcpX5JVRqTyZfVlAZXBnJRVBSvUM0hseflAHHadY3QDvQZ4UWS
 tGb5JEJXu5NKsg7W9O1hdNE40xIIWBhzrbv0GH+qN4pedzKBFzvd+mNvfWmUIiPCqd6xDkk3qEN
 c/W99e0Yrst0EzNMgYlnYKzV51Mlzd9I6SW3jfbmeLJUlHLCCmbRsPZcvqn1o8SR6AdPAhLhkkX
 rjk+81TvdxQfk=
X-Google-Smtp-Source: AGHT+IGODMoR8FCEV2IXVVGHbZ2ievzzVA4Ge+gU982bkXoKl/jBYRT/eZ7khUeuyvTjG/kVb0WYPQ==
X-Received: by 2002:a5d:64cd:0:b0:3ce:16d3:7bd1 with SMTP id
 ffacd0b85a97d-3d1d9ac1cdamr8178739f8f.0.1756809987484; 
 Tue, 02 Sep 2025 03:46:27 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d66b013b7dsm8416581f8f.28.2025.09.02.03.46.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 03:46:26 -0700 (PDT)
Message-ID: <e89ecfee-196e-4b5d-9a24-7856303cb84f@linaro.org>
Date: Tue, 2 Sep 2025 12:46:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] hw/mips/malta: Include 'system/system.h'
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20250901064631.530723-1-clg@redhat.com>
 <20250901064631.530723-5-clg@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250901064631.530723-5-clg@redhat.com>
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

On 1/9/25 08:46, Cédric Le Goater wrote:
> Files using serial_hd() should include 'system/system.h'. Fix that.
> 
> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/mips/malta.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

