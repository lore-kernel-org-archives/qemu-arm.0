Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1948299lfg;
        Tue, 25 Feb 2020 09:25:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqz/eYRpRPZbk4OgCM/46zoXrJh8mUhSKCu6BOnQNvGJkegd6RWcUnW3+rgCcyUAk40ZMszF
X-Received: by 2002:ac8:709:: with SMTP id g9mr1127578qth.293.1582651520930;
        Tue, 25 Feb 2020 09:25:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582651520; cv=none;
        d=google.com; s=arc-20160816;
        b=TWRyNmtPbV+VZ1RINWH0lF18Jx1lgPk94hPQIxx30xj4Z03w9UQ1PiePeoQale1QcA
         8TxR92/XvbXjzIYOpaPwNMmvcEB/CrG1R8/FKC5Gw27ca+mlLzI0m82FdLhFGl5m9Nqj
         gWva9SYAsct7zMcXIl5Ne+GDLMTVY8+42F4/I+VhvkFQsOg78pfDetyvPQZb+s2XKFtl
         wSL58xG0UHbB/EimPMu/uCwDlkR2DviEKl9S6Uo4IDENRDFM351LVQPaY7Q1x8/bAgav
         pD8u0xvXDiD14JeTXmGAsGAVIsnuZDW7/M5BTT3UbKc6SzX8vHcVv022UuqZaFZCy9ET
         CV2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=TS9KyKrlERvOO59j3lBIH68dy8WcIUr+GR/9yXzAzLc=;
        b=nSWhx1uaeCWqVaaHtOR3uVy3ZFQUw6cymPNaTHqeUDWrNEqpE97aBo5YJQsB1EKTQ1
         qvZkFr2kPoz7S/lr0XRZfEcaDhJSEkpO888I55ibyifL5ba4w/I+dH0Oqke8teaqepJm
         EiBZBs4ccRUuawelAYTCOBXU/NXLCKKBnRebY7Coag3U6NTjTZa5tR+ElkC9ITaWj8Iv
         6FvJSzY1cRa47wBFEsctOJBtq6VcOHvY7x7FDUyieIlId8lq/awa1KBLoSBvHpKCbUm5
         X4ttkDO2lcDYgAR00PRbrNaKc9U8RoziClh2RwvaxKMVD3ZxPhAICfodqXRW2tWk15s7
         0Eow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ZMVkP0j/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3si7552470qtg.196.2020.02.25.09.25.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 09:25:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ZMVkP0j/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6dxQ-0000xi-Bk
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 12:25:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38759)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6dxG-0000vr-I8
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 12:25:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6dxF-0007nk-Ds
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 12:25:10 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:46170
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6dxF-0007mV-9t
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 12:25:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582651508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TS9KyKrlERvOO59j3lBIH68dy8WcIUr+GR/9yXzAzLc=;
 b=ZMVkP0j/jqbEMOb3flGCsOkQ2AN3o06RVJ+4W2prl59jZ/VlJ3Ep3YU52NEhCP3DhGmUZo
 ep012oB8lpm5vpvCENz++ITdWzazsPtL2mIvIaf76wZ7Nyi22tTf04CSW2x9nZnix9usCW
 pp0h1t2uU1Iz/mTiKo95CAOGjLi5qtY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-lhZ6rkQFNaeeJfeOOGn9FQ-1; Tue, 25 Feb 2020 12:25:06 -0500
X-MC-Unique: lhZ6rkQFNaeeJfeOOGn9FQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94838800D53;
 Tue, 25 Feb 2020 17:25:05 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-195.brq.redhat.com [10.40.205.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFC2060C18;
 Tue, 25 Feb 2020 17:25:03 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] tests/acceptance: nSeries and integrator/CP tests
Date: Tue, 25 Feb 2020 18:24:57 +0100
Message-Id: <20200225172501.29609-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrzej Zaborowski <balrogg@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: erCXI8kQHCOY

This series collects patches adding tests for arm machines.
All patches are reviewed.

Philippe Mathieu-Daud=C3=A9 (2):
  tests/acceptance: Extract boot_integratorcp() from test_integratorcp()
  tests/acceptance/integratorcp: Verify Tux is displayed on framebuffer

Thomas Huth (2):
  tests/acceptance: Add a test for the N800 and N810 arm machines
  tests/acceptance: Add a test for the integratorcp arm machine

 MAINTAINERS                                  |  2 +
 tests/acceptance/machine_arm_integratorcp.py | 99 ++++++++++++++++++++
 tests/acceptance/machine_arm_n8x0.py         | 49 ++++++++++
 3 files changed, 150 insertions(+)
 create mode 100644 tests/acceptance/machine_arm_integratorcp.py
 create mode 100644 tests/acceptance/machine_arm_n8x0.py

--=20
2.21.1

