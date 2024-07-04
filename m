Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp453142njb;
        Thu, 4 Jul 2024 01:31:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX/ut/WPKmu3VqohyUHwRKLjQP5g1K2anRoyES9JULPCkwCJjn7lM3i2SpHd1IuBfQ3Iz27T3WF2s2kaXOpKxzx6UjtG4nX
X-Google-Smtp-Source: AGHT+IE3d5pIfxe/cDuaU3IjD6jr7laRX5/3IfRxjLVydn/VfMK3Ju9ryvSOeTwTX/CVl5SPdzcb
X-Received: by 2002:a05:6214:cab:b0:6b0:8991:a2f7 with SMTP id 6a1803df08f44-6b5ee5cd243mr9617646d6.12.1720081908862;
        Thu, 04 Jul 2024 01:31:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720081908; cv=none;
        d=google.com; s=arc-20160816;
        b=vYquTTWF2bIfpicPSYFvsP1NOszoDgCsFno+MV02QQ+Mp6Io/bCJPezYM1euKhNHYY
         vlYGRwxWih/WeWp2Av08yHLT70rDGIzqIjCfsTZlWZMx2G9eGhY+rwyepPT67qrhcG+7
         FSW56XHpkvo7E4xS+G8X9g7ULspLrPgyEkbUOYvZxkZtmWPaZx5pWp9UCW6qUpxQoqKW
         G4nv9MZbza5PKN3CG9qu/qWRkOuH4gC/k8NeJ0FLU8pXOhu8CpuOdHPUg9MF0apIsWcP
         o/3AbZZ6UTYLLSzAZZ54JoGMxdE1+GSHBY8/IdX2d93iMOynTxq4+3Spxrxov6NN69v0
         4j0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=TXgut4fe1tHISnF0BN7SvSk5Jk6+is4rtaybsiDov4w=;
        fh=9AvKBG9ph2MbNSRfPIZar/n2qf2WE4JwGxMGQAT2q8A=;
        b=qHSdgYp2S40nS4BTJYfuV1n1bSVfCmudsymy2KHrYeghPD/2CfD4J0SkUby8S81OrH
         T1JtgkmTPP4ld9WAy0yVuZtgNQeb3o7tKoZ96+AkIljy+PEyGlliaGEOWPEMqtgDgTwt
         cO2Ti0EwZSPE2DKmuZhZ3XNF3+2SkcVGkMm4rroNNipsqPYewVfI7Dunz4ubRapQBgBo
         BfBZaHI7sZdAXicfqJl6dL4g3H7IED7+GoEsDSaSGV8p4hZfN+rkQ9R4gJv04++JA/HS
         9tpPxCDhWCg7ThHzL34KMLuTx5jOaQkPpRueGZMi/r/IChBZo5s1OEKIGsluBorQ2Yqh
         S0Sw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d6934c638si1454795485a.743.2024.07.04.01.31.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2024 01:31:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPHqv-0000bY-4y; Thu, 04 Jul 2024 04:30:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sPHqt-0000Yy-BD; Thu, 04 Jul 2024 04:30:03 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sPHqn-0002HT-PE; Thu, 04 Jul 2024 04:30:03 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 4 Jul
 2024 16:29:24 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 4 Jul 2024 16:29:24 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, "Kevin
 Wolf" <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>, "open list:Block layer core"
 <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v3 6/8] hw/block: m25p80: support quad mode for w25q01jvq
Date: Thu, 4 Jul 2024 16:29:20 +0800
Message-ID: <20240704082922.1464317-7-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240704082922.1464317-1-jamin_lin@aspeedtech.com>
References: <20240704082922.1464317-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.26,
 SPF_HELO_FAIL=0.001, T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8BJwuZSKo9D+

According to the w25q01jv datasheet at page 16,
it is required to set QE bit in "Status Register 2".
Besides, users are able to utilize "Write Status Register 1(0x01)"
command to set QE bit in "Status Register 2" and
utilize "Read Status Register 2(0x35)" command to get the QE bit status.

To support quad mode for w25q01jvq, update collecting data needed
2 bytes for WRSR command in decode_new_cmd function and
verify QE bit at the second byte of collecting data bit 2
in complete_collecting_data.

Update RDCR_EQIO command to set bit 2 of return data
if quad mode enable in decode_new_cmd.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/block/m25p80.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 8dec134832..9e99107b42 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -416,6 +416,7 @@ typedef enum {
     /*
      * Micron: 0x35 - enable QPI
      * Spansion: 0x35 - read control register
+     * Winbond: 0x35 - quad enable
      */
     RDCR_EQIO = 0x35,
     RSTQIO = 0xf5,
@@ -798,6 +799,11 @@ static void complete_collecting_data(Flash *s)
                 s->four_bytes_address_mode = extract32(s->data[1], 5, 1);
             }
             break;
+        case MAN_WINBOND:
+            if (s->len > 1) {
+                s->quad_enable = !!(s->data[1] & 0x02);
+            }
+            break;
         default:
             break;
         }
@@ -1254,6 +1260,10 @@ static void decode_new_cmd(Flash *s, uint32_t value)
             s->needed_bytes = 2;
             s->state = STATE_COLLECTING_VAR_LEN_DATA;
             break;
+        case MAN_WINBOND:
+            s->needed_bytes = 2;
+            s->state = STATE_COLLECTING_VAR_LEN_DATA;
+            break;
         default:
             s->needed_bytes = 1;
             s->state = STATE_COLLECTING_DATA;
@@ -1431,6 +1441,12 @@ static void decode_new_cmd(Flash *s, uint32_t value)
         case MAN_MACRONIX:
             s->quad_enable = true;
             break;
+        case MAN_WINBOND:
+            s->data[0] = (!!s->quad_enable) << 1;
+            s->pos = 0;
+            s->len = 1;
+            s->state = STATE_READING_DATA;
+            break;
         default:
             break;
         }
-- 
2.34.1

