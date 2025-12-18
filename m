Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D41D6D22E
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Dec 2025 15:13:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vWFge-0003yJ-NP; Thu, 18 Dec 2025 10:13:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vWFgd-0003xk-9j
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 10:13:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vWFgb-00005j-Hf
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 10:13:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1766070781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VBKgpQWZHs8lJTk2T5fT6nKl/dnez8JVqP54tztjnZI=;
 b=R7b8gZFfWjt41nQVC2K/5XkK18We2Z5fCw+YjGMPBAO0bSaBr8xj8SyHvjaK58qWDeOExm
 fG+cK7QB+02hrhfV08bMeYv6nCGpSIVMLMYkFFBjR7WoDJtGL8ZyyUwpU586uEsSW2pl3Z
 a3NOD4B0QJj0ENdhfnwp4GiUdxzJToU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-LxYnLBlvP9ywQ4I3D9FNHA-1; Thu, 18 Dec 2025 10:12:57 -0500
X-MC-Unique: LxYnLBlvP9ywQ4I3D9FNHA-1
X-Mimecast-MFC-AGG-ID: LxYnLBlvP9ywQ4I3D9FNHA_1766070776
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-477964c22e0so6066365e9.0
 for <qemu-arm@nongnu.org>; Thu, 18 Dec 2025 07:12:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766070776; x=1766675576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JU0yBhjfPZRL3g4n1uKEh6x3PEVCCoHtJzUO5mlmqTw=;
 b=uvtHk7hcz4a1IVDMywQA8NIh/LCugIKiaRIvtvSv7RXnbMT74/+CjgKDfJ1o7hTmpD
 xOdbc6IYc8TWv9UJ0dVoxjCTM1DwYDuINlzRVy6H+KKxB7jhMnQ9JMOTqw+eQQuSIe9Y
 GN1r99QuF0zBVv35HRW1LrfzgQFtY7Y0E8HLsvtS3nZnINdPZ2moUCrQCwi+D8UXItqA
 7i4AZBnqJER539FXypPc9ajkOkqbX/xmlqALOzmZMyFqCse0g5du7Lzz+zVteuAXazCP
 Pr+DnpYsPI5wIHoeH9G+Enfuzf/kdzFhiAW1Co4m//3hiVbMb9kEXqnjQnAwUqZq8wRs
 ABBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6uh5dL/m1EQulT03SXi2guPbkZJBBHbZ61RMmKE2N7wSPxvg8kxZGRk0KjTAS55jIADqMTuVC1Q==@nongnu.org
X-Gm-Message-State: AOJu0YxQOG1SyGTYxNpB1/IPMT7MD73309mBNCbnUQDTeFPVJXQyyFom
 qn2nKy/M5SE6q9JXqHEieSTVF1ytXEFYUhpe5so+A4kf2mXr/ZdhpyJhS8re/YTVrGVcDLBfehh
 6NGDZe2rvxZxENnfye4f3rZ9zrLs0dzwV9pk9Jx2JXrtCcIvrgPYRig==
X-Gm-Gg: AY/fxX5F6f3J3DXlPtWsdm9LjNRokzP5ta34et6iCewGMnr44dtCTiD0/H4PyPXmG7U
 1Of8TOfnWQj1ion/sF2bInQbB41trnehfDRr631gdYIKJg2xXh3hSY3vgSYbG+peJupd0Uh4HHI
 bRY+6C9HU0lD6u/nYZkpttuaP0aJiXGBVrJsAqTjjrab8BGfNGBpx9hLGsbuihIRv9dx7PDVPDn
 fX3cH6kAajUqBCZEjLov6HYGouoMy44KxWo2Xa2bqoOHE3vC9Dee3TyXCHss2iypBg1jm/0LXuY
 t+mFi4AuUj79yVK7OWpByIwh+tHTxJPqy8Oyp0AlRhU0p4rZYKyqDMyFg9/+S8sZeLZpEA==
X-Received: by 2002:a05:600c:4695:b0:47b:e417:9056 with SMTP id
 5b1f17b1804b1-47be41791b6mr26934165e9.10.1766070776274; 
 Thu, 18 Dec 2025 07:12:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESloWnPFLLwuzbJocWYliz+xo+3vp7nj6GLpeBMnKS4yh4sbWeZtNaIM14JVMTg5+JUYxJmQ==
X-Received: by 2002:a05:600c:4695:b0:47b:e417:9056 with SMTP id
 5b1f17b1804b1-47be41791b6mr26933785e9.10.1766070775841; 
 Thu, 18 Dec 2025 07:12:55 -0800 (PST)
Received: from imammedo ([213.175.46.86]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be274e407sm47727775e9.8.2025.12.18.07.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 07:12:55 -0800 (PST)
Date: Thu, 18 Dec 2025 16:12:53 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Li Chen <me@linux.beauty>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, "Peter Maydell"
 <peter.maydell@linaro.org>, "Shannon Zhao" <shannon.zhaosl@gmail.com>, "Ani
 Sinha" <anisinha@redhat.com>, "Eduardo Habkost" <eduardo@habkost.net>,
 "Marcel Apfelbaum" <marcel.apfelbaum@gmail.com>, "Philippe =?UTF-8?B?TWF0?=
 =?UTF-8?B?aGlldS1EYXVkw6k=?=" <philmd@linaro.org>, "Yanan Wang"
 <wangyanan55@huawei.com>, "Zhao Liu" <zhao1.liu@intel.com>, "Song Gao"
 <gaosong@loongson.cn>, "Jiaxun Yang" <jiaxun.yang@flygoat.com>, "Sunil V L"
 <sunilvl@ventanamicro.com>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Alistair Francis" <alistair.francis@wdc.com>, "Weiwei Li"
 <liwei1518@gmail.com>, "qemu-arm" <qemu-arm@nongnu.org>, "qemu-devel"
 <qemu-devel@nongnu.org>, "qemu-riscv" <qemu-riscv@nongnu.org>
Subject: Re: [PATCH v6] acpi/virt: suppress UART device & SPCR when guest
 has no serial hardware
Message-ID: <20251218161253.7f13038f@imammedo>
In-Reply-To: <19b104a617e.133b3feb891309.6986511857690603518@linux.beauty>
References: <20251211102025.873506-1-me@linux.beauty>
 <20251211080811-mutt-send-email-mst@kernel.org>
 <19b104a617e.133b3feb891309.6986511857690603518@linux.beauty>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QNVfP2Pm84hrq3IwI9kQfyQ-2cXLLViWJOTl7g6Omnw_1766070776
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 12 Dec 2025 10:01:08 +0800
Li Chen <me@linux.beauty> wrote:

> Hi Michael,
>=20
>  ---- On Thu, 11 Dec 2025 21:10:18 +0800  Michael S. Tsirkin <mst@redhat.=
com> wrote ---=20
>  > On Thu, Dec 11, 2025 at 06:20:25PM +0800, Li Chen wrote: =20
>  > > From: Li Chen <chenl311@chinatelecom.cn>
>  > >=20
>  > > virt machines always instantiate a PL011/16550 UART at slot 0 and de=
scribe
>  > > it in ACPI (DSDT and optional SPCR table). When the command line dis=
ables
>  > > the serial backend (e.g. "-serial none"), the guest still sees the U=
ART as
>  > > a preferred console even though it is not usable.
>  > >=20
>  > > Teach the virt ACPI code to omit the UART device and SPCR when there=
 is no
>  > > serial backend attached. This matches the hardware that the guest ca=
n
>  > > actually use and avoids confusing firmware or OS code that relies on=
 SPCR.
>  > >=20
>  > > The bios-tables-test qtests rely on an ACPI UART node and SPCR entry=
 for
>  > > UEFI-based virt machines. To keep those tests working we create a UA=
RT
>  > > with a "null" chardev backend instead. This preserves the ACPI table=
s
>  > > while discarding the firmware's serial output so it does not corrupt=
 the
>  > > TAP stdout stream.
>  > >=20
>  > > Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>  > > Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
>  > > Reviewed-by: Sunil V L <sunilvl@ventanamicro.com> =20
>  >=20
>  > This bothers me:
>  > won't this mean number of serial devices changes silently?  So for
>  > example, if you install a guest, see that 1st serial device is broken,
>  > configure it with 2nd one as a work around, now with your change there
>  > is no second one so guest will be broken?
>  >=20
>  >=20
>  > I seems safer to have compat machinery around and avoid
>  > changing this for old machine types. =20
> =20
> Thanks for pointing this out, you=E2=80=99re right that changing the numb=
er of serial=20
> devices that the guest sees is risky for existing machine types.
>=20
> For v7 I=E2=80=99m planning to take a more conservative approach and only=
 gate SPCR
> on the presence of a backend for the primary UART, while  keeping the ACP=
I
> UART devices in DSDT unchanged.=20
> Concretely:
> - virt ACPI DSDT will continue to unconditionally describe the UART(s) as=
 before,
>    so the guest-visible UART topology doesn=E2=80=99t change for existing=
 virt-* machines.
> - We only call spcr_setup() when there is a backend attached to UART0 (e.=
g. serial_hd(0) !=3D NULL),
>   so SPCR doesn=E2=80=99t point at a completely unusable console when the=
 user passes -serial none.
>=20
> In particular, for a command line like -serial none -serial pty, this mea=
ns SPCR would not be present
> (rather than silently switching it to UART1/pty). My reasoning is that, f=
or existing virt machines,
> SPCR is meant to describe =E2=80=9Cthe board=E2=80=99s primary console (U=
ART0)=E2=80=9D, not =E2=80=9Cthe first UART that happens
> to have a host backend=E2=80=9D, and changing that interpretation feels l=
ike it would need compat machinery
> and a new machine type.
>=20
> The qtests already force -serial null for the UEFI-based virt tests, so t=
hey will still exercise the SPCR path.
>=20
> Would this behaviour be acceptable for you, or would you prefer that I go=
 further and also add a compat
> flag/new machine type where SPCR can follow =E2=80=9Cthe first UART with =
a backend=E2=80=9D while old virt-* machines
> keep the current UART/SPCR semantics?


all described above looks complicated.
In ACPI tables we usually try to avoid compat settings, and do them only if=
 we have to.

So question is how guest enumerates serial ports when
   '-nodefaults' is used _and_ there is a second serial port configured (is=
 it even possible?)
check it with and without you patch please, to see what difference the patc=
h makes.

>=20
> Regards,
> Li=E2=80=8B
>=20


