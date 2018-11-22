Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp506773wrt;
        Thu, 22 Nov 2018 02:35:28 -0800 (PST)
X-Google-Smtp-Source: AJdET5czxoMmFSccBhmGy4QL873+/7oa/NrE183gZ+EDpYX6iDyayhhv9lj4ZW7fCC/GivdjK6xh
X-Received: by 2002:a0d:e384:: with SMTP id m126-v6mr10700305ywe.503.1542882927994;
        Thu, 22 Nov 2018 02:35:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542882927; cv=none;
        d=google.com; s=arc-20160816;
        b=lv69Y/amyhoZnmIFMM429T7HRhCWkTdQe0cHX1Vxbqu0xG39qATvsKGyyBPwiLqWtB
         T4l2W+4mo11mYYMca/W7U6Z0Zt1XLMRoX819KMfXG7RfPKpULWSZD/fFr4vVGFcqkoFT
         W3N4BqZvqROWlJ41EcvTYC1muFOJL3qBCtrroh9OeaRPDx+PFsQ/GQiD7/nHJsUXT7yt
         beUShGeiB4Ifm+oMAJal9prfhKvVUKSjV9D8uRe3utWc9htP5XY5wqlG+tp8UN9L+Rr3
         LpABfn5ThFIIBZJDIGwGsEKLSm1qbFYhbEJTpkfhujpiwda7n6YOo1br6JIsT+G8mO5v
         UhwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=pGmirgy+QmXYHN0CH6lEVTNDwUqdWmssa9kedAUo0SE=;
        b=W6ET4e834lihoDG8QOQ82Qgk6qBg7weq1nj2FKTdyufd4R/ZqCbUEx3496xZ3oWo9G
         8EmD9n/bLbZMSg2WXHdnobxxIUh/8G4Wcl1dxJ8EFDN7i9zcfQLqoAxqGDGmWJ8TU3oA
         tr01lqi9/rsqtMwrbH+PKzDlYynKOA+dbtfznH0EQ2V92fuV4KDlnh4rV2fi+SPdRbWC
         cIMxpD0N/vuJMVyEOOVaGDEiTQ9N09FaSG94zQMqmib8W0r7vAOBkHaTJziyMGzHLE0V
         21OLKvBh2f5TWoq7fx3MndtOivW1ECfn1Dqv2su0+wDaOtkY2e2APx1AlR+nNcBN0QfX
         e6ww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 199si5628212ywh.362.2018.11.22.02.35.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Nov 2018 02:35:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45057 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPmKV-00029Y-FT
	for alex.bennee@linaro.org; Thu, 22 Nov 2018 05:35:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42079)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gPmKO-00028c-0F
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 05:35:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gPmKK-0001HQ-0e
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 05:35:19 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35876)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gPmKJ-0001GF-QG
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 05:35:15 -0500
Received: by mail-wr1-f67.google.com with SMTP id t3so8725909wrr.3
	for <qemu-arm@nongnu.org>; Thu, 22 Nov 2018 02:35:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pGmirgy+QmXYHN0CH6lEVTNDwUqdWmssa9kedAUo0SE=;
	b=H8nZ44V+HzO7f46U9mHtxM3oJi7buwoILPHtEnSVMgz0R+NX+0CNR4cF/PWkAp/6Gw
	LIJoro9u2qqlTCgDfcwwaS+FKZCg3ZeRcHZsyUNmdyBYQGDtHGy7GUcrJSdRENMkQyfp
	fAjWKXutuSVooZ95xgVu0agsnjWf+qdAAltaX6IFGisbfp4TGMZIkFbdK3AeOnStgKdi
	YdVHJGA1klZWuc67tePTT2++Db8XdMo7/yxhJ2KbYmL8Bm0MPIQy/BrtRqI9RuY7SFF8
	adPd0ET0gm9IiU4qccEHLeSM3heSmLaTwThxpS5upPYRrFH9Zbn0O3Pffd9sUito+a2P
	M4vg==
X-Gm-Message-State: AA+aEWa+UY8FfZ8XBcYHZDdiWlx2hC9HNdE43smZjPfcXoXytVWXENfs
	9b8kvp+GVLx+FhHHJ3kRsuu0Sg==
X-Received: by 2002:adf:a20a:: with SMTP id
	p10-v6mr1807536wra.249.1542882914790; 
	Thu, 22 Nov 2018 02:35:14 -0800 (PST)
Received: from [192.168.1.33] (75.red-83-57-172.dynamicip.rima-tde.net.
	[83.57.172.75]) by smtp.gmail.com with ESMTPSA id
	j125-v6sm3833492wmb.12.2018.11.22.02.35.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 02:35:14 -0800 (PST)
To: Li Qiang <liq3ea@gmail.com>, jan.kiszka@web.de, peter.maydell@linaro.org
References: <1542880825-2604-1-git-send-email-liq3ea@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <e61b7517-a736-8cb5-ce35-815225f18c52@redhat.com>
Date: Thu, 22 Nov 2018 11:35:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <1542880825-2604-1-git-send-email-liq3ea@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [PATCH] hw: arm: musicpal: drop TYPE_WM8750 in
 object_property_set_link()
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, maozhongyi@cmss.chinamobile.com,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gjcsw1zAVC5n

Hi Li,

On 22/11/18 11:00, Li Qiang wrote:
> The third argument of object_property_set_link() is the name of
> property, not related with the QOM type name, using the constant
> string instead.

You are correct.

> 
> Signed-off-by: Li Qiang <liq3ea@gmail.com>
> ---
>  hw/arm/musicpal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
> index 9648b3af44..726ae29394 100644
> --- a/hw/arm/musicpal.c
> +++ b/hw/arm/musicpal.c
> @@ -1696,7 +1696,7 @@ static void musicpal_init(MachineState *machine)
>      dev = qdev_create(NULL, TYPE_MV88W8618_AUDIO);
>      s = SYS_BUS_DEVICE(dev);
>      object_property_set_link(OBJECT(dev), OBJECT(wm8750_dev),
> -                             TYPE_WM8750, NULL);
> +                             "wm8750", NULL);

Since this property is not related to migration, maybe we can resolve
this the other way, using TYPE_WM8750 in mv88w8618_audio_init():

-- >8 --
@@ -255,3 +255,3 @@ static void mv88w8618_audio_init(Object *obj)

-    object_property_add_link(OBJECT(dev), "wm8750", TYPE_WM8750,
+    object_property_add_link(OBJECT(dev), TYPE_WM8750, TYPE_WM8750,
                              (Object **) &s->wm,
---

So using the same definition would protect someone to accidentaly rename
the property name.

What do you think?

Regards,

Phil.

>      qdev_init_nofail(dev);
>      sysbus_mmio_map(s, 0, MP_AUDIO_BASE);
>      sysbus_connect_irq(s, 0, pic[MP_AUDIO_IRQ]);
> 
