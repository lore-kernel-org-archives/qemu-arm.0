Received: by 2002:a05:7022:f201:b0:7e:eb73:5b3b with SMTP id rf1csp1632435dlb;
        Thu, 20 Jun 2024 06:54:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXENp+6N24iMi+Bo1/VIiMrzPUV3cXANGBbVMWQLMHH+4dqB2TXCZQvChiFSaUezNf02ypcRUvMj1c2cdvwjP+YKcSZeGRi
X-Google-Smtp-Source: AGHT+IEaskTWy+0SK9qeNMzQ14wnquW7WeBK4uA/SjVcGnBSGeu0ifzGlq/IPsv/DTdklyHta2dE
X-Received: by 2002:a05:6870:b50d:b0:24c:625a:bc60 with SMTP id 586e51a60fabf-25c94d059ecmr5891835fac.42.1718891665981;
        Thu, 20 Jun 2024 06:54:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718891665; cv=none;
        d=google.com; s=arc-20160816;
        b=hLabO7waNR627as9mei/iyPjxKGi78uOKE01oJYUrLHdjBxKJRvnkMgMJZlrdH03/Z
         j45yw38ArBRq1lWKYw/dp5orbXevX4FJiaNBT/BRfxMgKELoDw26izuU/FjSZaK/zPoK
         LntSZTIlsk31qqTfcjquiyE0vkwr5WgzqSA2ALIVywe6WPHP5r1ZxtucEbxAEIrpre6o
         PrCEday65TRNN4e59/m7zyySOEowZd+E0VF2LrmxJwuaWUJsCjcKn7YskYFoUgpd+fAR
         MwhZ2UOt/6pBhMns4ot4YvY6LtQdPht3MYZsrVm3+JTlpxP49KNTtZi68zl0gxoRzEAB
         e2Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=40MKXG1WeTJRQNaKNtKVcRPVq4uGtRuIaZqzx8AGpJ8=;
        fh=cNT7+hibXyCJsxuSbXor8mYfhnMtQQ9DIMp5MjDqOwc=;
        b=WzqdOWzSTz5Uaa88g+jdVv2WIu9b9o135A+jgb6HjTOlbSORD/AHTj1Cs5rAIbKDAB
         gTRYnXNPs0JD56bRjbASTwPU1dAIgewSxbeoo4AJOuSRVOD5BCQHOY2Mcaeke1caFlTP
         rntSKkWx9IJjArh/nHZz2ol0OWO/KUi3KL/MNjKHbf2YKMYbkspHuloOSSstEBR7hapz
         tYGQWFeJbLBIe4K/APaPDQCHNsAgt6kHj5wo2YVI7hpFDP03QBlwr3Y+hQiP0Av3FAmU
         dir0OEuqqFSQ6Frk7xXEEnFfk0LynS3+QmkTitxMcxtl9Nv/aKF3MtOoDqXltPvo52N3
         L9bA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H2UzqYob;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79ba9d2de71si686113685a.407.2024.06.20.06.54.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2024 06:54:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H2UzqYob;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKIEL-00046C-Gk; Thu, 20 Jun 2024 09:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sKIEK-00045e-KV
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 09:53:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sKIEH-0008GD-Qm
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 09:53:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718891612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=40MKXG1WeTJRQNaKNtKVcRPVq4uGtRuIaZqzx8AGpJ8=;
 b=H2UzqYobDv+uapYDq3DfW5FDyAw/c7xeHqTiuAHOY1hnggqJBmFQ0DTpc+3ZQDp3akLS5P
 3lfAJB14i/+8Ue6ypTyqtSgR9UsPzzhmmkjnCjAIa5Rd2FoulMhF8rch/kPglu+h2/8hwJ
 mgMJXnQUaRpjRht8iTZ+lKYG1ZlhdKM=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-Pjyi18-BOe6gfewM7DnNuA-1; Thu, 20 Jun 2024 09:53:31 -0400
X-MC-Unique: Pjyi18-BOe6gfewM7DnNuA-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-62f46f56353so15220177b3.3
 for <qemu-arm@nongnu.org>; Thu, 20 Jun 2024 06:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718891610; x=1719496410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ELadgWAZEaqWW9tZAl/glDSzS0OKSd1Zx7ZGWRCWr3Q=;
 b=sYlsv1GM09B7rl/p3k2bpHFCbr/S7xGdJA1rgLiANtipKJ4tvqTt0fFSUZRvHB4d+6
 TAK0qMYX33byYM6Bpp5EXnHdldn0aM/Tj6X42sBtIMr/7d+vsPbS7Kcf480cFR38kNYo
 3F3XEw1XILjQvb5wDBWUWvvG3vqFsC/o+Ii7bW6Z3CEeokjqqEvoJ6gFNqv9nX+2l3kW
 O5gdaTZI7U7gwPEWDDwZsR+t1CuWCDiEqyuVrRIb+wTgec7O1HMhMnkkRl8W7/lwAJAu
 Vkkc9tj7UgtqON0PAc6O2t/Cyc3rsNUsaKfqmDPP5uB4J2GOQTcJ0wlZRvOT3ibW6oZU
 Ih2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU27ahVsoAuH9tD/hWAL5EODKIKW5kyUc6AoSWFeyczILWUm4cuqxadSuGf+b0zdCPq6EAgqzjWwFHMryUSX7tfX/bh
X-Gm-Message-State: AOJu0Yzj2vbqaJwDTas/HiBJhcIvc9BnJpDBDSUXKolcRI76Hued0rW/
 P9CdhCPvTkELovekjDfxwTyVozle2W0qcO6/Un4CX5KhKlXvbwCBZuuIeugLtj0cWo5jIEKtv9E
 U+90n8IX+Le//WxStffeNqnH2TTA9fU7CzsQNX/sOLTVj1fRD7A==
X-Received: by 2002:a0d:ead5:0:b0:62d:1139:779 with SMTP id
 00721157ae682-63a8d924c86mr49521127b3.19.1718891610541; 
 Thu, 20 Jun 2024 06:53:30 -0700 (PDT)
X-Received: by 2002:a0d:ead5:0:b0:62d:1139:779 with SMTP id
 00721157ae682-63a8d924c86mr49520827b3.19.1718891610167; 
 Thu, 20 Jun 2024 06:53:30 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b4ff61db92sm23720096d6.30.2024.06.20.06.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 06:53:29 -0700 (PDT)
Date: Thu, 20 Jun 2024 15:53:24 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1E?=
 =?UTF-8?B?YXVkw6k=?= <philmd@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Alistair Francis <alistair23@gmail.com>, Sia Jee Heng
 <jeeheng.sia@starfivetech.com>, Haibo1 Xu <haibo1.xu@intel.com>, Anup Patel
 <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, Daniel
 Henrique Barboza <dbarboza@ventanamicro.com>, Peter Maydell
 <peter.maydell@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng
 <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v2 06/12] tests/data/acpi/virt: Move ACPI tables under
 aarch64
Message-ID: <20240620155324.1d7157f9@imammedo.users.ipa.redhat.com>
In-Reply-To: <ZnMcw2E83Voo1HBT@sunil-laptop>
References: <20240524061411.341599-1-sunilvl@ventanamicro.com>
 <20240524061411.341599-7-sunilvl@ventanamicro.com>
 <27cef750-262a-402a-97fe-c4a55700a376@linaro.org>
 <ZlSjzfSj8MwDcJk6@sunil-laptop>
 <20240619111743.58930119@imammedo.users.ipa.redhat.com>
 <20240619052043-mutt-send-email-mst@kernel.org>
 <ZnMcw2E83Voo1HBT@sunil-laptop>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.152,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jbiITmaHqEHn

On Wed, 19 Jun 2024 23:30:35 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> On Wed, Jun 19, 2024 at 05:20:50AM -0400, Michael S. Tsirkin wrote:
> > On Wed, Jun 19, 2024 at 11:17:43AM +0200, Igor Mammedov wrote: =20
> > > On Mon, 27 May 2024 20:46:29 +0530
> > > Sunil V L <sunilvl@ventanamicro.com> wrote:
> > >  =20
> > > > On Mon, May 27, 2024 at 12:12:10PM +0200, Philippe Mathieu-Daud=C3=
=A9 wrote: =20
> > > > > Hi Sunil,
> > > > >=20
> > > > > On 24/5/24 08:14, Sunil V L wrote:   =20
> > > > > > Since virt is a common machine name across architectures like A=
RM64 and
> > > > > > RISC-V, move existing ARM64 ACPI tables under aarch64 folder so=
 that
> > > > > > RISC-V tables can be added under riscv64 folder in future.
> > > > > >=20
> > > > > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > > ---
> > > > > >   tests/data/acpi/virt/{ =3D> aarch64}/APIC             | Bin  =
 =20
> > > > >=20
> > > > > The usual pattern is {target}/{machine}, so instead of:
> > > > >=20
> > > > >   microvm/
> > > > >   pc/
> > > > >   q35/
> > > > >   virt/aarch64/
> > > > >   virt/riscv64/
> > > > >=20
> > > > > (which is odd because q35 is the x86 'virt'), I'd rather see:
> > > > >=20
> > > > >   x86/microvm/
> > > > >   x86/pc/
> > > > >   x86/q35/
> > > > >   aarch64/virt/
> > > > >   riscv64/virt/
> > > > >=20
> > > > > Anyhow just my 2 cents, up to the ACPI maintainers :)
> > > > >    =20
> > > > Hi Phil,
> > > >=20
> > > > Your suggestion does make sense to me. Let me wait for feedback fro=
m
> > > > ARM/ACPI maintainers. =20
> > >=20
> > > I'd prefer  {target}/{machine} hierarchy like Philippe suggests =20
> >=20
> > Agreed.
> >  =20
> Thanks for the confirmation!. Let me send the updated version soon.
>=20
> Moving pc/q35/microvm also under new x86 would need many changes in
> bios-table-test.c. So, the question is, are you ok to combine x86
> changes as well in this series or prefer to it later in separate series?

it should be fine ok to include x86 changes here as well.

I'd basically split previous patch on path altering part and a 2nd adding
 .arch =3D "aarch64"

then 3rd doing the same for x86

as for this patch, I'd include all blobs movement here.

>=20
> Thanks,
> Sunil
>=20

