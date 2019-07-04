Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1968001wru;
        Thu, 4 Jul 2019 05:26:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx5Egqxc5YwDXRLW6mxZe/+BeOFKlnnxkte96LQPTfAq3Vs97pK90Lh/oB6fBOMBDuSKiBU
X-Received: by 2002:a17:906:ccc7:: with SMTP id ot7mr39488445ejb.198.1562243184024;
        Thu, 04 Jul 2019 05:26:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562243184; cv=none;
        d=google.com; s=arc-20160816;
        b=QvluXlTWPaWnFDhIxBN0GVRCs+dHgHKOc5Udt2RC18IKDAe4pP8CJHiyfmnDKdLLZ/
         Vh8r57MO3oAdUNPTl3IGQUjg0E64v1l8XgV3EDfJwp+pPt2GVZBbTV/fUra5YXd6q/JJ
         xusAUrPB/ylNLAl6cPLPJYWrLe2g0dqv8fg0wgO6I+5kFYgGRXrBMZkkaDg89OyK1zJT
         doZhBnLSH/DOAMvw2ELL7xd5U06r5ffKBiXT8ArZbN16l1I+Q+Y94obe9RW2bMVQ+H5Y
         c1osRqUVScK80p3V+yufirBHUrGassfq3i3f1iQWY9Uf1VEdLc3S7vi9pfeX8MrCKLkP
         9QsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=QQwRpMMrJfYO8143GKfLP5w/nwUehuI9LxF7b29DHDY=;
        b=LbO2M6NGfB1ZiJkHekDA5Hb6YUzxnHTfkvYQ6ip9E77mk37enX1NM6L0uE+TBKUOeP
         vFex61YeProHnJMTFJ4bRpi23KbdcWref0gpVQG796XPCvdMgjNnEf2iF/LtFfuCT7qy
         8+WLCEMLQnhcCqM9LzMtpqiKtVr1Pa7vYukl1q44a3gjoKI15pjZrDXdCioWiwiou5l0
         v6b/FFby/kPcaIwuGy+ovHMyf5dQCAdsUNUBLmfqVZvm6gTYC8wJxsCkKnb6dOWdqItq
         deWrrMTHXSKy/uZPsUMC10FhzZU6FbVLjLQqo+jIZKnGYPOYrBro5WdV7+oBkeiT/w0M
         Dkcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l31si4598891edb.143.2019.07.04.05.26.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2019 05:26:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hj0oh-0006uv-5N
	for alex.bennee@linaro.org; Thu, 04 Jul 2019 08:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40357)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hj0oZ-0006rn-Q8
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 08:26:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hj0oY-0001bo-TL
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 08:26:15 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35411)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hj0oY-0001ax-MQ
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 08:26:14 -0400
Received: by mail-wm1-f67.google.com with SMTP id c6so5974993wml.0
 for <qemu-arm@nongnu.org>; Thu, 04 Jul 2019 05:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QQwRpMMrJfYO8143GKfLP5w/nwUehuI9LxF7b29DHDY=;
 b=P8OrtQ2PXORqP5AoVo7q1hsHqiT3lIO20BheCt5a5gXhU5JPytVbfAPD4LD0cMTAwS
 2NoK3U9/LZEiq6Rf+KorQq7LT30n6/igSo1JWkl7U3k4CMhG1F+4G+wlkFGarF1LsGWE
 x13aEnmoUMFXDTnAj9fKkT/DJATUpiuXMxFaWcxuDNv9oqPVM7sldDtoUl+9ayr10vMn
 U0dU8TPPSh2MduHtCW6Sm8GSUtBqu7pv7ezrZcyjTZgHF6AneUv4k03q89+wK7vM08sP
 /41rc6Ymca4DZcIMX7WcXJu7QL6P1HPSjMp5oADZ5GMS/wWbR9kNbEEUAqeZEUpme05T
 t06A==
X-Gm-Message-State: APjAAAUav4Qwj5sTfNa0HY11+Evqio/Wbc19eMHrlsqn1r0lsM2de6NW
 GfrEFUliSJZAchpG47P+rPzwpw==
X-Received: by 2002:a1c:4b1a:: with SMTP id y26mr12416906wma.105.1562243173584; 
 Thu, 04 Jul 2019 05:26:13 -0700 (PDT)
Received: from [10.201.49.68] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
 by smtp.gmail.com with ESMTPSA id p11sm6289374wrm.53.2019.07.04.05.26.10
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jul 2019 05:26:10 -0700 (PDT)
To: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20190704055150.4899-1-clg@kaod.org>
 <cd1f8a48-27cb-5cc5-1fd2-46f1597a7094@redhat.com>
 <20190704101345.GC1609@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b304e4bd-1315-b1be-6c48-add99df92626@redhat.com>
Date: Thu, 4 Jul 2019 14:26:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190704101345.GC1609@stefanha-x1.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for 4.1] aspeed/timer: Provide
 back-pressure information for short periods
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TJ6O6TKOdxbE

On 04/07/19 12:13, Stefan Hajnoczi wrote:
> On Thu, Jul 04, 2019 at 11:26:53AM +0200, Philippe Mathieu-Daudé wrote:
>> CC'ing Stefan & Paolo for a non-ARM view on this...
> 
> I'm not familiar with the various clock smoothing techniques implemented
> in QEMU and KVM, but this looks okay given that Linux guests expect
> this.

Yeah, even KVM applies a minimum period of 200us to the x86 LAPIC timer.

Paolo

