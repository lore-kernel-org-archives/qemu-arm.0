Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp4072310ejy;
        Wed, 5 Jul 2023 23:28:36 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGy5vnEY0n0d75DaT1ljuh7lGptWLq1nzJ3eUQWBAczt4UVwQWt8tyotopFhDuy1WIwjAo8
X-Received: by 2002:a05:622a:1a1a:b0:3ff:21f1:959 with SMTP id f26-20020a05622a1a1a00b003ff21f10959mr1295516qtb.7.1688624916604;
        Wed, 05 Jul 2023 23:28:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688624916; cv=none;
        d=google.com; s=arc-20160816;
        b=FkMGfrZ5X1B7F7SSHMbWj8/w0WBbs+7rZRqqhVhjPG8+diKl5+afgQyxEMIAtgjGUB
         UbMrYpYDqviQ0wrMoVJ80+2aY/Krr/gUiC8xHGeWV/uYAycHrWQW7XzgtCz0AzFYqisl
         5ERdkqeva7+p73GhPMxI900UfozYsbFuJpKGNyAPxmj4GUYEtOqujZrll7ttlgwLslrE
         D82j4BIaDD6fGi0HM147QZlyPK2AznLbkHrYTAscSxRO8rbzig4KatGUMmtquQux7qqy
         mmltwzr2CKdXHQSIRXbANg5iG8MhMK8dyh9Z+T9AtmvBTSbF6nGIttYqOXZ31N/tb5+l
         TJuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=p2URq2l7SsPQRwt56D2xjNVFXjRfB+HwVFiFQLzv/EY=;
        fh=hMMBxK+JslmnfHyxTbf9dKs1+4Q8irB5hvN1K4ki0zQ=;
        b=p+RVj5w24yMT7+mUAZtgqCwvCKNxT7r1t2N2hWXWB2lEp/06g+haGxl3FCZAZ0d8hp
         DI1xDu1SX7+5ZoaD43CAAiaEOtPh/Bun57y6kFz0wqXfZEBF6udq+oMFFmm0xgljxJt3
         SGEdq7MG6vGnVwTnHhH8dp9t58ce7uZuBBnX8my8GfnT3Oqnn8ISUgW5JQeGN9Z+PB06
         yQVdbk8AKCiUIy78DhTlF4nrcZ+i6gVgTcPHFDjeGjyWiSnf4bi344btseMqY5gSS7qw
         Qy8Y4rjF8a8sQv4s+IM/VTjarvljlym+aDIgdTMw14YDa55QvCdby4L3Olnk5KlDvPhY
         gs0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13-20020ac85dcd000000b003ef2c3afaa7si408827qtx.338.2023.07.05.23.28.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jul 2023 23:28:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qHITT-0005gf-UK; Thu, 06 Jul 2023 02:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=00IJ=CY=kaod.org=clg@ozlabs.org>)
 id 1qHITL-0005ft-S6; Thu, 06 Jul 2023 02:28:13 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=00IJ=CY=kaod.org=clg@ozlabs.org>)
 id 1qHITK-0000Ac-Ar; Thu, 06 Jul 2023 02:28:11 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QxRRT4zrCz4wxT;
 Thu,  6 Jul 2023 16:28:05 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QxRRN4rLRz4w24;
 Thu,  6 Jul 2023 16:28:00 +1000 (AEST)
Message-ID: <f209a576-fb0b-7c2f-a23c-70e0e6c8b114@kaod.org>
Date: Thu, 6 Jul 2023 08:27:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH qemu v5] aspeed add montblanc bmc reference from fuji
Content-Language: en-US
To: Sittisak Sinprem <ssinprem@celestica.com>, Mike Choi <mikechoi@meta.com>
Cc: Bin Huang <binhuang@meta.com>, Tao Ren <taoren@meta.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
 "srikanth@celestica.com" <srikanth@celestica.com>,
 "ssumet@celestica.com" <ssumet@celestica.com>,
 "thangavelu.v@celestica.com" <thangavelu.v@celestica.com>,
 "kgengan@celestica.com" <kgengan@celestica.com>,
 "anandaramanv@celestica.com" <anandaramanv@celestica.com>
References: <168846918238.25928.7102858062933368556-0@git.sr.ht>
 <3cda00c1-54f8-57db-8992-3cafa97d4564@kaod.org>
 <CAE+aGtX9qcaPXhEYyqDuW_PLsKY9bVXhWiWb=oMT+5X-AXg3zg@mail.gmail.com>
 <ad5ea665-dce2-46d3-de14-558db8694eb5@kaod.org>
 <BY5PR15MB3555BD84850525E4FF17E086AF2FA@BY5PR15MB3555.namprd15.prod.outlook.com>
 <CAE+aGtU6mbfDVD7uQ5izBncNH_KJfsL6=P0_qx7s2tMWPuA_+Q@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAE+aGtU6mbfDVD7uQ5izBncNH_KJfsL6=P0_qx7s2tMWPuA_+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=00IJ=CY=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.089, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: fsS/hxMbfpKp

On 7/6/23 05:14, Sittisak Sinprem wrote:
> Hi Mike,
> 
> the FRUID data, it is used to define the BMC Mac address,
> to able the CIT, test_eeprom, test_bmc_mac on Qemu.

That's enough for the commit log and the comment. Adding the EEPROM
contents in QEMU enables more tests to be performed on the FW side
and consequently, it exercises more our models.

Thanks,

C.
