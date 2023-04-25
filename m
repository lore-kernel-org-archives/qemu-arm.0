Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3591425ejm;
        Tue, 25 Apr 2023 08:51:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7TXNV+m0hPHRXah71T/eR6WHXoCLMV0KG6oIWz4QERytL74k7HoVAJGHCuc0JHe9G9asBx
X-Received: by 2002:ac8:5f88:0:b0:3f0:b57b:3714 with SMTP id j8-20020ac85f88000000b003f0b57b3714mr1190795qta.56.1682437906637;
        Tue, 25 Apr 2023 08:51:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682437906; cv=none;
        d=google.com; s=arc-20160816;
        b=ZC9EuUxUDADc62xGXXn/3oMDA5El5rz+Zo/7KyLHJEareWSMYh+PoSSaxnr0WaC3g/
         naLuRfXBxnGvEu7/imLMQgjTU9qZbTOb6Rrc8EmdZ7AwVEtodFhgkgB6x97TOXch4YKU
         ClbXOAX7SBeTMzmoH4QFbUXhteZmpjxBRFMW5hNLmEOhYOzJvG3gQm94x3NvQzyDq2WF
         rmpnzOSjn3RJ34nfbWfkjnDc1PXBOwoOXZVDaarQ1orfQ4MxLP0ebQY8cZQPbY1gRWDe
         V4Bzzgy53Pv7Yggkkst1aaQjEQfgc3bueUayiw0u0v+ACdyjP3l62iKEyCoFqnwzsIoD
         lh7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=XZl2ktAfRWxTsAkRl0sJZCqPB69xmaDYjO6YukhtMvM=;
        b=F5zfj76lRXXaQ+7NIa2KNWFTr6Qb27fbJnVGoFcZQQG3Z+o+/U6l10/N7lc7rBzSpc
         yV/G3NNxaKB3B/SGEKL1ymdOSv2TvVfBiyiY2sOLnXo86ntb4BEU8h2KC7gIimceQRhn
         BPMpR47Oihq0HPTLBsphVjjdnG48Xg1o9ZNjHqwGU4GC4dYi3amZmg7z3y5u0XblgDr7
         cYNDgIUmqd2gXRfgQQs5HPQ5LTUrLWCUeJ29NyRtcFnYlb0F/8Oz2oBxDspwKZbQywKD
         efCDpKcqkopf1QBf5eUAw0T9TFNk1F1QXuG2XGLsNmyImLw5644WttiNptK3luDquWtZ
         /i+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hVb2Ifnv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b206-20020ae9ebd7000000b0074a2a7673c6si8781925qkg.638.2023.04.25.08.51.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 08:51:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hVb2Ifnv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prKwe-00006u-RR; Tue, 25 Apr 2023 11:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prKwd-00005z-IE
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 11:51:07 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prKwb-0007Q2-17
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 11:51:07 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-2f939bea9ebso5372408f8f.0
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 08:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682437863; x=1685029863;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XZl2ktAfRWxTsAkRl0sJZCqPB69xmaDYjO6YukhtMvM=;
 b=hVb2Ifnv//nW+LJeHFrOCHKWUSapwUkwK6n45vxaFB493UEc068gtiGYNQ0JukP5Fm
 7FgphThmKnHxfZ28Pco8bXNKiUB/wNkFaNxAoP+eHQoPNLj+APKbiYdo+76gUFOwqVXu
 33IWCdI+JgewfsbQCjAnoVloqf74XDuvxXu6Ba6mEGJzhoxHs9OPVBB7hqugx7noItBw
 E3foeEXJ0kc+xtQXSUEQwyu3QZg9ph0QDfWXGN+FYjvJ+1h9HpYQEhFzY1hOKk6a9XIn
 EfMdXoXtz4iqo+zy26xWxaXyPNIupSD1W/YOtokHML0eIk/xcy0T5/oNFbjCOqFy8t01
 tUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682437863; x=1685029863;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XZl2ktAfRWxTsAkRl0sJZCqPB69xmaDYjO6YukhtMvM=;
 b=iQvbC3WZfg0n/aacANPpQ+UdvVlwjebYW9B6ZpzTYW6eqQRCytdmPawJXIxqDxlut3
 BnuYts+06n5ugDRYunibPoccE8TyCwRGYHmjr2jjle7PpcLSmB7GTIZ4w5O8wr1/DfkH
 ZSZUDcokHCD3/cCQQMaem8g0NgtscXLJFIBM0AGDCSqG5s5M+yAffrnlLjikJpQgNwTY
 kLG1UQulibin8X8GcaBt4vwTQ2qrPhKx9W4Nys7oWQx2yStKLZTQzRsLpm9Lk/1iwbWv
 0PwVIH3iNTJl+rdZ4raqIP6qc0C2p5KLSY6jY5/NFlFNVjow174BL4b3aHCAabbJNCYq
 Pz1A==
X-Gm-Message-State: AAQBX9f6Pj2GYXwpUESQ8FNUiTdjf0s01PSM7A7RdRH8jUm1r+uDmylg
 S0Jo2baZetnKDDOikTW7TU0ETig6gpPz0XvCUyvwdQ==
X-Received: by 2002:adf:d4c6:0:b0:2fa:d079:2eca with SMTP id
 w6-20020adfd4c6000000b002fad0792ecamr12527410wrk.43.1682437863306; 
 Tue, 25 Apr 2023 08:51:03 -0700 (PDT)
Received: from [172.27.248.56] ([212.187.182.164])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm13406207wrp.59.2023.04.25.08.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 08:51:02 -0700 (PDT)
Message-ID: <4a9fd41f-c4d8-6675-95ee-2015d08325e8@linaro.org>
Date: Tue, 25 Apr 2023 16:51:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 0/3] hw/arm: Fix raspi, aspeed bootloaders on big-endian
 hosts
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
References: <20230424152717.1333930-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424152717.1333930-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: vqBEshQ3hcF0

> Cédric Le Goater (2):
>    hw/arm/boot: Make write_bootloader() public as arm_write_bootloader()
>    hw/arm/aspeed: Use arm_write_bootloader() to write the bootloader
> 
> Peter Maydell (1):
>    hw/arm/raspi: Use arm_write_bootloader() to write boot code
> 
>   include/hw/arm/boot.h | 49 +++++++++++++++++++++++++++++++++
>   hw/arm/aspeed.c       | 38 +++++++++++++------------
>   hw/arm/boot.c         | 35 ++++++-----------------
>   hw/arm/raspi.c        | 64 +++++++++++++++++++++++--------------------
>   4 files changed, 111 insertions(+), 75 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

