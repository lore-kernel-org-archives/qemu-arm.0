Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3943707lfg;
        Mon, 1 Mar 2021 13:54:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzku5THck2YH5QZCc+EVWA392xXN6LbKrIBnila6vcV89wiFCB1VqBhlRmYsvHbeWNOK4EE
X-Received: by 2002:a05:6e02:1bc5:: with SMTP id x5mr5875259ilv.48.1614635659678;
        Mon, 01 Mar 2021 13:54:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614635659; cv=none;
        d=google.com; s=arc-20160816;
        b=iwBUVEkQaYMaBezql/577GgIOBTS9isi8lokFAoZcexCCo/S6cW7duQurpvrauXzZ2
         vmgzP0J7NsQrhDhs9iVZrtsgx6i4zljAkO35KoXP2VsYNwfAguT5Xmrvdby05DBTs3Kk
         i33HqlH+MAl5gA9rq3W4SrD+p52C+UgMXwXxrCs4Lach9F3k4fbAiZRKMEtmxsTsPVau
         15D83o35vDt2d6mN7JrgkpU/92O6wN2LsKgq6DmIDWll2Vp3E+qc6kfQcWLkBkx9fHM6
         wX90Jarn0gLXUv7wYo7+aD4HKvBM/zj9mup6Cd5yk2iDtx+Aq8scH2YxSmlxoF++xyS7
         M9Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=alNnX6GeE8sTwFbIWBvN2VrnGh2+v4nR5yjKLFDEoAw=;
        b=hUcD5iAehuxUI02q/kbykVx2Ku1BKaif48KOih6X4zGyWu7tq/W1bL8xK+YFUU3cT3
         YhOI3w7Ij+89mSClS6zSzL1LedMuY3zP0oDAYvc+g88q5upJ7wlPyXf4nTW7tCN1fdw/
         RUnWZNNQix+MducxyKiNgT1+hxbyL7uh0UrKqUadSV8NbypI3TyUTuBh9tbik8r5mO2a
         pzGGD8115xqwI1N4QjsmRMyjlOOIyqc44IfJdtJvkMYAjJnfHS20PDqcBNxIbkUG43IB
         nCfvGicBh3FZjkNcx43Yi7zc0ZwQJneyBw13fHgE86ALLSsfjGpv/4tPtzpxBjt7Hp7q
         YxmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=N356hqnO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a24si17785322iok.37.2021.03.01.13.54.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Mar 2021 13:54:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=N356hqnO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGqUc-000561-SI
	for alex.bennee@linaro.org; Mon, 01 Mar 2021 16:54:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGqS4-0000m8-Da; Mon, 01 Mar 2021 16:51:40 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:42013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGqS2-0004sk-VR; Mon, 01 Mar 2021 16:51:40 -0500
Received: by mail-ed1-x52f.google.com with SMTP id v13so6303543edw.9;
 Mon, 01 Mar 2021 13:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=alNnX6GeE8sTwFbIWBvN2VrnGh2+v4nR5yjKLFDEoAw=;
 b=N356hqnOS53JeEI9N4ogQ9eqEmQUvctHKDSka4SwT5jqJexytNWOdfuRkdjn5RZ/4f
 D9Yn3Qi5nGMd+xXN4DYkNybIOo0Njqfg2Qx8Wch53Xu7ADntj9ZMSUHCtarUI84otPW5
 0QRcltdYTQLEzYkCIMFViitJ6l9dOdpx6fQQQbqEIwoDkqRHxF+Ri2tBZu6blkcc/yod
 +9PxMGHdFoGpp47QmJSORTnH/CdJ1YzIWzjmtFoqQBUBwZK2WzOP+LHoMi3z5cj0T8Yb
 qAaSVJrYSMuPYZXNFrEAd9ZV2nHwDnIA4I2Z7heOvyfTKD2f2KSrrSS9YpsBtrdx6dDM
 Dqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=alNnX6GeE8sTwFbIWBvN2VrnGh2+v4nR5yjKLFDEoAw=;
 b=g/N9/KPbvO44sQUgol/MgZeAtbCLkWYZ+C8N7ovQhPIaae3PQ9wMK1u12FE08YH608
 eui8SYFpYVaOhxkrmWJIngRtzz65KvNnvrufwDJY28/s4B/Oo5tbD/bniT1qCVTTVZAi
 0U8okKuZFQ7cZyZsiepQ4Ak93IreI+Q8CVkXHAo5/sGVCOlsdC0eRBPRmb4zl1EU4Tbl
 si4HkSl7E49sxLTDJMR9fS3xiVCZ3OSlyndvgIJHwT0zD1mEYotRXy+JkTg+qOVju3qu
 bEY7kCWGfz/oCWTkTYvPTtVQtLFkcWXvtoBHPBzyeRSkdzosOlNFLrwSxdN1tF70+Qri
 E9vA==
X-Gm-Message-State: AOAM530iyPc+11XSZMWMzjKHpFTq3nW4ExPHaXToryxFsuCoS8Ozugdr
 cCg9UGmw6I2KrQgzHnUboB7vQgAbvEg=
X-Received: by 2002:a05:6402:51cd:: with SMTP id
 r13mr17712407edd.214.1614635495810; 
 Mon, 01 Mar 2021 13:51:35 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z16sm15101159ejd.102.2021.03.01.13.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 13:51:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/17] cpu: Introduce cpu_virtio_is_big_endian()
Date: Mon,  1 Mar 2021 22:50:56 +0100
Message-Id: <20210301215110.772346-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210301215110.772346-1-f4bug@amsat.org>
References: <20210301215110.772346-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Michael S. Tsirkin" <mst@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BHypPvfYLmS+

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

