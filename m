Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F6ACAC5A5
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Sep 2025 04:05:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1Gl7-0005lq-56; Wed, 24 Sep 2025 00:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1Gl5-0005ku-Iy
 for qemu-arm@nongnu.org; Wed, 24 Sep 2025 00:05:35 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1Gky-0001s1-QL
 for qemu-arm@nongnu.org; Wed, 24 Sep 2025 00:05:35 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3ee155e0c08so3983192f8f.2
 for <qemu-arm@nongnu.org>; Tue, 23 Sep 2025 21:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758686718; x=1759291518; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=h4zS7oifCFvlyUs1tvRmphy/sUcSZy9ynMvWmlsHyug=;
 b=BZxXE+GwtFF6523TpWB5g9cftZd8hltZLOTvhdVeZ0RtYEp1ow2FKVU6NjrPwqyBGz
 XNpidiVoVWNHJEbYyTSGWe8qEMPOlDjIyi1sQ/rpmNbDDG3OYoqY01hN35XYL9PPOcRY
 /oUYy+fqOCvLQU5lvE8sEkdRDfWvbiwY6qvxIpwxFuP1kiBW6pFl6FgIAX7YnjZiag6X
 ZolTHnRkkn28Sybx9kTB1YKSspPdIdIi307EFgYaBqOOLVVJo7B4qeJnc6VAACGSyh3t
 KS5GxqdNeE3uajJ38T4cVrbrGGg+MmcyvuzLULvApkalHCMIxPLodod5LRQzSzVU9rdj
 BN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758686718; x=1759291518;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h4zS7oifCFvlyUs1tvRmphy/sUcSZy9ynMvWmlsHyug=;
 b=QE3uJ9rOcw0A/L0jcj8YA30KHqhwQTuMgNT2uiZ28R4/8JmWB76dEGvDFzwn8xFx/l
 GA7gLM7Eb9sATe1uqq3xYUMqpOpUnLqSur3Bz37el8onfCXIYmhsK6Zu+8ukJlr64lO1
 4/CdsI+LBoEfkj1oeyff3Ft9Q4ySGiDWYuztK5cM5FOYhtkCYGd7/1yOuhq44MSlMM9B
 CnGkcKfkjkMDD5pvR81rc+0S43qJTxmVdIvARnV2fV1SMSfy5PT57qa5qc9A7N6rFsgU
 WXwoDrfL0Kfoh6Mc4HD0k53htqQdXAwnVCIsiHNJ7kE68n3Oy60AsEX1GRsjManSrY1E
 ZbJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6G6+zXV0CtiZHSalc+ntdWCafHuKNQtOV1lx7ErSLBJsCcRXq8qCJYcW1GDLwRo3EtDcTxMs/SQ==@nongnu.org
X-Gm-Message-State: AOJu0YxbTFFOP8yZI1O07s6XzIep4Ftpa3JaNmi8YTeJz73gsZhEKuf/
 oSecT2qUr3xqM0GXj/Wrr3XTA4udxO5O/8w1Ozd2bsoioeY3N7OYKMIbJM0HN/HrjxM=
X-Gm-Gg: ASbGnctX6GllLGCUMLQcjgfr3/pnqU8a44OKAbLh4ebEr+Qnn/LBrAAQUcTlX5sFyN4
 YCH1mmGNjZbkgUP5ixPPHuknvKhJWj2C3OBLJykOzK2F0N9QVSYJALg64oNPRKIPh8hAdi0DlqF
 PrjUQQ3aG6NVKOCVWEA4j9BH+yEshlEP+74bFLBocUa5tx227sl2bcbQg3nYNFwaHE4Aus7+0rL
 pZjRWnnl5lKSk+ZUXFyYoj03+6wuJheYRAkfDkfb49tQzadbHTgxz5MzwhOIdBosiRiBeKhtEd+
 MDJpOiwwTv9oKhS59KxAcr4l5htf8rgIUQj5lG30i5QPovM5ZdQ3+OQXg8SRRbi1zzZDBuYrj6g
 fjDcZJpTC9K2G0AXc1qqgJGn78R6l3EmlNWaaR5liuelhDyNH5bdYIQB37p9UB2veSQ==
X-Google-Smtp-Source: AGHT+IGWE/XjyQozgv+wQxz+otjx+/rcJ086sYNAiPBm+3EV8qZPZKSYwtIDkYJM3EgXxI8tHScDlw==
X-Received: by 2002:a05:6000:1789:b0:3fe:34ec:2fab with SMTP id
 ffacd0b85a97d-405cb3e61a9mr3996306f8f.63.1758686717909; 
 Tue, 23 Sep 2025 21:05:17 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3fcdbc4374csm11816889f8f.13.2025.09.23.21.05.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Sep 2025 21:05:16 -0700 (PDT)
Message-ID: <6691efc6-d79e-46c6-8b83-924a9a5940a3@linaro.org>
Date: Wed, 24 Sep 2025 06:05:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] target/arm: Move ID register field defs to
 cpu-features.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250923175751.966795-1-peter.maydell@linaro.org>
 <20250923175751.966795-2-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250923175751.966795-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

On 23/9/25 19:57, Peter Maydell wrote:
> Currently we define constants for the ID register fields in cpu.h.
> This means they're defined for a lot more code in QEMU than actually
> needs them.  Move them to cpu-features.h, which is where we define
> the feature functions that test fields in these registers.
> 
> There's only one place where we need to use some of these macro
> definitions that we weren't already including cpu-features.h:
> linux-user/arm/target_proc.h.  Otherwise this patch is a pure
> movement of code from one file to the other.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   linux-user/arm/target_proc.h |   2 +
>   target/arm/cpu-features.h    | 410 +++++++++++++++++++++++++++++++++++
>   target/arm/cpu.h             | 410 -----------------------------------
>   3 files changed, 412 insertions(+), 410 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


