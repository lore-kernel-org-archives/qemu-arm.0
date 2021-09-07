Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4457893lfb;
        Tue, 7 Sep 2021 00:18:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyr02QrUyKFGN+ka8cEqTf9YAVHRUg/YsWuvOv4kzShJtj6LehRNwnvn/y73x1JwakRDLMv
X-Received: by 2002:a6b:b44f:: with SMTP id d76mr12674696iof.189.1630999105279;
        Tue, 07 Sep 2021 00:18:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630999105; cv=none;
        d=google.com; s=arc-20160816;
        b=STIKO01tppkwyJ44cnYP5NGOFDrhM3ODJArWTuIgFDS5VCXrqaoGvd7ZqhM+bBPOcQ
         ToUgx65xutg9kWTMDdYn8qrph9s8I2s937oBkdZKVYylYozaJIjmyrNmEag8ZibXrnVz
         LxeDny6z42+O/KE2Ykf+nAgqKsj2dSyqKGAF98tnDxaBc4crXTa3AP/7mZMAWDp3GgYd
         HD5vIznWEbK9YTrltKgXg+zq5r01sh+CozjRCVL10dilHXo0kagsL2R3FtXQrFMWhbyI
         vhxwPEYOOZ5J8Q0ex/ToLxHb9A+92HsAy0Rf8ZbhIW2q8iqv3gOVODP0f+9JHiAEoslu
         oi8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=kuOR7Boqsyx7qnnyH0q6RKzQJ6WV7iXJxdTa0mD9iAk=;
        b=ZQ2prETTLSJEw+qxSLAKWbe2KQ51b7YhiHn84B1LCMUDw/Zi12dSOoZzkS6wuqEequ
         PXI7oVmvuEg2gooRrAh1ZD6jPMj12sSMqOYXuFMjB/iOJAVIe5BDsP5+fBto4fyX7EYM
         +S7tzwh9lizg65wnlWXQ4v2k1XaBFgABfG+VdtThdpwzeymWt00oZHaC3iizTWBh1eXE
         eLWoEoV0dV7dxQhU/RPsScxvTAeJIkfxwyD9epQqoFjc/1tWJc7XVvNUDClbRL+pUoK/
         fpq3CsDTLYB/SV+SMcPCdIi1cgoUYU6HQT8/Zq2UILYDSPU8op3tEoU0pUAjPn9lc9pV
         xUgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=MZlpEG9H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si9925443ilh.76.2021.09.07.00.18.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Sep 2021 00:18:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=MZlpEG9H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNVNA-0002DU-M8
	for alex.bennee@linaro.org; Tue, 07 Sep 2021 03:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mNVMl-0002CZ-VO; Tue, 07 Sep 2021 03:17:59 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:46665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mNVMi-00004u-Ri; Tue, 07 Sep 2021 03:17:59 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso1376354wmi.5; 
 Tue, 07 Sep 2021 00:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kuOR7Boqsyx7qnnyH0q6RKzQJ6WV7iXJxdTa0mD9iAk=;
 b=MZlpEG9HD+MO1kckjMdV4oaKI3Zmb1dm8QxiXQa7kNgFiY2NFigl8vpLIO9COLGWpa
 MAlUnl1sHg3KJocrsYZf6UbRdWFwOFO+u8awTPZe48rDyt+PddA+rM9n3mliUEYz1kR0
 znNN7U298xCnkhNPfF8zQQ9mUZy/eiUBeKNrZSX7hvBd33RSZmVIh2uc1/wr2dBpsqs3
 EuGSQommopw4E9ESGPummVZ0np18AZX8gN2zDieyBN728YdvHu7mouOpANbaFgbQMMWu
 qjL371v6HPCFxhm37/HXTEPFgO0brsUgT/dtR+z/9pLPZ+bBIO/0uKf5y9dRYbl0S089
 BZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kuOR7Boqsyx7qnnyH0q6RKzQJ6WV7iXJxdTa0mD9iAk=;
 b=iDrBiTiV/CdsEfU62lgyzj1WsA9bDwYI7waxjLLUnaSR1oSKkOE9IgN/9Qxa7AYJFG
 lB5xAPHaDcN2BcqWQXc3sKTc/i5cMvqVy8UqlYkq3r82f34YRxIEcQ2BYyze2f8Pqw/U
 fj+V4n8N5EzEpmlTQLmWJMFqPJ+lwDkJ8yUcgEPR6Rsc82ch8fZWJMNZXJVr7snImDOE
 h+ZUS4IbOozkox5ZnsIgwUxR2CeOzrBHYJZYDONf2+SOHnn6W9lmynpu8QnNsMoH0hmo
 iTtgfe8cyH7Z5EJtpLPE0EZ0pSpasgfwuId7xWCN6LMlpWdURK114r5EpRqKKTaaGY1+
 IqTg==
X-Gm-Message-State: AOAM530cQbBmrGbtOjkbWTGa9yhOF/GuRZmtMciKkMNWc/kViiz7ruqI
 JZj095zeDlItQHXM/I083b/pxhXl0tQ=
X-Received: by 2002:a1c:ac05:: with SMTP id v5mr2466670wme.13.1630999074641;
 Tue, 07 Sep 2021 00:17:54 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id b22sm1452651wmn.18.2021.09.07.00.17.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 00:17:54 -0700 (PDT)
Subject: Re: [PATCH 07/10] aspeed/smc: Rename AspeedSMCFlash 'id' to 'cs'
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>
References: <20210907065822.1152443-1-clg@kaod.org>
 <20210907065822.1152443-8-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ec6c5f48-4608-3279-5a43-88d0ce039ab5@amsat.org>
Date: Tue, 7 Sep 2021 09:17:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210907065822.1152443-8-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.332,
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RgDpqrb6rjLt

On 9/7/21 8:58 AM, Cédric Le Goater wrote:
> 'cs' is a more appropriate name to index SPI flash devices.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  include/hw/ssi/aspeed_smc.h |  2 +-
>  hw/ssi/aspeed_smc.c         | 30 +++++++++++++++---------------
>  2 files changed, 16 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
