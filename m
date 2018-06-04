Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp743575wrq;
        Mon, 4 Jun 2018 08:29:50 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLcns8WYzShaIUdDREwP9FCjzDiqTFfnvX7Xc1jrp78YKrHtI7YIiQ+sOktW0FbBOGjlkze
X-Received: by 2002:a1c:ca01:: with SMTP id a1-v6mr10268671wmg.128.1528126190167;
        Mon, 04 Jun 2018 08:29:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528126190; cv=none;
        d=google.com; s=arc-20160816;
        b=tWKX/c6zqjFYK/NBh1qTwXcLUHS4LSdqp6BjOWBXYKZoNNhVERPjubPhjwYgZOyvLi
         IGEE7CwggoHVns4yOFS3lddg4fdpSJNGPM39Er1bOYkdRUi8pdyc51ohtF7OAEZkReUq
         VTfPBH89+oe45gm1fwt2D62iYpi3Wn2RyNkzSa+hqiCfdVvsSDnHJvAHrnsTZVwm1tPN
         f0r4FeN/V1WUNdKX+NDIs+idUslc5Pjxk7O5YaFJ8qEUKY6duqO4MVA6jqfiCGWXWYui
         w1THMh5bZiZ6hYp9Pp27JAGqnt/9szyaCKT+IrBnSx3Ksdz2eavhxVrAe5eJOFBmZ1R/
         eKCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=cTPJ8T7/6EXDqFLMnC9pILz9AAdp4r1VabGtriV5MIk=;
        b=pagLnp3GGB+OKRHYujcIMoK/haX3EiX/P7gQDBz8EcFirdtY7Cw5/404GknI8FhdK9
         3Q1svl9G6NFIw5JKavFO9sZhdagatd/9W0VNhVj0JcpMDuN03yH2FzpgWurKzHbqI9dK
         X1hsNVvuib/BZvU4KQZ/1wjFxPSHYxI1nS74cpFq0AjAN1ri0vbnE/mUNZaOl03PxFkf
         eGs4qR9logFvccL7+jVPgijTUd2GlOqBvlM5FF/V2ilGkB3fgLvD+6ggYEUcTKSXVrwJ
         ZloNw2+EyL2zfhn6OjOC9m2wLOE2OrzadRZOfC0Z0Sxc7/oGqt+euKt4WG770ZFuAIAc
         zutw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id z88-v6si25796893wrc.423.2018.06.04.08.29.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jun 2018 08:29:50 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fPrQb-00074j-Ji; Mon, 04 Jun 2018 16:29:49 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2 09/13] hw/core/or-irq: Support more than 16 inputs to an OR gate
Date: Mon,  4 Jun 2018 16:29:37 +0100
Message-Id: <20180604152941.20374-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180604152941.20374-1-peter.maydell@linaro.org>
References: <20180604152941.20374-1-peter.maydell@linaro.org>
X-TUID: 52I1y6xrcKnh

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
index 3f6fc1b58a4..5a31e5a1881 100644
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
index f9d76c46415..a86901b673c 100644
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
2.17.1
