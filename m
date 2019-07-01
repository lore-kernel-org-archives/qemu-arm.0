Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2653908wru;
        Mon, 1 Jul 2019 06:26:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxPiaOrASfJwEN9SQoyuYe13yOoJnn69IY6YamWJCHg3+mxiyoXIy/wmdXtACSpcG5St19z
X-Received: by 2002:a0c:c107:: with SMTP id f7mr21202657qvh.150.1561987605087;
        Mon, 01 Jul 2019 06:26:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561987605; cv=none;
        d=google.com; s=arc-20160816;
        b=gV6DaPfjB2WY3tEu6RTXqUaQPd4opvU30vdUlRNave8iDKzk617s4EtekJ+luhDCMS
         7QDpXL/tuIuqRolRRcI+zEGedk7DfIPdSqFEJscBvb+K1iHBsxfnp21Ohm2fMgp3PzfZ
         6sGtJsb8DEWZzJSovYJEWS+9t4vQI8FwsDi1+a7AuOakeOUQTzZ1qfsgd4FUZpHE0imy
         wV1ZNXSjrxIU0qH8nqdr3HWRBGHyVOMHEPuFduiYRFSnR2tKrF3iehHD2BUpY05ZR9KH
         +/gdlCmUyHuuJL1xu8vL/XZ5IKcEnjndwY8n5mMgW3iOj+wqQ7KN5yKgdYcAsmBxtVMN
         em2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=chB+JmO83ZR8IvTsrc5HKjH6cxmnaohjhUz+oCNaOYQ=;
        b=QF0+JwpkUyGKhMAEmUMIU6aQY8XdPCGVl5i1rLDrLANwwsEam2pUufFrAaGstTpItB
         a2ZCxzILurjkg/dGCxWVdT/iKYuuZusOiR85XiUryQlZYQGPOFLPw1tuCJtgsQo6JnT4
         Pcu4JKpLxFvXjzRI/DR7KLMRPzHe24qHWkKdHza3zBpKO8DGmI1u7sl9hQqcFFNMAJUO
         QlnV1T/MGv0Pl344FQbWL+Vy1Q+34Jbrleo6dBXiiPjGl+A1yW4VIPNLgfBcvtnUKx+S
         4z/8gnfw7kBM/wX7+m6/yNL8mZTfylwr+ijcBO9SfBYVMeteiCl3FcigoF+fXPZybDu+
         BhLA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id c22si7509508qkc.315.2019.07.01.06.26.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:26:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3910D308FBAF;
	Mon,  1 Jul 2019 13:26:44 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EBC06085B;
	Mon,  1 Jul 2019 13:26:41 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yang Zhong <yang.zhong@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Rob Bradford <robert.bradford@intel.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <drjones@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 19/27] target/arm: Restrict PSCI to TCG
Date: Mon,  1 Jul 2019 15:25:08 +0200
Message-Id: <20190701132516.26392-20-philmd@redhat.com>
In-Reply-To: <20190701132516.26392-1-philmd@redhat.com>
References: <20190701132516.26392-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Mon, 01 Jul 2019 13:26:44 +0000 (UTC)
X-TUID: sYv/AOfz/zol

Under KVM, the kernel gets the HVC call and handle the PSCI requests.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/internals.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 46a1313d69..57e0253ef4 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -529,11 +529,15 @@ vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len);
 /* Callback function for when a watchpoint or breakpoint triggers. */
 void arm_debug_excp_handler(CPUState *cs);
 
-#ifdef CONFIG_USER_ONLY
+#if defined(CONFIG_USER_ONLY) || !defined(CONFIG_TCG)
 static inline bool arm_is_psci_call(ARMCPU *cpu, int excp_type)
 {
     return false;
 }
+static inline void arm_handle_psci_call(ARMCPU *cpu)
+{
+    g_assert_not_reached();
+}
 #else
 /* Return true if the r0/x0 value indicates that this SMC/HVC is a PSCI call. */
 bool arm_is_psci_call(ARMCPU *cpu, int excp_type);
-- 
2.20.1
