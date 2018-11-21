Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2174169wrt;
        Wed, 21 Nov 2018 09:52:50 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Vn0FJzdLz+BUG3hs8c/paDcr/S36ofD6bIsQfcrpJxyCFZ+PzIkjGCBPfYmACZk0UAVNZZ
X-Received: by 2002:a5b:b09:: with SMTP id z9-v6mr7071657ybp.483.1542822769928;
        Wed, 21 Nov 2018 09:52:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542822769; cv=none;
        d=google.com; s=arc-20160816;
        b=ai8u+WYlJkm8RIP9UuQxXG8tUaUqHzbFtPGZdciCqqpD1JYListZp7Pes2o5YZJ16W
         EPmXlc+ZmZDH2xbjPBVLOcVr0A2vkcTFt6xUAUZXO5ytICFEH5RgkNgxy+g7uI9eU2Fu
         Jxf+8jSQZzj91QxY43ae0UzyM0wwuCuhbsFlkg135MugRtSOPvny4CsU1rWmsBTMiutB
         CqsXOE5gUMa3ZhXt+yqCz9M+luXv1Bwg75haoiaZZSHk3Fjws2EJngJN/Qc0/RURVZrt
         oERlvST7i9TFHhmUCoqTmvvUt9mK2X/3G3YQzKvoNenwxC8EVKZJl1yRWk79X6b20im2
         0ORQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to;
        bh=ECgsTtW89gTlcLH9p+05P/6DQAYQ2aGqzk1YiqWViS4=;
        b=S3c7CZHtfCHU4jN3xV669mFTEhyKD+yGSUFFi/FNuyHSGrFKK19Jm3tL+XWT7gBHDZ
         uDP26+WinE4R8fnkGBAXzq5aaoEpf+ocQVhpIe49RC/g362KVooELJcx1WrlUGaximT5
         kDRVeEvxNNC5yokuQ2tgV8QM5Wm4XletpEc6qQhLdRhI5tBZhxJ2Do4DcM7rFpiPMLil
         H+zlyG6efvpxdRPhksI/hubINQeayM000Ed0b6vJXg/qCODyo5sfMv57OFb+SPNQsd1z
         4MV07GNiCDSeZ135fMSALwF0X9JaldSryIhZ3x9UYpoWrtNai0p5TsqPzDwV09brjIKE
         nclA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s2-v6si14680026ybf.293.2018.11.21.09.52.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Nov 2018 09:52:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40937 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPWgD-0005vW-4B
	for alex.bennee@linaro.org; Wed, 21 Nov 2018 12:52:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1gPWg1-0005rV-OQ
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 12:52:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1gPWfx-0004BB-Md
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 12:52:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57126)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1gPWfx-00049b-Ad; Wed, 21 Nov 2018 12:52:33 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB996307CDFE;
	Wed, 21 Nov 2018 17:52:31 +0000 (UTC)
Received: from [10.36.112.53] (ovpn-112-53.ams2.redhat.com [10.36.112.53])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F4A55D75C;
	Wed, 21 Nov 2018 17:52:13 +0000 (UTC)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
References: <20181114132931.22624-1-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=pbonzini@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <35cfc519-f44e-1b1b-2350-9255c4699924@redhat.com>
Date: Wed, 21 Nov 2018 18:52:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181114132931.22624-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Wed, 21 Nov 2018 17:52:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] vmstate: constify VMStateField
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>,
	quintela@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	dgilbert@redhat.com, Artyom Tarasenko <atar4qemu@gmail.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	"open list:S390" <qemu-s390x@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hxfHqF0XgZ58

On 14/11/18 14:29, Marc-Andr=C3=A9 Lureau wrote:
> Because they are supposed to remain const.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/migration/vmstate.h |   6 +-
>  hw/display/virtio-gpu.c     |   4 +-
>  hw/intc/s390_flic_kvm.c     |   4 +-
>  hw/nvram/eeprom93xx.c       |   6 +-
>  hw/nvram/fw_cfg.c           |   6 +-
>  hw/pci/msix.c               |   4 +-
>  hw/pci/pci.c                |   8 +--
>  hw/pci/shpc.c               |   7 ++-
>  hw/scsi/scsi-bus.c          |   4 +-
>  hw/timer/twl92230.c         |   4 +-
>  hw/usb/redirect.c           |  12 ++--
>  hw/virtio/virtio.c          |   8 +--
>  migration/savevm.c          |   7 ++-
>  migration/vmstate-types.c   | 119 ++++++++++++++++++++----------------
>  migration/vmstate.c         |  31 +++++-----
>  target/alpha/machine.c      |   5 +-
>  target/arm/machine.c        |  12 ++--
>  target/hppa/machine.c       |  10 +--
>  target/mips/machine.c       |  14 +++--
>  target/openrisc/machine.c   |   5 +-
>  target/ppc/machine.c        |  14 +++--
>  target/sparc/machine.c      |   7 ++-
>  22 files changed, 162 insertions(+), 135 deletions(-)
>=20
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index 2b501d0466..61bef3ef5c 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -40,8 +40,8 @@ typedef struct VMStateField VMStateField;
>   */
>  struct VMStateInfo {
>      const char *name;
> -    int (*get)(QEMUFile *f, void *pv, size_t size, VMStateField *field=
);
> -    int (*put)(QEMUFile *f, void *pv, size_t size, VMStateField *field=
,
> +    int (*get)(QEMUFile *f, void *pv, size_t size, const VMStateField =
*field);
> +    int (*put)(QEMUFile *f, void *pv, size_t size, const VMStateField =
*field,
>                 QJSON *vmdesc);
>  };
> =20
> @@ -186,7 +186,7 @@ struct VMStateDescription {
>      int (*post_load)(void *opaque, int version_id);
>      int (*pre_save)(void *opaque);
>      bool (*needed)(void *opaque);
> -    VMStateField *fields;
> +    const VMStateField *fields;
>      const VMStateDescription **subsections;
>  };
> =20
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index 7be3a9d404..c6fab56f9b 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -1073,7 +1073,7 @@ static const VMStateDescription vmstate_virtio_gp=
u_scanouts =3D {
>  };
> =20
>  static int virtio_gpu_save(QEMUFile *f, void *opaque, size_t size,
> -                           VMStateField *field, QJSON *vmdesc)
> +                           const VMStateField *field, QJSON *vmdesc)
>  {
>      VirtIOGPU *g =3D opaque;
>      struct virtio_gpu_simple_resource *res;
> @@ -1101,7 +1101,7 @@ static int virtio_gpu_save(QEMUFile *f, void *opa=
que, size_t size,
>  }
> =20
>  static int virtio_gpu_load(QEMUFile *f, void *opaque, size_t size,
> -                           VMStateField *field)
> +                           const VMStateField *field)
>  {
>      VirtIOGPU *g =3D opaque;
>      struct virtio_gpu_simple_resource *res;
> diff --git a/hw/intc/s390_flic_kvm.c b/hw/intc/s390_flic_kvm.c
> index 3f804ad52e..a03df37560 100644
> --- a/hw/intc/s390_flic_kvm.c
> +++ b/hw/intc/s390_flic_kvm.c
> @@ -376,7 +376,7 @@ static void kvm_s390_release_adapter_routes(S390FLI=
CState *fs,
>   * reached
>   */
>  static int kvm_flic_save(QEMUFile *f, void *opaque, size_t size,
> -                         VMStateField *field, QJSON *vmdesc)
> +                         const VMStateField *field, QJSON *vmdesc)
>  {
>      KVMS390FLICState *flic =3D opaque;
>      int len =3D FLIC_SAVE_INITIAL_SIZE;
> @@ -426,7 +426,7 @@ static int kvm_flic_save(QEMUFile *f, void *opaque,=
 size_t size,
>   * in QEMUFile
>   */
>  static int kvm_flic_load(QEMUFile *f, void *opaque, size_t size,
> -                         VMStateField *field)
> +                         const VMStateField *field)
>  {
>      uint64_t len =3D 0;
>      uint64_t count =3D 0;
> diff --git a/hw/nvram/eeprom93xx.c b/hw/nvram/eeprom93xx.c
> index 2fd0e3c29f..2db3d7cce6 100644
> --- a/hw/nvram/eeprom93xx.c
> +++ b/hw/nvram/eeprom93xx.c
> @@ -95,15 +95,15 @@ struct _eeprom_t {
>   */
> =20
>  static int get_uint16_from_uint8(QEMUFile *f, void *pv, size_t size,
> -                                 VMStateField *field)
> +                                 const VMStateField *field)
>  {
>      uint16_t *v =3D pv;
>      *v =3D qemu_get_ubyte(f);
>      return 0;
>  }
> =20
> -static int put_unused(QEMUFile *f, void *pv, size_t size, VMStateField=
 *field,
> -                      QJSON *vmdesc)
> +static int put_unused(QEMUFile *f, void *pv, size_t size,
> +                      const VMStateField *field, QJSON *vmdesc)
>  {
>      fprintf(stderr, "uint16_from_uint8 is used only for backwards comp=
atibility.\n");
>      fprintf(stderr, "Never should be used to write a new state.\n");
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index 946f765f7f..3cb726ff68 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -520,15 +520,15 @@ static void fw_cfg_reset(DeviceState *d)
>   */
> =20
>  static int get_uint32_as_uint16(QEMUFile *f, void *pv, size_t size,
> -                                VMStateField *field)
> +                                const VMStateField *field)
>  {
>      uint32_t *v =3D pv;
>      *v =3D qemu_get_be16(f);
>      return 0;
>  }
> =20
> -static int put_unused(QEMUFile *f, void *pv, size_t size, VMStateField=
 *field,
> -                      QJSON *vmdesc)
> +static int put_unused(QEMUFile *f, void *pv, size_t size,
> +                      const VMStateField *field, QJSON *vmdesc)
>  {
>      fprintf(stderr, "uint32_as_uint16 is only used for backward compat=
ibility.\n");
>      fprintf(stderr, "This functions shouldn't be called.\n");
> diff --git a/hw/pci/msix.c b/hw/pci/msix.c
> index c944c02135..702dac4ec7 100644
> --- a/hw/pci/msix.c
> +++ b/hw/pci/msix.c
> @@ -625,7 +625,7 @@ void msix_unset_vector_notifiers(PCIDevice *dev)
>  }
> =20
>  static int put_msix_state(QEMUFile *f, void *pv, size_t size,
> -                          VMStateField *field, QJSON *vmdesc)
> +                          const VMStateField *field, QJSON *vmdesc)
>  {
>      msix_save(pv, f);
> =20
> @@ -633,7 +633,7 @@ static int put_msix_state(QEMUFile *f, void *pv, si=
ze_t size,
>  }
> =20
>  static int get_msix_state(QEMUFile *f, void *pv, size_t size,
> -                          VMStateField *field)
> +                          const VMStateField *field)
>  {
>      msix_load(pv, f);
>      return 0;
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index b937f0dc0a..56b13b3320 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -450,7 +450,7 @@ int pci_bus_numa_node(PCIBus *bus)
>  }
> =20
>  static int get_pci_config_device(QEMUFile *f, void *pv, size_t size,
> -                                 VMStateField *field)
> +                                 const VMStateField *field)
>  {
>      PCIDevice *s =3D container_of(pv, PCIDevice, config);
>      PCIDeviceClass *pc =3D PCI_DEVICE_GET_CLASS(s);
> @@ -490,7 +490,7 @@ static int get_pci_config_device(QEMUFile *f, void =
*pv, size_t size,
> =20
>  /* just put buffer */
>  static int put_pci_config_device(QEMUFile *f, void *pv, size_t size,
> -                                 VMStateField *field, QJSON *vmdesc)
> +                                 const VMStateField *field, QJSON *vmd=
esc)
>  {
>      const uint8_t **v =3D pv;
>      assert(size =3D=3D pci_config_size(container_of(pv, PCIDevice, con=
fig)));
> @@ -506,7 +506,7 @@ static VMStateInfo vmstate_info_pci_config =3D {
>  };
> =20
>  static int get_pci_irq_state(QEMUFile *f, void *pv, size_t size,
> -                             VMStateField *field)
> +                             const VMStateField *field)
>  {
>      PCIDevice *s =3D container_of(pv, PCIDevice, irq_state);
>      uint32_t irq_state[PCI_NUM_PINS];
> @@ -528,7 +528,7 @@ static int get_pci_irq_state(QEMUFile *f, void *pv,=
 size_t size,
>  }
> =20
>  static int put_pci_irq_state(QEMUFile *f, void *pv, size_t size,
> -                             VMStateField *field, QJSON *vmdesc)
> +                             const VMStateField *field, QJSON *vmdesc)
>  {
>      int i;
>      PCIDevice *s =3D container_of(pv, PCIDevice, irq_state);
> diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
> index a8462d48bb..96a43d2f70 100644
> --- a/hw/pci/shpc.c
> +++ b/hw/pci/shpc.c
> @@ -688,8 +688,8 @@ void shpc_cap_write_config(PCIDevice *d, uint32_t a=
ddr, uint32_t val, int l)
>      shpc_cap_update_dword(d);
>  }
> =20
> -static int shpc_save(QEMUFile *f, void *pv, size_t size, VMStateField =
*field,
> -                     QJSON *vmdesc)
> +static int shpc_save(QEMUFile *f, void *pv, size_t size,
> +                     const VMStateField *field, QJSON *vmdesc)
>  {
>      PCIDevice *d =3D container_of(pv, PCIDevice, shpc);
>      qemu_put_buffer(f, d->shpc->config, SHPC_SIZEOF(d));
> @@ -697,7 +697,8 @@ static int shpc_save(QEMUFile *f, void *pv, size_t =
size, VMStateField *field,
>      return 0;
>  }
> =20
> -static int shpc_load(QEMUFile *f, void *pv, size_t size, VMStateField =
*field)
> +static int shpc_load(QEMUFile *f, void *pv, size_t size,
> +                     const VMStateField *field)
>  {
>      PCIDevice *d =3D container_of(pv, PCIDevice, shpc);
>      int ret =3D qemu_get_buffer(f, d->shpc->config, SHPC_SIZEOF(d));
> diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
> index 5905f6bf29..97cd167114 100644
> --- a/hw/scsi/scsi-bus.c
> +++ b/hw/scsi/scsi-bus.c
> @@ -1571,7 +1571,7 @@ SCSIDevice *scsi_device_find(SCSIBus *bus, int ch=
annel, int id, int lun)
>  /* SCSI request list.  For simplicity, pv points to the whole device *=
/
> =20
>  static int put_scsi_requests(QEMUFile *f, void *pv, size_t size,
> -                             VMStateField *field, QJSON *vmdesc)
> +                             const VMStateField *field, QJSON *vmdesc)
>  {
>      SCSIDevice *s =3D pv;
>      SCSIBus *bus =3D DO_UPCAST(SCSIBus, qbus, s->qdev.parent_bus);
> @@ -1599,7 +1599,7 @@ static int put_scsi_requests(QEMUFile *f, void *p=
v, size_t size,
>  }
> =20
>  static int get_scsi_requests(QEMUFile *f, void *pv, size_t size,
> -                             VMStateField *field)
> +                             const VMStateField *field)
>  {
>      SCSIDevice *s =3D pv;
>      SCSIBus *bus =3D DO_UPCAST(SCSIBus, qbus, s->qdev.parent_bus);
> diff --git a/hw/timer/twl92230.c b/hw/timer/twl92230.c
> index 3b43b46199..51ec355f3f 100644
> --- a/hw/timer/twl92230.c
> +++ b/hw/timer/twl92230.c
> @@ -750,7 +750,7 @@ static int menelaus_rx(I2CSlave *i2c)
>   */
> =20
>  static int get_int32_as_uint16(QEMUFile *f, void *pv, size_t size,
> -                               VMStateField *field)
> +                               const VMStateField *field)
>  {
>      int *v =3D pv;
>      *v =3D qemu_get_be16(f);
> @@ -758,7 +758,7 @@ static int get_int32_as_uint16(QEMUFile *f, void *p=
v, size_t size,
>  }
> =20
>  static int put_int32_as_uint16(QEMUFile *f, void *pv, size_t size,
> -                               VMStateField *field, QJSON *vmdesc)
> +                               const VMStateField *field, QJSON *vmdes=
c)
>  {
>      int *v =3D pv;
>      qemu_put_be16(f, *v);
> diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
> index 99094a721e..18a42d1938 100644
> --- a/hw/usb/redirect.c
> +++ b/hw/usb/redirect.c
> @@ -2155,7 +2155,7 @@ static int usbredir_post_load(void *priv, int ver=
sion_id)
> =20
>  /* For usbredirparser migration */
>  static int usbredir_put_parser(QEMUFile *f, void *priv, size_t unused,
> -                               VMStateField *field, QJSON *vmdesc)
> +                               const VMStateField *field, QJSON *vmdes=
c)
>  {
>      USBRedirDevice *dev =3D priv;
>      uint8_t *data;
> @@ -2178,7 +2178,7 @@ static int usbredir_put_parser(QEMUFile *f, void =
*priv, size_t unused,
>  }
> =20
>  static int usbredir_get_parser(QEMUFile *f, void *priv, size_t unused,
> -                               VMStateField *field)
> +                               const VMStateField *field)
>  {
>      USBRedirDevice *dev =3D priv;
>      uint8_t *data;
> @@ -2222,7 +2222,7 @@ static const VMStateInfo usbredir_parser_vmstate_=
info =3D {
> =20
>  /* For buffered packets (iso/irq) queue migration */
>  static int usbredir_put_bufpq(QEMUFile *f, void *priv, size_t unused,
> -                              VMStateField *field, QJSON *vmdesc)
> +                              const VMStateField *field, QJSON *vmdesc=
)
>  {
>      struct endp_data *endp =3D priv;
>      USBRedirDevice *dev =3D endp->dev;
> @@ -2245,7 +2245,7 @@ static int usbredir_put_bufpq(QEMUFile *f, void *=
priv, size_t unused,
>  }
> =20
>  static int usbredir_get_bufpq(QEMUFile *f, void *priv, size_t unused,
> -                              VMStateField *field)
> +                              const VMStateField *field)
>  {
>      struct endp_data *endp =3D priv;
>      USBRedirDevice *dev =3D endp->dev;
> @@ -2349,7 +2349,7 @@ static const VMStateDescription usbredir_ep_vmsta=
te =3D {
> =20
>  /* For PacketIdQueue migration */
>  static int usbredir_put_packet_id_q(QEMUFile *f, void *priv, size_t un=
used,
> -                                    VMStateField *field, QJSON *vmdesc=
)
> +                                    const VMStateField *field, QJSON *=
vmdesc)
>  {
>      struct PacketIdQueue *q =3D priv;
>      USBRedirDevice *dev =3D q->dev;
> @@ -2368,7 +2368,7 @@ static int usbredir_put_packet_id_q(QEMUFile *f, =
void *priv, size_t unused,
>  }
> =20
>  static int usbredir_get_packet_id_q(QEMUFile *f, void *priv, size_t un=
used,
> -                                    VMStateField *field)
> +                                    const VMStateField *field)
>  {
>      struct PacketIdQueue *q =3D priv;
>      USBRedirDevice *dev =3D q->dev;
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 4136d239dd..5828ed14df 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -1816,7 +1816,7 @@ static const VMStateDescription vmstate_virtio_ri=
ngsize =3D {
>  };
> =20
>  static int get_extra_state(QEMUFile *f, void *pv, size_t size,
> -                           VMStateField *field)
> +                           const VMStateField *field)
>  {
>      VirtIODevice *vdev =3D pv;
>      BusState *qbus =3D qdev_get_parent_bus(DEVICE(vdev));
> @@ -1830,7 +1830,7 @@ static int get_extra_state(QEMUFile *f, void *pv,=
 size_t size,
>  }
> =20
>  static int put_extra_state(QEMUFile *f, void *pv, size_t size,
> -                           VMStateField *field, QJSON *vmdesc)
> +                           const VMStateField *field, QJSON *vmdesc)
>  {
>      VirtIODevice *vdev =3D pv;
>      BusState *qbus =3D qdev_get_parent_bus(DEVICE(vdev));
> @@ -1979,14 +1979,14 @@ int virtio_save(VirtIODevice *vdev, QEMUFile *f=
)
> =20
>  /* A wrapper for use as a VMState .put function */
>  static int virtio_device_put(QEMUFile *f, void *opaque, size_t size,
> -                              VMStateField *field, QJSON *vmdesc)
> +                              const VMStateField *field, QJSON *vmdesc=
)
>  {
>      return virtio_save(VIRTIO_DEVICE(opaque), f);
>  }
> =20
>  /* A wrapper for use as a VMState .get function */
>  static int virtio_device_get(QEMUFile *f, void *opaque, size_t size,
> -                             VMStateField *field)
> +                             const VMStateField *field)
>  {
>      VirtIODevice *vdev =3D VIRTIO_DEVICE(opaque);
>      DeviceClass *dc =3D DEVICE_CLASS(VIRTIO_DEVICE_GET_CLASS(vdev));
> diff --git a/migration/savevm.c b/migration/savevm.c
> index ef707b8c43..236b242642 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -263,15 +263,16 @@ void timer_get(QEMUFile *f, QEMUTimer *ts)
>   * Not in vmstate.c to not add qemu-timer.c as dependency to vmstate.c
>   */
> =20
> -static int get_timer(QEMUFile *f, void *pv, size_t size, VMStateField =
*field)
> +static int get_timer(QEMUFile *f, void *pv, size_t size,
> +                     const VMStateField *field)
>  {
>      QEMUTimer *v =3D pv;
>      timer_get(f, v);
>      return 0;
>  }
> =20
> -static int put_timer(QEMUFile *f, void *pv, size_t size, VMStateField =
*field,
> -                     QJSON *vmdesc)
> +static int put_timer(QEMUFile *f, void *pv, size_t size,
> +                     const VMStateField *field, QJSON *vmdesc)
>  {
>      QEMUTimer *v =3D pv;
>      timer_put(f, v);
> diff --git a/migration/vmstate-types.c b/migration/vmstate-types.c
> index 48184c380d..6f75f97a07 100644
> --- a/migration/vmstate-types.c
> +++ b/migration/vmstate-types.c
> @@ -22,15 +22,16 @@
> =20
>  /* bool */
> =20
> -static int get_bool(QEMUFile *f, void *pv, size_t size, VMStateField *=
field)
> +static int get_bool(QEMUFile *f, void *pv, size_t size,
> +                    const VMStateField *field)
>  {
>      bool *v =3D pv;
>      *v =3D qemu_get_byte(f);
>      return 0;
>  }
> =20
> -static int put_bool(QEMUFile *f, void *pv, size_t size, VMStateField *=
field,
> -                    QJSON *vmdesc)
> +static int put_bool(QEMUFile *f, void *pv, size_t size,
> +                    const VMStateField *field, QJSON *vmdesc)
>  {
>      bool *v =3D pv;
>      qemu_put_byte(f, *v);
> @@ -45,15 +46,16 @@ const VMStateInfo vmstate_info_bool =3D {
> =20
>  /* 8 bit int */
> =20
> -static int get_int8(QEMUFile *f, void *pv, size_t size, VMStateField *=
field)
> +static int get_int8(QEMUFile *f, void *pv, size_t size,
> +                    const VMStateField *field)
>  {
>      int8_t *v =3D pv;
>      qemu_get_s8s(f, v);
>      return 0;
>  }
> =20
> -static int put_int8(QEMUFile *f, void *pv, size_t size, VMStateField *=
field,
> -                     QJSON *vmdesc)
> +static int put_int8(QEMUFile *f, void *pv, size_t size,
> +                    const VMStateField *field, QJSON *vmdesc)
>  {
>      int8_t *v =3D pv;
>      qemu_put_s8s(f, v);
> @@ -68,15 +70,16 @@ const VMStateInfo vmstate_info_int8 =3D {
> =20
>  /* 16 bit int */
> =20
> -static int get_int16(QEMUFile *f, void *pv, size_t size, VMStateField =
*field)
> +static int get_int16(QEMUFile *f, void *pv, size_t size,
> +                     const VMStateField *field)
>  {
>      int16_t *v =3D pv;
>      qemu_get_sbe16s(f, v);
>      return 0;
>  }
> =20
> -static int put_int16(QEMUFile *f, void *pv, size_t size, VMStateField =
*field,
> -                     QJSON *vmdesc)
> +static int put_int16(QEMUFile *f, void *pv, size_t size,
> +                     const VMStateField *field, QJSON *vmdesc)
>  {
>      int16_t *v =3D pv;
>      qemu_put_sbe16s(f, v);
> @@ -91,15 +94,16 @@ const VMStateInfo vmstate_info_int16 =3D {
> =20
>  /* 32 bit int */
> =20
> -static int get_int32(QEMUFile *f, void *pv, size_t size, VMStateField =
*field)
> +static int get_int32(QEMUFile *f, void *pv, size_t size,
> +                     const VMStateField *field)
>  {
>      int32_t *v =3D pv;
>      qemu_get_sbe32s(f, v);
>      return 0;
>  }
> =20
> -static int put_int32(QEMUFile *f, void *pv, size_t size, VMStateField =
*field,
> -                     QJSON *vmdesc)
> +static int put_int32(QEMUFile *f, void *pv, size_t size,
> +                     const VMStateField *field, QJSON *vmdesc)
>  {
>      int32_t *v =3D pv;
>      qemu_put_sbe32s(f, v);
> @@ -116,7 +120,7 @@ const VMStateInfo vmstate_info_int32 =3D {
>     in the field */
> =20
>  static int get_int32_equal(QEMUFile *f, void *pv, size_t size,
> -                           VMStateField *field)
> +                           const VMStateField *field)
>  {
>      int32_t *v =3D pv;
>      int32_t v2;
> @@ -142,7 +146,8 @@ const VMStateInfo vmstate_info_int32_equal =3D {
>   * and less than or equal to the one in the field.
>   */
> =20
> -static int get_int32_le(QEMUFile *f, void *pv, size_t size, VMStateFie=
ld *field)
> +static int get_int32_le(QEMUFile *f, void *pv, size_t size,
> +                        const VMStateField *field)
>  {
>      int32_t *cur =3D pv;
>      int32_t loaded;
> @@ -166,15 +171,16 @@ const VMStateInfo vmstate_info_int32_le =3D {
> =20
>  /* 64 bit int */
> =20
> -static int get_int64(QEMUFile *f, void *pv, size_t size, VMStateField =
*field)
> +static int get_int64(QEMUFile *f, void *pv, size_t size,
> +                     const VMStateField *field)
>  {
>      int64_t *v =3D pv;
>      qemu_get_sbe64s(f, v);
>      return 0;
>  }
> =20
> -static int put_int64(QEMUFile *f, void *pv, size_t size, VMStateField =
*field,
> -                      QJSON *vmdesc)
> +static int put_int64(QEMUFile *f, void *pv, size_t size,
> +                     const VMStateField *field, QJSON *vmdesc)
>  {
>      int64_t *v =3D pv;
>      qemu_put_sbe64s(f, v);
> @@ -189,15 +195,16 @@ const VMStateInfo vmstate_info_int64 =3D {
> =20
>  /* 8 bit unsigned int */
> =20
> -static int get_uint8(QEMUFile *f, void *pv, size_t size, VMStateField =
*field)
> +static int get_uint8(QEMUFile *f, void *pv, size_t size,
> +                     const VMStateField *field)
>  {
>      uint8_t *v =3D pv;
>      qemu_get_8s(f, v);
>      return 0;
>  }
> =20
> -static int put_uint8(QEMUFile *f, void *pv, size_t size, VMStateField =
*field,
> -                     QJSON *vmdesc)
> +static int put_uint8(QEMUFile *f, void *pv, size_t size,
> +                     const VMStateField *field, QJSON *vmdesc)
>  {
>      uint8_t *v =3D pv;
>      qemu_put_8s(f, v);
> @@ -212,15 +219,16 @@ const VMStateInfo vmstate_info_uint8 =3D {
> =20
>  /* 16 bit unsigned int */
> =20
> -static int get_uint16(QEMUFile *f, void *pv, size_t size, VMStateField=
 *field)
> +static int get_uint16(QEMUFile *f, void *pv, size_t size,
> +                      const VMStateField *field)
>  {
>      uint16_t *v =3D pv;
>      qemu_get_be16s(f, v);
>      return 0;
>  }
> =20
> -static int put_uint16(QEMUFile *f, void *pv, size_t size, VMStateField=
 *field,
> -                      QJSON *vmdesc)
> +static int put_uint16(QEMUFile *f, void *pv, size_t size,
> +                      const VMStateField *field, QJSON *vmdesc)
>  {
>      uint16_t *v =3D pv;
>      qemu_put_be16s(f, v);
> @@ -235,15 +243,16 @@ const VMStateInfo vmstate_info_uint16 =3D {
> =20
>  /* 32 bit unsigned int */
> =20
> -static int get_uint32(QEMUFile *f, void *pv, size_t size, VMStateField=
 *field)
> +static int get_uint32(QEMUFile *f, void *pv, size_t size,
> +                      const VMStateField *field)
>  {
>      uint32_t *v =3D pv;
>      qemu_get_be32s(f, v);
>      return 0;
>  }
> =20
> -static int put_uint32(QEMUFile *f, void *pv, size_t size, VMStateField=
 *field,
> -                      QJSON *vmdesc)
> +static int put_uint32(QEMUFile *f, void *pv, size_t size,
> +                      const VMStateField *field, QJSON *vmdesc)
>  {
>      uint32_t *v =3D pv;
>      qemu_put_be32s(f, v);
> @@ -260,7 +269,7 @@ const VMStateInfo vmstate_info_uint32 =3D {
>     in the field */
> =20
>  static int get_uint32_equal(QEMUFile *f, void *pv, size_t size,
> -                            VMStateField *field)
> +                            const VMStateField *field)
>  {
>      uint32_t *v =3D pv;
>      uint32_t v2;
> @@ -284,15 +293,16 @@ const VMStateInfo vmstate_info_uint32_equal =3D {
> =20
>  /* 64 bit unsigned int */
> =20
> -static int get_uint64(QEMUFile *f, void *pv, size_t size, VMStateField=
 *field)
> +static int get_uint64(QEMUFile *f, void *pv, size_t size,
> +                      const VMStateField *field)
>  {
>      uint64_t *v =3D pv;
>      qemu_get_be64s(f, v);
>      return 0;
>  }
> =20
> -static int put_uint64(QEMUFile *f, void *pv, size_t size, VMStateField=
 *field,
> -                      QJSON *vmdesc)
> +static int put_uint64(QEMUFile *f, void *pv, size_t size,
> +                      const VMStateField *field, QJSON *vmdesc)
>  {
>      uint64_t *v =3D pv;
>      qemu_put_be64s(f, v);
> @@ -305,7 +315,8 @@ const VMStateInfo vmstate_info_uint64 =3D {
>      .put  =3D put_uint64,
>  };
> =20
> -static int get_nullptr(QEMUFile *f, void *pv, size_t size, VMStateFiel=
d *field)
> +static int get_nullptr(QEMUFile *f, void *pv, size_t size,
> +                       const VMStateField *field)
> =20
>  {
>      if (qemu_get_byte(f) =3D=3D VMS_NULLPTR_MARKER) {
> @@ -316,7 +327,7 @@ static int get_nullptr(QEMUFile *f, void *pv, size_=
t size, VMStateField *field)
>  }
> =20
>  static int put_nullptr(QEMUFile *f, void *pv, size_t size,
> -                        VMStateField *field, QJSON *vmdesc)
> +                        const VMStateField *field, QJSON *vmdesc)
> =20
>  {
>      if (pv =3D=3D NULL) {
> @@ -337,7 +348,7 @@ const VMStateInfo vmstate_info_nullptr =3D {
>     in the field */
> =20
>  static int get_uint64_equal(QEMUFile *f, void *pv, size_t size,
> -                            VMStateField *field)
> +                            const VMStateField *field)
>  {
>      uint64_t *v =3D pv;
>      uint64_t v2;
> @@ -363,7 +374,7 @@ const VMStateInfo vmstate_info_uint64_equal =3D {
>     in the field */
> =20
>  static int get_uint8_equal(QEMUFile *f, void *pv, size_t size,
> -                           VMStateField *field)
> +                           const VMStateField *field)
>  {
>      uint8_t *v =3D pv;
>      uint8_t v2;
> @@ -389,7 +400,7 @@ const VMStateInfo vmstate_info_uint8_equal =3D {
>     in the field */
> =20
>  static int get_uint16_equal(QEMUFile *f, void *pv, size_t size,
> -                            VMStateField *field)
> +                            const VMStateField *field)
>  {
>      uint16_t *v =3D pv;
>      uint16_t v2;
> @@ -414,7 +425,7 @@ const VMStateInfo vmstate_info_uint16_equal =3D {
>  /* floating point */
> =20
>  static int get_float64(QEMUFile *f, void *pv, size_t size,
> -                       VMStateField *field)
> +                       const VMStateField *field)
>  {
>      float64 *v =3D pv;
> =20
> @@ -422,8 +433,8 @@ static int get_float64(QEMUFile *f, void *pv, size_=
t size,
>      return 0;
>  }
> =20
> -static int put_float64(QEMUFile *f, void *pv, size_t size, VMStateFiel=
d *field,
> -                       QJSON *vmdesc)
> +static int put_float64(QEMUFile *f, void *pv, size_t size,
> +                       const VMStateField *field, QJSON *vmdesc)
>  {
>      uint64_t *v =3D pv;
> =20
> @@ -440,7 +451,7 @@ const VMStateInfo vmstate_info_float64 =3D {
>  /* CPU_DoubleU type */
> =20
>  static int get_cpudouble(QEMUFile *f, void *pv, size_t size,
> -                         VMStateField *field)
> +                         const VMStateField *field)
>  {
>      CPU_DoubleU *v =3D pv;
>      qemu_get_be32s(f, &v->l.upper);
> @@ -449,7 +460,7 @@ static int get_cpudouble(QEMUFile *f, void *pv, siz=
e_t size,
>  }
> =20
>  static int put_cpudouble(QEMUFile *f, void *pv, size_t size,
> -                         VMStateField *field, QJSON *vmdesc)
> +                         const VMStateField *field, QJSON *vmdesc)
>  {
>      CPU_DoubleU *v =3D pv;
>      qemu_put_be32s(f, &v->l.upper);
> @@ -466,15 +477,15 @@ const VMStateInfo vmstate_info_cpudouble =3D {
>  /* uint8_t buffers */
> =20
>  static int get_buffer(QEMUFile *f, void *pv, size_t size,
> -                      VMStateField *field)
> +                      const VMStateField *field)
>  {
>      uint8_t *v =3D pv;
>      qemu_get_buffer(f, v, size);
>      return 0;
>  }
> =20
> -static int put_buffer(QEMUFile *f, void *pv, size_t size, VMStateField=
 *field,
> -                      QJSON *vmdesc)
> +static int put_buffer(QEMUFile *f, void *pv, size_t size,
> +                      const VMStateField *field, QJSON *vmdesc)
>  {
>      uint8_t *v =3D pv;
>      qemu_put_buffer(f, v, size);
> @@ -491,7 +502,7 @@ const VMStateInfo vmstate_info_buffer =3D {
>     not useful anymore */
> =20
>  static int get_unused_buffer(QEMUFile *f, void *pv, size_t size,
> -                             VMStateField *field)
> +                             const VMStateField *field)
>  {
>      uint8_t buf[1024];
>      int block_len;
> @@ -505,7 +516,7 @@ static int get_unused_buffer(QEMUFile *f, void *pv,=
 size_t size,
>  }
> =20
>  static int put_unused_buffer(QEMUFile *f, void *pv, size_t size,
> -                             VMStateField *field, QJSON *vmdesc)
> +                             const VMStateField *field, QJSON *vmdesc)
>  {
>      static const uint8_t buf[1024];
>      int block_len;
> @@ -531,7 +542,8 @@ const VMStateInfo vmstate_info_unused_buffer =3D {
>   * in fields that don't really exist in the parent but need to be in t=
he
>   * stream.
>   */
> -static int get_tmp(QEMUFile *f, void *pv, size_t size, VMStateField *f=
ield)
> +static int get_tmp(QEMUFile *f, void *pv, size_t size,
> +                   const VMStateField *field)
>  {
>      int ret;
>      const VMStateDescription *vmsd =3D field->vmsd;
> @@ -545,8 +557,8 @@ static int get_tmp(QEMUFile *f, void *pv, size_t si=
ze, VMStateField *field)
>      return ret;
>  }
> =20
> -static int put_tmp(QEMUFile *f, void *pv, size_t size, VMStateField *f=
ield,
> -                    QJSON *vmdesc)
> +static int put_tmp(QEMUFile *f, void *pv, size_t size,
> +                   const VMStateField *field, QJSON *vmdesc)
>  {
>      const VMStateDescription *vmsd =3D field->vmsd;
>      void *tmp =3D g_malloc(size);
> @@ -573,7 +585,8 @@ const VMStateInfo vmstate_info_tmp =3D {
>   */
>  /* This is the number of 64 bit words sent over the wire */
>  #define BITS_TO_U64S(nr) DIV_ROUND_UP(nr, 64)
> -static int get_bitmap(QEMUFile *f, void *pv, size_t size, VMStateField=
 *field)
> +static int get_bitmap(QEMUFile *f, void *pv, size_t size,
> +                      const VMStateField *field)
>  {
>      unsigned long *bmp =3D pv;
>      int i, idx =3D 0;
> @@ -587,8 +600,8 @@ static int get_bitmap(QEMUFile *f, void *pv, size_t=
 size, VMStateField *field)
>      return 0;
>  }
> =20
> -static int put_bitmap(QEMUFile *f, void *pv, size_t size, VMStateField=
 *field,
> -                      QJSON *vmdesc)
> +static int put_bitmap(QEMUFile *f, void *pv, size_t size,
> +                      const VMStateField *field, QJSON *vmdesc)
>  {
>      unsigned long *bmp =3D pv;
>      int i, idx =3D 0;
> @@ -613,7 +626,7 @@ const VMStateInfo vmstate_info_bitmap =3D {
>   * meta data about the QTAILQ is encoded in a VMStateField structure
>   */
>  static int get_qtailq(QEMUFile *f, void *pv, size_t unused_size,
> -                      VMStateField *field)
> +                      const VMStateField *field)
>  {
>      int ret =3D 0;
>      const VMStateDescription *vmsd =3D field->vmsd;
> @@ -652,7 +665,7 @@ static int get_qtailq(QEMUFile *f, void *pv, size_t=
 unused_size,
> =20
>  /* put for QTAILQ */
>  static int put_qtailq(QEMUFile *f, void *pv, size_t unused_size,
> -                      VMStateField *field, QJSON *vmdesc)
> +                      const VMStateField *field, QJSON *vmdesc)
>  {
>      const VMStateDescription *vmsd =3D field->vmsd;
>      /* offset of the QTAILQ entry in a QTAILQ element*/
> diff --git a/migration/vmstate.c b/migration/vmstate.c
> index 0bc240a317..80b59009aa 100644
> --- a/migration/vmstate.c
> +++ b/migration/vmstate.c
> @@ -26,7 +26,7 @@ static int vmstate_subsection_save(QEMUFile *f, const=
 VMStateDescription *vmsd,
>  static int vmstate_subsection_load(QEMUFile *f, const VMStateDescripti=
on *vmsd,
>                                     void *opaque);
> =20
> -static int vmstate_n_elems(void *opaque, VMStateField *field)
> +static int vmstate_n_elems(void *opaque, const VMStateField *field)
>  {
>      int n_elems =3D 1;
> =20
> @@ -50,7 +50,7 @@ static int vmstate_n_elems(void *opaque, VMStateField=
 *field)
>      return n_elems;
>  }
> =20
> -static int vmstate_size(void *opaque, VMStateField *field)
> +static int vmstate_size(void *opaque, const VMStateField *field)
>  {
>      int size =3D field->size;
> =20
> @@ -64,7 +64,8 @@ static int vmstate_size(void *opaque, VMStateField *f=
ield)
>      return size;
>  }
> =20
> -static void vmstate_handle_alloc(void *ptr, VMStateField *field, void =
*opaque)
> +static void vmstate_handle_alloc(void *ptr, const VMStateField *field,
> +                                 void *opaque)
>  {
>      if (field->flags & VMS_POINTER && field->flags & VMS_ALLOC) {
>          gsize size =3D vmstate_size(opaque, field);
> @@ -78,7 +79,7 @@ static void vmstate_handle_alloc(void *ptr, VMStateFi=
eld *field, void *opaque)
>  int vmstate_load_state(QEMUFile *f, const VMStateDescription *vmsd,
>                         void *opaque, int version_id)
>  {
> -    VMStateField *field =3D vmsd->fields;
> +    const VMStateField *field =3D vmsd->fields;
>      int ret =3D 0;
> =20
>      trace_vmstate_load_state(vmsd->name, version_id);
> @@ -171,9 +172,10 @@ int vmstate_load_state(QEMUFile *f, const VMStateD=
escription *vmsd,
>      return ret;
>  }
> =20
> -static int vmfield_name_num(VMStateField *start, VMStateField *search)
> +static int vmfield_name_num(const VMStateField *start,
> +                            const VMStateField *search)
>  {
> -    VMStateField *field;
> +    const VMStateField *field;
>      int found =3D 0;
> =20
>      for (field =3D start; field->name; field++) {
> @@ -188,9 +190,10 @@ static int vmfield_name_num(VMStateField *start, V=
MStateField *search)
>      return -1;
>  }
> =20
> -static bool vmfield_name_is_unique(VMStateField *start, VMStateField *=
search)
> +static bool vmfield_name_is_unique(const VMStateField *start,
> +                                   const VMStateField *search)
>  {
> -    VMStateField *field;
> +    const VMStateField *field;
>      int found =3D 0;
> =20
>      for (field =3D start; field->name; field++) {
> @@ -206,7 +209,7 @@ static bool vmfield_name_is_unique(VMStateField *st=
art, VMStateField *search)
>      return true;
>  }
> =20
> -static const char *vmfield_get_type_name(VMStateField *field)
> +static const char *vmfield_get_type_name(const VMStateField *field)
>  {
>      const char *type =3D "unknown";
> =20
> @@ -221,7 +224,7 @@ static const char *vmfield_get_type_name(VMStateFie=
ld *field)
>      return type;
>  }
> =20
> -static bool vmsd_can_compress(VMStateField *field)
> +static bool vmsd_can_compress(const VMStateField *field)
>  {
>      if (field->field_exists) {
>          /* Dynamically existing fields mess up compression */
> @@ -229,7 +232,7 @@ static bool vmsd_can_compress(VMStateField *field)
>      }
> =20
>      if (field->flags & VMS_STRUCT) {
> -        VMStateField *sfield =3D field->vmsd->fields;
> +        const VMStateField *sfield =3D field->vmsd->fields;
>          while (sfield->name) {
>              if (!vmsd_can_compress(sfield)) {
>                  /* Child elements can't compress, so can't we */
> @@ -248,7 +251,7 @@ static bool vmsd_can_compress(VMStateField *field)
>  }
> =20
>  static void vmsd_desc_field_start(const VMStateDescription *vmsd, QJSO=
N *vmdesc,
> -                                  VMStateField *field, int i, int max)
> +                                  const VMStateField *field, int i, in=
t max)
>  {
>      char *name, *old_name;
>      bool is_array =3D max > 1;
> @@ -287,7 +290,7 @@ static void vmsd_desc_field_start(const VMStateDesc=
ription *vmsd, QJSON *vmdesc,
>  }
> =20
>  static void vmsd_desc_field_end(const VMStateDescription *vmsd, QJSON =
*vmdesc,
> -                                VMStateField *field, size_t size, int =
i)
> +                                const VMStateField *field, size_t size=
, int i)
>  {
>      if (!vmdesc) {
>          return;
> @@ -323,7 +326,7 @@ int vmstate_save_state_v(QEMUFile *f, const VMState=
Description *vmsd,
>                           void *opaque, QJSON *vmdesc, int version_id)
>  {
>      int ret =3D 0;
> -    VMStateField *field =3D vmsd->fields;
> +    const VMStateField *field =3D vmsd->fields;
> =20
>      trace_vmstate_save_state_top(vmsd->name);
> =20
> diff --git a/target/alpha/machine.c b/target/alpha/machine.c
> index 0914ba5fc1..abc81cef7b 100644
> --- a/target/alpha/machine.c
> +++ b/target/alpha/machine.c
> @@ -5,7 +5,8 @@
>  #include "hw/boards.h"
>  #include "migration/cpu.h"
> =20
> -static int get_fpcr(QEMUFile *f, void *opaque, size_t size, VMStateFie=
ld *field)
> +static int get_fpcr(QEMUFile *f, void *opaque, size_t size,
> +                    const VMStateField *field)
>  {
>      CPUAlphaState *env =3D opaque;
>      cpu_alpha_store_fpcr(env, qemu_get_be64(f));
> @@ -13,7 +14,7 @@ static int get_fpcr(QEMUFile *f, void *opaque, size_t=
 size, VMStateField *field)
>  }
> =20
>  static int put_fpcr(QEMUFile *f, void *opaque, size_t size,
> -                    VMStateField *field, QJSON *vmdesc)
> +                    const VMStateField *field, QJSON *vmdesc)
>  {
>      CPUAlphaState *env =3D opaque;
>      qemu_put_be64(f, cpu_alpha_load_fpcr(env));
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index 2033816a64..7a22ebc209 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -18,7 +18,7 @@ static bool vfp_needed(void *opaque)
>  }
> =20
>  static int get_fpscr(QEMUFile *f, void *opaque, size_t size,
> -                     VMStateField *field)
> +                     const VMStateField *field)
>  {
>      ARMCPU *cpu =3D opaque;
>      CPUARMState *env =3D &cpu->env;
> @@ -29,7 +29,7 @@ static int get_fpscr(QEMUFile *f, void *opaque, size_=
t size,
>  }
> =20
>  static int put_fpscr(QEMUFile *f, void *opaque, size_t size,
> -                     VMStateField *field, QJSON *vmdesc)
> +                     const VMStateField *field, QJSON *vmdesc)
>  {
>      ARMCPU *cpu =3D opaque;
>      CPUARMState *env =3D &cpu->env;
> @@ -503,7 +503,7 @@ static const VMStateDescription vmstate_m_security =
=3D {
>  };
> =20
>  static int get_cpsr(QEMUFile *f, void *opaque, size_t size,
> -                    VMStateField *field)
> +                    const VMStateField *field)
>  {
>      ARMCPU *cpu =3D opaque;
>      CPUARMState *env =3D &cpu->env;
> @@ -559,7 +559,7 @@ static int get_cpsr(QEMUFile *f, void *opaque, size=
_t size,
>  }
> =20
>  static int put_cpsr(QEMUFile *f, void *opaque, size_t size,
> -                    VMStateField *field, QJSON *vmdesc)
> +                    const VMStateField *field, QJSON *vmdesc)
>  {
>      ARMCPU *cpu =3D opaque;
>      CPUARMState *env =3D &cpu->env;
> @@ -585,7 +585,7 @@ static const VMStateInfo vmstate_cpsr =3D {
>  };
> =20
>  static int get_power(QEMUFile *f, void *opaque, size_t size,
> -                    VMStateField *field)
> +                    const VMStateField *field)
>  {
>      ARMCPU *cpu =3D opaque;
>      bool powered_off =3D qemu_get_byte(f);
> @@ -594,7 +594,7 @@ static int get_power(QEMUFile *f, void *opaque, siz=
e_t size,
>  }
> =20
>  static int put_power(QEMUFile *f, void *opaque, size_t size,
> -                    VMStateField *field, QJSON *vmdesc)
> +                    const VMStateField *field, QJSON *vmdesc)
>  {
>      ARMCPU *cpu =3D opaque;
> =20
> diff --git a/target/hppa/machine.c b/target/hppa/machine.c
> index 8e077788c3..a1bee9796f 100644
> --- a/target/hppa/machine.c
> +++ b/target/hppa/machine.c
> @@ -46,7 +46,8 @@
>      VMSTATE_UINTTR_ARRAY_V(_f, _s, _n, 0)
> =20
> =20
> -static int get_psw(QEMUFile *f, void *opaque, size_t size, VMStateFiel=
d *field)
> +static int get_psw(QEMUFile *f, void *opaque, size_t size,
> +                   const VMStateField *field)
>  {
>      CPUHPPAState *env =3D opaque;
>      cpu_hppa_put_psw(env, qemu_get_betr(f));
> @@ -54,7 +55,7 @@ static int get_psw(QEMUFile *f, void *opaque, size_t =
size, VMStateField *field)
>  }
> =20
>  static int put_psw(QEMUFile *f, void *opaque, size_t size,
> -                   VMStateField *field, QJSON *vmdesc)
> +                   const VMStateField *field, QJSON *vmdesc)
>  {
>      CPUHPPAState *env =3D opaque;
>      qemu_put_betr(f, cpu_hppa_get_psw(env));
> @@ -68,7 +69,8 @@ static const VMStateInfo vmstate_psw =3D {
>  };
> =20
>  /* FIXME: Use the PA2.0 format, which is a superset of the PA1.1 forma=
t.  */
> -static int get_tlb(QEMUFile *f, void *opaque, size_t size, VMStateFiel=
d *field)
> +static int get_tlb(QEMUFile *f, void *opaque, size_t size,
> +                   const VMStateField *field)
>  {
>      hppa_tlb_entry *ent =3D opaque;
>      uint32_t val;
> @@ -94,7 +96,7 @@ static int get_tlb(QEMUFile *f, void *opaque, size_t =
size, VMStateField *field)
>  }
> =20
>  static int put_tlb(QEMUFile *f, void *opaque, size_t size,
> -                   VMStateField *field, QJSON *vmdesc)
> +                   const VMStateField *field, QJSON *vmdesc)
>  {
>      hppa_tlb_entry *ent =3D opaque;
>      uint32_t val =3D 0;
> diff --git a/target/mips/machine.c b/target/mips/machine.c
> index 70a8909b90..704e9c01bf 100644
> --- a/target/mips/machine.c
> +++ b/target/mips/machine.c
> @@ -20,7 +20,8 @@ static int cpu_post_load(void *opaque, int version_id=
)
> =20
>  /* FPU state */
> =20
> -static int get_fpr(QEMUFile *f, void *pv, size_t size, VMStateField *f=
ield)
> +static int get_fpr(QEMUFile *f, void *pv, size_t size,
> +                   const VMStateField *field)
>  {
>      int i;
>      fpr_t *v =3D pv;
> @@ -31,8 +32,8 @@ static int get_fpr(QEMUFile *f, void *pv, size_t size=
, VMStateField *field)
>      return 0;
>  }
> =20
> -static int put_fpr(QEMUFile *f, void *pv, size_t size, VMStateField *f=
ield,
> -                   QJSON *vmdesc)
> +static int put_fpr(QEMUFile *f, void *pv, size_t size,
> +                   const VMStateField *field, QJSON *vmdesc)
>  {
>      int i;
>      fpr_t *v =3D pv;
> @@ -128,7 +129,8 @@ const VMStateDescription vmstate_mvp =3D {
> =20
>  /* TLB state */
> =20
> -static int get_tlb(QEMUFile *f, void *pv, size_t size, VMStateField *f=
ield)
> +static int get_tlb(QEMUFile *f, void *pv, size_t size,
> +                   const VMStateField *field)
>  {
>      r4k_tlb_t *v =3D pv;
>      uint16_t flags;
> @@ -155,8 +157,8 @@ static int get_tlb(QEMUFile *f, void *pv, size_t si=
ze, VMStateField *field)
>      return 0;
>  }
> =20
> -static int put_tlb(QEMUFile *f, void *pv, size_t size, VMStateField *f=
ield,
> -                   QJSON *vmdesc)
> +static int put_tlb(QEMUFile *f, void *pv, size_t size,
> +                   const VMStateField *field, QJSON *vmdesc)
>  {
>      r4k_tlb_t *v =3D pv;
> =20
> diff --git a/target/openrisc/machine.c b/target/openrisc/machine.c
> index 1eedbf3dbe..5d822f7ab1 100644
> --- a/target/openrisc/machine.c
> +++ b/target/openrisc/machine.c
> @@ -49,7 +49,8 @@ static const VMStateDescription vmstate_cpu_tlb =3D {
>      }
>  };
> =20
> -static int get_sr(QEMUFile *f, void *opaque, size_t size, VMStateField=
 *field)
> +static int get_sr(QEMUFile *f, void *opaque, size_t size,
> +                  const VMStateField *field)
>  {
>      CPUOpenRISCState *env =3D opaque;
>      cpu_set_sr(env, qemu_get_be32(f));
> @@ -57,7 +58,7 @@ static int get_sr(QEMUFile *f, void *opaque, size_t s=
ize, VMStateField *field)
>  }
> =20
>  static int put_sr(QEMUFile *f, void *opaque, size_t size,
> -                  VMStateField *field, QJSON *vmdesc)
> +                  const VMStateField *field, QJSON *vmdesc)
>  {
>      CPUOpenRISCState *env =3D opaque;
>      qemu_put_be32(f, cpu_get_sr(env));
> diff --git a/target/ppc/machine.c b/target/ppc/machine.c
> index b2745ec4e5..e7b3725273 100644
> --- a/target/ppc/machine.c
> +++ b/target/ppc/machine.c
> @@ -110,7 +110,8 @@ static int cpu_load_old(QEMUFile *f, void *opaque, =
int version_id)
>      return 0;
>  }
> =20
> -static int get_avr(QEMUFile *f, void *pv, size_t size, VMStateField *f=
ield)
> +static int get_avr(QEMUFile *f, void *pv, size_t size,
> +                   const VMStateField *field)
>  {
>      ppc_avr_t *v =3D pv;
> =20
> @@ -120,8 +121,8 @@ static int get_avr(QEMUFile *f, void *pv, size_t si=
ze, VMStateField *field)
>      return 0;
>  }
> =20
> -static int put_avr(QEMUFile *f, void *pv, size_t size, VMStateField *f=
ield,
> -                   QJSON *vmdesc)
> +static int put_avr(QEMUFile *f, void *pv, size_t size,
> +                   const VMStateField *field, QJSON *vmdesc)
>  {
>      ppc_avr_t *v =3D pv;
> =20
> @@ -452,7 +453,8 @@ static const VMStateDescription vmstate_sr =3D {
>  };
> =20
>  #ifdef TARGET_PPC64
> -static int get_slbe(QEMUFile *f, void *pv, size_t size, VMStateField *=
field)
> +static int get_slbe(QEMUFile *f, void *pv, size_t size,
> +                    const VMStateField *field)
>  {
>      ppc_slb_t *v =3D pv;
> =20
> @@ -462,8 +464,8 @@ static int get_slbe(QEMUFile *f, void *pv, size_t s=
ize, VMStateField *field)
>      return 0;
>  }
> =20
> -static int put_slbe(QEMUFile *f, void *pv, size_t size, VMStateField *=
field,
> -                    QJSON *vmdesc)
> +static int put_slbe(QEMUFile *f, void *pv, size_t size,
> +                    const VMStateField *field, QJSON *vmdesc)
>  {
>      ppc_slb_t *v =3D pv;
> =20
> diff --git a/target/sparc/machine.c b/target/sparc/machine.c
> index 8ff9dea297..7791c84963 100644
> --- a/target/sparc/machine.c
> +++ b/target/sparc/machine.c
> @@ -56,7 +56,8 @@ static const VMStateDescription vmstate_tlb_entry =3D=
 {
>  };
>  #endif
> =20
> -static int get_psr(QEMUFile *f, void *opaque, size_t size, VMStateFiel=
d *field)
> +static int get_psr(QEMUFile *f, void *opaque, size_t size,
> +                   const VMStateField *field)
>  {
>      SPARCCPU *cpu =3D opaque;
>      CPUSPARCState *env =3D &cpu->env;
> @@ -69,8 +70,8 @@ static int get_psr(QEMUFile *f, void *opaque, size_t =
size, VMStateField *field)
>      return 0;
>  }
> =20
> -static int put_psr(QEMUFile *f, void *opaque, size_t size, VMStateFiel=
d *field,
> -                   QJSON *vmdesc)
> +static int put_psr(QEMUFile *f, void *opaque, size_t size,
> +                   const VMStateField *field, QJSON *vmdesc)
>  {
>      SPARCCPU *cpu =3D opaque;
>      CPUSPARCState *env =3D &cpu->env;
>=20

Queued, thanks.

Paolo
