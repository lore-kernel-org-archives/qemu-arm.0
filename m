Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84270C83F17
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Jul 2025 22:30:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubRgO-0004HO-SD; Mon, 14 Jul 2025 18:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ubQqD-0004aj-0t
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 17:36:05 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ubQqA-0002E6-VN
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 17:36:04 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a503d9ef59so3526624f8f.3
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 14:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752528961; x=1753133761; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IFteLS0V4c4i6gGYb4295S8Sf5+R90q2vU9r62EaS8g=;
 b=wxldCuW8YQJLtdYIqsp7k+ufj+IsVMVkH8XkfLPhPSkyWCgFRRQaRsRgIA4OuQQwQV
 W5mgwvXEIsrhnjt/FJOeA8iJcmNdcG3mCB6kpIl1ZzYWXvyiPTjurKD6t1Riy9rdis+s
 4tW/1Xi4/nvs2Vi8rhirfXw9pByPqM9p57+j4YiVMKtAkISUoZVkNoy7TY8xhuDhrA/F
 E6fYq3D6Ve6mwo2xF4aQNY3+kXiMMmfK4/ATzxa6dwZ1P/K9mrYhNCQX5XIBFYwVONOd
 FhK9mSzM18/mRuTh0OJvmwQ0ow/EwGr5nZGuB6Q2oy0rYNICGPU92d4d6PdqjwisY2TE
 I6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752528961; x=1753133761;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IFteLS0V4c4i6gGYb4295S8Sf5+R90q2vU9r62EaS8g=;
 b=nKfARA80+4pXIqQS181dcMaTRQgimPCIcutoFzS7STJYE5XvU6Ly5/HfLOUXQjL4fB
 WZxRLZmnTooBdjAvTsG7GZVAggazqL5YYlUtyMx3vmy5Evzt+yeNAz9xyFXt+RyZEB9Q
 gmMNaZweBE+x9j7E2u4139Q5hx0IDn5+MOtJlKaa9jKqFRPX3LWcVPRZbNgGfEwnZuPR
 E3jtqsYlA8B+IRqxaN+Cao13KTU7ijgAvCCsJgQ3g/HA26RMCP1oLOQjGkJSGKC0r+ga
 KAB5zpawhBOq+6OLNnJuLnXGLFusWuVq86DdVZWBpLLnsJAPsWpI7znLRlXktE5x7K6l
 Lw4Q==
X-Gm-Message-State: AOJu0Yx7eGhKPHTKeQkk1Oexnkeo4BWZ/+AK7NKj9KeH/mfdcZZRTUV3
 Gzyo+j+TxU1iyafmNCJN/suynGE5801uiSdNn8wBST1ixOf/HHW+4hoAQfXyNwrp4lM=
X-Gm-Gg: ASbGncsefeY0eg1IOT8sbwUrT6AbTUeuxPYpYo8fYrDLSO7UV4lZDCGbgoFqzvgKnh9
 ZpxaCHPALXKaLMIADKO6bUbK7rlB5oO67fMdl6n9La7UvMEsKeNlE7J2FdypOJcRnJ9ji1LgUIn
 +5A8kJc4+NOmoGlAt+fJXnVqJIUGk+BRBK1RymKT4AyiIxUtjmN85MmFhBbPZ+08afMiS35CQGh
 aC+4VeykgIxUiorQVBcG5zrvtc64KdpC4HTTU2+vC9XGhxiQonikrD+IqnI/g77RiLrck6gHhPE
 T5oaPFLJrHyi4fS87ZQ1RoRu1cfnKPSVkILtU77Rlz7VFXoY8GqcAAJc59MuRte1GcDcRqbuR4e
 s622G5QrWnZFCC2sNWM6DcpEgi5+fSdHXneFiGgVz8yEgvXys0t6FePURZHa5xB4honHogNc=
X-Google-Smtp-Source: AGHT+IEyA+ESg/pEAYMU+/ldk+7dylKHvBXVZntzUd/lgGEH+fjYAD/PwEEcVQfHHR60K4GVZrhw3g==
X-Received: by 2002:a05:6000:1a8b:b0:3a5:25e4:264f with SMTP id
 ffacd0b85a97d-3b5f2e1bb21mr11256222f8f.31.1752528961062; 
 Mon, 14 Jul 2025 14:36:01 -0700 (PDT)
Received: from [192.168.69.239] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d77asm13688251f8f.58.2025.07.14.14.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 14:36:00 -0700 (PDT)
Message-ID: <c9c3ac80-e88e-4779-902b-707fb5c9f959@linaro.org>
Date: Mon, 14 Jul 2025 23:35:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] pc-bios/dtb: Remove device tree blobs
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250708204806.1898-1-shentey@gmail.com>
 <20250708204806.1898-4-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250708204806.1898-4-shentey@gmail.com>
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

On 8/7/25 22:48, Bernhard Beschow wrote:
> Now that the existance of a device tree compiler is enusred, it is possible to

"ensured"

> always generate the DTBs from sources. This avoids checked in DTBs to become
> inconsistent with their sources.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   MAINTAINERS                          |   2 +-
>   pc-bios/dtb/bamboo.dtb               | Bin 3211 -> 0 bytes
>   pc-bios/dtb/canyonlands.dtb          | Bin 9779 -> 0 bytes
>   pc-bios/dtb/meson.build              |  16 +++++++---------
>   pc-bios/dtb/petalogix-ml605.dtb      | Bin 9882 -> 0 bytes
>   pc-bios/dtb/petalogix-s3adsp1800.dtb | Bin 8161 -> 0 bytes
>   6 files changed, 8 insertions(+), 10 deletions(-)
>   delete mode 100644 pc-bios/dtb/bamboo.dtb
>   delete mode 100644 pc-bios/dtb/canyonlands.dtb
>   delete mode 100644 pc-bios/dtb/petalogix-ml605.dtb
>   delete mode 100644 pc-bios/dtb/petalogix-s3adsp1800.dtb

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


