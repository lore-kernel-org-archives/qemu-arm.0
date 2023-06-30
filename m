Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp705664ejy;
        Thu, 29 Jun 2023 23:10:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ578hQ4X/P0vh5HZWijlyWnia0M86EJAyTgx4AnACRSWx2U/ZuT0BTUM5ee4Axqx4/1wTh/
X-Received: by 2002:a05:622a:ca:b0:403:2791:58a0 with SMTP id p10-20020a05622a00ca00b00403279158a0mr2237276qtw.7.1688105408103;
        Thu, 29 Jun 2023 23:10:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688105408; cv=none;
        d=google.com; s=arc-20160816;
        b=s9+/iFoDfXSbAQQHgQ1MLy2uRj4jtGJhlt+z1SQJA9E0F1oigciyzIOEE39phFGymy
         stNf4X2ZgVvzYhuDSd+5jqZOqVoFLAEJBsBp5aX0BJKNFTMO2jG0bxbnM4crbC2X83eS
         0fzsbMl9bb1iprxaJuyrPpgbgaZc7abwwtujpIBpehEykyi+Rpg55cYKK0CgaHFivJ9u
         g7GXuLk7DGdbiwIpAr13XZLgkyt3dQFefqyfJmLEtFNqxYgE6ewDNWCWJ2bzSslrs498
         6FWStEroc+vuLThCWVjaQfUa0g9lTqppxW/Oycq19GDCicZPuw2gntPeBsr7XIr3AKYz
         EnFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=FH/0r7AKQRr+DgNEEgCjgxfwtvF1SphafeezVEZwiqE=;
        fh=ixFvD+wqbgtLLTVuZ0w1W/gvkGz9Zjnknw0St3bDp+E=;
        b=TmBdISYqC8qc9x79P+Ln5gP8pMTpSmi8PENctgwTt9wfiqDQdQXFFIiVAYMFKGRlI2
         eizHYrLEtnEtBFsHWJeTurzqOPUYMPOtq3QaMXxL9dvF6LsMW7dC1CSgDxYfAk3Jkiq2
         bhFD0SD0dHi6fxChOttFfZEnw7SOiE0yTdp+ZYN2zEg4JulUknGrPQiVeNV1Is/x4SeE
         vJ3AQRBim7aRWUUNvnHv0O05L1U7ySflCYmQvTBXR5BY4Q/rHx4diKBsY7/yHU01Q4e4
         EgPDVoggONSVEHz7yVJgr/m+KmSu8e0ohH4OFfHIXCzh3UuYYCwU6oFeZPk3RTMvN8dN
         MKkw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s6-20020ac85cc6000000b003fb426f1ddcsi1047260qta.119.2023.06.29.23.10.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jun 2023 23:10:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qF7KL-0006uF-HG; Fri, 30 Jun 2023 02:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Okcj=CS=kaod.org=clg@ozlabs.org>)
 id 1qF7KL-0006u3-1L; Fri, 30 Jun 2023 02:09:53 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Okcj=CS=kaod.org=clg@ozlabs.org>)
 id 1qF7KI-0003JU-HU; Fri, 30 Jun 2023 02:09:52 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QslK45R3Yz4wp1;
 Fri, 30 Jun 2023 16:09:44 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QslK02WvBz4wb5;
 Fri, 30 Jun 2023 16:09:40 +1000 (AEST)
Message-ID: <0359a45e-a74e-0e58-becb-c7380f5f714c@kaod.org>
Date: Fri, 30 Jun 2023 08:09:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH qemu] aspeed add montblanc bmc reference from fuji
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, ~ssinprem <ssinprem@celestica.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, andrew@aj.id.au, Joel Stanley <joel@jms.id.au>, 
 qemu-stable@nongnu.org, srikanth@celestica.com, ssumet@celestica.com,
 thangavelu.v@celestica.com, kgengan@celestica.com, anandaramanv@celestica.com
References: <168794501779.28884.3336012012258765799-0@git.sr.ht>
 <fb410a2b-bb4e-60cf-2dcd-416a957900ba@tls.msk.ru>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <fb410a2b-bb4e-60cf-2dcd-416a957900ba@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=Okcj=CS=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.093,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-TUID: vZtg56vHC5Q1

On 6/30/23 08:08, Michael Tokarev wrote:
> 28.06.2023 12:09, ~ssinprem wrote:
>> From: Sittisak Sinprem <ssinprem@celestica.com>
>>
>> - I2C list follow I2C Tree v1.6 20230320
>> - fru eeprom data use FB FRU format version 4
> 
> I don't think this qualifies for -stable. Unless it is fixing quite a serious
> issue in existing code in the process.
> 
> I'd love to hear some comments about this one.

This is new stuff. Not for -stable.

Thanks,

C.

