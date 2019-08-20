Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4063276wrs;
        Tue, 20 Aug 2019 07:45:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyR0BRq5onvFPCUL67Uvt05R0FUgyAsuuhw16aqTctoSGEIR2vo78i6UXtjOmW6ZGpPTeV/
X-Received: by 2002:a17:906:2401:: with SMTP id z1mr26304593eja.292.1566312343058;
        Tue, 20 Aug 2019 07:45:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566312343; cv=none;
        d=google.com; s=arc-20160816;
        b=bwX602m0n8Uv5d/Arkwjrk+MRtgRPaz/xC8MoMdSwp7KUPJZwifza4P+/jUgZPlbAu
         Z+taPntacATqVfOos1R9zTIWcIMj9xlr+1KnXiVIZsW242YwyrQrzoVB11H75TZJ+2KF
         lIIf38IP1b1Rox/B3sGHbC3TzvePSV5MkPiOFwJTYDbpY2GCl3MFeWsvFXYh2Dv4wfGM
         sZ6EAuhJg9mc6CPtpkrpWSSU4DYMcmn8fB15bDQTSt5q97+rQzGps+VqUB3Uqi4r2zSN
         yay0aeGoe+z6IckCSkTihZ9wq03l/hiGKiPr4jzbdVzuTLfca+tuDyOz0khvbBLW+qgk
         Uelw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=mEJQ2VlBrX/Ljs1G71OQwQ4IdSoZUDBUf2d6iCCfin0=;
        b=aKQWM0C5ycbKRvXaIlIJMEoQjBX52y2ZA9CuZIp2537zLY/fsQUKa1ci5F4kmKfAHk
         tO9H/xaaAZW9l+jxDR98IZyxRD9O/fKkbS/iXFz0HT7bOCTZO2jF8+1MY505NiWhZNxk
         MTjT99t00XE7BwdSkEtnr0v8qe1ayJQyYOxB8MDJOKwnFRJXAzqBFK4M+y81ySlP/eEs
         ABcHJMo9JWe/IqKDBAtM4yN0pfg7xq0xA+HcJ5ughYRzIQZTBgtbp3rifPMWp8PfvlJ/
         4QdBxRiVsn6IxxcWhZz1heBkjEoAqPG9KCJUDwWAt5Y/A9CsQf5mPAvXeZurREYz+Vqx
         v8xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JYul3AMZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 50si10137374edu.334.2019.08.20.07.45.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2019 07:45:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JYul3AMZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i05OI-0001g9-4F
	for alex.bennee@linaro.org; Tue, 20 Aug 2019 10:45:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56374)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1i05O7-0001fz-P0
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 10:45:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1i05O6-0001bt-KI
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 10:45:31 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:45051)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1i05O6-0001bb-EJ; Tue, 20 Aug 2019 10:45:30 -0400
Received: by mail-pf1-x443.google.com with SMTP id c81so3516378pfc.11;
 Tue, 20 Aug 2019 07:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mEJQ2VlBrX/Ljs1G71OQwQ4IdSoZUDBUf2d6iCCfin0=;
 b=JYul3AMZKwQOuFwoIrWCiUOItvqru/o4rsl+h6Q6rToSWmx+iKER2e6rHTJB7pulVj
 sdH1+MIep9KPFNrfErjwB/VLhj9sicuJqJvz4GP6uduRYIuf2G77nNbza/LKkaClTlNS
 sj64a2MJzq1YCoap1I40xeo7a6m5EHP5Dcoj+fbTGeZhcbd+AUOMWUhss7G10ym24wAW
 BIPsEs6YikQk68iYoNJ4dPUSpTnKmKRso9Q7UXnFdkxtAwlpgOO82roDXVpVuxLhGNmA
 4xspGq2P+BCEuZqDefQGg1oLVd4UjCen4V7qjClnEwmRyxqBRqnuEsj9qyhbEFLgvX6P
 iKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mEJQ2VlBrX/Ljs1G71OQwQ4IdSoZUDBUf2d6iCCfin0=;
 b=rcalLtP9veDwLDFaB/1iknd5gQz1mVB4EzhEfRx0PzSY0/V1nnIe0p9cvqtQoV/1CD
 5wNxkVWiOkFDbHTW0i8b9ceYH3HMVVeyVpdxcNBNBl8wiEe7kFyWdtv9LxaUJrJZ/yYH
 gSyOEiG7oCnlcSg0XuRMPuz5vyBDZLKJt12fNqF3zB82Z0vIyQcxpoJRiE939CyQqJiU
 vTB/ieZ6BSMHfYgbijJmoSSluOxHG5yG9yYFjJs9TCMOrMIF0LMx14WjaXjAB8bXrqp1
 3dEwxGo9Arz1RsGaaRKWFeygGY8a6PiqaxLTNhu1ivbsRRZN2SDlLo74LgjQm2Br6dtc
 rekQ==
X-Gm-Message-State: APjAAAX7/qzKI1io48knM0c+etqYJ9nsgfpBCl42+X0eSaZl84h/V3fh
 vvHZeg3ADuhKARZl2aR8crw=
X-Received: by 2002:a17:90a:d598:: with SMTP id v24mr417798pju.8.1566312329208; 
 Tue, 20 Aug 2019 07:45:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 l25sm19888275pff.143.2019.08.20.07.45.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Aug 2019 07:45:28 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190820123417.27930-1-philmd@redhat.com>
 <3e3fcb30-1e12-eaf4-07a2-47d09aea2511@roeck-us.net>
 <CAFEAcA99kKzWL89gCQ8NZi4XKL=YzKDCJR1tLbXwQDLLmZyZJA@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <2e7bf9a5-b0e7-63ec-1872-0ba0bb44e00b@roeck-us.net>
Date: Tue, 20 Aug 2019 07:45:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA99kKzWL89gCQ8NZi4XKL=YzKDCJR1tLbXwQDLLmZyZJA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-arm] [RFC PATCH 0/2] hw/char/bcm2835_aux: Provide full
 16550 UART support
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o6Gz4OfV1XHe

On 8/20/19 7:34 AM, Peter Maydell wrote:
> On Tue, 20 Aug 2019 at 15:31, Guenter Roeck <linux@roeck-us.net> wrote:
>> I tested with qemu 4.0, 4.1, and mainline (with my patch series applied on top of each).
>> One problem I do see is that booting mainline (as of right now) is _slow_ compared
>> to released versions of qemu. It takes some 35 seconds to get to "Unpacking initramfs",
>> compared to ~8 seconds for v4.1 and earlier. Otherwise it works.
> 
> Hmm, slow compared to v4.1.0 ? That's not so long in the past so
> that seems worth trying to bisect to find the culprit...
> 

Yes, I know. I put it on my task list.

Guenter
