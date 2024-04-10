Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp415000ejc;
        Wed, 10 Apr 2024 09:09:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUDdBtzebgn5/3gkjopNv2ZtKHiOmkp6+Zx6Pwpgu9DxEdQb/v5OXkSfw41hu95VLRBCQ6ukj+kIYDJlu9JYWhvLA5aXXJk
X-Google-Smtp-Source: AGHT+IFeVu6IeofouxFDokrFQp+diZOMdIKgqv8V9fK3gjMYvm7cDb32GOaen31sZ0WvpwVQAf8g
X-Received: by 2002:a05:6214:da1:b0:69b:2aa8:dc66 with SMTP id h1-20020a0562140da100b0069b2aa8dc66mr3572503qvh.28.1712765363505;
        Wed, 10 Apr 2024 09:09:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712765363; cv=none;
        d=google.com; s=arc-20160816;
        b=YP7xvmfNbayDpfvTI1plWPDXtzWrgS3FeORC0H1cLgQj9uwBvhQQBSwUXufXagKmXv
         zfcFog0aMz1qVtUjFRZBIPa0bnN28bbquyc/nenS3Nxy3WGrOI3uu5AxAN6sNp1UdRS0
         yPsfN63msCpWSpGF8w7ooK4ZDxUVCd2JFznh9NdV3snBS/YUp0/CaEybqoksh7vRPfsO
         ukrneWQJBCz5eC/E14qWpHtKw0IGMQ5bcQSwWYuZOdIF6c0O3oWVxu+ydFe6b6ePe3i8
         Lwl0JSV+/lTjZyZue+mBhXh3xaArLzzduOSYE/Jy0JkfZlI3WF/JjhOuGeXrQC4Itntu
         vPiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tmrbaiUVNJN3VwkspX6n0mLGveiY6Yl+m30htubqYrE=;
        fh=s1iuJY5DbIijYD6dlLSPIDBSiHLILOeGKgnYh7ZcSrg=;
        b=iBUfstSrk3l89newKGVNoy7sH/myB6W8fkfGdVJLZpnH/sn3tY2I4nJRVz7Qlp+xj5
         EAa/dVIZcDKvn34ffhj4A9FwRoYYTswAVpfrTDTNObzwHSKqm6ZaW0VVyWQOanPKfmFV
         q3juvwHmsoEJotlk/Ifeh1BExTF/jdcpJHsOAV34IbxUoPTK8OiWE6j1yAl+dJSsvxlN
         DCMl6hJk2en2oHYLN/QNQp0k43QZDqo7GAfsg+RVK3Zro00ck+Jlo3EQyMphTmmm08+K
         t1HpoSILL94DvSJBwUN1rxoBvFrJbcXvcNWXZabYKHmjiKsuinszjAOpTeVT9eThUFbU
         17hw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JVdI3/bJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eh19-20020a056214187300b00696a0e92d92si12679986qvb.257.2024.04.10.09.09.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Apr 2024 09:09:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JVdI3/bJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ruaUC-00011E-Oa; Wed, 10 Apr 2024 12:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruaTo-0000Va-RK
 for qemu-arm@nongnu.org; Wed, 10 Apr 2024 12:07:22 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruaTn-0002l7-9v
 for qemu-arm@nongnu.org; Wed, 10 Apr 2024 12:07:20 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-56845954ffeso9225265a12.2
 for <qemu-arm@nongnu.org>; Wed, 10 Apr 2024 09:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712765238; x=1713370038; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tmrbaiUVNJN3VwkspX6n0mLGveiY6Yl+m30htubqYrE=;
 b=JVdI3/bJyAnRiH7HM0mKCBnRJihYXsZIOUsDWSD3sC5DjVTt6pGKrkp2JfW2S+DWmE
 adeWdhxLYuUs2HZexMoICMxAusqGH/0ogO2zYoLDb4bNcfjMmii8BcYH03bCNxJEPHg/
 aG9kkuGQJoDa0DvRO9zbrZYyhC/pLa3W4AmbcNktrCYyafp3z+T5hkZUwSrQcRsd8aDq
 ff5fBygq0kgRXVrd9+1Oyk+Yx4vvKVcFffYrBYmAbOo//pRMeHkJBLg1XtDLqpZ/7pPy
 xlh651SeqU0Ykk+SzGq4HJsy9KDfJ5y3lXFO1hKuWI+DuYQ0sj7wKBLtO5NEC18v6oR0
 7/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712765238; x=1713370038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tmrbaiUVNJN3VwkspX6n0mLGveiY6Yl+m30htubqYrE=;
 b=QzF8PeH0FOLNnl6QUBK55ys/23py7Fa0dR4nwwXeSKsKOo1MPWlFlGsfTAoz/9VozA
 ny75JmCB/d8gRsr7/pwuIjuA61EltLqN1k5p4r23Di3mQ/0mkwEFDhK+nlnUkZG97/AR
 boMbezfB3LMdoQTF39DhXUsbe+XIRevMFrZ0Pe61PY5mTqHu+Hck+lDu1P3rUdrb2H0/
 HQdUEcuUgFHHNI8enlbYjgu9/o5ZA1HaemJnnCiE/vX5F31Lm5eIIdOn5lHTUirxs778
 rCFUhC0XLMUmaiyhwbrbU3dsbKrYD7Ro9GaOoJBmm3Pr9WPNYaX+4qNJcsAnOp+JA8Oj
 TyUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmZY7pCy/FoJVH93/6DaI61fSOeJ8R/ChWbASBhOD9VIBgWjXkTbfxnaFIne/d1HP+gd+vDXBBtimC5EGpYBieM1e5
X-Gm-Message-State: AOJu0Ywlf2nu+QBMix145NHu1GExQ9JyJTvWeesJRL1wt8UlGKsdaBBu
 sWXJGQcmxRRcmznxzjr929nIUFGXxE1quDtDDx8BhUqjGhWhlyxLZZcUJAQJops=
X-Received: by 2002:a50:d6da:0:b0:56e:230b:853c with SMTP id
 l26-20020a50d6da000000b0056e230b853cmr2079454edj.15.1712765236469; 
 Wed, 10 Apr 2024 09:07:16 -0700 (PDT)
Received: from m1x-phil.lan (arl95-h02-176-184-34-173.dsl.sta.abo.bbox.fr.
 [176.184.34.173]) by smtp.gmail.com with ESMTPSA id
 y9-20020a056402440900b0056e3707323bsm5824580eda.97.2024.04.10.09.07.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 10 Apr 2024 09:07:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH 10/12] hw/ide/atapi: Use qemu_hexdump_line() to avoid sprintf()
Date: Wed, 10 Apr 2024 18:06:11 +0200
Message-ID: <20240410160614.90627-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240410160614.90627-1-philmd@linaro.org>
References: <20240410160614.90627-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: f+dnAWsdZXQi

sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
resulting in painful developper experience.

Use qemu_hexdump_line() to avoid sprintf() calls, silencing:

  [1367/1604] Compiling C object libcommon.fa.p/backends_tpm_tpm_util.c.o
  backends/tpm/tpm_util.c:355:18: warning: 'sprintf' is deprecated:
    This function is provided for compatibility reasons only.
    Due to security concerns inherent in the design of sprintf(3),
    it is highly recommended that you use snprintf(3) instead.
    [-Wdeprecated-declarations]
            p += sprintf(p, "\n");
                 ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/atapi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/ide/atapi.c b/hw/ide/atapi.c
index 73ec373184..27b6aa59fd 100644
--- a/hw/ide/atapi.c
+++ b/hw/ide/atapi.c
@@ -24,6 +24,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
 #include "hw/scsi/scsi.h"
 #include "sysemu/block-backend.h"
 #include "scsi/constants.h"
@@ -1309,12 +1310,7 @@ void ide_atapi_cmd(IDEState *s)
     trace_ide_atapi_cmd(s, s->io_buffer[0]);
 
     if (trace_event_get_state_backends(TRACE_IDE_ATAPI_CMD_PACKET)) {
-        /* Each pretty-printed byte needs two bytes and a space; */
-        char *ppacket = g_malloc(ATAPI_PACKET_SIZE * 3 + 1);
-        int i;
-        for (i = 0; i < ATAPI_PACKET_SIZE; i++) {
-            sprintf(ppacket + (i * 3), "%02x ", buf[i]);
-        }
+        char *ppacket = qemu_hexdump_line(buf, 0, ATAPI_PACKET_SIZE, false);
         trace_ide_atapi_cmd_packet(s, s->lcyl | (s->hcyl << 8), ppacket);
         g_free(ppacket);
     }
-- 
2.41.0

