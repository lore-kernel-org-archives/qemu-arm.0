Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3908473ejc;
        Tue, 17 Oct 2023 06:10:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLAyAsD4BJdtkG0dvY9gRPRsEz9zB0S0cp1yW9KV3CrQ/1uWSQAzKNvZ8bJ9ADMKQi6x1R
X-Received: by 2002:a0d:c943:0:b0:59e:8f6d:92e with SMTP id l64-20020a0dc943000000b0059e8f6d092emr2087716ywd.49.1697548214267;
        Tue, 17 Oct 2023 06:10:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697548214; cv=none;
        d=google.com; s=arc-20160816;
        b=cU7BPVTaLPu02AvRM9y/zpLpldVov/leBENH7I8YWtMSJG+AZxoRSai4RJHgxPRPsv
         8o1mzZ53D+6Prkv5+H0k7udhpWzfODaQ2qAbUwbF73z6ruvAsWmHEd+58dzfUk0MolHW
         2LhaRiIyjkXUYN7Z3Wwm6WzE9TWN2oIn2hwfbJFj/0piHFbwB4Iy/fdHg2NPwm/G89Np
         7BiBSVgkVtpHgUoqJ4eQnqmBvnaj/GX7MOJRgkeNhrmHAbV2jjhM6GDiyrmgX2+pMEg8
         6CEsmOH332C5wJ1AoLP0o9sA6/4KUqvUG/v25tIqCEP5ZjwYIjgc9hi0UUBzZD3N34Fc
         QkGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=g8tAWXTKEdsBK1MEw0rkKP83Mzkfyj0OLclN5xSYoME=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=Ra9YaKAJCGpdDA2p/a9tE+oXy2NpH9SIy5gG/35XkU9N872mc3rzOwFa5InifIA3Rq
         v85aBxS7cFT+cfFT4wAeXVrRCtTUKgzU87p4lrjcNzQybho67z+TatN5bKHNvb+SRC7+
         e8s0UEAFOsvFQu42oa+FtQ8NIDaOFY7aKiQK7FozBelzu1SyVqE1ooWZ98kOmfeLnirk
         BhiJNWMPOc/4o8BYWr3FHeZ4veBB82Y5kSlCmPTPqHhyui3s149P6rU7189jiyWk1c6q
         krMe8o5Gsnwh0BAxNK/3Vj5eJdNylklG77HxScr9XbaaSOe3NivKJaCsIlWTioxZsS6C
         0Irg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SKbwTxD7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l19-20020a67ba13000000b004527f5615bbsi112974vsn.206.2023.10.17.06.10.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 06:10:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SKbwTxD7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qsjpi-0007lj-4Q; Tue, 17 Oct 2023 09:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qsjpg-0007jK-0Y
 for qemu-devel@nongnu.org; Tue, 17 Oct 2023 09:10:00 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qsjpS-0005t6-SM
 for qemu-devel@nongnu.org; Tue, 17 Oct 2023 09:09:58 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-507973f3b65so6612012e87.3
 for <qemu-devel@nongnu.org>; Tue, 17 Oct 2023 06:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697548185; x=1698152985; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g8tAWXTKEdsBK1MEw0rkKP83Mzkfyj0OLclN5xSYoME=;
 b=SKbwTxD7qHqkoIf9Ila/QEsNN7l+xqWAl9AyTg4L4x6neCYO7MVd3aypNCNp5h+/2d
 hAOv5PZUq28xnRe7pIJUrVjFsNgqCT8tEaeoNMWq5RJWP5hB68dTrfBKUUeiCSAI54Sy
 BKTxDba04QJRwTMFyhB37U123sWU/19HHncv/11LOImguPfxOE364rHog1ZfRAd1qKej
 wujSHSK7OWAkg1vGwr8284SG1JF1ohsEkagDGYkAeeGvTEGhRRixY5m5t8LsEGPOuZjM
 okJImXNfQtEdNcYOAPPftShC/5hoIEPedYIk2yuQekpNH3rrEo3hDJcJ5bLZqHuu5L7d
 PcEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697548185; x=1698152985;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g8tAWXTKEdsBK1MEw0rkKP83Mzkfyj0OLclN5xSYoME=;
 b=YuMA1kTUMfoLK/9QpNNq1r1CN3IlT2Sg9XsTZAu8tCVfcOTZGQmtg7zpVZ2dVFw46w
 OIIl9xNF0MtvUCHgsYFADy4FEWdXXa+2YhXjDJnpdSk9eBL+GIb7xuuFhaWLmjfcDlX4
 U9Cq1zkfqzZO2/muSI7yw1XJxrW5Jlt38Co6GCetEioMPYfFHsCpPwzwSSYrLgHyYXUB
 0orLsd1fPQeokTl1V1nNxZ3CCIGqqsLb6Egl7StOHth10WWBrgyg1cAVLMOHPPmrYW70
 gkj3hj44OIQnD/VFKbzzZOi3wIqYEVgfgOWlHIEWpoZVxvM8tcoPRZ4MqEqxq8pl6aIB
 MK0A==
X-Gm-Message-State: AOJu0YxdNQVnXO9UhCNDjaQ+a69AdC/TgIY4QIYB+YvRT5jSgj2Rx7qT
 RxTuy+0Y3k7F9CmmlVRPvb8jLtRPGznO/mQAwIDqXQ==
X-Received: by 2002:ac2:4570:0:b0:507:ba75:b016 with SMTP id
 k16-20020ac24570000000b00507ba75b016mr1725739lfm.3.1697548184717; 
 Tue, 17 Oct 2023 06:09:44 -0700 (PDT)
Received: from [192.168.69.115] ([176.172.118.33])
 by smtp.gmail.com with ESMTPSA id
 az14-20020a05600c600e00b004063ea92492sm1901507wmb.22.2023.10.17.06.09.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Oct 2023 06:09:44 -0700 (PDT)
Message-ID: <1002f770-525e-872f-dd6a-8ce713ee6f8c@linaro.org>
Date: Tue, 17 Oct 2023 15:09:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 6/6] hw/input/stellaris_gamepad: Convert to
 qemu_input_handler_register()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231017122302.1692902-1-peter.maydell@linaro.org>
 <20231017122302.1692902-7-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231017122302.1692902-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aIC4rkcGvZaw

On 17/10/23 14:23, Peter Maydell wrote:
> Now that we have converted to qdev, we can use the newer
> qemu_input_handler_register() API rather than the legacy
> qemu_add_kbd_event_handler().
> 
> Since we only have one user, take the opportunity to convert
> from scancodes to QCodes, rather than using
> qemu_input_key_value_to_scancode() (which adds an 0xe0
> prefix and encodes up/down indication in the scancode,
> which our old handler function then had to reverse). That
> lets us drop the old state field which was tracking whether
> we were halfway through a two-byte scancode.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/input/stellaris_gamepad.h |  2 +-
>   hw/arm/stellaris.c                   |  6 ++++-
>   hw/input/stellaris_gamepad.c         | 33 +++++++++++++---------------
>   3 files changed, 21 insertions(+), 20 deletions(-)


>   static const VMStateDescription vmstate_stellaris_gamepad = {
> @@ -44,13 +36,18 @@ static const VMStateDescription vmstate_stellaris_gamepad = {
>       .version_id = 2,
>       .minimum_version_id = 2,

Updating the migration version:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>       .fields = (VMStateField[]) {
> -        VMSTATE_INT32(extension, StellarisGamepad),
>           VMSTATE_VARRAY_UINT32(pressed, StellarisGamepad, num_buttons,
>                                 0, vmstate_info_uint8, uint8_t),
>           VMSTATE_END_OF_LIST()
>       }
>   };

