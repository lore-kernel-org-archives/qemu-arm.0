Received: by 10.223.172.38 with SMTP id v35csp1150692wrc;
        Thu, 14 Sep 2017 10:45:37 -0700 (PDT)
X-Received: by 10.200.45.208 with SMTP id q16mr34476933qta.103.1505411137486;
        Thu, 14 Sep 2017 10:45:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505411137; cv=none;
        d=google.com; s=arc-20160816;
        b=oPii384PqxmP3fdGpYejVWBozNHv8YYf0Q40Xy7BB4R8oAoLqxOWZSHb8ZxPOREvOb
         C1RC3G96lnP3JqLD2gJyB3+jdQ9q8DIKfOZEfYlvYgJEPibJiG7UnQ+EdH2ciIV3EIDq
         fJQ5NZamS97QYXYYgbiTyuL9pBaFkgSp0D6Pltm8Y5eaw+3yQqc5gH+r1dliU8Gmh7Du
         8rCPpbd9Gjg+kEV4m/g6idPKFchkRsBvGTGyNb89AvwYTlNqRS0yIXvjPenMnsedCixJ
         Xm1Yd9IjAHq2R5Mp+e20EQKS7OmQdyqbdu5o2xIzqno0WwCoECT8VXy6bEQnL1F22Fyx
         rnBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=BwRpBdIIrbnjCWs4843v3R/yvpfBZ6nYFIcV5m2G7yo=;
        b=xwHlhZ6Kuyxnq6L656zxPAluK15cVKou5KOa94UldIH72iFJrC9n1d9jCKifmCQr78
         Ddl9Ac38ICyajIMR9mGg85/dDKUCQfyQKEqD83YAPqqlydFUfHvNggJxHjFrr8GfZHDf
         O/EW2KsEmPQGtSqWWrMRhMbafK99QVkvzE/AE2ndms+a7Qu3UkwwY5wauqpo0hIt+Rn2
         M7Ks5wclBbIWUF1SPxCqApV2/qRmwe1xffUtL7SeNjmNBSYX3Dw4kD9EGXDBi1aYMio3
         eOi2q1LcFqBE86g6rIy6WxbV05HVyjKK+NyPWV+6BwmKfxw+eXmmBn124F6yeaELO6Ty
         8PMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UQVGoiPq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c8si7522252qta.516.2017.09.14.10.45.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Sep 2017 10:45:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UQVGoiPq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49158 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsYCl-0004sX-5k
	for alex.bennee@linaro.org; Thu, 14 Sep 2017 13:45:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dsYCb-0004sC-UY
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 13:45:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dsYCW-0002a2-VB
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 13:45:25 -0400
Received: from mail-qk0-x22e.google.com ([2607:f8b0:400d:c09::22e]:44616)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dsYCW-0002Zg-PJ; Thu, 14 Sep 2017 13:45:20 -0400
Received: by mail-qk0-x22e.google.com with SMTP id b23so82993qkg.1;
	Thu, 14 Sep 2017 10:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=BwRpBdIIrbnjCWs4843v3R/yvpfBZ6nYFIcV5m2G7yo=;
	b=UQVGoiPqtGAzQFQhj3D+eLUPB8doGJ18TgzJX/e1o88/zzfVB7Z/Di+IvRvXRSuWgi
	TBUN7ouTBKZVS64qlo4bL2+52DI49xedZ6EjcDCucxIVHSuc4aU+zpen560sfNwtOyV0
	dRn0UdxRWS/49IRCmEZeC8JpUAWyFEcuxsIshdJPtOaMCVkXY2E2cd4oOsFsyaYILJjW
	7d2We2eYlPVdv/5i+AzTFjG+5FggsEjpUtpB3LXyVPESjFdEGjjYctvh6WdwzNu40kG7
	SVQLANKn8+AubGJydzt04vrWq+NA8SDtMtk905c566mVJtRMcDgShOMljvmK5BP6CBri
	2I3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=BwRpBdIIrbnjCWs4843v3R/yvpfBZ6nYFIcV5m2G7yo=;
	b=scLqcOnO1O79hkxSkhphFy9mI00kzTHsN2zBs7afvqlX2yWb21u8CuaNl0ij/pt7pX
	qCiadt+JJaSyd8vv7oFD4AJLPkC8KI39p1lgtiLUe9Nrf2o78gpDe7C44YW34skNPrPo
	/gKeTRj2ibR8hUTNZcnmmltxAxAePmjMySmm6K7pIZNQt2Np1yLXb4gaWp1KOSD612P8
	U3YrCTTsNdm8iqXYC18trJR/pGmS1j0kECYJSxAtbr2gosG+lpukRsO0dnoh+fsCQdVU
	Ar7usxXB8vmtEYmPROy2gEuLZc3ZBj9bDKJoP7xCIL3vsO/RtGjDF7tIk0/PF8p9Uz8d
	Tfpw==
X-Gm-Message-State: AHPjjUjPEMmMxqXyMyNmoODvXJa++ZQnVZbueBQ4l8Z4op5ngDRAxVnQ
	RaBqIk+/uvZmlQ==
X-Google-Smtp-Source: AOwi7QBi7bjwoJIaU5vFXtklGXNeTXsIu3vEPolSDrfaTDbmZTbK7QhkgvnxFskSb8p4hgN+uQiMsQ==
X-Received: by 10.233.221.199 with SMTP id r190mr3859079qkf.174.1505411120186; 
	Thu, 14 Sep 2017 10:45:20 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	n85sm11332294qke.53.2017.09.14.10.45.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Sep 2017 10:45:19 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1504812251-23438-1-git-send-email-sundeep.lkml@gmail.com>
	<1504812251-23438-6-git-send-email-sundeep.lkml@gmail.com>
	<CAFEAcA_D=4M2vyo4m2xPi_hFDCmoKHk5kLY3s1ota602ywgHTQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ac9843a0-7121-57df-681f-fc5321b6d4c6@amsat.org>
Date: Thu, 14 Sep 2017 14:45:16 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_D=4M2vyo4m2xPi_hFDCmoKHk5kLY3s1ota602ywgHTQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22e
Subject: Re: [Qemu-arm] [Qemu devel v8 PATCH 5/5] msf2: Add Emcraft's
 Smartfusion2 SOM kit
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
Cc: Alistair Francis <alistair23@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: StQDlZMAoI59

On 09/14/2017 02:14 PM, Peter Maydell wrote:
> On 7 September 2017 at 20:24, Subbaraya Sundeep <sundeep.lkml@gmail.com> wrote:
>> Emulated Emcraft's Smartfusion2 System On Module starter
>> kit.
>> +static void emcraft_sf2_machine_init(MachineClass *mc)
>> +{
>> +    mc->desc = "SmartFusion2 SOM kit from Emcraft (M2S010)";
>> +    mc->init = emcraft_sf2_s2s010_init;
>> +    mc->ignore_memory_transaction_failures = true;
> 
> Please don't set ignore_memory_transaction_failures in new boards.
> This is a legacy-old-code-only flag.
What about adding a such check in scripts/checkpatch.pl ?

     if ($line =~ /ignore_memory_transaction_failures\s+=/) {
         ERROR("ignore_memory_transaction_failures() is a 
legacy-old-code-only flag\n" . $herecurr);
     }

> 
> New boards should define enough devices, either properly
> or using create_unimplemented_device(), to make whatever code
> they're being tested against run.
> 
> This is a firm requirement for this code to go into master,
> because once we let a board in with the flag set it's almost
> impossible to clear it because we don't know what guest
> code that previously worked on the board will now break.
> 
> thanks
> -- PMM
> 
