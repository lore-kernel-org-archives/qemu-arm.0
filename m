Received: by 2002:adf:a557:0:0:0:0:0 with SMTP id j23csp2274407wrb;
        Mon, 8 Jul 2019 03:31:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwk7oEKyhLFvERVzESvOj6Rqu526EYmNMoMqvqpb2BqWvgV6D00gzb3okPWxzrPSk7XMUAv
X-Received: by 2002:a17:907:384:: with SMTP id ss4mr15867980ejb.166.1562581885190;
        Mon, 08 Jul 2019 03:31:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562581885; cv=none;
        d=google.com; s=arc-20160816;
        b=Y66l5CFyPZGaG5srPsTSKn0iYn4Q3/4EwigLu2w90J6IdhVPedx1bScUN9H47d+HBg
         1G6ehnlSHRc9dVX6aXF3snf03ewWsp5fb1fK1P9boTzo4yfiqh96IkfUBCjcbv8M1FHi
         NrUpFie6T71NRd5h5injkKE7Y+IJUHCeo7zSBs95GUCXcptk4+Z/TSWtIbrBXE+Zb9Es
         HS0MrZF9UBPWHeT0imgYRs2knlRrwgpJOoMtlfI+NKXLfbjXbWxiT9jCur6O42uS4oe1
         AqQwL+G0DRlja5/t8r6k5eiCXgwhKbQG0EJi3ZzbVGmk681KPYqQPqaBMsjcIRY6bA2p
         VePg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=hF7UVqwijPHZ9t69gGwYDNbu+YA+hZic/Nq2VgyNwJ4=;
        b=FJ9nyt7CgXswm0Ya/QTJ56tn7tLqP6i2ZfbGFxI66onKFNiUSuPw2/BIpdnS8bKMoT
         M79L7n7D0511GnaFHu8eVRyUosNtJ2Tvvx2u69zuZeZNXFllbxVsgya3/TtgHbOqJhnX
         dSYOvYE1T9RkZIyc74tXFHYvIQ9bSumKXrwRTVzjqAv+s0DM9xvcgwT8Jhyt8sRVcP2w
         IKaVpLWfhEmHNG1fekoLd2FJ/SVt+qJBHbTplML6wblaKuKgSvVRMtrQR81oPiLTk0ai
         YoabAWYSFTuux/P+n4s5gtkGZmgirlpqrQFTNWDunAIfxV9x3bOjHcj4R7onuOU2eXNi
         x0ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15si660665ejj.350.2019.07.08.03.31.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jul 2019 03:31:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hkQvc-0007Ns-7u
	for alex.bennee@linaro.org; Mon, 08 Jul 2019 06:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36021)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hkQvL-0007KZ-Er
 for qemu-arm@nongnu.org; Mon, 08 Jul 2019 06:31:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hkQvK-0005m3-CR
 for qemu-arm@nongnu.org; Mon, 08 Jul 2019 06:31:07 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33137)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hkQvK-0005lX-0O
 for qemu-arm@nongnu.org; Mon, 08 Jul 2019 06:31:06 -0400
Received: by mail-wr1-f65.google.com with SMTP id n9so16480314wru.0
 for <qemu-arm@nongnu.org>; Mon, 08 Jul 2019 03:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hF7UVqwijPHZ9t69gGwYDNbu+YA+hZic/Nq2VgyNwJ4=;
 b=S/nJ7JKaLN3PyhHkveme/aA9ZtQul1N/BmPAE8aQkchVajye3GkZZXbw3x8wi9NvqY
 txgXCF/tmPr5wjliRQCT4TSsVfe+lxVrIF/RKD6tLz0p4lFkuYVrGoLaRTjBpaGhe7St
 tSacoIyhRCndm4aFuiVqrR+w26lUf3B+1XkTVuV9l9pr1UkD/c6LjtbHgb2j5pufthQl
 UUX/YMoGb3CwAVRkw4mE8//HIZ2hupgGaA0sM15VAMdy4H+ZV8PO6ebDHdPE3YOUppCJ
 zsnZmJYlsV/pIX630Lyf+0V8zLQozQWCBpYeQpif1K8m9j0wmb2K5GAZQNo/VnfeXWVw
 XteA==
X-Gm-Message-State: APjAAAVUOq1Z2b86UiplclyIESa2M1zuqF9GhXuQEeHG6SBCXd76DGPb
 u+7jfFC8JbxNK9p2ZfKq8J/MbxpAV/s=
X-Received: by 2002:adf:ea45:: with SMTP id j5mr17520034wrn.11.1562581864769; 
 Mon, 08 Jul 2019 03:31:04 -0700 (PDT)
Received: from [192.168.1.103] (56.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.56])
 by smtp.gmail.com with ESMTPSA id u18sm15832471wmd.19.2019.07.08.03.31.03
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jul 2019 03:31:04 -0700 (PDT)
To: Francisco Iglesias <frasse.iglesias@gmail.com>
References: <20190705202500.18853-1-philmd@redhat.com>
 <20190705202500.18853-4-philmd@redhat.com>
 <20190705222429.ox6z6wckkupjpug2@fralle-msi>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <cc2c2c78-70ad-f7e2-99a9-a428303c7f5e@redhat.com>
Date: Mon, 8 Jul 2019 12:31:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190705222429.ox6z6wckkupjpug2@fralle-msi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [RFC PATCH-for-4.1 v4 3/3] hw/ssi/xilinx_spips:
 Avoid out-of-bound access to lqspi_buf[]
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Prasad J Pandit <ppandit@redhat.com>, Lei Sun <slei.casper@gmail.com>,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cTMOOsJw9a+e

On 7/6/19 12:24 AM, Francisco Iglesias wrote:
> Hi Philippe,
> 
> On [2019 Jul 05] Fri 22:25:00, Philippe Mathieu-Daudé wrote:
>> Both lqspi_read() and lqspi_load_cache() expect a 32-bit
>> aligned address.
>>
>> Set MemoryRegionOps.impl values to force 32-bit accesses,
>> this way we are sure we do not access the lqspi_buf[] array
>> out of bound.
> 
> The patch and correction follows chapter 24 aswell (UG1085) so I suggest
> dropping 'RFC' in the subject.

OK.

>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> Late friday patch...
>>
>>  hw/ssi/xilinx_spips.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
>> index 3c4e8365ee..8f705132a3 100644
>> --- a/hw/ssi/xilinx_spips.c
>> +++ b/hw/ssi/xilinx_spips.c
>> @@ -1243,6 +1243,10 @@ static const MemoryRegionOps lqspi_ops = {
>>          .min_access_size = 1,
>>          .max_access_size = 4
>>      }
> 
> A comma is missing on the line above (else the patch doesn't compile).

Sorry, I first added this block before '.valid' and tested it, then
moved it and thought the trailing comma was not useful and forgot to
test for the previous '.valid' field :/

> 
> Best regards,
> Francisco
> 
>> +    .impl = {
>> +        .min_access_size = 4,
>> +        .max_access_size = 4,
>> +    }
>>  };
>>  
>>  static void xilinx_spips_realize(DeviceState *dev, Error **errp)
>> -- 
>> 2.20.1
>>
