Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2426789dyb;
        Mon, 23 Jun 2025 02:23:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW4DDSCdd9keWxDGWwA/vNnvwJtCrsiO87hY9K++JYTzJPq58zrdz61+/5v4cU6y1PWum8wJ3PNEyHSew==@linaro.org
X-Google-Smtp-Source: AGHT+IEkTb93M9aqUVl9ylBILp18HX4T22ICT+Th3I6kP9VkrtSuU0rA9AfrdA7mDz6z1T8SfNWy
X-Received: by 2002:adf:9c8d:0:b0:3a5:2ec5:35ba with SMTP id ffacd0b85a97d-3a6d1322917mr6996338f8f.30.1750670639057;
        Mon, 23 Jun 2025 02:23:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750670639; cv=none;
        d=google.com; s=arc-20240605;
        b=f3UKPE/zcPXBml3+/BzdsR2WtE/3TdhB8MKvBDLIzwTaa3bhYahhThpqX+ALW4wevZ
         aqm/VU3FZkXC1mBHFuiRnbkY8TmdNHRPMoKydmNSSZ8J2od0KKOuF3tc8jHTbRFaSh5Z
         godatNi75qJ2xiyGmN1gpDMyYe7531ICwAPUPBrvN1h60UdClaoMS0dRuy8XSf5Zkv1a
         Xux1myAL2Uqr+/46QsemgojddCALOV0KVyUzyjyOdDAc2GO2LYSxkZBHh+zV7Lsx12DY
         R6bGHi7rPqipVSMhwcY+oCjobujnZ5gnXyIbdvITA/lT5BqMSwskcTM+uHXyo1bq+9I1
         KDYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7VSgSGwq8wrw3DnPUbktkgQZidTx6uhtariuiUH0CA0=;
        fh=GiKcxST3bzHaDtlrHe9RHSXQcmq3dO3RUB6uMJNFy7E=;
        b=Lvrm9kDxWI9rCHiEK95/jAi5VVfB1swiCZF0ZKHEk7K4FEjzU3z4/0isdI09KjTImF
         DIbQcdIFe1VD6tmqBSyjNgkup5OGq6ZhJC9XexwhaY+Q+kGsonJ3mJs6tXDSg1W4FrVt
         5ebhsWfAIijRF8jFx2WxGO77k5GGvikzF1NCh7pCbva+r8HQhSRpmNH5fQP9QzwFMzkm
         wiCvv4k/G5/wr4/0J7u3bYm5PQkVueHGOR2bZY0VjhuY3PPcfv8K+is3tAWYz5zU6SGz
         PwmwT1gsKQzlsf5yKA4230oPbDTWlePRYzc66/8EYYQRJN/qCspuJjLvzEiu/4jyBwEX
         6RnA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OHxlUTTT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a6d0f1cfddsi5724259f8f.162.2025.06.23.02.23.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jun 2025 02:23:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OHxlUTTT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uTdOR-0006Jk-D7; Mon, 23 Jun 2025 05:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1uTdOK-0006Hq-6G
 for qemu-arm@nongnu.org; Mon, 23 Jun 2025 05:23:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1uTdOI-0008OW-Af
 for qemu-arm@nongnu.org; Mon, 23 Jun 2025 05:23:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750670581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7VSgSGwq8wrw3DnPUbktkgQZidTx6uhtariuiUH0CA0=;
 b=OHxlUTTTq7pBl1qB4rk/iptE4lSponruiCpAVONV6tTPsauRFDAK6GxcnhjN79AzrNUgPp
 1Xl8zyxwpnhmsFaLhAkSayrAjpXI1Vkc1hZSAIRirSFS9hSokYtAyAeqyElJLhQ82C/n6L
 h4oJaGdiOIuY/aaliWkplhrIwm37gkc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-H5LXrpBzNkiQsLA3eMdu6Q-1; Mon, 23 Jun 2025 05:20:57 -0400
X-MC-Unique: H5LXrpBzNkiQsLA3eMdu6Q-1
X-Mimecast-MFC-AGG-ID: H5LXrpBzNkiQsLA3eMdu6Q_1750670457
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a4f8fd1847so1304753f8f.1
 for <qemu-arm@nongnu.org>; Mon, 23 Jun 2025 02:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750670456; x=1751275256;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7VSgSGwq8wrw3DnPUbktkgQZidTx6uhtariuiUH0CA0=;
 b=EC4nP2ayYvvfNWG4FbcYZZysRunshE0iBGm64QbFgoRnckAxe0kURNtY+WUSz/IsJj
 yfX+NWuD+JB16FY97hRZO83kqy2DPGfKoQHwLnEAStHjfUyXZaRPkVbGTbXKh1EfsCpX
 Oh4hWpHnc0P/JpkafuJ25tv1m9uWr972zjwdOax6RV4TtJAPXEDojcLAiRaQnYsD0qjs
 DE0pTWX8eKzZkkmlSV1+OEwLCS4B0epI91IxiTxonceMQt1u4HhemWbntOcCjkJpUboI
 c2POsRehnYaraejN8XiuxNAUDG6XOQ7eMGNZrY/7WQErpwht7a6VMmNQDb39K5N3Lp1X
 Cdew==
X-Forwarded-Encrypted: i=1;
 AJvYcCULs6auDL5lVdRDB5e3pyrdfKxx3ZyEYxIP5CL/2t9LCnSSCn1PxJpR18rMVjne+UR9ezPyf1Q7LQ==@nongnu.org
X-Gm-Message-State: AOJu0YzbXRykZXfKLDfQ4/dQ9sGJQvE4JrGaWnmOLTO9qsTR0cNziwPQ
 EsTkBh7SufIVOB5+Rdjqwwe71+wyFyXQFrSD8XUcpesW80hPizCZE2cgsI+/uPn9QjN+UP3QmME
 pUktqAk0vhIDT1CX6+4iAKitFoCBp++i7vPLbA7542lHAsfq/dZIAeg==
X-Gm-Gg: ASbGnctITgHVvEHzsX+W/RHDOyKXgiQTDSM+xegiAAOlcU2PVl3tMiQfHK6hkw76HHj
 GKKPiXk/OoGrNV3+WTZpQiqqMDNXKgNOo4PZEyyhBYYL9t+gYvTOu6tQZtq0AQMDSheypX6hDzT
 AWLrfbcLPXV0Ky8/I+HXfNny5C0TMOzUNE2CCUkBylgoGv8A3GgC/zFxBy9AZ+ceLwMW1FEx2IR
 p2duhWWSYPBqrlIdj4TOQZgcCG8gKmwxZ/iNYoOvPhTsfQg0IGW2DCmvRv2x0jDu1aCqvUjJTGj
 W1cdb6iR6fLnZ2EtcfIpKqAmc5dy7DHxCoj1T3EwXf9kVB6kfxPH9gNPfwkpdrR7
X-Received: by 2002:a05:6000:22c1:b0:3a5:3b03:3bc6 with SMTP id
 ffacd0b85a97d-3a6d1322bdcmr10431202f8f.28.1750670456493; 
 Mon, 23 Jun 2025 02:20:56 -0700 (PDT)
X-Received: by 2002:a05:6000:22c1:b0:3a5:3b03:3bc6 with SMTP id
 ffacd0b85a97d-3a6d1322bdcmr10431179f8f.28.1750670456068; 
 Mon, 23 Jun 2025 02:20:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535eac8e0asm137760265e9.23.2025.06.23.02.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 02:20:55 -0700 (PDT)
Message-ID: <8c1870b3-d13d-4918-b0f6-6f41659a807d@redhat.com>
Date: Mon, 23 Jun 2025 11:20:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] ramfb: Add property to control if load the romfile
To: Shaoqin Huang <shahuang@redhat.com>, qemu-arm@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
References: <20250617030521.2109305-1-shahuang@redhat.com>
 <20250617030521.2109305-2-shahuang@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20250617030521.2109305-2-shahuang@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0-QGuk4HO4HLiBISQwHEXfMKFN3HUUeKFnKk51wZoig_1750670457
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: au9VM6D5Nqgu

Hi Shaoqin,
On 6/17/25 5:05 AM, Shaoqin Huang wrote:
> Now the ramfb will load the vgabios-ramfb.bin unconditionally, but only
Currently the ramfb device loads ...
> the x86 need the vgabios-ramfb.bin, this can cause that when use the
> release package on arm64 it can't find the vgabios-ramfb.bin.
> 
> Because only seabios will use the vgabios-ramfb.bin, load the rom logic
> is x86-specific. For other !x86 platforms, the edk2 ships an EFI driver
> for ramfb, so they don't need to load the romfile.
> 
> So add a new property use_legacy_x86_rom in both ramfb and vfio_pci
was renamed with - instead of _
> device, because the vfio display also use the ramfb_setup() to load
> the vgabios-ramfb.bin file.
> 
> After have this property, the machine type can set the compatibility to
> not load the vgabios-ramfb.bin if the arch doesn't need it.

Please add in the commit message that for now the default value is true
but it will be turned off by default in subsequent patch when compats
get properly handled.
> 
> Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
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
Thanks

Eric

