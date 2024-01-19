Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp881324ejg;
        Fri, 19 Jan 2024 03:42:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFp4Uxlyx5asEGUjSvLwvRHzwtb+xLagjbmTwUz/zZecy701gBDbgcCg0lhmu1oFfRSN5jw
X-Received: by 2002:ae9:f403:0:b0:783:70d3:eb28 with SMTP id y3-20020ae9f403000000b0078370d3eb28mr1292409qkl.44.1705664570023;
        Fri, 19 Jan 2024 03:42:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705664570; cv=none;
        d=google.com; s=arc-20160816;
        b=vYMNbUo4AhycIVjyYtlkCE91njjxPYz/oM2wbXrVpFy7WNT6Ttg/tHlc+LZkxWqRkR
         XAfuoWyuhQ/IXdrB5v74xmq6e38/np0r1Pc1QRPNF1Ifzd5bXnh5gH1n0sMOWZ8pXXEG
         5ppeFwuh0TCcIBzO+xPbjkfGwMih7WrP6o0/qyDbfyq4lfE5DlJVn07VEUCRJyM00VLG
         PICpQpbAUW8ZmS9lR5eKqNyXyuh8cn7a52ouQBf+wdxeXrmGC+FdUlounH0lD1og8TFV
         Wk421Oko7xEz02G9lgPnaVbheAOsczMa8wZOJpDdaItLHNVb43SfE9W2Xmc+8JbOWZhh
         0c/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ti8d6bE+nqA1U4OtHFV3Ptf3sJVQ6hdYw2WwbY+h+tg=;
        fh=H3gzWMxIGcYpnCV3e2JUJoIjDrs6lUKJhouF472DiR4=;
        b=dW0vNEj8UOFGGFZwV9zoPP1MCut+3p/ACkdJAx6LXrqm8PyUSdQT2WbYJ3Hq7XO+xo
         2vwNPaRKUy1mdZszW0WrKa8sX6tzNB0QCK0VftQmtQUS4NUbUSRwl4fbITo/b/Fo96Ys
         5F2wK9+EeoU9io/vwH3hwGAAxDHOosbCPKZdZtMFkoul2Z1rwskB6Zt3TsbsopOSgbL/
         pD1loySoZchfJ4kbbVXkD4n7KF64Tw30aX4yRuIEZr0i/lAnEp0bBxvtn+3rVHDjBxse
         xlqRs06zEq8C2xpTmYFJduKZcmdlbOEFrZSMNI/s/phdbzQVZTQheIy7efjQFZXCh8Dd
         oNPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jtC4+k3X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id vu15-20020a05620a560f00b007815e618cb3si16012008qkn.174.2024.01.19.03.42.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 03:42:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jtC4+k3X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQnAo-0003RS-KT; Fri, 19 Jan 2024 06:36:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnAm-0003Om-TC
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:36:32 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnAl-0002nR-9H
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:36:32 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-336c8ab0b20so591849f8f.1
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 03:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664190; x=1706268990; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ti8d6bE+nqA1U4OtHFV3Ptf3sJVQ6hdYw2WwbY+h+tg=;
 b=jtC4+k3XnelZv7GJiyBwnfVasVVy5r5+TDjQe89E0a2/rwO7pYHCnFpS8O6yVo1vPw
 l3on6WFWfPNxPHxLmjLhjbRxy/Cc24kSrNFSzKg3NKceUmPecRUbgdW8/nyS9T/LgWX8
 rOKN3/zdsQV1yP/VqTKtzdx2ecOb9LXVxzeUIfHs9AzL7dyJiPGqLJWEkVQSIXiluzYa
 fwq92QjNLIdySWx5tbmGhdiddeUdUoTOM42udllBwgPCBQVxSuRza2YG1AoBx0gbXd34
 K+RrqA0TyTbcBw5RFBHVMZHgRYmW8cd5OrEHCa399iIySnMa4zSQLj2T9Y6fQ7eipg6M
 3ghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664190; x=1706268990;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ti8d6bE+nqA1U4OtHFV3Ptf3sJVQ6hdYw2WwbY+h+tg=;
 b=kthTTRRfAQpcmoSJWiXQZedtWAb4frWvhUDfOhwjU1rGq9ooRButMwe55s+SDzeNNf
 ahCiT9Y/fu4Y1tnJjE42Pu9t/ammzPjlYcpcl7AJJZZL5PYDAqAemYjTpoEjzn2bWZZe
 9CQi/u8Ruyqsip8Piiz7Zad3+G+sd7ZZrVa00S4AlQorbmC4V1P7WjEkyHFmrmCyj81e
 QHp+olkH6xftUg1EP96MV5w7X9CreAj2SKS5LxXuyMPxk+1TN/kqa2q1vz8uQnH8qJak
 mf/Mqng/P6/ZFOi78tZFPqNXCn0AwJuJWSM3iDa7JBpWuxQvBfrsXr+LJK3MLh8BhDBS
 UNrA==
X-Gm-Message-State: AOJu0YxSIV/YK5dR3SZsZ3VgRpB6kuNunZlV1KwuqVyCgEfnKIqehMUP
 W3vBRQIvtEE4/0Cw4Ly9ITGUkVM2eqZxFtgk55+BIdz4WNjggerBzWDTQf+Ydzk=
X-Received: by 2002:adf:a1d1:0:b0:337:c872:7146 with SMTP id
 v17-20020adfa1d1000000b00337c8727146mr1312014wrv.13.1705664190046; 
 Fri, 19 Jan 2024 03:36:30 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 i7-20020a5d6307000000b00337d71bb3c0sm2533871wru.46.2024.01.19.03.36.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:36:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 18/36] hw/pflash: refactor pflash_data_write()
Date: Fri, 19 Jan 2024 12:34:47 +0100
Message-ID: <20240119113507.31951-19-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Pe1petv0zKdX

From: Gerd Hoffmann <kraxel@redhat.com>

Move the offset calculation, do it once at the start of the function and
let the 'p' variable point directly to the memory location which should
be updated.  This makes it simpler to update other buffers than
pfl->storage in an upcoming patch.  No functional change.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240108160900.104835-2-kraxel@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/block/pflash_cfi01.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 3e2dc08bd7..67f1c9773a 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -403,33 +403,35 @@ static void pflash_update(PFlashCFI01 *pfl, int offset,
 static inline void pflash_data_write(PFlashCFI01 *pfl, hwaddr offset,
                                      uint32_t value, int width, int be)
 {
-    uint8_t *p = pfl->storage;
+    uint8_t *p;
 
     trace_pflash_data_write(pfl->name, offset, width, value, pfl->counter);
+    p = pfl->storage + offset;
+
     switch (width) {
     case 1:
-        p[offset] = value;
+        p[0] = value;
         break;
     case 2:
         if (be) {
-            p[offset] = value >> 8;
-            p[offset + 1] = value;
+            p[0] = value >> 8;
+            p[1] = value;
         } else {
-            p[offset] = value;
-            p[offset + 1] = value >> 8;
+            p[0] = value;
+            p[1] = value >> 8;
         }
         break;
     case 4:
         if (be) {
-            p[offset] = value >> 24;
-            p[offset + 1] = value >> 16;
-            p[offset + 2] = value >> 8;
-            p[offset + 3] = value;
+            p[0] = value >> 24;
+            p[1] = value >> 16;
+            p[2] = value >> 8;
+            p[3] = value;
         } else {
-            p[offset] = value;
-            p[offset + 1] = value >> 8;
-            p[offset + 2] = value >> 16;
-            p[offset + 3] = value >> 24;
+            p[0] = value;
+            p[1] = value >> 8;
+            p[2] = value >> 16;
+            p[3] = value >> 24;
         }
         break;
     }
-- 
2.41.0

