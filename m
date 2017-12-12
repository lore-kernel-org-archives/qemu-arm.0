Received: by 10.223.159.74 with SMTP id f10csp3254683wrg;
        Mon, 11 Dec 2017 17:35:10 -0800 (PST)
X-Google-Smtp-Source: ACJfBovnnM6+1Wq6B3DKBWB+LTZ6LC0ILqgqjmiea1NdHKsdjxwd4opyt3kg7zeo6WTVcJJB6C7+
X-Received: by 10.101.93.66 with SMTP id e2mr483412pgt.50.1513042510216;
        Mon, 11 Dec 2017 17:35:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513042510; cv=none;
        d=google.com; s=arc-20160816;
        b=C8Hv7w5ivQ+FJbR/o9A5UDaAFUmMrPiLh8D53P9OiDwUZ6R0DSsHOcC6943nG4CszH
         RMbTFT7wOfjfR8Ooqhw7YwRdF2+gb7h+IuayD+KdeaY2pUKb5mchrajcd5V89PRsp0mb
         izWExTcZ3uBscNu14j0yQghpXS9DJccVhvalhKRhd3hnzRxqR3h0tfIE4hiVmNEFbSct
         26QG/beS6S8lr1zI/oba4sCByyetPff7VagFhwY8ZyMsuR4xclqV2dcqdIkXL4g6Lph7
         DM+zBWV+HK2TRxK0Sfm8upK55Ti7LlMlP372l1yWx+Ai48tDpV/W9nG8K9ardURV/ln2
         RCSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:arc-authentication-results;
        bh=XBmf9UPhT5ZnMtBb4ylwD1xnn7SjoLhHnKgwJbqNihs=;
        b=dLkwD9Qak1412jgG76WAtiSL1sEotgRVWL+Br8v+xG/IcJ+bIQaa4rgTHXwvDPiiDS
         +Rwqt82+uXJHQI62NUipK2gyic3Gycwq4+c7IL0wixj4o73jA41Iu/SI4SAn1QjsWUDi
         9Rr/xHrPH0vErC02lMVz8tBRU98piNCAcmzPSUQwx5iZ0geGT9f5WUQjH9dQshOSSFdG
         EGHmKXUkqd9wBBPbyTSVUG5/819VcIerq7lB+g4Zkg7gQNeEOZmd3Io6BPfwgzyoMNwe
         A6D7hm8LATkP7z7JfGyamxfJLCnT3St3t5gthE4hB7p7M5R9NKjRRNRghknTASaZWmm8
         Lw8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d11si10622973pgf.470.2017.12.11.17.35.10;
        Mon, 11 Dec 2017 17:35:10 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752303AbdLLBfH (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Mon, 11 Dec 2017 20:35:07 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:11929 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752134AbdLLBfF (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 11 Dec 2017 20:35:05 -0500
Received: from 172.30.72.59 (EHLO DGGEMS407-HUB.china.huawei.com) ([172.30.72.59])
        by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DLY45376;
        Tue, 12 Dec 2017 09:31:39 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.361.1; Tue, 12 Dec 2017
 09:31:30 +0800
Subject: Re: [PATCH v13 00/12] Add ARMv8 RAS virtualization support in QEMU
To:     Igor Mammedov <imammedo@redhat.com>
CC:     <mst@redhat.com>,
        "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
        <zhaoshenglong@huawei.com>, James Morse <james.morse@arm.com>,
        <lersek@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>,
        <christoffer.dall@linaro.org>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        <pbonzini@redhat.com>, Linuxarm <linuxarm@huawei.com>,
        <xuwei5@hisilicon.com>
References: <1511807966-23936-1-git-send-email-gengdongjiu@huawei.com>
 <470c9df5-f2e8-974b-b37f-eff84a6f3d71@huawei.com>
 <18906953-f464-d9f4-23b4-fd7118d45e2f@huawei.com>
 <20171211143220.7a359462@redhat.com>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <c9de6884-701b-435c-88fb-4f041cc60ee6@huawei.com>
Date:   Tue, 12 Dec 2017 09:31:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171211143220.7a359462@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A090205.5A2F317C.009C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 9212a9a32234914c834481aff0d248f2
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: //UEgEf+FTTP


On 2017/12/11 21:32, Igor Mammedov wrote:
>> Hi maintainer,
>>
>>   This patch set seems pending about one month, could you help review for them?  Thanks.
> I'm going to look at ACPI side of it this week.

Igor, thank you very much in advance.

> 
> 
