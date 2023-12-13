Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1431380ejo;
        Tue, 12 Dec 2023 22:42:59 -0800 (PST)
X-Received: by 2002:a17:903:2985:b0:1d3:492c:7db7 with SMTP id lm5-20020a170903298500b001d3492c7db7mr1429145plb.5.1702449779008;
        Tue, 12 Dec 2023 22:42:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702449778; cv=none;
        d=google.com; s=arc-20160816;
        b=voPKsJUnqgC/OLWIwknCI/J7fqGCRntdGA2OqyOkHu7+Gx+CR+zQoteIK7PLUmLSCZ
         HrvvtSwwzy64XDwUJMI8G6wVjMJLt4jd75adQi1l7IkffCLVJiZET5i3fkrMWVSox+0H
         Ac6gjOZSKyiwNlVkqC5daQN9v8dGloEbLEoMkK2h6qSSOCW4ts6QG8l4YTyDGloooHZv
         69ttMMWlwTWD5UbNKQjs5YDtZuvVVVg1Mbv407/PjGbEatZnTWau2NH6x81FnoQiHe/f
         12aVWY9uptvmIGs1I0WrrryKTwaMAzlxeoYBdCR51YSKDYWVcxzLwR6+yltCd3NZ0X5o
         eM9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=Wn4VZpkFVHk7Ko8wYff//0IioTjYG3KBdhjIKNLGDEs=;
        fh=HE3HFS1hEYtTzJ0gsfroCOJ69k1mn8lcAqBvf3V8Iho=;
        b=OrkgjiiwdgsZyq7PF3hdOL7gCHEZ6lL2lgxtc58UgqdIC7iBGqp0E70o4RUviXUkXH
         xh1vthUFng/mYQrjZO3WonSBVRWt3e37AQCnsgT2seE8ZBWKbYlxhcw5AKMY5iu/2yys
         b4LegEGqhq8DJyhU0tHFE7yiD0yl9tCRqDOY5lZhOExXR4LWYsffI1THlu5AEsrTcVM1
         sH+9HxFuD9mta68mkX6zcbZlhS6KUpr+e4nW2YHJ9GEslsQntKyklUbLbyhL/VYrXXTg
         RP4B3Hi8FMh4TK106UL2Ru8yGGPf2LMlaPI70M2JiiHNqLKjxHlr7wHsS8AmXrVOlCjP
         oCcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=hYfoxT8M;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a8-20020a170902900800b001d04511c0d4sor4785434plp.3.2023.12.12.22.42.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 22:42:58 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=hYfoxT8M;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1702449778; x=1703054578; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wn4VZpkFVHk7Ko8wYff//0IioTjYG3KBdhjIKNLGDEs=;
        b=hYfoxT8M/e6NKNE/pSFUD85aFxOIbPWthMnTkY36kwvFDzSi6IYq4HxbxS3eWg5q8t
         Jm5W2B9aV5mrCDchAfVoiyEIjr2YHV34i5t5ewoCGj+IIRSTNjRFJ9VG7qXPtpjScZVu
         IPxyHK9KB3K0usZou6epoHSpVKy5K5F2vwN4+aTchMqfddjU3pWtIX5E43rxdnIJqmFD
         DIUDlinbhm7VpQpHma3fywaItmw7WI4RRiVvgGJcF1DZKoScUUp0NA6NhWMTHZzLAGrD
         /e2JjwkXRijc6s3tAlF2n4PKE5d7c+JfNRPEGUqLzK+um7lRV+G0Fl1G7AGmPu387JfG
         V02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702449778; x=1703054578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wn4VZpkFVHk7Ko8wYff//0IioTjYG3KBdhjIKNLGDEs=;
        b=UgjMOyo5kBKGUIpXVsbBgd24WAF/h+kKzqpz9Ihp6t7T1i0bO5YGByu8I9ZYR4Oi+x
         XxmRAqUNYdjp6rPg1jNNCYGXAcGreb6v6aYQEIGK1tMbEDg1ERZQKAMfQlfIV1jsTeZU
         C16wYqez3MflrrqvDlC80igflYPKGYUo+G+wvDtcf3DFWJf61xwPOfc/PzNhtkgcSjB+
         dlER/weP9jnOFC2/0Cj24ett6Qkeb6QdSz4+aZ25RbpiKqv5dMYEyHYD/57kOpyVmzZN
         q4rcZ67PzDiWkuj0Omirv8o+B83Yh47SIeDjH2hYar03VTgqQmgznicVuQFSHwonYbmb
         RKpw==
X-Gm-Message-State: AOJu0YzW0CORO5hzEdGEdhXSWLILOV5d2vPvW8wXHNGAJNmcD620Tgjd
	1dOwXew5ipF2zdUvaye2JJ0nRA==
X-Google-Smtp-Source: AGHT+IFsZ15AoRzOWdGy2m310RhnrUFQxdYVP5KFzsfF5G80etV04hMbum0bqNQz/0KX/7jHR847XA==
X-Received: by 2002:a17:903:40ca:b0:1d0:6ffd:6101 with SMTP id t10-20020a17090340ca00b001d06ffd6101mr7908474pld.35.1702449778508;
        Tue, 12 Dec 2023 22:42:58 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([157.82.205.15])
        by smtp.gmail.com with UTF8SMTPSA id d3-20020a170902aa8300b001d05433d402sm5028984plr.148.2023.12.12.22.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 22:42:58 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 13 Dec 2023 15:41:10 +0900
Subject: [PATCH v17 11/14] gdbstub: Expose functions to read registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231213-gdb-v17-11-777047380591@daynix.com>
References: <20231213-gdb-v17-0-777047380591@daynix.com>
In-Reply-To: <20231213-gdb-v17-0-777047380591@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>, 
 Laurent Vivier <laurent@vivier.eu>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Yanan Wang <wangyanan55@huawei.com>, Michael Rolnik <mrolnik@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, John Snow <jsnow@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>, 
 Mahmoud Mandour <ma.mandourr@gmail.com>, 
 Mikhail Tyutin <m.tyutin@yadro.com>, 
 Aleksandr Anenkov <a.anenkov@yadro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, 
 20231213-riscv-v7-0-a760156a337f@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.12.4
X-TUID: frgj1D+IQvIA

gdb_find_feature() and gdb_find_feature_register() find registers.
gdb_read_register() actually reads registers.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/exec/gdbstub.h | 29 +++++++++++++++++++++++++++++
 gdbstub/gdbstub.c      | 31 ++++++++++++++++++++++++++++++-
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index da9ddfe54c5b..12336cb60064 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -111,6 +111,35 @@ void gdb_feature_builder_end(const GDBFeatureBuilder *builder);
  */
 const GDBFeature *gdb_find_static_feature(const char *xmlname);
 
+/**
+ * gdb_find_feature() - Find a feature associated with a CPU.
+ * @cpu: The CPU associated with the feature.
+ * @name: The feature's name.
+ *
+ * Return: The feature's number.
+ */
+int gdb_find_feature(CPUState *cpu, const char *name);
+
+/**
+ * gdb_find_feature_register() - Find a register associated with a CPU.
+ * @cpu: The CPU associated with the register.
+ * @feature: The feature's number returned by gdb_find_feature().
+ * @name: The register's name.
+ *
+ * Return: The register's number.
+ */
+int gdb_find_feature_register(CPUState *cpu, int feature, const char *name);
+
+/**
+ * gdb_read_register() - Read a register associated with a CPU.
+ * @cpu: The CPU associated with the register.
+ * @buf: The buffer that the read register will be appended to.
+ * @reg: The register's number returned by gdb_find_feature_register().
+ *
+ * Return: The number of read bytes.
+ */
+int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
+
 void gdb_set_stop_cpu(CPUState *cpu);
 
 /* in gdbstub-xml.c, generated by scripts/feature_to_c.py */
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 420ab2a3766b..9db623f1f730 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -490,7 +490,36 @@ const GDBFeature *gdb_find_static_feature(const char *xmlname)
     g_assert_not_reached();
 }
 
-static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
+int gdb_find_feature(CPUState *cpu, const char *name)
+{
+    GDBRegisterState *r;
+
+    for (guint i = 0; i < cpu->gdb_regs->len; i++) {
+        r = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
+        if (!strcmp(name, r->feature->name)) {
+            return i;
+        }
+    }
+
+    return -1;
+}
+
+int gdb_find_feature_register(CPUState *cpu, int feature, const char *name)
+{
+    GDBRegisterState *r;
+
+    r = &g_array_index(cpu->gdb_regs, GDBRegisterState, feature);
+
+    for (int i = 0; i < r->feature->num_regs; i++) {
+        if (r->feature->regs[i] && !strcmp(name, r->feature->regs[i])) {
+            return r->base_reg + i;
+        }
+    }
+
+    return -1;
+}
+
+int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
     GDBRegisterState *r;

-- 
2.43.0
