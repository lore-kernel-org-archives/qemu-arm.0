Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1033905lff;
        Fri, 6 Dec 2019 09:22:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqyZ5NDM6lnqX5bUjGPxWLY87yEWYXB4ZlRnRhZHfqdsTCrD0Do4xjiQsTqwYB0gAq2Qcll4
X-Received: by 2002:ac8:43d0:: with SMTP id w16mr14224657qtn.43.1575652947650;
        Fri, 06 Dec 2019 09:22:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575652947; cv=none;
        d=google.com; s=arc-20160816;
        b=dlTmzTwMfiRD3xHNcHJeU3CdKEur2HugJ/nJmJe0p/RSJKcb/AXGt+SNBwr+Ol6vyR
         gcUfqHWr8/qP3jvKf0W0oX8gpwsTgHDFcpwVzGZ27V/KngqQj2oQkgVFenrxqmyxcA1D
         0rBlGdh2PgOXraqRK0sg7Q/H9uMERr1wV66QdH8bC5H5ka+Ai292I8kGPdI/YI2df/x4
         N43POv0ERPGcd4qvl0fjUTYV2eHs5/BGJVH8RlpvJ9ZbqP1g4J0J2iWhbVlUmW8GaL0u
         qLqbpEyMyne+l69E8UEgigI01A+OH9/RaDyGCq81qZ3UI6opw6IdY+Ddf6piQUA530mj
         QGnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=0qupRbolM3W2FUEthNaPkSI1sSlTOG/MJsLRancNr7k=;
        b=KNlS3hno9Uhu/0UEiMelLng5MduJFI6ZlethEO/0PJPoOs+RNBzkBpmCzk492xU+U3
         GS/7irXJtTrk8J3haKS20L/nj3/uakj52kBYICFxdxyQJBcc7lbnA1duYsu0xzEBFJAl
         alVNI/ZS4D3TTI0lMqAbmF0lEkwt0oHwcfCY1ARraKZqBkKuyQhJ6uWJHdi9jqmL1oae
         B/1KqF3TetvBF3wKEuMmQldKKQd14q8/3RKwaLqdDAWPHMApwIjNU+n5ACap6bAUoWU+
         o7CtF9oG6RP41r3qk9elyNFZeviF9cA3X9iEmTMvywU2xjehyXaku2VMBLdD3D8A5CzU
         kVMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=haLopbUb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s5si1868182qkh.254.2019.12.06.09.22.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2019 09:22:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=haLopbUb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1idHJC-0003gm-VU
	for alex.bennee@linaro.org; Fri, 06 Dec 2019 12:22:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56267)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1idGaC-0006Ts-SE
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 11:35:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1idGa5-0004qY-Iw
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 11:35:52 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52756
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1idGZx-0004od-DY
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 11:35:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575650135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0qupRbolM3W2FUEthNaPkSI1sSlTOG/MJsLRancNr7k=;
 b=haLopbUbINFJmG/+n6tuh4bU6ZgOjPx/4P3z3wmX3R2WMTU5i5fBZG0aVs9UU/RP28AHL/
 bo8VOEdGcCjWWF1KRgVZTRJ1VFvH0Fnel2VQPrpoFL9/5J0VGAhrmj8zqamg6jacAINIIU
 Pp5ji+tl/JCvIGKIq1CdJLj65k8PiBQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-b_mYKIinNW6T9c2uVY9tfA-1; Fri, 06 Dec 2019 11:35:34 -0500
Received: by mail-wr1-f71.google.com with SMTP id f17so3378914wrt.19
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2019 08:35:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0qupRbolM3W2FUEthNaPkSI1sSlTOG/MJsLRancNr7k=;
 b=rA5zk7ESAYwtkOZhZMCU+pCcpejjlXXSgWuVozlr8bjiimgQ7tswoG5/WnXlMaRnyw
 q8JD77aXSLzHLpGN7X7x6oATHImDr1ClhDY40qgFo7Nac2FvXSqoCUeXwBHHOdv/B1QW
 tedqYrJQ12ZnF9bC+nfdA3mf0pBv/+18I2bAg1AvBm9mTZx4Lzd0sN9nhAGamV0xGX+V
 NJp9qe7GBU7oO7e13V8ZX1jVYQEXeJMNYpIqRmsKKEhLOPOlJ88f2Onj720voVbrydT+
 hdisx9v9Cefa+fpSKtxAMfZxf5sSI+M8sfzE/iZwq21oCv7uYfwTL7xvvmh8K0gQZnfb
 R9QQ==
X-Gm-Message-State: APjAAAWcAnpwk2vKC7pq4D+fD2s6Ky5XElPKzCFICjNzeyS4a1t7jL2B
 PQ4CnhQKUCY9uJt0cFx4wbzWgHOyw3S9tytVZ7RE3TTtr8AHQpoVYrmZzU6sncEq1XCNIbGsaSo
 D4RzRm8nzuFsW/zQ=
X-Received: by 2002:a7b:c95a:: with SMTP id i26mr11262554wml.67.1575650132434; 
 Fri, 06 Dec 2019 08:35:32 -0800 (PST)
X-Received: by 2002:a7b:c95a:: with SMTP id i26mr11262536wml.67.1575650132233; 
 Fri, 06 Dec 2019 08:35:32 -0800 (PST)
Received: from [192.168.1.35] (182.red-88-21-103.staticip.rima-tde.net.
 [88.21.103.182])
 by smtp.gmail.com with ESMTPSA id f1sm16986312wrp.93.2019.12.06.08.35.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2019 08:35:31 -0800 (PST)
Subject: Re: [PATCH 08/10] arm: allwinner-h3: add Security Identifier device
To: Peter Maydell <peter.maydell@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>
References: <20191202210947.3603-1-nieklinnenbank@gmail.com>
 <20191202210947.3603-9-nieklinnenbank@gmail.com>
 <CAFEAcA-1Re0noxPN04uXqRYX=-g97jtiweZA=WcFo1OwXBoN5w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <41ab9f5a-3318-b412-44e8-f8571a64da64@redhat.com>
Date: Fri, 6 Dec 2019 17:35:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-1Re0noxPN04uXqRYX=-g97jtiweZA=WcFo1OwXBoN5w@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: b_mYKIinNW6T9c2uVY9tfA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u6FUxNv2D3M9

On 12/6/19 3:27 PM, Peter Maydell wrote:
> On Mon, 2 Dec 2019 at 21:10, Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>>
>> The Security Identifier device in Allwinner H3 System on Chip
>> gives applications a per-board unique identifier. This commit
>> adds support for the Allwinner H3 Security Identifier using
>> randomized data as input.
> 
> If this is a fixed value in hardware, I'm not sure that
> having the QEMU model pick a random value is the best
> choice. If we just set it to a fixed value in QEMU, is
> that going to cause problems?
> 
> (Generally it's nice for QEMU to be deterministic, so it
> behaves the same way every time you run it. Also if it's
> always the same we don't need to bother migrating the
> ID value.)

Agreed. Since the identifier is 128-bit, I'd use DEFINE_PROP_UUID() or, 
to be even safer, DEFINE_PROP_UUID_NODEFAULT().
See how the ipmi-bmc-sim device checks its guid field and fails if unset.

