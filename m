Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp2371786wrm;
        Thu, 10 Oct 2019 06:23:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxc4J+xmhvCVwT24yDcaDSfQbcASrC7yfyZHUgHwLxpZhmNilVyHoGqGzTQcpvdQZFgGoSi
X-Received: by 2002:ac8:705c:: with SMTP id y28mr10606716qtm.52.1570713837043;
        Thu, 10 Oct 2019 06:23:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570713837; cv=none;
        d=google.com; s=arc-20160816;
        b=DuNnQrqeFC4ddnqjvTqCJ88dicUq6Npb+UanEDvOtYQsO7qQzazZT+kgoOiOz+lDnO
         B9ZGJ/t6WG68XbSpeXOVNlLUXY2VdSU2bmJFaGFZawx23DCryzHbc5a8EaKwa3vxD/Vf
         4G2DEyI39LoLP3tLssqmQgOIWPoMAM5do4z6GpnV9lGH0UkgfhzBaK53x8SzGveOhvRL
         66IdsQI8XetLGZBSwUE9ew/HG4O6Mz3cpjagI3uXjUPyaiUxtkYhs6rmAz0qrVJplWfJ
         ChCYwbFKzAs+rXzz/5gOaU5dhmWvPA+4a/2Nsa45nQtcc5CxXfw+AJ5xAeV/In2EOQFU
         dDIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=g1CN3Ljl2ur4lmUrkVTih6yiU8zw+/IHSEn1ij5C+js=;
        b=gu1wRM9DmyCTmXO/DH74aILBQzVdG2Q9jCZCOqO5knvHAMfCiLsd3dVwgyrgd7IQNt
         5sxa3/ZGXosWn1zwIlsP0f04M0yFDNPCLNXiz72tFlozSiKy8VcOHH+qU31U6LNaz/zL
         sellQI6xG1E64HDRq4hLOjFRa02E6hI0k24NeQH1cFKpyZfSrcO0HRElhQ4ns/eAc0ye
         2/jBFcVJ71jr5gmoIPEZGLMTJU4bXeEHd+FgP6sW5ztbH44xEGWIyHSXYlEb7+jPhCxR
         ydH6mzGTZGhO7QYAPFfAEi+8UuxDwyyNhOLPm6Mz5NoIF5B4mQsgsUEBdgBJH21Gr36c
         OH+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i21si5971160qkg.155.2019.10.10.06.23.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Oct 2019 06:23:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIYQ8-00089N-1W
	for alex.bennee@linaro.org; Thu, 10 Oct 2019 09:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40864)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iIYKW-0001qf-EW
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 09:18:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iIYKV-0002lA-Ce
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 09:18:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46904)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iIYKD-0002c3-DV; Thu, 10 Oct 2019 09:17:49 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 35F26307D847;
 Thu, 10 Oct 2019 13:17:44 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9641A600C4;
 Thu, 10 Oct 2019 13:17:28 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 8/8] hw/misc/vmcoreinfo: Add comment about reset handler
Date: Thu, 10 Oct 2019 15:15:27 +0200
Message-Id: <20191010131527.32513-9-philmd@redhat.com>
In-Reply-To: <20191010131527.32513-1-philmd@redhat.com>
References: <20191010131527.32513-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 10 Oct 2019 13:17:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I2dNKRPQU521

The VM coreinfo device does not sit on a bus, so it won't be
reset automatically. This is why it calls qemu_register_reset().

Add a comment about it, so we don't convert its reset handler
to a DeviceReset method.

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/misc/vmcoreinfo.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/misc/vmcoreinfo.c b/hw/misc/vmcoreinfo.c
index 326a3ce8f4..a9d718fc23 100644
--- a/hw/misc/vmcoreinfo.c
+++ b/hw/misc/vmcoreinfo.c
@@ -61,6 +61,10 @@ static void vmcoreinfo_realize(DeviceState *dev, Error=
 **errp)
                              NULL, fw_cfg_vmci_write, s,
                              &s->vmcoreinfo, sizeof(s->vmcoreinfo), fals=
e);
=20
+    /*
+     * This device requires to register a global reset because it is
+     * not plugged to a bus (which, as its QOM parent, would reset it).
+     */
     qemu_register_reset(vmcoreinfo_reset, dev);
     vmcoreinfo_state =3D s;
 }
--=20
2.21.0

