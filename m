Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6261534lfg;
        Thu, 4 Mar 2021 06:03:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJO7n2hxXcTT3BuU6hRTQ2q4xBmpf3l8HpTGk5eDgT9Kdozb6Z8I8h+DpnXyg3CIB2ZWoK
X-Received: by 2002:a5d:9e03:: with SMTP id h3mr3651263ioh.94.1614866598270;
        Thu, 04 Mar 2021 06:03:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614866598; cv=none;
        d=google.com; s=arc-20160816;
        b=WUd/ubiX6xqX1b0E3Bl3BvXvzlq0FXkA4lDULjs21Z9BO+zzLCymH7HzvgvsJB7qGK
         is0kZViAQukUp1gwe3aVNlAwpUDuAJ0T1dZgFqDp1ejJw0dfPJ0FTgxZ3+Uf2twbaGKj
         DlVf14gfG1CfuvgsqGI/u+Oieg1kAbIswYF0WYqP3fOKxaPcP9/ki9mgFJc0dUonOIwL
         MWHy6WabkuHoppLGnhIPxvkwqItRCktGgP5wE0eoM7cX705Dgg9RmEeNIK9hX9VCpSoi
         2pyrW2rMz2BGHcJNKpE/TY9/1qhxroXYM7+2cdsl7DuxXW3abJ/4nMbKy6bwa3jcER83
         jIWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=dlTP7SMfSPTaLqLxVH64lGt1EJEDbtzvES80lnPNhcs=;
        b=GF5ErcqdyQnbbzXwlgmSQxlu+bS8q5qkgvz6n8ETecfPgJRacnynNfRht7G2z/Kg1E
         IDcvyky5yTBgzsBt0qfJldkzuFyO3aj3C33k5tgYm1EVDHZK8+H6iZenViqUtiktX57z
         BT0sEd2D36WHKfEBiNAl8f2g2TrBN//2lYW8pHXLlaODgjm1arkBqa1xXOt1jVLJM5cI
         bvX4Caif7JTRJm/k2fIVHm5GNmeHqNlARJdy+m1VQ4gtWC8c0neRyFzbD/TkV1wx2isN
         KK8hJ4fIbYUfIBt09GT+oNj9hbyz7949SXym78s0BlDuUn+E5CNH/MfGiB9baXTSXGkJ
         JJMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SxFUE029;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1si23296986ilj.99.2021.03.04.06.03.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 06:03:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SxFUE029;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHoZR-0006oW-GT
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 09:03:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lHoYp-0006n5-PK
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:02:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lHoYn-0003RK-Qr
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:02:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614866556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dlTP7SMfSPTaLqLxVH64lGt1EJEDbtzvES80lnPNhcs=;
 b=SxFUE0295pAwIjvN8fHj1LCHe2mJobesulavy3QHDequUxmLR8DmmP50GUDV/eOFtbuRwr
 n7EOnifg5Io1ERfRt7UwU0OwO+YA245zLX4TWaP3RJzd8JOuFe0aAFjK8g8Xz6RINh4c9z
 jiOM4hmkVfL9a85NOW3tWUgIN3R/G1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-CObCQUUsOfGUFxZtKeJd9A-1; Thu, 04 Mar 2021 09:02:34 -0500
X-MC-Unique: CObCQUUsOfGUFxZtKeJd9A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78B9EE4971;
 Thu,  4 Mar 2021 14:02:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-73.ams2.redhat.com
 [10.36.112.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F3E15104C52C;
 Thu,  4 Mar 2021 14:02:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6D1701132C12; Thu,  4 Mar 2021 15:02:29 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] QOM type names and QAPI
Date: Thu,  4 Mar 2021 15:02:27 +0100
Message-Id: <20210304140229.575481-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, BIGNUM_EMAILS=1,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 frederic.konrad@adacore.com, kraxel@redhat.com, edgar.iglesias@gmail.com,
 jcd@tribudubois.net, qemu-block@nongnu.org, quintela@redhat.com,
 andrew.smirnov@gmail.com, marcandre.lureau@redhat.com, atar4qemu@gmail.com,
 ehabkost@redhat.com, alistair@alistair23.me, dgilbert@redhat.com,
 chouteau@adacore.com, qemu-arm@nongnu.org, peter.chubb@nicta.com.au,
 jsnow@redhat.com, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZuwD4+FrfUuW

Based-on: <20210304100059.157158-1-armbru@redhat.com>

Note: to apply it on master instead, replace one more "SUNW,fdtwo" by
"sun-fdtwo" in hw/block/fdc.c.


QAPI has naming rules.  docs/devel/qapi-code-gen.txt:

    === Naming rules and reserved names ===

    All names must begin with a letter, and contain only ASCII letters,
    digits, hyphen, and underscore.  There are two exceptions: enum values
    may start with a digit, and names that are downstream extensions (see
    section Downstream extensions) start with underscore.

    [More on reserved names, upper vs. lower case, '-' vs. '_'...]

The generator enforces the rules.

Naming rules help in at least three ways:

1. They help with keeping names in interfaces consistent and
   predictable.

2. They make avoiding collisions with the users' names in the
   generator simpler.

3. They enable quote-less, evolvable syntax.

   For instance, keyval_parse() syntax consists of names, values, and
   special characters ',', '=', '.'

   Since names cannot contain special characters, there is no need for
   quoting[*].  Simple.

   Values are unrestricted, but only ',' is special there.  We quote
   it by doubling.

   Together, we get exactly the same quoting as in QemuOpts.  This is
   a feature.

   If we ever decice to extend key syntax, we have plenty of special
   characters to choose from.  This is also a feature.

   Both features rely on naming rules.

QOM has no naming rules whatsoever.  Actual names aren't nearly as bad
as they could be.  Still, there are plenty of "funny" names.  This may
become a problem when we

* Switch from QemuOpts to keyval_parse()

  Compared to QemuOpts, keyval_parse() restricts *keys*, but not
  *values*.

  "Funny" type names occuring as values are no worse than before:
  quoting issues, described below.

  Type names occuring in keys must be valid QAPI names.  Should be
  avoidable.

* QAPIfy (the compile-time static parts of) QOM

  QOM type names become QAPI enum values.  They must conform to QAPI
  enum naming rules.

Let's review the existing offenders in the qemu-system-FOO:

1. We have a few type names containing ',', and one containing ' '.
   The former require QemuOpts / keyval quoting (double the comma),
   the latter requires shell quoting.  There is no excuse for making
   our users remember and do such crap.  PATCH 1 eliminates it.

2. We have six type names containing '+', and two containing ':':

    Sun-UltraSparc-IIIi+-sparc64-cpu
    Sun-UltraSparc-IV+-sparc64-cpu
    power5+_v2.1-powerpc64-cpu
    power5+_v2.1-spapr-cpu-core
    power7+_v2.1-powerpc64-cpu
    power7+_v2.1-spapr-cpu-core
    qemu:iommu-memory-region
    qemu:memory-region

   Naming rules could be relaxed to accept '+' and ':'.  I'm doubt
   this is worthwhile.

   PATCH 2 renames the ones with ':'.

   I'm leaving the ones with '+' alone for now.

3. We have some 550 type names containing '.'.

   QAPI's (enum) naming rules could be relaxed to accept '.'.

   keyval_parse()'s can't.  Irrelevant, as long as type names only
   occur as values, not as keys.

4. We have some 450 names starting with a digit.  Roughly half of them
   also contain '.'.

   Leading digit is okay as QAPI enum, not okay as keyval_parse() key
   fragment.  Irrelevant, as long as type names only occur as
   *values*, not as *keys*.

5. We generate type names of the form T::I, where T is a type name,
   and I is the name of one of its interfaces.

   I hope these are just for internal use.

One more thing on relaxing QAPI naming rules.  QAPI names get mapped
to (parts of) C identifiers.  These mappings are not injective.  The
basic mapping is simple: replace characters other than letters and
digits by '_'.

This means names distinct QAPI names can clash in C.  Fairly harmless
when the only "other" characters are '-' and '_'.  The more "others" we
permit, the more likely confusing clashes become.  Not a show stopper,
"merely" an issue of ergonomics.

v2:
* No longer RFC
* Cover letter:
  - Consider difference between between keys and values in
    keyval_parse()
  - Differentiate more clearly between general QAPI naming rules and
    QAPI enum naming rules
  - List the types containing '+'
  - Cover types containing ':'
  - Drop "Can we get rid of '.'?" [Peter Maydell]
  - Drop the idea to rename types starting with digits
  - Cover "T::I" types generated for interfaces
  - Cover ergonomics of relaxing QAPI naming rules
* PATCH 1: Rename SUNW,FOO to sun-FOO [Mark Cave-Ayland]
* PATCH 2: New


[*] Paolo's "[PATCH 04/25] keyval: accept escaped commas in implied
option" provides for comma-quoting.  I'm ignoring it here for brevity.
I assure you it doesn't weaken my argument.


Markus Armbruster (2):
  hw: Replace anti-social QOM type names
  memory: Drop "qemu:" prefix from QOM memory region type names

 include/exec/memory.h                        |  4 ++--
 include/hw/arm/armv7m.h                      |  2 +-
 include/hw/arm/fsl-imx25.h                   |  2 +-
 include/hw/arm/fsl-imx31.h                   |  2 +-
 include/hw/arm/fsl-imx6.h                    |  2 +-
 include/hw/arm/fsl-imx6ul.h                  |  2 +-
 include/hw/arm/fsl-imx7.h                    |  2 +-
 include/hw/arm/xlnx-zynqmp.h                 |  2 +-
 include/hw/cris/etraxfs.h                    |  2 +-
 include/hw/i386/ich9.h                       |  2 +-
 include/hw/misc/grlib_ahb_apb_pnp.h          |  4 ++--
 include/hw/misc/zynq-xadc.h                  |  2 +-
 include/hw/register.h                        |  2 +-
 include/hw/sparc/grlib.h                     |  6 +++---
 hw/arm/xilinx_zynq.c                         |  2 +-
 hw/audio/cs4231.c                            |  2 +-
 hw/block/fdc.c                               |  4 ++--
 hw/char/etraxfs_ser.c                        |  2 +-
 hw/cris/axis_dev88.c                         |  6 +++---
 hw/display/tcx.c                             |  2 +-
 hw/intc/etraxfs_pic.c                        |  2 +-
 hw/microblaze/xlnx-zynqmp-pmu.c              |  2 +-
 hw/misc/zynq_slcr.c                          |  2 +-
 hw/sparc/sun4m.c                             | 12 ++++++------
 hw/timer/etraxfs_timer.c                     |  2 +-
 softmmu/vl.c                                 |  2 +-
 tests/vmstate-static-checker-data/dump1.json |  4 ++--
 tests/vmstate-static-checker-data/dump2.json |  4 ++--
 28 files changed, 42 insertions(+), 42 deletions(-)

-- 
2.26.2

