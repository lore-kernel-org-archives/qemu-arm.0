Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB61CA9EDD
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 15:11:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGHgG-0000uA-3t; Mon, 12 Oct 2026 11:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHfz-0000hT-9P
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 11:10:55 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHfw-0007kw-VE
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 11:10:54 -0400
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48af4d4e61fso1400854f8f.2
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 08:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791817851; x=1792422651;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9bQz/dpQcTFmknV0ZVNikpRUpVUFhyWc4TFL1C+8fm4=;
 b=ZmwzgZBIEfkxk+D+MOcXnz9/awVbOdKxF6g52pktV6b3Cnl8dSecX29uP3++XRVKry
 rwgsF8wUy2qwfvFswSNiST0Z769CnTZzXkmoFx9XaYXLvsjTgaT+5mNmWlRdKTvmkT2/
 NCTiTG/gype9bOgjS48S5P08+HSItLeTFQSwAMYexJfEkWCbOg29DAdza9/UCLdYtzWN
 4vcuS+u4yqkUxs3X44cbthwHuwqSsS6stcnj4DB6UtPNOj6CRYvOs8bY1qJnnThi0/+l
 aHQNkPhALm5vu84HzSHR1Hq8trBwOW8i+K3FMYXx/M8SEFruZR9QyyewFeu4ktoWr6L+
 E+uQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBym/5Fe94Mnr9NoM5mQjepYu/87Yvl8vO2PnEaoP2HczzDQHCpAqIRMPqcgJVuFWmhfcBiUMJdF7Q==@nongnu.org
X-Gm-Message-State: AFq9FYILny8hsJW3xoDPyAAiRXeCAJ40X+r+gbtmdjLnj/1v4AfkpfGz
 rPHKadIOdYn64KMEjdiUSj1qax8TJ7wk9RD7tKEbTIqeU4YloR9/+EWL
X-Gm-Gg: AYBFou2yV3AflVaJzGN8ibdlPGIBubTOUJ/gjrbv53Ucn7sUef5O38xtjH6ZfK7FJA3
 byGmwO61tsPWl0F2m+M88Pm3c2HiWapS4vwBeAJrf2iW/Ap6fuAldknf5BTZTB6YjE4mL9AGlnF
 XubZvKnPwbSpuNPTLzkpNUP7ByZ98yACjAizaXgBGfQyxdQF7TWjX57YZMCqbvdOcfjdf89hrfx
 lvbaHIPaQm2iIMejkYyZEwKU8VUqs+PJQB5SHavpXgug6BreGrqLb4NEyZPBloYU3TIXe1i30zr
 DZ2mJLOK/SkyDnxeRZ46ooSjZSxoO6qerKMI1hI5dNffy9WpbrofAL8bH5a4GtjGZyHa7F3WobL
 6RnCYJvvLaKCoXSbe0JRxr/FQsDWfVokbblbxqSty7SnYezlolKtxxYrq3uJ7UxDW+aRxyGzXg5
 dYZoRHc+C6kTPt9Yjw/wr+LzW7jfCwA+Plj2hFqx+pQDpYmNf1CW7EaVW2jjMszXGxoMGs03Ojq
 cx0S4EkwKl4xfH7T6kd7+5QeVh+0i4mJT2lVRFNnqqNcA==
X-Received: by 2002:a05:6000:29d6:b0:487:40a:5ba8 with SMTP id
 ffacd0b85a97d-48dbacecc29mr10911946f8f.15.1791817850809; 
 Mon, 12 Oct 2026 08:10:50 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9abd3aasm19361499f8f.32.2026.10.12.08.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:10:50 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:11 +0200
Subject: [PATCH v2 18/50] tests/qtest: ds1338: cover the power-on register
 defaults
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-18-4c3dff084ec9@free.fr>
References: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
In-Reply-To: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815520; l=1856;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=9nlnuEXuVbr9L6NPGTObkdBzIqjpFAqXLz9Eqo8+gf4=;
 b=EJka7OBMD+c0KBxDRvlXbDlcNQsODRKuSGgPWLO44rhTjOmICbJOPv7rRbgDjhdmigeBEQo8V
 88tDnBOTX2eCk+HxE0JRj6QNbiPu+RHy+uCJpiagxA9hyRs7ktIb/Oy
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.41; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f41.google.com
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


