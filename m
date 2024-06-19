Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp1295150ejb;
        Wed, 19 Jun 2024 03:02:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVhXQ0iyYXNKv9OVc4Y+tS9Fluz9PDYIBsRJPvTV7wYF5n9EGMV4OSyE3VpFm2QRryoqt46CJcFPuZX8ebwueNS+l75iX3Z
X-Google-Smtp-Source: AGHT+IHAKGqZ5gOYGB3HOr+1IEITZl25BM3uFpcf2ffVqIN0I4WjlVFbXATtPqNC8rk2xT66UyGf
X-Received: by 2002:a05:622a:4e87:b0:444:a8d0:ae81 with SMTP id d75a77b69052e-444a8d0b004mr23745561cf.7.1718791331594;
        Wed, 19 Jun 2024 03:02:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718791331; cv=none;
        d=google.com; s=arc-20160816;
        b=SRqWRvZ0MCk2WyIj3OJg8N7vAXo6Ae1shvvJaMocA1Vxa4yd7HKXn/xycQx/J1y12L
         5QeWJiNTDOTa1Yr7VnS4csyNJODn44ns2wrof7FRp3/iCv2Kv6GNmpwLADF5NNGBs3w8
         cFF1riTOqJfzBuAMZnvvLZY++M3KrfBK0b06m7eMQ0xsQzqeQCtomEiy3QVvi0YRPk9M
         PmUweO7/5z6be/Yahs61d/ZqN7+lxh2k66VjAw9pU0LDpUheHiVDs7V4NG8vV5vKDBty
         J+HPlqaOQOSOqXNRUDpxljdtR5YPudOUjHORmD4Sow2koWAWMdRp5leeTr99Q/of1I4g
         SeCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=iCK/Guh5Rrrw54eAIhGQAU/zClxDgWg+i0Kytm+m6Js=;
        fh=gjtid6HoGhvOYz7QfFN+itIzuUd5CxqvZTNm6mC+lyg=;
        b=B99rJbmYP0mPj/1nzW9eYX3yTEYgRW+VeRUSowew7ku3gwxWH7R8BaArCy8wwnZJVZ
         woU7D2Zc9sPgN6NLvaDbE6dWUm5G0U07zquLXXZpl9lzHmDEYmgAq9CnsIJScn5hnnl6
         0e5ICMXRICi0D+juC22oxIihjifHmdOk71zz+Eh/iB5m0pSxWPWeL2p7aVnJl00ykk/c
         EIjVBGkNXctj1a1C+fTkmAdjP7rrPqyZjhv93vF0Zc33NBBwfbak0JxtZBXaAVGh/oBA
         voo2AUsl+A7c8zVUClIcZFXNz4yEkXNHbdr1ScB6DwKzGLz2fVymBIJJkPvxUQEUglHQ
         yd3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4449526c4a1si59098851cf.649.2024.06.19.03.02.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2024 03:02:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sJs7v-0004ZW-8r; Wed, 19 Jun 2024 06:01:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sJs7t-0004Yu-LQ; Wed, 19 Jun 2024 06:01:13 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sJs7s-0002s9-3x; Wed, 19 Jun 2024 06:01:13 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 19 Jun
 2024 18:01:02 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 19 Jun 2024 18:01:02 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Jason Wang <jasowang@redhat.com>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 1/2] hw/net:ftgmac100: fix coding style
Date: Wed, 19 Jun 2024 18:01:01 +0800
Message-ID: <20240619100102.3137941-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240619100102.3137941-1-jamin_lin@aspeedtech.com>
References: <20240619100102.3137941-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EItYlLBpRsu6

Fix coding style issues from checkpatch.pl

Test command:
./scripts/checkpatch.pl --no-tree -f hw/net/ftgmac100.c

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/net/ftgmac100.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 74b6c3d9a7..25e4c0cd5b 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -238,7 +238,8 @@ typedef struct {
  */
 #define FTGMAC100_MAX_FRAME_SIZE    9220
 
-/* Limits depending on the type of the frame
+/*
+ * Limits depending on the type of the frame
  *
  *   9216 for Jumbo frames (+ 4 for VLAN)
  *   1518 for other frames (+ 4 for VLAN)
@@ -533,8 +534,10 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint32_t tx_ring,
             break;
         }
 
-        /* record transmit flags as they are valid only on the first
-         * segment */
+        /*
+         * record transmit flags as they are valid only on the first
+         * segment
+         */
         if (bd.des0 & FTGMAC100_TXDES0_FTS) {
             flags = bd.des1;
         }
@@ -639,7 +642,8 @@ static bool ftgmac100_can_receive(NetClientState *nc)
  */
 static uint32_t ftgmac100_rxpoll(FTGMAC100State *s)
 {
-    /* Polling times :
+    /*
+     * Polling times :
      *
      * Speed      TIME_SEL=0    TIME_SEL=1
      *
-- 
2.34.1

