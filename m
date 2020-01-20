Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp11563lfp;
        Mon, 20 Jan 2020 02:11:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqzikfksKYiBCP5J9HIRijLhWJmkROxdM1syJf0F++NDkhljUKha6RbIuFlHLpGgbAhpOYpo
X-Received: by 2002:a05:620a:13da:: with SMTP id g26mr51781337qkl.410.1579515069703;
        Mon, 20 Jan 2020 02:11:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579515069; cv=none;
        d=google.com; s=arc-20160816;
        b=BRlVq5uedD2n0xiHOsJTqPuC4bKQn2N2ekGW3t0Mela7h6i/jCV2oKTw0CUOrvWgVb
         eLCBW/+xE7sDvCbbAVxnx1/oda0EHzEyoJvNpN0RUbhx9RBBVJZTCRqtYq3SnFkLT2l6
         imWTRz7Bb/SRbMz0Rrs3qra0MefcFxx/35NGBT+dLRHnMJDHc9/NDvtWt/whbw95WQRB
         WHNs0eHszKS6QTHkSFTaFHFf4sEUf2BWXaIWyEagdzet6LVj/yEORF1qeExSfJysJhpY
         ftQqH5xqUSqHbKJTy+HAoFfTkfZ8Am1iYGJkIGZtNOXCjQMkSWnARQJMGgXeXT25gUOP
         H4wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=F/+XJ49Tu7dfw8704LCB/a5N8PyvmwGwcwpzwkOaIEw=;
        b=wus1JzlUO4viLdRqppz6WChQhbnew0SpR4b2a+HxMbFNFVkABK47KxUo5L1RBWSEnR
         j+43d+rN6Ok/nxpo2aUYO/dgWzKFJ1OxsPGTcyBQ1MX/tQW2n7UAQF/G6xJLv9bRFEQD
         2SZdaBVJmuIBdUnSxHzs6rGTT61wTCV6Dchf7bVRdVV/ZatgTGFfZtXKh78b8GtPsVxm
         KqnARUOh2mJMg+p+6E9tT184Xy71pHgbMcMLZw1OP1CfNt4+CcD+XW7DjnqJjKdw+eTB
         DjZKpiiBc8BwhvLDne0QG14DZIrjBn+9fhm2dajvTyDV1qL9hDjCe7d2Gchu1r3bVZ42
         NScA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="YVn/wPA6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z68si20688128qkc.141.2020.01.20.02.11.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 02:11:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="YVn/wPA6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itU1U-0005i2-JW
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 05:11:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33989)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1itU13-0005Sl-Ok
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 05:10:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1itU0y-000341-W5
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 05:10:41 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:45561
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1itU0y-00033n-S2
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 05:10:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579515036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F/+XJ49Tu7dfw8704LCB/a5N8PyvmwGwcwpzwkOaIEw=;
 b=YVn/wPA6QvL3TqP04tfwXLc5T5Zyztiz1X/AyuWe4hM50Hesoxbabz9wnvnHWLtr0NfRYy
 RDcW/7rPXACbCZRMvEb37SJIsCQl8bDpeYkF7/fp3rbXxxHysGcHsba/V1hFZ8t5/W650T
 yDIWIfmtFdsXBirGlo6X7NOXFTnmRf8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-RQQpDBMSPtyfaDebCJnTtw-1; Mon, 20 Jan 2020 05:10:32 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 050C0A0CBF;
 Mon, 20 Jan 2020 10:10:31 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 379BF87EDF;
 Mon, 20 Jan 2020 10:10:29 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [RFC PATCH v3 2/6] hw/arm/virt: Add missing 5.0 options call to 4.2
 options
Date: Mon, 20 Jan 2020 11:10:19 +0100
Message-Id: <20200120101023.16030-3-drjones@redhat.com>
In-Reply-To: <20200120101023.16030-1-drjones@redhat.com>
References: <20200120101023.16030-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: RQQpDBMSPtyfaDebCJnTtw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: peter.maydell@linaro.org, bijan.mottahedeh@oracle.com, maz@kernel.org,
 richard.henderson@linaro.org, guoheyi@huawei.com, msys.mizuma@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Sq/lruAAnggN

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 39ab5f47e0bd..27ca26b05e27 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2153,6 +2153,7 @@ DEFINE_VIRT_MACHINE_AS_LATEST(5, 0)
=20
 static void virt_machine_4_2_options(MachineClass *mc)
 {
+    virt_machine_5_0_options(mc);
     compat_props_add(mc->compat_props, hw_compat_4_2, hw_compat_4_2_len);
 }
 DEFINE_VIRT_MACHINE(4, 2)
--=20
2.21.1

