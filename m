Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3222332lfm;
        Sun, 26 Apr 2020 11:12:09 -0700 (PDT)
X-Google-Smtp-Source: APiQypIRae2Ok5+aLT/viUu/R/HSihxZ7jN0FTNza6/kM54nqXfMZAWecPNyoAf5fpqzv14NyKMR
X-Received: by 2002:ac8:6e8c:: with SMTP id c12mr19860784qtv.374.1587924728883;
        Sun, 26 Apr 2020 11:12:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587924728; cv=none;
        d=google.com; s=arc-20160816;
        b=O3RRuyqmpxBvfu+yqkuLUG3t5ddRxc0Gv4ydfAdHI4uGv75VQyZ9de+kUoFyeRj+zo
         dvN3wFXyKsK4YNtLJAQKthXO6YzHtvXtHWxvdg6dVGoD80O/Wdp2a2AvK5a771e7abq9
         tF4Jii3nj3X1mi4w+TzRRHe6OQbAE8FhURE4cfL519bGxeYgxcpNkIR9IxpSPxwng03S
         Fv8UTrwUC1HTHn6I9OS8aUN4Q/ICgDkLYTrmD+IRuFS0vgxpbSxCHjIH2wyiL9QNQIVK
         4blT0Kexygo6Zhoxl9taEgwx1Fk+0bR0yAhX+9BUoLnLdeaOA0fFbclY40A6wPskYCWK
         uvkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=SIlpn6vfoI2PTDFzrEx2LdpaXKs6agX8yJQnljguihI=;
        b=R34GO5tsWIFxV6yxAQ5pcINTJL8RSWKGHO/RawfJs1ra+d1l2uq/qmmWUHIXiUrgGN
         jSjpJi1B6k3k7s4wnWXbtwZGfELn1fKfl8ikKTFT5MgPdkIJx8l9aHetldlp04h4G21i
         XVRAR44XkIrfqgaKf18hpeBuMZFbmhLmNCMvonKfEjbw8gqWxqxT7SG/ZMU9chUg66YP
         g1U68gExFAUOczYSLh2TfyKIxxffc/ZA+MFiMXlQYgphsTFZ0yGf247Tv3xHPOI5kZea
         3fwubDPpLWws+e8EnK/i/q/xX1Lp3OdHMCfwqyf7iOT9FPY+5kKZ3Gs1q4ToXaCakJpl
         ChWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dLIhsBaO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5si7367801qtq.72.2020.04.26.11.12.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Apr 2020 11:12:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dLIhsBaO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jSllA-0002dA-6D
	for alex.bennee@linaro.org; Sun, 26 Apr 2020 14:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34018)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1jSleW-0001cR-KB
 for qemu-arm@nongnu.org; Sun, 26 Apr 2020 14:05:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1jSleU-0001uN-VD
 for qemu-arm@nongnu.org; Sun, 26 Apr 2020 14:05:16 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:40607
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jSleU-0001qS-93
 for qemu-arm@nongnu.org; Sun, 26 Apr 2020 14:05:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587924312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SIlpn6vfoI2PTDFzrEx2LdpaXKs6agX8yJQnljguihI=;
 b=dLIhsBaOku4HHDJGpnZvgg8V/wrfY5F1zBzUlHxOhWlLPyBfe5e3M9J0Jlyj8cV93/pRtw
 Sw4AGHxyyurR3GP5hOLmXTAbf181ElIk3u8dmMzoBXvixz0C5a1oMP7D/HzYBAgpbrZrD4
 CkY4ap4/uGviimfKdAV9ZR61Ed+17K0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-KJ5VmLPTPXan6eIdXwPLVA-1; Sun, 26 Apr 2020 14:05:10 -0400
X-MC-Unique: KJ5VmLPTPXan6eIdXwPLVA-1
Received: by mail-wr1-f71.google.com with SMTP id f2so8823771wrm.9
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2020 11:05:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YDqYcORQBwJDnonJ5MHzdzhmgiJ4VlwhJK9Ck0nVzf4=;
 b=k1pa4GHsZDSL6PT8W/k51S7Gu2idd0GtKb6S29S+/o8cm6kAQgLlsHmom/umi2jbYS
 hjdH2CevwbNbQVMR7Rpl16OgySUeADQBLsbwzoB73Suuxy0oQtcoR5oTha6/mCg5Ej/5
 VHl6/RP9GgZpcTq4uJiF7ONE8LSjSxFnFX/k/R4qKmNlyfun8LV2b+IBkKzd9h/3Hk4y
 bQ30AQHabOnlHFbW8FoawYjwlm6Vq53x+cUBL43Fs+ixPsQjPBuMP9lgWYgSQ654fl1V
 digYdC9uR8/5uitBs9RfRi4Pp0jje4Pcd+Ngx0PfmWB+WN4fkY5jFAKa4eHzPWOISe70
 cMcg==
X-Gm-Message-State: AGi0PubD/vSsfQnsCOts6j4QGbnhB3hRrZ6iLAONOjfndWmCKTGp9jLk
 SzGIQ8zSgYey1Z16UkeecdU5IwpZIusEdXjT3bEFLpl94w8z01AHL5jWNOVg4OrJNxXbBWQNZpl
 yLLptkEoZJt1R
X-Received: by 2002:a1c:c345:: with SMTP id t66mr23309041wmf.189.1587924309574; 
 Sun, 26 Apr 2020 11:05:09 -0700 (PDT)
X-Received: by 2002:a1c:c345:: with SMTP id t66mr23309004wmf.189.1587924309195; 
 Sun, 26 Apr 2020 11:05:09 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 b12sm18822991wro.18.2020.04.26.11.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2020 11:05:08 -0700 (PDT)
Date: Sun, 26 Apr 2020 14:05:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH] hw: add compat machines for 5.1
Message-ID: <20200426140452-mutt-send-email-mst@kernel.org>
References: <20200424090314.544-1-cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200424090314.544-1-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/26 14:05:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 282JgztGO+xK

On Fri, Apr 24, 2020 at 11:03:14AM +0200, Cornelia Huck wrote:
> Add 5.1 machine types for arm/i440fx/q35/s390x/spapr.
>=20
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>=20
> Still keeping the default cpu model version on x86 at v1.
>=20
> I'll queue this to my s390-next branch, as I'm planning to send a pull
> req as soon as 5.0 is out; if someone else wants to queue this, we'll
> figure it out :)

Feel free to do so.

> ---
>  hw/arm/virt.c              |  9 ++++++++-
>  hw/core/machine.c          |  3 +++
>  hw/i386/pc.c               |  3 +++
>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>  hw/ppc/spapr.c             | 15 +++++++++++++--
>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>  include/hw/boards.h        |  3 +++
>  include/hw/i386/pc.h       |  3 +++
>  9 files changed, 71 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 7dc96abf72cf..5e84c09402dd 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2309,15 +2309,22 @@ static void machvirt_machine_init(void)
>  }
>  type_init(machvirt_machine_init);
> =20
> +static void virt_machine_5_1_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE_AS_LATEST(5, 1)
> +
>  static void virt_machine_5_0_options(MachineClass *mc)
>  {
>      static GlobalProperty compat[] =3D {
>          { TYPE_TPM_TIS_SYSBUS, "ppi", "false" },
>      };
> =20
> +    virt_machine_5_1_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_5_0, hw_compat_5_0_len)=
;
>      compat_props_add(mc->compat_props, compat, G_N_ELEMENTS(compat));
>  }
> -DEFINE_VIRT_MACHINE_AS_LATEST(5, 0)
> +DEFINE_VIRT_MACHINE(5, 0)
> =20
>  static void virt_machine_4_2_options(MachineClass *mc)
>  {
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index c1a444cb7558..7a50dd518f4c 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -28,6 +28,9 @@
>  #include "hw/mem/nvdimm.h"
>  #include "migration/vmstate.h"
> =20
> +GlobalProperty hw_compat_5_0[] =3D {};
> +const size_t hw_compat_5_0_len =3D G_N_ELEMENTS(hw_compat_5_0);
> +
>  GlobalProperty hw_compat_4_2[] =3D {
>      { "virtio-blk-device", "queue-size", "128"},
>      { "virtio-scsi-device", "virtqueue_size", "128"},
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 5143c516531e..13e1d18cd758 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -94,6 +94,9 @@
>  #include "fw_cfg.h"
>  #include "trace.h"
> =20
> +GlobalProperty pc_compat_5_0[] =3D {};
> +const size_t pc_compat_5_0_len =3D G_N_ELEMENTS(pc_compat_5_0);
> +
>  GlobalProperty pc_compat_4_2[] =3D {
>      { "mch", "smbase-smram", "off" },
>  };
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 22dee0e76c62..921caa502b85 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -419,7 +419,7 @@ static void pc_i440fx_machine_options(MachineClass *m=
)
>      machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
>  }
> =20
> -static void pc_i440fx_5_0_machine_options(MachineClass *m)
> +static void pc_i440fx_5_1_machine_options(MachineClass *m)
>  {
>      PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
>      pc_i440fx_machine_options(m);
> @@ -428,6 +428,18 @@ static void pc_i440fx_5_0_machine_options(MachineCla=
ss *m)
>      pcmc->default_cpu_version =3D 1;
>  }
> =20
> +DEFINE_I440FX_MACHINE(v5_1, "pc-i440fx-5.1", NULL,
> +                      pc_i440fx_5_1_machine_options);
> +
> +static void pc_i440fx_5_0_machine_options(MachineClass *m)
> +{
> +    pc_i440fx_5_1_machine_options(m);
> +    m->alias =3D NULL;
> +    m->is_default =3D false;
> +    compat_props_add(m->compat_props, hw_compat_5_0, hw_compat_5_0_len);
> +    compat_props_add(m->compat_props, pc_compat_5_0, pc_compat_5_0_len);
> +}
> +
>  DEFINE_I440FX_MACHINE(v5_0, "pc-i440fx-5.0", NULL,
>                        pc_i440fx_5_0_machine_options);
> =20
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index d37c425e2236..253688a9b8f3 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -349,7 +349,7 @@ static void pc_q35_machine_options(MachineClass *m)
>      m->max_cpus =3D 288;
>  }
> =20
> -static void pc_q35_5_0_machine_options(MachineClass *m)
> +static void pc_q35_5_1_machine_options(MachineClass *m)
>  {
>      PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
>      pc_q35_machine_options(m);
> @@ -357,6 +357,17 @@ static void pc_q35_5_0_machine_options(MachineClass =
*m)
>      pcmc->default_cpu_version =3D 1;
>  }
> =20
> +DEFINE_Q35_MACHINE(v5_1, "pc-q35-5.1", NULL,
> +                   pc_q35_5_1_machine_options);
> +
> +static void pc_q35_5_0_machine_options(MachineClass *m)
> +{
> +    pc_q35_5_1_machine_options(m);
> +    m->alias =3D NULL;
> +    compat_props_add(m->compat_props, hw_compat_5_0, hw_compat_5_0_len);
> +    compat_props_add(m->compat_props, pc_compat_5_0, pc_compat_5_0_len);
> +}
> +
>  DEFINE_Q35_MACHINE(v5_0, "pc-q35-5.0", NULL,
>                     pc_q35_5_0_machine_options);
> =20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 9a2bd501aa6e..fd5bfd11a84c 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4599,15 +4599,26 @@ static void spapr_machine_latest_class_options(Ma=
chineClass *mc)
>      }                                                                \
>      type_init(spapr_machine_register_##suffix)
> =20
> +/*
> + * pseries-5.1
> + */
> +static void spapr_machine_5_1_class_options(MachineClass *mc)
> +{
> +    /* Defaults for the latest behaviour inherited from the base class *=
/
> +}
> +
> +DEFINE_SPAPR_MACHINE(5_1, "5.1", true);
> +
>  /*
>   * pseries-5.0
>   */
>  static void spapr_machine_5_0_class_options(MachineClass *mc)
>  {
> -    /* Defaults for the latest behaviour inherited from the base class *=
/
> +    spapr_machine_5_1_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_5_0, hw_compat_5_0_len)=
;
>  }
> =20
> -DEFINE_SPAPR_MACHINE(5_0, "5.0", true);
> +DEFINE_SPAPR_MACHINE(5_0, "5.0", false);
> =20
>  /*
>   * pseries-4.2
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 0fa00a9fff3d..967a6de9683b 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -672,14 +672,26 @@ bool css_migration_enabled(void)
>      }                                                                   =
      \
>      type_init(ccw_machine_register_##suffix)
> =20
> +static void ccw_machine_5_1_instance_options(MachineState *machine)
> +{
> +}
> +
> +static void ccw_machine_5_1_class_options(MachineClass *mc)
> +{
> +}
> +DEFINE_CCW_MACHINE(5_1, "5.1", true);
> +
>  static void ccw_machine_5_0_instance_options(MachineState *machine)
>  {
> +    ccw_machine_5_1_instance_options(machine);
>  }
> =20
>  static void ccw_machine_5_0_class_options(MachineClass *mc)
>  {
> +    ccw_machine_5_1_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_5_0, hw_compat_5_0_len)=
;
>  }
> -DEFINE_CCW_MACHINE(5_0, "5.0", true);
> +DEFINE_CCW_MACHINE(5_0, "5.0", false);
> =20
>  static void ccw_machine_4_2_instance_options(MachineState *machine)
>  {
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index fd4d62b5010f..18815d9be24f 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -318,6 +318,9 @@ struct MachineState {
>      } \
>      type_init(machine_initfn##_register_types)
> =20
> +extern GlobalProperty hw_compat_5_0[];
> +extern const size_t hw_compat_5_0_len;
> +
>  extern GlobalProperty hw_compat_4_2[];
>  extern const size_t hw_compat_4_2_len;
> =20
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 6ab6eda046fd..15b9294dac38 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -204,6 +204,9 @@ void pc_system_firmware_init(PCMachineState *pcms, Me=
moryRegion *rom_memory);
>  void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
>                         const CPUArchIdList *apic_ids, GArray *entry);
> =20
> +extern GlobalProperty pc_compat_5_0[];
> +extern const size_t pc_compat_5_0_len;
> +
>  extern GlobalProperty pc_compat_4_2[];
>  extern const size_t pc_compat_4_2_len;
> =20
> --=20
> 2.21.1

