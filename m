Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp671815lfr;
        Wed, 7 Apr 2021 10:42:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEVfGuEG3yl5BsgcXM41WuI+OqxE4Gd9GxOCVLiqRU/YLIkYDJdtS/1tUibIgNm1G4RaPB
X-Received: by 2002:a6b:e809:: with SMTP id f9mr3446310ioh.97.1617817357825;
        Wed, 07 Apr 2021 10:42:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617817357; cv=none;
        d=google.com; s=arc-20160816;
        b=JolNJGyfMbB+bmYac/J+SkYqq1B5xdwRikXyJ4nr1oD/Dqtx0ZmZK6d/sO6c5uZZJh
         vKg8b/F0SkWLkz0V2m+81ZXlzM5GkkQhB036XmddEZ4xwqNxWxxqWt3tbe4+vIaCNtr4
         AhV+G1VsKhDUkpq2GustPpssBQOjXRS60NjeDf7qNH64OgdrmLU8XCuTsqwXKK/Y4Ufc
         ikGWdJutKds8bYd5XaZIPJu5wGSFzDwREwkzfJzOdov/lWUbTIVQvt5e9CR3eHrv2BVT
         lAnohj/CImbNkhfJyXkFpj/2KKTsDq+2EZyiDIIFh8mBYieFCPa9TmzZ2QNl0lLCFbS6
         Anmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=3gGeJKAQn4t0QM3kXeIrtliFEujc5NX2EP6gqLo4/7w=;
        b=T9xgzuJ7I4h4k/oAP/lDc2PDMG8DMkHPLlJTYjKL0DxWP3gVNbVE3c+RJeGM3gxV12
         D0qNh68P2TLS0Bk7RBpYMhWcDPMFfwrK5NRnCxUo9OCLw252FsBQ+DaJ/O0Xp7+N6Pzc
         mwvloGUSz3r9JbY6SD+0+mLXk7Jg/e8O49HjUUuj70+JCc2HqqIsZVbsVOS027AMByJT
         OFXhMp8wj+7Vw+Fi18yiUv+jl2EKzWNODXFjUL60A2cPBb2zknNyMWPDr7/OoHZY51Br
         MAm8eNE7jaOr0LWorg7Wm/2SsoTPnaXxnT+dOzNbCowM05dD+rZMJxUbPA73orrRGzUb
         Nwpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cD93UHGb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9si172793ilh.140.2021.04.07.10.42.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Apr 2021 10:42:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cD93UHGb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:34510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUCCL-0003Jf-50
	for alex.bennee@linaro.org; Wed, 07 Apr 2021 13:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUC3m-00045Y-VI; Wed, 07 Apr 2021 13:33:48 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:34608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUC3l-0004yY-Ew; Wed, 07 Apr 2021 13:33:46 -0400
Received: by mail-ej1-x62f.google.com with SMTP id a7so522003eju.1;
 Wed, 07 Apr 2021 10:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3gGeJKAQn4t0QM3kXeIrtliFEujc5NX2EP6gqLo4/7w=;
 b=cD93UHGb7N0CKSQtFJKjIXK2sGq8lKxl/3cLiAvz/lLffXrFZeU2fAeDffIp1uI1/y
 AVAurLA5sUiakgZIMKGmRKlhjOeC82DgX6nJLSAhqTDUchBmMH+GT3PGr5+y7HJOwVZJ
 SYeBwmiIVSvS9WZ9LdzGhb9Vp52ydXG/x3axQLi7kIKaeuBBywS9d2DvXZEGT1oiebx4
 j61MYXUwwQlbHiPTDVmmfTFI+dRG7GzS1MtfKStu2K7xIjKZodm2tB6Ustbt+ha+HvDb
 FBBUatdF1lYGtJkQU5tNxRnfnRgE6vJh+n+SQnLT/8XRk8rLsag5J1EdNG6R506TU7S8
 UTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3gGeJKAQn4t0QM3kXeIrtliFEujc5NX2EP6gqLo4/7w=;
 b=THk/GbBGt6i/8fSiaRCe5vQdK2ahhoGbZFOkd73XffRUnxTpD+LGzQBIhxp5q5LZ/F
 KHm3vXSnx8LCZAcCj2yotJGVaP21momhp/AHzWIG2yB1Qm6gPFLrJ9xq+JLWvpb7PqRL
 xNXFUIT82fW/SriFD6JM42RKoKSGiw0xObGtJNlbbu6+APgvje0nWYq68LL/nL8OWLuV
 GKRhbQPUzuyB2/42iA3PomKvz4Y4RkQngdIjzGH/Lt0XHMj/YO8UqnRvj9MGa7S7Mdyd
 FiiTh6vaSeYC1YjsV4HoADoZ1qjSR4tShwZ4Dk7QXM4ZiuG7D0EoOfx6d/fB2AL4PrnN
 XACQ==
X-Gm-Message-State: AOAM533oYRkOqGhN6/XDTWj8V4ULmjpaHdsEIkZ9eT1eZzga6aeqQWZA
 QNJZsYShsV8BA9o6tpfQTA7tHjAaSwbnNQ==
X-Received: by 2002:a17:906:4ad5:: with SMTP id
 u21mr5036938ejt.22.1617816823354; 
 Wed, 07 Apr 2021 10:33:43 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id w25sm10936101edq.66.2021.04.07.10.33.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 10:33:42 -0700 (PDT)
Subject: Re: [PATCH 04/24] aspeed/i2c: Rename DMA address space
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210407171637.777743-1-clg@kaod.org>
 <20210407171637.777743-5-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fba7f421-347a-1298-f58e-6f31aa2744a6@amsat.org>
Date: Wed, 7 Apr 2021 19:33:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210407171637.777743-5-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cCgNZqLkSVdQ

On 4/7/21 7:16 PM, Cédric Le Goater wrote:
> It improves 'info mtree' output.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/i2c/aspeed_i2c.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

