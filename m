Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1191642lfg;
        Fri, 26 Mar 2021 02:40:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeEuCMQc0KVH5kr3Mm5PeT9rbXeO5rBqqC3OgRdGIHzsKLB0AzN3SFHG/nRgIzxdyogUET
X-Received: by 2002:a25:bc11:: with SMTP id i17mr18025787ybh.197.1616751603469;
        Fri, 26 Mar 2021 02:40:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616751603; cv=none;
        d=google.com; s=arc-20160816;
        b=WBAwrddiSB++GXxgoa/niGh8k5lrwvRNOU1EW0gqrq5x7xM08QBoY77Xojl+Zu0sKg
         aFFp6AI3udo5GzavcH3vK5fM74e1fEeC46PBeot1mhkdxk5rEp0EtPBWb58lrlxkmEyP
         Q0JwgdF8rXD6QCAhw1zw7Pky48bUu7OvvKVUUdCxm4o2ZWK/VfPunC5UdArU9MEci9RA
         f1rwvDvqvPfLp+IrjKbgKvsXvzC2R0LnrhZWduYzdSlmEo9Mim10eUV/hW6KzSl0eYPo
         l5gpSGKd1laoeYZEUJ7A1bCxIHxC8T72/0/yZGNU8Vyf3aTq07cy8ituYSyqScc/V6xc
         zAhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=WknOk70lUdWrvG2AOEcFdm2VmKZz2ZILCTVO20RMmVY=;
        b=QovfcRyauB9XiafXHDqt6WaMeBdGH7tkv7oDDgJyYe1nbP+T0vOj7Y79YXd4oTROSy
         au9TLspRQE4QF6KJHmPrr5YT7o5Ef92IfBRXkQG+RRwaolaEmc4roE943JGlgUy/nL1W
         cOfWVRwzRiHT8JQhbMHpQhWsZAVvzDefcbx70FQXV4pI1qyS4GakYCAZKFrYGFf4AQGj
         uMA1qFQOvqK23sdHEBtvsfZFryJpodS1bL36H6gbWz3sCvsJfWhFUV8cKIb6n/woP9RD
         YUaJEPGQ1Zk+Vus6kZmiE5FbOJAqdlYwH4ZFnt1MIGxbvjrRxdh5oaH7tUrL8eWQXkT6
         MA1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C8x6clu+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f80si6905407yba.415.2021.03.26.02.40.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Mar 2021 02:40:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C8x6clu+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPiwk-0001Qj-NK
	for alex.bennee@linaro.org; Fri, 26 Mar 2021 05:40:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lPiwV-0001Q2-Cn
 for qemu-arm@nongnu.org; Fri, 26 Mar 2021 05:39:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lPiwS-0001ht-U5
 for qemu-arm@nongnu.org; Fri, 26 Mar 2021 05:39:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616751584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WknOk70lUdWrvG2AOEcFdm2VmKZz2ZILCTVO20RMmVY=;
 b=C8x6clu+f6ZXpA3QVjAeGZb4xDlBrayqT3zI7MV0h+n7XgR6U2cxuOJBOP6fYRCUKQzni9
 CAKfFKmnGZR74wVIBqbGssq+NFDd9kgFpKVCZSdtYxBDyBKyD/Yf0Hn2RvWyZsmHvrFeiU
 sf/4snuwJ1ffVTqz3DUH24PtUI368tc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-IbklOCYXOk2-c8gJ8G3qng-1; Fri, 26 Mar 2021 05:39:40 -0400
X-MC-Unique: IbklOCYXOk2-c8gJ8G3qng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2FEE18C8C01;
 Fri, 26 Mar 2021 09:39:38 +0000 (UTC)
Received: from [10.36.112.13] (ovpn-112-13.ams2.redhat.com [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C12E5C3DF;
 Fri, 26 Mar 2021 09:39:36 +0000 (UTC)
Subject: Re: [PATCH for-6.0 4/4] hw/ppc/e500plat: Only try to add valid
 dynamic sysbus devices to platform bus
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210325153310.9131-1-peter.maydell@linaro.org>
 <20210325153310.9131-5-peter.maydell@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <98510de4-9d29-a62a-b2c1-f9f79c9fd164@redhat.com>
Date: Fri, 26 Mar 2021 10:39:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210325153310.9131-5-peter.maydell@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VSWMYpYu1p+7



On 3/25/21 4:33 PM, Peter Maydell wrote:
> The e500plat machine device plug callback currently calls
> platform_bus_link_device() for any sysbus device.  This is overly
> broad, because platform_bus_link_device() will unconditionally grab
> the IRQs and MMIOs of the device it is passed, whether it was
> intended for the platform bus or not.  Restrict hotpluggability of
> sysbus devices to only those devices on the dynamic sysbus whitelist.
> 
> We were mostly getting away with this because the board creates the
> platform bus as the last device it creates, and so the hotplug
> callback did not do anything for all the sysbus devices created by
> the board itself.  However if the user plugged in a device which
> itself uses a sysbus device internally we would have mishandled this
> and probably asserted. An example of this is:
>  qemu-system-ppc64 -M ppce500 -device macio-oldworld
> 
> This isn't a sensible command because the macio-oldworld device
> is really specific to the 'g3beige' machine, but we now fail
> with a reasonable error message rather than asserting:
> qemu-system-ppc64: Device heathrow is not supported by this machine yet.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/ppc/e500plat.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ppc/e500plat.c b/hw/ppc/e500plat.c
> index bddd5e7c48f..fc911bbb7bd 100644
> --- a/hw/ppc/e500plat.c
> +++ b/hw/ppc/e500plat.c
> @@ -48,7 +48,9 @@ static void e500plat_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>      PPCE500MachineState *pms = PPCE500_MACHINE(hotplug_dev);
>  
>      if (pms->pbus_dev) {
> -        if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE)) {
> +        MachineClass *mc = MACHINE_GET_CLASS(pms);
> +
> +        if (device_is_dynamic_sysbus(mc, dev)) {
>              platform_bus_link_device(pms->pbus_dev, SYS_BUS_DEVICE(dev));
>          }
>      }
> @@ -58,7 +60,9 @@ static
>  HotplugHandler *e500plat_machine_get_hotpug_handler(MachineState *machine,
>                                                      DeviceState *dev)
>  {
> -    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE)) {
> +    MachineClass *mc = MACHINE_GET_CLASS(machine);
> +
> +    if (device_is_dynamic_sysbus(mc, dev)) {
>          return HOTPLUG_HANDLER(machine);
>      }
>  
> 

