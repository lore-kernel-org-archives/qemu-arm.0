Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198BCFF885A
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Apr 2026 05:56:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHbQm-0003SP-KD; Tue, 28 Apr 2026 01:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHbQR-0003Gp-Le
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 01:56:07 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHbQP-0003A1-Bv
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 01:56:02 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-488af96f6b2so144624045e9.0
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 22:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777355760; x=1777960560; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9ACBbrxXxUQ2STFHLM46XTonI3ly/vyfZTDjx+AD5bI=;
 b=PbKlwgw7eHoX5Xp/2LNZAJMxJ+GmGC88iNzQBbP/l4gavNF24g3gW9ivkwjWGRIMt5
 +5rhPcqtUU8+nQoL0iWw1H5Az5EyzP4GqQ13uNNXLZebti2PDkevQzzcfmelFCWTv+4o
 kuH4tz7VYCSaF4TnTZlPWZ0h3vZ+2xMUy1SzbD8BTBlG3+pjHSdaX0mwwp2wlnXdrXAu
 N+XFo7unwOfA+0zeH4Vg0MQSXajzN4nXlXxnE8m/RGm3HUJC+ylA7SUm/OcEbgy1bWEC
 hSaYH4N1LmrtRC6/k2fEmTVS/UI6FIT6fdknuVCprL3La7kOBoYC27ElcXFmqBXzZjRg
 QWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777355760; x=1777960560;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9ACBbrxXxUQ2STFHLM46XTonI3ly/vyfZTDjx+AD5bI=;
 b=JxJH2+mAWPP3VOFV/5Ifm8maiavVnbv9AsTuikj30O0EwTzE94b/Xo+OVeuECSbwgf
 H2w9OMfj4RoRck28iJnPMCPlOimtvf+7VetTU1qfBUm4zI/58L6Hm5buVv/bJApXJU4n
 uF+hzLcXEfWqgCF8wxg487UkmwvaNzMq7q7CM0E1szOMys/AZ4csa4eiRCipEPaamF3f
 8jBbmOLEjK0Es09XvsL68KimOt8HeC+ZrxXEwTySrdKFYxUtIp0gmoVMLhhZapMmcghJ
 2t5brbwvszhd916ZwuuszcNme1NzgxU+6eXPmRznLE+4FPF22jFKCASos+F9RGa3Phqm
 s+ZQ==
X-Gm-Message-State: AOJu0YyaVnFCVZFszwCu6Q322BYP+k4en4HJgpuHAGSWEnEYGzztQke9
 jjtcX8BpN4FxIili5B4otiMVJYzJiyAG+Jxjmb0dmWGZlD09OlaRhua6ncJtHevjXDs=
X-Gm-Gg: AeBDiesCNQkq9IIrI6ZCKH6sNEskbzqZS+fE3oSWR2TxFbBNC8dP578NhBZYF/q0ryB
 OZ2ZJKykmLP2U+sVcpO/zqxHDd7vECwy21nT45eGgRhBLVe1Nvk2bo0KGEL682AcNYRiNl76cgn
 aw5i7f1GeaZejYtUQOF/lsEQIkMpAGAoqdfxRC96gpLbgQ58tZbW709xsB6DYDgKxKci7jmzXxC
 lG8ZnTsvJ/HWNvm85NYeKF0L7FWdR4tOhygYY0Ph24TmfT7A4dzf6JTt7cNlIQbPGuHm8gNzXo4
 iKIjL7thhgmdoc5KBGOevtSgQyf/DrRVCwo0dUf2sdPlqA7ID80UYcJj/9jrT6Kqabt1roB1RMA
 zwTY93wPdSkLklM6wnf5QhWrgSfQ5ONNEJ9wHj6VXp2cy/mnXelEdN24AgKh9o12YGhNmFWOlDx
 4Qtuj9fdFySmxPQGzKbbFbQIzUV9qpHrXabD1uXicpIQU/3PngHNo3siKJsD8QU3MudddgWVjrx
 IBm
X-Received: by 2002:a05:600c:8208:b0:489:1c1f:35f1 with SMTP id
 5b1f17b1804b1-48a77ad5f64mr23420035e9.4.1777355759693; 
 Mon, 27 Apr 2026 22:55:59 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a77afabcdsm44800605e9.8.2026.04.27.22.55.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 22:55:59 -0700 (PDT)
Message-ID: <363d4325-bc90-4706-ac85-0011a777df91@linaro.org>
Date: Tue, 28 Apr 2026 07:55:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/84] fpu: Drop parts_minmax
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-25-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-25-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 26/4/26 15:39, Richard Henderson wrote:
> Use parts{64,128}_minmax at each call site.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 18 +++++-------------
>   1 file changed, 5 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

