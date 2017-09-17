Received: by 10.223.172.38 with SMTP id v35csp3208248wrc;
        Sun, 17 Sep 2017 16:57:40 -0700 (PDT)
X-Received: by 10.55.33.75 with SMTP id h72mr16511965qkh.132.1505692660450;
        Sun, 17 Sep 2017 16:57:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505692660; cv=none;
        d=google.com; s=arc-20160816;
        b=CeEmi13/MMUtc5ca4I+shdQ1KvQy/fm4AWik+4k1T6RnLmOWgEXzckK6+882jVW3pC
         ThhwkeQiYAfn9YRo8T0Zksi6mpG1/0ZEMHsAq6Q/ML63jAJsXPAIHvy4c6PUo92ApyfH
         Rt9T5rnHIeF9HzTdr3BxXfDFYlcwEPgLC8bYm9uP4MF/09G5+gfit6N8tMKgBAzswJf8
         Anu360L/BuGJxRaIxIO/ANGjg3y9FbS9V0HF1KO2oPNkAh++rf13zL0F3oSXdx7TuP8x
         F2I8+X6CxK59F4Gu7RZPtBj1iK+1IcvC1M2lRXzHKFUKBB7h7qOiIhpyUuID0PDs7xhj
         IlCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:dkim-signature
         :arc-authentication-results;
        bh=gIVbESx5iaYy8G+vszQ2UHPqCHk14lrXkU7y8GXn03Q=;
        b=U9Aq9MDwuJkLrSjsV6tHV8jmK3p+xckr1B8pej7MLpIzV81d42tGfPyQME/HUFPDYo
         7yQgUnpT0LGzcau/Avd3ShBgcz++sdpRb4IPfHSBXg6ujJxn/wG9whHDOobg7BvUPGp5
         CsESkHfDR/taA4JEsvcrcF0Cr3jnqEWQzGpO88AyRHXfnWvQpuP0/TdbS386MNESDTiN
         YBDgj46nG2Ml98Gay2+3Kfu9sjrzjwyVsKFQzTFQjhy6zeDfz/1NiuKZ0jRwZaDi+2E3
         TkNlTEFM5wwqlEfGrGxGpx/QRfMlHSydoHGS998odJYx50uMS944Z09fJQSrmvHlxdPb
         FZMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZkIzMFMG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z76si5722395qkb.404.2017.09.17.16.57.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Sep 2017 16:57:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZkIzMFMG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34042 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dtjRS-0005fh-7l
	for alex.bennee@linaro.org; Sun, 17 Sep 2017 19:57:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dtjRL-0005fZ-Uo
	for qemu-arm@nongnu.org; Sun, 17 Sep 2017 19:57:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dtjRI-00067Z-3l
	for qemu-arm@nongnu.org; Sun, 17 Sep 2017 19:57:32 -0400
Received: from mail-qt0-x235.google.com ([2607:f8b0:400d:c0d::235]:55095)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dtjRH-00067O-Va; Sun, 17 Sep 2017 19:57:28 -0400
Received: by mail-qt0-x235.google.com with SMTP id i13so6116087qtc.11;
	Sun, 17 Sep 2017 16:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:from:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=gIVbESx5iaYy8G+vszQ2UHPqCHk14lrXkU7y8GXn03Q=;
	b=ZkIzMFMG5JVb5n8lT+94vHUJCRCYFaJRVkDdnwITve+Glnkxh8M8ZXbyMhV0AUT2MI
	VxDfV/za+/ma7PGD6GQJLtMeJwl0htd4RI5Gh8oUzy+h2KHYfj6DVgb755EV4wdAWyR4
	2luzzCIC4Hqrbkw+Vjqj2MQT9AK0sdRGMVmTXmwlo4HSpERvxFT5uin5RGhZvkXfG+tY
	vFudC4LQJ4gUTk/skTJINJaFZAVcpp07Xg9sTddTZSi7fRVfQxoHc/Vxl4sxwi1y9r6S
	zvzHS04UBOCmMI/NtQU55yH0lxvYqLmuAeaZmcOONMLE/MJ/BGlEbjdAK1H5cD331MDa
	1iTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=gIVbESx5iaYy8G+vszQ2UHPqCHk14lrXkU7y8GXn03Q=;
	b=MFj6RMNq/5WWQ4l2YYhbkbrJx6MP38MwITSuH2ZBVB0Fj+KUtJQ991WkW07reYr+T6
	uHMNyfamhsv20MWhnOakW+Yl2W58wzSyGpN2iOyCJl4bSNmDAHY/7evgAUKdulvdHE5/
	irE2uex58WpRpvemo7JwUTvnUW9HqSwknJqlcQOcWoJSU61SSre7ur2wf3Un1fAt0Mal
	ItLlzd4de24aZFB3diPIugak/4iEJFrXQejA/iTISAlVyIdIUygSFCppEtfdwj1K3ccm
	f27+RzjgiOmHwqSuPv8ccBvLgvn6GEfBou87upWBPUWlIHfcroWvLTYfTw2baJsnQime
	IGcg==
X-Gm-Message-State: AHPjjUiB5xEibC8fOyFVnDMvXQFcHmXfW76qFY128U5awOWskfMzAhPJ
	UzVeRG4iIluUUw==
X-Google-Smtp-Source: AOwi7QB9lIziwU6XiypoewQ/O7yZZ2Q+ox9bALepCwZWqLaWryciQN5CujSaa+Mb3Gs3X0HIinnQKA==
X-Received: by 10.200.44.107 with SMTP id e40mr44492383qta.262.1505692647342; 
	Sun, 17 Sep 2017 16:57:27 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	g15sm4279445qtk.47.2017.09.17.16.57.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Sep 2017 16:57:26 -0700 (PDT)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>
References: <1504812251-23438-1-git-send-email-sundeep.lkml@gmail.com>
	<1504812251-23438-3-git-send-email-sundeep.lkml@gmail.com>
	<a9891f10-9643-96ee-7f99-7a384b9ea302@amsat.org>
Message-ID: <3618281c-b4f9-3a1a-8b6f-f87dfeb54e45@amsat.org>
Date: Sun, 17 Sep 2017 20:57:23 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <a9891f10-9643-96ee-7f99-7a384b9ea302@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::235
Subject: Re: [Qemu-arm] [Qemu devel v8 PATCH 2/5] msf2: Microsemi
 Smartfusion2 System Register block
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bJE3fdFPqTZZ

Hi Sundeep,

On 09/14/2017 01:36 AM, Philippe Mathieu-Daudé wrote:
> On 09/07/2017 04:24 PM, Subbaraya Sundeep wrote:
[...]
>> +static inline int msf2_divbits(uint32_t div)
> 
> Please directly use ctz32() instead of msf2_divbits()

It seems you missed this review comment in your v9.

> 
>> +{
>> +    int ret = 0;
>> +
>> +    switch (div) {
>> +    case 1:
>> +        ret = 0;
>> +        break;
>> +    case 2:
>> +        ret = 1;
>> +        break;
>> +    case 4:
>> +        ret = 2;
>> +        break;
>> +    case 8:
>> +        ret = 4;
>> +        break;
>> +    case 16:
>> +        ret = 5;
>> +        break;
>> +    case 32:
>> +        ret = 6;
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +
>> +    return ret;
>> +}
