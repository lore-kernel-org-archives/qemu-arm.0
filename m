Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3539396wru;
        Fri, 5 Jul 2019 13:42:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwuPt83vUx00OSojzmFLgSeumlUNKK3dhJERXh5tVtBJceAdirKwWSjpPK7g3RY8+zdTYl9
X-Received: by 2002:a17:906:3919:: with SMTP id f25mr5189865eje.243.1562359337665;
        Fri, 05 Jul 2019 13:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562359337; cv=none;
        d=google.com; s=arc-20160816;
        b=hAKOfrSb2oy+CHAa8cMlLYWoScQp6HlBqFvhLS7kSpBnPM7GFD8rk1+MDjA3nNQow5
         z7eb556O13LKstxGiQwKPEdLdPj2PCa4W+mVukiLIg/gsCWPzLcSCIIcgt3m43KuLMdp
         pB507CEtDKLaCe3lE6iHDnDu4lsOPCD+T2NrYqQeCCT556dLtmCHbFdS0nWzC1PiFApH
         TK6XLVuJ4v4EnHUZm3IMDy5s7VgVI8YQ+EH3GgbffIrOGKVFofPENl7JNzlVgW2HGmcG
         NNXQMglnNvWu7leLpffOF+AL0AxajMzJF6sp9iNG8773C7IhuDwfc/a70jsKBVn45NNg
         LODA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=WDfyBWGjTIiHieU49T1dM/xlEQcg1PAHvGsO8Oj4FmI=;
        b=QYQDgAw+dllkHHmgLAnuihkgWAQYlBDcmaytQG5eJrXjALLV1IXqFXRXCkzsoRhm9j
         7qtH8SDlMoRBva46pXFVtxFswBMj9q1cbiBzmxm3IubTgho+wrvD9x/AqaEeJx6HWIjX
         2bI0l4DljQ9rBYduSV8SlUt894Ql6gS4Fn79Vc+J4Bzcetb9g+ipt59IG6DuJvrWEGtd
         HxpkFRFXUOEARQkSqqZNM75hUyA3ZoyYZ0AXkW/kFeipgDACfpUOXFD2Sl1tVX95PBvu
         zMrHzYPElnLMbNGSSDguuD6TCJCM/fuV6Z2O/Qp8jxL7ZBFKy9NCNdSj6HDccAiwusk5
         4AaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6si6471497ejb.271.2019.07.05.13.42.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jul 2019 13:42:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hjV28-0006K4-NV
	for alex.bennee@linaro.org; Fri, 05 Jul 2019 16:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34640)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hjUlq-0005zJ-Ft
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 16:25:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hjUlp-0004Pz-Gh
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 16:25:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60326)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hjUlp-0004Ak-9O; Fri, 05 Jul 2019 16:25:25 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 54AECC01F28C;
 Fri,  5 Jul 2019 20:25:17 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-45.brq.redhat.com [10.40.204.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1340C1969A;
 Fri,  5 Jul 2019 20:25:14 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  5 Jul 2019 22:25:00 +0200
Message-Id: <20190705202500.18853-4-philmd@redhat.com>
In-Reply-To: <20190705202500.18853-1-philmd@redhat.com>
References: <20190705202500.18853-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Fri, 05 Jul 2019 20:25:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC PATCH-for-4.1 v4 3/3] hw/ssi/xilinx_spips: Avoid
 out-of-bound access to lqspi_buf[]
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
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Prasad J Pandit <ppandit@redhat.com>, Lei Sun <slei.casper@gmail.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fednYyFGhyZb

Both lqspi_read() and lqspi_load_cache() expect a 32-bit
aligned address.

Set MemoryRegionOps.impl values to force 32-bit accesses,
this way we are sure we do not access the lqspi_buf[] array
out of bound.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Late friday patch...

 hw/ssi/xilinx_spips.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index 3c4e8365ee..8f705132a3 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -1243,6 +1243,10 @@ static const MemoryRegionOps lqspi_ops =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 4
     }
+    .impl =3D {
+        .min_access_size =3D 4,
+        .max_access_size =3D 4,
+    }
 };
=20
 static void xilinx_spips_realize(DeviceState *dev, Error **errp)
--=20
2.20.1

