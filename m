Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49FCCD4F21
	for <qemu-arm@archiver.kernel.org>; Tue, 12 May 2026 10:50:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMkgg-0002On-1U; Tue, 12 May 2026 06:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wMkge-0002Ny-P9
 for qemu-arm@nongnu.org; Tue, 12 May 2026 06:50:04 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wMkgd-0008PV-4k
 for qemu-arm@nongnu.org; Tue, 12 May 2026 06:50:04 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48984d29fe3so56940695e9.0
 for <qemu-arm@nongnu.org>; Tue, 12 May 2026 03:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778583002; x=1779187802; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Tn0MFdlV5PVM5AdobLMnFcTJArdAB35dceBWJiLcJDE=;
 b=jaYnHVKaG/ph0BfE3Rpqlg7OVjIVJywcdL9hiSAkq2zo+ZMZy6LVM6cQ65zZmKY+mj
 mqxuazai73ARA7SjAWKobnpdOl6UetMqdbsR8qjzBwVYxvys12f6pPXJHazlLHsynwUX
 0miU5NJ99aeOA6IoB65AW8slaW7FVvkiuYLFOq35F72NdHoDKdTY7RZvNexaiO4aRG4Q
 FCp1zAxMi2G872DciZ+hzOHphzISTQPTjV9lsADJgg377jcKvvm4W007JFtiiP5H/e7M
 YMAup/Rq62iY68uLAt9LmjBA2oB1wjKvJjCsde4MQrhEK6H7LqPv3CegmPmM7QicL8jJ
 EpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778583002; x=1779187802;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tn0MFdlV5PVM5AdobLMnFcTJArdAB35dceBWJiLcJDE=;
 b=MeWbxclUKz5FXC8CGzb88TEkWQgMp5pwvQdaemGbXic6zB3tDMoix44sjSw4fKLZwa
 jXF1K8NcXudKIqy0fWZgx3feWPJWDDfAcJNumE7Xjk9MUjRsKR1ZrMxLkpcLyH+4uz8s
 PQG1KBeUVHCb7vnc2CEPfRUGVbZu2dpTIUOOiGQhaRyDxO2rAAM5U86K3lw26ImUURgs
 34pa5yOjXeib5AXyS+jhtIdPVQKkE37VQsnKGr+OpCoVaFIJHY0muP6YhlLVROz0VEEN
 g4wEo56+ocVRehpLjOD1PtfcG8wx1Wc0IIoNRcc0poz1CSG/rpjFI4/6oIldLHYVx/5k
 OOtg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+9irT1mdXOxRlLQhLt8sYRnUUvVCVPdSFss04Vc9R4/QqHW9IUjxnms9Yl86i/QOLHQb8amqKjUw==@nongnu.org
X-Gm-Message-State: AOJu0YxJPCCO3q5mG02onMQGr/9aPvGMcHT0CZRbG5dPvFUJWCztkWi8
 y1hRvzCh3GlUC71u9YtY1qnIjC36SkBPWUYRoY1onJUeAB8pA8n/ZCOpec1v3jY2Ed3jtOfvsFZ
 PjD/BxGM=
X-Gm-Gg: Acq92OFVrjpVzmobnJTCwQOVPSQqFHhdQEf0+GQPa1BwQNA+aGKYAktfbuJeTc77ZG3
 X5+Jw3wQ5NrM91tkRb9ai1atvd3TuhZEs+iCvHBX24KrzkzwJRDV5Yne7Id6x+bIV9jMHMpIB14
 GhxZbaCH6H4Yr9NcxjSa2OXLHn4sGrmmNHjVYs9APe8Ft8F3FfWBMxUz07p5HLXgvgfYDZlWFUX
 VhD8mJq4T2paPSeekJ27mhbDIs9AwxEYcCMtwZhv7O9QcD7B7tvY6CBqmbQtczoymhgqD47dMc5
 tu3xQdBDQzITpIHNDf+HIgyeUq4fHqCaYlCsrVYwgHDcIAmTZUKQXeewG+VKrqabSzdMdTMnUqA
 oZX/R+YA1Vp3ogHXAnfwPjS/vZ/T9a+j00say29v54NjKHX0DxcO/XcGJohZFGkMI4CZ2xmM9iY
 Oit0AEaZEfkzXmKI8sAecDjCwB46MnDcAGU3jGaMoJAEn1aqfUXPtMpuXe0cu19egl8Q==
X-Received: by 2002:a05:600c:198a:b0:48a:89d9:a419 with SMTP id
 5b1f17b1804b1-48e8fe52c06mr39970355e9.11.1778583001713; 
 Tue, 12 May 2026 03:50:01 -0700 (PDT)
Received: from [192.168.69.200] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e906b5c20sm34613215e9.8.2026.05.12.03.50.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 03:50:01 -0700 (PDT)
Message-ID: <626bf38b-6471-4398-9f6d-225e6aefaea8@linaro.org>
Date: Tue, 12 May 2026 12:50:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] hw/intc/arm_gicv5: Add missing early return in
 gicv5_set_handling()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260512093856.3197700-1-peter.maydell@linaro.org>
 <20260512093856.3197700-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260512093856.3197700-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 12/5/26 11:38, Peter Maydell wrote:
> In gicv5_set_handling(), if the guest tried to set the handling mode
> on a nonexistent SPI then we print a GUEST_ERROR log message.
> However, we forgot to then return, so execution continues into a NULL
> pointer dereference.
> 
> Add the missing "return", bringing the code structure in to line with
> the equivalent parts in other functions like gicv5_set_pending() and
> gicv5_set_target().
> 
> CID: 1659596
> Fixes: 5beb48ab53d ("hw/intc/arm_gicv5: Make gicv5_set_* update SPI state")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv5.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

