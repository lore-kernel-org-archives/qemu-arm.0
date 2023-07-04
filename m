Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp3129699ejy;
        Tue, 4 Jul 2023 13:18:58 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGknDaqWEoHmZyZPP1GXNR595uzRxJrHRVsL4cAxvAfVRwCJAee8Ag409k9sG6Ry2Sa4bks
X-Received: by 2002:ad4:4c52:0:b0:636:2fa5:fd78 with SMTP id cs18-20020ad44c52000000b006362fa5fd78mr12947908qvb.30.1688501938046;
        Tue, 04 Jul 2023 13:18:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688501938; cv=none;
        d=google.com; s=arc-20160816;
        b=ukh5/ndxSZv0NIA0YCWxtlH/91smgvfc8IuQqXmST1wglsp+iRTIJiNLOGZNTiAjAN
         Njvgne858hJ++xtaisraZI5XrBaRxCll7d7o0+j5gvmD1fqeuqrCk0xvYLAzdLJN9F+x
         dHqhCCmbNVM9iXUKC91zuHMq7uf2b/kDHglmEtRB2cuA0PimSkmCbUHTuQdlhhE+fvud
         2z8xbHvxFr94dn4wPCveAlcZJixhupSZiku5uvO/ZbRPg0U34gQuOIcDO1CNjojLkJtI
         9sUW1pvrHx5u6ApeKGdQO+WMSvCPYAz/FPiH0oFgYKmGslEXyn1Xd8zgIwAcKLEllt58
         HNhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=P7H6pOkhaaTg0YMZ+DidLW16K1zkvNVDe7gfWqGIyKA=;
        fh=52VPc9Drq+FLyHrDnia6wKZPXwT9TLd6crTOPuOc030=;
        b=AKgI0PZvtOqahC+jdfdSfPXfdvfG8BOFkdLG/Fp8Y6nJKLAC2ealwPCOwaQqdnUEKf
         UfDA8X4TlLyjh6ENFc82VKkiYwhJ5XS/i8TSwe7qhMAugROjxGR/8tyLnLqvTeawCJCL
         7IkQ8zdyexeYNzHpSTWofpY6quaWzJAcTe6SRvkNp8K7eY52z+5BBds92mYQV0yF84IH
         ZTW6Q3ipTq96WouLlAmgJVnFoGD+kdj5GbNl0apIWfh8+VkWJ9nzr1wuYJWCH5PwY0x7
         qa+q2yjBj4fjXL7O55RTtITj+KGhhnwPNbDVlj1ekNCr2V4fUxi/+GVFsvchG/nb23oj
         7rOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g15-20020a0562140acf00b0062576870bd1si13614186qvi.498.2023.07.04.13.18.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jul 2023 13:18:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGmU6-0006kO-5r; Tue, 04 Jul 2023 16:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qGmU5-0006k7-3J; Tue, 04 Jul 2023 16:18:49 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qGmU3-0000ha-B7; Tue, 04 Jul 2023 16:18:48 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 8C8B7117C8;
 Tue,  4 Jul 2023 23:18:34 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 7A39F12DDA;
 Tue,  4 Jul 2023 23:18:34 +0300 (MSK)
Message-ID: <0aa13184-9447-5677-1a3f-a2683bc28094@tls.msk.ru>
Date: Tue, 4 Jul 2023 23:18:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH qemu v5] aspeed add montblanc bmc reference from fuji
Content-Language: en-US
To: ~ssinprem <ssinprem@celestica.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, clg@kaod.org, peter.maydell@linaro.org
Cc: andrew@aj.id.au, joel@jms.id.a, qemu-stable@nongnu.org,
 srikanth@celestica.com, ssumet@celestica.com, thangavelu.v@celestica.com,
 kgengan@celestica.com, anandaramanv@celestica.com
References: <168846918238.25928.7102858062933368556-0@git.sr.ht>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <168846918238.25928.7102858062933368556-0@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: gdEJjLJ40yZ5

04.07.2023 14:06, ~ssinprem wrote:
> From: Sittisak Sinprem <ssinprem@celestica.com>
> 
> - I2C list follow I2C Tree v1.6 20230320
> - fru eeprom data use FB FRU format version 4
> 
> Signed-off-by: Sittisak Sinprem <ssinprem@celestica.com>

Once again, this has nothing to do with qemu-stable@, it is not a fix
suitable for stable releases.

Thanks,

/mjt
