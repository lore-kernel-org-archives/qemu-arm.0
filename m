Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp290222lfo;
        Tue, 1 Mar 2022 16:27:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwiKsKsOyg6CXgCX+ZJUejVmr2rejTUnXIyQ/iR108Pj4qPGgGjSCW8djj5L787on4+AhNT
X-Received: by 2002:a81:57d0:0:b0:2d0:cd0d:6007 with SMTP id l199-20020a8157d0000000b002d0cd0d6007mr27738116ywb.454.1646180844064;
        Tue, 01 Mar 2022 16:27:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646180844; cv=none;
        d=google.com; s=arc-20160816;
        b=tVoEW/rvu35MFfWDWlgSP3dysD1/pVBIKCu9VC90vg1JvqC5oGYFqJFcQSkX5NTUZT
         OaU0/0ZO/07bJ5eBBDDNLARX6s0YxZir18uvX8x7Cu+rwWKYp5cfOXN+gOkXlCXPb7bC
         1J0IzJuA9ZWYzgylx2iHUvzWT2AEIGyGO8hwzgyKdLK9uwgqf3axV18XekwjU0vVHu5J
         aezcweTrNjIIvIlszCTxn9ZORYKtlYNjybEigts8X1gLfPsM6nAs9eKPVDkOSxTdHjzc
         cZfM+cDz+fOrzlPIzPgJ1dzSdailGqS86YKUTME/vHisLTThQZHdEq4f2ao4oaf8yFPa
         dw2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:references:mime-version:message-id:in-reply-to:date
         :dkim-signature;
        bh=LrEHKcKjE05/g4rjMk0dI58DYJGhZg8t/SLiblxBtcc=;
        b=tKS3u661CLoTjlLi9DyrnQAYsl+54SRcS3XNPm8jFj2L+2w0U1+PojnZLS10JEdATX
         H/RSgluVHDlZUt3raMMApPLHkfNH1qAHKb/m0tWGacANeoXYiHhio6XVvG+DxdG2Tx8P
         1RusxS2/w/9Ubxril2U3rrHvgZkpAXYRt0g1BEHPaVpf/Yh2ozQgmW06YdBB5uwLHVY0
         vPqM+h2G34ZzhMFAtPnNwA32tDMKlUhhkcdX0dohTXDPbcnCwSBR+ktRZRZ+tw1qmxR2
         bSitskmPFgFxzCgatzQ/Ce5oQW8G1uQhJIqH0nZ76OKbtavDoWb7iJMto/KGEvs7ojb0
         vP/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=M6BaK1Vp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 195-20020a8116cc000000b002d6916aa0d0si12571107yww.364.2022.03.01.16.27.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Mar 2022 16:27:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=M6BaK1Vp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:47116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nPCpv-0003kV-Fi
	for alex.bennee@linaro.org; Tue, 01 Mar 2022 19:27:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ArkeYgYKCAc0p01zynvvnsl.jvtxlt1-hytuvunu1.vyn@flex--titusr.bounces.google.com>)
 id 1nPCmE-0008JK-I1
 for qemu-arm@nongnu.org; Tue, 01 Mar 2022 19:23:35 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=39429
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ArkeYgYKCAc0p01zynvvnsl.jvtxlt1-hytuvunu1.vyn@flex--titusr.bounces.google.com>)
 id 1nPCmC-0003EF-UD
 for qemu-arm@nongnu.org; Tue, 01 Mar 2022 19:23:34 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 a12-20020a056902056c00b0061dc0f2a94aso22159ybt.6
 for <qemu-arm@nongnu.org>; Tue, 01 Mar 2022 16:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=LrEHKcKjE05/g4rjMk0dI58DYJGhZg8t/SLiblxBtcc=;
 b=M6BaK1VpN83SJom8rZcUTvur1jMW6EEZUrI9XWZfBy6BzmpohmhhdghrQyF5wYKDdO
 3OH7gld6CxLtG3wiVc4Jlo3kivMD2Tfqz/qWxOrfv1ojVKk+KW6oFoZub3gL6u4p/NO/
 2i50U9jqajb14wYBVAzd6X1JCKw4O1GR9tZyR9yG7a4rXYjLSHcx8O5I/m3nyrTaCMQ5
 BQNhLb2VXpeUNIUtTJONALTF6RZ4NLnLM51RlP+ZLTU/Ou8tT6M+HGDceKEvCeQCHxA/
 9WGqiNGmuDMIJM9ZKqKSAYPCUqsftHU/lrGdZZhJgAq5vr3nLsWWlnkjtSwOaxhqBIeZ
 3oJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=LrEHKcKjE05/g4rjMk0dI58DYJGhZg8t/SLiblxBtcc=;
 b=r0NsnZ0E0hwiww71NsD9CTJmJ6MyPjBpDgDaVpbkIAcEdqQ+ox/4HR3PT5gLLrzfUb
 hjeTvT0AEyMw62ZRrgK8I0diqNj61cWPiTyXMpDnUeQKZi9LKMBu66N/s8hOGClfrI8c
 qWtwpfFUwqCnVulaOCwLZfLuYXZWtyFwJuIRPtpqfXdtzzZmhYAnTxBtw9A1RFjqGfr5
 fTX/Fd3zriVoAEjzFNimm16qW0HUDVJCU7KN5W2+p5iL5DJfsOg7p6NzFAgk1AklAMF8
 0xhd3ihmTBGP2TOmkzldRtSpasmThKf68FbI/9gctL1EVXjImAfiwNP9+1E+vVEZjfif
 8eKQ==
X-Gm-Message-State: AOAM532bRdJGZVDQ+WH7p1ExTs4rVCdhPdU5EAF6Oe1v3dequuCVX+GV
 gOFsgkcuFrwqlzBTdMAcSnYioTfZ1RI=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3a0a:5449:c096:dc84])
 (user=titusr job=sendgmr) by 2002:a25:d341:0:b0:624:3ec2:b7bf with SMTP id
 e62-20020a25d341000000b006243ec2b7bfmr26168254ybf.518.1646180610616; Tue, 01
 Mar 2022 16:23:30 -0800 (PST)
Date: Tue,  1 Mar 2022 16:23:02 -0800
In-Reply-To: <20220302002307.1895616-1-titusr@google.com>
Message-Id: <20220302002307.1895616-5-titusr@google.com>
Mime-Version: 1.0
References: <20220302002307.1895616-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v2 4/9] hw/i2c: pmbus: refactor uint handling and update
 MAINTAINERS
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 wuhaotsh@google.com, venture@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3ArkeYgYKCAc0p01zynvvnsl.jvtxlt1-hytuvunu1.vyn@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NODbUc6vF7Mv

Signed-off-by: Titus Rwantare <titusr@google.com>
---
 MAINTAINERS           | 10 ++++++++++
 hw/i2c/pmbus_device.c | 18 +++++++++---------
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa8adc2618..3601984b5d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3135,6 +3135,16 @@ F: include/hw/i2c/smbus_master.h
 F: include/hw/i2c/smbus_slave.h
 F: include/hw/i2c/smbus_eeprom.h
=20
+PMBus
+M: Titus Rwantare <titusr@google.com>
+S: Maintained
+F: hw/i2c/pmbus_device.c
+F: hw/sensor/adm1272.c
+F: hw/sensor/max34451.c
+F: include/hw/i2c/pmbus_device.h
+F: tests/qtest/adm1272-test.c
+F: tests/qtest/max34451-test.c
+
 Firmware schema specifications
 M: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
 R: Daniel P. Berrange <berrange@redhat.com>
diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 6eeb0731d7..3beb02afad 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -89,16 +89,16 @@ void pmbus_send_string(PMBusDevice *pmdev, const char *=
data)
 }
=20
=20
-static uint64_t pmbus_receive_uint(const uint8_t *buf, uint8_t len)
+static uint64_t pmbus_receive_uint(PMBusDevice *pmdev)
 {
     uint64_t ret =3D 0;
=20
     /* Exclude command code from return value */
-    buf++;
-    len--;
+    pmdev->in_buf++;
+    pmdev->in_buf_len--;
=20
-    for (int i =3D len - 1; i >=3D 0; i--) {
-        ret =3D ret << 8 | buf[i];
+    for (int i =3D pmdev->in_buf_len - 1; i >=3D 0; i--) {
+        ret =3D ret << 8 | pmdev->in_buf[i];
     }
     return ret;
 }
@@ -110,7 +110,7 @@ uint8_t pmbus_receive8(PMBusDevice *pmdev)
                       "%s: length mismatch. Expected 1 byte, got %d bytes\=
n",
                       __func__, pmdev->in_buf_len - 1);
     }
-    return pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
+    return pmbus_receive_uint(pmdev);
 }
=20
 uint16_t pmbus_receive16(PMBusDevice *pmdev)
@@ -120,7 +120,7 @@ uint16_t pmbus_receive16(PMBusDevice *pmdev)
                       "%s: length mismatch. Expected 2 bytes, got %d bytes=
\n",
                       __func__, pmdev->in_buf_len - 1);
     }
-    return pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
+    return pmbus_receive_uint(pmdev);
 }
=20
 uint32_t pmbus_receive32(PMBusDevice *pmdev)
@@ -130,7 +130,7 @@ uint32_t pmbus_receive32(PMBusDevice *pmdev)
                       "%s: length mismatch. Expected 4 bytes, got %d bytes=
\n",
                       __func__, pmdev->in_buf_len - 1);
     }
-    return pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
+    return pmbus_receive_uint(pmdev);
 }
=20
 uint64_t pmbus_receive64(PMBusDevice *pmdev)
@@ -140,7 +140,7 @@ uint64_t pmbus_receive64(PMBusDevice *pmdev)
                       "%s: length mismatch. Expected 8 bytes, got %d bytes=
\n",
                       __func__, pmdev->in_buf_len - 1);
     }
-    return pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
+    return pmbus_receive_uint(pmdev);
 }
=20
 static uint8_t pmbus_out_buf_pop(PMBusDevice *pmdev)
--=20
2.35.1.616.g0bdcbb4464-goog

