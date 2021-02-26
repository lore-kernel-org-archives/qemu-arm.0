Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1445224lfg;
        Fri, 26 Feb 2021 08:57:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxew/93NpUSFs6+EAPHRMy2VnlevVTQd5yJz5OJnCxdbDEIDqezEQeIYRJAvhPNF9EygdkG
X-Received: by 2002:a92:c54b:: with SMTP id a11mr3282816ilj.208.1614358669617;
        Fri, 26 Feb 2021 08:57:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614358669; cv=none;
        d=google.com; s=arc-20160816;
        b=YCC/3uNCjHCiRGtEnoBADYiW+Qn2tT7KImJb7BhZP10BQjoHolmuernqzWwlC2zF1j
         kWvmkowg0S+9m1hs31z2yF/5RwOuCiCoSfm62HVtAuH7NNYxub/BLra0pn2j70iJ3AHb
         uiY7hQtGVX3ieRubSH291JlHCmFhFOrXtwjCxArb9iZSMJ3MbqOKubGdIxIiO90vpo3j
         hvip0iL73mugSRw6QLOizogs+dJSR2fyfhBewLp7MbNWbiY8xiuDM9DH2vH66nVxB2lc
         NPoQclsxEgrvQGKKrdN9T14JoYy14LKJcZBA0A4Cv5SJ1wt+2IgSnMfC8akKYiNWbNAZ
         X/bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1HLdFJWL8bdcObinvQ00cBeAj9ZX31JFSy5j9SyL+cY=;
        b=BAUvRKaRHiYpHvhASewkqrkhclS7JFkaFdBPZHRHmMU/T6jvBd8uOJWc/QstjnKrmj
         xZp5wpHLeeOoYV1OG5hEpetZwuse1XmzoP/xvmlj0Zy4l1PANYzmzrT/1m0wX6MVrtb9
         J8Xnqz4T6GLhBjfDO4e4M+QizPauoFNur4eMNgfBDA1moB9B8vXEA0oyGFX5u9zMPg0/
         0Rmpm4AMFz/0AiW6xyEonH29TxcghPQwpnYL0FEt9/rE8tSxXhE9J11VGyiDUzMyhRGb
         TKZ/TchDG90JDDajE+ZxwYmdZrI20CvuIvGDSV1ZS76C45AXvShLEEFjo0ru5EG9ReA5
         AjDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CK0+fUr9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l3si4410832iow.35.2021.02.26.08.57.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Feb 2021 08:57:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CK0+fUr9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:33726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFgR2-00026d-R9
	for alex.bennee@linaro.org; Fri, 26 Feb 2021 11:57:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg4B-0005Kb-3L; Fri, 26 Feb 2021 11:34:12 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg49-0007va-LG; Fri, 26 Feb 2021 11:34:10 -0500
Received: by mail-wr1-x42b.google.com with SMTP id v15so9179862wrx.4;
 Fri, 26 Feb 2021 08:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1HLdFJWL8bdcObinvQ00cBeAj9ZX31JFSy5j9SyL+cY=;
 b=CK0+fUr9Ri8+o36olFsTDqO4jHpX4S2hLUOCMak8AFIZuvFCkl4UZY5Sde7CDzdoAZ
 VN7hNDmTHdCR40Fsbqa2HUHcJXfsb5WCj9+CfXWx0xuEoqZ2VUC3p9ViOosLoleU6VGW
 eKILoFtYMLRlkrL+ZFi1wWJzd417jaMdhOVdty16IvRkvRWc+1egm1/b9/N+7dQvfcVM
 YERC41+mZBzv3PbjZpAIAXSZFasITmylFC/4oV3e+mDLHiJGGNbVjox2RLgd5tDSJkKm
 rAVIf5EpViILwr3JGUUoj3q1OpiQAKiD+WSPJsI3Ljzfhk2ztY8lawfBQz6R5zpVYhfo
 Z+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1HLdFJWL8bdcObinvQ00cBeAj9ZX31JFSy5j9SyL+cY=;
 b=F8regIPL1VWZY3KvwQ1Qk1fbiaqrDb+999/HmOsATz3gdiOWk80ckXi8uqdkfPsMVE
 aO18Z933sQOamK0u9auNwWc3b/qFh/Rt1TCfZPGSYe9gVYD0jXR3O+b3mgzrVgAMHY9x
 PyJxEbpp5bJRAb/dCXauEUPmmRWV6LLvnpaQRPz/WiC0YNxyIVhsKfBt5k2jk/7JL5UA
 Rri3qwlL9K+00gwzzXdT4AfQmTFvfle2F5a65+qxyIGSsmCzp4KN+R50vVlJE+vRmjWv
 dHxkh+CjYPQc+MFBVWu1OXwOypZWB1YoGG8QujejKkycb9MMROwtagcsB1cSc/N8F90I
 NmFQ==
X-Gm-Message-State: AOAM5313mktBcOsFr6GaIG5G8KlEfWQls/JfnJpt3m9oudDFNojjrZm5
 2JAyLQWhtoHrLs0dBpwOe9WBjTC3YaI=
X-Received: by 2002:adf:bac8:: with SMTP id w8mr4196713wrg.68.1614357246883;
 Fri, 26 Feb 2021 08:34:06 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f7sm11919094wmh.39.2021.02.26.08.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 08:34:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/16] cpu: Move CPUClass::get_paging_enabled to
 CPUSystemOperations
Date: Fri, 26 Feb 2021 17:32:26 +0100
Message-Id: <20210226163227.4097950-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226163227.4097950-1-f4bug@amsat.org>
References: <20210226163227.4097950-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
X-TUID: jAvlDdRyy4AO

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 6 ++++--
 hw/core/cpu.c         | 4 ++--
 target/i386/cpu.c     | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index caca5896592..47e65d517f6 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -89,6 +89,10 @@ typedef struct CPUSystemOperations {
      */
     void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
                                Error **errp);
+    /**
+     * @get_paging_enabled: Callback for inquiring whether paging is enabled.
+     */
+    bool (*get_paging_enabled)(const CPUState *cpu);
     /**
      * @get_phys_page_debug: Callback for obtaining a physical address.
      */
@@ -161,7 +165,6 @@ typedef struct CPUSystemOperations {
  * @dump_state: Callback for dumping state.
  * @dump_statistics: Callback for dumping statistics.
  * @get_arch_id: Callback for getting architecture-dependent CPU ID.
- * @get_paging_enabled: Callback for inquiring whether paging is enabled.
  * @set_pc: Callback for setting the Program Counter register. This
  *       should have the semantics used by the target architecture when
  *       setting the PC from a source such as an ELF file entry point;
@@ -204,7 +207,6 @@ struct CPUClass {
     void (*dump_state)(CPUState *cpu, FILE *, int flags);
     void (*dump_statistics)(CPUState *cpu, int flags);
     int64_t (*get_arch_id)(CPUState *cpu);
-    bool (*get_paging_enabled)(const CPUState *cpu);
     void (*set_pc)(CPUState *cpu, vaddr value);
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 606fc753bf0..8bd7bda6b0b 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -71,8 +71,8 @@ bool cpu_paging_enabled(const CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->get_paging_enabled) {
-        return cc->get_paging_enabled(cpu);
+    if (cc->system_ops.get_paging_enabled) {
+        return cc->system_ops.get_paging_enabled(cpu);
     }
 
     return false;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 92691a22de5..743c6b6d164 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7415,7 +7415,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = x86_cpu_gdb_read_register;
     cc->gdb_write_register = x86_cpu_gdb_write_register;
     cc->get_arch_id = x86_cpu_get_arch_id;
-    cc->get_paging_enabled = x86_cpu_get_paging_enabled;
+    cc->system_ops.get_paging_enabled = x86_cpu_get_paging_enabled;
 
 #ifndef CONFIG_USER_ONLY
     cc->system_ops.asidx_from_attrs = x86_asidx_from_attrs;
-- 
2.26.2

