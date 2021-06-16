Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp611256lff;
        Wed, 16 Jun 2021 11:48:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDNqUBHN/Y7ic18ZuL9/bNmwn9Kf6qyD/n24PcSGfqpDOaxV/wWMVQl7KRYR5mEqhxADzH
X-Received: by 2002:a5d:6209:: with SMTP id y9mr640401wru.50.1623869322476;
        Wed, 16 Jun 2021 11:48:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623869322; cv=none;
        d=google.com; s=arc-20160816;
        b=hZf0QJz09J/kHIAYEoDpUgpxpnKUUhLLhzmgDcfbQfAQ+pHoaZ5z5GoS945GxZ8+OW
         c3f+LUTD9CDdr1fOqzGNN6Gzauah2ynnrxSH/gDlTp0HI2L3ll2Hu8opNtH8RHdXV2K7
         wo5TITOdglDdhBLC6CvKeBktxezOH8yCPovGG+j6JXb7LVsq4V/VqOwo7JEW+EsFV041
         KPRgseZe7aPqOzfEAMnwgKCClqQoYbEuS6cLdORfeeE+Uc5MAYr1TRY8g/xfggbD5mzO
         F6x7FwgNmQH9t2N//33E51WwQC2gQrMAlwsm0kQiTPh0uN5nT5AG0bWvdufxRWI+BdNV
         HoNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=uo4ybJevsfq7tsyZzkG//7dRkRO/oznKL295243n9Y0=;
        b=QyndB8xcFTgRzHbvyGSdKFkSigOJ5UBGV8Le5dZXpFZbQnRcreVafCU2+/rJB85zgH
         1YG/In3PQW2nP9Aa/2wDnij6XT/dwARljqGlG9azZ1hF2vHChAYm6fv/NX1nOramCyTY
         FtG/Z7OpMMFK970M3seL9Yof5X4gUfaHBfsI1HHuva9osT9DOCrtiLrRHWMVUVU0BuIk
         vF0bG786Zevj7bQtebBdijwU03ieJpPfk5cV3U6RB3rpwViGibbIwAarGFBKYYLG1KN1
         Ho4OIzTBMjyeaMtOmLrFnyO4UB9htBtSMi+kuUQsDnkG4l6upVvg2XAHmR9Zj/BeCCeJ
         aQ3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RxC8Rv5k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i97si3583212wri.249.2021.06.16.11.48.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 11:48:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RxC8Rv5k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltaaf-0005WB-Kh
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 14:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaYs-0003H0-Eo
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 14:46:50 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:40448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaYo-0006ug-PL
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 14:46:50 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 bb10-20020a17090b008ab029016eef083425so4164512pjb.5
 for <qemu-arm@nongnu.org>; Wed, 16 Jun 2021 11:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uo4ybJevsfq7tsyZzkG//7dRkRO/oznKL295243n9Y0=;
 b=RxC8Rv5klHMSv6GAyqToqrdtjPejXPgw86sxkdkWX97lesKNAUTCAjxxqwf/bQc/rb
 LyVID11nQN2ehZC8ngahT9yCnWODO3m9uxhMwOF+DrUJP8d/AX6Vg1GpVBuyIrIvtC9g
 /sYPUYFc7pGXl2SafRt+psfp1jLwDyfPrmo5uVoT86bHLxUEMUqEiebqIZJJ9I6QYbob
 Q3skAfdYQh9GJo+0xay0c+nv0dKRrHwIRoIakfVbXu9RQ8w40kQwRCDso5ig32ErOKk+
 3O85li/lezmIn/LvhVKXPwoCeff2uspnKlMzSHe0N0SptUd9ul4RuJyjjOndKanB1v15
 94VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uo4ybJevsfq7tsyZzkG//7dRkRO/oznKL295243n9Y0=;
 b=ZBfYtx2ZeSlNFsIDbwvDtDL3tcBHwCs19dFB4eLxuQl/VWvIQy1zHiEY72tM7L9Enf
 ng+Yu3anURrgjnticdYEATpCWJjwMTc5qu6j7mKe7JtEup2MhJSis7gWSu5GzF3XpeT8
 UfTimLhHMYg/YNSN441cMdBtzV+jZDI/fF59CfmBZ+3uS/U0AGn9cgvY13lw6s3rkkTS
 HAbG7+TwzF2T3d9lTED2DUvEcV8Fvglot61HlLIkieJz3T+PohGW8mBqmc5ncUT/TxKj
 3Bs8cyw1yGtqCQSDAZfnbBHlQJhEVJPnyk2qTrY1A0+YzLVAildIm7JmmXfC2PRVbLXz
 LyYw==
X-Gm-Message-State: AOAM533eC/ZyQt7DqzRxqFYuCyA7pFgcCagYzypvmIkbHTercd4k5v66
 URe/AEDpc6VPpceQm73AL7vQTA==
X-Received: by 2002:a17:90a:640c:: with SMTP id
 g12mr12636068pjj.52.1623869205206; 
 Wed, 16 Jun 2021 11:46:45 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 g63sm2747485pfb.55.2021.06.16.11.46.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 11:46:44 -0700 (PDT)
Subject: Re: [PATCH v3 10/13] hw/misc/auxbus: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-11-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0a45d89a-b710-12f7-6f82-75fdc6f0384d@linaro.org>
Date: Wed, 16 Jun 2021 11:46:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616161418.2514095-11-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
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
Cc: Corey Minyard <cminyard@mvista.com>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: USjAb5x7Akrj

On 6/16/21 9:14 AM, Philippe Mathieu-Daudé wrote:
> @@ -161,12 +157,11 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
>           }
>   
>           ret = AUX_I2C_ACK;
> -        while (len > 0) {
> -            if (i2c_send_recv(i2c_bus, data++, true) < 0) {
> +        for (i = 0; i < len; i++) {
> +            if (i2c_send(i2c_bus, data[i]) < 0) {
>                   ret = AUX_I2C_NACK;
>                   break;
>               }
> -            len--;
>           }

This form of updating ret is better than...

> @@ -200,14 +195,13 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
>   
>           bus->last_transaction = cmd;
>           bus->last_i2c_address = address;
> -        while (len > 0) {
> -            if (i2c_send_recv(i2c_bus, data++, true) < 0) {
> +        for (i = 0; i < len; i++) {
> +            if (i2c_send(i2c_bus, data[i]) < 0) {
>                   i2c_end_transfer(i2c_bus);
>                   break;
>               }
> -            len--;
>           }
> -        if (len == 0) {
> +        if (i == len) {
>               ret = AUX_I2C_ACK;
>           }

... this one.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
