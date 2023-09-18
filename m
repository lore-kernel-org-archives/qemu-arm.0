Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3010787ejb;
        Mon, 18 Sep 2023 09:03:36 -0700 (PDT)
X-Received: by 2002:a5d:5088:0:b0:317:e542:80a8 with SMTP id a8-20020a5d5088000000b00317e54280a8mr7924909wrt.15.1695053016526;
        Mon, 18 Sep 2023 09:03:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695053016; cv=none;
        d=google.com; s=arc-20160816;
        b=JnpKYFerBZ/i1zR5aBTOXmNJ1VsjpbbgGg4hxquW5UdBflUw/y2m4pfv/8pTS/8ucE
         OyvvMGa0/PRh0Wz5sYnBzoxg/cauN3AbkzhzydjbgQ2Y+wcceOA+Z2rJd3urp6Xc4jG+
         3m8UOrrA7E1wIXYTFrOKXgHXEmONmpm6OTHU4wk/c/TwW5eGdsaAu+f7vQ4DG0khl1vZ
         b3wyL9Z6ao1kVKSyrlvVNGQnZihV9UveAAkVw0sIw0Mgtild6b1eruWYRnlCVrozQfh8
         G6dsrvDIKNxuQMQh72uoVKJQAxRYAYEAhjg4Utjl28Ocn5/IRqecw1a4LgH20Z0bRf+v
         1iNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kTBjPJZgBk13UdBUXwIisPTyIoW0XcuNCZty165NaD0=;
        fh=9HVYub9IUdGxYx1Tdl+8JO5e/0dtoki6g0y7v7HxI1I=;
        b=LxJimXbxpJbTbh3a7A5caA44P2f17+iSp+4jaKi0bDFoKVfyVqmckteYp9774/lFOq
         STzQze5UbIatNtVTSkw/uyIMQSuznc0xq0L2ZbStgsYrJjAYsjADoydD1C7kLQwpD4d2
         nNtwUgQ7AO5aZt3yhm5yNtl5v5IN76vCULH21TFnmPq09S3MQaIrdj7Fj586me3aNlB2
         NdQTaoJMK4WDlNH9gO/xD45Jj+MDRCk/GwrxBN6bdonp6/SuFIZ4yQAxWIDOMMJi/YcU
         muHmFZ47e+krZIZYmeQEEll+VjeTDQmBSWiVnYtAd0cN8EzMtPy4h6RHqcsG1sN10jL5
         35hA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eXWOf1DG;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id hx13-20020a170906846d00b009adfc28f8e8sor929322ejc.8.2023.09.18.09.03.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Sep 2023 09:03:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eXWOf1DG;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695053016; x=1695657816; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTBjPJZgBk13UdBUXwIisPTyIoW0XcuNCZty165NaD0=;
        b=eXWOf1DGHIUQ6SVfCkYGrBhHvj/+ScGV/McLwv3PEHSlkJvu67N0ltjkcmv8YbI4Og
         gulsfes3ZlEihRsOr/5ClPaQCHlmgRPIIGRuqB7gkVAUacosEuTTl1PqPwicKhvhe/o4
         qrmtq0YJetKrU3e//axoaIkgXPyYsMQfcqhqV+HxIl2d9Bl31Ag1GS5fsFAXjM4oYiTC
         Pc3AJ+uxDZ68W6Tpe3pk2mVq3fxpWx5q8UGjaHjkKdFxjbyYtMZERtftaBBjDwgBGEpr
         ycaeNpHfgP+xIsAez+gfnOpsY//UnG7SDLyHQOey4H7rklaWBBEQVO48Ryld0dgycIQ9
         95Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695053016; x=1695657816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTBjPJZgBk13UdBUXwIisPTyIoW0XcuNCZty165NaD0=;
        b=qOgluon6aOfgaXaYbffl/zM9V+RSeS9SJYaVO/FKJSU+lMexIjw/9CWtqRV7PK0pQT
         sjMMNjt0VIzIon3ClHoLSYNUSqF9hG9RSxKJBoyvOVXgcZSWYbFlcYFQARrJquwtu1+c
         NoH9p5bkd5uvKi9k471X0MhKzdgRSmZ2Eh3544QLfiimHptGYJP8572wcAKPI1wak9YK
         GvjXU1l6aIa+BOsPQsXvjvDvZBU4NQcmZ1nEaFNVqyutRTkqcTqCYMuH8uSBeWhxeUzG
         QUTycoZTR5PJN2t4ptGO+VV6/gmIiYvr8lDqKmK+eJLgxm0WvHAeBDW2HRr7Kw2BmoMh
         ydSQ==
X-Gm-Message-State: AOJu0YzqPT5v7tqLthEN2g/W3diyBgfcfnZKsqFd5bvQ2QqH0qzDmNiS
	tjJQBn1oNICyjoxMF0vg7orAR0Uu
X-Google-Smtp-Source: AGHT+IFq/QL5z5bo/y5y/kDRcLT1d9XsePcCQP72fHn+R4rgmGpcF6OIn0/xzDT8r3fspp9H+r5Uyw==
X-Received: by 2002:a05:6402:1bc8:b0:530:be79:49e7 with SMTP id ch8-20020a0564021bc800b00530be7949e7mr6068787edb.37.1695053016011;
        Mon, 18 Sep 2023 09:03:36 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id eh16-20020a0564020f9000b005256aaa6e7asm1688491edb.78.2023.09.18.09.03.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 Sep 2023 09:03:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Anton Johansson <anjo@rev.ng>,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	Marek Vasut <marex@denx.de>,
	David Gibson <david@gibson.dropbear.id.au>,
	Brian Cain <bcain@quicinc.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Claudio Fontana <cfontana@suse.de>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	qemu-ppc@nongnu.org,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Alessandro Di Federico <ale@rev.ng>,
	Song Gao <gaosong@loongson.cn>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Chris Wulff <crwulff@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Fabiano Rosas <farosas@suse.de>,
	qemu-s390x@nongnu.org,
	Yanan Wang <wangyanan55@huawei.com>,
	Luc Michel <luc@lmichel.fr>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Bin Meng <bin.meng@windriver.com>,
	Stafford Horne <shorne@gmail.com>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Bernhard Beschow <shentey@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-riscv@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Greg Kurz <groug@kaod.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Markus Armbruster <armbru@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	xianglai li <lixianglai@loongson.cn>,
	"Salil Mehta" <salil.mehta@opnsrc.net>,
	Igor Mammedov <imammedo@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Bibo Mao <maobibo@loongson.cn>
Subject: [PATCH 07/22] exec/cpu: Introduce the CPU address space destruction function
Date: Mon, 18 Sep 2023 18:02:40 +0200
Message-ID: <20230918160257.30127-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918160257.30127-1-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: sK+QRiXY2+6G

From: xianglai li <lixianglai@loongson.cn>

Introduce new function to destroy CPU address space resources
for cpu hot-(un)plug.

Co-authored-by: "Salil Mehta" <salil.mehta@opnsrc.net>
Cc: "Salil Mehta" <salil.mehta@opnsrc.net>
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Cc: Song Gao <gaosong@loongson.cn>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Ani Sinha <anisinha@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Eduardo Habkost <eduardo@habkost.net>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: "Philippe Mathieu-Daudé" <philmd@linaro.org>
Cc: Yanan Wang <wangyanan55@huawei.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Bibo Mao <maobibo@loongson.cn>
Signed-off-by: xianglai li <lixianglai@loongson.cn>
Message-ID: <3a4fc2a3df4b767c3c296a7da3bc15ca9c251316.1694433326.git.lixianglai@loongson.cn>
---
 include/exec/cpu-common.h |  8 ++++++++
 include/hw/core/cpu.h     |  1 +
 softmmu/physmem.c         | 24 ++++++++++++++++++++++++
 3 files changed, 33 insertions(+)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 41788c0bdd..eb56a228a2 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -120,6 +120,14 @@ size_t qemu_ram_pagesize_largest(void);
  */
 void cpu_address_space_init(CPUState *cpu, int asidx,
                             const char *prefix, MemoryRegion *mr);
+/**
+ * cpu_address_space_destroy:
+ * @cpu: CPU for which address space needs to be destroyed
+ * @asidx: integer index of this address space
+ *
+ * Note that with KVM only one address space is supported.
+ */
+void cpu_address_space_destroy(CPUState *cpu, int asidx);
 
 void cpu_physical_memory_rw(hwaddr addr, void *buf,
                             hwaddr len, bool is_write);
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 92a4234439..c90cf3a162 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -366,6 +366,7 @@ struct CPUState {
     QSIMPLEQ_HEAD(, qemu_work_item) work_list;
 
     CPUAddressSpace *cpu_ases;
+    int cpu_ases_ref_count;
     int num_ases;
     AddressSpace *as;
     MemoryRegion *memory;
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 18277ddd67..c75e3e8042 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -761,6 +761,7 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
 
     if (!cpu->cpu_ases) {
         cpu->cpu_ases = g_new0(CPUAddressSpace, cpu->num_ases);
+        cpu->cpu_ases_ref_count = cpu->num_ases;
     }
 
     newas = &cpu->cpu_ases[asidx];
@@ -774,6 +775,29 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
     }
 }
 
+void cpu_address_space_destroy(CPUState *cpu, int asidx)
+{
+    CPUAddressSpace *cpuas;
+
+    assert(asidx < cpu->num_ases);
+    assert(asidx == 0 || !kvm_enabled());
+    assert(cpu->cpu_ases);
+
+    cpuas = &cpu->cpu_ases[asidx];
+    if (tcg_enabled()) {
+        memory_listener_unregister(&cpuas->tcg_as_listener);
+    }
+
+    address_space_destroy(cpuas->as);
+
+    cpu->cpu_ases_ref_count--;
+    if (cpu->cpu_ases_ref_count == 0) {
+        g_free(cpu->cpu_ases);
+        cpu->cpu_ases = NULL;
+    }
+
+}
+
 AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx)
 {
     /* Return the AddressSpace corresponding to the specified index */
-- 
2.41.0
