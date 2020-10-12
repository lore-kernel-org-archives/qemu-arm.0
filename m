Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1095736lfa;
        Mon, 12 Oct 2020 07:27:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJys/G6XMPMY+lD+0gxcZuOKU6+Aw19wq8d6EHgSlw/+4bVL1pWXG7/OigNXX4RK5nxUN+tC
X-Received: by 2002:a25:74d7:: with SMTP id p206mr30170489ybc.170.1602512865600;
        Mon, 12 Oct 2020 07:27:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602512865; cv=none;
        d=google.com; s=arc-20160816;
        b=SaU5+PCP/retOKle/OqmeaJp97AtXt07yMMOaxBqduMGED4l/2ZmnlOFskd/IcNHpn
         aDckdXZ5rMDkXqerJhzBPiV6cZDLitsB/CmmjraRYaG//7XHiJGutc6rBiWFhvcSNa9M
         JHip17hwyb4pClcK9ZqPL84ShcYmZ7dEJYUtHvvGLC7iDu2rrnalP6E7ZC3YN5JgdLl8
         wCyaxzAtYPmu8aY+gMyk+Ws9Og6gEMwoOtacY6M2cNEmKyB05LeKtN9342h0d4GVxYIA
         nC4zwX4oQWexS1TwT9OGiRL754Rsbl4emqcN1BfLRNNx6YndSB/HNlYgEEv1SiCVP6O/
         +Klg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Vo+2idY1iOLKCcCi+5C1utcyJaMx4cV6n4V4S3DSJYU=;
        b=vXaPmSixfC5MfwtHyUG3zJQQk12RY9AFjpuVgGvF0i1Cxqv5HEt6UF77tWb6ZvVx9k
         2Gq/GJpW99GDtjVbweqHN4/Nt0kScZRZgNydmizhBEXgdqMeHWo04zELkVi+vOWiuVzo
         qNQH7CpYyDgDC2EuMZDqEIXucM1JHNBKJ0Fj+nLYqYTTrj/Ziu7FGVYvXMZ/ErQe1LTU
         2GYrzdDHfSh93EVOtIJHoD2zUhiW0CQjv9PvGdLw+jzFOxtJBZwRgLjjR5mJnOMBuxDj
         uFDMbH31In0HXU+pfH/N/6AOWeEH33wc30PGGfw+dsxAezgNdfuoN/oTnmVWAwtJj4We
         Ec+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="D9z/fy+W";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n19si11460208ybf.151.2020.10.12.07.27.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 07:27:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="D9z/fy+W";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRyng-0004Mh-Vu
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 10:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kRynO-00040I-M6
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 10:27:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kRyn8-00064d-FO
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 10:27:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602512829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vo+2idY1iOLKCcCi+5C1utcyJaMx4cV6n4V4S3DSJYU=;
 b=D9z/fy+WqrDNWlxzzfefNn6zPD0BBBa+EtAUPnP0QIKljaCwIcPQnkYUFlOfB/RM1SHnYg
 9+5OSiDrOqjJgEJKP+KUM/x0/42tFv+cNW+1WmlThjPKziglTJUC7fvU8AhAUX5VnayQsJ
 xRt9rdPWU+rdGxPIxekx45/dFhy8fGc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-NZ1wluBcNa6zYJyQIUnNmQ-1; Mon, 12 Oct 2020 10:27:07 -0400
X-MC-Unique: NZ1wluBcNa6zYJyQIUnNmQ-1
Received: by mail-wr1-f69.google.com with SMTP id 33so9310764wrf.22
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 07:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vo+2idY1iOLKCcCi+5C1utcyJaMx4cV6n4V4S3DSJYU=;
 b=kMtSpB05OWFCpOoSeo+x4bJkvgQXyZFtRpIPY5w5n59N044n4MvvQoLjMiQKMrkl8K
 a6AIM5FQzCo/95PD0ToE97xf6riXBk3+XVDpbNM2CwoV04u0uEMc7I0seYmaW89nGYpN
 DjL38M5RkuFE4iRGR4YH61hrr4/agzifY9B4IWAmlwvGvHVTpYP3znjW6GwXUHzGgV4L
 jata4DXE8Jfd1D84gQ9zOjPaskDIWZfvuHieA8IuXQ+cTtuaCC921S/tI4n7F13Vyk/h
 XpinB9r15L4KSiuTQRkdo38RVKBYtW/oTYU10+RY7h+dTciwm3DC/OOBZzObwoFsuVMe
 EdIw==
X-Gm-Message-State: AOAM530WiiIa3JDLcklJGQzSaoD9eQiBaDQa1izuMAXExxEPquOfShJi
 WINAE4PFkaSAXLW+Fwnyjz4UxMFjHxRpmfAe/Vgriypq2gqOwDgcoL+3FAPClDWI9hvBSyNjonv
 blNBQOKC0B0cd
X-Received: by 2002:adf:8b92:: with SMTP id o18mr30897983wra.54.1602512826522; 
 Mon, 12 Oct 2020 07:27:06 -0700 (PDT)
X-Received: by 2002:adf:8b92:: with SMTP id o18mr30897939wra.54.1602512826234; 
 Mon, 12 Oct 2020 07:27:06 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id f6sm11354830wru.50.2020.10.12.07.27.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2020 07:27:05 -0700 (PDT)
Subject: Re: [PATCH 1/5] hw/pci-host/bonito: Make PCI_ADDR() macro more
 readable
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20201012124506.3406909-1-philmd@redhat.com>
 <20201012124506.3406909-2-philmd@redhat.com>
 <3894edd-a214-3edf-8cbe-3566842e8a4@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <aadc1813-9289-85eb-18b9-70c4189fd879@redhat.com>
Date: Mon, 12 Oct 2020 16:27:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <3894edd-a214-3edf-8cbe-3566842e8a4@eik.bme.hu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 02:58:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-trivial@nongnu.org,
 Helge Deller <deller@gmx.de>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oHwGGb/hc/Dw

On 10/12/20 3:55 PM, BALATON Zoltan wrote:
> On Mon, 12 Oct 2020, Philippe Mathieu-Daudé wrote:
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> The PCI_ADDR() macro use generic PCI fields shifted by 8-bit.
>> Rewrite it extracting the shift operation one layer.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> hw/pci-host/bonito.c | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
>> index a99eced0657..abb3ee86769 100644
>> --- a/hw/pci-host/bonito.c
>> +++ b/hw/pci-host/bonito.c
>> @@ -196,8 +196,8 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
>> #define PCI_IDSEL_VIA686B          (1 << PCI_IDSEL_VIA686B_BIT)
>>
>> #define PCI_ADDR(busno , devno , funno , regno)  \
>> -    ((((busno) << 16) & 0xff0000) + (((devno) << 11) & 0xf800) + \
>> -    (((funno) << 8) & 0x700) + (regno))
>> +    ((((busno) << 8) & 0xff00) + (((devno) << 3) & 0xf8) + \
>> +    (((funno) & 0x7) << 8) + (regno))
> 
> Are you missing a << 8 somewhere before + (regno) or both of these are 
> equally unreadable and I've missed something? This seems to be 
> completely replaced by next patch so what's the point of this change?

I might have missed a parenthesis somewhere indeed =)

I'm happy to merge it in the next patch, I thought it would
be easier to review but it isn't.

Thanks for reviewing!

> 
> Regards,
> BALATON Zoltan
> 
>>
>> typedef struct BonitoState BonitoState;
>>
>>

