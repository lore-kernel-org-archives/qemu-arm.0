Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp4947806lfh;
        Thu, 2 Jun 2022 07:30:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3BHYxLHIWT7+pvdAfGoFt+GCUfkM2wt6lczNZaHYhNj90adZB97iMXaJx+3AqUcQJ7BlA
X-Received: by 2002:a05:620a:410a:b0:6a6:5b66:5b85 with SMTP id j10-20020a05620a410a00b006a65b665b85mr3642669qko.140.1654180252129;
        Thu, 02 Jun 2022 07:30:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654180252; cv=none;
        d=google.com; s=arc-20160816;
        b=l1PmORKu24IRbObIy9fEy/C8KoiARZWmy9Vjh8cXk1AeCu1gsnarANhFmsmq1hYoGW
         2uGs1G6/W78yxbYwjzrRtng+i/0Q3iVewf7VlpI4/jwApIg5yyfoaM3wwEiEavjEgcCn
         +v0cKRRhY8JND/p46bK1c41aMam9KtCbLs96yIpIgByp8XCmSUQLQwdKhgpXF5gefQH+
         M08qXccgbFbrpm6XRnN1JMFo/lxiJAnPliQO91giNzBAWrc9/mBeYK/9/8SOJel9xzAZ
         rpFRky5koKEVGFy6cctv1LIMUMRKNKHaEm9613wgksjv1a9l+rOOB2qwqAPxv/FVLtwD
         qxRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ibKNJ57x06ziCBIaVesf9g9US9F+iSJ+3j86iBX8gLo=;
        b=zVBK8zfIb6WXTtdz22zbIWKC/vI17W+Hh2CaQ304nMB5gR/i32ftNnWB8XngVVi9C0
         7NmfdDx5T3X7SYfqsdKg02ClNc00GphrKz0ktqTWouqUC3fm5M5aLoI/6gUMMK8PaUYg
         sh44ZxJtqoTVK2avGmhmAqx6XvMhGuyTxuoc3c3nrGPlBpk3HIQYeVF50vRqv58r1S8w
         MfTlqQG0B3NDRbCPNP1/AnHS7WaE2XjnXPBN40XCHRE6QIkUYlu95Y4pAN9PURCBb5n7
         /o+7EgXuSrXEnqpSRMRxqNpHwnx+XbgSN/ZR2hEmS6tn8kFKMl4h5Y3D5B22u8rnp80r
         3xyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=YTjPz46d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p6-20020a05622a048600b00304d080ebb1si941710qtx.393.2022.06.02.07.30.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 07:30:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=YTjPz46d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1]:34194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwlqd-0006TY-LT
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 10:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1nwlq9-0006SB-IG; Thu, 02 Jun 2022 10:30:37 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:30988)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1nwlq1-0005Ju-EB; Thu, 02 Jun 2022 10:30:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654180213; x=1685716213;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ibKNJ57x06ziCBIaVesf9g9US9F+iSJ+3j86iBX8gLo=;
 b=YTjPz46dLy6jLHcTFxy8PqW+RiJA49JnX1ZAd+16V30eCrHzRRyvT/Dc
 YNQJ/VPxvoyq1amS/HvHh+QpHI+s0FhcpeOAJW4YmTN+iLoN+WgYJaISq
 5I9Bq9Z9AEfIFYjC+OtAcPzJecKSiA4DjkTQQeNAz8VvN+I0GH+7Iky4N o=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 02 Jun 2022 07:30:02 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 07:30:02 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 2 Jun 2022 07:30:01 -0700
Received: from [10.110.107.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 2 Jun 2022
 07:30:00 -0700
Message-ID: <5683a737-8a15-20c5-5716-f5216d6c33c8@quicinc.com>
Date: Thu, 2 Jun 2022 07:29:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH v2 0/6] hw/i2c: i2c slave mode support
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Klaus Jensen
 <its@irrelevant.dk>
CC: <qemu-devel@nongnu.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 <qemu-arm@nongnu.org>, Peter Delevoryas <pdel@fb.com>, Peter Maydell
 <peter.maydell@linaro.org>, Corey Minyard <cminyard@mvista.com>, "Padmakar
 Kalghatgi" <p.kalghatgi@samsung.com>, Damien Hedde
 <damien.hedde@greensocs.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Arun Kumar Kashinath Agasar <arun.kka@samsung.com>, "Klaus
 Jensen" <k.jensen@samsung.com>, Zev Weiss <zev@bewilderbeest.net>
References: <20220601210831.67259-1-its@irrelevant.dk>
 <6e0eb197-25c2-6b1e-2c19-f93597e29cff@kaod.org> <YphzHGNYErSMEfPw@apples>
 <00e2d10a-20f5-8357-5b13-41791940ce19@kaod.org>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <00e2d10a-20f5-8357-5b13-41791940ce19@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=quic_jaehyoo@quicinc.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: //5N1Rb6+3VH

Hi Klaus,

On 6/2/2022 6:50 AM, Cédric Le Goater wrote:
> On 6/2/22 10:21, Klaus Jensen wrote:
>> On Jun  2 09:52, Cédric Le Goater wrote:
>>> On 6/1/22 23:08, Klaus Jensen wrote:
>>>> From: Klaus Jensen <k.jensen@samsung.com>
>>>>
>>>> Hi all,
>>>>
>>>> This RFC series adds I2C "slave mode" support for the Aspeed I2C
>>>
>>> I think you can remove the RFC prefix.
>>>
>>>> controller as well as the necessary infrastructure in the i2c core to
>>>> support this.
>>>>
>>>> v2 changes
>>>> ~~~~~~~~~~
>>>> I finally got around to working on this again. I'm sorry for not
>>>> bringing a v2 to the table earlier.
>>>>
>>>> Mad props to Peter and Jonathan for putting this series to work and
>>>> pushing it forward! Thanks!
>>>>
>>>> This series is based off Cédric's aspeed-7.1 tree, so it includes the
>>>> register fields. This is all "old register mode", but Peter seems to
>>>> have added support in new mode.
>>>>
>>>> There are some loose ends of course, i.e send_async doesn't handle
>>>> broadcast and asynchronous slaves being sent stuff can't nack. But I
>>>> wanted to get some feedback on the interface before I tackle that.
>>>>
>>>> This series
>>>> ~~~~~~~~~~~
>>>> Patch 1 and 2 are small Aspeed I2C changes/additions.
>>>>
>>>> Patch 3 adds support for multiple masters in the i2c core, allowing
>>>> slaves to master the bus and (safely) issue i2c_send/recv().
>>>>
>>>> Patch 4 adds an asynchronous send i2c_send_async(I2CBus *, uint8) on 
>>>> the
>>>> bus that must be paired with an explicit ack using i2c_ack(I2CBus 
>>>> *). We
>>>> have previously discussed how we wanted to handle the issue that some
>>>> slaves implement this and some do not. Using a QOM interface was up, 
>>>> but
>>>> couldn't figure out a good way to do it. I ended up decided against it
>>>> since I believe this have to be a run-time check anyway. The problem is
>>>> that a slave can master the bus and try to communicate with *anyone* on
>>>> the bus - and there is no reason why we should only allow asynchronous
>>>> slaves on the bus in that case, or whatever we would want to do when
>>>> devices are plugged. So, instead, the current master can issue an
>>>> i2c_start_send() and if that fails (because it isnt implemented by the
>>>> target slave) it can either bail out or use i2c_start_send_async() 
>>>> if it
>>>> itself supports it. This works the other way around as well of course,
>>>> but it is probably simpler to handle slaves that respond to
>>>> i2c_start_send(). This approach relies on adding a new i2c_event, which
>>>> is why a bunch of other devices needs changes in their event handling.
>>>>
>>>> Patch 5 adds *partial* slave mode functionality to the emulated Aspeed
>>>> I2C controller, that is, it only supports asynchronous sends started by
>>>> another slave that is currently mastering the bus. No asynchronous
>>>> receive.
>>>
>>> If there are no objections, I think this is a good way to move forward
>>> and improve this initial implementation when the need arises.
>>>
>>
>> There is an outstanding issue with the SLAVE_ADDR_RX_MATCH interrupt bit
>> (bit 7). Remember from my first series I had a workaround to make sure
>> it wasnt masked.
>>
>> I posted this upstream to linux
>>
>>    
>> https://lore.kernel.org/lkml/20220602054842.122271-1-its@irrelevant.dk/
>>
>> Not sure if that is the right way to fix it. 
> 
> That's weird. I would have thought it was already enabled [ Adding Jae ]

Slave mode support in Aspeed I2C driver is already enabled and it has
worked well so far. The fix Klaus made in the link is incorrect.

https://lore.kernel.org/lkml/20220602054842.122271-1-its@irrelevant.dk/

The patch is adding ASPEED_I2CD_INTR_SLAVE_MATCH as a mask bit for
I2CD0C (Interrupt Control Register) but actually this bit is part of
I2CD10 (Interrupt Status Register). Means that the slave match interrupt
can be enabled without enabling any mask bit in I2CD0C.

Thanks,
Jae

>> You mentioned something about "fixing" a mask on the ast2600?
> 
> This can be addressed later.
> 
> The model could be more precise since the driver is masking the value
> already we should be fine. See commit 3fb2e2aeafb2 ("i2c: aspeed: disable
> additional device addresses on ast2[56]xx") from Zeiv.
> 
>  From the datasheet.
> On the AST2400 (only 1 slave address)
> 
>    * no upper bits
> 
> On the AST2500 (2 possible slave addresses),
> 
>    * bit[31] : Slave Address match indicator
>    * bit[30] : Slave Address Receiving pending
> 
> On the AST2600 (3 possible slave addresses),
> 
>    * bit[31-30] : Slave Address match indicator
>    * bit[29] : Slave Address Receiving pending
> 
> Thanks,
> 
> C.
> 
>>
>> But with the above patch, all works an intended and no "workaround"
>> required.
>>
>>>> Finally, patch 6 adds an example device using this new API. The device
>>>> is a simple "echo" device that upon being sent a set of bytes uses the
>>>> first byte as the address of the slave to echo to.
>>>>
>>>> With this combined I am able to boot up Linux on an emulated Aspeed 
>>>> 2600
>>>> evaluation board and have the i2c echo device write into a Linux slave
>>>> EEPROM. Assuming the echo device is on address 0x42:
>>>>
>>>>     # echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-15/new_device
>>>>     i2c i2c-15: new_device: Instantiated device slave-24c02 at 0x64
>>>>     # i2cset -y 15 0x42 0x64 0x00 0xaa i
>>>>     # hexdump /sys/bus/i2c/devices/15-1064/slave-eeprom
>>>>     0000000 ffaa ffff ffff ffff ffff ffff ffff ffff
>>>>     0000010 ffff ffff ffff ffff ffff ffff ffff ffff
>>>>     *
>>>>     0000100
>>>
>>> I have started working on buildroot images  :
>>>
>>>    https://github.com/legoater/buildroot/commits/aspeed
>>>
>>> The resulting files are quite small :
>>>
>>>      $ ll output/images/
>>>      total 86040
>>>      drwxr-xr-x 2 legoater legoater     4096 Jun  1 20:01 ./
>>>      drwxrwxr-x 6 legoater legoater     4096 Jun  1 19:40 ../
>>>      -rwxr-xr-x 1 legoater legoater    36837 Jun  1 20:01 
>>> aspeed-ast2600-evb.dtb*
>>>      -rw-r--r-- 1 legoater legoater 67108864 Jun  1 20:01 flash.img
>>>      -rw-r--r-- 1 legoater legoater  6682796 Jun  1 20:01 image.itb
>>>      -rw-r--r-- 1 legoater legoater     1846 Jun  1 20:01 image.its
>>>      -rw-r--r-- 1 legoater legoater  3168768 Jun  1 20:01 rootfs.cpio
>>>      -rw-r--r-- 1 legoater legoater  1026660 Jun  1 20:01 rootfs.cpio.xz
>>>      -rw-r--r-- 1 legoater legoater  3788800 Jun  1 20:01 rootfs.tar
>>>      -rw-r--r-- 1 legoater legoater   653777 Jun  1 20:00 u-boot.bin
>>>      -rw-r--r-- 1 legoater legoater  5617280 Jun  1 20:01 zImage
>>>
>>> I will probably host them on GH and we could use them under avocado
>>> to extend the tests.
>>>
>>>
>>> They should boot real HW. I will submit the defconfigs to buildroot
>>> after more tests and cleanups.
>>>
>>
>> Nice!
> 
