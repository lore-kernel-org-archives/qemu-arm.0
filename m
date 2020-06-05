Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2511719lfc;
        Fri, 5 Jun 2020 07:37:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkiu7Rk65iKJm+Pcdh2QDkNVFQf0sSkXDexqpZIZVvyBetlHSIw2CmkDH8zsgnwBYzNOya
X-Received: by 2002:a25:2691:: with SMTP id m139mr3371684ybm.132.1591367868049;
        Fri, 05 Jun 2020 07:37:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591367868; cv=none;
        d=google.com; s=arc-20160816;
        b=QHNrxkRZVAa5A/ZORylEUaB2p1QtBPXKt5c0KIY6EBGK+gZy87zXnsNxgKwCa141d0
         bAeJjSrI5ih4cMsPaelvk6SzMZvpgr0Z38wTufF9mgX9b8uA2viPJaor7Q0e3+Qu8JXP
         mJpeZQnOf3kmK9YLvaFExSjWxa0Ht6/1V4MAAPLHtrMs7O1EvYfIKKfSuzTwEEgZH+jB
         K8PYeyU/seFLiBo6RR1abF8tZJ87hTSbDtYMyFC4eO3vV46w58trYmYZCOKikEfjRMXN
         8i35EzQxobwJGQfCPypWp8uuNicqtJkAFwaRzS4M39aSfEt59pPpthQiZ9QjSQFVP5Xv
         Xl2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=mWE7JRPnTebQVv8JyEjQxh91MMiLpVPY/+Mm78x8OGo=;
        b=rVeW9t+6Xz88xZNRKMRXT3V2aLPz3G58kVWAS/luO+166ORW+0wNOjCTZkk/xHKdzi
         /+XQPQrpJZbWiSYi4W3GS1xx0IxeVazKzDBAFgbDJrjBs7sc+eC5vkZ5p35IwR9t+lgU
         FrLy7Tg9eO/XfHuMF6R/GCrWlSX924KR7AsusrZV2cn3CjQweccnnJlM4xc7aW5SQ7Cf
         lTBXHKEU4k6dCQBeZkHWKQOCH/V90m+/cwRwCRBgxTakEgiTzdLLzVgLj9sgbxYEJGQP
         dN4F60XzBMOZg+OVQENpEewhl3OuOLIzxJQ8h5N3OzztDhsW5oUKYzEJaALHQAonVwdF
         p8uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EFl2sXZi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4si7418712ybc.201.2020.06.05.07.37.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jun 2020 07:37:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EFl2sXZi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jhDTf-0007Gh-E5
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 10:37:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jhDTO-0007G6-Vb
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 10:37:31 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:49527
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jhDTO-0003ET-1T
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 10:37:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591367847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mWE7JRPnTebQVv8JyEjQxh91MMiLpVPY/+Mm78x8OGo=;
 b=EFl2sXZiybC4QcmCmFlLhNxKiCtVxiEQt/+HzybrxILXChAymVHB57GJq+tdPEGfJWP/DV
 BkniB5m9DRo5knzlAdk4lEaFHaQGWTqNLqLnhOB2LAavrnKSkEUjvhpISJGshk2Wj69ca/
 5OyjAk+Ju/byB+oTy6fmmvuiC+1QimQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-4D0q-uzLMRGF-gQ71mcCAA-1; Fri, 05 Jun 2020 10:37:00 -0400
X-MC-Unique: 4D0q-uzLMRGF-gQ71mcCAA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C4B31883610;
 Fri,  5 Jun 2020 14:36:58 +0000 (UTC)
Received: from localhost (unknown [10.40.208.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FE02619C0;
 Fri,  5 Jun 2020 14:36:47 +0000 (UTC)
Date: Fri, 5 Jun 2020 16:36:44 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v3 1/4] acpi: Convert build_tpm2() to build_append* API
Message-ID: <20200605163644.6e5d6717@redhat.com>
In-Reply-To: <a85cc67e-2d8a-2034-3b85-6e8c8d7dcad6@linux.ibm.com>
References: <20200601095737.32671-1-eric.auger@redhat.com>
 <20200601095737.32671-2-eric.auger@redhat.com>
 <46c71777-b588-ce1f-eb8d-de1c5b3e2186@linux.ibm.com>
 <6bd7f3a0-5a40-823e-bf67-309c9995e18e@redhat.com>
 <a85cc67e-2d8a-2034-3b85-6e8c8d7dcad6@linux.ibm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 03:40:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com,
 qemu-devel@nongnu.org, Auger Eric <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 marcandre.lureau@redhat.com, lersek@redhat.com, ardb@kernel.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qU6iCXg6LEqL

On Tue, 2 Jun 2020 10:24:03 -0400
Stefan Berger <stefanb@linux.ibm.com> wrote:

> On 6/2/20 9:55 AM, Auger Eric wrote:
> > Hi Stefan,
> > On 6/2/20 3:30 PM, Stefan Berger wrote: =20
> >> On 6/1/20 5:57 AM, Eric Auger wrote: =20
> >>> In preparation of its move to the generic acpi code,
> >>> let's convert build_tpm2() to use build_append API. This
> >>> latter now is prefered in place of direct ACPI struct field
> >>> settings with manual endianness conversion.
> >>>
> >>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>> ---
> >>>  =C2=A0 hw/i386/acpi-build.c | 28 +++++++++++++++++++---------
> >>>  =C2=A0 1 file changed, 19 insertions(+), 9 deletions(-)
> >>>
> >>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> >>> index b5669d6c65..f0d35d7b17 100644
> >>> --- a/hw/i386/acpi-build.c
> >>> +++ b/hw/i386/acpi-build.c
> >>> @@ -2298,30 +2298,40 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker
> >>> *linker, GArray *tcpalog)
> >>>  =C2=A0 static void
> >>>  =C2=A0 build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tc=
palog)
> >>>  =C2=A0 {
> >>> -=C2=A0=C2=A0=C2=A0 Acpi20TPM2 *tpm2_ptr =3D acpi_data_push(table_dat=
a, sizeof *tpm2_ptr);
> >>> +=C2=A0=C2=A0=C2=A0 Acpi20TPM2 *tpm2_ptr =3D acpi_data_push(table_dat=
a,
> >>> sizeof(AcpiTableHeader)); =20
> >> And now you want to build the data structure by pushing fields? I woul=
d
> >> definitely NOT do this. =20
> > If I didn't misinterpret things, this was recommended by Drew and Igor
> > as buid_append* API avoids to take care of endianness and this is the
> > API now used in the generic ACPI code. Besides I also think that in tha=
t
> > case it does not simplify things but maybe I did that the wrong way? Or
> > maybe I didn't understand your remark? =20
>=20
>=20
> If that's what they are saying... I would prefer filling out data=20
> structures with functions like cpu_to_acpi16() because that seems to be=
=20
> less error prone.

practice showed it was opposite, it was easy to forget about cpu_to_le
build_append_int_noprefix() API we don't have to care about endiannes
issues anymore at places where API is used.
Another reasons for using build_append_int_noprefix() is that one doesn't
have to define packed structures, work around unaligned access and bit plus=
 is
when I review patch it boiles down to comparing it with table in a spec
row by row as API enforces the same order as in spec, which makes reviews
much easier.

>=20
> >> =20
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned log_addr_size =3D sizeof(tpm=
2_ptr->log_area_start_address);
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned log_addr_offset =3D
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (char *)&tpm2=
_ptr->log_area_start_address - table_data->data;
> >>> +=C2=A0=C2=A0=C2=A0 uint8_t start_method_params[12] =3D {};
> >>>  =C2=A0 -=C2=A0=C2=A0=C2=A0 tpm2_ptr->platform_class =3D cpu_to_le16(=
TPM2_ACPI_CLASS_CLIENT);
> >>> +=C2=A0=C2=A0=C2=A0 /* platform class */
> >>> +=C2=A0=C2=A0=C2=A0 build_append_int_noprefix(table_data, TPM2_ACPI_C=
LASS_CLIENT, 2);
> >>> +=C2=A0=C2=A0=C2=A0 /* reserved */
> >>> +=C2=A0=C2=A0=C2=A0 build_append_int_noprefix(table_data, 0, 2);
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (TPM_IS_TIS_ISA(tpm_find())) {
> >>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tpm2_ptr->control_area_ad=
dress =3D cpu_to_le64(0);
> >>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tpm2_ptr->start_method =
=3D cpu_to_le32(TPM2_START_METHOD_MMIO);
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* address of control are=
a */
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build_append_int_noprefix=
(table_data, 0, 8);
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* start method */
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build_append_int_noprefix=
(table_data, TPM2_START_METHOD_MMIO,
> >>> 4);
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (TPM_IS_CRB(tpm_find())) {
> >>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tpm2_ptr->control_area_ad=
dress =3D cpu_to_le64(TPM_CRB_ADDR_CTRL);
> >>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tpm2_ptr->start_method =
=3D cpu_to_le32(TPM2_START_METHOD_CRB);
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build_append_int_noprefix=
(table_data, TPM_CRB_ADDR_CTRL, 8);
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build_append_int_noprefix=
(table_data, TPM2_START_METHOD_CRB, 4);
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_warn_if_rea=
ched();
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >>>  =C2=A0 -=C2=A0=C2=A0=C2=A0 tpm2_ptr->log_area_minimum_length =3D
> >>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu_to_le32(TPM_LOG_AREA_=
MINIMUM_SIZE);
> >>> +=C2=A0=C2=A0=C2=A0 /* platform specific parameters */
> >>> +=C2=A0=C2=A0=C2=A0 g_array_append_vals(table_data, &start_method_par=
ams, 12); =20
>=20
> Maybe this should be wrapped in an inline function like=20
> build_append_array() or so.
I guss I'm just used to g_array_append_vals() but build_append_array() look=
s nicer
and consistent with build_append_foo API

>=20
>=20
> >>>  =C2=A0 -=C2=A0=C2=A0=C2=A0 acpi_data_push(tcpalog,
> >>> le32_to_cpu(tpm2_ptr->log_area_minimum_length));
> >>> +=C2=A0=C2=A0=C2=A0 /* log area minimum length */
> >>> +=C2=A0=C2=A0=C2=A0 build_append_int_noprefix(table_data, TPM_LOG_ARE=
A_MINIMUM_SIZE, 4);
> >>> +
> >>> +=C2=A0=C2=A0=C2=A0 acpi_data_push(tcpalog, TPM_LOG_AREA_MINIMUM_SIZE=
); =20
>=20
>=20
> At this point we have a double-allocation of log memory on x86_64. You'd=
=20
> need the patch I posted to create the TCPA table only for TPM 1.2.
>=20
>=20
>=20
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bios_linker_loader_alloc(linker, ACPI=
_BUILD_TPMLOG_FILE,
> >>> tcpalog, 1,
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 false);
> >>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* log area start address to b=
e filled by Guest linker */
> >>> +=C2=A0=C2=A0=C2=A0 build_append_int_noprefix(table_data, 0, 8);
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bios_linker_loader_add_pointer(linker=
, ACPI_BUILD_TABLE_FILE,
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 log_addr_offset, log_addr_size,
> >>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ACPI_BUILD_TPMLOG_FILE, 0); =20
> >> =20
>=20
>=20
>=20

