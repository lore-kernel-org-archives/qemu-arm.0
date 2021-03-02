Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4538269lfg;
        Tue, 2 Mar 2021 06:58:44 -0800 (PST)
X-Received: by 2002:a17:907:2513:: with SMTP id y19mr20939431ejl.241.1614697124762;
        Tue, 02 Mar 2021 06:58:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614697124; cv=none;
        d=google.com; s=arc-20160816;
        b=LYvFyIWQRJ+y516I5h3CVflFCCdZr1luzLYdmXkl/xb3ZBV/J3wtrtuOHXKDbYLzXN
         V1G8PYh8EdWuLIV8Wxjmur9MIlEegHaLkEGZR/Cw1GbvALjSCsd7LFrG3jBvkD3m2z9S
         OyZklEYFwiV9jfrToF1LA+wJaT8Q1TY8A9hKeC9dpbqcgC9+5WZ6B1+sIKcWQBP8AnxF
         uO4DECxWxO4ICbj5QlLa/HnBk0gzs+d1K2lfnW3eVlTj+5PMPU+KhV6Vw/fyQYAiHoQN
         Wn4GT/lUpbFxTZzZIn6b9TDkmzF2tOYmYlfF0L/vOG5bF3+lh4nW2MchWGo2mNuy2PDQ
         fkdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=alNnX6GeE8sTwFbIWBvN2VrnGh2+v4nR5yjKLFDEoAw=;
        b=wqGWWgT/nadFHWKTvc0R+SwOPm27XftRAs1SuqWutAYu5lHJvvfPciPxTP60S6Tmdd
         u90KSjQNH9Gb6Fin4hhio/ptq0LEKKNDie/mY9IM8+9mzft/8ZcKE+mLITOXPAGO2nIP
         B55On/0qhaWZ1mdy9e+cCHegYnNSoQHJBvJzPC5v0N9GQL5n/gNLS6SyL+bOd/+T4/5x
         qd0Adwe0W6qOjuaN/Bi1mgRHrfZUDxrtJg9uRTLPhe8MWDg4IDpFXcbCzuXAQWF4rpIG
         Rfwy8QhfpLqEHB9t6Du3lDlgXPnTLx8e70Wb4n6cVFCXd/PWmlkJnuHQhcBEk5o2TcAV
         mt6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=VFrU7iDo;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l13sor4754546ejr.55.2021.03.02.06.58.44
        (Google Transport Security);
        Tue, 02 Mar 2021 06:58:44 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=VFrU7iDo;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=alNnX6GeE8sTwFbIWBvN2VrnGh2+v4nR5yjKLFDEoAw=;
        b=VFrU7iDoGPyASEO4bPiFkn37syLQG/xJ0EH4Bx7NVU45AIFkFZDhGU5X6eWBKSIRzQ
         XLJSn3DxVNnlmxftXui1AsHgOC0Toa3xnD3ROiQAEY1dgmuo0dHgfuB3Sa1578pBEjg6
         A9rEut80NiYje0r3bzYFeEeuf03/2fpa72EiA5P6B8IljNdkbECg6ga6rCEjTWxVdT83
         1roZ17MEBdXQU4bzH0Pv7vQnJqa34yioPdUck+W6LvebHLBb4QM8pywWDlNX3SSmr4Ls
         ovrqmV/zjmAPU43SANAUa80SWohrRjmU3xigm1gUeNM6RS3Y8LI4oZz3g7evhdwusCfv
         w24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=alNnX6GeE8sTwFbIWBvN2VrnGh2+v4nR5yjKLFDEoAw=;
        b=P+wt2Ysrlfw7Kt8yv+2C5wRf/BId7V3Z0I2UYNC956qeKcbAGuNZXU/Kn7eX8LR5KM
         s8to35EHE+7dZl3q0Rp2JXtAIK3MrV6449KUJVd/DQJDV+fCTMm/JYbVHe0VxGgehIeY
         9eTXT0cJpM34X3Y0Trib7EEd7NHDz4JoG0JDDpfCdcbGWfO5hZwp4EhnpfgyP/PDLwiq
         +SlF90czSiu7f1YleTZJNtAcgd/C17mi/luIWUBKQkaegaMSujbS53Q6EfBjsVzcqyb1
         KqvR5tf85c8zN0TXWpoNLZ9eBHNilaqnP3XC7iN/8dSXAQsgusuDWqcTzN5Jc0WNJlNG
         J6xg==
X-Gm-Message-State: AOAM5313CCzFPHd9WAB9+KvJIv32hdGSqHMcasOJ8BTRJD0mJnf8LuPM
	EqC1Apf9O/QfWAWu+M9xHsTmgmBFTrM=
X-Google-Smtp-Source: ABdhPJyJWIEjafDhUHW6Vsn3DoTO/XTaOYHIzTNQsr1QEEMKUxlB3g9x4nEQrgjJd79Z3DVUEhusPA==
X-Received: by 2002:a17:907:9709:: with SMTP id jg9mr14192945ejc.276.1614697124556;
        Tue, 02 Mar 2021 06:58:44 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id kj3sm11837143ejc.117.2021.03.02.06.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 06:58:43 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Max Filippov <jcmvbkbc@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	Stafford Horne <shorne@gmail.com>,
	qemu-ppc@nongnu.org,
	Anthony Green <green@moxielogic.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Walle <michael@walle.cc>,
	Marek Vasut <marex@denx.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Chris Wulff <crwulff@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-s390x@nongnu.org,
	Sarah Harris <S.E.Harris@kent.ac.uk>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-riscv@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Taylor Simpson <tsimpson@quicinc.com>
Subject: [PATCH v3 03/27] cpu: Introduce cpu_virtio_is_big_endian()
Date: Tue,  2 Mar 2021 15:57:54 +0100
Message-Id: <20210302145818.1161461-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302145818.1161461-1-f4bug@amsat.org>
References: <20210302145818.1161461-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 17eVx2p9lTk+

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
