Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp476323njc;
        Tue, 20 May 2025 05:54:54 -0700 (PDT)
X-Received: by 2002:a17:90a:d888:b0:30e:823f:ef3c with SMTP id 98e67ed59e1d1-30e823ff09dmr27063677a91.25.1747745694508;
        Tue, 20 May 2025 05:54:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745694; cv=none;
        d=google.com; s=arc-20240605;
        b=M7XnGZHSWMKGjFVpdVRg8KYGOodoFuEuNHFKn43tdrZWoKWLwo6k/aqzvhofoX96+F
         Ce5XpltE4wmV4ArNt7T3lTgsr8In7aKCI7N1wIjs870o3I3Ik258Ax2xTCruSATKUdMb
         stIjmNnSS73daFYbMynKPxVnLxNgrhA8B0F1EbqQ0bbMEQQOVGhYuc1Ifbps9EDx0ohk
         vxfBpqwndE2K8PtVs4wQRhfOzK7st3b/R1OvaZZQMXI/w+FTGk7+0LwEQM6v8FGlfn47
         NcCNeP2Dq9DlIhFvej7bF9a02+7UwjSIJvcV6PZkzL7BsV7ENa7r/S5zTCvcOypeYu5Y
         hMeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=s7pn51WkI2VfDBAIgVkjLNvwgbH/QMeYb332RfFRnmc=;
        fh=a/XQjI6+m5oFBGxQ4I1mSAZ+7/Iy8lGhEjneO9BLU/8=;
        b=XNQYnrHQjbADoKOgfrl15SK/ydqbB6eDBGjSczGtK0bCx/WOAcX7PDSVc/N8FDIiEo
         TbnAV0Xq5ARTa96yiGfgpPEhPqwBsI0PPWVU0JCnXdulbJMf+LgknW8ASL5jnJcknpbI
         hdsd8XWGP/KUnrcJpdNA9Vivsmlore831MVHNtmTD+B1IDVqePht3Xaodca99gCUlU0K
         /PB4OfmTFucUXgqCYCrKwH10hMtbGIQaoBsItOJRLg2s3uG2aYcXbTI5DxIGjErtcjig
         oMiep8UGgTLdO/bf1aDvAZnC4GEy+zqFOw7LWW8DP7kgjAvDWyGxBv0oLnmBHR0wuYYm
         ZUBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=JOPHo8Kb;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30e7d592255sor7709753a91.8.2025.05.20.05.54.54
        (Google Transport Security);
        Tue, 20 May 2025 05:54:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=JOPHo8Kb;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745694; x=1748350494; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7pn51WkI2VfDBAIgVkjLNvwgbH/QMeYb332RfFRnmc=;
        b=JOPHo8KbULXsiATWyJ482X+EBKJjf63xHGH9wykemNfrePxGn1wYZHXD48jflFLAUZ
         KZ4M2YQt91C3kD8b8SJ4xHpzXBWVJB9yLLGEJ4Cgl9zWQfQZMTSnfu8YtFZrsnCp0/ZQ
         v0Wgnfn5RG415OnCVWSccQueif3RsGQeBQ/ARy5i5iQYj3bj9xKERqyy/r+f/DWN3QEP
         E+8ge1er3UYvHdNCEaAzqFYnatosccDpBLsnAl8Zr5YMF9suj6hSKrKFurbmqDn6p0TP
         exVQVteOjXgZLDB+/GZ3mrHPJUs0jFqVgpi/f7wDQNSg+LxRJ/PzQrij5asFaR6DfMAS
         e1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745694; x=1748350494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s7pn51WkI2VfDBAIgVkjLNvwgbH/QMeYb332RfFRnmc=;
        b=chMG5qgOj8MlhN8whSjZmczLrUzGImt+ZCoDt/3VxhoB6Adi3x39brP9f9LLV1d3rs
         ZhDvukOcI8ySe7byAf96KFXWBCudKVwtZBYQOCYjo3Ykn5PjtS7fz+SS0uqzFxDPiBsT
         AL+B8atN+JdwRCByG+QeGmW38ttmr5yRGkO0es/2apVB9KDfr4CpA5530Q2O4KJWqbqV
         fRxk3jgCcRUqaLkpRVvfm5lF2pScDhpEEKw64SgNLGZJvhia8Lz5+WJP9zZhjQnpHJsv
         zNN3o4Nn/Ne695idL32Bd+y0MgY0kDgrax/oIiA9bGHm7boKS/C8F+w2iOhAphe/9+WF
         EkFA==
X-Forwarded-Encrypted: i=1; AJvYcCWXNM+GAZOPPlTlYhgjPoW0a5PePzdCAUjrmFlnXJgxc+epUmL5ANmRlMwfnMgT8HXRtLIbhh8=@linaro.org, AJvYcCWjGzbK1i+ydSY/e7/R54ThGG2Yq+NL8kWLDCoKAqst6sKGv8sLdCXsi5//xd7+ZkQmT9VGIl3wCk8JyqTKtfGlQTI=@linaro.org, AJvYcCWmBM60FMbXAqR+AZ4aPW6blZUtmQSrwFCk5Ycrt2UByvG2DLE/2feRcxbd4Z3ekgcbQCdMZ4IuiEqcFU8KaZEg3A==@linaro.org
X-Gm-Message-State: AOJu0YyqNFUBEosX3r8C2DPNb+jAbBbT/3Ex0vrFJ6GFP/82SlSbz9q2
	07efpkFUJr5ke5gt+v6POb5nBf9I2L6UnqKHo6HdobApsguioRns+F7n
X-Gm-Gg: ASbGncsONKilZQnegF3IiT3zodk/BB3lhzmNqDLyovA0OZDrHI95anTc/+/CR5xX/kg
	K8AHgodVPQgIUexCfiFoXqx9cxR9zkL3dj4ip3C5qPLLD3I6pQoBo3awOlUKx9hh/rSx1wR7lRB
	SNxvgcwxu2mkAf4dNWYnaPDlPYYifcIsUhrCOETvbBfQdjulEqajsG9W9lp3JkF4jHKG5osREim
	HgwO6jYBu56Hggi8zIZDmzeVFED2KlPvQI1Nqe+dWJOHSxtGXfzfb6fYxS5hZggq+WoszVaBV05
	EuwVtI7Ue3QoKvOVdrPHQDltok4YY1Iycgm7iG2B19CA3YRrYaeQWQU/FY6Y8g==
X-Google-Smtp-Source: AGHT+IGajpd6KWApJBhXUBZOQ39gUNizGUA6mw1/uq8/j3XxCq6FiAhKcVdhKBCbeeWVn1V+o+KQDA==
X-Received: by 2002:a17:90b:3f4c:b0:2ee:5958:828 with SMTP id 98e67ed59e1d1-30e7d522155mr29183315a91.9.1747745693818;
        Tue, 20 May 2025 05:54:53 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:54:53 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	WANG Xuerui <git@xen0n.name>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Stefan Weil <sw@weilnetz.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 28/33] tcg/wasm32: Implement instantiation of Wasm binary
Date: Tue, 20 May 2025 21:51:30 +0900
Message-ID: <2433bd9fe6eed2f93f511195cedbfde0fc4a89a4.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747744132.git.ktokunaga.mail@gmail.com>
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: xTj/HszsjEjv

instantiate_wasm is a function that instantiates a TB's Wasm binary,
importing the functions as specified by its arguments. Following the header
definition in wasm32/tcg-target.c.inc, QEMU's memory is imported into the
module as "env.buffer", and helper functions are imported as
"helper.<id>". The instantiated Wasm module is imported to QEMU using
Emscripten's "addFunction" feature[1] which returns a function pointer. This
allows QEMU to call this module directly from C code via that pointer.

Note Since FireFox 138, WebAssembly.Module no longer accepts a
SharedArrayBuffer as input [2] as reported by Nicolas Vandeginste in my
downstream fork[3]. This commit ensures that WebAssembly.Module() is passed
a Uint8Array created from the binary data on a SharedArrayBuffer.

[1] https://emscripten.org/docs/porting/connecting_cpp_and_javascript/Interacting-with-code.html#calling-javascript-functions-as-function-pointers-from-c
[2] https://bugzilla.mozilla.org/show_bug.cgi?id=1965217
[3] https://github.com/ktock/qemu-wasm/pull/25

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm32.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tcg/wasm32.c b/tcg/wasm32.c
index b238ccf6d6..f2269c0a22 100644
--- a/tcg/wasm32.c
+++ b/tcg/wasm32.c
@@ -25,6 +25,7 @@
 #include "disas/dis-asm.h"
 #include "tcg-has.h"
 #include <ffi.h>
+#include <emscripten.h>
 
 
 #define ctpop_tr    glue(ctpop, TCG_TARGET_REG_BITS)
@@ -44,6 +45,29 @@
 
 __thread uintptr_t tci_tb_ptr;
 
+EM_JS(int, instantiate_wasm, (int wasm_begin,
+                              int wasm_size,
+                              int import_vec_begin,
+                              int import_vec_size),
+{
+    const memory_v = new DataView(HEAP8.buffer);
+    const wasm = HEAP8.subarray(wasm_begin, wasm_begin + wasm_size);
+    var helper = {};
+    for (var i = 0; i < import_vec_size / 4; i++) {
+        helper[i] = wasmTable.get(
+            memory_v.getInt32(import_vec_begin + i * 4, true));
+    }
+    const mod = new WebAssembly.Module(new Uint8Array(wasm));
+    const inst = new WebAssembly.Instance(mod, {
+            "env" : {
+                "buffer" : wasmMemory,
+            },
+            "helper" : helper,
+    });
+
+    return addFunction(inst.exports.start, 'ii');
+});
+
 static void tci_write_reg64(tcg_target_ulong *regs, uint32_t high_index,
                             uint32_t low_index, uint64_t value)
 {
-- 
2.43.0
