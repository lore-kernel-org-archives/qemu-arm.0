Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2914254dye;
        Mon, 30 Jun 2025 22:03:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUlPbAetXwx+m2/Qy+CB+NbNSWgVHNODvAZyc7G7v24o1WdKUceQOdXCL6tgwTHm0Nx5GeOzTGax/m2ww==@linaro.org
X-Google-Smtp-Source: AGHT+IFmtf1C6dxHqRKjHQA4QTVAumFPt6LVlGrBdjSVOBlPHzB3DvsnrakjS1QM0h+roh5ofaZH
X-Received: by 2002:a05:622a:4088:b0:494:f1e7:65ef with SMTP id d75a77b69052e-4a7fcde989dmr295172791cf.44.1751346236377;
        Mon, 30 Jun 2025 22:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751346236; cv=none;
        d=google.com; s=arc-20240605;
        b=CR/jEAHHdf2JIN1Mmk+pCIuIHbS7OfCKOCkQM/3fZ4gANCVOea3JmBIaS+3d0Wk78m
         rk1LIthxjVhH7AT+MXgl3R+CP3EcFn+NMnr4SRv1TvTSVXH+KXcyodNkAf8KeEElJz1/
         8TG+KMhQ418bJxQfVL9OnWREaHtkUghT5ddfNMm+KTWecxBQcPuh4kwFC4Tn1rpfSO64
         /yxv3KLjmm3rpousau35JYXXx3w/SLdCJmL6hqK1q1fUZ7m3NE2Q4KnAA3uFDttYla6H
         SxajJ6XFtodhXyARhmM/bwChhC0FUywqenrTP/vlE7ldw29cAoINApp72K5LW2fhDcz2
         FGQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=HbLaptKb353ifewpOFrVwcsHZty7YG6WqtGJY037U04=;
        fh=5mAmRuQUD1lJQ3fpzVoOxX22flzpbA6KyTCe4WO1qlY=;
        b=MnODAqt5uopabx1eEcj+tvJxDmi/TrheCD8EGtRV2OtkBX49qCruRRdphBevTY91kn
         dTYIj5pI7EooXmeJnuYEkRKXFDOqzHzEyD7jw5O7DmO7fkdt5tok3u5PerFjsR1DJ420
         VpQqlj3IeZ2/l94hpaY8SmegQb9hIgRUP1f8fgfV60nOQn9FYaRNZQ+ya3qZ9TO6cHZ+
         Fn5pRWeIBM7utXP09p85JvloH0f4xcp3RgvLqFz3pbUz16tW/i8SKEbyWyi0eh3Ws7Bm
         TTjkiabY71NV9i8zD6w6U9oWXukKBtLebTNe75J6ycncj6TTLFgxezIpdc6/bMdUNHo5
         KiFA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ELVOlLKc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc23f5dbsi102730141cf.353.2025.06.30.22.03.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jun 2025 22:03:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ELVOlLKc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWT9E-00038j-GG; Tue, 01 Jul 2025 01:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1uWT96-000375-UW
 for qemu-arm@nongnu.org; Tue, 01 Jul 2025 01:03:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1uWT94-0000Gh-CT
 for qemu-arm@nongnu.org; Tue, 01 Jul 2025 01:03:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751346179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HbLaptKb353ifewpOFrVwcsHZty7YG6WqtGJY037U04=;
 b=ELVOlLKcqnjeYYNMHe7BDI5ExKXyG0Vq8JMofzW23rbSUfpVaLLWU+VB+DvoKjoFJGMkLE
 GIYTaeA5nj+9vil68U1S1IvqGUaXdN79SWSaaGCFzE8hmufbP3TDuk9hQnFbpY3ovi4q1s
 sxXQhXYZbycJgJtEo1ULH0hjkNbSRC8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-gj4L2smZPEmSYwjy9ui1xg-1; Tue, 01 Jul 2025 01:02:57 -0400
X-MC-Unique: gj4L2smZPEmSYwjy9ui1xg-1
X-Mimecast-MFC-AGG-ID: gj4L2smZPEmSYwjy9ui1xg_1751346176
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a4e9252ba0so1790697f8f.0
 for <qemu-arm@nongnu.org>; Mon, 30 Jun 2025 22:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751346176; x=1751950976;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HbLaptKb353ifewpOFrVwcsHZty7YG6WqtGJY037U04=;
 b=J1Uzmc7Xt67fHM0jrXGH0i4y6LzFS58w6QFoOppL+EBzo0rRKLndlWNZxWYtAjYGyo
 kzjZe1pugK70iM+aq8LGkVlMlkTM6/R6izi1/0AlOL6lTrhHQ4620iVmacFzww94otJM
 74uOZZ35PGrfSYrsS2MgzirxDnmJG/HQ8CTuZ9P19by9Yf6cEw8o4oFQcFz9mMMDBI7k
 5Bu116nZJJ7xqEPsESBI0mRDJRGFxCEvxpdC/RUexi6r5nO/gYH8gh7Q/zgX7RB6Ih1z
 F4ItS9AgapcBHKvxbOuBS7On3KknNI++DrWV1GNvsb+NPSAGcfC3/ksI35LqdGx9/RDw
 HjjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvkFcvYqeBUdmAueAL8VG2c8Hf8DQzbCrHRMLw4RFV6Ul9jDw+Md3SQqx55Qe4D4zJFifeHfWOow==@nongnu.org
X-Gm-Message-State: AOJu0YwnzMjlvFYzy8HWHTNFdQzgA/3jfomcwUlaXC4diH38gwrKAdD0
 k/WtsFksFgiDF55pvVjl7p2oV+48mXmTuDU95WTxJz3VzF46im8+ZmGsIdCyfBfsmQP98/yBZgn
 26qyA/jwN4UgdqHhynybkBkuZaNd+zO/EJTVdH2GqEY/dppJO/so6pw==
X-Gm-Gg: ASbGncvPJzoaLlCHMOor5DIsQRe2rjSg3GYdhMQkjEpOaGKANLeAbhIXXtmFChLYjDf
 34omZWY5n4bDWZlM+/LSdtf5XyVSyVRzxMh2cegWuqpHxwSvZDj6xfVg57vi82kRAcqX00beDAg
 BjlAfLblBBXk6AjciNUfrA8KVBepNM5VPc6hpLivTVizAjOXAyFQ9VjGiF3vhBCzaiP1FJzWqiS
 B/hiL9NMj2Tsbjp7SDxChZBpFiJxZImkGYaOEeKxcv/dC1d2mO7dp5div+sIZEeIbAfPMEGvZwq
 zJPjumF4ZI5NzfBujbFGXgxw4A6/gHPNA1r2aeeCJNjF4oUzFr5JG2a72gZxuUFu
X-Received: by 2002:a5d:5050:0:b0:3a6:d2ae:830 with SMTP id
 ffacd0b85a97d-3a9001a14a8mr11435757f8f.56.1751346176451; 
 Mon, 30 Jun 2025 22:02:56 -0700 (PDT)
X-Received: by 2002:a5d:5050:0:b0:3a6:d2ae:830 with SMTP id
 ffacd0b85a97d-3a9001a14a8mr11435736f8f.56.1751346175926; 
 Mon, 30 Jun 2025 22:02:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e599bdsm11819285f8f.84.2025.06.30.22.02.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 22:02:55 -0700 (PDT)
Message-ID: <971a5fd7-58d9-489f-9fb3-45fe19ce95bc@redhat.com>
Date: Tue, 1 Jul 2025 07:02:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] ramfb: Add property to control if load the romfile
To: Shaoqin Huang <shahuang@redhat.com>, qemu-arm@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
References: <20250701030549.2153331-1-shahuang@redhat.com>
 <20250701030549.2153331-2-shahuang@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20250701030549.2153331-2-shahuang@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 33jqbKIa6M0rRwSH3CGnuzOmsH-CeXufbZ9fI2KZWNY_1751346176
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.237, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ilIhHW+z4pHG

Hi Shaoqin,

On 7/1/25 5:05 AM, Shaoqin Huang wrote:
> Currently the ramfb device loads the vgabios-ramfb.bin unconditionally,
> but only the x86 need the vgabios-ramfb.bin, this can cause that when
> use the release package on arm64 it can't find the vgabios-ramfb.bin.
> 
> Because only seabios will use the vgabios-ramfb.bin, load the rom logic
> is x86-specific. For other !x86 platforms, the edk2 ships an EFI driver
> for ramfb, so they don't need to load the romfile.
> 
> So add a new property use-legacy-x86-rom in both ramfb and vfio_pci
> device, because the vfio display also use the ramfb_setup() to load
> the vgabios-ramfb.bin file.
> 
> After have this property, the machine type can set the compatibility to
> not load the vgabios-ramfb.bin if the arch doesn't need it.
> 
> For now the default value is true but it will be turned off by default
> in subsequent patch when compats get properly handled.
> 
> Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/display/ramfb-standalone.c | 4 +++-
>  hw/display/ramfb-stubs.c      | 2 +-
>  hw/display/ramfb.c            | 6 ++++--
>  hw/vfio/display.c             | 4 ++--
>  hw/vfio/pci.c                 | 1 +
>  hw/vfio/pci.h                 | 1 +
>  include/hw/display/ramfb.h    | 2 +-
>  7 files changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/display/ramfb-standalone.c b/hw/display/ramfb-standalone.c
> index 1be106b57f..af1175bf96 100644
> --- a/hw/display/ramfb-standalone.c
> +++ b/hw/display/ramfb-standalone.c
> @@ -17,6 +17,7 @@ struct RAMFBStandaloneState {
>      QemuConsole *con;
>      RAMFBState *state;
>      bool migrate;
> +    bool use_legacy_x86_rom;
>  };
>  
>  static void display_update_wrapper(void *dev)
> @@ -39,7 +40,7 @@ static void ramfb_realizefn(DeviceState *dev, Error **errp)
>      RAMFBStandaloneState *ramfb = RAMFB(dev);
>  
>      ramfb->con = graphic_console_init(dev, 0, &wrapper_ops, dev);
> -    ramfb->state = ramfb_setup(errp);
> +    ramfb->state = ramfb_setup(ramfb->use_legacy_x86_rom, errp);
>  }
>  
>  static bool migrate_needed(void *opaque)
> @@ -62,6 +63,7 @@ static const VMStateDescription ramfb_dev_vmstate = {
>  
>  static const Property ramfb_properties[] = {
>      DEFINE_PROP_BOOL("x-migrate", RAMFBStandaloneState, migrate,  true),
> +    DEFINE_PROP_BOOL("use-legacy-x86-rom", RAMFBStandaloneState, use_legacy_x86_rom, true),
>  };
>  
>  static void ramfb_class_initfn(ObjectClass *klass, void *data)
> diff --git a/hw/display/ramfb-stubs.c b/hw/display/ramfb-stubs.c
> index cf64733b10..b83551357b 100644
> --- a/hw/display/ramfb-stubs.c
> +++ b/hw/display/ramfb-stubs.c
> @@ -8,7 +8,7 @@ void ramfb_display_update(QemuConsole *con, RAMFBState *s)
>  {
>  }
>  
> -RAMFBState *ramfb_setup(Error **errp)
> +RAMFBState *ramfb_setup(bool romfile, Error **errp)
>  {
>      error_setg(errp, "ramfb support not available");
>      return NULL;
> diff --git a/hw/display/ramfb.c b/hw/display/ramfb.c
> index 8c0f907673..9a17d97d07 100644
> --- a/hw/display/ramfb.c
> +++ b/hw/display/ramfb.c
> @@ -135,7 +135,7 @@ const VMStateDescription ramfb_vmstate = {
>      }
>  };
>  
> -RAMFBState *ramfb_setup(Error **errp)
> +RAMFBState *ramfb_setup(bool romfile, Error **errp)
>  {
>      FWCfgState *fw_cfg = fw_cfg_find();
>      RAMFBState *s;
> @@ -147,7 +147,9 @@ RAMFBState *ramfb_setup(Error **errp)
>  
>      s = g_new0(RAMFBState, 1);
>  
> -    rom_add_vga("vgabios-ramfb.bin");
> +    if (romfile) {
> +        rom_add_vga("vgabios-ramfb.bin");
> +    }
>      fw_cfg_add_file_callback(fw_cfg, "etc/ramfb",
>                               NULL, ramfb_fw_cfg_write, s,
>                               &s->cfg, sizeof(s->cfg), false);
> diff --git a/hw/vfio/display.c b/hw/vfio/display.c
> index ea87830fe0..8bfd8eb1e3 100644
> --- a/hw/vfio/display.c
> +++ b/hw/vfio/display.c
> @@ -365,7 +365,7 @@ static bool vfio_display_dmabuf_init(VFIOPCIDevice *vdev, Error **errp)
>                                            &vfio_display_dmabuf_ops,
>                                            vdev);
>      if (vdev->enable_ramfb) {
> -        vdev->dpy->ramfb = ramfb_setup(errp);
> +        vdev->dpy->ramfb = ramfb_setup(vdev->use_legacy_x86_rom, errp);
>          if (!vdev->dpy->ramfb) {
>              return false;
>          }
> @@ -494,7 +494,7 @@ static bool vfio_display_region_init(VFIOPCIDevice *vdev, Error **errp)
>                                            &vfio_display_region_ops,
>                                            vdev);
>      if (vdev->enable_ramfb) {
> -        vdev->dpy->ramfb = ramfb_setup(errp);
> +        vdev->dpy->ramfb = ramfb_setup(vdev->use_legacy_x86_rom, errp);
>          if (!vdev->dpy->ramfb) {
>              return false;
>          }
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 7f1532fbed..ff0d93fae0 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3564,6 +3564,7 @@ static const TypeInfo vfio_pci_dev_info = {
>  
>  static const Property vfio_pci_dev_nohotplug_properties[] = {
>      DEFINE_PROP_BOOL("ramfb", VFIOPCIDevice, enable_ramfb, false),
> +    DEFINE_PROP_BOOL("use-legacy-x86-rom", VFIOPCIDevice, use_legacy_x86_rom, true),
>      DEFINE_PROP_ON_OFF_AUTO("x-ramfb-migrate", VFIOPCIDevice, ramfb_migrate,
>                              ON_OFF_AUTO_AUTO),
>  };
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index d94ecaba68..713956157e 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -177,6 +177,7 @@ struct VFIOPCIDevice {
>      bool no_kvm_ioeventfd;
>      bool no_vfio_ioeventfd;
>      bool enable_ramfb;
> +    bool use_legacy_x86_rom;
>      OnOffAuto ramfb_migrate;
>      bool defer_kvm_irq_routing;
>      bool clear_parent_atomics_on_exit;
> diff --git a/include/hw/display/ramfb.h b/include/hw/display/ramfb.h
> index a7e0019144..172aa6dc89 100644
> --- a/include/hw/display/ramfb.h
> +++ b/include/hw/display/ramfb.h
> @@ -6,7 +6,7 @@
>  /* ramfb.c */
>  typedef struct RAMFBState RAMFBState;
>  void ramfb_display_update(QemuConsole *con, RAMFBState *s);
> -RAMFBState *ramfb_setup(Error **errp);
> +RAMFBState *ramfb_setup(bool romfile, Error **errp);
>  
>  extern const VMStateDescription ramfb_vmstate;
>  

