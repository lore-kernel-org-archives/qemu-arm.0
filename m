Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp417583njb;
        Tue, 13 May 2025 03:29:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXK9jjqvvL6cvYHBnVQdCu1ZuBApZXLR0R0yjelcOpYTclKtoSUaA9fnxpdVQFCpxvRhR23PkNnvoaEXw==@linaro.org
X-Google-Smtp-Source: AGHT+IHCA0TTjW0/s5Ts3LULduqaOTHzEDj7SxNzqyIas5Tu2S41bHldqfXLmgFCBONFWDMNoFXO
X-Received: by 2002:a05:6214:234e:b0:6ed:df6:cdcd with SMTP id 6a1803df08f44-6f6e47eabbcmr271859106d6.21.1747132171140;
        Tue, 13 May 2025 03:29:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747132171; cv=none;
        d=google.com; s=arc-20240605;
        b=M4g2SQmDR7a6mI8y0RclwIfwIBnnZ+BnZid2BE5j2W2FD96OGWCALk2KtMaye1iwBc
         BXYacVzx8aX9nXOTLPCGB3jg2K/g1jzKx9dyvJsRYwYTRKPh6Itj7BsxYZ3nuQqpfO7l
         GgNyuk/J+hsV5uyq3O/RSQ4OukkOFVp7F9FZEY2OEWeBPp2Kwu0F1ArQALb/Jqgw57an
         2QqKElKr3Z5S4gn2DqA+sIBr3n0fD15XY0H+rOTgqYDvJI/tfo7pJbwHMZQA02GeJO1y
         xXJdNzKtVRVJJXxqdB1MUW6HjaR7agJzv8fLGwL16Mvhx2lQBUyAZutaXVJXL1jIwwNi
         tyqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=2Q9Purpm/K4u0zXRViMrb/8QUlPpX+E7LaiOih2O93w=;
        fh=txJqvR2mWtT1WMi6tSAdPP5EZQghzOebX83Tm1ke9ww=;
        b=e/WN/3WE/AE1iKBsskGoH410p0kW98rSw/ucMTzr6ebH4Pz+vuZG6JWnlCgV2H9Z47
         ouLJ1eYWY4aT9vUPH9W6uz9R972cNifWlezjuyHrcoZcLmLZeNXAIEIet0EgBIxUwPan
         d7fv41PFnOrUbK8jA6K60JcKNYB0whzj8a/e5/UpIzjvWkYUK1L8vUcToDjQGOYXnYgc
         Rj7cm7gohGTztC5pFAEQU9kgV/ffw55u9DCb2hT5Gc/gzY6LCWHBaYPV0D3jX9VR5KS9
         OoVkdHUocmkheDMraDxK2SbgukBFA/pJZbtiNizDzJYiApnkj+1WFQB+bJ1/kqR/Iry4
         HqYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vs5mIYB2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e3a427c8si109058386d6.214.2025.05.13.03.29.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 03:29:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vs5mIYB2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEmsn-0004Lo-Fx; Tue, 13 May 2025 06:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uEmsk-0004Fz-Ds
 for qemu-arm@nongnu.org; Tue, 13 May 2025 06:29:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uEmsi-0001YW-Hv
 for qemu-arm@nongnu.org; Tue, 13 May 2025 06:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747132143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Q9Purpm/K4u0zXRViMrb/8QUlPpX+E7LaiOih2O93w=;
 b=Vs5mIYB2CgJNx6O1BJ2jzcgYhiowKIqRmF9vPlUnOvl4krcJr5PI8LIt2K4pxPs4RobGif
 H4o19ALZ25qCb7nR2NjLgEZ8sQeDz9xDS136yaR+4Q4D054QbFe/x1vfQY4gCQcJJoeMrv
 oj1KMSN+5A39jJCNXxCAfOmf93mG0Ts=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-CYmtTNtyOXO9En4VA1KrYg-1; Tue, 13 May 2025 06:29:02 -0400
X-MC-Unique: CYmtTNtyOXO9En4VA1KrYg-1
X-Mimecast-MFC-AGG-ID: CYmtTNtyOXO9En4VA1KrYg_1747132142
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43cf3168b87so23976865e9.2
 for <qemu-arm@nongnu.org>; Tue, 13 May 2025 03:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747132141; x=1747736941;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2Q9Purpm/K4u0zXRViMrb/8QUlPpX+E7LaiOih2O93w=;
 b=n85eVI1sSY0Rt19u7YWweQ4wxjvJFklpMR644vocrFcO6TTIm2qfUet56vO5lh33RA
 Irnwx8QNULxui9bPiXQ/EAJJFB6ESeYAq3JRgv7nLm2EGnGPFS3m42RpFdzebtoQKgQc
 zfZBTZKqkujBApkcVniJTBPoCBFXBELngtm65l67cRT6lrAmWZrmOVVPLF3YoM5qZCT6
 s40yroJm5AnBsawZxc3oB6A3QABEnFm8CNAOtrrz1GTpEomO7o+Q3ShNpiwnAYJmsHFo
 Piq77k8ZfUreM2AnrtL/EyPMSuptME0I+2XgDkc6PwvhBg3z6zF/EO/Umigk8l3FvzY3
 YRtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnFHO+VbucIvEC/RemcGeuYB2MpDq4ClnIk/HoLdXRRsWdcmSLcXDZzEU0/6C5FITUGrape3rg9Q==@nongnu.org
X-Gm-Message-State: AOJu0YzkYlsHcsebYgroApKRv/3xMnRrDdhXPtdAaJ/GaNt/OK+U5BDw
 qB1nVvPSDzvD+dnmhSam8bTN2cAd9Yscktd5J8qyGzDt2x6NRyWMdMrvsaxg2vZHiyukAOcoZH4
 9oJkWPiFn8htz704F3hiVljkwap8dnyuXhhJ/5aKqB3J4XnHJjg==
X-Gm-Gg: ASbGnctDvgNaencEz8Cd9PNDq/8o2RVoH5IcHZlakcmQjKYuj5bhlMH+IV2nGeYVXyh
 P7v+SDUGMO54i2ObWryYnX9Vmftj7EoOXOon+11D3tH4fIl1fk6K+4fBy7KuIwZnXI2sYn/wwNq
 mHmrnz7JylT+B4Z5v+PuX1A9VBSZe/9cSWVazP5F++gaVDQy9lHrFsWZZDmYGphQS5iY7UK0ByU
 Ap+gJMeeg2sBqzWm+0S6BozaCYwBkDUEwCajIAY4QJ/85oyRTk5yQjb9b/sgve6mplLn4NVQFht
 RmP2HD4WCrtj0np6JBDRFdOHZSFkN3P6
X-Received: by 2002:a05:600c:a089:b0:43c:e9d0:9ee5 with SMTP id
 5b1f17b1804b1-442d6d6ad82mr144907085e9.18.1747132141547; 
 Tue, 13 May 2025 03:29:01 -0700 (PDT)
X-Received: by 2002:a05:600c:a089:b0:43c:e9d0:9ee5 with SMTP id
 5b1f17b1804b1-442d6d6ad82mr144906565e9.18.1747132141134; 
 Tue, 13 May 2025 03:29:01 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd34bde2sm201853865e9.19.2025.05.13.03.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 03:29:00 -0700 (PDT)
Date: Tue, 13 May 2025 12:28:58 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 kvm@vger.kernel.org, Sergio Lopez <slp@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Laurent
 Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Yi Liu
 <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-riscv@nongnu.org, Weiwei Li
 <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>, Zhao Liu
 <zhao1.liu@intel.com>, Yanan Wang <wangyanan55@huawei.com>, Helge Deller
 <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>, Ani Sinha
 <anisinha@redhat.com>, Fabiano Rosas <farosas@suse.de>, Paolo Bonzini
 <pbonzini@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?B?Q2zDqW1lbnQ=?= Mathieu--Drif <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, Jason
 Wang <jasowang@redhat.com>, Mark Cave-Ayland <mark.caveayland@nutanix.com>
Subject: Re: [PATCH v4 24/27] hw/intc/ioapic: Remove
 IOAPICCommonState::version field
Message-ID: <20250513122858.2a596bd9@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250508133550.81391-25-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-25-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GSlS2U7XdI4Hg5qbPSwYHmKcvNY2-m9Hc9KYaSkmCPo_1747132142
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.551,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: faz9QHUFJieU

On Thu,  8 May 2025 15:35:47 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> The IOAPICCommonState::version integer was only set
> in the hw_compat_2_7[] array, via the 'version=3D0x11'
> property. We removed all machines using that array,
> lets remove that property, simplify by only using the
> default version (defined as IOAPIC_VER_DEF).
>=20
> For the record, this field was introduced in commit
> 20fd4b7b6d9 ("x86: ioapic: add support for explicit EOI"):
>=20
>  >   Some old Linux kernels (upstream before v4.0), or any released RHEL
>  >   kernels has problem in sending APIC EOI when IR is enabled.
>  >   Meanwhile, many of them only support explicit EOI for IOAPIC, which
>  >   is only introduced in IOAPIC version 0x20. This patch provide a way
>  >   to boost QEMU IOAPIC to version 0x20, in order for QEMU to correctly
>  >   receive EOI messages.
>  >
>  >   Without boosting IOAPIC version to 0x20, kernels before commit
>  >   d32932d ("x86/irq: Convert IOAPIC to use hierarchical irqdomain
>  >   interfaces") will have trouble enabling both IR and level-triggered
>  >   interrupt devices (like e1000).
>  >
>  >   To upgrade IOAPIC to version 0x20, we need to specify:
>  >
>  >     -global ioapic.version=3D0x20
>  >

that crutch might be in-use by external users, and even if they use
0x20, removing property will break CLI.

I'd deprecate it first and then remove.

>  >   To be compatible with old systems, 0x11 will still be the default
>  >   IOAPIC version. Here 0x11 and 0x20 are the only versions to be
>  >   supported.
looking at the code removed, default is 0x20 which doesn't match above
statement. Have something changed between then and now (missing ref to
0x20 becoming default)?

>  >
>  >   One thing to mention: this patch only applies to emulated IOAPIC. It
>  >   does not affect kernel IOAPIC behavior. =20
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>  hw/intc/ioapic_internal.h |  3 +--
>  hw/intc/ioapic.c          | 18 ++----------------
>  hw/intc/ioapic_common.c   |  2 +-
>  3 files changed, 4 insertions(+), 19 deletions(-)
>=20
> diff --git a/hw/intc/ioapic_internal.h b/hw/intc/ioapic_internal.h
> index 51205767f44..330ce195222 100644
> --- a/hw/intc/ioapic_internal.h
> +++ b/hw/intc/ioapic_internal.h
> @@ -82,7 +82,7 @@
>  #define IOAPIC_ID_MASK                  0xf
> =20
>  #define IOAPIC_VER_ENTRIES_SHIFT        16
> -
> +#define IOAPIC_VER_DEF                  0x20
> =20
>  #define TYPE_IOAPIC_COMMON "ioapic-common"
>  OBJECT_DECLARE_TYPE(IOAPICCommonState, IOAPICCommonClass, IOAPIC_COMMON)
> @@ -104,7 +104,6 @@ struct IOAPICCommonState {
>      uint32_t irr;
>      uint64_t ioredtbl[IOAPIC_NUM_PINS];
>      Notifier machine_done;
> -    uint8_t version;
>      uint64_t irq_count[IOAPIC_NUM_PINS];
>      int irq_level[IOAPIC_NUM_PINS];
>      int irq_eoi[IOAPIC_NUM_PINS];
> diff --git a/hw/intc/ioapic.c b/hw/intc/ioapic.c
> index 133bef852d1..5cc97767d9d 100644
> --- a/hw/intc/ioapic.c
> +++ b/hw/intc/ioapic.c
> @@ -315,7 +315,7 @@ ioapic_mem_read(void *opaque, hwaddr addr, unsigned i=
nt size)
>              val =3D s->id << IOAPIC_ID_SHIFT;
>              break;
>          case IOAPIC_REG_VER:
> -            val =3D s->version |
> +            val =3D IOAPIC_VER_DEF |
>                  ((IOAPIC_NUM_PINS - 1) << IOAPIC_VER_ENTRIES_SHIFT);
>              break;
>          default:
> @@ -411,8 +411,7 @@ ioapic_mem_write(void *opaque, hwaddr addr, uint64_t =
val,
>          }
>          break;
>      case IOAPIC_EOI:
> -        /* Explicit EOI is only supported for IOAPIC version 0x20 */
> -        if (size !=3D 4 || s->version !=3D 0x20) {
> +        if (size !=3D 4) {
>              break;
>          }
>          ioapic_eoi_broadcast(val);
> @@ -444,18 +443,10 @@ static void ioapic_machine_done_notify(Notifier *no=
tifier, void *data)
>  #endif
>  }
> =20
> -#define IOAPIC_VER_DEF 0x20
> -
>  static void ioapic_realize(DeviceState *dev, Error **errp)
>  {
>      IOAPICCommonState *s =3D IOAPIC_COMMON(dev);
> =20
> -    if (s->version !=3D 0x11 && s->version !=3D 0x20) {
> -        error_setg(errp, "IOAPIC only supports version 0x11 or 0x20 "
> -                   "(default: 0x%x).", IOAPIC_VER_DEF);
> -        return;
> -    }
> -
>      memory_region_init_io(&s->io_memory, OBJECT(s), &ioapic_io_ops, s,
>                            "ioapic", 0x1000);
> =20
> @@ -476,10 +467,6 @@ static void ioapic_unrealize(DeviceState *dev)
>      timer_free(s->delayed_ioapic_service_timer);
>  }
> =20
> -static const Property ioapic_properties[] =3D {
> -    DEFINE_PROP_UINT8("version", IOAPICCommonState, version, IOAPIC_VER_=
DEF),
> -};
> -
>  static void ioapic_class_init(ObjectClass *klass, const void *data)
>  {
>      IOAPICCommonClass *k =3D IOAPIC_COMMON_CLASS(klass);
> @@ -493,7 +480,6 @@ static void ioapic_class_init(ObjectClass *klass, con=
st void *data)
>       */
>      k->post_load =3D ioapic_update_kvm_routes;
>      device_class_set_legacy_reset(dc, ioapic_reset_common);
> -    device_class_set_props(dc, ioapic_properties);
>  }
> =20
>  static const TypeInfo ioapic_info =3D {
> diff --git a/hw/intc/ioapic_common.c b/hw/intc/ioapic_common.c
> index fce3486e519..8b3e2ba9384 100644
> --- a/hw/intc/ioapic_common.c
> +++ b/hw/intc/ioapic_common.c
> @@ -83,7 +83,7 @@ static void ioapic_print_redtbl(GString *buf, IOAPICCom=
monState *s)
>      int i;
> =20
>      g_string_append_printf(buf, "ioapic0: ver=3D0x%x id=3D0x%02x sel=3D0=
x%02x",
> -                           s->version, s->id, s->ioregsel);
> +                           IOAPIC_VER_DEF, s->id, s->ioregsel);
>      if (s->ioregsel) {
>          g_string_append_printf(buf, " (redir[%u])\n",
>                                 (s->ioregsel - IOAPIC_REG_REDTBL_BASE) >>=
 1);

