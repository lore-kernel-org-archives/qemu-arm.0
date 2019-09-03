Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp338464wrp;
        Tue, 3 Sep 2019 04:47:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzX7PWnJoQ4uLBOhHmeJVEIlTQteW0r2Iml/I6BkS+QWQSJ7yRCa5HDgeKkiYjrDIu177ni
X-Received: by 2002:a0c:f6ce:: with SMTP id d14mr21442140qvo.56.1567511277434;
        Tue, 03 Sep 2019 04:47:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567511277; cv=none;
        d=google.com; s=arc-20160816;
        b=hJqICZ2TjXQhOjryZv0rn9s6i5YoSbTL2QxMbewV3TaA1XYlo52s287KZ50/DsYEt4
         /YdPDAW8baR4ygJQEZmySGITumyQgXoQik7SZFeUebWbVCY6mmQbhkFUR6fygxUCsr7c
         8erHIELfV8hc0UfjoXPc4XG/tMzRPiFd88x4tX0FUIFwhJNcU/UE/42TzNU24QaasDKg
         aIX3Pv5fHvexupdKvy0A32y6nMKnkLZ/4J9K3JdVXzKGc+B9xtTgrSs/ByHyH2PzYjR6
         QxU7Ouh18Sz2Jw7rtzxFOU7NAw+nZ3Pk+LsqZJFHueQ05n0/QJd8caEpUJ5W05/QLLyu
         PQiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=G8qWVj7k6DyL2dvpbncmUVpaAutginhj5v7LOy3R5EE=;
        b=WTekX7YL1ZVVmKcwnTFdmBR2EOeIpHaH8Us9UaUD3smvVdpbZFHSfxjcJbr3Zcs7xL
         +tueNlrd/uO0avWCIuCFG5YqARXvOJdWZfrQ8TAwtfTHZieC8pKE25XXz8QFUSNWMsYf
         jXPSjb7V6Qhdzz0B7pC1yR+6+90oONsdYEQmfSayB1JR6Tkf9H1h6gfd1LZcTmhOBS6U
         2doSapXknIF0nz0iM0tB5kaHSnJjJKTowo8xlggm3ul/eGIZqbax+mU1qmzx1lm47tiP
         VVAy2UoP+87v2Ly2j1jezhWPCKbZs3poZt4FlgdM47HAWJDQCIODRvry3fhm0hbZUqeh
         QKbA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g27si4400196qkl.318.2019.09.03.04.47.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2019 04:47:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i57Hv-0004ww-RR
	for alex.bennee@linaro.org; Tue, 03 Sep 2019 07:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55018)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i57Hf-0004ue-MV
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 07:47:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i57He-0005rO-Kj
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 07:47:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59624)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1i57He-0005r1-G1; Tue, 03 Sep 2019 07:47:38 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CCE29800DE4;
 Tue,  3 Sep 2019 11:47:37 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-102.brq.redhat.com [10.40.204.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 732865DAAC;
 Tue,  3 Sep 2019 11:47:32 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  3 Sep 2019 13:47:24 +0200
Message-Id: <20190903114729.3400-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Tue, 03 Sep 2019 11:47:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 0/5] Support disabling TCG on ARM (part 2)
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z2HC+FeM/bhH

Cover from Samuel Ortiz from (part 1) [1]:

  This patchset allows for building and running ARM targets with TCG
  disabled. [...]

  The rationale behind this work comes from the NEMU project where we're
  trying to only support x86 and ARM 64-bit architectures, without
  including the TCG code base. We can only do so if we can build and run
  ARM binaries with TCG disabled.

A preliminary patch expose the CONFIG_TCG to Kconfig.
2 patches disable non-KVM compatible cpus to the KVM build,
then 2 remove the boards using these cpus from this build.

v2: Addressed review comments from Richard and Thomas from v1 [2]
    (see comments in each patch).

Regards,

Phil.

[1]: https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg02451.html
[2]: https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg05003.html

Philippe Mathieu-Daud=C3=A9 (5):
  Kconfig: Expose CONFIG_TCG to minikconf.py
  target/arm: Restrict pre-ARMv7 cpus to TCG
  hw/arm: Restrict pre-ARMv7 cpus to TCG
  target/arm: Restrict R and M profiles to TCG
  hw/arm: Restrict R and M profiles to TCG

 Kconfig.host     |  4 ++++
 hw/arm/Kconfig   | 37 ++++++++++++++++++++++++++++++++++---
 target/arm/cpu.c | 16 +++++++++++++++-
 3 files changed, 53 insertions(+), 4 deletions(-)

--=20
2.20.1

