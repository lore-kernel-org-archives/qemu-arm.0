Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF068FF885A
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Apr 2026 06:08:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHbc7-0000yb-JY; Tue, 28 Apr 2026 02:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHbbx-0000rO-SF
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 02:08:00 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHbbu-0007Pe-CV
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 02:07:57 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-488a14c31eeso90659905e9.0
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 23:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777356473; x=1777961273; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uFU2ZGoSm/almi5MTkoDlVd5GRD8jawMKIRCUPbOpnY=;
 b=uBSJX9SwUMsZwobIDQQ0PnMPNZ2WjEm5P6859SAULbXkcXCZINkJErY0YPmnvcYguo
 kdM9uVti9pWBmbj32/XpTJfgjn8tP3VN/Jl4ANUCBTIbwkZ65W28Ll0I6J9NN1gOEYcO
 auVS9HlBb6rzc/RqLqCCC2eTS0giFZ/Lq7665yfHKYfojCuUOUDwhLS1OhhXZwi5wRrW
 u9FctW3Yn3pBCQG03vhM01gniz5/DJtUUFatiYogUsoHBieAyLDOYUymQGyH/NCkmCK7
 h++ALgFWvMtHKvg0ye0PUsWi9nvvjuSk9rQwDLFJKIUVjoWcZ70jRrXsHpLOq9kFXQXF
 3Ngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777356473; x=1777961273;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uFU2ZGoSm/almi5MTkoDlVd5GRD8jawMKIRCUPbOpnY=;
 b=kVcCh88L7a2MLOKomwHzZwG6UQVhgZpqJqaZ9pCLEU5eMHVg8qvO41KnRXN1N0QuRN
 JF3OSpaSxnAKSupkIuxg5+me/d4XujeS7s8n1CVhGibrz6pKSMfkhmJVCdu6ZbtSjRzS
 VA6RHD0gUK0quqB7jyBZiFpKbuJhGganRJZLPP7YOmqfLeZB+v+tTCDhdLMb6WoW/qbY
 rENxKNimtKXDBt4bQeYDPwUBdyVXTaW/OpOkO1ORGX6wwsZXHDawuU/+zAjWnZNI6/GZ
 W18tYR8IBHUEbQcYdE+OOhOTQbNZ1EyQSqd3KMhM9gaA0JicuUz2PTwSr1Sj+Vs8vt4U
 MDPA==
X-Gm-Message-State: AOJu0YzFZClxTbJ+8EBqhczwj0FNI9PpzCQqB+XQfwoTiQPUGKvnvhHi
 YkGw52Fmqte491vCfptYJCXgkOX7ZGjUzh1tlQJFZu/41xFU0ineDfnVxkk15oIpFL5YrC5IxPE
 Wg2A6vL0=
X-Gm-Gg: AeBDiesZ9c+RoQZd00e7+qfN1TL3aoT1tYbiDpO/FRYJvQ/BU6CgStosE0Lj2GP6Un/
 gSjyE0KoLW9/CnlmGQJ/YKtn3rGFVrXkTaAkGyE5pyDIuXAR88WSWC5NRQcc25m9fyPO1c0/uEL
 zYgCQSXRDKGhjhJyIvraa2JoR498P+ntSINVC+jEgHvrSD4+2b//sXEaZJIRkYAShkeibO+hnvM
 NoANd1hBIS5PYaeKAUdL7wNgRt5m6TWQhPqu+ybKg1nNhJaYGJHqHq6+ABgIbfSQSr0Fi4UYbCM
 ZGWuo9S1Zd1XhIRbrGMNtgQyQUyKrg/fjD+94BUHQetnqtI3bfANHTaWkR8n6zSKkqFIHgvNa09
 0up1fsEUz0MxWtHqnMfw+5SWqK8Pl5dIoEuxWSMTOAo+KtGlmvglOEgzFQy2Bu/MuOUb3TAh5oP
 6lfAq3w0o6VQXVzyKMe53iRBzMqlrzl8qkOyJh3RY7BCyMof/pm/i4OYyL97+9zoHK36KDVo1mY
 IuA
X-Received: by 2002:a05:600c:6287:b0:489:1cd2:610a with SMTP id
 5b1f17b1804b1-48a77aea9cdmr25306345e9.9.1777356472716; 
 Mon, 27 Apr 2026 23:07:52 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a773a874asm45377305e9.3.2026.04.27.23.07.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 23:07:52 -0700 (PDT)
Message-ID: <8a5a57df-e9cf-47aa-a163-845929c9e7f9@linaro.org>
Date: Tue, 28 Apr 2026 08:07:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 41/84] fpu: Inline float32_unpack_raw into callers
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-42-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-42-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

On 26/4/26 15:39, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 13 +++----------
>   1 file changed, 3 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

