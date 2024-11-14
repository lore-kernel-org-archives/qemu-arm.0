Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp27025njc;
        Wed, 13 Nov 2024 17:16:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUgtHAK4te572JnHkCRY9K67pXommbfWnbM+GvPjTRjCgTIKw50qRPOFKeAYIGBNMdSDmNQEeGFr0CJLA==@linaro.org
X-Received: by 2002:a05:6000:470e:b0:378:8b56:4665 with SMTP id ffacd0b85a97d-3821405becamr1137919f8f.24.1731546977020;
        Wed, 13 Nov 2024 17:16:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731546977; cv=none;
        d=google.com; s=arc-20240605;
        b=VAeqYLpXf/dZOSROCMKUanw3OpAvvudtRRskcU4LFdLKg19sNLYCa+NAfsZ2FcB8hf
         KyAEJ/y0tc2t68t16kMiLmUvf4r1+ZNc2f8D4T3uTDFXeI1drYXilWPRnS2byIUsd3v8
         SxnhXJQysbgLz9qD5uWdeYC+Uu5snkZ32dhTg9N6A2n4YQ+Wac7d3h8lqmM8XUwi9vr0
         sDheQPYIbD7TJZsAR0THf6dhvYRRDNJIceEloGfo/NQCen8oJg6ztPyYmceEMXg+YEV+
         KIqyZNTVyVZrb9rtN4fU++sDnFfbJtY+4c0SQba6BNIP9HrAmRCzqfMwhyGZRqClt7JT
         iB8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ziBtbUpyHfOZqiArsxZ9RJYwzJ+JBpYBES4OJcXpO28=;
        fh=ZVLA035jTfs9QFPpsvxvG9hyBOnmXLFHLUcM3d1fsRk=;
        b=bSH9HUNRJOcehBLh4SmZ1+NZxuyIPXbDZsVXseKi6ixf9r8iIsWtsBQXvxjr9lFzb3
         bALucP/EAMxb/+WL5ynRD1BrYnuTaONl71MQBfbSQUHugTyD2ltqotcCDDKvfV/9XnC6
         XsmNeoE8C5ASyD+1BrNh3IjvqzxBlKhcO9SNxQ93z28hFzAu1O+aNy3yaRvxc4fJiYq3
         Lvzpv/3824/LSWlO9WWQdubYksRojwbhZcT+yfJExXv6bEOOpkgXIy3KCo1Ghln59zJU
         tgqJbgaT80lhQUIdabTiVCwYYJvRWgerhbzh2wYxr59pKEKMY+VF5iXYIp+uFTeljDCH
         k7XQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jxd0S6ki;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3821a82dc42sor36955f8f.2.2024.11.13.17.16.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 17:16:16 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jxd0S6ki;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731546976; x=1732151776; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ziBtbUpyHfOZqiArsxZ9RJYwzJ+JBpYBES4OJcXpO28=;
        b=jxd0S6kihSyKfv2zBvQaO/AhB6ocZU8NpkE7W0LrTGecKpaRl9fzba6gHtMcdaIYJM
         a/elX2wI6OoCx+oMOU/Sl+wBQB3XnTo3D28pci10F4ux13HtNZMdpnQbJH2ZAMOews+6
         ZhFst7wd5E4R1g6nUoNwj2w3BekrsRVso+3DkFIvkdiK8R9k6sDLeE10y+uXJwDapoNU
         mKY+jb1A/SZtbObJK8woG1TKROnqnpSvyNwGFt7spfAy0pvu3iIgFZVEq9V9VDXdf540
         lALDOJ200Vwz75xrR6GiESQjl7osaHwW3ngKlOfB8zZRsbko1S0EXspELGdCzBWEs2iA
         4d4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731546976; x=1732151776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ziBtbUpyHfOZqiArsxZ9RJYwzJ+JBpYBES4OJcXpO28=;
        b=VG4BHlHizIICNe2g075nMeoPC3TF3XGQSu1IEc+cB2G7Jt2R+oreUawnzfjhTePSre
         wjCRYLM6WURYrEDGAHIya7D5wl2qIje5nyggDtvjecTh9g5AwHuc/63YyKb/xze2zZbS
         6DnDj7CLDSK35vTcWD+weg53tCH0rphnm8Tr0V0t5uC1VOsJ8b5ZxquYGpMkEdViFk0B
         +Gm1c8SS4QOXJzV9UoLnw/n6zkPovRoygMqbPmmreP0GAAg4tRQ3RgRVE3VhRZS/3Yzg
         EzMrYpMk7HX5G5eScZl1ANZphM1QlmgSTZD+rwHLxykP15NXmIqNxIZIiDG30alRTFxw
         M25w==
X-Forwarded-Encrypted: i=1; AJvYcCUCOHUrxXbq2ZPikgvgXvE0uy3sQwIRKPsYjt8tn925oO3M2MlHWa/6YCDFRHeqnw5T3Q2p9QPu+9kAlw==@linaro.org
X-Gm-Message-State: AOJu0YxTJ3OjkF0mAMQqgDe0Scu9NERabOxF0UKvphjskj8zaZP13zrV
	ScqgykS8B3W5xgBhWF54N1s1ZwJNqhlU5gFWbhY4D2EhdTyER8XEAktUqFSVCL3Lf4O8moA4SEn
	a27k=
X-Google-Smtp-Source: AGHT+IFG/ZF691knJltVBevXFTBqGvTEtAKOLukeJC55OBRtxqlY2UQOjoHdG6QCpoUL0VTdcMqiXw==
X-Received: by 2002:a5d:47a8:0:b0:381:f443:21c6 with SMTP id ffacd0b85a97d-38213f80149mr1345659f8f.0.1731546976466;
        Wed, 13 Nov 2024 17:16:16 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.209.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed97db25sm19856743f8f.41.2024.11.13.17.16.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 13 Nov 2024 17:16:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 23/24] exec/memory: Move qemu_map_ram_ptr() declaration to 'exec/ram_addr.h'
Date: Thu, 14 Nov 2024 02:13:08 +0100
Message-ID: <20241114011310.3615-24-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114011310.3615-1-philmd@linaro.org>
References: <20241114011310.3615-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: nMTM5cowTeGb

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/memory.h   | 2 +-
 include/exec/ram_addr.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 9458e2801d..58faa3eb08 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -28,6 +28,7 @@
 #include "qemu/notify.h"
 #include "qom/object.h"
 #include "qemu/rcu.h"
+#include "exec/ram_addr.h"
 
 #define RAM_ADDR_INVALID (~(ram_addr_t)0)
 
@@ -2973,7 +2974,6 @@ MemTxResult flatview_read_continue(FlatView *fv, hwaddr addr,
                                    MemTxAttrs attrs, void *buf,
                                    hwaddr len, hwaddr addr1, hwaddr l,
                                    MemoryRegion *mr);
-void *qemu_map_ram_ptr(RAMBlock *ram_block, ram_addr_t addr);
 
 /* Internal functions, part of the implementation of address_space_read_cached
  * and address_space_write_cached.  */
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index e0620ddb03..c4f220ae93 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -73,6 +73,7 @@ void qemu_ram_set_migratable(RAMBlock *rb);
 void qemu_ram_unset_migratable(RAMBlock *rb);
 bool qemu_ram_is_named_file(RAMBlock *rb);
 int qemu_ram_get_fd(RAMBlock *rb);
+void *qemu_map_ram_ptr(RAMBlock *ram_block, ram_addr_t addr);
 
 size_t qemu_ram_pagesize(RAMBlock *block);
 size_t qemu_ram_pagesize_largest(void);
-- 
2.45.2
