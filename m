Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F36F531DE
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Apr 2026 23:13:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCQTR-0002w4-Td; Mon, 13 Apr 2026 19:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCQTQ-0002vl-QW
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 19:13:44 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCQTP-00016M-H0
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 19:13:44 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-48896199cbaso53088145e9.1
 for <qemu-arm@nongnu.org>; Mon, 13 Apr 2026 16:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776122022; x=1776726822; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eBagoQCA4FTWyyGjduWY06bgHHk0SDGqbr+mNflrSnE=;
 b=vPGU5rab73UVj2hVxP+UFQLz2mrAGssECIfRmQV2DRFGeffG57kZinyyFjY/zOBfyv
 zmmcvE/ze1TTdZlAwlFnoBVHjSz9QIwnpuaLHxjZeh1RZoYo2WPp142ybAZVFuIlofbT
 ZFm50Cp2A5QmjK/7929y4Swk1ZCmHbtzKTEGqrt6BAMl/lEZ4TyEZIjc0/MvWXE1xV4K
 WjECefH+V6zcTj7olcnFL7VsQ26r9dnctgnxoBaQRZsKUcfT3N5RCfa1LnDqnxmDNNV/
 UxS5n/2KJ066sW/xwZJblW91iyLJxIE0453khEFCAHkzyf2miVt88ko8/hwl1jVMusBc
 2GaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776122022; x=1776726822;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eBagoQCA4FTWyyGjduWY06bgHHk0SDGqbr+mNflrSnE=;
 b=IuYqOcqaN3f8NaMASMAI52iI4J6ar/NCC16g7A1w3M1kBr8m4t43kNJUd8gwf87wgj
 7os8qv7WfF4Bxs85q27dFyRzssck361yvS21rw4TZYt0NrjYm6gl35k25dhCUxtmoSUA
 1TStOi8KjDEyt3sHx7mHH8M2h5yCP2zQI91DwI4cgr4Nq2adfsIqTkHRmyu19lUr6RyP
 iUIWZfo3mnwrh6eWJY/Ftcm8GzFgREf9kFVDTFq5ixC4uU+Yer8qEFwPykkltNJfvInH
 teTKxf6+9ZKkMt0UyyRa+W0V24Zr941BKKDCA8VG8S/wLdqPfNB5F28cFSCzjkrVakt9
 UUug==
X-Forwarded-Encrypted: i=1;
 AFNElJ88fV1DlKbuuhVvQ+ECR77B4ML02qMlYmPXv0BQ1sujF4Gz7BLi3ERnRFwaHxbbM6Vo+9787k752g==@nongnu.org
X-Gm-Message-State: AOJu0Yyw5q3/zqQ3QnD9Lwn2WuYGQ8Vgn91Bk8MowDP+zFgMJqjnIp0+
 DRAZ2n3NsAqlzjObYX2zI4WjbISG1N8rF+3j4I/g6Kr0x0Lj7HA+chBzh8Mkl+LWjbs=
X-Gm-Gg: AeBDievZ1rkw4FvikO8vQSyye99GW7Qa29pUgHPvsYCtff1/lVCP0hDhPAmGYnIOpE8
 j/cilw3bcixIDSjmlwGOPdhCduoehMOzWofSL1Kww1nqPEi/uQaUMgx+A6vjtXsIYDP3x/5o2dP
 ciZGqt8zb75VJGCcQJhIeb82GETfpi391lsDl5MoFsq9yCM6rvCE0CpI/Ny+VUgUMwScY/bcr0C
 nv4h8+IcyxoLIoD+q7P6nQXK5e2kqmLgwP2D/Br1wTGu/KrpzWCLECJYik30h4nnb5LMB2iVEs8
 9zDtwz4yMGu5Nxfh9uF48wRcRUToVV7iBU1YiGPst1GGhtbW8/tD/N5Ydrgg+9bwH/9UetlkP6j
 At7sqEwKbLWIZZW9zo53+lKtwNvHRrQVAZEFJc/dXUv/T+Fsa8XeJKaXFE/KR6hxPXnPR/DK/li
 EwiEtYEkgf6ZaR+14vPXnv+ouTQqKnLOl/AUW+gV46gy21M/bSzGqQ/xEZUuKu2/8voA==
X-Received: by 2002:a05:600c:5299:b0:487:1fb4:7e1 with SMTP id
 5b1f17b1804b1-488d6875f3emr201677885e9.22.1776122022176; 
 Mon, 13 Apr 2026 16:13:42 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ede156a1sm1979155e9.2.2026.04.13.16.13.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2026 16:13:40 -0700 (PDT)
Message-ID: <8bdb52d1-fb04-4478-8a1e-2fb29fdc8edf@linaro.org>
Date: Tue, 14 Apr 2026 01:13:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/65] hw/arm/Kconfig: select ARM_GICV5 for ARM_VIRT
 board
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
 <20260327111700.795099-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260327111700.795099-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

On 27/3/26 12:15, Peter Maydell wrote:
> When building the Arm "virt" board, pull in the GICv5.
> 
> We haven't added support for creating or wiring up the GICv5 in that
> board yet, but adding it to the Kconfig early means that the GICv5
> code will be compiled and so we can have more confidence that the
> individual commits building it up are correct (or at least compile).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> ---
>   hw/arm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

