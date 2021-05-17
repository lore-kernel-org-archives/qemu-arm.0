Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1155401lfm;
        Mon, 17 May 2021 03:53:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8pRD4vLcs+0F8kG+PH+6iPw3y6N2bm/rXQKGdguIUXfkpbOcblDvxQhB6S+fONhQkYdDY
X-Received: by 2002:a92:cd85:: with SMTP id r5mr4172847ilb.294.1621248804196;
        Mon, 17 May 2021 03:53:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621248804; cv=none;
        d=google.com; s=arc-20160816;
        b=Wszzu9863ONu946QDMEgDOfcjFP+Q8tyx7kvZuSCaPcaBeq84QSnnh1WFa1dMdYzwN
         wz5PDKvMv4+aJjLz+wN5gIZ0BhJpa/A4HxWdl8pe3tDhJLh+SAdkC6pdJJDY+61JD1W+
         jC37+O0qzcExVCaWotRu4r/VairfsA5+DNP4Y0g/meM+jD9A0Hb+/ismOjeL72GEfKNi
         YItpE8TcN6ySVr1zhfucoooXK2NOxqoIWDVgkIJo6KOn8fgyuPCO1lv2dHqYZLpdEH8r
         YZJ4a+luenykXt5QCTNANXKPlqTZYMVmQESzxArRNL13kfCtvuoOqW8qMantg8avYdUl
         vEaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=l59dJwJTD3X/0a1ZARal5paaLkpJSadoVLKuikWa47k=;
        b=FBa3akIssMZlUf997x/tkE4aIFLcSAudg1L5N1U1++EzrSUn5uM0LNzxXGqivusyAR
         lsZk0gcF3WxkdzaGMAVhyaUWQOORYA2aV3f5qRksgRDCjA0yfUrUL0/lXMMm5Nz3CSgj
         7BHJ+vxcatsuCKXaKVcwRKa7tMwfsFPva0S2D9cxzwfcyk7OK+H7v0VQi0QClagqsdL/
         njnojs/uFHkYkJb36TvuLkKl7X+xDOpJvxadSabmt4tht2z7FwVzp8mFx0q3h0U3Dy/P
         u2Z2/6PTLfNgnQtU0BcJ/4tM37nR+LRmJX6dCsiQKy1JwgUEz+AqCeMuxx8bJPPBLWJB
         kdJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BmVPx1KP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q17si6838153ilj.87.2021.05.17.03.53.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 May 2021 03:53:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BmVPx1KP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:54308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liasF-00079a-Gb
	for alex.bennee@linaro.org; Mon, 17 May 2021 06:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liarF-0005LH-3J; Mon, 17 May 2021 06:52:21 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liarD-0006af-A4; Mon, 17 May 2021 06:52:20 -0400
Received: by mail-wr1-x42d.google.com with SMTP id c14so4080858wrx.3;
 Mon, 17 May 2021 03:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l59dJwJTD3X/0a1ZARal5paaLkpJSadoVLKuikWa47k=;
 b=BmVPx1KPaifiuvOXGa4COEASn+9rXlOdAopBowSdJtwknRgiQcWsRx6iGLN9mYPPQT
 uHS7d7vc9mruNJLK5ObIkZXcvrZXhueYfOSAe4f4BiiQtsCBMXGpsK015mPzxhcGyTsB
 mEUr9BgajFYNSrUkSX0MfZYl1lwq/EMBZ1Ahp8J4Cgo+U4lLJ32s4doQPK0NEBOMk6zo
 wujAu1VdHqoYqnCNkbvLKLolfr1A74LBq7rrn2xQFq9yKFC64ioKlVwB95qMEPnFMzTO
 m4O9Io5oYp1MpkdVLZFfuMy5GlyxNilF2d6uWcJHRuDoOjpCoOWqMBYggSz4R02rOoAY
 UcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=l59dJwJTD3X/0a1ZARal5paaLkpJSadoVLKuikWa47k=;
 b=WGQp0RIsARcxCxBcT1elJQBU1JeFAtqqm33LWVQofnaQy7NzYAlR/EOXq99vwOWKHC
 6GU6foNTFIRbiAXigjAh/qzol0rcAxqnFwkmf+m5AUD/8WU4IrcxRlnandiIyjwbz/T7
 MOzIkgryLpT6symfNmru81B8jdZwSnVaLmTc12lYVfjU8GZ+KBKEfuE/PgtC5zVN4Rbq
 OuuCH9MLj7VjSyaFOHkqGUR98CLH/OJaOUgk92tT3T6rVzSJ/qdiKvdKXZtyVltctvoT
 qtkHHZAh3+OZD9Cs9wqAyTP2I6GfgaYou2P+ps4BEIJfW2N+ht38NDhGR3DBgx5dTd0G
 ZZYg==
X-Gm-Message-State: AOAM531ceMj96ATbcvt76iFfxpKkx8+rtsF0En3dSCVo+GLXGMDflaVE
 mftoIWtUk6Z9KzvgD1CxrfiNqryCKp7RsQ==
X-Received: by 2002:adf:e944:: with SMTP id m4mr31326484wrn.10.1621248736089; 
 Mon, 17 May 2021 03:52:16 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id r11sm10990805wrp.46.2021.05.17.03.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:52:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 07/23] cpu: Introduce cpu_virtio_is_big_endian()
Date: Mon, 17 May 2021 12:51:24 +0200
Message-Id: <20210517105140.1062037-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517105140.1062037-1-f4bug@amsat.org>
References: <20210517105140.1062037-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: qemu-riscv@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: geno1ZIqIuIE

Introduce the cpu_virtio_is_big_endian() generic helper to avoid
calling CPUClass internal virtio_is_big_endian() one.

Similarly to commit bf7663c4bd8 ("cpu: introduce
CPUClass::virtio_is_big_endian()"), we keep 'virtio' in the method
name to hint this handler shouldn't be called anywhere but from the
virtio code.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h |  9 +++++++++
 hw/core/cpu-common.c  |  6 ------
 hw/core/cpu-sysemu.c  | 10 ++++++++++
 hw/virtio/virtio.c    |  4 +---
 4 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index df495287850..d96ff4dace0 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -610,6 +610,15 @@ hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
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
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index ddddf4b10eb..9d73c9a28ca 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -185,11 +185,6 @@ static int cpu_common_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg)
     return 0;
 }
 
-static bool cpu_common_virtio_is_big_endian(CPUState *cpu)
-{
-    return target_words_bigendian();
-}
-
 void cpu_dump_state(CPUState *cpu, FILE *f, int flags)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
@@ -388,7 +383,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->write_elf64_note = cpu_common_write_elf64_note;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
-    k->virtio_is_big_endian = cpu_common_virtio_is_big_endian;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
     dc->realize = cpu_common_realizefn;
     dc->unrealize = cpu_common_unrealizefn;
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index fe90dde8681..078e1a84a58 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -54,6 +54,16 @@ int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
     return ret;
 }
 
+bool cpu_virtio_is_big_endian(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->virtio_is_big_endian) {
+        return cc->virtio_is_big_endian(cpu);
+    }
+    return target_words_bigendian();
+}
+
 GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index e02544b2df7..ab516ac6144 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1972,9 +1972,7 @@ static enum virtio_device_endian virtio_default_endian(void)
 
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
2.26.3

