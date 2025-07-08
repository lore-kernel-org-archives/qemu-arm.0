Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE59C83F09
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 20:49:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZFAf-0003tN-QA; Tue, 08 Jul 2025 16:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZDdo-0004Ea-0j
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:06:12 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZDdj-0004B7-Bf
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:06:06 -0400
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-6facacf521eso49521686d6.3
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 12:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752001554; x=1752606354; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VavxpCGYW3WjRI/O9ptGzHonaVxScT/pqQ/nt40jf1E=;
 b=kH9lPUB85gOem4qZ6LiVYhn92FvPdSJWs+7LiJTgxA8dRcSQT72rzWZoHO8BOXKjUR
 1eMj65BdHL//DUvUdLtFu1dNixJLVPIK2phVKajMPzL/UjkBwJSKoezeWmwmeNznIHll
 FeTi32bxerF+TdWPPcdJxNyQa+9166z5L40612NNS0Lk451uxdhq1k3Fa1jN0oRL6rmw
 u3y7HrvD/vuB8MaUjRzmdlkdqnZwj8b4YyHnhbjapgGGRAE86OJY0/EyJk6egS/sCo7O
 J3bMXaB9suUragxAPRF/zO6A6ZQDTEx6jt9p4lHzOMMOKF0sAhbX+8gAbMiZst4d6S3z
 ZuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752001554; x=1752606354;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VavxpCGYW3WjRI/O9ptGzHonaVxScT/pqQ/nt40jf1E=;
 b=iFHWKLZPCSSvmEXm6L9ynpsOdzajqGFQV2Qhsw6T6FdQDWIqOf32Kj+oX0dixXO79h
 UD+ILspfuguP/5skHBhmMT9VvHdn8Kl2TEaTcy11rDXQ2zUpTUbuYHcgvkMxru9r6KDR
 +GCTQVYxAzmHcLDn+09U8isqKOiF1T1cvofTY6UDESi7acIjPlqdYSEYMSI4u8Zp6Zq1
 SDEtdtZ/kHOoXlDUHKKUQmPSBBPrYzUMW8cdLriMHXNTbwaLPaOCFyakJMNOI1lxDAzO
 wEshUMroiV1wZg/YhmeM5Uj9umQ8Ry5TzSyHeLerwlyPFi8Uf0MXpN4cbyvXhXGHwQ9S
 w9ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+sU6QlkSzZTWdLKuWYwB4SsMUnsDgxe/He/uT0EKW4vJ2O29ctdWyvIPafcQqcipSDRQ/cy1bNw==@nongnu.org
X-Gm-Message-State: AOJu0YzczExeP32yUPyV2HA0LgtymiOMXCWwoBx8uVaeZzuDRUsrYSeu
 W5u+gAmgE0cpK4TxFTlOu6PTOCs1OW+TmWQ2jx/S+rwO7gxU1EzyCo4fN4yGiwXGEa3vtLJQM5F
 kHcNQ
X-Gm-Gg: ASbGncuimGKc23QXJDbqNxpFEP+YNd5f0F+FQjq3XJj9+wNAQ8Ck5zjEzyvfXRH4CGO
 NXXLP/IavBIV+YIeBL5lXoHTPLg/m50ybTz76CyLFjTK529kNfHUtPpDfa87v2YPGDXoTqRX1/S
 z6t6c3PRmFrL9vDXF8sxh5lhocoeONxZneaIqB5BFNyXX5N1YTwuRFs2937fGDSs/E58sHfulLp
 U6BQyr9TMzC/M077qrasKPULe00WXQkwQUJLwrqL1AJ0wK9IKanoMI/QULqULf1qJ6O+QV8e5+L
 ox2hGgSFcQ9N7SGNR19obOiKuFU77hmfXPiG/PXcozK4f5cNpWTNtVrtf4SHBAzDAIX7A1ERl9A
 =
X-Google-Smtp-Source: AGHT+IH1TrqVdDZnL83UmlKP/eSa5V6sbdZmX/YtS9jzCRhNDrXt5cY1wnW4fzua/yxt3ZWtWHOZeg==
X-Received: by 2002:a05:6a00:2d8f:b0:746:26fe:8cdf with SMTP id
 d2e1a72fcca58-74e4162eb0dmr359749b3a.7.1751996013912; 
 Tue, 08 Jul 2025 10:33:33 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce417ddc9sm13152318b3a.105.2025.07.08.10.33.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 10:33:33 -0700 (PDT)
Message-ID: <a53d8594-3311-4b34-bef8-ef66c71f9b4f@linaro.org>
Date: Tue, 8 Jul 2025 10:33:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v7 5/8] qemu: Convert target_words_bigendian() to
 TargetInfo API
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>
References: <20250708171949.62500-1-philmd@linaro.org>
 <20250708171949.62500-6-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250708171949.62500-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-qv1-xf35.google.com
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

On 7/8/25 10:19 AM, Philippe Mathieu-Daudé wrote:
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/tswap.h       | 13 +------------
>   include/qemu/target-info.h |  8 ++++++++
>   cpu-target.c               |  7 -------
>   hw/core/cpu-system.c       |  2 +-
>   hw/display/vga.c           |  2 +-
>   hw/virtio/virtio.c         |  2 +-
>   system/memory.c            |  1 +
>   system/qtest.c             |  1 +
>   target-info.c              |  5 +++++
>   9 files changed, 19 insertions(+), 22 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


