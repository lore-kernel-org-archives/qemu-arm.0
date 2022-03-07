Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1767615lfo;
        Mon, 7 Mar 2022 12:12:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw7/7sX0XYVVYWL7awEpypKPB7K1qFUlekn19Aqdv5uNMtEiLpCgu7o+Erdrj0Ip5VLsJj6
X-Received: by 2002:a81:c24b:0:b0:2dc:7d67:a57a with SMTP id t11-20020a81c24b000000b002dc7d67a57amr10351020ywg.272.1646683960902;
        Mon, 07 Mar 2022 12:12:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646683960; cv=none;
        d=google.com; s=arc-20160816;
        b=ILqTp6bJi69BZYmOxZw9grMJhqhq8TJZl/GZ+Ih2qKLZ8X5a0Qlf/UQY3pPx+1zOLJ
         1nf7p3qVXu9DcVjmjD/wGvw/wF0bEG/clrugeAVd4vegmf/zxXULVPWRfk/COZRnMk2M
         NtYZKo4c5txlQQu1MQ/vc5CSn5bS9OTn0OsHv+8kDScSBq6PMjmuGCHdaRAQUdvWacBO
         X+tanbExitKWv/s/H9pSJJon7VVA5n5V42fNZnY0xH9TrH/rnjRzhLWE9AesMLWhXYEt
         THhTWwtZUpHFRI8Gw1EhiXDVY+Kq/EaYJEgakw+rkgz2rrD8dXvqo4pr7pQqHUPtGVah
         bzrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:references:mime-version:message-id:in-reply-to:date
         :dkim-signature;
        bh=lIRfi2f2amHB6ihbKUdscawcMADEbKCKME61okDpwFk=;
        b=ztJiDTeWaTPT+JD8DImL5/4wc5aN0XxuZbPoVNj8LS56tPm47+KWuTdRy5JQosA80M
         0ou13R5fW8Mk8SSeeqLvZNDezjEaLHeUNQdPpQhXrRNaVa/cj5Zf+0fFG2HxVQ4afQIB
         ljjsichYm1rYjIqlZYVZOa/wzeHP1LGyjpxRYee3mGUKYB10cjcwI2euWhS81EzuYCv8
         k0+Ss/GIy9LKF62OhrmphMtBNgfoigHvYij3Y4y29+BQG4JfnW5fuW0+xtjgZYTMVJU6
         QNGXFyU9rZXT2auHk4OPts2gDG6u4EEMIFgO3bQYLnTv0AGJ4Q0nL912gPRDJvncodUX
         e4pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=VPWHY7L8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7-20020a0de207000000b002dd03a941f2si178865ywe.515.2022.03.07.12.12.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Mar 2022 12:12:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=VPWHY7L8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:46328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRJii-0005GM-Ao
	for alex.bennee@linaro.org; Mon, 07 Mar 2022 15:12:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <332UmYgYKCFwNCNOMLAIIAF8.6IGK8GO-4LGHIHAHO.ILA@flex--titusr.bounces.google.com>)
 id 1nRJia-0005Fn-Gb
 for qemu-arm@nongnu.org; Mon, 07 Mar 2022 15:12:32 -0500
Received: from [2607:f8b0:4864:20::94a] (port=35514
 helo=mail-ua1-x94a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <332UmYgYKCFwNCNOMLAIIAF8.6IGK8GO-4LGHIHAHO.ILA@flex--titusr.bounces.google.com>)
 id 1nRJiZ-0006vx-2b
 for qemu-arm@nongnu.org; Mon, 07 Mar 2022 15:12:32 -0500
Received: by mail-ua1-x94a.google.com with SMTP id
 a15-20020ab01c0f000000b003477465b9e2so8724469uaj.2
 for <qemu-arm@nongnu.org>; Mon, 07 Mar 2022 12:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=lIRfi2f2amHB6ihbKUdscawcMADEbKCKME61okDpwFk=;
 b=VPWHY7L8yT3cUqhLgnAFNFePpCoP6cZloGIjY4e19s75M3rID2Zx24ewRKOqsMmtJf
 mSUnjpyePv6M32WcRqqQzINr1vEaH5P2KRezLa5nAZ/nusST9T1lJCXIEzFVYOHYrmf8
 CzXbMZileBNdylJMRilytxVNyXxqYZBv8hulUdAveJ8ss88erwoLKJiG7jPOcp0RezwT
 57imJ2P5kf/1UGE40uSOj4EWmpUT8T630AVix2T/hkuJ0DLN4QNR4NG2LIhYfxeR5+Hk
 VCV18RsoKUutwR/a9cQb+NReWX8tI3Q5M575tP20F8Bh/M2uKo4e6SBWal8ZwmAR6+sw
 PqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=lIRfi2f2amHB6ihbKUdscawcMADEbKCKME61okDpwFk=;
 b=WgPN4tSZPQUHEXEq3P5WVSa3tLP1HcY7aJc+OZHUOwHj+DzXMn1f0n1hw+k3LlnsMB
 cLeuq1MFSWUSNF8E/C9S64yAHdrTfKC2CK2tRwxh/riM1GWLZQneYGIpJPTUZjSewVJX
 f+vvnKNsAt1nzfTweEK0C4sv5MrjGeHST6ww6MRzCbZoDbY+rRLt/hvzZ4300LLurbMb
 4IDDzoq6BDFhqc9TLzXYYNWph4Os6KKFQ0jb++c6e4RthnYi0aA7snvuMih4fC8ltRqS
 ulIrw/jna91UTJcB+6x3/G9A/YhtaD6mE9dAEFjhhIPk5A5wIwN4+rV7WsBLmQj8Sywf
 7DCQ==
X-Gm-Message-State: AOAM53181zqVJVeNT1ZBp7Xg2S1zj+/ADychszDjMIOXTI/qJQiNhPQp
 BAzLOM+FjlAQ5+d1H8/IChf2GLibWTU=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3c4a:fc8b:1418:53ce])
 (user=titusr job=sendgmr) by 2002:a25:d181:0:b0:629:1919:d8e5 with SMTP id
 i123-20020a25d181000000b006291919d8e5mr8293718ybg.85.1646683615214; Mon, 07
 Mar 2022 12:06:55 -0800 (PST)
Date: Mon,  7 Mar 2022 12:06:00 -0800
In-Reply-To: <20220307200605.4001451-1-titusr@google.com>
Message-Id: <20220307200605.4001451-5-titusr@google.com>
Mime-Version: 1.0
References: <20220307200605.4001451-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v4 4/9] hw/i2c: pmbus: refactor uint handling
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>, 
 "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <f4bug@amsat.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::94a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::94a;
 envelope-from=332UmYgYKCFwNCNOMLAIIAF8.6IGK8GO-4LGHIHAHO.ILA@flex--titusr.bounces.google.com;
 helo=mail-ua1-x94a.google.com
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
X-TUID: weovpXQJvQKV

This change cleans up the inputs to pmbus_receive uint, the length of
received data is contained in PMBusDevice state and doesn't need to be
passed around.

Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/i2c/pmbus_device.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index ff644c1d4a..8cb9db0f80 100644
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

