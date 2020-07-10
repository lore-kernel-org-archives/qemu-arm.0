Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1016512lfm;
        Fri, 10 Jul 2020 12:44:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxruKHhc7Jo2KghyTMtr875pQXkT7sR6xwjI4lOS2CVG9rBc6T9DNir7AqQiu0oIecpbdWT
X-Received: by 2002:a5b:7c4:: with SMTP id t4mr23231663ybq.67.1594410295441;
        Fri, 10 Jul 2020 12:44:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594410295; cv=none;
        d=google.com; s=arc-20160816;
        b=mBcDoEYNKtCYTUZwBXE9vLEDDnBvUpiUeXxEFE50KrNVgtMP45fuBhcoytUIWlPfDe
         D+mVs2QN/69zysNpTm2kOR5OJdhskf/NY4zdZYswh2w7mDXBRGR4scfJclFlkivGnU9M
         FKdkdbpMhK11M5HwSfj4eGqm8tQUCxtgz6O6yJt/lWtL058Ekwe5VP7k6MipfT5Xu75C
         WrnoEJc81BR9OFaGb+nUpdkjYpyTfOoUVP4o2/npvRjeoaIWnCXUprfUPc8CfeA/NohK
         rUakhhuogpy9PQQzoGYBlv4X4KsuOqeyiY5OikDf8Cc0RhxekMtc8M4ByVN7cm3ZtxzP
         iJ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=G72TIalTCHtDtclrZbOhTXLtm9+ltuo0q57w3lqyp08=;
        b=pwx1LNbZfx3EqIipdiystEROPGsrZZNLN0VU7xJVC+U/dxA+A3zh/dOti+yyVJRR0s
         n5uUs/M1Zq365uYY4gbVvVzsvWLY+CZq7IcxGE49vrpkGi1y1MzClldpI0AOs8OTNulW
         CUYgJJGqQyVOuii/tLQ6kcVw5L4K2JW3WAUYbV89fnYGnBMqxUh4uxSqQB8EXWXt/S0l
         6Mjueq49YgPRrs/UeojKFug8Z1W9gexiRzEHFB74Ry8fhNTZBGmC2d4bIo/+bJ7FxK3S
         dv/bRSKJF5PWua2Xn+/9SFuDTFF/EuatgxzHsP7vP/SJcL/e++bXhfSqPsKHrGLJ2ExU
         r4Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TZRVYKcz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13si6502200ybp.427.2020.07.10.12.44.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jul 2020 12:44:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TZRVYKcz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtyx4-0007Z7-Rw
	for alex.bennee@linaro.org; Fri, 10 Jul 2020 15:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jtywx-0007Yk-4U
 for qemu-arm@nongnu.org; Fri, 10 Jul 2020 15:44:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22722
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jtywu-0006yk-0w
 for qemu-arm@nongnu.org; Fri, 10 Jul 2020 15:44:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594410282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G72TIalTCHtDtclrZbOhTXLtm9+ltuo0q57w3lqyp08=;
 b=TZRVYKczSA8PRjh6DKSdpBJ2f+SU2pVWF/F0k9kX67DcX4vrchEVfwWmbQEBceEPHUEe5x
 PDyc6cmWhFqIMGnNqnYu2O0IPdkiFBZwU4NKx9Q6B5PiPr8A4DbhsYkKFvkSi7qUZGPbcX
 +YdpRe88AEZsX5ypIEuYJvhOZy0twzU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-QdOpJDrJN4CLaY-0HsYjow-1; Fri, 10 Jul 2020 15:44:39 -0400
X-MC-Unique: QdOpJDrJN4CLaY-0HsYjow-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03A3E107ACCA;
 Fri, 10 Jul 2020 19:44:38 +0000 (UTC)
Received: from localhost (unknown [10.40.208.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 903985C298;
 Fri, 10 Jul 2020 19:44:24 +0000 (UTC)
Date: Fri, 10 Jul 2020 21:44:19 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v5 16/20] microvm: wire up hotplug
Message-ID: <20200710214419.6fad02cc@redhat.com>
In-Reply-To: <20200707125356.32450-17-kraxel@redhat.com>
References: <20200707125356.32450-1-kraxel@redhat.com>
 <20200707125356.32450-17-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/10 15:08:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nMGCKMU69070

On Tue,  7 Jul 2020 14:53:52 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> The cpu hotplug code handles the initialization of coldplugged cpus
> too, so it is needed even in case cpu hotplug is not supported.
> 
> Wire cpu hotplug up for microvm.
> Without this we get a broken MADT table.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Blame is on me for calling it hotplug, HotplugHandlerClass is basically
a set of hooks to wire things up regardless if it's hotplug or coldplug.
In hindsight it was obvious at the time it was introduced.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/microvm.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index 3d8a66cfc3ac..a5b16b728f9f 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -320,6 +320,39 @@ static void microvm_fix_kernel_cmdline(MachineState *machine)
>      g_free(cmdline);
>  }
>  
> +static void microvm_device_pre_plug_cb(HotplugHandler *hotplug_dev,
> +                                       DeviceState *dev, Error **errp)
> +{
> +    x86_cpu_pre_plug(hotplug_dev, dev, errp);
> +}
> +
> +static void microvm_device_plug_cb(HotplugHandler *hotplug_dev,
> +                                   DeviceState *dev, Error **errp)
> +{
> +    x86_cpu_plug(hotplug_dev, dev, errp);
> +}
> +
> +static void microvm_device_unplug_request_cb(HotplugHandler *hotplug_dev,
> +                                             DeviceState *dev, Error **errp)
> +{
> +    error_setg(errp, "unplug not supported by microvm");
> +}
> +
> +static void microvm_device_unplug_cb(HotplugHandler *hotplug_dev,
> +                                     DeviceState *dev, Error **errp)
> +{
> +    error_setg(errp, "unplug not supported by microvm");
> +}
> +
> +static HotplugHandler *microvm_get_hotplug_handler(MachineState *machine,
> +                                                   DeviceState *dev)
> +{
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> +        return HOTPLUG_HANDLER(machine);
> +    }
> +    return NULL;
> +}
> +
>  static void microvm_machine_state_init(MachineState *machine)
>  {
>      MicrovmMachineState *mms = MICROVM_MACHINE(machine);
> @@ -503,6 +536,7 @@ static void microvm_machine_initfn(Object *obj)
>  static void microvm_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc = MACHINE_CLASS(oc);
> +    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
>  
>      mc->init = microvm_machine_state_init;
>  
> @@ -523,6 +557,13 @@ static void microvm_class_init(ObjectClass *oc, void *data)
>      /* Machine class handlers */
>      mc->reset = microvm_machine_reset;
>  
> +    /* hotplug (for cpu coldplug) */
> +    mc->get_hotplug_handler = microvm_get_hotplug_handler;
> +    hc->pre_plug = microvm_device_pre_plug_cb;
> +    hc->plug = microvm_device_plug_cb;
> +    hc->unplug_request = microvm_device_unplug_request_cb;
> +    hc->unplug = microvm_device_unplug_cb;
> +
>      object_class_property_add(oc, MICROVM_MACHINE_PIC, "OnOffAuto",
>                                microvm_machine_get_pic,
>                                microvm_machine_set_pic,
> @@ -572,6 +613,7 @@ static const TypeInfo microvm_machine_info = {
>      .class_size    = sizeof(MicrovmMachineClass),
>      .class_init    = microvm_class_init,
>      .interfaces = (InterfaceInfo[]) {
> +         { TYPE_HOTPLUG_HANDLER },
>           { }
>      },
>  };

