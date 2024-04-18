Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1953323ejd;
        Thu, 18 Apr 2024 12:28:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV0RWw9gY0tRFA2OCAEZYGhemXiQfnPyfppaSoV2fkGmmG3Jf2I/40i7qnTTOCgsa794AiN733PxtaoQ9jqlx5RbBJ5vyNQ
X-Received: by 2002:adf:ec8b:0:b0:34a:71d:f071 with SMTP id z11-20020adfec8b000000b0034a071df071mr1977404wrn.60.1713468488576;
        Thu, 18 Apr 2024 12:28:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713468488; cv=none;
        d=google.com; s=arc-20160816;
        b=tZ+Y8n6ICFCJOnBp1APpI+1pQMdztIxSCB/9QOek7ZZausb6N8Ozj8LfI9uvPHI3Gd
         CTTM8kbSdLKChE6A0rmcuep55TPuXnoJx39CfdSt5r9f9zXL8tiJvSB0CQNpFZ5mDLkc
         HCuIIFBPEdk3LCGN9q8H7ZSatqsC41hBl7cjPv0cbqdTaOP6KEacufa5cBPjBGPW7RQa
         abSu3p8CPGoYP67Rc9Xcw15GEplRnbmuxEvE4cXHERx65XtfgKY72wKcLbWAjU3zhO5M
         aPhiBLtgvUAdz8jV529NJ+Nm9wdV01nu2j3xO8LNhVNzKn5sO7HJ82skdkkJAS4f8Ab/
         zNoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Hca3+XmwqR0YOlaHOdTYyVt5U6rBmejaVD76pmxE3UI=;
        fh=/pj5pNK+2/YissBIrPzopUtBesQdE6tV7iTtUnGJWDc=;
        b=QaGm3nRHyVUUYhdE9xkC27FFIHa+GpO0Kv7lhzn8G5WeUvzhks93ceYAMYfP+QYa/d
         z3nf6+CBFBCCRWnEmvwpOcDdjz6BV3akJvLtpn7h0MD2KxJupbsZQCFIggVOFPUFGnFz
         OZLlrOVC2jt7VkaTYmr9t+ouuYJ5p8sAad5pyvOowL1XqX09JSgllTNTOkZxSst7Rghu
         xExEY+DK6w3Pa9J5IK9cw8xyccdjk4xrVnqKJl0J0haNf9JkGKgdSZNbaTBg7NaFCwaL
         LGoZPTGLNKJrUqWUOgr9pic3/U/i+ixJYAwOT1Raa1qyP226idyk4oBhugJpJoEm6tKU
         y8fQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XxRKYT92;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t9-20020a5d6909000000b0034a09e7789esor621432wru.0.2024.04.18.12.28.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Apr 2024 12:28:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XxRKYT92;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713468488; x=1714073288; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hca3+XmwqR0YOlaHOdTYyVt5U6rBmejaVD76pmxE3UI=;
        b=XxRKYT92vzYxIwSuOB7IL4awNFAca9lMNWn3LZPNsbVkbDIg210XQvt/kzsN9UCjQY
         11co5+TwjeZwcMUHvM7z2JttUr+xrH/zVCuoIhdL8hd/bbCueNofUr/ZM99mK0hHcRzp
         vLvs/vLQnsxHa3UQyvMdfRpUE1On9+bX94flTeHHQJEUj9L0oMQwGIeIfXGYfO6CkwRI
         rON2gjx+Yl2MHxDwufY1J/RaKvqnv50q7+L3z00tBW/dlgKBoqpKABzR5UXOT30PLVne
         nWn4WJ6Q0pzpDOB0L2nqg6jEVIsXfKippOV5s71O9Lb6iYOrjY95S6O1QjCkQCOQDnxF
         PfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468488; x=1714073288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hca3+XmwqR0YOlaHOdTYyVt5U6rBmejaVD76pmxE3UI=;
        b=FNCpZf406cktiG2PEIcoSmFijUGb0VaZ2A/3lwCUt4/6Y2HloxiAzMb2s7l3GJL/lB
         aphleZuuDj/YN1stUoQFPLwwIRTZJVCntkOzVX/xx159xF4AxNCJkot/incDlpQKUU/T
         9+k4rVCUPBp9nVt9u8Ck9G6hH+n8ITgp2Pr0t4Bo50kEEUXlaN9VcaM1X/vaRehOoNAk
         kATVqzFNZeFY2j5LPZqjQMvlGvdi149bjDqWX6jM+LX4dK3DqK3B5+V7lN/U0IgS7uKQ
         xRbiRk33StIDTkiMrC8NAlzSyOQknoalzu5dgYOpZrysBZJXv1kQNbWDopUvXXGRUTCp
         GkGw==
X-Forwarded-Encrypted: i=1; AJvYcCUURKeKkCPMgml19/6O6VPtnAw7PiLuRWDTgdZjgn/yDVjR+Jd/tkYto4+bBkZVaKWntXlg82UU2dUvqafEBHNhIRXoFj3X
X-Gm-Message-State: AOJu0YxM5MKrmG0Zo9XaE50BI+STmL2oxTd03anGyRdY+ot3vgGOMprQ
	XaBQOriBYp6eVc1KmblB5uvd7gpE2GWQ9vDjMJFSzjv4+LrG5Ef58KUX58AnxDX+tg==
X-Google-Smtp-Source: AGHT+IFY7dL6kQPENW/Gj6CBDv/d1qDFxnP7kZvuVmZ8Q0jxIs8r9dKZcEdctT8ubfxSRPUALhnlPg==
X-Received: by 2002:adf:e40e:0:b0:34a:3eec:c379 with SMTP id g14-20020adfe40e000000b0034a3eecc379mr650087wrm.67.1713468488275;
        Thu, 18 Apr 2024 12:28:08 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.151.213])
        by smtp.gmail.com with ESMTPSA id f5-20020a170906138500b00a5531e61002sm1247131ejc.206.2024.04.18.12.28.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Apr 2024 12:28:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 21/24] plugins: Un-inline qemu_plugin_disable_mem_helpers()
Date: Thu, 18 Apr 2024 21:25:20 +0200
Message-ID: <20240418192525.97451-22-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: dkLZAhS5CTWN

"qemu/plugin.h" only include the huge "hw/core/cpu.h"
because qemu_plugin_disable_mem_helpers() accesses
CPUState::plugin_mem_cbs. In order to avoid including
it, un-inline qemu_plugin_disable_mem_helpers().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/plugin.h | 6 +-----
 plugins/core.c        | 5 +++++
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index 41db748eda..28467c4a28 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -15,7 +15,6 @@
 #include "qemu/plugin-event.h"
 #include "qemu/bitmap.h"
 #include "exec/memopidx.h"
-#include "hw/core/cpu.h"
 
 /*
  * Option parsing/processing.
@@ -227,10 +226,7 @@ void qemu_plugin_atexit_cb(void);
 
 void qemu_plugin_add_dyn_cb_arr(GArray *arr);
 
-static inline void qemu_plugin_disable_mem_helpers(CPUState *cpu)
-{
-    cpu->plugin_mem_cbs = NULL;
-}
+void qemu_plugin_disable_mem_helpers(CPUState *cpu);
 
 /**
  * qemu_plugin_user_exit(): clean-up callbacks before calling exit callbacks
diff --git a/plugins/core.c b/plugins/core.c
index 11ca20e626..b25092abb5 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -493,6 +493,11 @@ void exec_inline_op(struct qemu_plugin_dyn_cb *cb, int cpu_index)
     }
 }
 
+void qemu_plugin_disable_mem_helpers(CPUState *cpu)
+{
+    cpu->plugin_mem_cbs = NULL;
+}
+
 void qemu_plugin_vcpu_mem_cb(CPUState *cpu, uint64_t vaddr,
                              MemOpIdx oi, enum qemu_plugin_mem_rw rw)
 {
-- 
2.41.0
