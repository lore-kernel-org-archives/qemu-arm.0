Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5705851lfg;
        Wed, 3 Mar 2021 13:47:26 -0800 (PST)
X-Received: by 2002:a05:600c:19cf:: with SMTP id u15mr808802wmq.139.1614808046581;
        Wed, 03 Mar 2021 13:47:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614808046; cv=none;
        d=google.com; s=arc-20160816;
        b=l3JmC0WuzLvprMW9oZroYKAs8sp+5E8of1YidDFpipP2pdoL1fhQaYHGr+n/n/DPsL
         DCT7ve0SKl+GBM8O5bty+Whtg6I+VyLmzjVdEuQipx2tL7x3H9ZCmsLHbOubVK0dIgdY
         Wxo4CkPpiYM3C5CBmd+IIbkvZMIzjVFaoRbC9P4SvZSzzbtRNcYYlXK2EBQQ771+6O+c
         FA3rqlKQFnAO88GGZwg+gWqWIqBXP3TNkteIYas6b/xYJftz+M51WOy7rKdP/FPE7mOS
         Kn2ra+/sx/s0GW5cWIrerbdDHXqJ1seQFQfdk9S5T1Qtw6qY7XInnnJh0KirHNr71n1J
         zPEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=alNnX6GeE8sTwFbIWBvN2VrnGh2+v4nR5yjKLFDEoAw=;
        b=Wpj3G3iulAEttNUlLdq8eVdYdNVZ6DUsXjapKRRJxybsAMnMoybgtNwWtJ5hcpbYF5
         xo819UbT+yqqSKdwUgcWj1xg/FPQuH45SSfOapPh7iGzqcfzbNJzxryTvEvJit0lr9FC
         CYsLPpfkPXUiTiF5s+HMiUAyKXitwLEM1wGvL2dezGjTGxDxApH6hpHkXcrmPhNR+yO9
         8hu09zoNHtG9dRLjwCYVJ9ECSodMVpkYx/IcQfxog58OvB6TdsrD777IW3W7ScRdOLhS
         vZuWJxRx+uNW50CQq5FcgRfaGzRo5dfCMWD20YjP8qw+5/lTOlgWRuatxA76mIJ4BQh8
         HnmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Sw8DnTnE;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l15sor13279557wry.44.2021.03.03.13.47.26
        (Google Transport Security);
        Wed, 03 Mar 2021 13:47:26 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Sw8DnTnE;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=alNnX6GeE8sTwFbIWBvN2VrnGh2+v4nR5yjKLFDEoAw=;
        b=Sw8DnTnEunZLoUFkAq5ehEtw5KzHSFE8RcKZI0xIwI3y4kkr8vtPH5KdYIM2dMB0tM
         dDKvIkpk2pdhYAVsGqo2WPtvup+Oahey4/henkaku+823S6hlg5lEU0yAdNwt304jwm8
         qD6y3lPn8HeKUbJVYmzT84mJ/ZqsStb1cuhSxlMzJql8kDgTX0mLXDnIWEatwlmW+oRU
         3zW6wNtP1nIIDl0HQ+cLV0Da0nZ1xwTVRMOGYf1Usa1vsDdeK0mZ0vfoheHGFDfD2izu
         nMJQOO2Fydg0nrqrQkuHNYqO4abCf+/o2JQvSOVK4GlTFgCSmcQPDDmsf0BHjlTkr87B
         Suew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=alNnX6GeE8sTwFbIWBvN2VrnGh2+v4nR5yjKLFDEoAw=;
        b=E9rz3K16A+BfYT0FPrLPZNB4EZAEo7UofLcvP1OsvRJVQW0khRmCL7P+EOIm6iMLks
         rt2SBfjSHYOnOweuD2d0ifVW6I6DdN2riKQD2i2jaui3Lo+0CKBtvlmpSNNxzb8eNz9r
         vXxv9uMOF3K9dtept2dIgpntF3eyTxRkK2Z2i+j39lLvCyp+8vjCRu1iDWjEwup7s7OR
         cIesmeo3KF/bKX0dVeA8SH839s0AXe2GxVmJSZiRwZvL48QTgEPUDMa54ZHotR4ZlztK
         6Pt4L/fJ/1nhIYvZESXxFGdZ5+1TMu736T1BDjjAXqA7Ntz7EyN/Mb1S4IEqzFVsInvp
         fOAg==
X-Gm-Message-State: AOAM5319+Oxcyc5ZgF4WDAAGV8zN5D4qetkzOhmRseVfkUT4EzqUZCTb
	1IrK2AxFyGb0ZErD9o1O5OxuGiPHse4=
X-Google-Smtp-Source: ABdhPJyu4L3Uv9xjofCNQfzlxl0Bmhv5Ay1kX/ZVhDrO7OpMVdGJBxmvbyNGuTAv2BHequ5z9sR6nA==
X-Received: by 2002:a5d:4e0e:: with SMTP id p14mr795983wrt.64.1614808046419;
        Wed, 03 Mar 2021 13:47:26 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id g16sm15070689wrs.76.2021.03.03.13.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 13:47:25 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-ppc@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Cornelia Huck <cohuck@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v4 03/28] cpu: Introduce cpu_virtio_is_big_endian()
Date: Wed,  3 Mar 2021 22:46:43 +0100
Message-Id: <20210303214708.1727801-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Rzt+8P7OC5+y

Introduce the cpu_virtio_is_big_endian() generic helper to avoid
calling CPUClass internal virtio_is_big_endian() one.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 9 +++++++++
 hw/core/cpu.c         | 8 ++++++--
 hw/virtio/virtio.c    | 4 +---
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 2d43f78819f..b12028c3c03 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -602,6 +602,15 @@ hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
  */
 int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs);
 
+/**
+ * cpu_virtio_is_big_endian:
+ * @cpu: CPU
+
+ * Returns %true if a CPU which supports runtime configurable endianness
+ * is currently big-endian.
+ */
+bool cpu_virtio_is_big_endian(CPUState *cpu);
+
 #endif /* CONFIG_USER_ONLY */
 
 /**
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 4dce35f832f..daaff56a79e 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -218,8 +218,13 @@ static int cpu_common_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg)
     return 0;
 }
 
-static bool cpu_common_virtio_is_big_endian(CPUState *cpu)
+bool cpu_virtio_is_big_endian(CPUState *cpu)
 {
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->virtio_is_big_endian) {
+        return cc->virtio_is_big_endian(cpu);
+    }
     return target_words_bigendian();
 }
 
@@ -438,7 +443,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->write_elf64_note = cpu_common_write_elf64_note;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
-    k->virtio_is_big_endian = cpu_common_virtio_is_big_endian;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
     dc->realize = cpu_common_realizefn;
     dc->unrealize = cpu_common_unrealizefn;
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 1fd1917ca0f..fe6a4be99e4 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1973,9 +1973,7 @@ static enum virtio_device_endian virtio_default_endian(void)
 
 static enum virtio_device_endian virtio_current_cpu_endian(void)
 {
-    CPUClass *cc = CPU_GET_CLASS(current_cpu);
-
-    if (cc->virtio_is_big_endian(current_cpu)) {
+    if (cpu_virtio_is_big_endian(current_cpu)) {
         return VIRTIO_DEVICE_ENDIAN_BIG;
     } else {
         return VIRTIO_DEVICE_ENDIAN_LITTLE;
-- 
2.26.2
