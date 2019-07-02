Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp4060945wru;
        Tue, 2 Jul 2019 10:53:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzKBPsbmGpdBJvI142h3V10vce/pUscv1/Dlx3Xeq/OK/v6WVsc2oSqH1AX63Ola97knHD2
X-Received: by 2002:a50:84e2:: with SMTP id 89mr37372546edq.218.1562090002075;
        Tue, 02 Jul 2019 10:53:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562090002; cv=none;
        d=google.com; s=arc-20160816;
        b=EQuLvb/ty4zFO/FDS4VVgSenAsvYbswuo2hptKJrf8fchmLfKuKOxfHqXUeMlLEVGJ
         v3WKffy6Fw+Hzu9OnnLLHLFyX7hH42wLPZjdyXOZnjRxEVPPOrHHAfwCyNolPvij3PDw
         4y26HWG5SbVcZTLpkXXGQUIUCo5unlx/fsonc6gHWUR45RcX9RSSddm0yibV7yfvRR0e
         Ve2CwmnVw8jlCVkz7UbTDSeZlc9M2t7W7jAI3MfcZ6LrtLsX4wXRUMFIExTk8rWVyIms
         rw5YX0ux9MMxjdcgj0fV+ErT0hFxwOFz/YXVzPdj+hE063qwNkd79VhPpVzyfYotP9Mo
         krKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=fMhjUBszIrEjyyu4IyeLoSfp6Qi5xqaef0VPVrzvfUY=;
        b=uRWvIvgXITi1CntxS1en7IVujzuQ1ghTn588aO36qMw8XazlYLzrpZpc8RHgxSj1uK
         gjMYLmb0ROVMQK1GNwZ2YrmhR7EE4SOJnKte9uBcj8cog93Y2vUxwmxiING426aQaMCN
         SvpPoVjoKPUnAqkQa63/WQf6B5MqPS+Zc00MvAGe+lGlqRQxceYiX7jj2qcX79qWaY7v
         7RzkBHzENWu5yKIgRaC8RcqBYD0KuxvIxUT8cv59TDKZR4Na1VGDlJS3w3on5z+6eLy+
         KaA3TOX9pveOdSKUVSbIRIdB8mPbPur9X3d0jOFHjrpbvG7dpb4N9iFbCw4y41v6MByk
         sqVA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gh2si9329523ejb.254.2019.07.02.10.53.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2019 10:53:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hiMy0-0005BF-4V
	for alex.bennee@linaro.org; Tue, 02 Jul 2019 13:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55218)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hiM8p-0003vS-46
 for qemu-arm@nongnu.org; Tue, 02 Jul 2019 13:00:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hiM8n-0005QU-6O
 for qemu-arm@nongnu.org; Tue, 02 Jul 2019 13:00:27 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45847)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hiM8m-0005PJ-Vw
 for qemu-arm@nongnu.org; Tue, 02 Jul 2019 13:00:25 -0400
Received: by mail-wr1-f68.google.com with SMTP id f9so18632585wre.12
 for <qemu-arm@nongnu.org>; Tue, 02 Jul 2019 10:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fMhjUBszIrEjyyu4IyeLoSfp6Qi5xqaef0VPVrzvfUY=;
 b=S4N6Q/J5P0y4TlQrC+8Uj7VYjD7OttPtESuxAluippwupEwdN/jbdWweCrSysTsAFe
 jFlLJ7oNE4AeugtpO316T/iK9ncmn4EavIffgB0i3uqiFdd+wgMGtFTrESg9JFFzdHcW
 pr/UdOh84CHOj3yMN4Q/5UPfOPtlBKH83xyZRsbhaBO+l79dlr1ISu9ZwT9J4K9zuMtw
 pnwlRpiS+qVpEXUwR71zOUIA2MdBki2QnUmPqVvWHhIsDV8B7FNqTRPS6BOw91uyRkf9
 mOQ2gIglG5uOJaLWvhMX0IOeH9JvHQCibLWGnLDtzf4fWlRXA4gICye5V1YuXIUyuVO1
 Jitg==
X-Gm-Message-State: APjAAAVsBXx2vfPl/UbiuanI0Qu2+35/+sVgTr40pO3TzTtZbnxi7XLZ
 m37oKAMOgO3/q9tReVBWznNXDg==
X-Received: by 2002:adf:ed50:: with SMTP id u16mr12166638wro.108.1562086823166; 
 Tue, 02 Jul 2019 10:00:23 -0700 (PDT)
Received: from [192.168.1.38] (56.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.56])
 by smtp.gmail.com with ESMTPSA id q20sm20515867wra.36.2019.07.02.10.00.22
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jul 2019 10:00:22 -0700 (PDT)
To: Alistair Francis <alistair23@gmail.com>
References: <20190701123108.12493-1-philmd@redhat.com>
 <20190701123108.12493-6-philmd@redhat.com>
 <CAKmqyKMWb5LE=gtdDpbEUcceGD9T3V9gNAXfo16sOuQh2hCVgg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <4c4ea506-edd8-521d-b75f-31362a75f392@redhat.com>
Date: Tue, 2 Jul 2019 19:00:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMWb5LE=gtdDpbEUcceGD9T3V9gNAXfo16sOuQh2hCVgg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 5/6] hw/dma/xilinx_axi: Use
 object_initialize_child for correct ref. counting
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
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pHp0eoHrhbzG

On 7/2/19 6:18 PM, Alistair Francis wrote:
> On Mon, Jul 1, 2019 at 5:32 AM Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> As explained in commit aff39be0ed97:
>>
>>   Both functions, object_initialize() and object_property_add_child()
>>   increase the reference counter of the new object, so one of the
>>   references has to be dropped afterwards to get the reference
>>   counting right. Otherwise the child object will not be properly
>>   cleaned up when the parent gets destroyed.
>>   Thus let's use now object_initialize_child() instead to get the
>>   reference counting here right.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Alistair
> 
>> ---
>>  hw/dma/xilinx_axidma.c | 16 ++++++++--------
>>  1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
>> index 921be178d9..91f5ec587f 100644
>> --- a/hw/dma/xilinx_axidma.c
>> +++ b/hw/dma/xilinx_axidma.c
>> @@ -563,14 +563,14 @@ static void xilinx_axidma_init(Object *obj)
>>      XilinxAXIDMA *s = XILINX_AXI_DMA(obj);
>>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>>
>> -    object_initialize(&s->rx_data_dev, sizeof(s->rx_data_dev),
>> -                      TYPE_XILINX_AXI_DMA_DATA_STREAM);
>> -    object_initialize(&s->rx_control_dev, sizeof(s->rx_control_dev),
>> -                      TYPE_XILINX_AXI_DMA_CONTROL_STREAM);
>> -    object_property_add_child(OBJECT(s), "axistream-connected-target",
>> -                              (Object *)&s->rx_data_dev, &error_abort);
>> -    object_property_add_child(OBJECT(s), "axistream-control-connected-target",
>> -                              (Object *)&s->rx_control_dev, &error_abort);
>> +    object_initialize_child(OBJECT(s), "axistream-connected-target",
>> +                            &s->rx_data_dev, sizeof(s->rx_data_dev),
>> +                            TYPE_XILINX_AXI_ENET_DATA_STREAM, &error_abort,
>> +                            NULL);
>> +    object_initialize_child(OBJECT(s), "axistream-control-connected-target",
>> +                            &s->rx_control_dev, sizeof(s->rx_control_dev),
>> +                            TYPE_XILINX_AXI_ENET_CONTROL_STREAM, &error_abort,
>> +                            NULL);
>>
>>      sysbus_init_irq(sbd, &s->streams[0].irq);
>>      sysbus_init_irq(sbd, &s->streams[1].irq);
>> --
>> 2.20.1

As GCC suggested, this patch requires this snippet squashed:

-- >8 --
diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
@@ -565,11 +565,11 @@ static void xilinx_axidma_init(Object *obj)

     object_initialize_child(OBJECT(s), "axistream-connected-target",
                             &s->rx_data_dev, sizeof(s->rx_data_dev),
-                            TYPE_XILINX_AXI_ENET_DATA_STREAM, &error_abort,
+                            TYPE_XILINX_AXI_DMA_DATA_STREAM, &error_abort,
                             NULL);
     object_initialize_child(OBJECT(s),
"axistream-control-connected-target",
                             &s->rx_control_dev, sizeof(s->rx_control_dev),
-                            TYPE_XILINX_AXI_ENET_CONTROL_STREAM,
&error_abort,
+                            TYPE_XILINX_AXI_DMA_CONTROL_STREAM,
&error_abort,
                             NULL);

     sysbus_init_irq(sbd, &s->streams[0].irq);
---

Since it was commented in reply to the cover, I assume your R-b stands
with the snippet applied.

Thanks for reviewing,

Phil.
