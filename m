Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1428411lfg;
        Fri, 26 Feb 2021 08:34:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8m1fNj5v0qN770xjOwEowYKCV+L1twGrFMZ0+KNeRaBftaE08/RE8GiejBCJcymOvDEI3
X-Received: by 2002:a9d:42c:: with SMTP id 41mr2808755otc.108.1614357287667;
        Fri, 26 Feb 2021 08:34:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614357287; cv=none;
        d=google.com; s=arc-20160816;
        b=LPkUyms1tsRP4KsK4uUAG2jbfH35hbDpDhB34XuPzeAilNkmO0eXS2nSucfQAKg7XU
         PmunW4jdStVXi8hqbLkF6C7M1TjoXinclUfDj38bHblY5r9zMVxxDk3NisQDQaC6tnwU
         wWamRDmDJj4ri8ljU5JAFyB/6q1e3T3OVAhvkOTNZFKIow7sbNmNAiRss0Hqx837HIyR
         J+iT3PDrzMGE6aKesytynyfBSr8kVgxz8dhE+PmhoFMnVo9ooaLjE8bAk1GAPJMpyySm
         JE6X/abeUKJzm8EmS3y3elge2wk/FK2fsgjNJ586cKSwZjQ4ZQIzyiza3F92RpFKWSDg
         Ax7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=alNnX6GeE8sTwFbIWBvN2VrnGh2+v4nR5yjKLFDEoAw=;
        b=OByb32OeuCsV+KOh0rI/WIwd0CGxYYxiQOyS1Da7lIZOvfcyToLwMUg67XtuLJudrX
         G9IXrl89GGBTxbFmOyk+hZ7VPDjLM5EX9wqS7UTfTFXUVPrOJBSgFgEhIbVCetDw+kUH
         iChafPijRM9ZRgHuag00DpgzuExHbO/rpEtVsID+Smat9ExXPdpvE5UoTC5ZSiM2oEKm
         3+CCOCY/4G2l6wXK5JQbATFK9k6JARgWuJuUdkQA6f2i0Baen2YBo3zefsWFWt6jU0C6
         4bmSsqh7O01ZALu3AadH8d2TRjaz+nn28apIwGHL/8GQ4t5HpqANwrfC939DEDM+rbQq
         bDDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uyLMHlRD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f21si6556139oig.152.2021.02.26.08.34.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Feb 2021 08:34:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uyLMHlRD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:40744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFg4k-0004yR-Ns
	for alex.bennee@linaro.org; Fri, 26 Feb 2021 11:34:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg2w-00045e-9Y; Fri, 26 Feb 2021 11:32:54 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg2u-0007ao-LH; Fri, 26 Feb 2021 11:32:53 -0500
Received: by mail-wr1-x42d.google.com with SMTP id b18so2678394wrn.6;
 Fri, 26 Feb 2021 08:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=alNnX6GeE8sTwFbIWBvN2VrnGh2+v4nR5yjKLFDEoAw=;
 b=uyLMHlRDhmj2W3V3ce9VzgPU9r6OpFofbOSN9lX/cs7+Tmdo/xSLuzIAUfNU0EMI4I
 23Ze1PKYwLOkQn7eEaZgrTKXetGQprjQrfqOu6co1hwfi1og/IyqrUDIt5QvCk9DdvKT
 mYhhjzPXto23Dhqs5Pukg9PsRMu4WhzkzF4hjTxLplbu2kkKYTnwOsxCjM4Rpv4NgEOy
 /mB+EUK2gj5Au/d/Mwuk4AsG0Lj7LlfkFMvmpBcS0eeiCMebZw5VDoDr1F6bdEbKS1Ro
 4KOSfzmq2Qi9TvR563kHISpz3tA3QNMs7n0pCw1IcDTwRxE7F9aHdgkpRQt+52QKAyCU
 w3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=alNnX6GeE8sTwFbIWBvN2VrnGh2+v4nR5yjKLFDEoAw=;
 b=XmjCsNk9bRW8mmTUkwll739YDMrHXxqW0dKO1qRTjaC6gxJwAwICHP/ouyQcNMD74o
 psWfN2aESVEyLEmcx8mh3r0wFsBK6zxHnrapzMtMxZPFSXUa4dlt3j8Cgd0qRKU4L8rs
 MpAn98OgZvL3tH0LFuHGRbpAbx1/hVZn7DOfDKObDDcZc3BganwlqLWU3vGGNYUwOmOv
 ZvCCnaqptgYGYhnP4na6AI6HOoBX5V5ix7D7mJCQzS8kxFIJ093o7InntgBFP2JILhVe
 SYp3Lm5QF5G2IW97F3vOfIz97YgOimDjkzwTM+Rcp8wczvzcohvCjKp8X/YWpvM+QIT/
 FTwQ==
X-Gm-Message-State: AOAM533IqQIvDsJKfcuTyA52AMEvq0eVLQEV2EhxTmgMDVkcpZwig+fy
 D4aRBaxty50syKVNY2VzWK1dB6mlANU=
X-Received: by 2002:a5d:6ca6:: with SMTP id a6mr1465183wra.179.1614357169623; 
 Fri, 26 Feb 2021 08:32:49 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k15sm16661875wrn.0.2021.02.26.08.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 08:32:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/16] cpu: Introduce cpu_virtio_is_big_endian()
Date: Fri, 26 Feb 2021 17:32:14 +0100
Message-Id: <20210226163227.4097950-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226163227.4097950-1-f4bug@amsat.org>
References: <20210226163227.4097950-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Michael S. Tsirkin" <mst@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZA9GEKDgi0nR

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

