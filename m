Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1074495njc;
        Mon, 30 Sep 2024 00:36:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVdjW4YYN7eO6YqAMOqlh/3NsTR+8NdPKiiNaRCS7eH7zS9C/JiYxB2v6a6RIASrj5rE1vF9fYISa2o3g==@linaro.org
X-Received: by 2002:a05:600c:45d0:b0:426:6308:e2f0 with SMTP id 5b1f17b1804b1-42f5847e2d3mr77907055e9.26.1727681770625;
        Mon, 30 Sep 2024 00:36:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727681770; cv=none;
        d=google.com; s=arc-20240605;
        b=K8KHrpct7qRFACsV/mb+HVrYNLhL38ax0bK0FeBE6GAHrPwlEC5rF5KUPig+C3/wmy
         vO9D1BX9ItUXnfUnt+y7+ke4dSmvk+DxDO9OwPr9i0XFsdotddddbTZdu7NE7kqSCVrO
         uauQFnkqBaorzxolLfTO2WrGQZZ0do1mioDVTM68een7igE3qdzth1wcwItQZpZXxS6X
         SLNYVpzXyhzl1DUFD7uhzmeH6RCtP6XtDGpKIhTKbQlB7chCWKuB1Tdq2T39LVq4w1k1
         tishchUdDWHBs4PK+/KKUv+YE5XbG2WtklmVs1xBk9UYNuI5xDg5R0PoaVxbpxFlWnXX
         Eriw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RyfJ60ZwiZ7J7acEGIws/WvnHoIJtgQD50MT+DOE6Vo=;
        fh=JCPR9E06Hy1GAKoVnhsLR5qA+fVmBh8e6s4U+nPUDjQ=;
        b=ZrItS5MTJm843YGM4lnx84oV+egr9jXey9hXNn9R8cvl1/XnKc+43UpFk+IiTA1Xe7
         jGSfugzBcUOkUo1g5HWP/sg9MysS6PjV/9RKK6a236QhpnUD6/cj5CBSSBs4t80PXo6u
         mWRraaKcbXhsgBRquOTQLZfL3v/UIeLvcfhudragKLo+/uG21P1TnxD5CSUD4ClHwqdP
         K10R+hjaqBWQz9IgyeHke5FaDLH1Q5LZfFxgYHPuULucj2US8IsXE1z7K7VSUG41vfFO
         Jz6qJ1S6qg+vc2vi7GAyqR8V59XOHjb5aQ3fdKQMh4F/bhw10r9jYaVUGUH8lbXUZUwE
         Eq9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tP768/Ck";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-42f5f313529sor10432775e9.8.2024.09.30.00.36.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Sep 2024 00:36:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tP768/Ck";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727681770; x=1728286570; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyfJ60ZwiZ7J7acEGIws/WvnHoIJtgQD50MT+DOE6Vo=;
        b=tP768/CkePF3zn7SK3e/xoTKQZqYvOW+oYwKiD58tP5HvbFSF7BQ7NlwKeNB9sEHQk
         +h0CfNvkuctcF/nqqi/zdE0/YXJgat/87+hzj/xUA14bb43U9JJoq07f+tW7UQO0S+On
         uzifErFjpwA0ImhutN48AtBlXBF+LV6DMEMHHAIbWHn83uZNU44A3Nu7N3b0Bvfe96Bk
         I7ua60ZYJeScHEc7xu2f9/ELyxhVq846e1e8zUKke8CxPK0MwAIqLK+CgdxmugdJ88Uq
         cGLnQQ89TejNh1S2CyFTkyei3M3TokRWLyOG7QlIm+14VNIGP2xoulWpX+h1a5wvUytO
         h9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727681770; x=1728286570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RyfJ60ZwiZ7J7acEGIws/WvnHoIJtgQD50MT+DOE6Vo=;
        b=mYhQXkvfI/NfUBW7PBiSQYIZBpcO/TNVGCuUOes+nwk5Uyjv5QvstfxtgvUoeL3x+E
         +Yn4l4RvFA2Kg7zQwquq1ngYJ+Tc5vPan2dgMByJo8lM2JDsjKW4wtLmxbq4iWADpLZG
         bt96ZOZv2f1eZ6iYXcbmmufO86FJztGFbQbQZaB8otKqEIV8UmQIfjM1zG3ZiakfBGUk
         0wnRbhHMaqTTp7p1m2Maom8sFwptayJFQ9LrkgTxk6Gtz5bHUXFowEgDl72IwDeAk6n5
         EOJZA0Or5pb+rkvaK95nHSuaK5esKzsgnLc+OuOZEBbVqqbXDPc5xHsJD5tHXTMZLchf
         K64A==
X-Forwarded-Encrypted: i=1; AJvYcCVSCsAvKOACzB5Vu/JmEmqsg1Xb30cxfjAG46X/SJGUu0FK199u4C2DuOBNJa9eXw43D47HzQfJOAk3rQ==@linaro.org
X-Gm-Message-State: AOJu0YxvUXyrYyNmpz9PhDx5944xmD2dZiW5O36unl0FVv5XyRnsiGas
	QhGnMZGHwSOFuZDVs1CN080dmX3ITBTVD2zhd/eL05UpcGfiz+jY49kAUgfyAvQ3Yw==
X-Google-Smtp-Source: AGHT+IG2gsv4mq4+t28yXE71qvp6d8mpB4wSDB4DPNTelRdnOp6bYuTIvq+usLJM1DB/dwuL1E7PwA==
X-Received: by 2002:a05:600c:45c9:b0:426:63b4:73b0 with SMTP id 5b1f17b1804b1-42f5849731fmr76872605e9.34.1727681770017;
        Mon, 30 Sep 2024 00:36:10 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (186.red-88-28-13.dynamicip.rima-tde.net. [88.28.13.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a52308sm141836745e9.43.2024.09.30.00.36.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 30 Sep 2024 00:36:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Jason Wang <jasowang@redhat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Anton Johansson <anjo@rev.ng>,
	Peter Maydell <peter.maydell@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Sven Schnelle <svens@stackframe.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	qemu-arm@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Paul Burton <paulburton@kernel.org>
Subject: [PATCH 09/13] exec/memory_ldst_phys: Introduce ld/st_endian_phys() API
Date: Mon, 30 Sep 2024 09:34:46 +0200
Message-ID: <20240930073450.33195-10-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930073450.33195-1-philmd@linaro.org>
References: <20240930073450.33195-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kAF6KVTcWB4m

Introduce the ld/st_endian_phys() API, which takes an extra
boolean argument to dispatch to ld/st_{be,le}_phys() methods.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
TODO: Update docstring regexp
---
 include/exec/memory_ldst_phys.h.inc | 66 +++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/include/exec/memory_ldst_phys.h.inc b/include/exec/memory_ldst_phys.h.inc
index ecd678610d..8ea162b40d 100644
--- a/include/exec/memory_ldst_phys.h.inc
+++ b/include/exec/memory_ldst_phys.h.inc
@@ -74,6 +74,16 @@ static inline uint16_t glue(lduw_be_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
                                                MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
+static inline uint16_t glue(lduw_endian_phys, SUFFIX)(bool big_endian,
+                                                      ARG1_DECL, hwaddr addr)
+{
+    return big_endian
+           ? glue(address_space_lduw_le, SUFFIX)(ARG1, addr,
+                                                 MEMTXATTRS_UNSPECIFIED, NULL)
+           : glue(address_space_lduw_be, SUFFIX)(ARG1, addr,
+                                                 MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
 static inline uint32_t glue(ldl_le_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
 {
     return glue(address_space_ldl_le, SUFFIX)(ARG1, addr,
@@ -86,6 +96,16 @@ static inline uint32_t glue(ldl_be_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
                                               MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
+static inline uint32_t glue(ldl_endian_phys, SUFFIX)(bool big_endian,
+                                                     ARG1_DECL, hwaddr addr)
+{
+    return big_endian
+           ? glue(address_space_ldl_le, SUFFIX)(ARG1, addr,
+                                                MEMTXATTRS_UNSPECIFIED, NULL)
+           : glue(address_space_ldl_be, SUFFIX)(ARG1, addr,
+                                                MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
 static inline uint64_t glue(ldq_le_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
 {
     return glue(address_space_ldq_le, SUFFIX)(ARG1, addr,
@@ -98,6 +118,16 @@ static inline uint64_t glue(ldq_be_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
                                               MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
+static inline uint32_t glue(ldq_endian_phys, SUFFIX)(bool big_endian,
+                                                     ARG1_DECL, hwaddr addr)
+{
+    return big_endian
+           ? glue(address_space_ldq_le, SUFFIX)(ARG1, addr,
+                                                MEMTXATTRS_UNSPECIFIED, NULL)
+           : glue(address_space_ldq_be, SUFFIX)(ARG1, addr,
+                                                MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
 static inline void glue(stb_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint8_t val)
 {
     glue(address_space_stb, SUFFIX)(ARG1, addr, val,
@@ -116,6 +146,18 @@ static inline void glue(stw_be_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint16_t va
                                        MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
+static inline void glue(stw_endian_phys, SUFFIX)(bool big_endian, ARG1_DECL,
+                                                 hwaddr addr, uint16_t val)
+{
+    if (big_endian) {
+        glue(address_space_stw_be, SUFFIX)(ARG1, addr, val,
+                                           MEMTXATTRS_UNSPECIFIED, NULL);
+   } else {
+        glue(address_space_stw_le, SUFFIX)(ARG1, addr, val,
+                                           MEMTXATTRS_UNSPECIFIED, NULL);
+    }
+}
+
 static inline void glue(stl_le_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint32_t val)
 {
     glue(address_space_stl_le, SUFFIX)(ARG1, addr, val,
@@ -128,6 +170,18 @@ static inline void glue(stl_be_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint32_t va
                                        MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
+static inline void glue(stl_endian_phys, SUFFIX)(bool big_endian, ARG1_DECL,
+                                                 hwaddr addr, uint32_t val)
+{
+    if (big_endian) {
+        glue(address_space_stl_be, SUFFIX)(ARG1, addr, val,
+                                           MEMTXATTRS_UNSPECIFIED, NULL);
+   } else {
+        glue(address_space_stl_le, SUFFIX)(ARG1, addr, val,
+                                           MEMTXATTRS_UNSPECIFIED, NULL);
+    }
+}
+
 static inline void glue(stq_le_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint64_t val)
 {
     glue(address_space_stq_le, SUFFIX)(ARG1, addr, val,
@@ -139,6 +193,18 @@ static inline void glue(stq_be_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint64_t va
     glue(address_space_stq_be, SUFFIX)(ARG1, addr, val,
                                        MEMTXATTRS_UNSPECIFIED, NULL);
 }
+
+static inline void glue(stq_endian_phys, SUFFIX)(bool big_endian, ARG1_DECL,
+                                                 hwaddr addr, uint64_t val)
+{
+    if (big_endian) {
+        glue(address_space_stq_be, SUFFIX)(ARG1, addr, val,
+                                           MEMTXATTRS_UNSPECIFIED, NULL);
+   } else {
+        glue(address_space_stq_le, SUFFIX)(ARG1, addr, val,
+                                           MEMTXATTRS_UNSPECIFIED, NULL);
+    }
+}
 #endif
 
 #undef ARG1_DECL
-- 
2.45.2
