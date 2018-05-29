Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3227041wre;
        Mon, 28 May 2018 23:33:22 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL3ZWpiXKvwfQn/Dlbnf86sWaOWZqBdLzmAclukSmsUCwlQW1aCEQN0bVCSdgpwiUkQ89ph
X-Received: by 2002:a37:9f0b:: with SMTP id i11-v6mr13828204qke.171.1527575602725;
        Mon, 28 May 2018 23:33:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527575602; cv=none;
        d=google.com; s=arc-20160816;
        b=PsgcbcMs+lrmhSU+11kpZ7YUb07dnbGtFGZd/NBLaYZiG6I3Z+T/XLqvz/IIcg41hc
         c2lSrDO7O+Y92C5ybxJVEBXNpsaIfqSdi65ovIYuawTl7IzuoaMqAYSpokheBrojwq5g
         N8M46xmvPtDGOzgej7q8ogCaLzumDqfJNrSOLlSbTAxfI8ihjZCuAKYGP1VPShIAdhc2
         PMjdibZXRvpCaB8qnzXSLUb6XZrYZKooBIbuGNmtGgOv7f5WWQzJApYfRtrhhKyHM559
         FO6M5l0XwaMqcJpy43h47leW+5fTxyD/C+2zqchHFW4IU8yL6P4HZdXOHjlqFVtHvFZ5
         r1/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=TsFHY4re0kfFNdXwJQzcAfMbXzL4mmLhMVTC2rR3euY=;
        b=KyGnZuDu+1cnZb/njZ0VPueeLVaNYdeLof9oUvsOUvTbzsuUZ4EBlLs5Gh9wdmN226
         JGWQidh/cZsYepeQDgngCyrvWWgUuCfDhhHrv0Nk3A6bCObGxUx2hViqJtvSkufAFR7e
         /ShIPWvL1OjF5OjGmpvgu1hSh+tyteYi3F4SiDYUeTTmiySPHUM8ErvCapJIeBAlWZ1X
         hkOzm0xFnP/tznutF5fD0TjrkwMboy83N+thW54A26eECt2k2olDzH0mZGIDgQGV2mXU
         uedR4nw1pBAXuS8zIHGC1n2DCET/46vL8Hge/XwcvNHqDl7fTKdsiIWTSU6t5PXTijZ+
         Ogxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o6-v6si2314705qkl.124.2018.05.28.23.33.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 23:33:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59220 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNYCA-00047n-5u
	for alex.bennee@linaro.org; Tue, 29 May 2018 02:33:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36778)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNY8K-0001cF-57
	for qemu-devel@nongnu.org; Tue, 29 May 2018 02:29:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNY8H-0001it-1A
	for qemu-devel@nongnu.org; Tue, 29 May 2018 02:29:24 -0400
Received: from 17.mo6.mail-out.ovh.net ([46.105.36.150]:59573)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fNY8G-0001hw-RM
	for qemu-devel@nongnu.org; Tue, 29 May 2018 02:29:20 -0400
Received: from player718.ha.ovh.net (unknown [10.109.120.102])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id EFC8215ED2C
	for <qemu-devel@nongnu.org>; Tue, 29 May 2018 08:29:18 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player718.ha.ovh.net (Postfix) with ESMTPSA id 5EC8F4E00A8;
	Tue, 29 May 2018 08:29:13 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Date: Tue, 29 May 2018 08:28:38 +0200
Message-Id: <20180529062838.20556-7-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180529062838.20556-1-clg@kaod.org>
References: <20180529062838.20556-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 17527446800400747440
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrheejgddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.36.150
Subject: [Qemu-devel] [PATCH 6/6] slirp/ncsi: add checksum support
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
X-TUID: oAgXlxINByMy

The checksum field of a NC-SI packet contains a value that may be
included in each command and response. The verification is optional
but the Linux driver does so when a non-zero value is provided. Let's
extend the model to compute the checksum value and exercise a little
more the Linux driver.

See section "8.2.2.3 - 2's Complement Checksum Compensation" in the
Network Controller Sideband Interface (NC-SI) Specification for more
details.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 slirp/ncsi.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/slirp/ncsi.c b/slirp/ncsi.c
index f00253641ea4..fbfb79713f23 100644
--- a/slirp/ncsi.c
+++ b/slirp/ncsi.c
@@ -8,9 +8,23 @@
  */
 #include "qemu/osdep.h"
 #include "slirp.h"
+#include "net/checksum.h"
=20
 #include "ncsi-pkt.h"
=20
+static uint32_t ncsi_calculate_checksum(unsigned char *data, int len)
+{
+    uint32_t checksum =3D 0;
+    int i;
+
+    for (i =3D 0; i < len; i +=3D 2) {
+        checksum +=3D (((uint32_t)data[i] << 8) | data[i + 1]);
+    }
+
+    checksum =3D (~checksum + 1);
+    return checksum;
+}
+
 /* Get Capabilities */
 static int ncsi_rsp_handler_gc(struct ncsi_rsp_pkt_hdr *rnh)
 {
@@ -108,6 +122,9 @@ void ncsi_input(Slirp *slirp, const uint8_t *pkt, int=
 pkt_len)
         (ncsi_reply + ETH_HLEN);
     const struct ncsi_rsp_handler *handler =3D NULL;
     int i;
+    int ncsi_rsp_len =3D sizeof(*nh);
+    uint32_t checksum;
+    uint32_t *pchecksum;
=20
     memset(ncsi_reply, 0, sizeof(ncsi_reply));
=20
@@ -137,15 +154,19 @@ void ncsi_input(Slirp *slirp, const uint8_t *pkt, i=
nt pkt_len)
             /* TODO: handle errors */
             handler->handler(rnh);
         }
+        ncsi_rsp_len +=3D handler->payload;
     } else {
         rnh->common.length =3D 0;
         rnh->code          =3D htons(NCSI_PKT_RSP_C_UNAVAILABLE);
         rnh->reason        =3D htons(NCSI_PKT_RSP_R_UNKNOWN);
     }
=20
-    /* TODO: add a checksum at the end of the frame but the specs
-     * allows it to be zero */
+    /* add a checksum at the end of the frame (the specs allows it to
+     * be zero */
+    checksum =3D ncsi_calculate_checksum((unsigned char *) rnh, ncsi_rsp=
_len);
+    pchecksum =3D (uint32_t *)((void *) rnh + ncsi_rsp_len);
+    *pchecksum =3D htonl(checksum);
+    ncsi_rsp_len +=3D 4;
=20
-    slirp_output(slirp->opaque, ncsi_reply, ETH_HLEN + sizeof(*nh) +
-                 (handler ? handler->payload : 0) + 4);
+    slirp_output(slirp->opaque, ncsi_reply, ETH_HLEN + ncsi_rsp_len);
 }
--=20
2.13.6

