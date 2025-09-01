Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8406CA0FF0
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Sep 2025 20:49:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utBS5-0004u8-PV; Mon, 01 Sep 2025 16:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utBRp-0004sX-4a
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 16:48:20 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utBRl-0003Bf-H4
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 16:48:15 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45b804ed966so13861785e9.2
 for <qemu-arm@nongnu.org>; Mon, 01 Sep 2025 13:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756759692; x=1757364492; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3vdvUl0MRoYh6CNJF+cLUcCCM1TRYlKexU5CxmDSzLA=;
 b=lLHt992Ew7T2VgIEiDWBhUp7f5Enhk/eKEB/dGFDzcvCnXLX1PEBZMhfupo66C78Re
 msI4JON7R6VtJzSyVtdaIugth5C87IoxxWTcc58iKWygdzWhUkC6PGKhuqj/k/y2Cwz1
 s5WHPRIy69GuMxVSjM2BHG4v9YtCMHGJrWbbXHSe7sQ/wl1eHLQm5EA3ud1F2wGDYlvP
 850Yfr9JWCErhY7Q6y5sN/z7KJ1lGYg8vZfPIElRCi2f7pytRcUR1zXjoCnqwgcrwGrh
 pOs0tzM9pqAB/lIMuNNgpcYIKfMIDIXpUz+SI28aaxKHIi0DJS/n5tm5Xmobojuo2ViP
 SBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756759692; x=1757364492;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3vdvUl0MRoYh6CNJF+cLUcCCM1TRYlKexU5CxmDSzLA=;
 b=K9Rld2FKfXZcfynAGQdtI2OrtvOhPJ+8XJ10JAIxfirHSg42p4cNYgU9ZCIGFr/mkM
 oghMzUpnrYS8ENVQev8gjq5I9lamX9tMWnz3tMxQuc/Oxa0rQV4b0GG7L/z9N1ZPFV4V
 rxZGlOvmoX1Bqdx+0gO9QA5ap2KUmllj2Qb08wlQyOUfAafRDkLXoiNjV5Mk7Z2IxUKO
 w4GKUtmDhK02QLtQyHFtzbs5b7BXHN0MOar3xnmx+C6VnTORfNukFUBlZzvJToUC9GLZ
 fEPLe/vwsy3z+hONc0Br8ty6jRRDu95WIYgkw2VumqpZ626AsO6S9VBIpKGFnZdeUuhy
 GypA==
X-Gm-Message-State: AOJu0YyUZMWCFRDfWF2haWzwVKg/wqlHJbU90MF24dxZlJHJ6FfDlhTE
 5/brTjkGlTWGc/rTy0W7tTeOu02YLe6+aoHUoyEMw3mAzmfdWrQa/yBmCEFkQpwVADw=
X-Gm-Gg: ASbGnctBOotp1kQx58TLzknaXMnhKLzo6Kqyajhka2i0DezPn6OHR0iLMTz4xpM6Oic
 K5oq52z5nGvuMKyY7JcfEDH8X9HkszOoe1Hqpu5pQe84ZHxtwnkNciVuXnQIUpuRF5/BTOBNpdx
 +81qglIWAAa2TqznNHsvTgEd/+xLA1ipdmbn2yB2MoyP6tKo5rx/+ITWjZ5KF9SEEp1D7J1drPb
 WU9wc5fTkQOSKitdMmsBAggyexM+60kbrPsPleMIDlCnTYEdkpf+twgYmjGbu6BqTmNX5rTfy+E
 B5LDhn0Ia7LJaWgP9lCa6ogDtnO/CfUrs4NrmqmFKSrAqO3FtqNR/dKNHDW9Td1kBP4Yhz3X8DM
 SUms7eSm3HzHy5PVgIX4/qLab9RVXYFEGBj8+/IRQUDE2h8coJqmFVUkqDPHoM2gj1cStIHmU+H
 Rg
X-Google-Smtp-Source: AGHT+IFmhBUpjsQHxpQEM3umVxEY+dvar3Qp7/hDbDGXRQccdud179UeknYpNm56biGb1k2RQPRNNA==
X-Received: by 2002:a05:600c:4f41:b0:45b:8b34:3482 with SMTP id
 5b1f17b1804b1-45b8b3437c0mr45326765e9.20.1756759691650; 
 Mon, 01 Sep 2025 13:48:11 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6db6sm267321235e9.2.2025.09.01.13.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 13:48:11 -0700 (PDT)
Message-ID: <955a8399-f5ad-4b10-a667-e0f8ea632515@linaro.org>
Date: Mon, 1 Sep 2025 22:48:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] single-binary: compile hw/intc/arm* files once
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20250801174006.2466508-1-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250801174006.2466508-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

On 1/8/25 19:40, Pierrick Bouvier wrote:

> Pierrick Bouvier (2):
>    hw/meson: enter target hw first
>    hw/intc: compile some arm related source once

Series:
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


