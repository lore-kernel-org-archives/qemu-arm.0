Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1270619lfm;
        Wed, 17 Jun 2020 21:46:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyw6J7qJk6eCdtpjcKAXyqBnGLAJ9yqCDCyL+JY3LpvCFB8n+38mtIbSL3jHUaD7uc6v+7
X-Received: by 2002:a25:77d0:: with SMTP id s199mr3370657ybc.361.1592455572149;
        Wed, 17 Jun 2020 21:46:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592455572; cv=none;
        d=google.com; s=arc-20160816;
        b=sPMUeFrrLehGwcy1SZKD9g7i9dpCEnGSE2QlEi7ZfIRap/Mw2k/iEZQlNwslcAfGTm
         /csMa2R2D+ppObcKEAeN4EcOJ7yxF9FPFhefMuhCqlBe7DTN+XH4oIicVSJ9lgnxTJ3I
         2DqZqcOkpmkeDAgj4ZuxnitSPO6rlXg1BE7ZApHtmoTR0clblGW90+Tr4S20iAQYT3J9
         3FsISN8o+efO/rh7EQloe04q/U5F+yoqeVStlhyplv7vz7abn64+5Q6AtFFh1e6fLz+2
         T4L/iYR3ILj5L/PzQIPOzsVKX8LzR/YfEysaUc8c2TT+fw/A/YiOrHf9Nlo23YeXBXcJ
         HMCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=HEwWlrfotzpoud/ew5k0QENpJgAXgt7rapDDT8kfcHE=;
        b=cF4Izh1mjuYGpFy6jqDRB25mRpoMHb4V6Ltlg9rHqBK3rGKI/04qvb+YhIJ+eXjD1v
         b0mzCVRjPf4JcN1fbAYVPUHaUW7q3EJIXLGLT/kMts5P1CnqGFg2caDQWGPyeCi4XSR/
         fhKjO20H+wZwjKf/QUQjajgJIPLnc0ifTPZd8hpFflwgaOaO3vyEyVEW/GEP/nHR4dhh
         ZEoC7xZQUVMYkwZ2xoKB85ZJ2YaPloy15CSbRVOWjE/dSfm68cXZm0wMEqfTye++rHXx
         vTWA461BYIzEGxwJ0ex5+3nXYCuBufWsIE1Ag2YD0IGncLIM7edeIvqVxjdoYfrIpHc/
         vhyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 130si1368172ybv.66.2020.06.17.21.46.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:46:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmRH-0006OI-DH
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maozhongyi@cmss.chinamobile.com>)
 id 1jlmAF-00053L-2O; Thu, 18 Jun 2020 00:28:35 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:55358)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>)
 id 1jlmA9-0002WX-0n; Thu, 18 Jun 2020 00:28:34 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.1]) by
 rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee75eeaed4e8e9-ce637;
 Thu, 18 Jun 2020 12:27:59 +0800 (CST)
X-RM-TRANSID: 2ee75eeaed4e8e9-ce637
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [172.20.144.6] (unknown[112.25.154.146])
 by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee15eeaed4d147-77b49;
 Thu, 18 Jun 2020 12:27:58 +0800 (CST)
X-RM-TRANSID: 2ee15eeaed4d147-77b49
Subject: Re: [PATCH 0/2] use helper when using abstract QOM parent functions
To: Auger Eric <eric.auger@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
References: <20191012094323.234788-1-maozhongyi@cmss.chinamobile.com>
 <daaf9908-027b-3e91-9145-2fe96bd91be0@redhat.com>
From: maozy <maozhongyi@cmss.chinamobile.com>
Message-ID: <7d160d1f-0a34-854a-b69e-5a6c90f91856@cmss.chinamobile.com>
Date: Thu, 18 Jun 2020 12:27:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <daaf9908-027b-3e91-9145-2fe96bd91be0@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=221.176.66.80;
 envelope-from=maozhongyi@cmss.chinamobile.com; helo=cmccmta2.chinamobile.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 00:28:12
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, hpoussin@reactos.org, f4bug@amsat.org,
 maozhongyi@cmss.chinamobile.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jzHJcJOMkrxf

Hi,

On 10/14/19 5:12 PM, Auger Eric wrote:
> Hi,
> 
> On 10/12/19 11:43 AM, Mao Zhongyi wrote:
>> Philippe introduced a series of helpers to make the
>> device class_init() easier to understand when a device
>> class change the parent hooks, some devices in the
>> source tree missed helper, so convert it.
>>
>> Cc: eric.auger@redhat.com
>> Cc: peter.maydell@linaro.org
>> Cc: hpoussin@reactos.org
>> Cc: f4bug@amsat.org
>>
>> Mao Zhongyi (2):
>>    arm/smmuv3: use helpers to be more easier to understand when using
>>      abstract QOM parent functions.
>>    isa/pc87312: use helpers to be more easier to understand when using
>>      abstract QOM parent functions.
>>
>>   hw/arm/smmuv3.c  | 3 +--
>>   hw/isa/pc87312.c | 3 +--
>>   2 files changed, 2 insertions(+), 4 deletions(-)
>>
> 
> for the series:
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> 

ping...

> 
> Eric
> 


