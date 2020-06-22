Received: by 2002:a0c:fe87:0:0:0:0:0 with SMTP id d7csp2043840qvs;
        Mon, 22 Jun 2020 05:18:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyn9Q/hdJWTu3Ca4PjoLLyZ2qhaSU10v+HC0O/Vuh8nHXn2bD02w6nz8QyGNUyu+duKA0dM
X-Received: by 2002:a5b:c82:: with SMTP id i2mr25638773ybq.340.1592828306158;
        Mon, 22 Jun 2020 05:18:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592828306; cv=none;
        d=google.com; s=arc-20160816;
        b=sBm0bWa2AjDlFl6HzZuFdRxfN+YVBwg4qWnR3evKKe5CDajRXecdE2gnzFyg7ZTEP6
         t82JAyPidYwnqu9SJR477UG3XaIYWdt8NZzPjkpWHBeOcyIWAFCVfMPJ/1t5cBEbS6ws
         tU1UlpGpKHwk7UC7oDVb9H01hs4ksacUiTQujefwFlCIRuvouzg+7+vSA5U+0ar8AYbi
         jYyN40slhhNY3nHPDhWcQqLj/Az3xEOqpUQ3OloOuKtdZbp3ks+OZ9YC6vK/CQqS8LXI
         /RFccIWcjpm/PfxLKoPiJdWy+t97vfKv0Q+jL8GLplAxfbRGb1CKWmHHxCss9OJKYCx5
         qGTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=CMLboNu1qxqZPPO8HVB4OJvxdDg36/k2iGV/iQP/PZs=;
        b=JFOWXakJXdL7C3go4IJsCxShCloB1C3HhlAXKDaIv/5LzhsxjreqGqBmv9MNHwoYyd
         FKwM9yMKIJfTj1bHo1TRycxv3pKw64aKe43kIKY5XpHkQDWISMARLu7tlCPalfUVYCPm
         BiEAXPUWebZukntVrnWXpG6c8AGu2THjDM+5GhJr3YkAvULidtVa3oCKByNcei7BuTc/
         VkfgxdPCza1htY8waTlwPQzvxGf4xrcleAzlWzsNLlJej6nIvo1Iqc0H4engSxkZO90Q
         86ryqlRZOgUVRf7VpE5hBeCDDnCKalihGAaKnieKmymPmq3HjSN0C5Rl1j5MYjymgT29
         87ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="US8QS/IL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x138si13412396ybg.413.2020.06.22.05.18.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jun 2020 05:18:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="US8QS/IL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnLP7-0004Xo-Kg
	for alex.bennee@linaro.org; Mon, 22 Jun 2020 08:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jnLLa-0001Tj-29
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 08:14:46 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55749
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jnLLY-0007PG-9P
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 08:14:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592828083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CMLboNu1qxqZPPO8HVB4OJvxdDg36/k2iGV/iQP/PZs=;
 b=US8QS/ILSqIkQMzCvTMQCgVo6bUDAL7LxNzkwOaq00+KmXZDT/unL4cet0ltDWXZG6y58x
 X/wBGA8b7SaHZlot+9jOi4nyer0PyynkCQReKCXWC/AVYLdc23j0ATmQX9bOLtpiB4CpQM
 66LBvQ5r0/U6FnP1VnfFWHrUmZvCB68=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-AbU0wt0xMVeCE4069InVug-1; Mon, 22 Jun 2020 08:14:35 -0400
X-MC-Unique: AbU0wt0xMVeCE4069InVug-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D219107ACF9;
 Mon, 22 Jun 2020 12:14:34 +0000 (UTC)
Received: from localhost (unknown [10.40.208.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A06A01002396;
 Mon, 22 Jun 2020 12:14:16 +0000 (UTC)
Date: Mon, 22 Jun 2020 14:14:12 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v4 1/5] acpi: Convert build_tpm2() to build_append* API
Message-ID: <20200622141412.0e5640f8@redhat.com>
In-Reply-To: <d9d263ba-fc1e-d3af-857b-4d77c190bb73@redhat.com>
References: <20200611135917.18300-1-eric.auger@redhat.com>
 <20200611135917.18300-2-eric.auger@redhat.com>
 <20200616143327.2ee38a48@redhat.com>
 <3c3b466a-c965-e3f6-9bd6-74fce9c424c8@linux.ibm.com>
 <ed1b453d-2568-2134-3e86-c268e82a90f8@redhat.com>
 <ded58c6b-dcea-67ef-4f3c-b8af9f149ae8@redhat.com>
 <44663542-8352-2398-a297-3e1fe7f4bfd5@redhat.com>
 <ce60f439-fd2a-a72b-f004-44a01f4c5bdf@linux.ibm.com>
 <20200622113915.1dce2989@redhat.com>
 <d9d263ba-fc1e-d3af-857b-4d77c190bb73@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 01:27:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, mst@redhat.com,
 Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, marcandre.lureau@redhat.com,
 eric.auger.pro@gmail.com, philmd@redhat.com, ardb@kernel.org,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9REBpxQX5XjX

On Mon, 22 Jun 2020 11:47:26 +0200
Auger Eric <eric.auger@redhat.com> wrote:

> Hi Igor,
>=20
> On 6/22/20 11:39 AM, Igor Mammedov wrote:
> > On Fri, 19 Jun 2020 07:19:51 -0400
> > Stefan Berger <stefanb@linux.ibm.com> wrote:
> >  =20
> >> On 6/19/20 5:43 AM, Auger Eric wrote: =20
> >>> Hi Laszlo,
> >>>
> >>> On 6/19/20 11:38 AM, Laszlo Ersek wrote:   =20
> >>>> On 06/18/20 09:50, Auger Eric wrote:   =20
> >>>>> Hi Stefan, Igor,
> >>>>>
> >>>>> On 6/16/20 4:11 PM, Stefan Berger wrote:   =20
> >>>>>> On 6/16/20 8:33 AM, Igor Mammedov wrote:   =20
> >>>>>>> nevertheless looks like faithfull conversion,
> >>>>>>> btw why you didn't drop Acpi20TPM2 structure definition?
> >>>>>>>   =20
> >>>>>> If we get rid of the table we should keep a reference to this docu=
ment,
> >>>>>> table 7: "TCG ACPI Specification; Family 1.2 and 2.0; Level 00 Rev=
ision
> >>>>>> 00.37, December 19, 2014"
> >>>>>>
> >>>>>> https://trustedcomputinggroup.org/wp-content/uploads/TCG_ACPIGener=
alSpecification_1-10_0-37-Published.pdf
> >>>>>>
> >>>>>>
> >>>>>>   =20
> >>>>> Further looking at this spec, the log_area_minimum_length and
> >>>>> log_area_start_address only are described in
> >>>>> - Table 2 (TCG Hardware InterfaceDescription Table Format for TPM 1=
.2
> >>>>> Clients)
> >>>>> - Table 4 (TCG Hardware Interface Description Table Format for TPM =
1.2
> >>>>> Servers)
> >>>>> but not in Table 7, ie. not for TPM 2.0.
> >>>>>
> >>>>> Are they really needed for TPM2 or what do I miss?   =20
> >>>> (side comment:
> >>>>
> >>>> LASA and LAML are optional with TPM-2.0. From the discussion at
> >>>> <https://bugzilla.tianocore.org/show_bug.cgi?id=3D978>.   =20
> >>
> >>
> >> They are needed for (x86) BIOS, such as SeaBIOS, not for UEFI, though.=
 I=20
> >> do not know about ARM.
> >>
> >> =20
> >>> Thank you for the pointer and info. I failed to find this info in the
> >>> spec. Given the risk of confusion, I would personally keep struct
> >>> Acpi20TPM2 and maybe add a comment. Stefan?   =20
> >>
> >> Either way is fine with me for as long as we know where to find the=20
> >> layout of the structure. =20
> > I'd remove Acpi20TPM2 as it hardly documents anything, and add a commen=
t
> > pointing to the concrete spec that has these fields.
> >=20
> > TCGTCG ACPI SpecificationFamily =E2=80=9C1.2=E2=80=9D and =E2=80=9C2.0=
=E2=80=9DVersion 1.2,Revision 8 =20
>=20
> [PATCH v6 0/3] vTPM/aarch64 ACPI support was posted.
>=20
> As documented in the cover letter (history log), the presence of the
> LAML and LASA fields in the TPM2 table is not clearly documented in the
> spec (at least I failed to find it). It is for TPM 1.2. On the other
> hand, Stefan said it is mandated for some x86 BIOS to work. Given this
> weirdness I think keeping the  Acpi20TPM2 struct is not too bad. See v6 .=
..

Laszlo pointed to spec version where LAML/LASA in TPM2 are documented,
so I'd just use that as a spec this code is based on.

PS:
Acpi20TPM2 struct doesn't document anything, it's just another way to do
the same thing as build_appen_* calls do. Having it just adds to confusion.=
=20

>=20
> Thanks
>=20
> Eric
> >  =20
> >>
> >>  =C2=A0 Stefan
> >> =20
> >>>
> >>> Thanks
> >>>
> >>> Eric   =20
> >>>> )
> >>>>
> >>>> Thanks
> >>>> Laszlo
> >>>>   =20
> >> =20
> >=20
> >  =20

