Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp865179ejo;
        Tue, 12 Dec 2023 04:35:37 -0800 (PST)
X-Received: by 2002:a05:600c:401:b0:40c:26ef:b24b with SMTP id q1-20020a05600c040100b0040c26efb24bmr3216773wmb.188.1702384537700;
        Tue, 12 Dec 2023 04:35:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702384537; cv=none;
        d=google.com; s=arc-20160816;
        b=HUeMPjtFHHyraokB78hbJv7zM4osSzN8CgZzFY4kw4UMHbqDwflxAyBXc+yLMbwlMH
         Ykr2VcCz7YwhYm63IkjqLjaZCLWxL/pSH9qStM63Kmo+VzeLdCeTGq8c+Q9f9oJ2s4c0
         XVYTJ1evFJcZVKpVzKeHJEr/zmhz87NmyKGHo5nxCZUVCPVENm0kvEqheIdBeSJDwn3Q
         OapcfDdexwP7x8s1bnhdLp1gOI1GYlAvj1UgftOYGf3ekIAisSIuWM+5OvfzSutLJ/cL
         qW1BM0HkJi3tLhihCY7C9bmVvTu6i64w84fGIdqJet1XDO8PmgCbSTH9D8V1Fh81ibG6
         z45g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/12RdsXJD+64tXWZALzavaBTbOyfNyTOEXXMF3szcR4=;
        fh=LO/BsHhviOYxE+eStnDDVVmSnBBAHvhaoSI4fAkKvrk=;
        b=UN071yGetnSvFQ1X7coD6KGntsvJoUZ6mlQOq85WeyR3ASgrYaGhp8+W4fnN526R8s
         W12rMSrq9eIiMCs377ufpj9XdoWX9MQCnLJ0Le85ahg2muyFElcmGJQuMA0R9qWrgQuR
         m911da8zmtdaMotGM+NqvAICMYdb/UW0NX1yJB2bZ5VsSjIOy9Q2NZuR2Pp8CsD5CbY2
         soazHhyIu+3MTtwT3bBC4rVlkdzGpDZyS8OF6eQlc4xp+4urvk2+f5g1OMy6z5SCKQB4
         d86K2giAZRxaqlXxxzvZP6jy1hZIUbcLj4jkHfKO41gBTzldtboKPhVSdxwIeKypH5PZ
         MHeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KH29xOuu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d6-20020a05600c34c600b0040793715963sor3492824wmq.0.2023.12.12.04.35.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 04:35:37 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KH29xOuu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702384537; x=1702989337; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/12RdsXJD+64tXWZALzavaBTbOyfNyTOEXXMF3szcR4=;
        b=KH29xOuu/sOWzy8sh2n6LtCXMkp3QkIb8Lr9ZmLKygjB7Sck0kfeT1LzZgBN8CnbQD
         VYDjIXhM6F1UyzRNhhncXIrnddSujqtQTlcYjP4BaE9ovOXzTGv2HN9C2T2Ou0GmpYnS
         VuRZaMDVDqj4Yzt169gKL6tY17uPOoXge+9hFb+V7p8UqgYm++7TRpKg0d21ic5ulMDc
         LmJaXv9zo8Or/tkFcOWfsStxI4Iuq6xaNfcrKCAAxdFQ5Jvi8tyV2W37uLuR5zKlZeT7
         VFWBnSfWO+VwZ9Qgvcr18Ci/BnNdGgmlBh/OdAQOa2xbdDpEdGQWHbfVTGboDGJzWZPW
         mPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384537; x=1702989337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/12RdsXJD+64tXWZALzavaBTbOyfNyTOEXXMF3szcR4=;
        b=n6UyPYlIhO7RCyHTN1p2hb45ZvAhmXqwBcooZWijI1DLhp9BlvQA9dpmL09sV8pXy0
         DRUymMEjtZy1vZV2OMQ2b/TW9mHl8i5AuiirXSlHJ0/f49luvkoEpyNUg3rGewR0EvvV
         XdMhUswtOIYW0+qj7Y8GHzQscJFyTmn0hLBIoXExzUisiadfF4XKrZwfDVtxdWQJ7BM6
         X/pWCdg33o8qmNKsFErBkVBVy/HtQxoY2XWQd01DoL8WxdghnJfz5gsuItRO6+jKoppw
         j7YZGEqr2lDawTHkD4UUNyINcZ4YhEQBJebl9mZzPo7HG9V6QjCtmQqzyf7Z9FDaEjZ+
         rE5A==
X-Gm-Message-State: AOJu0YwO7gF66SLgk4fulc1Yt1MrrUqaQH8kp1U7yNj53jvdfYLbUnkT
	+f1uOWvw8gSsjVrc775Su2saRKhX
X-Google-Smtp-Source: AGHT+IGOeoWxRjMCEpkyEiacQ099JQTeHRWC/+LlP+DCWgH84noTYfUF2HoTqkdyZZ+CcnNSZzND4g==
X-Received: by 2002:a05:600c:1d12:b0:40c:32fe:e123 with SMTP id l18-20020a05600c1d1200b0040c32fee123mr3266787wms.167.1702384537429;
        Tue, 12 Dec 2023 04:35:37 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id tb19-20020a1709078b9300b00a1cd30d06d1sm6338905ejc.14.2023.12.12.04.35.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 04:35:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-riscv@nongnu.org,
	Brian Cain <bcain@quicinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	Warner Losh <imp@bsdimp.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v2 13/23] exec/cpu-all: Reduce 'qemu/rcu.h' header inclusion
Date: Tue, 12 Dec 2023 13:33:49 +0100
Message-ID: <20231212123401.37493-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FyVEcfKHE8Vz

"exec/cpu-all.h" doesn't need definitions from "qemu/rcu.h",
however "exec/ram_addr.h" does.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h  | 1 -
 include/exec/ram_addr.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 26b44ca125..5b5379b94c 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -23,7 +23,6 @@
 #include "exec/memory.h"
 #include "exec/tswap.h"
 #include "hw/core/cpu.h"
-#include "qemu/rcu.h"
 
 /* some important defines:
  *
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 90676093f5..aab7d6c57c 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -25,6 +25,7 @@
 #include "sysemu/tcg.h"
 #include "exec/ramlist.h"
 #include "exec/ramblock.h"
+#include "qemu/rcu.h"
 
 extern uint64_t total_dirty_pages;
 
-- 
2.41.0
