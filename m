Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2012770lfp;
        Fri, 14 Feb 2020 07:02:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqzUTInL9DYWdah5TzsLOL2tkxQGlEFy+nElhmBokwQwFJnveSnfJ4Dqv9TWvr6En7gDkfUK
X-Received: by 2002:a37:a649:: with SMTP id p70mr2974183qke.497.1581692576808;
        Fri, 14 Feb 2020 07:02:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581692576; cv=none;
        d=google.com; s=arc-20160816;
        b=HAI2Y1EWlEq6Eo0RjDvf3sOpryOBOe7RcWDYD7yN2D4CnItW7lupEY6wU+QTUhSjxa
         J+kJMR45ykWZGKCUUHi4AVeRcvZaZ8a2HYB8oQPtUPIpJZyAgFu27CQYh/5t63Y6QU+O
         1vUB3UdRLqi3GozStTeWB8nu/prYgvk9VES1bQDqOLdYiEjawmF98/CuNlXXcWlYonNL
         YNyv+I8tba2NMJ287sRirmcPUgUDP0KCZQPtRy17nawaUXORqW5E5IFgofhUew7SmjnZ
         ReKJMIPbfNx6pBBjoxBWK6ThALpmoRy9xrHd0gBU6sL+wgHWqDJ9oLyP5GFgT6s65LsK
         YGoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=L/fzSUv3LWaUZgAyFEnvD/PWp0NSUATXxB2tzCGpoCc=;
        b=pVnkgMNWrnKbTKj6KmuZHYqRGoYyJIKyPTXxr3UKiGXF0+MQLaDxgbJ/mb7Zgl3Q5a
         YBxXv4ropllZEYPFPi0Vo1VR7pgTBjkG3oUN2J9jqbCpoRk5YCVoHZ2i+XfLVXKC6LUZ
         k3Znop00AAqqhwjmuJ9wVvZOpNTZIiK0ISy0Dt/x3SXQFKsOj89QYk0afHvSm0TxlJio
         JF8I3CQXyF3c5bsLa3MCcm6m+/FE1yEJ+sixKB3fa5C3sKqZxz5Si9YE6osto1MMMg0W
         MdIfT6VNgt6vCSgDv6bpK8tEdWroYQ4EmUQq0bzT5e5FduCy8+bKIJ0qGJxfXolpCuXn
         zmWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bzrwGijf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p21si3006952qkj.72.2020.02.14.07.02.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 07:02:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bzrwGijf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2cUa-0007ss-81
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 10:02:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43531)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1j2cUR-0007pv-4x
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 10:02:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1j2cUQ-0005FZ-5y
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 10:02:47 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:39737)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1j2cUN-0005CQ-Sd; Fri, 14 Feb 2020 10:02:44 -0500
Received: by mail-pg1-x543.google.com with SMTP id j15so5089210pgm.6;
 Fri, 14 Feb 2020 07:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L/fzSUv3LWaUZgAyFEnvD/PWp0NSUATXxB2tzCGpoCc=;
 b=bzrwGijfp9yoVCMh/AGYESeqYWo//w9yBTgRsT4YlAa9RKhWaGXgRbZ/tLK9f3kyon
 yR/otbnjJWRusFLQEPsrjcUyzvDNiJAl4tXgONXZoWOwCLm+vAlGOqDAtJUIhSHN1qIN
 35Ab24AgPTtTWaoxEaFZMTWKvntMHLN0VL4FOcppRwzWAbVUcWsOqVC2w+789GnojszJ
 6RHkHU5KkUBLOBcPTRv9+JRB/gAtQh64F834QkAy/6aRxK58ODewmn70rmAYUb2XUigZ
 YXOyMu/wIo1GnZPNE0L8t+o1i97E8cv20lE0NWEau4QuMKclqJc4j80lXI45GCP1xuxj
 f/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L/fzSUv3LWaUZgAyFEnvD/PWp0NSUATXxB2tzCGpoCc=;
 b=oauvAqxRekIVCv5WOS4PZxBWFKKiB2P6lvSHI2iCWmuP24HYKBOXD2SaYtAlY8WuRL
 Ff3TUvUYy28m0sDIHG0oc1m1weibHk4jZm4XeL5sQf5r30kdSk9Kxd5DvdtSF0iaS8m7
 YbV3wc9MAa+pb2LS0JFYlMdPDyNHV7KdE9R7BH1GLcIYrX9uSda5eLgYEBaIKaTkimiG
 a5krJEY4thNOlPPT8ppUvyHp5FingvqMlqg6DaW+xShBTlL4ATiSX2cutZbRDmXEo78X
 +o6bt/jUYQXAftopDKTVtaLcqvmgs7LKxXGCnlJ+oMGkCFVDlab/7RXyuzTgVQ5mZAsE
 A6Lw==
X-Gm-Message-State: APjAAAWKwlNQvy9TrbiQlZu19ZahPzCqsn8GFcKCmL/LE24hwLMOPFTX
 oq/afWZssinnzyj7VQ2scWG1aMp0
X-Received: by 2002:a63:ca04:: with SMTP id n4mr3994122pgi.110.1581692562016; 
 Fri, 14 Feb 2020 07:02:42 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 b12sm7662557pfr.26.2020.02.14.07.02.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2020 07:02:40 -0800 (PST)
Subject: Re: [PATCH 1/2] hw/arm/xilinx_zynq: Fix USB port instantiation
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200214060548.24939-1-linux@roeck-us.net>
 <CAFEAcA9nojfAx_MevUE5Z44cJ7OQzv7Dy5wRYy22tZpbnz-NAA@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <9bfcd260-696d-c747-355e-f694d108e9df@roeck-us.net>
Date: Fri, 14 Feb 2020 07:02:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9nojfAx_MevUE5Z44cJ7OQzv7Dy5wRYy22tZpbnz-NAA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: byfp0RPmmQEH

On 2/14/20 1:26 AM, Peter Maydell wrote:
> On Fri, 14 Feb 2020 at 06:05, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> USB ports must be instantiated as TYPE_CHIPIDEA to work.
>> Linux expects and checks various chipidea registers, which
>> do not exist with the basic ehci emulation.
> 
> Hi; I didn't see a cover letter email for this series (sorry if
> I missed it). Would you mind including a cover letter email

I didn't send a cover letter, sorry.

> for any more-than-one-patch set, please? It helps the
> automatic tools and it also decreases the chances that
> I miss the patches when I'm scanning through my email
> (when I'm tagging things I might want to review I basically
> look through subject lines for single patch patches
> and for 00/nn cover letters and ignore middle-of-patchset
> emails...)
> 

Sure, NP. I'll resend with a cover letter.

Guenter
