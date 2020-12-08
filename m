Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3999619lfb;
        Tue, 8 Dec 2020 05:05:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+LnQeJNM8bAyNvEjYqhgnl2rjLaXRwdrqBXiYVgbQ4aAnMUL9FmRFNHXBf0AD1Sf2iysU
X-Received: by 2002:a05:6902:6b1:: with SMTP id j17mr13949074ybt.438.1607432741760;
        Tue, 08 Dec 2020 05:05:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607432741; cv=none;
        d=google.com; s=arc-20160816;
        b=q6mNMJhmvQp7c9uf3h4xKG3ly2tQciv42I9nSc1F1h0RouYal/9BEoxEF8o6I5lolZ
         ELWNnYWbnllQDkkR5hb9tdbzuLZ6O9ovL9h5LjvIef4SPDcCL6+h0Pm3/dsJUxG7L5mk
         +dMrVBJepx3yWMzIsL7YPxF/k6FsLRvGn2U0EmfpwvTiSjmzrFnc4yJ6FVp+4YqQ+z4E
         TJuezSaaot1jx2ehZDRKKOshExhi3jRfQbPfnyvBYn7+lVEB/qYDBg1J/9wz26S5XKXQ
         sthtau8PMiokV9d4mpRSMXvdW0AQH8ToPq0doBOtwqLp/TZ9Wy2XExtPekmOIw9kqYyy
         nt1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=gZHePaR4+ED3PddaODEQm8Rl8Nv3dyhABKquZ1ASO54=;
        b=kEOU5lCMlqgTAWSRTx2VXwG1JiDkjtTzZGLFXnumZj1Qbypf5Mxsn4mxu+BzWBXA5x
         MCyMlS+1Ynog2wCJhuCXv4rLw8X6BcHhiiCtIag6SeVID2GeRh0mD4ppv/WXeI4eHcAw
         1TQ8qhYv9+I7w1i30R2Yo1sLdJ2EZNfiDjs8AvGqtCZxsRXlFJExKpYT3actNBYd+ned
         YxFRdNzp3OBsPP7jyh60nTqT4GWZyeHxMSQIGMvSoMFUeIy9w84VUzaCRre/cBarDov9
         WS2mMHAQC/YEEugp6uT/7OWGgolLDnKgceaJQ/H+AT+k1HFe/CM91czAGDCR5gQ+0oEX
         wIEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WwyBeFMV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 20si5870875ybf.73.2020.12.08.05.05.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 05:05:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WwyBeFMV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:58294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmcgX-0005gs-3r
	for alex.bennee@linaro.org; Tue, 08 Dec 2020 08:05:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmcdx-0004am-P4; Tue, 08 Dec 2020 08:03:03 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:37337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmcdt-0002un-5n; Tue, 08 Dec 2020 08:02:59 -0500
Received: by mail-ej1-x642.google.com with SMTP id ga15so24493784ejb.4;
 Tue, 08 Dec 2020 05:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gZHePaR4+ED3PddaODEQm8Rl8Nv3dyhABKquZ1ASO54=;
 b=WwyBeFMVITS/0ValuIM/zOSjdZyJ6DcOS8ECvafcCo3rVYNENr57Z95+Cn7OMnyGWD
 wXaaWQnr1PXJBwTBwSMRBBuieMypn/W2JVyHuXbIRi9Ln/+HF9AaviErzOOeRt8EAr8K
 Kbzm6ENXo6f5o15vMwJBn9AGRolqH2SU1qY9wTVU7nzh5bVLK4F+k+fJBrHCvcBsmKTn
 7zqGFHSctUhODDxyOeTSMh/MOH4Lk/+CIMwaHT3WbyutKoo6evxQBbxk0dhEdo0v057x
 892UjSFIShRjXVAlLrjQlIoj7aHUgDfN2MPEa/WYGRlOVBAXdtahbwDWzWPFcOzdPgHV
 nDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gZHePaR4+ED3PddaODEQm8Rl8Nv3dyhABKquZ1ASO54=;
 b=frmlj0ZTNTy4+YJd0kaUMDhTkDzTEktqvJ242vnNKQMvUu4Ztx7/NO7CiJVMTWv0xi
 DTLRGGRZW2i/Z8G9J4yCINqT5UFUHaFSYNqT0UvyP6MnpbpMXLQ62O5ji8QS7DIRjz6u
 MSndhgQqtuonKtReXmSA/az+v1azYbFIswDNWcDmHrvwCO6QXkamEURERL74VKh5f6p7
 tE3vJZ8KYO7iOW6SlXjP4C8lj+UfwfZctNuBFa3Uy/4W51Nv7kWeW/Ly9CCAAajV9xCh
 clVNg33OAc1k3m//m9iWTZ01RWsLlVyci9QDU9YbKMM6BHR3dm+wJsUgl+SM/rkveZht
 0MzA==
X-Gm-Message-State: AOAM530HU8KOos2i6hd1sCo76NoLE8o+0bKIQwYMXeSE4rizDaCcxtcI
 fNDOXsAzBjjXqd3/ZpShtROivooWYRc=
X-Received: by 2002:a17:906:c007:: with SMTP id
 e7mr22622964ejz.511.1607432574566; 
 Tue, 08 Dec 2020 05:02:54 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id ca4sm11149435edb.80.2020.12.08.05.02.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 05:02:53 -0800 (PST)
Subject: Re: [PATCH 1/5] target/arm: fix typo in cpu.h ID_AA64PFR1 field name
To: Leif Lindholm <leif@nuviainc.com>, qemu-arm@nongnu.org
References: <20201208122306.8933-1-leif@nuviainc.com>
 <20201208122306.8933-2-leif@nuviainc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <44678b67-e574-2443-6db1-d0540ed9ce92@amsat.org>
Date: Tue, 8 Dec 2020 14:02:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201208122306.8933-2-leif@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x642.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zV814wwoBwPI

On 12/8/20 1:23 PM, Leif Lindholm wrote:
> SBSS -> SSBS

For Speculative Store Bypassing State.

> 
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> ---
>  target/arm/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
