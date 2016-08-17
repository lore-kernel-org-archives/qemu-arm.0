Received: by 10.25.21.156 with SMTP id 28csp2467866lfv;
        Wed, 17 Aug 2016 04:42:52 -0700 (PDT)
X-Received: by 10.55.18.225 with SMTP id 94mr44241360qks.240.1471434172056;
        Wed, 17 Aug 2016 04:42:52 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s56si20789693qte.19.2016.08.17.04.42.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Aug 2016 04:42:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46858 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bZzFD-00032O-EU
	for alex.bennee@linaro.org; Wed, 17 Aug 2016 07:42:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bZzF9-00030U-Ut
	for qemu-arm@nongnu.org; Wed, 17 Aug 2016 07:42:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bZzF5-0004Xk-Lj
	for qemu-arm@nongnu.org; Wed, 17 Aug 2016 07:42:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55066)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bZzF5-0004Xc-Eu; Wed, 17 Aug 2016 07:42:43 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ED51983F47;
	Wed, 17 Aug 2016 11:42:42 +0000 (UTC)
Received: from [10.36.112.58] (ovpn-112-58.ams2.redhat.com [10.36.112.58])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7HBgcGC019495
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 17 Aug 2016 07:42:40 -0400
To: "Zheng, Lv" <lv.zheng@intel.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>, "Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Shannon Zhao <shannon.zhao@linaro.org>
References: <409b2bbd046a53987a71e64d855e5761d441bbaf.1470641265.git.lv.zheng@intel.com>
	<cover.1470907810.git.lv.zheng@intel.com>
	<f59fb42c320294fdf3e140aeaa6dd3aba95d837f.1470907810.git.lv.zheng@intel.com>
	<955fe680-3d7f-4dd9-1aae-55d812077be5@redhat.com>
	<1AE640813FDE7649BE1B193DEA596E883BC0DC9D@SHSMSX101.ccr.corp.intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <96278727-ab59-8aee-3f2e-33d2d0711523@redhat.com>
Date: Wed, 17 Aug 2016 13:42:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1AE640813FDE7649BE1B193DEA596E883BC0DC9D@SHSMSX101.ccr.corp.intel.com>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 17 Aug 2016 11:42:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v5 2/2] ACPI: Add -acpitable fadt= to allow
 FADT revision changes
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Lv Zheng <zetalog@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oBKHrJ7ixa1n



On 15/08/2016 03:42, Zheng, Lv wrote:
> Hi, Paolo
>=20
>> From: Paolo Bonzini [mailto:pbonzini@redhat.com]
>> Subject: Re: [PATCH v5 2/2] ACPI: Add -acpitable fadt=3D to allow FADT
>> revision changes
>>
>>
>>
>> On 11/08/2016 11:36, Lv Zheng wrote:
>>>
>>> -    error_setg(errp, "'-acpitable' requires one of 'data' or 'file'"=
);
>>> +    val =3D qemu_opt_get((QemuOpts *)opts, "fadt");
>>> +    if (val) {
>>> +        unsigned long rev;
>>
>> Don't use qemu_opt_get.  Add the field to AcpiTableOptions in
>> qapi-schema.json, and then use hdrs->has_fadt, hdrs->fadt.
>=20
>=20
> 1. If I do so, users may be confused when only -acpitable fadt=3D3 is
>     specified (no user tables are provided), qemu may exit because of=20
>     "data or file option missing".
> 2. If we doesn't want qemu exit in the above case, code in
>     acpi_table_add() will be too complicated.
> 3. If I put fadt into AcpiTableOptions in the schema,
>     hdrs->has_fadt/hdrs->fadt will become 2 more useless options
>     (just like hders->file/hdrs->data/hdrs->has_file/hdrs->has_data,
>     see comments of acpi_table_install()) passed to acpi_table_install(=
).
>=20
> That's why I enhanced -acpitable to convert it into an option with 3
> mandatory sub-options:
> -acpitable data/file ....
> -acpitable fadt ....

But most arguments of -acpitable (e.g. oem_id) apply to FADT as well. =20
In fact "-acpitable fadt=3D3" perhaps could be written as "-acpitable fad=
t,rev=3D3".

So one possibility if you add '*fadt': 'bool' to AcpiTableOptions is the =
following:

    if (hdrs->has_file + hdrs->has_data + hdrs->has_fadt > 1) {
        error_setg(&err, "'-acpitable' requires one of 'data' or 'file' o=
r 'fadt'");
        goto out;
    }
    if (hdrs->has_fadt && hdrs->fadt) {
        fadt_options =3D hdrs;
        return;
    }

Paolo
