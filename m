Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BE8C79FA1
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Sep 2026 16:46:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3cUJ-0006Er-0V; Mon, 07 Sep 2026 12:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cTs-0005Xn-GZ
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 12:46:11 -0400
Received: from mail-wr1-f43.google.com ([209.85.221.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cTp-0003Zb-OG
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 12:46:03 -0400
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-482e4998d28so2991624f8f.2
 for <qemu-arm@nongnu.org>; Mon, 07 Sep 2026 09:46:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788799560; x=1789404360;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9bQz/dpQcTFmknV0ZVNikpRUpVUFhyWc4TFL1C+8fm4=;
 b=mgYSO9wY1obRaJYBwcSUsYYwDI1768v3TrT1tuYs51AQ6InllnHOQYJ4I9hLzwmGdF
 ZY7Gwq1XenBSiZf0RcaUlNDH+yWy5T3xTfpYnMdRbcloSC5eKpQqyzjl0wQKXrAv0zZZ
 zuzxVUXif3LUBPtLE2HnqKkQlCm4OPmNm2oHzjlgkdRgLhcv7ztwcjw7MHHWBUnUuPGw
 QHflEI2+rtZfPk7LYpyYFCNlY6GhRn6R/FqYp5ZbADPKjQ6JkKgJHQXJyJRPTsOwCakZ
 EmwnatqtpdbtjAfb8kAkKLmNs7Ld4qtp61JV7JuWD27d3C6xOmoewyOChAwgnwtLYNE8
 VxpA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzF0y0CuXp0BjlS2zsCNOI+YsU2MkxgtXDcDRMxoQpCArL8jrBYuUZGW4fISBvDuNVMdGUlA/qINw==@nongnu.org
X-Gm-Message-State: AFuF++lZZsjvYoHTPO/1xXT7VrKZEyTCAAewrLbjHVeNUjxUZzDSs5pd
 qN3ScJgcj8Q3hBXCQCNRSbbtRuHyb9O+dArxPL82wNBpTmof49XeSBeU
X-Gm-Gg: AYBFou3qn/KghRFA/xZufwn5xcWkGBWmC3eG7va9HVedRJFS4veqv9F9vitGqrEF11/
 k7NIINbbzGAhYlUuSKSQEKCHv4D8h/m9TkwevfYmpuXj5AmHiOI3ivH9P+0odJ9gnH5799Ec/LA
 9b12Fls7JvBpGoFbDE2q9Ph9HcDTdJw73RqJPkbgVHCM/5Fl4LascNOZd/CNph9B226Bcz2W2gl
 +livzTc5Eu6ShrFotI0HAT0z9KlFbKPqNcYHYAPqn01Zt4ifsdr/N5EkiopnBXijvBGbLAs7gmm
 rekxXqvSPW3KPwCMsHWvWmUKhk9ODOyxwjn2LWSm0sYEZj/vgQO7uPd/UK10HErJrp1QYvkI0hQ
 QMscDqwXxXtiWxAQ0HmldrhSqFSrGXSdZEr7C9+pWmKtRSEHnGvmiIRLm2WEvVOaGYUubsPn89O
 2HG8tWuMm9fLKqS5QFbzasL6iRS+rOgTZRHhKZs2MrQs0Nq6Jh+7bT7eEB1m0o2uDh4tq3CvTQg
 e9qWGGy4//YnKqYcdpaPMjXTxcUK57GwlQ=
X-Received: by 2002:a05:600c:3ba3:b0:49d:e79:612f with SMTP id
 5b1f17b1804b1-49d0e79635amr87342445e9.26.1788799560138; 
 Mon, 07 Sep 2026 09:46:00 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce5533ffbsm327269645e9.3.2026.09.07.09.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 09:45:59 -0700 (PDT)
Date: Mon, 07 Sep 2026 18:42:08 +0200
Subject: [PATCH 18/50] tests/qtest: ds1338: cover the power-on register
 defaults
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-bmc-minerva-v1-18-0d83ad610c3b@free.fr>
References: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
In-Reply-To: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788799320; l=1856;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=9nlnuEXuVbr9L6NPGTObkdBzIqjpFAqXLz9Eqo8+gf4=;
 b=x91vqxodgYiosSFS1bCekIByxelavNlrQRiGJNYP6+RCmICwPqEjqCZ3+zuENbJ6tpLFFfvAS
 K5UWyZOkty5DJTc9o5tqD73PXezARQl6//Xz26WzmlQlMsN+uuO3c/T
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.43; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f43.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Nothing pinned the reset value of the control register, which is how it
sat at zero rather than at its documented power-on state.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ds1338-test.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/qtest/ds1338-test.c b/tests/qtest/ds1338-test.c
index 6066a34846..fad0ca53d4 100644
--- a/tests/qtest/ds1338-test.c
+++ b/tests/qtest/ds1338-test.c
@@ -31,6 +31,7 @@
 #define DS1338_NUM_REGS  0x40
 
 #define DS1338_CTRL_OSF  0x20
+#define DS1338_CTRL_POR  0xb3
 
 /* The clock and calendar come up on the host time. */
 static void send_and_receive(void *obj, void *data, QGuestAllocator *alloc)
@@ -49,6 +50,14 @@ static void send_and_receive(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmpuint(2000 + from_bcd(resp[6]), == , 1900 + tm_ptr->tm_year);
 }
 
+/* The control register comes up in its documented power-on state. */
+static void test_reset_defaults(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    g_assert_cmphex(i2c_get8(i2cdev, DS1338_CONTROL), ==, DS1338_CTRL_POR);
+}
+
 /* Writable control bits round-trip; the reserved ones read back zero. */
 static void test_control_register(void *obj, void *data,
                                   QGuestAllocator *alloc)
@@ -110,6 +119,7 @@ static void ds1338_register_nodes(void)
     qos_node_consumes("ds1338", "i2c-bus", &opts);
 
     qos_add_test("tx-rx", "ds1338", send_and_receive, NULL);
+    qos_add_test("reset-defaults", "ds1338", test_reset_defaults, NULL);
     qos_add_test("control-register", "ds1338", test_control_register, NULL);
     qos_add_test("osf-write-protect", "ds1338", test_osf_write_protect, NULL);
     qos_add_test("nvram", "ds1338", test_nvram, NULL);

-- 
2.50.1


