Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6750030lff;
        Wed, 15 Jan 2020 02:55:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqzG/a2TSaXhZYuZHLNK/u+jjtZDNeXHLQIvRBYWdU1nmqMD5IuxTiEBSjd+kutxbr9U26iu
X-Received: by 2002:a0c:9023:: with SMTP id o32mr21483544qvo.110.1579085727060;
        Wed, 15 Jan 2020 02:55:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579085727; cv=none;
        d=google.com; s=arc-20160816;
        b=Zt9ZLbL+NJPXosRhCSqWge1XuhiqohR7rS8A/EEid8sxtY4N6rJN3VBT2WW3Alz5lp
         z6bGJyKPAn9C/Q18tBE6F/IQhlsVIGpMqij6CjZrFHK88yQElzAllsUjYD93kqm5QRZW
         178D8TS4+SwRzLaFrPV4Dw8g/Xs15qWQb797EpmlHNPIw3qm6qe1HJYUlabHiyotxMUB
         99RHStzdHFemWqCw21lP8aRJghR40RKb9aUB3WKRWnWkNlaCpcFmdtZwEMnQ0eQRA1bx
         zvFeuroYJoEPhQ/NenaAUIh8A/SYvMs7jnKKPoK2pTDB3eFfu1LgT0JMgWtVafwt+4IN
         VDOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=bYm4STjo0zvl4Plz7L2NCP4gbfEvcI9vgr2OpNHvSBY=;
        b=PMveiAvcfk9eBII9i/WEnqp/+WHLt4KoWWH4fx4qsS2/scd4J0lkIwW2uuKQG5IDkW
         k1aZxq9YtAqXw4k49V0KNn6asHwU0NZu4cK75TpjfAnR1X30E3cpLt43Mui2mu0dDPiN
         K3neg2kJRo4vKSABk4OAfs0yCxDJGwIuN5abQW+U/NlcHZ/WOjf7qwBX0T5LyEATc1UH
         b7m7szcHU9clU+pkYFeFtj86H0MmBeuidwCGsB91Y9nMnVQvFgpqm0AjHZL85tXtpC05
         8o0lYqOlH1WWeykB+XOHln6mgsFDEWjoOzRydRiZhNO4SRrVwIwLGqrR3e6Ppyi0ZqvV
         QxRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WPB+pHvx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14si9965894qke.264.2020.01.15.02.55.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 02:55:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WPB+pHvx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irgKc-0004lS-AS
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 05:55:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35306)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1irgKP-0004e1-2W
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 05:55:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1irgKM-0000MN-Ey
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 05:55:12 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:21449
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1irgKM-0000LD-5q
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 05:55:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579085708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bYm4STjo0zvl4Plz7L2NCP4gbfEvcI9vgr2OpNHvSBY=;
 b=WPB+pHvxXlv2N1a0bhHq1Vk/m7fgmJ8n+qVhGhP9cPAzsiA8Y47EJUVxz5cI0cuROFIEcx
 CzDALu2J5fHu31sbQD83c56Bz+goi/430kpPnCKkFUqDoP6blezUKFC5S2G0f784D9HiJB
 pB/dzX4cCtzkAAgrgbMncgAuHkAUH7o=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-6_-4jIkFMeOTvcC81FXVyQ-1; Wed, 15 Jan 2020 05:55:07 -0500
Received: by mail-qt1-f200.google.com with SMTP id r9so10944601qtc.4
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2020 02:55:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=fI0s8x4dmhvS60GpU4yvV4S9+sxcLuwS6FKjGsD8XzU=;
 b=nuMIYHrVmRFbvVUBC2W0JMB6ZF7LKUyhtJSKMscnZGkcpU1uccd14YIowVkrtQ+rt7
 vCE+thW2IBgmk0Y5a7/IB1vPVfBIcR6OYwHGSQIMKOcXnMcofVaZzzy4lsBKnZd1GRda
 pyPeZnMRNfgtvdd3hfq6HMN9dJfnbuSGYZzFgzxvRQv83e87rZ9nlEMM31RijvZoXBiE
 wVVCG6fPv6R4hTtPxfUay2t7UwC4BaR+4ryisyCKvxWD8FH/GRypZSSD7k3R7t17q1b8
 TZWT0r8AHxiHTWX4wL3/sjnwEjlYUAorrMOg6sfuqTTxdaemLIwAd7HYkhHMhq+jx72K
 tGxg==
X-Gm-Message-State: APjAAAVDXhJ+cClTconzeXr1JOf82j3YqCf4jiMi7hr5FGeYYwFGLUGR
 t6i2a3+gNeNJwXHJ4hAM739NklLqfx6L9BPHkCn/Qq6u2k43jvS7UfEZeVr93a3cux/dG8ZzMR4
 PEFVLlkzZiBxs
X-Received: by 2002:a37:68a:: with SMTP id 132mr25469611qkg.139.1579085706392; 
 Wed, 15 Jan 2020 02:55:06 -0800 (PST)
X-Received: by 2002:a37:68a:: with SMTP id 132mr25469585qkg.139.1579085706064; 
 Wed, 15 Jan 2020 02:55:06 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
 by smtp.gmail.com with ESMTPSA id c6sm8081700qka.111.2020.01.15.02.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 02:55:05 -0800 (PST)
Date: Wed, 15 Jan 2020 05:55:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Guoheyi <guoheyi@huawei.com>
Subject: Re: [PATCH 2/2] arm/virt/acpi: remove _ADR from devices identified
 by _HID
Message-ID: <20200115055408-mutt-send-email-mst@kernel.org>
References: <20191219064759.35053-1-guoheyi@huawei.com>
 <20191219064759.35053-3-guoheyi@huawei.com>
 <20200105072504-mutt-send-email-mst@kernel.org>
 <CAFEAcA-sduqVO3rrG2V1VsysE2chgd0SnSySvEXFfue-aZN8dg@mail.gmail.com>
 <bbf347fe-c4a4-c5bb-19c2-3a18571b658f@huawei.com>
 <20200115011412-mutt-send-email-mst@kernel.org>
 <7732900c-5490-6483-ca10-71c565e81945@huawei.com>
MIME-Version: 1.0
In-Reply-To: <7732900c-5490-6483-ca10-71c565e81945@huawei.com>
X-MC-Unique: 6_-4jIkFMeOTvcC81FXVyQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
 Corey Minyard <cminyard@mvista.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 wanghaibin.wang@huawei.com, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LdV5twLKXWom

On Wed, Jan 15, 2020 at 05:25:50PM +0800, Guoheyi wrote:
>=20
> =E5=9C=A8 2020/1/15 14:30, Michael S. Tsirkin =E5=86=99=E9=81=93:
> > Problem is IASL disassembler still doesn't work on all hosts
> > we want to support. And its output isn't really stable enough
> > to act as a golden master.
> >=20
> > Until we have a better tool, I propose the contributor just follows all
> > steps 1-6.  The reason they have been listed as maintainer action items
> > is really just so that multiple patches affecting same ACPI table
> > can be applied, with maintainer resolving conflicts himself.
> > But this job can be pushed to contributors if as in the case of ARM
> > maintainer isn't really interested in reading ACPI code anyway.
> >=20
> > So I propose the following patch - comments?
> >=20
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >=20
> >=20
> > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-t=
est.c
> > index f1ac2d7e96..3a6a3e7257 100644
> > --- a/tests/qtest/bios-tables-test.c
> > +++ b/tests/qtest/bios-tables-test.c
> > @@ -16,7 +16,10 @@
> >    * 1. add empty files for new tables, if any, under tests/data/acpi
> >    * 2. list any changed files in tests/bios-tables-test-allowed-diff.h
> >    * 3. commit the above *before* making changes that affect the tables
> > - * Maintainer:
> > + *
> > + * Contributor or ACPI Maintainer (steps 4-7 need to be redone to reso=
lve conflicts
> > + * in binary commit created in step 6):
> > + *
> >    * After 1-3 above tests will pass but ignore differences with the ex=
pected files.
> >    * You will also notice that tests/bios-tables-test-allowed-diff.h li=
sts
> >    * a bunch of files. This is your hint that you need to do the below:
> > @@ -28,13 +31,17 @@
> >    * output. If not - disassemble them yourself in any way you like.
> >    * Look at the differences - make sure they make sense and match what=
 the
> >    * changes you are merging are supposed to do.
> > + * Save the changes, preferably in form of ASL diff for the the commit=
 log in
> NIT: 2 "the" before commit log
> > + * step 6.
> >    *
> >    * 5. From build directory, run:
> >    *      $(SRC_PATH)/tests/data/acpi/rebuild-expected-aml.sh
> > - * 6. Now commit any changes.
> > - * 7. Before doing a pull request, make sure tests/bios-tables-test-al=
lowed-diff.h
> > - *    is empty - this will ensure following changes to ACPI tables wil=
l
> > - *    be noticed.
> > + * 6. Now commit any changes to the expected binary, include diff from=
 step 4
> > + *    in commit log.
> > + * 7. Before sending patches to the list (Contributor)
> > + *    or before doing a pull request (Maintainer), make sure
> > + *    tests/bios-tables-test-allowed-diff.h is empty - this will ensur=
e
> > + *    following changes to ACPI tables will be noticed.
> >    */
>=20
> For contributors doing the full work, does that mean the patchset sent to
> the list contains the following parts?
>=20
> 1. patch 1: list changed files in tests/bios-tables-test-allowed-diff.h.
>=20
> 2. patches 2-n: real changes, may contain multiple patches.
>=20
> 3. patch n+1: update golden master binaries and empty
> tests/bios-tables-test-allowed-diff.h
>=20
> Thanks,
>=20
> Heyi


Here's a hopefully better patch. Peter does this address the issue?

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>


diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.=
c
index f1ac2d7e96..3ab4872bd7 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -16,7 +16,10 @@
  * 1. add empty files for new tables, if any, under tests/data/acpi
  * 2. list any changed files in tests/bios-tables-test-allowed-diff.h
  * 3. commit the above *before* making changes that affect the tables
- * Maintainer:
+ *
+ * Contributor or ACPI Maintainer (steps 4-7 need to be redone to resolve =
conflicts
+ * in binary commit created in step 6):
+ *
  * After 1-3 above tests will pass but ignore differences with the expecte=
d files.
  * You will also notice that tests/bios-tables-test-allowed-diff.h lists
  * a bunch of files. This is your hint that you need to do the below:
@@ -28,13 +31,23 @@
  * output. If not - disassemble them yourself in any way you like.
  * Look at the differences - make sure they make sense and match what the
  * changes you are merging are supposed to do.
+ * Save the changes, preferably in form of ASL diff for the commit log in
+ * step 6.
  *
  * 5. From build directory, run:
  *      $(SRC_PATH)/tests/data/acpi/rebuild-expected-aml.sh
- * 6. Now commit any changes.
- * 7. Before doing a pull request, make sure tests/bios-tables-test-allowe=
d-diff.h
- *    is empty - this will ensure following changes to ACPI tables will
- *    be noticed.
+ * 6. Now commit any changes to the expected binary, include diff from ste=
p 4
+ *    in commit log.
+ * 7. Before sending patches to the list (Contributor)
+ *    or before doing a pull request (Maintainer), make sure
+ *    tests/bios-tables-test-allowed-diff.h is empty - this will ensure
+ *    following changes to ACPI tables will be noticed.
+ *
+ * The resulting patchset/pull request then looks like this:
+ * - patch 1: list changed files in tests/bios-tables-test-allowed-diff.h.
+ * - patches 2 - n: real changes, may contain multiple patches.
+ * - patch n + 1: update golden master binaries and empty
+ *   tests/bios-tables-test-allowed-diff.h
  */
=20
 #include "qemu/osdep.h"
diff --git a/roms/seabios b/roms/seabios
index f21b5a4aeb..c9ba5276e3 160000
--- a/roms/seabios
+++ b/roms/seabios
@@ -1 +1 @@
-Subproject commit f21b5a4aeb020f2a5e2c6503f906a9349dd2f069
+Subproject commit c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d

