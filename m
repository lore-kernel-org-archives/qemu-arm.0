Received: by 10.223.159.74 with SMTP id f10csp2403886wrg;
        Fri, 22 Dec 2017 07:43:20 -0800 (PST)
X-Google-Smtp-Source: ACJfBouAiadyfeK6FQvvCfe+KYI8JQlB/OitXmB3IhpXPD7K9zek+ga8ogtQvqQ8YsdDV4AznPd3
X-Received: by 10.129.137.197 with SMTP id z188mr10530627ywf.57.1513957400805;
        Fri, 22 Dec 2017 07:43:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513957400; cv=none;
        d=google.com; s=arc-20160816;
        b=X6nV9fwEHeZ4XkGS1IVAXJY++tHkkBF2328UpNU7CjSA/ixg60vkOJ/YC8iCruoiUZ
         L49ekb1ifQhtpSZbc5ZVAWDewkrcwRy1KOFsGLiIdrPBVJRB263FMaxoqwYsuucxf5ks
         AKTfygnLgFl+1JHQ24sDyJz4MYqakh3A0QXIhKX0hze1gtHO9MDlAyJm4AtiSfIkkmLK
         D/BtzobMIlCqwRECCvPowmQYp5MIM8Mn27YQbEs0IR3y07UTrG/a4qy9NJKoa5kfonlw
         QnjIqy3hSyhA1GYplkdye7i8/AQTgux1Gv/J1NhmoEqeH7O1CDv7k9CLHOkBjT2hwfTB
         jUlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from:arc-authentication-results;
        bh=aD4HC/B+Syn0wPyMl+Hqp5eUPChdDHKOXnBk0OUX9Pk=;
        b=Mtt3s9NNDrFns5Xs+k2pcofJlYwDo19BVj5w1ryTSeHUWKMyDOd7o/ZVB/yVJfhRGl
         APGy6jBT3p4li8I8nj/iEelIDiCTbIbrPmHf2tKR3XaJEDnu9vgqAAYXldHLqEqvfChb
         qetL+3SKrzGF0Vr+PSc5vzQMstRldN+TRAet4CtxCZVdo5A9kfx1lOn6A8rqKF965mJe
         9ewqu6+/QVkqPHZi2cb7cs3GhJD7O/QHR80GN1zqRcrsTGKnPfl0O+q1Rs1iIDVCFzVM
         LYnIon+WA5z2zQ8u+VUqjw/pMOv9Vqt/i/dwCqtx0LenEMfehbVBBTcz7uzCJAzQ/Fgs
         IpbA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l39si4473546ybj.174.2017.12.22.07.43.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Dec 2017 07:43:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54689 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eSPTk-0001IT-4f
	for alex.bennee@linaro.org; Fri, 22 Dec 2017 10:43:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1eSPOR-0004y9-Nn
	for qemu-arm@nongnu.org; Fri, 22 Dec 2017 10:37:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1eSPOQ-0002dK-G0
	for qemu-arm@nongnu.org; Fri, 22 Dec 2017 10:37:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44620)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1eSPOQ-0002cj-87; Fri, 22 Dec 2017 10:37:50 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 432146A7D2;
	Fri, 22 Dec 2017 15:37:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-74.ams2.redhat.com
	[10.36.116.74])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3E9E784AD;
	Fri, 22 Dec 2017 15:37:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 5DB181138645; Fri, 22 Dec 2017 16:37:47 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Alistair Francis <alistair.francis@xilinx.com>
References: <cover.1513790494.git.alistair.francis@xilinx.com>
	<6bad4084f4cbc290e2e9f1a72fcfcda7223383ec.1513790495.git.alistair.francis@xilinx.com>
Date: Fri, 22 Dec 2017 16:37:47 +0100
In-Reply-To: <6bad4084f4cbc290e2e9f1a72fcfcda7223383ec.1513790495.git.alistair.francis@xilinx.com>
	(Alistair Francis's message of "Wed, 20 Dec 2017 09:23:01 -0800")
Message-ID: <87lghulqno.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 22 Dec 2017 15:37:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 04/29] hw/arm: Replace
 fprintf(stderr, "*\n" with error_report()
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
Cc: qemu-trivial@nongnu.org, alistair23@gmail.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W/VVphC1/Nfi

Second thoughts...

Alistair Francis <alistair.francis@xilinx.com> writes:

> Replace a large number of the fprintf(stderr, "*\n" calls with
> error_report(). The functions were renamed with these commands and then
> compiler issues where manually fixed.
>
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|erro=
r_report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_=
report("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_repo=
rt("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report=
("\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("=
\1"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1=
"\2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\=
2);|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2)=
;|Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|=
Ig}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig=
}' \
>     {} +
> find ./* -type f -exec sed -i \
>     'N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}'=
 \
>     {} +
>
> Some lines where then manually tweaked to pass checkpatch.
>
> The 'qemu: ' prefix was manually removed from the hw/arm/boot.c file.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Cc: qemu-arm@nongnu.org
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> V6:
>  - Fix indendation
> V3:
>  - Remoave 'qemu: ' prefix
> V2:
>  - Split hw patch into individual directories
>
>  hw/arm/armv7m.c      |  2 +-
>  hw/arm/boot.c        | 37 ++++++++++++++++++-------------------
>  hw/arm/gumstix.c     | 13 +++++++------
>  hw/arm/mainstone.c   |  7 ++++---
>  hw/arm/musicpal.c    |  2 +-
>  hw/arm/omap1.c       |  5 +++--
>  hw/arm/omap2.c       | 23 ++++++++++++-----------
>  hw/arm/omap_sx1.c    |  8 +++-----
>  hw/arm/palm.c        | 10 +++++-----
>  hw/arm/pxa2xx.c      |  7 ++++---
>  hw/arm/stellaris.c   |  3 ++-
>  hw/arm/tosa.c        | 18 +++++++++---------
>  hw/arm/versatilepb.c |  2 +-
>  hw/arm/vexpress.c    |  8 ++++----
>  hw/arm/z2.c          |  6 +++---
>  15 files changed, 77 insertions(+), 74 deletions(-)
>
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index bb2dfc942b..56770a7048 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -278,7 +278,7 @@ void armv7m_load_kernel(ARMCPU *cpu, const char *kern=
el_filename, int mem_size)
>  #endif
>=20=20
>      if (!kernel_filename && !qtest_enabled()) {
> -        fprintf(stderr, "Guest image must be specified (using -kernel)\n=
");
> +        error_report("Guest image must be specified (using -kernel)");
>          exit(1);
>      }
>=20=20

This is obviously a genuine (fatal) error.

> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index c2720c8046..6e6b8c0c6a 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -8,6 +8,7 @@
>   */
>=20=20
>  #include "qemu/osdep.h"
> +#include "qemu/error-report.h"
>  #include "qapi/error.h"
>  #include <libfdt.h>
>  #include "hw/hw.h"
> @@ -418,13 +419,13 @@ static int load_dtb(hwaddr addr, const struct arm_b=
oot_info *binfo,
>          char *filename;
>          filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, binfo->dtb_file=
name);
>          if (!filename) {
> -            fprintf(stderr, "Couldn't open dtb file %s\n", binfo->dtb_fi=
lename);
> +            error_report("Couldn't open dtb file %s", binfo->dtb_filenam=
e);
>              goto fail;
>          }

These is obviously a genuine (recoverable) error..

[More of the same...]
> diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
> index b53878b8b9..3a1d995d6a 100644
> --- a/hw/arm/omap2.c
> +++ b/hw/arm/omap2.c
> @@ -19,6 +19,7 @@
>   */
>=20=20
>  #include "qemu/osdep.h"
> +#include "qemu/error-report.h"
>  #include "qapi/error.h"
>  #include "qemu-common.h"
>  #include "cpu.h"
> @@ -1311,8 +1312,8 @@ static void omap_prcm_apll_update(struct omap_prcm_=
s *s)
>      /* TODO: update clocks */
>=20=20
>      if (mode[0] =3D=3D 1 || mode[0] =3D=3D 2 || mode[1] =3D=3D 1 || mode=
[1] =3D=3D 2)
> -        fprintf(stderr, "%s: bad EN_54M_PLL or bad EN_96M_PLL\n",
> -                        __func__);
> +        error_report("%s: bad EN_54M_PLL or bad EN_96M_PLL",
> +                     __func__);
>  }

This one's different: we neither exit() nor return a "failed" status to
the caller.

We get here when the guest writes something funny to a certain
memory-mapped I/O register.  In other words, it's guest misbehavior, not
a user error.  I doubt it should be reported with error_report().
Peter, do we have a canonical way to report or log  guest misbehavior?

[...]
