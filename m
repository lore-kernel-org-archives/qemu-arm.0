Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2410557lfk;
        Mon, 25 Apr 2022 07:07:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWNCadBdy5ERvTQaPPIE9j3jApWvkKizRoWhqRdTDrc2J1Zdxm3BCaFFPMWy6N67y6Z1PG
X-Received: by 2002:a37:9e91:0:b0:69c:739e:45c3 with SMTP id h139-20020a379e91000000b0069c739e45c3mr10303867qke.748.1650895640708;
        Mon, 25 Apr 2022 07:07:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650895640; cv=none;
        d=google.com; s=arc-20160816;
        b=DjvDpG6Ci/brgO2V/AlFEDSq45kOEKx9YsrRvmn9+/2+YLFXTEERw8o95mcQul5lXE
         NQJamBHIdyMhNevdQKXGAvHZriTpHEmCmlahONxI2YYcudcHF708Xw9N7eRhGvnJF1cH
         5UemiCtOstVjkGh8sp0MbXU/Z0MXslNCk/YsVnZd4LB6NEo58+I7NXZ/Fbvw7jNNLcCH
         HLqGmZBCoFdMXe/qFNZxqRLqodsVXKgoHW5CRbKwtILy7QDtVzT0C5AyE48YoaNUu9Na
         E3FT6HTw/VX+3BzuBsOx9MsRl0YM0vY+A2iU5W29NwBa+ouvKcqDdfd/EFRIFJrE13MF
         bBIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=E3C+gBI48WxGj/Jukij1rbwm/6JHlrW0+q9QbsHmsTU=;
        b=NyhSAsfgrBGx95hSJv5frlQEEZcal+K6Xk9e0Vg1HURqNijeiL1PNAbxHZRRxV6GuT
         kyy6nP56dOIL5+3XEMyOsoBQAnXp+5JCD5rX9ixrttQJlYtRYoaxtKCkErMTC3KhuDZe
         lC7GqbjBTDgglt3SPEi+puxPsqy+Cg28JOmARtXbyV96ivycs7EBWNoibrdKV6KItfsY
         ar0qdVOsMoSD/zazzsNZbiu/OySK+jk+VrxnhfBh4efdpztmoQGVRnCzhNXPKZ76SAvb
         ou178WBlr3XxsNnBdsEg6sReXMOylrWEcgbpRHjLQDHK+EmADKnUFUWglcmmWHdEFNYz
         g1sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="hh/wcRWz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5-20020a0561023c8500b0032a4032e618si1220960vsv.199.2022.04.25.07.07.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Apr 2022 07:07:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="hh/wcRWz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nizN2-0001R0-1c
	for alex.bennee@linaro.org; Mon, 25 Apr 2022 10:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nizMl-0001NO-2y
 for qemu-arm@nongnu.org; Mon, 25 Apr 2022 10:07:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nizMg-0001pc-QX
 for qemu-arm@nongnu.org; Mon, 25 Apr 2022 10:07:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650895618;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=E3C+gBI48WxGj/Jukij1rbwm/6JHlrW0+q9QbsHmsTU=;
 b=hh/wcRWzxCfxuDZXcteWSrRg/nHUksfZZD+MTsYGVLRuqT1YD27qMr5LdS4O37te7mQKrf
 DV+MonZoqS5SFRQXQJuxdexTsL1XZ/ymIelVMg9H2wbZP6CxTSeNO8XZlwYoecAOKvaMdK
 nsPO2+RB2G/YUrWZutq4Va+eaO3P0N8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-YSorlpmcNO6CvzE2XpULJg-1; Mon, 25 Apr 2022 10:06:53 -0400
X-MC-Unique: YSorlpmcNO6CvzE2XpULJg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D96A805904;
 Mon, 25 Apr 2022 14:06:23 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF43D40D1B9B;
 Mon, 25 Apr 2022 14:06:17 +0000 (UTC)
Date: Mon, 25 Apr 2022 15:06:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Martin Kletzander <mkletzan@redhat.com>
Subject: Re: [PATCH 07/18] Introduce machine's default-audiodev property
Message-ID: <Ymaq1ouZVKD5kZfV@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
 <49192ccd62fc98c474bb0b627a22cc28a634e8b8.1650874791.git.mkletzan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <49192ccd62fc98c474bb0b627a22cc28a634e8b8.1650874791.git.mkletzan@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Darren Kenny <darren.kenny@oracle.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BMMjhCMBwt3P

On Mon, Apr 25, 2022 at 10:21:50AM +0200, Martin Kletzander wrote:
> Many machine types have default audio devices with no way to set the underlying
> audiodev.  Instead of adding an option for each and every one of them this new
> property can be used as a default during machine initialisation when creating
> such devices.
> 
> Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
> ---
>  hw/core/machine.c   | 23 +++++++++++++++++++++++
>  include/hw/boards.h |  1 +
>  2 files changed, 24 insertions(+)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index cb9bbc844d24..d055a126d398 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -596,6 +596,22 @@ static void machine_set_memdev(Object *obj, const char *value, Error **errp)
>      ms->ram_memdev_id = g_strdup(value);
>  }
>  
> +static char *machine_get_default_audiodev(Object *obj, Error **errp)
> +{
> +    MachineState *ms = MACHINE(obj);
> +
> +    return g_strdup(ms->default_audiodev);
> +}
> +
> +static void machine_set_default_audiodev(Object *obj, const char *value,
> +                                         Error **errp)
> +{
> +    MachineState *ms = MACHINE(obj);
> +
> +    g_free(ms->default_audiodev);
> +    ms->default_audiodev = g_strdup(value);
> +}
> +
>  HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine)
>  {
>      int i;
> @@ -867,6 +883,12 @@ static void machine_class_init(ObjectClass *oc, void *data)
>      object_class_property_set_description(oc, "confidential-guest-support",
>                                            "Set confidential guest scheme to support");
>  
> +    object_class_property_add_str(oc, "default-audiodev",
> +                                  machine_get_default_audiodev,
> +                                  machine_set_default_audiodev);
> +    object_class_property_set_description(oc, "default-audiodev",
> +                                          "Audiodev to use for default machine devices");
> +

Hmm, if we add this, people might reasonably question why this default
audiodev can't be used for everything, instead of making other 'audiodev'
parameter mandatory.

For the x86 machines we have a property tied specifically to the PC
speaker.

  -machine ...,pcspk-audiodev=<name>


If we assume that's the desired pattern, then every machine which has
a built-in audio device should gain some  "{$device}-audiodev" proprerty
where '$device' is some reasonable name for the built-in audio device
of the machine.  This would work better if a machine ended up with
two built-in audio devices and needed separate audiodevs for them.


>      /* For compatibility */
>      object_class_property_add_str(oc, "memory-encryption",
>          machine_get_memory_encryption, machine_set_memory_encryption);
> @@ -961,6 +983,7 @@ static void machine_finalize(Object *obj)
>      g_free(ms->device_memory);
>      g_free(ms->nvdimms_state);
>      g_free(ms->numa_state);
> +    g_free(ms->default_audiodev);
>  }
>  
>  bool machine_usb(MachineState *machine)
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index d64b5481e834..5be1de50af03 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -346,6 +346,7 @@ struct MachineState {
>       */
>      MemoryRegion *ram;
>      DeviceMemoryState *device_memory;
> +    char *default_audiodev;
>  
>      ram_addr_t ram_size;
>      ram_addr_t maxram_size;
> -- 
> 2.35.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

