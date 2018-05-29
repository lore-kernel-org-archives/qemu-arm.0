Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3227150wre;
        Mon, 28 May 2018 23:33:31 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKfNfAt5NU5AioEisYCHJLwOY3pYK7jw3O0Ig3dFbcdIUpYlyrRjUdorhO+TzMehlb5qFUB
X-Received: by 2002:ac8:b4d:: with SMTP id m13-v6mr15932098qti.9.1527575611816;
        Mon, 28 May 2018 23:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527575611; cv=none;
        d=google.com; s=arc-20160816;
        b=bpy10B228PIVMLkpuJkCu8/Zne8H5cmJU12CP+7XvSaFw+UQl4Ph3BiPc+CXnpW7kz
         oIEyNOlo5hZrHsx5wSNx2BciWaP4GrfAQnqilqd48/Q8YtUg0BqDZsCiDY7vYkKnmmex
         57Wa7PZGiEKmT2LNqguWf3zmE2He6ZJ726VL5S8NMtVad2a/VIkJSPy+Cc6QWtopX7Aw
         H3VMx7sMJZZm19zVSH0BV1dScAoLR860rg79oHVa2rl1QJQM74gLUjXe99YY/AKi4HHw
         1i8cXJl+ihAR2R+tbKbSJT+rF7IbNkM7ptvFYZw8puEgspJ/8awN70HV3PghhTTS0Zj2
         F6Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=x9eyOx38l5tAwYEwNGq5zzibQsSh32rbtdAVDWk6bBg=;
        b=aGI4L18KdpBGXjBfPa3vgfR5gBUgFi4II1q2mgQ1yuRRIn0qpx84dpx5vfM1QuxPk1
         0aKI6pBgGPkwhAhCqlpT0irZ93SrZsZXdglQ/MGfXePKrel6+bDQBf83GaBYKcPjXMOE
         xb+kyfbAeXWXAfWqCvIRCp3HeeibEt5/2u7HwbNBoCXjDX+ReWmzh1LUE0Vfj9ovBsRF
         In2t5aNf8YcRG/vAz2/er8wI76OD9WF76iP8vf0dXnBQVoAQV8YTxpfkbrqebKHmjy+m
         SvnfIcLuaCfhAFmNFufOW2t/sAoq6qG3udfjiySHhoHIAg3E2cq6lpMcE9K4Yx1OsJjh
         JJpg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x17-v6si83667qvh.260.2018.05.28.23.33.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 23:33:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59223 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNYCJ-0004Cl-6S
	for alex.bennee@linaro.org; Tue, 29 May 2018 02:33:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNY8E-0001U9-AM
	for qemu-devel@nongnu.org; Tue, 29 May 2018 02:29:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNY8B-0001fA-7Y
	for qemu-devel@nongnu.org; Tue, 29 May 2018 02:29:18 -0400
Received: from 6.mo179.mail-out.ovh.net ([46.105.56.76]:40000)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fNY8B-0001eM-1O
	for qemu-devel@nongnu.org; Tue, 29 May 2018 02:29:15 -0400
Received: from player718.ha.ovh.net (unknown [10.109.108.14])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id 6C2DFC8A6D
	for <qemu-devel@nongnu.org>; Tue, 29 May 2018 08:29:13 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player718.ha.ovh.net (Postfix) with ESMTPSA id 2AD5D4E008A;
	Tue, 29 May 2018 08:29:08 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Date: Tue, 29 May 2018 08:28:37 +0200
Message-Id: <20180529062838.20556-6-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180529062838.20556-1-clg@kaod.org>
References: <20180529062838.20556-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 17526039427134753712
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrheejgddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.56.76
Subject: [Qemu-devel] [PATCH 5/6] slirp/ncsi: add a "Get Parameter" response
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ta8z9x7AdpFL

This is a minimum response to exercise the kernel.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 slirp/ncsi.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/slirp/ncsi.c b/slirp/ncsi.c
index 02d0e9def3e8..f00253641ea4 100644
--- a/slirp/ncsi.c
+++ b/slirp/ncsi.c
@@ -35,6 +35,27 @@ static int ncsi_rsp_handler_gls(struct ncsi_rsp_pkt_hd=
r *rnh)
     return 0;
 }
=20
+/* Get Parameter */
+static int ncsi_rsp_handler_gp(struct ncsi_rsp_pkt_hdr *rnh)
+{
+    struct ncsi_rsp_gp_pkt *rsp =3D (struct ncsi_rsp_gp_pkt *) rnh;
+
+    rsp->mac_cnt =3D 0x0;
+    rsp->mac_enable =3D 0x0;
+
+    /* TODO: provide the guest configured MAC */
+    rsp->mac[0] =3D 0xaa;
+    rsp->mac[1] =3D 0xbb;
+    rsp->mac[2] =3D 0xcc;
+    rsp->mac[3] =3D 0xdd;
+    rsp->mac[4] =3D 0xee;
+    rsp->mac[5] =3D 0xff;
+
+    /* more data follows */
+
+    return 0;
+}
+
 static const struct ncsi_rsp_handler {
         unsigned char   type;
         int             payload;
@@ -62,7 +83,7 @@ static const struct ncsi_rsp_handler {
         { NCSI_PKT_RSP_SNFC,    4, NULL },
         { NCSI_PKT_RSP_GVI,    40, NULL },
         { NCSI_PKT_RSP_GC,     32, ncsi_rsp_handler_gc },
-        { NCSI_PKT_RSP_GP,     -1, NULL },
+        { NCSI_PKT_RSP_GP,     40, ncsi_rsp_handler_gp },
         { NCSI_PKT_RSP_GCPS,  172, NULL },
         { NCSI_PKT_RSP_GNS,   172, NULL },
         { NCSI_PKT_RSP_GNPTS, 172, NULL },
--=20
2.13.6

