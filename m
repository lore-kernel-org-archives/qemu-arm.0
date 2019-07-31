Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5546605wrv;
        Wed, 31 Jul 2019 04:31:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxciAGRSlAwF9aG+UuR2NYxBP1xRxEexRG3I/m3+/X08oaxIeQupiUJh6MH9q4yg/TAhvYs
X-Received: by 2002:a17:906:a952:: with SMTP id hh18mr94821586ejb.289.1564572704566;
        Wed, 31 Jul 2019 04:31:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564572704; cv=none;
        d=google.com; s=arc-20160816;
        b=PsNTIaX5NpLO2yPE422lcORX/9CUEk+YH26HOMFv2ptcD8x+QuyLBJKg3Mnoya9Xsg
         wwOggLhA2cL9CgHgrNv0ujRLExzkqPng1fmID1XV8mckw99jix30cvfgxS1RhOnwbyP2
         YZNrkVvibKhHPeaFlmpR4x/wd3WvEZjzCdJrzTqqW6Vhglj9mUqMw8eOMB5PDRVVptfn
         /w7RdDve2ta9X5SXwsErmuOdK5fDqajl+x/2brrs3CtPye4wBIkpNOa06dSX+vTd6mMo
         uygRGefnXt0YZPY9zKv9VPYeKQM9u100k+jTXeJxGTo83ZOPQ+v23MpxGmL0858fcsyd
         jlqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=lEP6IXPqk0vLYPpY+J/LxmochL46RDx+GK85vbTDDWM=;
        b=suHpnJ13Z6c+pPmZ0JvlLEQfWLJFkyLSbklqmOe2SvpAsLIaUm0zImagAoLUUSGxry
         4nLSZS8GOMb3fwMjcfnFbO4J0zQlX8SyWjJsq4nB67Jq0+wKsloM35yoCXCN+z7s6VlO
         pfgg3BzwnZ2iDHhpngqCPDTajlyAlxYbKt4noIWkKJjv7Zp5Pt/9R5soyndd2ZDDf1xv
         UlcLGN4eAqCxWxjuZ4VK0JdJnu8YWco6W2z2VxMfMx1uOCSRJjX3NNHrqdUXyrOw45Ec
         76j6diJc9a3rGYgI9nVzWHu2RUUDuYtLCfgGUMpX0MbSEzFefAxvwkHDZaiCPYuOMenb
         Yacw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3si17759181ejs.48.2019.07.31.04.31.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2019 04:31:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsmpb-0004p3-MQ
	for alex.bennee@linaro.org; Wed, 31 Jul 2019 07:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44613)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hsmpT-0004oY-RG
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 07:31:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hsmpS-000055-Fm
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 07:31:35 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39186)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hsmpS-0008UI-89
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 07:31:34 -0400
Received: by mail-wr1-f66.google.com with SMTP id x4so16121652wrt.6
 for <qemu-arm@nongnu.org>; Wed, 31 Jul 2019 04:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lEP6IXPqk0vLYPpY+J/LxmochL46RDx+GK85vbTDDWM=;
 b=gtzd2oEKtS7yHgo8wqSlUg/8ARhXPQ/A1hgXrXyH1ImF87DmGAybW9lbM1xNhuuPRa
 iS/i7jDwtaB1ER07tmtwZ9DybJD9+BKXZ0yaWFHkCnEriAmrBzQGw79H/B8ZuLwBFhOW
 fmjCRgqqJxSP31YcIf/OXyP4h8+NxQc5v3HtCrOVXOWgYt0ydvHNC0GVnKvMgBxAEWEE
 JHzMUlBx1ojis2Y2SxHzBGzrI8bFfPZEo1fvpQVbgiNteIrDFLskTvnkn5OowY3MqiRR
 x7zJiGJKz82lP/JqW3bZtGxW6lDw0pqu2kD7P1CI0Gvn0e5+tM4CTzWQATAkUwyLbWCU
 NEgQ==
X-Gm-Message-State: APjAAAXvxB10UfHEP8/+GIKJi6KI6/PwIX5a2+l3Dw4aw1Wkh2gC4KSh
 72BJLQf5LUDjfY2SkuTS8k3EwA==
X-Received: by 2002:adf:ed11:: with SMTP id a17mr46524486wro.112.1564572693103; 
 Wed, 31 Jul 2019 04:31:33 -0700 (PDT)
Received: from [192.168.43.238] (44.red-95-127-154.staticip.rima-tde.net.
 [95.127.154.44])
 by smtp.gmail.com with ESMTPSA id j10sm117734735wrd.26.2019.07.31.04.31.29
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 04:31:32 -0700 (PDT)
To: Damien Hedde <damien.hedde@greensocs.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-6-damien.hedde@greensocs.com>
 <20190731060533.GD2032@umbus.fritz.box>
 <51aa7e6d-3568-8485-4b67-a598a24a1f3d@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <e7b05c24-ecd1-a437-7d97-07d69ab759ec@redhat.com>
Date: Wed, 31 Jul 2019 13:31:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <51aa7e6d-3568-8485-4b67-a598a24a1f3d@greensocs.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 05/33] Switch to new api in
 qdev/bus
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, kraxel@redhat.com, edgar.iglesias@xilinx.com,
 hare@suse.com, qemu-block@nongnu.org, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, marcandre.lureau@redhat.com, thuth@redhat.com,
 ehabkost@redhat.com, alistair@alistair23.me, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, clg@kaod.org, jsnow@redhat.com, rth@twiddle.net,
 berrange@redhat.com, cohuck@redhat.com, mark.burton@greensocs.com,
 qemu-ppc@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RBJ4tcevwAmw

On 7/31/19 11:29 AM, Damien Hedde wrote:
> On 7/31/19 8:05 AM, David Gibson wrote:
>> On Mon, Jul 29, 2019 at 04:56:26PM +0200, Damien Hedde wrote:
>>> Deprecate old reset apis and make them use the new one while they
>>> are still used somewhere.
>>>
>>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>>> ---
>>>  hw/core/qdev.c         | 22 +++-------------------
>>>  include/hw/qdev-core.h | 28 ++++++++++++++++++++++------
>>>  2 files changed, 25 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
>>> index 559ced070d..e9e5f2d5f9 100644
>>> --- a/hw/core/qdev.c
>>> +++ b/hw/core/qdev.c
>>> @@ -312,25 +312,9 @@ static void device_foreach_reset_child(Object *obj, void (*func)(Object *))
>>>      }
>>>  }
>>>  
>>> -static int qdev_reset_one(DeviceState *dev, void *opaque)
>>> -{
>>> -    device_legacy_reset(dev);
>>> -
>>> -    return 0;
>>> -}
>>> -
>>> -static int qbus_reset_one(BusState *bus, void *opaque)
>>> -{
>>> -    BusClass *bc = BUS_GET_CLASS(bus);
>>> -    if (bc->reset) {
>>> -        bc->reset(bus);
>>> -    }
>>> -    return 0;
>>> -}
>>> -
>>>  void qdev_reset_all(DeviceState *dev)
>>>  {
>>> -    qdev_walk_children(dev, NULL, NULL, qdev_reset_one, qbus_reset_one, NULL);
>>> +    device_reset(dev, false);
>>>  }
>>>  
>>>  void qdev_reset_all_fn(void *opaque)
>>> @@ -340,7 +324,7 @@ void qdev_reset_all_fn(void *opaque)
>>>  
>>>  void qbus_reset_all(BusState *bus)
>>>  {
>>> -    qbus_walk_children(bus, NULL, NULL, qdev_reset_one, qbus_reset_one, NULL);
>>> +    bus_reset(bus, false);
>>>  }
>>>  
>>>  void qbus_reset_all_fn(void *opaque)
>>> @@ -922,7 +906,7 @@ static void device_set_realized(Object *obj, bool value, Error **errp)
>>>              }
>>>          }
>>>          if (dev->hotplugged) {
>>> -            device_legacy_reset(dev);
>>> +            device_reset(dev, true);
>>
>> So.. is this change in the device_reset() signature really necessary?
>> Even if there are compelling reasons to handle warm reset in the new
>> API, that doesn't been you need to change device_reset() itself from
>> its established meaning of a cold (i.e. as per power cycle) reset.
>> Warm resets are generally called in rather more specific circumstances
>> (often under guest software direction) so it seems likely that users
>> would want to engage with the new reset API directly.  Or we could
>> just create a device_warm_reset() wrapper.  That would also avoid the
>> bare boolean parameter, which is not great for readability (you have
>> to look up the signature to have any idea what it means).

If the boolean is not meaningful, we can use an enum...

> I've added device_reset_cold/warm wrapper functions to avoid having to
> pass the boolean parameter. it seems I forgot to use them in qdev.c
> I suppose, like you said, we could live with
> + no function with the boolean parameter
> + device_reset doing cold reset
> + device_reset_warm (or device_warm_reset) for the warm version
> 
> Damien
> 
