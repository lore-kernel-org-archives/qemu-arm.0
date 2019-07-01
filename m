Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2652755wru;
        Mon, 1 Jul 2019 06:25:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxXJFuQy71QhzaEpJHNeBIq8mQuMP5bK76ixxb9Ly7DtBMLNuwlzG4HTE16bzGJx1Ibdkn5
X-Received: by 2002:a37:9c50:: with SMTP id f77mr20497162qke.6.1561987535515;
        Mon, 01 Jul 2019 06:25:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561987535; cv=none;
        d=google.com; s=arc-20160816;
        b=IY2zk+YOdsMjLq2Ax0pY26DIB0IoebwYYbOMCb8P+tzjfH09veaejKbOFtpvvONJog
         5AjeR6FYZ+ocT5Svs8NQJ+9tnyyCPqaT6LsMVpFh1Oewe6R22Vdu70cmE2Y9YgUpACGk
         8wBRMw6VFXZ0KhatmNaG+e+t/cl6RPj0jMZ50kwjTe1cY+JYveinIcBEaT/mWFHHc40P
         +bm5DlTJLj5Zy65nyI5TQsAGUvQ5e89hJ/v7Fdz6mSlpRI+uM9cCK7o4QenrkU+xqHBG
         ThfWJE2tiNin3w86PxTAY+LmUSKd23V4EGp5V0npwwAyJubqyVzERXPYc7IbRoGRmoUN
         chOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=As+bn/5f0fcpN/d4JcoDalXQ0cqrcIQdkYDEfl5C0i4=;
        b=zWyCmXdMqYeyJxwXyy19j7qcTYxsm4QqGaLH/tRjgzN2p9zylUR7ApkCBPkp1bjUyF
         2NWLa4h4rbmV6IqwCNVxZHcso7bNYS+lY1W8yPK827P68B1m1FOnwolrB3Nqgl3cb1Fj
         poQ+GfBEo2dGUlYy9rMAVEjysU6LDVW9q3cScHAgvU92z+waGXMcv0rdVWlnabAXr9AK
         +zVDp/Zv2kqHxiRsfF0QMkDikI9r/V+U0+FI7wh/VsGNN9mRTKkfNWQoZtB2X3hAOG38
         6cxA0P4RKmCkzPRh4VoZn2PciBVSNFTN0Lq/SpNBxzcjoY7ylLarUDiHIxtVxLpxJm4F
         ZsmA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id f189si8046629qkb.246.2019.07.01.06.25.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:25:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9E440C057F3E;
	Mon,  1 Jul 2019 13:25:34 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40BF46A94D;
	Mon,  1 Jul 2019 13:25:31 +0000 (UTC)
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
Subject: [PATCH v3 01/27] target/arm: Makefile cleanup (Aarch64)
Date: Mon,  1 Jul 2019 15:24:50 +0200
Message-Id: <20190701132516.26392-2-philmd@redhat.com>
In-Reply-To: <20190701132516.26392-1-philmd@redhat.com>
References: <20190701132516.26392-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Mon, 01 Jul 2019 13:25:34 +0000 (UTC)
X-TUID: OuwqeuPhfXbm

Group Aarch64 rules together, TCG related ones at the bottom.
This will help when restricting TCG-only objects.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/Makefile.objs | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index dfa736a375..7c31fa01c1 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -7,8 +7,7 @@ obj-$(call lnot,$(CONFIG_KVM)) += kvm-stub.o
 obj-y += translate.o op_helper.o helper.o cpu.o
 obj-y += neon_helper.o iwmmxt_helper.o vec_helper.o vfp_helper.o
 obj-y += gdbstub.o
-obj-$(TARGET_AARCH64) += cpu64.o translate-a64.o helper-a64.o gdbstub64.o
-obj-$(TARGET_AARCH64) += pauth_helper.o
+obj-$(TARGET_AARCH64) += cpu64.o gdbstub64.o
 obj-y += crypto_helper.o
 obj-$(CONFIG_SOFTMMU) += arm-powerctl.o
 
@@ -33,4 +32,6 @@ target/arm/translate-sve.o: target/arm/decode-sve.inc.c
 target/arm/translate.o: target/arm/decode-vfp.inc.c
 target/arm/translate.o: target/arm/decode-vfp-uncond.inc.c
 
+obj-$(TARGET_AARCH64) += translate-a64.o helper-a64.o
 obj-$(TARGET_AARCH64) += translate-sve.o sve_helper.o
+obj-$(TARGET_AARCH64) += pauth_helper.o
-- 
2.20.1
