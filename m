Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp726408wrs;
        Fri, 30 Aug 2019 06:53:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwB7YlmstsKtO2AZBUG1ZxNlPofzcV7W0qYyieU8DtozTAKPheX3Kwn7LSkH+HrtE4htpnC
X-Received: by 2002:ac8:40cc:: with SMTP id f12mr15215820qtm.256.1567173205288;
        Fri, 30 Aug 2019 06:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567173205; cv=none;
        d=google.com; s=arc-20160816;
        b=iTmsLWFecXkSzlN9NH29beuzI7QiTheO4gnsrZupwjevDaeKh74qUcw/NtBZpvGO/V
         6sOh0dESEp7zzMrsgebf2BX6ayk3Ok8ayck6LMxgKS5ZZQx7hSH75KJhN6gLT35Onvha
         SZoW0Sy4pcJ2rNSQsQcLkYzIQb64vydSOfQTE/sIeoio8TipkKn+9AIadEcTE7ldK3aH
         PEB/RUX6V3JUHO6eX3HERutFYExIqSw8badUkqF+qTdIBLiNFhBNf85sJa+0kMzZ5GM4
         5R8VDj/HtrgF4snrj5pKt3MQHSXx2ALVkEU5ShWV1pJZz4LlVD1iTdOmbks7J4jYmOKm
         zbiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=RytwMufpF4ef9cQPla/jhO90qoZAPX8QrxFcmYZHtkM=;
        b=MHLKpspcrXLVpPst24pnJEW/nQu/RB1G8p448JGh0+drOhVXk864R2lexB0i+tZSco
         KlLrtpOWkdDteCpBVcvgu4HD/FvBAUycORDX46EnPwGIqaazLl4m9Qsor5eFa8TpZWA5
         u0O8xxRn6SM7ahse+oGb4FJpjIxXpMRpd5NUovjiKJqB8SM4JQQkBnb+b7yXwpcK9FRT
         udbVyhY4Re2ZeXVrf9XwWVrEW84SshWT6PjgUOZDUVhuoc+bnJKOMek+rrA0SEvqZ62F
         e6r5YbNT6JP6ydyebxaF7uwKGPZECbWCPnEYctbnjb4Uqh/Ujz1fFr1XfS0mPHdOAzoe
         xTOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r62si4275071qke.12.2019.08.30.06.53.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Aug 2019 06:53:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i3hL8-0007qv-MV
	for alex.bennee@linaro.org; Fri, 30 Aug 2019 09:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50418)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i3hGK-0004I2-Bz
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 09:48:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i3hGF-0007ym-DM
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 09:48:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52378)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i3hG8-0007fh-F1; Fri, 30 Aug 2019 09:48:12 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1922C307D84B;
 Fri, 30 Aug 2019 13:48:11 +0000 (UTC)
Received: from [10.36.116.105] (ovpn-116-105.ams2.redhat.com [10.36.116.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACC81600F8;
 Fri, 30 Aug 2019 13:48:05 +0000 (UTC)
To: peng.hao2@zte.com.cn, drjones@redhat.com
References: <201812120954362374357@zte.com.cn>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <704db664-bc2e-7814-e8af-424b7d8aad14@redhat.com>
Date: Fri, 30 Aug 2019 15:48:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <201812120954362374357@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Fri, 30 Aug 2019 13:48:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH V12 0/5] add pvpanic mmio support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uRzbZuQjJlx6

Hi Peng,

On 12/12/18 2:54 AM, peng.hao2@zte.com.cn wrote:
>>> v11 --> v12
>>>      realize pvpanic as a pci device and use the mmio of pci device.
>>
>> Do you have a pointer to the kernel patches?
>>
>> Thanks,
>>> drew
>>
> I'm still sorting out the code for the kernel part, and I haven't submitted a patch yet.
> 

What is the status of the effort to get this PCI PVPANIC device available?

I am unsure about the kernel driver status. I found

[PATCH V6 0/4] add pvpanic driver framework
https://lwn.net/Articles/780193/

Thank you in advance

Best Regards

Eric
