Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3224183wre;
        Mon, 28 May 2018 23:29:46 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLdaP4dBLPfDZQZo6wYoIXvxJFHahsZHlu7G6CxFiPtIjtVL2gCxIPj2OqZ4NobYd01akw6
X-Received: by 2002:a0c:e849:: with SMTP id l9-v6mr14854365qvo.55.1527575385936;
        Mon, 28 May 2018 23:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527575385; cv=none;
        d=google.com; s=arc-20160816;
        b=JtEBfzGqs7LYGils/PuspvHyQqaWD2OTrRAzxftOsOIe/yz7w4oWKNTRqiQdLfw25F
         7DymTX7XkIEiTAiT23jFN43fsJ/BTzlSp1UAQrWKEkCA9I0G+2MYzZ4vkzuSYCrKzhnF
         dk56iM6f01nKcHb/1Ha+G6nNZUlEyTUpBKW/rRqHohm7VdolHX9j2M4wGp52dyS8aiMr
         JUeALgh2iSwcZlQKh6wO+HPmrzTAweEW0CTudAHHAgmgZkieATqDH68/WIzDd6eYFzpO
         C3bkSrExdL+s4jT7zIBXEh4Ws16njyoDoBsxYz6C2qWkfqC6E3fmFfJCkqjcB0cxa6rS
         Kwrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=9DBuCJjd4utVBzTIZnBJ4U1VL5a4gQExCvpwYodUSM0=;
        b=qU5BRkfCBwFpRJR71RAM65LlblrfDMBPDNVYl/vQsa6wGVJeKwm/GhHoD/qYx5oreL
         rxpxlN+ZwAPJmgjfi4sHUC90oOn8/gUS0BTKN4UaU5OiR91PbG2qaeD6Q6ZH0qob7Ip3
         kdkiqe2wq3Ohka8oM8EhuKoXvfCBTy/dVTxwdV8JZ27JkqcyqudTxMuqiZWBa7CYl+WJ
         i8Qjt11Fd86Cc45FAbEoqhD4wZs/eKxLx5oXQ5u3Q4xDDFXYjpHCPWywp2PO7nn4EnYC
         gJRf1BEifleDH7TMg8Ryv61CB5cOO52w6Hb//JwP28o1GL6+/mD+eImfqmoO0A2qzqso
         rJlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m20-v6si3941278qvl.46.2018.05.28.23.29.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 23:29:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59197 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNY8f-0001Qm-Ea
	for alex.bennee@linaro.org; Tue, 29 May 2018 02:29:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNY83-0001Mh-TA
	for qemu-devel@nongnu.org; Tue, 29 May 2018 02:29:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNY80-0001Wv-Kc
	for qemu-devel@nongnu.org; Tue, 29 May 2018 02:29:07 -0400
Received: from 7.mo2.mail-out.ovh.net ([188.165.48.182]:38675)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fNY80-0001WB-EM
	for qemu-devel@nongnu.org; Tue, 29 May 2018 02:29:04 -0400
Received: from player718.ha.ovh.net (unknown [10.109.108.63])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id 08BE7139F68
	for <qemu-devel@nongnu.org>; Tue, 29 May 2018 08:29:02 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player718.ha.ovh.net (Postfix) with ESMTPSA id AF1B84E0087;
	Tue, 29 May 2018 08:28:57 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Date: Tue, 29 May 2018 08:28:35 +0200
Message-Id: <20180529062838.20556-4-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180529062838.20556-1-clg@kaod.org>
References: <20180529062838.20556-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 17522943200272550832
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrheejgddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.48.182
Subject: [Qemu-devel] [PATCH 3/6] net/ftgmac100: fix multicast hash routine
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
X-TUID: YSOjcghlparD

Based on the multicast hash calculation of the FTGMAC100 Linux driver.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/net/ftgmac100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 50af1222464a..fd7699b1c05e 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -778,8 +778,8 @@ static int ftgmac100_filter(FTGMAC100State *s, const =
uint8_t *buf, size_t len)
                 return 0;
             }
=20
-            /* TODO: this does not seem to work for ftgmac100 */
-            mcast_idx =3D net_crc32(buf, ETH_ALEN) >> 26;
+            mcast_idx =3D net_crc32_le(buf, ETH_ALEN);
+            mcast_idx =3D (~(mcast_idx >> 2)) & 0x3f;
             if (!(s->math[mcast_idx / 32] & (1 << (mcast_idx % 32)))) {
                 return 0;
             }
--=20
2.13.6

