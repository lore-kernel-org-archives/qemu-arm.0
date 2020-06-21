Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2537845lfm;
        Sun, 21 Jun 2020 12:10:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEOYSoKjeKNZuUUG9IwzfmkSo4pr4xOHYxcTONWwshTA7ryAsLytGdwa+Kxc7kwupZ9F3Z
X-Received: by 2002:a25:ed10:: with SMTP id k16mr4656741ybh.189.1592766603559;
        Sun, 21 Jun 2020 12:10:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592766603; cv=none;
        d=google.com; s=arc-20160816;
        b=bGfz9ewO4TEQPkOBg6aNeH5+kLR6chPy69b+zHLT+gwvNu1Bp48VLxEx2d5R+Nas3s
         81/MTLT8JAN1DI2xwgEzRNnNrgtsYuo72Rdi3OJfyQ3pbQPPp2KzvilzWd5J7wRnBC4q
         9hiU6ZwRH5REbh044S28jdCfgH5lJmRLxlMIIpUrCwytf26Ettudv3w9FML3FXN5uf91
         Vysqx0+0e9/WCYXwXPQx1B9cN0yFzdEdzyatpaXVLHigTmOna9aWtkdCPnV5/vIvTUc2
         U6bG2/G9zbGqyKUovXirJNatBzq0MMWvRQkB9DUJP86uKwbHzRZRRv03G2VFbzKRuz7w
         Q01g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=CGILvny0GIXQuYHQTGBIJ5r9ecKvkxWNMFZqwEPiK8U=;
        b=GdEXDp8VxGLnz4WRYPhtwQQMYMJOcTbRknDdyz08HtZpLVsmxl1PaLWW/WbV79XYMP
         G9rAR9UgP7zgH0iQUHgJL2KefUOXkYARtqpfB7hVJVqN+nDexnFC/Hy4a4hEiT0BOcFE
         tQN8glLQcm6cwPd8n8OJPOZwDzG7hgSqwVM3J31rsMVlS/Tv6iqJpyb7/PkLxt/s+j23
         RGjLjM3hOYoXNiYRevDiDwYiuEMjGaTAC8RUwqX1hwIBpZmehJKW8q7SgTUQvNTqbjr5
         qN8f4cByZOSZuVze3d4x4QGRPq0WwNiRtL/tsYEZa0+8Una4pT0Ej81Gf4wf1q3b2cUb
         XBlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YCyFF1Ov;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q12si11198032ybk.171.2020.06.21.12.10.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jun 2020 12:10:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YCyFF1Ov;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jn5Lu-0002eo-UR
	for alex.bennee@linaro.org; Sun, 21 Jun 2020 15:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jn5Le-0002dK-7Q
 for qemu-arm@nongnu.org; Sun, 21 Jun 2020 15:09:46 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:34228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jn5La-0005pt-SU
 for qemu-arm@nongnu.org; Sun, 21 Jun 2020 15:09:45 -0400
Received: by mail-pf1-x442.google.com with SMTP id z63so7316515pfb.1
 for <qemu-arm@nongnu.org>; Sun, 21 Jun 2020 12:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CGILvny0GIXQuYHQTGBIJ5r9ecKvkxWNMFZqwEPiK8U=;
 b=YCyFF1OvBgwQl4VU6tFDBzYHzAoHi4qUMChs2S3WmugoLsG6Oa1nzLYpM40CvIkG9d
 AW7BE2RRn3sEwYN8um5/9fi3BVKYdkUHtzEqU77ghlT47CoQaUvoeebV67AkJNJTzqS7
 +3hvGRdFb9EK1kPHAg2pCZbgexbuvRwFUlsGVRKlHZ2jkPcuXiYqh9dHdDJOxUbzCmGV
 LBARWQPINkLy/M7cemiNw8odvGM9a/nb3dj7/46x9rVEgOTA2w8U1fRA5OwkA5ejNXeI
 zgtQOYkKU3g1Hdzk2rijDykfqFfT2mXX3jiKbkjIDLxx8vdPUpzuiQB27tJnuxFqtKsj
 6GhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CGILvny0GIXQuYHQTGBIJ5r9ecKvkxWNMFZqwEPiK8U=;
 b=IDON7yRa41I6nl9SKjkcDnKmgySjFpsB05P3zUDkI20xOQFmg/hUmT/4EnWk/sqNH4
 ECquOYtu7c0bqN0F3gCBbF8p3U12ZhGYG6vuRRZY9YwYC0aFn5/hETIUqagv0gVtZpKT
 hIIA6I/IYHoRIDZ6XvSjs9UXRxc7MrSN8liIL//jB3mBJ9zysCvynta4ccOPA1JldstM
 PbnsbzblSMWeZI+uJeD4elsfXxVgD0Ahm7wo+LRQt792qyq3xp0/pTyKw/7LJ6nJxe1G
 MFP7YRKwZrwzaCEKxvp6Y3I9JHDHx/RtG+QGrdWHOe/HAqqGwFCi1yFrCa4lzOMjbB4Y
 r+Iw==
X-Gm-Message-State: AOAM531dvYVrmnUH9rfXjxB/qg9Ry+LmDfvS/Qq3jNJBbKu6Tah1uIRG
 6Rz4J0Hsqmq2s/weOivPMu+0LA==
X-Received: by 2002:aa7:96ac:: with SMTP id g12mr17073788pfk.193.1592766581402; 
 Sun, 21 Jun 2020 12:09:41 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id l83sm11717579pfd.150.2020.06.21.12.09.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Jun 2020 12:09:40 -0700 (PDT)
Subject: Re: [PATCH v3 2/7] hw/misc/led: Add helper to connect LED to GPIO
 output
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200620230719.32139-1-f4bug@amsat.org>
 <20200620230719.32139-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0fb2c123-72a7-52ff-a9d8-e3d74f6a9ebe@linaro.org>
Date: Sun, 21 Jun 2020 12:09:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200620230719.32139-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8NNR8meqdncb

On 6/20/20 4:07 PM, Philippe Mathieu-Daudé wrote:
> Some devices expose GPIO lines. Add the create_led_by_gpio_id()
> helper to connect a LED to such GPIO.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Adding support for named GPIO is trivial. We don't need it yet.
> ---
>  include/hw/misc/led.h | 20 ++++++++++++++++++++
>  hw/misc/led.c         | 25 +++++++++++++++++++++++++
>  2 files changed, 45 insertions(+)

Modulo my question re colors, looks good.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
