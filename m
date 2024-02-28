Received: by 2002:a17:906:a892:b0:a44:c09:7745 with SMTP id ha18csp238320ejb;
        Wed, 28 Feb 2024 05:59:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXF3Ec+fYozETlKq5BB+Hx+ItqSB3HDP+TdUlRojB6gg7mZx6X34IPcjtdu2zGnCY8LnttER0kQKyqiCZ10oU9SOx2EDlWg
X-Google-Smtp-Source: AGHT+IGiQbjpL7XtBrhInr7E6CgigmvzKaHIRnmoLWt4PC/+ZswPfnZY4X2BRlDs03VQGVRVv1Xv
X-Received: by 2002:a05:620a:318a:b0:787:ed19:74ba with SMTP id bi10-20020a05620a318a00b00787ed1974bamr4126327qkb.19.1709128784425;
        Wed, 28 Feb 2024 05:59:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709128784; cv=none;
        d=google.com; s=arc-20160816;
        b=I5+GX0chFCYj96pQCEPhx/i2Dcp+M/6sr15HzBI0BhtX/3rAarD6C0u6lelM00SPYd
         TFSptDdiF1ezcdpv89V8ywvYZgjQccvDJ7Y5HwSZWXiJi/fuNdomYz/XgLhHTXsMQEho
         pMWTx3C1suwrmTnpJD0i42+C0tYu5hRK15w5Rp61oYakJkrH1WRtSK6eZDB3MW7csB6t
         k4omna9GLCa9RjyLvGihV1NRnyuxIzG2J/RCQE2Ripm6XSaw1ubYL9iXDUh/pWKk3aas
         l0nUHqHLiZfLKAoJ4YdzXGKDY9Et3I3Y2aE7hGuLb6VY/051T2dNuNTRENtdHYACB+vt
         l8nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=JIVBQPLgOhPVt1HtBlHUaJ1xvnlArAzQLg7axr3zLXI=;
        fh=oKwb7zbPr9p2COvyjwVUENsYxWgaDgThLfXjnlI9qeE=;
        b=S97HiTxVrSUWnzj+XrjDfNZiqrJMrOaeHEZtJZVpX5Cu1kWp6wC7BfL7NRPZCA/wTG
         rvibRkrPyxaIGJ3T39aP5DweXIABWzBYbr6wjeRZKqcB1qfI8hqLBbW66yvDi+AD3PSF
         0TCxSfhIpXNdn+ZKlaYD6IK1fV8UaECz2Gjhl1tyE2X5z5z1XlLokMEPT3zKn644hB74
         BTNMEydZY8EyxNoXfCX5FaxjTu6Fm62AIW6SmGSZicfMarcPgK3AOZdrcKDfGw5El13S
         cvyHhDQZ/W5KUzdY8If0vaBzgjytUYeggs0K8rxZxhKDx/TUWOAkJO5aMh/whFbsJccO
         uGqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KleIRINk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v15-20020a05622a188f00b0042eb415743dsi365474qtc.391.2024.02.28.05.59.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Feb 2024 05:59:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KleIRINk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfKSo-0006Oq-Nb; Wed, 28 Feb 2024 08:59:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rfKSn-0006O4-PQ
 for qemu-arm@nongnu.org; Wed, 28 Feb 2024 08:59:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rfKSl-0002Aw-TB
 for qemu-arm@nongnu.org; Wed, 28 Feb 2024 08:59:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709128750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JIVBQPLgOhPVt1HtBlHUaJ1xvnlArAzQLg7axr3zLXI=;
 b=KleIRINk1GpeVPNyxbvIwLJN8UdAuFD6N8fN6IhUIgwejRU1VXlmZCIX9jBhYCIcNUL8T0
 Zfk0h/YkwDjLhX6J8IDt5hfAmrpcbCTiSBT/Btt55WTFEqayM3goRwHVyYDTUFOpQ9RhLo
 +1NIaRTd7Hq8QHbvGKK5T2QYMhSalK8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-Pp6j4BDkOsW3Xhx5Np5NtQ-1; Wed, 28 Feb 2024 08:59:08 -0500
X-MC-Unique: Pp6j4BDkOsW3Xhx5Np5NtQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-412add7c18fso8098535e9.2
 for <qemu-arm@nongnu.org>; Wed, 28 Feb 2024 05:59:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709128748; x=1709733548;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=63Y438QjEUyEXnLfBMLdE8BUfRbVj8qdIQItUvIGdl4=;
 b=eTkbLC2lozYy6oxOzXJJAFKG/tBGcaGb51oEO2dt4P0GibO7pk1N6OIMJDzyvgH1ND
 z5McGgSjPHwScxfpiTVfkmIMdimMlCCWZbO7BjLinQhU/xjYv9iSyM5AP2lJ8hJHpDkx
 qqIkBXWRwL+l9XT0dVHFF9udvhb2+RuBWS27soAu7jD+iw63gocRroT0lsFAB+l+8am1
 sY6b2r+cCJeyYV8n4PoRmdpEEYHSYcHJ5Mdrtt/iL74ykJT4PpRCCqwgaEeOra56vNcU
 qKwf7R/T0OyM674g5D3DEDfTe5yalksnv1ZZoed9LvfSc5aformg6LqefEn2bmMrcGES
 DUPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU38OVHl8QE1YhBmwoExoviRGZuje6q34C9/+D6EKa+E6Xb4HHv5dE1YN05GuiHMecOnQ4njHPGXZdHXOW7kIphw/Td
X-Gm-Message-State: AOJu0Yz0tW18b4B8ixclXRgmiD6Go4u0hQvSMbkYSUQ+RL+GiIwFl48z
 1w7FnN1KW0vUzv/1TqfXEYMGbTeLFx/DGPQie6y6xyBHzxLu+X3pJHqbdwO2wguqVsW/vBwqQ+5
 R+0dTFvOgwUDUpe4cEETXjx9H6IXwdT5W5klRqOgNisZCzzfRYg==
X-Received: by 2002:a05:600c:350c:b0:412:9760:c39f with SMTP id
 h12-20020a05600c350c00b004129760c39fmr8339836wmq.10.1709128747781; 
 Wed, 28 Feb 2024 05:59:07 -0800 (PST)
X-Received: by 2002:a05:600c:350c:b0:412:9760:c39f with SMTP id
 h12-20020a05600c350c00b004129760c39fmr8339815wmq.10.1709128747396; 
 Wed, 28 Feb 2024 05:59:07 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 h8-20020a05600016c800b0033dfa7ecd33sm2728865wrf.61.2024.02.28.05.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 05:59:06 -0800 (PST)
Date: Wed, 28 Feb 2024 14:59:05 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <anisinha@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Song Gao <gaosong@loongson.cn>, Alistair
 Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Yanan Wang <wangyanan55@huawei.com>, Eric Blake
 <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, f.ebner@proxmox.com
Subject: Re: [PATCH 03/19] tests: smbios: add test for legacy mode CLI options
Message-ID: <20240228145905.25fa8cd4@imammedo.users.ipa.redhat.com>
In-Reply-To: <4AD7C30D-F989-4228-91FD-672D79592302@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
 <20240227154749.1818189-4-imammedo@redhat.com>
 <4AD7C30D-F989-4228-91FD-672D79592302@redhat.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.102,
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
X-TUID: /dU3WrWfphRk

On Wed, 28 Feb 2024 16:41:22 +0530
Ani Sinha <anisinha@redhat.com> wrote:

> > On 27-Feb-2024, at 21:17, Igor Mammedov <imammedo@redhat.com> wrote:
> >=20
> > Unfortunately having 2.0 machine type deprecated is not enough
> > to get rid of legacy SMBIOS handling since 'isapc' also uses
> > that and it's staying around.
> >=20
> > Hence add test for CLI options handling to be sure that it
> > ain't broken during SMBIOS code refactoring.
> >=20
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > tests/data/smbios/type11_blob.legacy | Bin 0 -> 10 bytes
> > tests/qtest/bios-tables-test.c       |  17 +++++++++++++++++
> > 2 files changed, 17 insertions(+)
> > create mode 100644 tests/data/smbios/type11_blob.legacy
> >=20
> > diff --git a/tests/data/smbios/type11_blob.legacy b/tests/data/smbios/t=
ype11_blob.legacy
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..aef463aab903405958b0a85=
f85c5980671c08bee
> > GIT binary patch
> > literal 10
> > Rcmd;PW!S(N;u;*n000Tp0s;U4
> >=20
> > literal 0
> > HcmV?d00001
> >=20
> > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-t=
est.c
> > index a116f88e1d..d1ff4db7a2 100644
> > --- a/tests/qtest/bios-tables-test.c
> > +++ b/tests/qtest/bios-tables-test.c
> > @@ -2106,6 +2106,21 @@ static void test_acpi_pc_smbios_blob(void)
> >     free_test_data(&data);
> > }
> >=20
> > +static void test_acpi_isapc_smbios_legacy(void)
> > +{
> > +    uint8_t req_type11[] =3D { 1, 11 }; =20
>=20
> Ok so looking at the code, it won=E2=80=99t let you specify smbios type o=
ther than 1 =E2=80=A6
>=20
> See the following in smbios_set_defaults()
>=20
>   if (smbios_legacy) {
>         g_free(smbios_tables);
> =09/* in legacy mode, also complain if fields were given for types >1 */
>         if (find_next_bit(have_fields_bitmap,
> =09                  SMBIOS_MAX_TYPE+1, 2) < SMBIOS_MAX_TYPE+1) {
>             error_report("can't process fields for smbios "
>                          "types > 1 on machine versions < 2.1!");
>             exit(1);
>         }
>     } else {
>=20
> BUT you lets you load a blob of type 11? Is that a bug in QEMU? Should we=
 also add a similar check for have_binfile_bitmap?=20

I'd say bug (oversight) in QEMU, actually some of patches later in series
mention this issue in commit messages.
And I'm adding check only for type4 which I have to touch
as for other types it might work (type11) or not.
But I have not tested every possible type (only type 11 and 4)
the former lets test bloated SMBIOS blob and the later
needs refactoring to make this series work..

Everything else was ignored for this series and
can be done later on top.
As mentioned later in series I'd rather deprecate and
drop all legacy code instead of fixing it.

These tests are mostly for me to be sure that existing
CLI handling and blob building aren't broken during
refactoring.

> > +    test_data data =3D {
> > +        .machine =3D "isapc",
> > +        .variant =3D ".pc_smbios_legacy",
> > +        .required_struct_types =3D req_type11,
> > +        .required_struct_types_len =3D ARRAY_SIZE(req_type11),
> > +    };
> > +
> > +    test_smbios("-smbios file=3Dtests/data/smbios/type11_blob.legacy "
> > +                "-smbios type=3D1,family=3DTEST", &data);
> > +    free_test_data(&data);
> > +}
> > +
> > static void test_oem_fields(test_data *data)
> > {
> >     int i;
> > @@ -2261,6 +2276,8 @@ int main(int argc, char *argv[])
> >                            test_acpi_pc_smbios_options);
> >             qtest_add_func("acpi/piix4/smbios-blob",
> >                            test_acpi_pc_smbios_blob);
> > +            qtest_add_func("acpi/piix4/smbios-legacy",
> > +                           test_acpi_isapc_smbios_legacy);
> >         }
> >         if (qtest_has_machine(MACHINE_Q35)) {
> >             qtest_add_func("acpi/q35", test_acpi_q35_tcg);
> > --=20
> > 2.39.3
> >  =20
>=20

