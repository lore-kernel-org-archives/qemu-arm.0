Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp311476wme;
        Mon, 21 May 2018 07:04:21 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZryvFga279t6LZL20DK+yMhg9pxwIubq67Tvg+w3MSpSGR3F2DvYXP5lxSAX4FJyXarPoq0
X-Received: by 2002:a1c:a7ce:: with SMTP id q197-v6mr10057721wme.25.1526911461087;
        Mon, 21 May 2018 07:04:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526911461; cv=none;
        d=google.com; s=arc-20160816;
        b=ogUP2cnn5Y7C9z+TjmVza+vdghYty90TWwvNHvOXDt5DQ2QG80GtLrr4QNB5H8XPWG
         lZ5DVZQnKOqVnnRBbAGxf6VV3rFBZXObhBGzWpjsfWAWv1fu0tJIdqCoR9LQnvhc9f/G
         FVgXtXBRqRflKNkI/Gfaa6P4EytW+culq7x3My4CH24qv12hjBcf1kqZteV5MdsmMNT9
         a6yfrvXHlpT/JMNmoWoynQXd15WLeaBes4fuRdAptJ3NsT05tSeJDW4oKYaoGGGtfm4A
         RpL2p69FYXgSz5d3kcrXXtZVxTECf5nHhSDEuP3NbUphdRqwK51T6SBeOGwIuRDQa+sY
         MfkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=4b/OAsKNog9ojUvWD4YCjscVXio+Ev5wEFVnbP7Xh+I=;
        b=opfdhO2NQ+2N1tZutJCXUsNzcInBCRFhr1KMmAc8Z8gyDIFpNJrAfkwMeZymfg1F0y
         B3ua4fIKWvGkaPBUFHf7Eq9kk6k63YjN6Vk02RFAl7JV/f08kvNWWOe66fLWjcnmvvRu
         K2YjnZZf/AJGjKqvh0SLJXCJcOxTlLfuAcVCwTW+n+VVDjy6YnM8EtdpwMvnVzGbQXGi
         tb5FIJjNF1d+rkpUFkMjTUxlKxNsAy7n8TLNdMAjP7QEI9iFZEO5E0XVkwsO+i93rR/s
         Zje3LicSNYPbADRFYlCGD1iLAjpqKxBPoQGQnx/oqBGqzj+j/pTb8+SNBjY94114j9AF
         lp3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id q128-v6si10342946wme.180.2018.05.21.07.04.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 May 2018 07:04:21 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fKlQC-0007no-9k; Mon, 21 May 2018 15:04:20 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 23/27] hw/core/or-irq: Support more than 16 inputs to an OR gate
Date: Mon, 21 May 2018 15:03:58 +0100
Message-Id: <20180521140402.23318-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180521140402.23318-1-peter.maydell@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
X-TUID: hk3T0up2UAQ9

For the IoTKit MPC support, we need to wire together the
interrupt outputs of 17 MPCs; this exceeds the current
value of MAX_OR_LINES. Increase MAX_OR_LINES to 32 (which
should be enough for anyone).

The tricky part is retaining the migration compatibility for
existing OR gates; we add a subsection which is only used
for larger OR gates, and define it such that we can freely
increase MAX_OR_LINES in future (or even move to a dynamically
allocated levels[] array without an upper size limit) without
breaking compatibility.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/or-irq.h |  5 ++++-
 hw/core/or-irq.c    | 39 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/include/hw/or-irq.h b/include/hw/or-irq.h
index 3f6fc1b58a..5a31e5a188 100644
--- a/include/hw/or-irq.h
+++ b/include/hw/or-irq.h
@@ -31,7 +31,10 @@
 
 #define TYPE_OR_IRQ "or-irq"
 
-#define MAX_OR_LINES      16
+/* This can safely be increased if necessary without breaking
+ * migration compatibility (as long as it remains greater than 15).
+ */
+#define MAX_OR_LINES      32
 
 typedef struct OrIRQState qemu_or_irq;
 
diff --git a/hw/core/or-irq.c b/hw/core/or-irq.c
index f9d76c4641..a86901b673 100644
--- a/hw/core/or-irq.c
+++ b/hw/core/or-irq.c
@@ -66,14 +66,49 @@ static void or_irq_init(Object *obj)
     qdev_init_gpio_out(DEVICE(obj), &s->out_irq, 1);
 }
 
+/* The original version of this device had a fixed 16 entries in its
+ * VMState array; devices with more inputs than this need to
+ * migrate the extra lines via a subsection.
+ * The subsection migrates as much of the levels[] array as is needed
+ * (including repeating the first 16 elements), to avoid the awkwardness
+ * of splitting it in two to meet the requirements of VMSTATE_VARRAY_UINT16.
+ */
+#define OLD_MAX_OR_LINES 16
+#if MAX_OR_LINES < OLD_MAX_OR_LINES
+#error MAX_OR_LINES must be at least 16 for migration compatibility
+#endif
+
+static bool vmstate_extras_needed(void *opaque)
+{
+    qemu_or_irq *s = OR_IRQ(opaque);
+
+    return s->num_lines >= OLD_MAX_OR_LINES;
+}
+
+static const VMStateDescription vmstate_or_irq_extras = {
+    .name = "or-irq-extras",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = vmstate_extras_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_VARRAY_UINT16_UNSAFE(levels, qemu_or_irq, num_lines, 0,
+                                     vmstate_info_bool, bool),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
 static const VMStateDescription vmstate_or_irq = {
     .name = TYPE_OR_IRQ,
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-        VMSTATE_BOOL_ARRAY(levels, qemu_or_irq, MAX_OR_LINES),
+        VMSTATE_BOOL_SUB_ARRAY(levels, qemu_or_irq, 0, OLD_MAX_OR_LINES),
         VMSTATE_END_OF_LIST(),
-    }
+    },
+    .subsections = (const VMStateDescription*[]) {
+        &vmstate_or_irq_extras,
+        NULL
+    },
 };
 
 static Property or_irq_properties[] = {
-- 
2.17.0
