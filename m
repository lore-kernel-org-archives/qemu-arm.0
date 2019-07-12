Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp957022wrv;
        Fri, 12 Jul 2019 07:17:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwIOQgu0qCPKyrcwBpanfNEdZogbuvh+7TO5XqwR/L9KZx+k4VEAT3GRej8oVuhNcZtu++Q
X-Received: by 2002:a17:906:b7d8:: with SMTP id fy24mr8638411ejb.230.1562941025356;
        Fri, 12 Jul 2019 07:17:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562941025; cv=none;
        d=google.com; s=arc-20160816;
        b=dKhXyZyaJ7cqiGFBP2I1ivN+FZ9Z9o1R0RhoIuOfJh6JhrAjE/511J1oaG33uWx+SC
         XjltfaEh3aBxOp3ZQwYx3pqtb6MPAU9RE0Z+b1+ZCZeuGPuBZUgbbaNnZcBl3Rum39x4
         +1shhuz4Qh+V5HHbrtAyIROlFniTeoeHTLyYg0bJsWNKnkoINS0VXTrT8TQDJyLYM7AC
         2sIUj3Xpg3iByPsOET0dVXJrFy/t6WCaywMAfq5r+oUqaijcGqbv8LYcYp+gwU0mzbg/
         3c9MFW+n2COTHORUBd7ZTYsYs9gVfpnToyvCPIaU+zrZYAZ67chX37UpMzBdcb4JIcca
         kY3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=4Woz8/m+h9vyanjb6qA+tEUReKa+Sp9AHCYlwtnP22g=;
        b=wYCNA9w8LNs4cD+NN9L+j65X4CsZTgfZuzcLnujMaD4XZA66PMCEtPCMam+j/vtdgD
         e70X6YOA/8ZxeYhMnC/C4OPuvts1BHR1w9kJlMXEE2t22ycC07hNPqPnqh+6N9fwnUOe
         i9vG50ld/rXktUyiJjqc/CIWFVgP8csW/zIZjrXK8Kll4EAPhgId06H9EPl7yBfSSB/H
         /8tHMKb0GKWsQ8SghOJeu7+/WN1Kh1QeKdAb4DpnkSlG8guDhc/K0LwK7Chf01NzXsvi
         0PZ+M4bnWpzk5b8EsDN3sRIzONT1SbDkgyPR2LMSKcZn04OJzLIEIZlviiDliEU8n+D9
         mD0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f36si5679142edd.292.2019.07.12.07.17.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jul 2019 07:17:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlwMC-0002eA-BY
	for alex.bennee@linaro.org; Fri, 12 Jul 2019 10:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39245)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hlwM9-0002e2-Ia
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 10:17:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hlwM8-0005dJ-Mv
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 10:17:01 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36807)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hlwM8-0005c4-HI
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 10:17:00 -0400
Received: by mail-wr1-f67.google.com with SMTP id n4so10190808wrs.3
 for <qemu-arm@nongnu.org>; Fri, 12 Jul 2019 07:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4Woz8/m+h9vyanjb6qA+tEUReKa+Sp9AHCYlwtnP22g=;
 b=ISHH+eQKI094o/k6e3RrtznCI5b7bNs7lY7rjh+gX1nc+jYHFwVtWcH4ulZK2WkEgk
 v76615kWarCW9N7Fbu1Tr5LoX7NH4ltT1FesVfVLH0G+/UhbnIrZnLeUBBK5xZkVa7lq
 eggXttERi9mPRH0Do4fOLC0QaLqHdwDFxl9B7bMZQb69f2MZ7OFePAo4DYZqQAaJ/6Y/
 INfmjmcDHxHb/UOykSAzfsX9iPFaIMqnhdSBvU8a8Sr/2p3/6O1+7H56ul84H06ApMfA
 nD87CBkZwxFVOnVN05H1m+eHDX/iBgVHu8e9Rhe+1NU6JAPsPY5nI5ISXbjU1/J7I7+V
 f+dg==
X-Gm-Message-State: APjAAAXus1C2QzBd6llZiFoC1Sx+Bzx6a1NHL6SrulR/SkPA2Sog100s
 IP9PlOU0wBrv1psi9OLojokRGA==
X-Received: by 2002:a5d:5186:: with SMTP id k6mr12759602wrv.30.1562941018996; 
 Fri, 12 Jul 2019 07:16:58 -0700 (PDT)
Received: from [192.168.1.37] (62.red-83-42-61.dynamicip.rima-tde.net.
 [83.42.61.62])
 by smtp.gmail.com with ESMTPSA id f10sm1572210wrs.22.2019.07.12.07.16.58
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jul 2019 07:16:58 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20190712133928.21394-1-philmd@redhat.com>
 <20190712133928.21394-3-philmd@redhat.com>
 <64a41af4-e635-06e3-05a2-d2cddaf02af0@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <de30351b-6747-b976-16c5-c587b51f2b7a@redhat.com>
Date: Fri, 12 Jul 2019 16:16:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <64a41af4-e635-06e3-05a2-d2cddaf02af0@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
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
X-TUID: 20HblKRqMyUc

On 7/12/19 3:58 PM, Paolo Bonzini wrote:
> On 12/07/19 15:39, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/usb/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
>> index 564305e283..1b435ec002 100644
>> --- a/hw/usb/Kconfig
>> +++ b/hw/usb/Kconfig
>> @@ -82,7 +82,7 @@ config USB_NETWORK
>>  config USB_BLUETOOTH
>>      bool
>>      default y
>> -    depends on USB
>> +    depends on USB && BLUETOOTH
>>  
>>  config USB_SMARTCARD
>>      bool
>>
> 
> Shouldn't it select BLUETOOTH instead?

I wondered but am not sure, it is default to Yes, but Bluetooth code is
deprecated and print a big warning when you use it, so I think this
device should not be selected as default, neither pull in the deprecated
bluetooth code.

So personally I'd respin without 'default y'. If you have a good reason
to use it, I can use 'select' instead.

Regards,

Phil.
