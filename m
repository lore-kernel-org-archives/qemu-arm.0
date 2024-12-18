Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab960062d3sm573350166b.16.2024.12.18.08.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 08:26:22 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id C1EAE603E4;
	Wed, 18 Dec 2024 16:21:05 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Eric Farman <farman@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Fabiano Rosas <farosas@suse.de>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-riscv@nongnu.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Joel Stanley <joel@jms.id.au>,
	Beraldo Leal <bleal@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	John Snow <jsnow@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	qemu-arm@nongnu.org,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-s390x@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 17/27] tests/qtest: remove clock_steps from virtio tests
Date: Wed, 18 Dec 2024 16:20:53 +0000
Message-Id: <20241218162104.3493551-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241218162104.3493551-1-alex.bennee@linaro.org>
References: <20241218162104.3493551-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kZouaDKyt25M

In the qtest environment time will not step forward if the system is
paused (timers disabled) or we have no timer events to fire. As a
result VirtIO events are responded to directly and we don't need to
step time forward.

We still do timeout processing to handle the fact the target QEMU may
not be ready to respond right away. This will usually be due to a slow
CI system or if QEMU is running under something like rr.

Future qtest patches will assert that time actually changes when a
step is requested.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - s/with/when/
  - drop clock_step entirely
---
 tests/qtest/libqos/virtio.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/qtest/libqos/virtio.c b/tests/qtest/libqos/virtio.c
index a21b6eee9c..2e7979652f 100644
--- a/tests/qtest/libqos/virtio.c
+++ b/tests/qtest/libqos/virtio.c
@@ -170,7 +170,6 @@ void qvirtio_wait_queue_isr(QTestState *qts, QVirtioDevice *d,
     gint64 start_time = g_get_monotonic_time();
 
     for (;;) {
-        qtest_clock_step(qts, 100);
         if (d->bus->get_queue_isr_status(d, vq)) {
             return;
         }
@@ -192,7 +191,6 @@ uint8_t qvirtio_wait_status_byte_no_isr(QTestState *qts, QVirtioDevice *d,
     uint8_t val;
 
     while ((val = qtest_readb(qts, addr)) == 0xff) {
-        qtest_clock_step(qts, 100);
         g_assert(!d->bus->get_queue_isr_status(d, vq));
         g_assert(g_get_monotonic_time() - start_time <= timeout_us);
     }
@@ -219,14 +217,12 @@ void qvirtio_wait_used_elem(QTestState *qts, QVirtioDevice *d,
     for (;;) {
         uint32_t got_desc_idx;
 
-        qtest_clock_step(qts, 100);
 
         if (d->bus->get_queue_isr_status(d, vq) &&
             qvirtqueue_get_buf(qts, vq, &got_desc_idx, len)) {
             g_assert_cmpint(got_desc_idx, ==, desc_idx);
             return;
         }
-
         g_assert(g_get_monotonic_time() - start_time <= timeout_us);
     }
 }
-- 
2.39.5
