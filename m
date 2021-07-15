Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp529367lfc;
        Thu, 15 Jul 2021 11:23:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw12vdYRTr16kpKCfUnx6YXHd6KQqzqUXyZUwNXHiO5z+eFJnYAjd7QmibofwsEXA8JpiwL
X-Received: by 2002:a67:d314:: with SMTP id a20mr5549831vsj.58.1626373405480;
        Thu, 15 Jul 2021 11:23:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626373405; cv=none;
        d=google.com; s=arc-20160816;
        b=bmPU4CKBTJ9Cj5GX8/i4xbbo4tMwPUIvlmmImwOydEJdTiBiCcuz7qrLMgQU5lv2lx
         zmPkP4nyq7i4Qby4bNWBKMahGe09WJqK1BznhkvomlY/QxukNYxIL3LLDmS/Q+2+FO58
         016o9E3AlQHq8ovPjzULkhMF6n8VmEZx7masC59LAcqPQu4cEYifYRh2RD4Y+zKwfA3x
         +wyQekFtjXSMN+KKavolY3/rB8gcb7R3k5px8gBMTJOvFiO7KPbRdNcIZYZ+yLL0KSns
         dIWiS6wN+i4QkPi/eZAF5Bfar0E+J4MaI7TttisXSCJ7e1i6Q1xmqXDr2SaoiztMbyur
         +liA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=TCggTfEOFQatakSs/1uicTptFzpCDU7ByyHQSfMH370=;
        b=tkf4BFGTp0xwxx5WecEjxHG2C2NNKw92xiCf4goYw4Kir/yTynWEmDNtXubeJDUOdz
         WZZUrm+AMnor439BB5+xw1/SjlhqXa4vnbjKup5u3mhAkCvyps+OBX8mpikvoG9aU/Yh
         zp8HAlU3g73CKxNdwopc1fwa1qdfxkDvS9U2Auti0BJdAiCVYRSgqqLGDCAxZVfU7+iy
         PD84C1JIj76W5ckDyxej1u5uqXEkDgDd9qOCrrSqyEbLfKai6OEuaQjyjYNtrP+s/eOw
         7JsP/GwpdUrkSHDOWCNQRYbW0H2hroj3gTZb/95NeJHy9er2XWRPqOOemqX7nks3TBVk
         o6Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pS6uM9PN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m4si3175916vkf.49.2021.07.15.11.23.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Jul 2021 11:23:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pS6uM9PN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m4616-00007u-Mh
	for alex.bennee@linaro.org; Thu, 15 Jul 2021 14:23:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m460v-00005q-6G; Thu, 15 Jul 2021 14:23:13 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m460t-0004kC-PH; Thu, 15 Jul 2021 14:23:12 -0400
Received: by mail-wr1-x436.google.com with SMTP id a13so8956360wrf.10;
 Thu, 15 Jul 2021 11:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TCggTfEOFQatakSs/1uicTptFzpCDU7ByyHQSfMH370=;
 b=pS6uM9PN5+0x3HWnYRQIl2ZTOWZt8ANIkVEaPshA8eb4inpM1DMNlnOIpg7te57TGJ
 oiUB2weGcECdWgeSH41H7Gwk4K2FsZSNzd93vafpLw3BurxL1eaktCUey4kyYpBTZecw
 IttfX6VAeSoFjkUUXA3PW2mXvj2MD5qkQ76OdGT3yB4bTtEcQmgJovjKio+PEfpe6IOJ
 x8nJr+rbyd7U/HZ158jRSmNLp3M/K18K1NwC9w0udGkhmfw1NKHwKM7JLsqHXZZGkYLK
 pXvQGIvnEmIIyyV5fDyU95+dBX5ikkSRgvunoZ1GmO7nt3XUetBf2sUkqTgPu4JHWo8U
 sb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TCggTfEOFQatakSs/1uicTptFzpCDU7ByyHQSfMH370=;
 b=cfP9Inc3KAm1/8WPmlsvD/+OfaUOZNgv1CzmpN2GoqYflRS1IQxAf8HYvRBMlBAnof
 x+2zV5535Tj/8LXzrT4yBWqYZhODRMJwsOgEnZ1GyHdN9A/ZIIgvJWOHXOtVb1XAuPhE
 x5IRNX7dTCjFWsayBe+BRIOq9pWsihS/tXu2L9CcIQ0Gq2f4Omsh8vuScjyCptut7FyN
 nHMDQzMVwqo91HJPMV8XNDrFjZ4vy8W7XBoknbmFQuakSn00DLjRRfXRg+Bl+1fSvWbf
 XVwKnlLNMj1dTKqsK+ysgR9rWtA/epQB0UASTE2kW5wvQEqVDWAw2jx2Z3pgOF8LSyp9
 mE2Q==
X-Gm-Message-State: AOAM531ZYnXwtQszGmZqs8Mt8P5wIuhNOdiQwh+bnz0/gZmzMq0z9qX0
 0mYUzER3xxIXgEmJtZCd12wzBPli33YM7Q==
X-Received: by 2002:a5d:4d0b:: with SMTP id z11mr7134222wrt.411.1626373389164; 
 Thu, 15 Jul 2021 11:23:09 -0700 (PDT)
Received: from [192.168.1.24] (abordeaux-654-1-74-136.w109-214.abo.wanadoo.fr.
 [109.214.221.136])
 by smtp.gmail.com with ESMTPSA id o11sm8941481wmc.2.2021.07.15.11.23.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 11:23:08 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Remove duplicate 'plus1' function from Neon
 and SVE decode
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210715095341.701-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <37f7fefe-db63-26d1-8a9d-d974b754890b@amsat.org>
Date: Thu, 15 Jul 2021 20:23:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210715095341.701-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UghA6l/2veMN

On 7/15/21 11:53 AM, Peter Maydell wrote:
> The Neon and SVE decoders use private 'plus1' functions to implement
> "add one" for the !function decoder syntax.  We have a generic
> "plus_1" function in translate.h, so use that instead.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-ls.decode     | 4 ++--
>  target/arm/neon-shared.decode | 2 +-
>  target/arm/sve.decode         | 2 +-
>  target/arm/translate-neon.c   | 5 -----
>  target/arm/translate-sve.c    | 5 -----
>  5 files changed, 4 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
