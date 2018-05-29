Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3226030wre;
        Mon, 28 May 2018 23:32:04 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIkdXrxmBcFLvjEjXQzKr6XMOwV2m0ACorCyRQh6bpoJFWm6snMAywW4+8xisXKE3nZJmh0
X-Received: by 2002:a37:29dd:: with SMTP id p90-v6mr13886303qkp.390.1527575523957;
        Mon, 28 May 2018 23:32:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527575523; cv=none;
        d=google.com; s=arc-20160816;
        b=o3dru8w3xPS+oXn23ZwePUr9zEszCAvvgrVkKcIGbdnpq0I1NPWHmKdc/EtP8JKRmH
         WU9NUoglcd6naG5Absd3LhN47bpDvDLdzgUhJ6RLz4MxV5IL1pw/Z5SNtGVXQ9OwmD0V
         noFEp2IrWFS2BRJmhFDxy1hJm9x0Va5XZAJxPE7XN9zfpQ3dYJGHkUDpKUrsDRWqVVQm
         mGctdCRgPPsXE5FbP1q6JDYRhlTorYqKhRql+/9jKFwMNt7EJgw+eKeIRDv9NSUFN36F
         54xIn4KCl6VB7/5GE77zEsQEm1mIsjC1+X4l7/OyIs6fWbHev0/OcPnWXWZvPW6n8pH1
         zSHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=WdFyAJVJ117KFRFO6/rbUqfVIv2RynOvdr5LYTLsZAU=;
        b=ZD5D0/iQziTNblKvzvOv8JCriUzAgSZ/0NusNIxHfhDCq/whxbjqlcE7d4uBuc3Eda
         FHdw5q2SnTnysJXtnywsB9ByvCPzKps0m5RlspbleMWzFzfSV9nnafGUKH7gVpfEApvR
         m/ZKgHx9BNfxJECA1G9VQ1D1llyj9tzoZlDAId1aqDjR2EiWIvcwwNZE9ZbpgrwnKMWU
         Y3Ysd173hTlZQQAvo8hRVbIwLFFZEyCvEx/s0XPs0IYGu9Ofxcy41at1F9CEMlc9w/hB
         DdvU89Eu8mYEStzUvPdCwAEumXT34ak19U7xsLYYyXgpycDdAGiqhJ0rae6L5U6ca4Vr
         c26A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u47-v6si3489271qte.196.2018.05.28.23.32.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 23:32:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59209 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNYAt-0002qm-CV
	for alex.bennee@linaro.org; Tue, 29 May 2018 02:32:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36635)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNY89-0001SK-M2
	for qemu-devel@nongnu.org; Tue, 29 May 2018 02:29:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNY86-0001c9-I2
	for qemu-devel@nongnu.org; Tue, 29 May 2018 02:29:13 -0400
Received: from 4.mo5.mail-out.ovh.net ([178.33.111.247]:60617)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fNY86-0001bJ-Bw
	for qemu-devel@nongnu.org; Tue, 29 May 2018 02:29:10 -0400
Received: from player718.ha.ovh.net (unknown [10.109.120.118])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 2DC1C1B7377
	for <qemu-devel@nongnu.org>; Tue, 29 May 2018 08:29:08 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player718.ha.ovh.net (Postfix) with ESMTPSA id E35094E0087;
	Tue, 29 May 2018 08:29:02 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Date: Tue, 29 May 2018 08:28:36 +0200
Message-Id: <20180529062838.20556-5-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180529062838.20556-1-clg@kaod.org>
References: <20180529062838.20556-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 17524632052135857072
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrheejgddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.111.247
Subject: [Qemu-devel] [PATCH 4/6] slirp/ncsi: fix "Get Version ID" payload
 length
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
X-TUID: wJQdWmJ4AULy

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 slirp/ncsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/slirp/ncsi.c b/slirp/ncsi.c
index d12ba3e494b0..02d0e9def3e8 100644
--- a/slirp/ncsi.c
+++ b/slirp/ncsi.c
@@ -60,7 +60,7 @@ static const struct ncsi_rsp_handler {
         { NCSI_PKT_RSP_EGMF,    4, NULL },
         { NCSI_PKT_RSP_DGMF,    4, NULL },
         { NCSI_PKT_RSP_SNFC,    4, NULL },
-        { NCSI_PKT_RSP_GVI,    36, NULL },
+        { NCSI_PKT_RSP_GVI,    40, NULL },
         { NCSI_PKT_RSP_GC,     32, ncsi_rsp_handler_gc },
         { NCSI_PKT_RSP_GP,     -1, NULL },
         { NCSI_PKT_RSP_GCPS,  172, NULL },
--=20
2.13.6

