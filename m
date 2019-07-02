Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3878354wru;
        Tue, 2 Jul 2019 07:44:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz3kPHur4gpBeIUuLMR2PQlYckSJayEcwFcBeug/oE+j0IFmuA2KnYrDLglnFg/D+nIQhKP
X-Received: by 2002:aa7:c3d8:: with SMTP id l24mr37208044edr.58.1562078647441;
        Tue, 02 Jul 2019 07:44:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562078647; cv=none;
        d=google.com; s=arc-20160816;
        b=l3em7ZaGQTmflmPktPTqb8HFaeLQwrkg19FVc4sqxaA1nrbBzbmEfVBmiWNl6o79EI
         PYXisWYe8io3hmyvT9buAsZWz6AJtsxyBgS9nQbcZdgamvTbXnxIOGPn00CTb8uKxCIa
         dOFSSk+SJsOJqto6sxaaQQ9pZC0nnfzaoXTlp7Hrv7J0wbQn7Aa+x7oBa40Rp+WEtg/z
         GqFpODyfnrxyaSQkOueRf/KgdBzPkkHYTT0MMjvrZN9BZhAscgOJCuRGu+RwhG73l2Mi
         vyMPnn6yAFLy5CSgMZ44Ubi0ZBT5n93CKodrVWH7nxdaDmtikvFvzQ9s7kBkpodRv7Bq
         GtaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=3sUDgD9l3nfK/ol06qXulbOnCayU/9a3NjIzxWJUH9I=;
        b=K92p2pTiFaUyWiuQZgjkWtffJfv6xRLR06l6RkuAGk8vpbjy6NyLSoFijLvOwHsJ+o
         U2Mg7GsMjKzW1sinV4S6PN5BvnrpYYtiLZzrhHsG/bkvRi6Yyb5ozh2yGAUxl2oY6vzt
         diXhLP4WtCJgn3DwPwX3dfAzpbGobmLzxeKGeTMdl7abe2+iWOmIWCUasmdMH339DAY/
         pca+uiXyjMWFQ9Sdyk9LjvXnrVC2PVUw9UcCUeKuzNISYigP5xZiFCw80thnXvLvudGh
         P+Nht8eOtkdKRtE6sk67D4G9hTSJuVhzQS2nD4GMCMpsXeU46jzNtI+uZ2p9jvPkDpQl
         9Juw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r18si9437949ejp.141.2019.07.02.07.44.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2019 07:44:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hiK0s-0001RH-In
	for alex.bennee@linaro.org; Tue, 02 Jul 2019 10:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52592)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hiK0Z-0001PA-KQ
 for qemu-arm@nongnu.org; Tue, 02 Jul 2019 10:43:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hiK0Y-0008Qv-EF
 for qemu-arm@nongnu.org; Tue, 02 Jul 2019 10:43:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49332)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hiK0Y-0008QE-7q; Tue, 02 Jul 2019 10:43:46 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6E4D481DE0;
 Tue,  2 Jul 2019 14:43:45 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-140.brq.redhat.com [10.40.204.140])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AEBA67142;
 Tue,  2 Jul 2019 14:43:39 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  2 Jul 2019 16:43:34 +0200
Message-Id: <20190702144335.10717-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Tue, 02 Jul 2019 14:43:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v5 0/1] Support disabling TCG on ARM
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
Cc: Yang Zhong <yang.zhong@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Samuel Ortiz <sameo@linux.intel.com>, Rob Bradford <robert.bradford@intel.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IjYe7hs1XI3L

v1 cover from Samuel [1]:

  This patchset allows for building and running ARM targets with TCG
  disabled. It splits the target/arm/helper.c file into logical TCG and
  non TCG dependent files so that one can build and run QEMU binaries wit=
h
  or without TCG enabled.

  The rationale behind this work comes from the NEMU project where we're
  trying to only support x86 and ARM 64-bit architectures, without
  including the TCG code base. We can only do so if we can build and run
  ARM binaries with TCG disabled.

v2: https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg03271.html
v3: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg00162.html
v4: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg00312.html
- patches 1-12, 14-17, 19-21 accepted, rebased on target-arm.next
- addressed Peter's comment (described in each patch).
v5:
- patches 1-2 accepted, rebased on target-arm.next
- addressed Peter's comment (broken v4 rebase, patch not building...)

Based-on: target-arm.next
$ git backport-diff -u v3 -r target-arm.next..v5
Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream pat=
ch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respec=
tively

001/1:[0025] [FC] 'target/arm/helper: Move M profile routines to m_helper=
.c'

Thanks a lot to Alex and Peter for their review time, and Samuel for
the original effort.

This single patch is not a 'bugfix', simply code movement.
If it doesn't fit for 4.1-rc0, I'm still glad Peter merged all the
patches from the previous series :_

Regards,

Phil.

[1]: https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg02451.html

Philippe Mathieu-Daud=C3=A9 (1):
  target/arm/helper: Move M profile routines to m_helper.c

 target/arm/Makefile.objs |    1 +
 target/arm/helper.c      | 2638 +------------------------------------
 target/arm/m_helper.c    | 2676 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 2681 insertions(+), 2634 deletions(-)
 create mode 100644 target/arm/m_helper.c

--=20
2.20.1

