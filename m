Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0271CCD19F
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 23:40:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAzTw-0007mb-Ll; Mon, 20 Oct 2025 19:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vAzTw-0007mC-7E
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 19:40:04 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vAzTt-0001Xt-FG
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 19:40:03 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-27d3540a43fso52858645ad.3
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 16:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761003599; x=1761608399; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IwBtYzNUfDJzGm83MEhycUupDJg6ryKcQcfhK3mDxaM=;
 b=vOuag9z1XIIET9BGJxVG0iZ8PaPg0NtwYXARnSxcZvOsUFBHChYoaZA8I5qy4OJUHw
 a7shVeHeyTvVgjIUKfw2sNsfcYV7VG3rC/QulQWcEozCmo7zTh4Ty4qg2pM0tWRMRD6e
 E74ME2jNoAYgC/3w1VnL0lqILt8IZ7gYK4LXnqCrvkLH00UoX3dacwzLu3UVt9Vif3Xk
 eOosORuWLjIMwBd43xpyIB8+jcpO/S98J03A2uc8iXaLDn96qogysNxUPKBx+4qNrf5N
 lUhHjqA8MpTc4HZ6LjAPGLImwtap1zy8cirDxX9Lf5RqNQX9FpDRr6TEikxpyMOGmVSF
 2ftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761003599; x=1761608399;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IwBtYzNUfDJzGm83MEhycUupDJg6ryKcQcfhK3mDxaM=;
 b=SP/tlJoXpX764rybIdxQdzzJqh9aszl4bisLeN0W6f1WYTf+hCYVLxiz7LKESozp+R
 sqrrMdNrzS77n9lBoxOdC2KhHf2RZ4gMGhdMkDb/+DxSf8p1OPxws1dyRLQ9+srqx75a
 7op72k5lAgy97kBhKUC8KORFQEXrzqb+6wtMAOHHF+K6rowXpdZZEtLiXy7vIC9I7w1y
 xCnYr4XepAItF+zeh5Qsn624EIPUTA0DMt0VIakhA0Bx0qcYqQZl9DzRjv5FtPSlA1yf
 8RoRF6mWf5/GCkGAieuv1dj8tkAhLi6gmIor5PwwML8wBVzi6ErzmTyarlaCbqfZ0Bbb
 RNCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSY82N6sq0fillZD32x6t4KvrfWaMhd8cyyJwyCAUFDHNTbMiT77/QpxKpXraHZqxtQV7N4+bAOw==@nongnu.org
X-Gm-Message-State: AOJu0Yzy+6HIcjhkegqUpkQ0gcyoOkHCVe9JZESO3WKYGA/tTKVBzLTc
 MnL2rXLVwVMCsMV3FnRhWqcYmIGjfaSzVbZIsnyHEHFYIFpcYJoplVaXEg81Y5IZ48s=
X-Gm-Gg: ASbGncuvkxKmL3DPr3JsiZ8n4A5bcGEn4cCQtdVwl0WRmn9XzoCBeGHD9Z3/YHCJTpa
 XP1NMMJXWnbEg5UAixLqKyvbZtpkybceKELKt4ZbzVUw1NAhj7nUECYXbAjlwJgriI99dI8Qc2/
 5UEhUFYG4mHd3Q3fhpGo3T1xA+Jesip9HFHxuA6JInko8nW9ijYyvofXuwT80WlqsB3wYePpcqG
 xJw5gJZlcldDJIgBY6vsghn9EcOvH6Lh0jAL43Wn0OxIxqi1JAqW6Fr/1U4qGwFlSV+Yl8RflI1
 NoH1NKbwRr93g3bLDLcekAFh9EBNa3hs5EnaERAdC2y52CdTgQof0M7/R/8Z7ND7Cg6cVomxC8x
 xutC9HxHypsje+KyxtOQmoi51e2XXIbimPbreWnCmWKKjhLvGK5QhwW/ZFsQNApYZ6P7aTtSjvw
 DKaQ5lcrBuX/ShOlmTO3U6bEvA
X-Google-Smtp-Source: AGHT+IG3qW/73MkrtiQiIQ7dEorifELi1QS4vqEtx8fS9jF/8Ro67dZgobaz642FwYUuiDlajfBCVQ==
X-Received: by 2002:a17:902:ce12:b0:24c:7b94:2f53 with SMTP id
 d9443c01a7336-290c9c8a765mr166336435ad.6.1761003599606; 
 Mon, 20 Oct 2025 16:39:59 -0700 (PDT)
Received: from [192.168.1.111] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29246ebcf67sm91566325ad.15.2025.10.20.16.39.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 16:39:59 -0700 (PDT)
Message-ID: <3a68e872-93c2-4ee5-8936-2441a34fc19c@linaro.org>
Date: Mon, 20 Oct 2025 16:39:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 25/30] hw/arm/sbsa-ref: Build only once
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, Luc Michel <luc.michel@amd.com>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20251020220941.65269-1-philmd@linaro.org>
 <20251020222010.68708-1-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251020222010.68708-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x631.google.com
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

On 2025-10-20 15:20, Philippe Mathieu-Daudé wrote:
> Since previous commit allowed the use of accelerator definitions
> in common code, we can now move sbsa-ref.c to arm_common_ss[].
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


