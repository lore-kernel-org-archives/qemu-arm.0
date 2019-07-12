Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp1100833wrv;
        Fri, 12 Jul 2019 09:45:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwcNvK+ufu5vCMkYLStfB2xddfpiBsVmZFFjVq7fPFqFwRVFSqOl983rOorK4gj7GKCExR2
X-Received: by 2002:a17:907:20bb:: with SMTP id pw27mr7168472ejb.93.1562949921436;
        Fri, 12 Jul 2019 09:45:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562949921; cv=none;
        d=google.com; s=arc-20160816;
        b=yuNoxYqswZu6eXnsldS2QdBz5CHKYfc/oXfKkl7+LqgmD/mIxRWz9eMxGHjEYH4/2V
         HCQ0hKiVH0nxzD1IweZzg6NwxqT21sdD1zeSfvztOZJLOWBWNgWtl29WTXKeQoGoaGkQ
         qND5rBou39qqRbtRsAHvadIbFiULRKaySVXWhQuN7Noh36H3hn++FAB72Vj2iL4Yp4mr
         eypzv+U4RmY2QW1TQvJq9V1aDR5GeErXza/Kr+eDhzUQkSOiseBgyQpRuS8f0bKv72ce
         CpfbSLdXz0NWwJxDn4y0zJeaas1nMyA5qWLRBNxapY+u7uHW8mwvAhNyntNB4YLF/XW9
         qL2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=2iJqK2wWzbRidHkzsbaQ5idnuCOPPps534A05a+y3YY=;
        b=qvXV0iUSW2W8WGqJ+pl/6OvesM4TtDQsxVt33I9PP7GGzOLXtBaXj9Q9JCZyQq/Flp
         rlYoTxPDR3bjbBMbusxWm1uO3uPpTiYCoUQT8ybJd6nBkMDTbkgaUWyVp19i7Um/XYTq
         /Hx0PtsjQNgrClgAt2lvozem6thWAisTZQF3VKo798mrCsSHPOd0dw+ctFSNo8PIj+SJ
         +0RPQiumiwZuTGfrY54fktm38QWc6ypM2DVgco0PWLUdVW3t+oBFoLMY2G+PDHp3RuJU
         zlI2hYw7jiAQGa13WkGvZB88aKin9ezQhk3Z0hwxNWqvT71O+cnOjne9+98+RslO2j8z
         yscg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3si5920815eda.298.2019.07.12.09.45.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jul 2019 09:45:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlyfg-00082T-89
	for alex.bennee@linaro.org; Fri, 12 Jul 2019 12:45:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53859)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hlyfb-0007to-92
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 12:45:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hlyfZ-0003Zf-JU
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 12:45:15 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42]:51178)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hlyfZ-0003V2-CJ
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 12:45:13 -0400
Received: by mail-wm1-f42.google.com with SMTP id v15so9544539wml.0
 for <qemu-arm@nongnu.org>; Fri, 12 Jul 2019 09:45:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2iJqK2wWzbRidHkzsbaQ5idnuCOPPps534A05a+y3YY=;
 b=AUelJq1BvyCKeBJAyz8yO4hTFHmfczjY/zeT7VAFp11ncjmIZGHt/wLpu9KfZFVUfL
 LLlKpKrH2s1X8Ihz2Hi7Ao0NIYZznrY5CrBTXDkziiySKzrNFicpXu1I+2EawpkQar7O
 Bc4abFcTNo/tttMF3KYeUqOZwyfNvd8g8bLrqLSCjTrRS0AU62oyEivfes91XkDRvkgn
 uhpi/ucX5jNYZ7Xk3qNKRUT8Jr3uYOcmSktniGq5ltP0jCto3ZzNdMlGo9zip8Kur7WG
 zSB09wwcA+ROu1u95T6d0rrWKMDmoYWGSJ+b5syhB1iZdIiygyPaAigLZrBW9BcVRjz1
 Z62g==
X-Gm-Message-State: APjAAAX9IW+sj/hn8IkyWX13zJEx8tlD2mo3Y+48anGNyi6tmVDCZMrs
 9Th2NNdXXhcuzeUAD0tIKFUzBg==
X-Received: by 2002:a7b:c7c2:: with SMTP id z2mr7937258wmk.147.1562949910336; 
 Fri, 12 Jul 2019 09:45:10 -0700 (PDT)
Received: from [192.168.1.37] (62.red-83-42-61.dynamicip.rima-tde.net.
 [83.42.61.62])
 by smtp.gmail.com with ESMTPSA id n14sm12873255wra.75.2019.07.12.09.45.09
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jul 2019 09:45:09 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20190712133928.21394-1-philmd@redhat.com>
 <20190712133928.21394-3-philmd@redhat.com>
 <64a41af4-e635-06e3-05a2-d2cddaf02af0@redhat.com>
 <de30351b-6747-b976-16c5-c587b51f2b7a@redhat.com>
 <e2a6cb5d-b840-117f-728c-b5b1bf4c18d6@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <49b41c61-fce7-3b5f-980a-20007125de9f@redhat.com>
Date: Fri, 12 Jul 2019 18:45:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <e2a6cb5d-b840-117f-728c-b5b1bf4c18d6@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.42
Subject: Re: [Qemu-arm] [PATCH-for-4.1 2/7] hw/usb: Bluetooth HCI USB
 depends on USB & BLUETOOTH
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
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Miroslav Rezanina <mrezanin@redhat.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /wOWkbwLyOos

On 7/12/19 4:58 PM, Paolo Bonzini wrote:
> On 12/07/19 16:16, Philippe Mathieu-Daudé wrote:
>> I wondered but am not sure, it is default to Yes, but Bluetooth code is
>> deprecated and print a big warning when you use it, so I think this
>> device should not be selected as default, neither pull in the deprecated
>> bluetooth code.
>>
>> So personally I'd respin without 'default y'. If you have a good reason
>> to use it, I can use 'select' instead.
> 
> There are two separate questions.  One is whether USB_BLUETOOTH should
> select BLUETOOTH and the answer there is almost certainly yes (in the
> words of kconfig.rst, BLUETOOTH is a "subsystem" while USB_BLUETOOTH is
> a "device"; devices select the bus that the device provides).

Fair :)

> The other is whether we want to enable USB_BLUETOOTH by default.  I
> wouldn't have any problem there, but if we disable it basically no one
> would ship/use it and we might as well delete the whole thing.

The only user is the ARM Nokia N-series board, so if we set default=n,
the Bluetooth subsystem will be only be selected on arm-softmmu (and
aarch64-softmmu).

This seems a sane cleanup. If another board wants to use the bluetooth
code, it should probably move it out of the orphan status.
