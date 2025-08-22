Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9FDCA0EEB
	for <qemu-arm@archiver.kernel.org>; Fri, 22 Aug 2025 08:02:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1upMjT-0003ZO-Om; Fri, 22 Aug 2025 04:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1upMjR-0003Wf-Iq
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 04:02:41 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1upMjO-0003cy-ED
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 04:02:41 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45a1b05a59fso13224245e9.1
 for <qemu-arm@nongnu.org>; Fri, 22 Aug 2025 01:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755849756; x=1756454556; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A+4/WBKGEWM/opyyZP9r5fdXUjGZcK4fRqjRViBp5iY=;
 b=jTwSK5V6V4pGAIOgecqTrvqHub2zPV0A6LTsmRxN9udXxhDvNCl3qfaQ/CagoZlOq5
 zxU5wSGO7Zub3odchO0blrrPI7a2WF04ar6d5LMll/toQj019Gmk7z034e17CxORsFw+
 pWVaot5LudrnbvIlXIbru0jx+D0ATSMsAoPI4WNVnlMc914G9ytmTYWYy6i1dnuqxFnd
 HAVQYwQRcjcySICwfuO7w8HEiJ9GTDJItVw6sCRukEzNJ3hJCueyrF3BDZiGM/wuhZ3s
 g817Rh9skKyzTNp2Hrg1IO7V5uf2Fk5RIsIWivj4ODnERHgp7rM3cLVq1kyH3etjYBK9
 svOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755849756; x=1756454556;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A+4/WBKGEWM/opyyZP9r5fdXUjGZcK4fRqjRViBp5iY=;
 b=j55e26vONJVFEw8CP7ZiRU7LnN6EGmLkqPxl27ExXnOAyFvNphNUh4V4IGy+oAi6rp
 qMMjwueYfekaDZEKzih6WHj84XTOyvmX7NobTGEtoAUYE/jI/VE+GV2wioxOrCCqoxfE
 Z6XlBOjL47R6M54zyddyEqv813pgRmDWIDuwN6WWtsxq+OFNrN6jbzCzc6jJogHddevG
 y6fkAj73JhVHbzgDDbJLN/05Ggoem1pzqc5RShyeQDXg8hmoAW4wzFWM+IroQeOFIJwV
 Av+TkqgZEi4blYS9aEnIEnNc2RD0Yn/VyworBRZldXuLmV3zbdrTeO3+L8L4BHjZSh5y
 qGRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVU7KVYtuyzBEn0+U7HNiTssqpL3Dso1DHlKrpvnTSiyaeZqJ6aobIo52aiAMT3VPaoFVdgz9hBiA==@nongnu.org
X-Gm-Message-State: AOJu0Yw2rp/+JIZLwCBUDq3rovhOFveQ10FlECEQ2qh7kchf7TxeLeBt
 dP1IejFjA+/UN36jxZcI1PgCLjQdR5bWBcQb6pWOk1bl2Xu2GQIcXFTHbM6SopYI/Q2iO8CbqTJ
 gvOqg
X-Gm-Gg: ASbGncvLwrVIfDnsCTmXn6cs+Tkk1kKGM+JjY3e08YZObdoLA0AhyRM19fmBILUsffq
 ii1YDFP3wKUbfq/2faJQWnnwivMP2IzAchYn2GmsyOS1TOSj/q2Y9EVZU2a0OqS+L5a5XBatf/b
 n3IgLoi2p5rh+Uv46YdcHO0JgRSEbGOnz0C3gCvMyA/pqNfNXbmOyfCIPl2cgMfmD3vSdh6tfQi
 UJpG5cTYIt4LQbjVaCfKk1JVOVPUDo7yQjtjGtOu6IPmFdVIen7csGgeoVh8M0h0qk1knWYtwkk
 GmFA61t5tdw8j3yh6M2mYvC0o5oC0jf6BYqTKTz8mtTXSvhen6Q6DfFUcFeEmMvOBrZEBQJ19rI
 rpZe6g7fK/kjsqIw11hIyNC4RfjsPQaYjTzwR/x7uwJuFkLHVLbbp5zaA9vwXRQkcEo77PmE=
X-Google-Smtp-Source: AGHT+IFMJdBW65LiBqa5J80WZOoICcRQlDlEwNDsTGppq+c4NdVMX4PTgbObSUQSaupLNKvRcFceGA==
X-Received: by 2002:a05:600c:3b87:b0:459:e398:ed89 with SMTP id
 5b1f17b1804b1-45b517993dfmr13951975e9.1.1755849756166; 
 Fri, 22 Aug 2025 01:02:36 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c3fab22726sm7767025f8f.37.2025.08.22.01.02.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Aug 2025 01:02:35 -0700 (PDT)
Message-ID: <19d8291f-0fab-4d43-b6d2-5e48457cc3a1@linaro.org>
Date: Fri, 22 Aug 2025 10:02:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/char/max78000_uart: Destroy FIFO on deinit
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jackson Donaldson <jcksn@duck.com>
References: <20250821154358.2417744-1-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250821154358.2417744-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 21/8/25 17:43, Peter Maydell wrote:
> In the max78000_uart we create a FIFO in the instance_init function,
> but we don't destroy it on deinit, so ASAN reports a leak in the
> device-introspect-test:
> 
>      #0 0x561cc92d5de3 in malloc (/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/qemu-system-arm+0x21f1de3) (BuildId: 98fdf9fc85c3beaeca8eda0be8412f1e11b9c6ad)
>      #1 0x70cbf2afab09 in g_malloc (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x62b09) (BuildId: 1eb6131419edb83b2178b682829a6913cf682d75)
>      #2 0x561ccc4c884d in fifo8_create /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/../../util/fifo8.c:27:18
>      #3 0x561cc9744ec9 in max78000_uart_init /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/../../hw/char/max78000_uart.c:241:5
> 
> Add an instance_finalize method to destroy the FIFO.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: d447e4b70295 ("MAX78000: UART Implementation")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/char/max78000_uart.c | 7 +++++++
>   1 file changed, 7 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


