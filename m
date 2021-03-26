Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1191055lfg;
        Fri, 26 Mar 2021 02:38:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3dHoh5rHq7E5Nf2iBVem4hvKXRHSOQjcjN4S/S1Wf0naklaiizkbf/V6gpapxGbh7DN3q
X-Received: by 2002:a25:6d55:: with SMTP id i82mr17327620ybc.264.1616751531905;
        Fri, 26 Mar 2021 02:38:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616751531; cv=none;
        d=google.com; s=arc-20160816;
        b=c8dVUnmf1tXAodeEUqqeAORSCDTsNnk9hP6dPPzNxiIpsGjL22Pyb6xXh9qoZ3d+Zd
         mnYvmcWLLUUOEAdRuaUvMpKItXIJjjMWAl/JkiyFvyJRtrjpdqA6oWkiximPIOxZB2GQ
         edF0O/9eBhGKWC8/XHK7y0gDL30J3zfzjAMtGtxmYl6hf3YmK6DwyPeqCNxCOSsAu+J2
         +imo9TKSozgus2T7Jfno7YCnL4atxqK0vUz6eZ/1c8fIgo6p2E4EFAdguUxVxhOme/RA
         xWmM60L5AKx9pDphoaSuShQIWi5skQc7NcRYWViAEzbNBzcsiDTaCxDSNUhMrKcXN+Sg
         QJXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=XEQdQhHtJDXgmL1LMNnMyOfZG6qH4PpaUSZ1Ffu6I9Y=;
        b=ST2a94oxoUR50Btd7YAgsa/TDEJiiUpJJJzQR9I37v4ZEhOdLwV1grIEwhpltvDCou
         HA4v9Wzz9ZjMyYIzs4Zkl86wap5HndbxhVEor7lZ6tet9by5RuwzdcKg8OHBnTRu+Ota
         hDrFBAcLAioWYLMhCrgqb3FX3BNhZxi/IBPBfpJg9fGxwfhLg++O9+qRYni1KD4ll+w8
         CooPXVhSnKcajnE2pEhGtkKvqQTOaH9UIEQO4yK3QY79iMxohfZMsnczis0s99O3fpe3
         X1BCCSpXo/DDyFe+aSkIh7PHTh0IADNXA31Xn/2HUMBhQ/HFUgY1NemCS2bWv9W8i/V6
         1Rlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KiyiYlY9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n205si7505000ybc.462.2021.03.26.02.38.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Mar 2021 02:38:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KiyiYlY9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPivb-0000vC-9N
	for alex.bennee@linaro.org; Fri, 26 Mar 2021 05:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lPivS-0000tq-NN
 for qemu-arm@nongnu.org; Fri, 26 Mar 2021 05:38:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lPivQ-0001A7-0u
 for qemu-arm@nongnu.org; Fri, 26 Mar 2021 05:38:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616751519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XEQdQhHtJDXgmL1LMNnMyOfZG6qH4PpaUSZ1Ffu6I9Y=;
 b=KiyiYlY9cFToZD4C7j4X+/YwrBeZH5BDOQOH556vGjZjCCY7nvlXYof9q+4Lj8VjZTLBcP
 iis0gjA1zV86/C85JTfO2GkBgCNocb/aD6Y6uBlMhNWK4GSTT3H+6B9nmKDJJIbc5Fi2/o
 ofdA2+AwuhbGam5qqGEnZ0u5tbZu8YY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-OdUX27SoNZiGfl4fAjFgdg-1; Fri, 26 Mar 2021 05:38:37 -0400
X-MC-Unique: OdUX27SoNZiGfl4fAjFgdg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B97176B9C2;
 Fri, 26 Mar 2021 09:38:35 +0000 (UTC)
Received: from [10.36.112.13] (ovpn-112-13.ams2.redhat.com [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60E265D9E3;
 Fri, 26 Mar 2021 09:38:33 +0000 (UTC)
Subject: Re: [PATCH for-6.0 3/4] hw/arm/virt: Only try to add valid dynamic
 sysbus devices to platform bus
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210325153310.9131-1-peter.maydell@linaro.org>
 <20210325153310.9131-4-peter.maydell@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <05ec1c52-b43b-f989-a0f4-c50030ccdb7a@redhat.com>
Date: Fri, 26 Mar 2021 10:38:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210325153310.9131-4-peter.maydell@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
X-TUID: lr+2+fEwABcW

Hi Peter,

On 3/25/21 4:33 PM, Peter Maydell wrote:
> The virt machine device plug callback currently calls
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
> and probably asserted.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  hw/arm/virt.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index aa2bbd14e09..8625152a735 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2443,7 +2443,9 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>      VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
>  
>      if (vms->platform_bus_dev) {
> -        if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE)) {
> +        MachineClass *mc = MACHINE_GET_CLASS(vms);
> +
> +        if (device_is_dynamic_sysbus(mc, dev)) {
>              platform_bus_link_device(PLATFORM_BUS_DEVICE(vms->platform_bus_dev),
>                                       SYS_BUS_DEVICE(dev));
>          }
> @@ -2527,7 +2529,9 @@ static void virt_machine_device_unplug_cb(HotplugHandler *hotplug_dev,
>  static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
>                                                          DeviceState *dev)
>  {
> -    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE) ||
> +    MachineClass *mc = MACHINE_GET_CLASS(machine);
> +
> +    if (device_is_dynamic_sysbus(mc, dev) ||
>         (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM))) {
>          return HOTPLUG_HANDLER(machine);
>      }
> 

