Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4081846njc;
        Mon, 26 May 2025 02:41:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVdKEN0NlzNcV8cee852x28yrKIW9DKciXZ1LrVPTqBhyzXztkvQjPuRwHF+Mb7TL129B6xNkYTJ+4xCA==@linaro.org
X-Google-Smtp-Source: AGHT+IHSFtRsdbAILPx9k2PVpNMXwXhzMD222N8AXnW8zk0A9lL4YZGu3WR5If1EI3VcnzGglab8
X-Received: by 2002:a05:620a:bd5:b0:7c5:6dc7:7e7c with SMTP id af79cd13be357-7ceecbe705amr1137611485a.26.1748252502566;
        Mon, 26 May 2025 02:41:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748252502; cv=none;
        d=google.com; s=arc-20240605;
        b=KEFw7KXkI/5P8acrLcKOMPs0gxLiyL+NM3NxG6KSO58ec8tWpW+vI/G9t+9b299N+j
         o8VTN/P5sOc7lD4Pqdb6TDWo4HjyCwn+fhCIERQNAhBmcEhnbmMGz+a695wFOsE93MIp
         bzXFiy8dl9/AUXbq2rRKsYYzGz4ENvzNqce2X4W+Wua27xshhgoAlabmFASe1YeclCw3
         qKQlFt5N0ntqlBSgKV0OeRuxKpVfZ+2qeEmkIo9lYSyOwo/FLWr/lRNSnYFFCqRvfxBl
         SisIhkzwk5PrN3AzC54k0iVrMqNfLpH4K1FvosNSVAQCOXBdbMmk3KR8fBQRqTgDo90p
         Qc4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=o/3OyUiRP3KARuilfO7gfosU/5cLNdYR8AB7wqy3SX8=;
        fh=zEcev5E5e9bVvXudYswPKnK9xAQ+I1x7YYqbhOfbOx8=;
        b=bJoExjUfNmvzEe9EKgd+urYwLXliOq3XkH+VszbeQXK3c6KiX3yPsdxr58t+XlKUKy
         JTZM8qaPJYfhVksw9cU5qdizX9YZDzjOKR4HWJV9fuLKD9tipUCSUqLm78iWFwLYxyaZ
         OO60v1UMvisDFGhov4Wong2zVYZdZY4CuIXc6W7o+msxG21aQtA94LoP5n/b1dFcO2Kl
         9zZlQwsfNI38v92BpoX/FHj0/flFyoMKTAKIwFNqmTuxyLxfMfuc8U3UL0tUPP/fFTHX
         wXsGJP2FWmpWrn6E0O5dxeW2tD7YZ1QVTDTt1oNxLKaYYkvBTv4cjK2aJA607HN7mV5T
         EtqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vx3pHdD1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd467e93f6si2585269685a.195.2025.05.26.02.41.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 May 2025 02:41:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vx3pHdD1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uJUKY-0001q2-8t; Mon, 26 May 2025 05:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uJUKP-0001pT-Pq
 for qemu-arm@nongnu.org; Mon, 26 May 2025 05:41:07 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uJUKL-0005uC-5N
 for qemu-arm@nongnu.org; Mon, 26 May 2025 05:41:04 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so15140585e9.1
 for <qemu-arm@nongnu.org>; Mon, 26 May 2025 02:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748252458; x=1748857258; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o/3OyUiRP3KARuilfO7gfosU/5cLNdYR8AB7wqy3SX8=;
 b=Vx3pHdD1ulAckp3lEs05E/L9tcEij2BciLJhFGdZHcjTqde3LZNQ1+f+jCQkFU2iB0
 3mTAvG5zxpJj+Hazvp1PqWXCVLS1StH40L22B/icRr8o0PWvJnmE3ZnLgGVwyZv1g1WO
 1Tn/6UiyCXY9bCBoRz2iR7pJIznGjsGQB64VNNcA6tqG7mw2jA6/nsjykHX0YSBfm+15
 17rJJRG9rxGxFMXmayj73zz01smVcOM9PUh1VLz9B7+c/oMYT67A12hZQ2u6SaHUAUkO
 AbwjyuKO5B8LlSsf408NDaZPeDp25FLqWV6acDwAOFzx9qrLhqQvqt6TyN3cmg6KUIVr
 x8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748252458; x=1748857258;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o/3OyUiRP3KARuilfO7gfosU/5cLNdYR8AB7wqy3SX8=;
 b=Ol0iu2akvBER4XwOL7AN5JCnxysIjaUr2zerVxtBUDEmq/0najSwwlU7r4rqGP5yRh
 WUUhdrqg+8psBd0qxODi2c5o0/+zrYDudShGWhXlOSDaw9N2p5ln9HIllU2xrrPzmAao
 XeW6D6va+AwZkSlUUo3KrdlkghiqR2fz9zZ4FgNnkDj7+yYpOBbHuTYm3iKsxjUfuArB
 3Qldov6YLtoPDcdngNxiEQrOUd/G96FVhfh1OljCufxOtdwBnGZ8cTGAvHPQBDnmUZXJ
 YCDHTWjV0fYoE0FMTrqq21FitSZD5u0JZvXojMwdBO6msmht9W0rwXx8Z0/kudTYZFXn
 zFhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu+XvWnd+hl/cs+ObqvRjN+I1KIDSEJqM475oclQoeJipxxEL2HanVUDe4jv/ZvhFl2WrL/XBGVw==@nongnu.org
X-Gm-Message-State: AOJu0Yz0ntUgQL8fYMpJH7FBBzSa9v7GBvEfdZz+4Wlxg2WO7jvAD/q2
 6Sg4eBzwjiQO/nDdTUeK0mdzONJdCXVwi39QB6901Kz+HOF4zOIaQyfAoJxtarSCSv0=
X-Gm-Gg: ASbGncuOv/p1KMllhhEOUJJ+7i+PUTfXaa5w94ALed/MHdTcC2RdaBvJ4z+97gTBV9t
 ko8bdPri/vJPWYjkBnSPFLrG43u0lsYNcKc4eFhUKJfoAQPq9lPTaZgU94kx0beuWDXRVob9+Xl
 KTc7p2IcFRaqHyRkToZnd2vru/CCdyExmFfH+BJjNM0AF+kWo8OQoOf80kk76QOEKMfPOVdJm8s
 SDcmWxVGx7GUIdOAl63upl0mhyLiqW3GJRtLz8YneEYzOycAe35MdIUNRipPaqvu+tUeel79sUy
 grJSTRH2NbZbhMhfSGfAVw1Mll5P0+d6i08bs1Pw9E1QMOe3KqSILt2wIr4KaGMmH5VupK4SAAd
 Zcn/y7bdQ+2CrEJfGa7rCIg0G
X-Received: by 2002:a05:600c:3208:b0:441:bbe5:f562 with SMTP id
 5b1f17b1804b1-44b53991a34mr82242695e9.16.1748252458311; 
 Mon, 26 May 2025 02:40:58 -0700 (PDT)
Received: from [192.168.69.138] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4d37498e8sm4522577f8f.16.2025.05.26.02.40.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 May 2025 02:40:57 -0700 (PDT)
Message-ID: <267060e4-f7e0-4540-b701-11d1d650ec25@linaro.org>
Date: Mon, 26 May 2025 11:40:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/block: Drop unused nand.c
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
References: <20250522142859.3122389-1-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250522142859.3122389-1-peter.maydell@linaro.org>
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5Ng2oC+cwSX1

On 22/5/25 16:28, Peter Maydell wrote:
> The nand.c device (TYPE_NAND) is an emulation of a NAND flash memory
> chip which was used by the old OMAP boards.  No current QEMU board
> uses it, and although techically "-device nand,chip-id=0x6b" doesn't
> error out, it's not possible to usefully use it from the command
> line because the only interface it has is via calling C functions
> like nand_setpins() and nand_setio().
> 
> The "config OMAP" stanza (used only by the SX1 board) is the only
> thing that does "select NAND" to compile in this code, but the SX1
> board doesn't actually use the NAND device.
> 
> Remove the NAND device code entirely; this is effectively leftover
> cleanup from when we dropped the PXA boards and the OMAP boards
> other than the sx1.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/block/flash.h |  18 -
>   hw/block/nand.c          | 835 ---------------------------------------
>   hw/arm/Kconfig           |   1 -
>   hw/block/Kconfig         |   3 -
>   hw/block/meson.build     |   1 -
>   5 files changed, 858 deletions(-)
>   delete mode 100644 hw/block/nand.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

