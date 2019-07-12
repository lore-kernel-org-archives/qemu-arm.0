Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp1145610wrv;
        Fri, 12 Jul 2019 10:31:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwk87PnkdyZN/GwKYqnES1mfYRm+C+PKyjdGMRC/UkIoqEkXFNk+BzReh2bUZHC3xGW1p/B
X-Received: by 2002:aa7:c0cf:: with SMTP id j15mr10531068edp.138.1562952715676;
        Fri, 12 Jul 2019 10:31:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562952715; cv=none;
        d=google.com; s=arc-20160816;
        b=NDVnYmYxFNu5il2mrBg6u6pUPzYaMJysOTBm6Yp5l5zrFGRrmkmjVrt9Mgrlk5UHut
         vuAtTvFC22SQN8k62CJckZ/FNqY47OuF7mhdoXJDHHknDNLhKjg9z24Dg9HiTXAJhPms
         Z9e5843txdG8Rmz6rWrMEVnZMuJkLGs1UaBEIvCjaU87Nn64vWu6IKANzo6xI+hqUWvv
         F0JehSF9h73R/iyaxSd9jli2VwGA0lGdJMhkx6UVUuO3Zd0j/JXdz7xCyosPD7VoC7/7
         JA1djdZRSFnqPZKU28JK9vJ82H7I197xkvBOc8LEj7G1KeKwCLKMT9r1DsJcXtmb2HyJ
         nEfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=H8er3Um6nwfRz2Bm6YZwaRTZIER+nSM6JmK3tm/TRPw=;
        b=RZZhyNiKLoJLWihLBCL6YaGsKUpSPkcr28hXisAAmPc1aUFJvP/m1BTds82t3JJvAc
         PN6mLKGLVDksEwGgGbmNOfZZSeu0Z0zEliE/fWVZLask+CSkkTgx6pX850Pb31pakPFo
         TV91xDJ9sGKdxJI1MfiFOGkWAptUHo19B3TjlVGMVwi182Qxhksp58I+QMuLuVxmQNP9
         EVEknasfZRQYrWb3/35bRXoxQTtu3MAD5gdgoWOrVxJ+K5YwmwLbntZOa4cnvKvmdVEf
         PMtKiXMsyhSPjIxZtlvbBbIpaW2Ceai3oJysRBZGilQfglobW1XwQCsi4IZvBjk55u7f
         rzVA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17si6184301edm.4.2019.07.12.10.31.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jul 2019 10:31:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlzOk-00029j-JX
	for alex.bennee@linaro.org; Fri, 12 Jul 2019 13:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38317)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hlzOi-00029b-Ha
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 13:31:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hlzOh-0007HA-L9
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 13:31:52 -0400
Received: from mail-wm1-f54.google.com ([209.85.128.54]:36506)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hlzOh-0007Gh-2S
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 13:31:51 -0400
Received: by mail-wm1-f54.google.com with SMTP id g67so5544809wme.1
 for <qemu-arm@nongnu.org>; Fri, 12 Jul 2019 10:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H8er3Um6nwfRz2Bm6YZwaRTZIER+nSM6JmK3tm/TRPw=;
 b=MT/QPikIEqfaGHpGXyF89dXEh56Mwx9u+gvE9bjsA1Mkxa8FufrLcwz6U9FHnjwuO4
 gW1T3CtFmMrkbn/e+WQs5UgGFzKvI7MJudBRjq2l+vlKqx1moFGHfL00o9EwiqGgbR2d
 PGzS2N0yJip6f2fNHGcJXAhdGdv6a8MTyapJAoFh0YSOqtAkORfhw4ZSw8JTUgCka+4Z
 BjUY2BFL5LFBE3/8DSomDVqTQBPXg6El53zL7mEMMHwUf4oXjgI0RpfAnxNlDw12Oztz
 VWdQInDbGjWDVurUbI5wGNneHrcaqMEhJ2vyXHBQ+1ByQYg5kMVCHlGANGUTOGpHmOt0
 UzjQ==
X-Gm-Message-State: APjAAAUKi2KaC/n/Mq/9OEVh0+s/9HmI7GNvHDJTj/xwia1CSk7XGAVL
 BNdQoOh3zIgW1INSd/J7vAYICg==
X-Received: by 2002:a05:600c:218d:: with SMTP id
 e13mr10774776wme.29.1562952709803; 
 Fri, 12 Jul 2019 10:31:49 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d066:6881:ec69:75ab?
 ([2001:b07:6468:f312:d066:6881:ec69:75ab])
 by smtp.gmail.com with ESMTPSA id d1sm6875597wrs.94.2019.07.12.10.31.48
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jul 2019 10:31:49 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190712133928.21394-1-philmd@redhat.com>
 <20190712133928.21394-3-philmd@redhat.com>
 <64a41af4-e635-06e3-05a2-d2cddaf02af0@redhat.com>
 <de30351b-6747-b976-16c5-c587b51f2b7a@redhat.com>
 <e2a6cb5d-b840-117f-728c-b5b1bf4c18d6@redhat.com>
 <49b41c61-fce7-3b5f-980a-20007125de9f@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <993dbb9e-6813-e927-fd69-d16015ea1fc2@redhat.com>
Date: Fri, 12 Jul 2019 19:31:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <49b41c61-fce7-3b5f-980a-20007125de9f@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.54
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
X-TUID: 9uoQDcY5OPg1

On 12/07/19 18:45, Philippe Mathieu-Daudé wrote:
> On 7/12/19 4:58 PM, Paolo Bonzini wrote:
>> The other is whether we want to enable USB_BLUETOOTH by default.  I
>> wouldn't have any problem there, but if we disable it basically no one
>> would ship/use it and we might as well delete the whole thing.
> 
> The only user is the ARM Nokia N-series board, so if we set default=n,
> the Bluetooth subsystem will be only be selected on arm-softmmu (and
> aarch64-softmmu).
> 
> This seems a sane cleanup. If another board wants to use the bluetooth
> code, it should probably move it out of the orphan status.

Fair! ;)

Paolo
