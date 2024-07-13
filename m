Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp1417421nji;
        Sat, 13 Jul 2024 09:37:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWL5DxFNS9ARQKfw4TkQKvZFhnKdfqd4bPRdE6Mz0uetWb0hD8pUpdeeD61h+UL6pn3a40flQRQRFzGazbQ2m9mu5L4ZMcb
X-Google-Smtp-Source: AGHT+IHDO83X640qrWizNXH9uucLjl0hEQ4k+ZaptaxRSWMjIUK1XEMUnbI9RVTRG6TkPK+xuP0j
X-Received: by 2002:a05:6214:c2f:b0:6b0:71c0:cbaa with SMTP id 6a1803df08f44-6b61bf1b857mr186376456d6.33.1720888624893;
        Sat, 13 Jul 2024 09:37:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720888624; cv=none;
        d=google.com; s=arc-20160816;
        b=kHpqftiA2GlDJK75bhvwt4L3r/mYT7KlU92Qj5Hp6zAybZFOKU1bHhqvNrYfcnq80S
         z2gVGYx15yCL/Gq37tX3bHfs3nngXGdh3/L3vfmG1kqYInv5O8ZRiFKxnMW8RIDVc37T
         AkFr9cQwKiiE+JlEv06c7R+nPyP5ZIY2iRfGbfQ6/q3UyaMXIQbiyW3x9J6QRbdzfOng
         OY/vIbZzkidkTWmS8X/5XwF1qL5mh1fpJjcd9rV/Q7wqQTk50moDuFYBCaLP6PHeB+EV
         45vZMyppSKhLAwoD3EYBo3kbeuWH3efqhenwsEj8j26RFyyr5eeWPRPXAt+Yb/Q5rTod
         MnxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Pm4YVouzr7AEZLWE6riErvbFYoXYD6jFvtrjxHqNMOI=;
        fh=OVv0TQVgZQ7NBZ/5F32PK1vSCylh7jFiurnXoShHZRA=;
        b=IpAgmuPMebrdZxpY/norgoAko4urw7/JW/bGyq1k7jxtg2ohkQG45dz8ydW1pwp9S5
         kHYkozI3uO6ne+578fP9+ozkkRB9biA5f9XwwdyPQNXAHbia8QWCnKej/QVhN2jeQDXC
         kyyjn0mPTG4Ztc4qLkTseq7v9vGtNdkKD88bZqZjpSB2CvmqBLAsHCJi6QIxZI+Rtpz4
         dHEf+iwoGb0APngR5HFHwXjuxx1b35gDUHv6/quZ8NnLGP0bgATlIE7z7Sql84ITSgL8
         OtaWDqUMY3m+toyiiXLI/BQ1t8tOSMPvbgTm9olGueITjJ8oiUsFaSL3qGUkEQNhQam/
         NRAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@samjakob.com header.s=sig1 header.b=jyWQkUnO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=samjakob.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b761a11d76si15333636d6.319.2024.07.13.09.37.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Jul 2024 09:37:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@samjakob.com header.s=sig1 header.b=jyWQkUnO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=samjakob.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sSfju-00083N-1i; Sat, 13 Jul 2024 12:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@samjakob.com>) id 1sSfED-000065-Hi
 for qemu-arm@nongnu.org; Sat, 13 Jul 2024 12:04:07 -0400
Received: from qs51p00im-qukt01071502.me.com ([17.57.155.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@samjakob.com>) id 1sSfEA-00063Q-I7
 for qemu-arm@nongnu.org; Sat, 13 Jul 2024 12:04:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samjakob.com;
 s=sig1; t=1720886641;
 bh=Pm4YVouzr7AEZLWE6riErvbFYoXYD6jFvtrjxHqNMOI=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=jyWQkUnOVgkRs/Hv25WELvTi3CH+ddNz3ZV2IsiBKUJmYw7eullQcTQ5pGlgEw6EI
 w2kB/nY3xTZoudfeLlu8zgTYzRFrAF4EP45oN6CcrFSOBV/T334M+6ZEmD45LR+1v9
 Ql+PUHE72t95bVIwVZAG3vwuh1frXlOCIbIU3zASWA5T0zvMHKOKHlJN4D6bg+PMLx
 A2KuKJwD2KGHavQGM0ce8vnCmcjOfqQaAcKNN2p8yJDjT8N2Ntjk4PpdKaUIJjG5TU
 lw8spf/AGMs4d2Zgr9Y6N8c7l3pcAmoK26rG4w96SeRLxxspMvHYvxyoFyJaSmK3Nz
 OJ+6BYXDhmAiw==
Received: from localhost.localdomain (qs51p00im-dlb-asmtp-mailmevip.me.com
 [17.57.155.28])
 by qs51p00im-qukt01071502.me.com (Postfix) with ESMTPSA id D49E366803DD;
 Sat, 13 Jul 2024 16:03:58 +0000 (UTC)
From: SamJakob <me@samjakob.com>
To: qemu-trivial@nongnu.org
Cc: SamJakob <me@samjakob.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org (open list:Raspberry Pi),
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH] hw/display/bcm2835_fb: fix fb_use_offsets condition
Date: Sat, 13 Jul 2024 17:03:53 +0100
Message-ID: <20240713160353.62410-1-me@samjakob.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: InkTY5WYpDk3oIvHETJFkySVMkg9Ba05
X-Proofpoint-ORIG-GUID: InkTY5WYpDk3oIvHETJFkySVMkg9Ba05
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_12,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 adultscore=0
 mlxlogscore=903 mlxscore=0 malwarescore=0 clxscore=1030 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2407130120
Received-SPF: pass client-ip=17.57.155.5; envelope-from=me@samjakob.com;
 helo=qs51p00im-qukt01071502.me.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 13 Jul 2024 12:36:49 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: oqVy0nhZ+wc8

	It is common practice when implementing double-buffering
	on VideoCore to do so by multiplying the height of the
	virtual buffer by the number of virtual screens desired
	(i.e., two - in the case of double-bufferring).

	At present, this won't work in QEMU because the logic in
	fb_use_offsets require that both the virtual width and
	height exceed their physical counterparts.

	This appears to be unintentional/a typo and indeed the
	comment states; "Experimentally, the hardware seems to
	do this only if the viewport size is larger than the
	physical screen". The viewport/virtual size would be
	larger than the physical size if either virtual dimension
	were larger than their physical counterparts and not
	necessarily both.

Signed-off-by: SamJakob <me@samjakob.com>
---
 hw/display/bcm2835_fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index e40ed2d2e1..650db3da82 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -145,7 +145,7 @@ static bool fb_use_offsets(BCM2835FBConfig *config)
      * viewport size is larger than the physical screen. (It doesn't
      * prevent the guest setting this silly viewport setting, though...)
      */
-    return config->xres_virtual > config->xres &&
+    return config->xres_virtual > config->xres ||
         config->yres_virtual > config->yres;
 }
 
-- 
2.45.2

