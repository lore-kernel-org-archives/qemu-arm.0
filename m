Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp544843lfp;
        Fri, 7 Feb 2020 04:58:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqxaGTbzhU5mP/cfE4FaS861sfUJkhS0nsF5kywS+l6MZaYSRHK1mk67ekRHTLzg5bgs/3se
X-Received: by 2002:a05:620a:108d:: with SMTP id g13mr7049586qkk.121.1581080325670;
        Fri, 07 Feb 2020 04:58:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581080325; cv=none;
        d=google.com; s=arc-20160816;
        b=eRJHKLbZuqwlt4MPHFam0AObQtGzbvfvdsuEFSlTdBG4i/r5acCHvUvZ+IwDO1i1tr
         BApgFLrWBKvWIH6Nra5wng9Qwx6ajeEar7ddl7a3f50CBPeX5JgQyPH8d1R+8bewWFzF
         3ldf83WpPbkFg7rd2CVHIuRtjbAarYcI5+SW6dT7F/Vp9MzVqk3bK5oRnMHR7xp9o8Hy
         dGS+34aknNfRoobz8syp6NGjRhbfWL7W1mcd3qNedHn9BGVmFzdUamtlleMdXbh1VWez
         onDU3BksbxVUNT91Wl8K+/N+I8iZm3avlVsg9pCP2EbHS3oKo/o9T2gelI0cSo786dE+
         NIpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=fVJ/lNKCbvS/EN1US49rpyBiCuO505cnmOErQECnowo=;
        b=Ts+hn57r9L6QFL8ybLQ07+XdrS3sTYgIL9w7FQVEfPBRARRMiqimWJdVovnzLzYM5N
         2ltJKrZiJZ+oyA1Rq562J2WEDAZLehBBwxd5regMtyasV+CLA6UhnTXLct1JNNTMy1tK
         TOn/dDmloYUu5TYPKow9cvyIWlgj1eLj5wNd3HBZQ+yRKlJL5JCt3bPn1BQ4Ktgw/a6/
         o6+XRbaTifjUmh9BbJ6uvs9UiYfW3JZwd9X61Kp3yV8PZDp+5MaYX8mGKiRJMBU0+Paz
         zDJI/gpKSRTFMWMZE578cPb6BnaMS17D4qNmV83te20ddn+70qMjgXuiPzXf0VXvronk
         xfNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="YJBv/uBE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z133si1224209qkb.353.2020.02.07.04.58.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 04:58:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="YJBv/uBE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j03DX-00047d-Rv
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 07:58:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51645)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1j03DN-00045k-4i
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 07:58:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1j03DM-0006Cz-4J
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 07:58:33 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:46706)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1j03DI-00069m-GU; Fri, 07 Feb 2020 07:58:28 -0500
Received: by mail-pf1-x443.google.com with SMTP id k29so1232428pfp.13;
 Fri, 07 Feb 2020 04:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fVJ/lNKCbvS/EN1US49rpyBiCuO505cnmOErQECnowo=;
 b=YJBv/uBEqKXGTA7FSTiB7tl0r3MavseDq820o3j8btnbEGTRydSptXIcgAbGnoBkdR
 +54/UQdLlNc0mPYq1HrZQhA1sJGzdCSIRp0EC2zaJ57SqVThz+6Scc4iTXkEcW7XUl/w
 C2lkVVG/7oDUwCIDsyKZLgGKpWk3j0rp/K/VUOEo87y9PhEqhEy8HIuxr4Fnf7091iPf
 RF+a4N9S9xG2ZDDtPNwSuOIIAaMGsWAFtiZvLUS0nOI8MYJC4sPMIKBj2zWES4LTmz3q
 c5xrx6wtze9qRCsXz0hmfpujsA3GofdYzGeNBKsl3aTO6dpiABwCZnJAX9A/yrlzvREJ
 kYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fVJ/lNKCbvS/EN1US49rpyBiCuO505cnmOErQECnowo=;
 b=SWg+6lstkWYYnLQ2ELiipPwft7aKPRfV4oY9QljCnx5EWQEJk7fNoHX6T7P0nRcOVI
 rA/0i4qFn0wa3q5vN3jBkwxnix7ZBlLJFrQs9WufhQ5V1CKRt643Kr5wM04ZDWHOA1GT
 5z77QskLfl5CBpaa98KWWK5Y3PCnyjGpJMOzZYucxoj8W5hiWUAaqnvEJOefiDIT3po1
 bKvI25A6cXpJqkAJ6jrMeRbKLsYBjZSNs+6b57sEmMF25jmVArHIifVZFUcBXyqwBud7
 q1gmdZc5rwDoXHq6V2U6eqF5b/5Z6RC2hXdqvu1dpCGzUSo/YEAYtIrXyxZ/IeX01/LP
 jAHg==
X-Gm-Message-State: APjAAAV7fI6GWFFeTgqdvYn5GbuEegeVmEoL9j4nmhOXYvoeYq3uQXuc
 agZkcmYnpqabq/2UUW+v/xYhRzfx
X-Received: by 2002:aa7:9e0b:: with SMTP id y11mr10249439pfq.182.1581080306998; 
 Fri, 07 Feb 2020 04:58:26 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 r66sm3295375pfc.74.2020.02.07.04.58.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2020 04:58:26 -0800 (PST)
Subject: Re: [PATCH] hw/arm: ast2400/ast2500: Wire up EHCI controllers
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20200206183437.3979-1-linux@roeck-us.net>
 <e9f490fe-34d3-6830-832c-155f6fa63482@kaod.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <1605922b-2aa0-dd8e-720a-031e74bc9872@roeck-us.net>
Date: Fri, 7 Feb 2020 04:58:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <e9f490fe-34d3-6830-832c-155f6fa63482@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cgHnTfXYLtIr

On 2/7/20 12:16 AM, Cédric Le Goater wrote:
> On 2/6/20 7:34 PM, Guenter Roeck wrote:
>> Initialize EHCI controllers on AST2400 and AST2500 using the existing
>> TYPE_PLATFORM_EHCI. After this change, booting ast2500-evb into Linux
>> successfully instantiates a USB interface.
>>
>> ehci-platform 1e6a3000.usb: EHCI Host Controller
>> ehci-platform 1e6a3000.usb: new USB bus registered, assigned bus number 1
>> ehci-platform 1e6a3000.usb: irq 21, io mem 0x1e6a3000
>> ehci-platform 1e6a3000.usb: USB 2.0 started, EHCI 1.00
>> usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.05
>> usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
>> usb usb1: Product: EHCI Host Controller
> 
> Cool. Have you tried to plug any devices ?
> 

Yes, booting from USB drive works just fine. I already added it to my
test suite at kerneltests.org.

>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> 
> This looks good. Could you add the AST2600 also ?
> 

I thought about that, but how would I test it ? None of the ast2600
systems in the Linux kernel enables it. The devicetree include file for
ast2600 doesn't even have an entry for it. I could cook something up,
but that would not reflect real hardware.

Thanks,
Guenter
