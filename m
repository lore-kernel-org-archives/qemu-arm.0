Received: by 2002:a0c:dd89:0:0:0:0:0 with SMTP id v9csp18501qvk;
        Tue, 17 Nov 2020 11:38:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRZ1Dj7uWuEgdCdQHXrykOR9AX2fgXv3pwvcKld4zHIpIM00XwosmXfjqix1nP7BBDa9z7
X-Received: by 2002:a25:778e:: with SMTP id s136mr2322609ybc.472.1605641898315;
        Tue, 17 Nov 2020 11:38:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605641898; cv=none;
        d=google.com; s=arc-20160816;
        b=A5Le6UtHy0AaRxBJV43Toces/pCUSopPzMKQhOJC3k4qYVMvtKTGpG3fhMU9+wsWuN
         zrJDJ0L3VlRpLNqY5IY0KNJMBs29gIKrG7bIqk8ebRGuLgy7GtwO7RqxvaO41hBV8ThD
         R5R5OdF8OrDnlMhCLyxOjmaLFkSLzthFwF0ojVEligpN0brnAKBuvVdcTlYRfVO3u8gG
         Q03gt9FGGMQK9pRP88EDipbKrR6Qug06PCznx0bjLw6YPPuC7JPtvb+aiM6y3eUnZIZq
         BqqFQEkt1fpMKGpRQYkmr8Xu3dN0CNNVxDn+HAMGLmj860gh8BFSi2EG74yck07nvS3P
         xv0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=KHiyKyerFC8it+Er4E1SheFExMfIvsLI4VKNNqfXiLY=;
        b=nL/1o4Yu0BBj3qmeEHgbWj+T62zeVMBInLhXrSibLdFEHASUKjEzGi/9+zaoZY4Lbz
         8xWJZzA61+AfEp2rKTrdUAXgzv22zY/8wzjJkj02/7rl4qbWs4ZrqdKt/ZtgKPHwpu72
         LdaPViWwCUvY1CJh6aBMt4dezMnv9Y3k6NiyvjOxDCCKnlPKeG4rY3KBYyoCcB6zAmX5
         qyg94c+wHlzj82XJulCYsDQJO5+uE69n0CvnDig1WAzEJWWZMBwiVl9mafbDcN6dgu8C
         9TRcJ+xQpDsuEJQX8WCsY4wZjthoBIjF5lVbEHVmVBWTt78tpwtS/zd9GyKhylywPbBg
         0SKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nt8A3HGY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6si7996227ybl.73.2020.11.17.11.38.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Nov 2020 11:38:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nt8A3HGY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kf6nx-0005ga-MS
	for alex.bennee@linaro.org; Tue, 17 Nov 2020 14:38:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6no-0005dJ-C4
 for qemu-arm@nongnu.org; Tue, 17 Nov 2020 14:38:08 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:37826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6nm-0007f5-GI
 for qemu-arm@nongnu.org; Tue, 17 Nov 2020 14:38:07 -0500
Received: by mail-pj1-x1041.google.com with SMTP id ei22so1097828pjb.2
 for <qemu-arm@nongnu.org>; Tue, 17 Nov 2020 11:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=KHiyKyerFC8it+Er4E1SheFExMfIvsLI4VKNNqfXiLY=;
 b=Nt8A3HGYwpB2mAtHTLAP/D0US07oaeGrAa2dHYa8PAWBHSyzQYA8B3JSR+Ft7im3+z
 PzVs/q/9yM2tQtBGlQdqXXdrBeG/SHHTwcZtKtqObndx8eq/mkZmZSOP5nrLXhDAmm4i
 fTUHO+Qyz3Z+7A22QolYysWolBWKuXStRoYgCclr8dhaJwJp+K7N05I+5AMGXMyMbjrQ
 2jYI9L7hcNgFsCzEb+wgBbLA/odOUqy+FlJ1qrCIq56Ujjru54KLhf8cHs3RbahnhTsn
 vUwUnPCwm3iOtFO5J7eX/wFfXug3pZ/AVYXVqQX/m1BOTO4VYJcZc/ZNkkUJInPzWvac
 KzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KHiyKyerFC8it+Er4E1SheFExMfIvsLI4VKNNqfXiLY=;
 b=Ux7jn9CEB/1sRLjuo21iOX2U7dcLUAjim65rJiHmM2awnUB10iq/8DWV7MGSLDG+Vx
 qcSWL0O5v9UUsDTcu1Gee/SLr9S/6yBy1cfH0uJjAmYD1ls6u5216Kb0Jj1IezTzL62f
 cVDzkgDf9aUKri/Lnf83ym7a3QLmaYkjij9AtQ7h7qjQMmIFI6qJ5Vsa7pcsIzMK9IIF
 wYX4Qs24mtyZX462rlOcpKvUV5O0M+UvOXnT3b36m2iqdVfr6zYO+jly5NMO4iU3i74J
 RxBO5ofGDpH7qUhKEzaVIByR5SNrJQD1FiQnFMm0DZs4Zg9QjXp71g7y6m7wRXSGApUK
 SSIw==
X-Gm-Message-State: AOAM533s6+VFPa8aj/2YjuGOS44yOzDq5+090gZj+agQMBZ0WysbPDz8
 sV4xC80fAgE1IFmVZ2IZoyx0DA==
X-Received: by 2002:a17:90b:e87:: with SMTP id
 fv7mr578769pjb.207.1605641884905; 
 Tue, 17 Nov 2020 11:38:04 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id u4sm4044320pjg.55.2020.11.17.11.38.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 11:38:04 -0800 (PST)
Subject: Re: [PATCH 05/15] target/arm: Implement CLRM instruction
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201116160831.31000-1-peter.maydell@linaro.org>
 <20201116160831.31000-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <477d7372-6b8e-7480-b54d-061c4ca4a14e@linaro.org>
Date: Tue, 17 Nov 2020 11:38:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116160831.31000-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8V17YJp4Y0iv

On 11/16/20 8:08 AM, Peter Maydell wrote:
> In v8.1M the new CLRM instruction allows zeroing an arbitrary set of
> the general-purpose registers and APSR.  Implement this.
> 
> The encoding is a subset of the LDMIA T2 encoding, using what would
> be Rn=0b1111 (which UNDEFs for LDMIA).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/t32.decode  |  6 +++++-
>  target/arm/translate.c | 38 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 43 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
