Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp865860ejo;
        Tue, 12 Dec 2023 04:36:52 -0800 (PST)
X-Received: by 2002:a17:907:7203:b0:a1b:7dcb:ce37 with SMTP id dr3-20020a170907720300b00a1b7dcbce37mr4117421ejc.9.1702384612191;
        Tue, 12 Dec 2023 04:36:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702384612; cv=none;
        d=google.com; s=arc-20160816;
        b=D1PaEAUI3kGKSAsGumL3eUYfdmeN7d4q/bFIXNL3v09niQdkZcJPtS+gIjM7p8Dmr0
         6A62+WsdN+lrAX+IlOaOZK/+cLqljtHe/XJY8jdxqQZaCw87aCWzumFYJSv6IJIqwhFF
         NCp8a+2655FIerxBNZ+tYcW3eWaLSSnW856ZTw4oF0enbO/rQf+wxqeMpHovU/VtrVU7
         SvX3DZilUvjY9m+qgl7rkXfhbo8YiWwPzPeCoWRh/PQGh+xyDYCbJQ2lE8O383rmgGWT
         Go5xmg5ADc3g4+Xnh4rK0ia9mUoZfhuT1zYCBAKmlR7v4FXrf8lkB5/6oZ2gOR7Dhyx3
         8OUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QFKe5fpokVIiAkSRFD2bRfU4SaX29W1o3RfhIDFCgNg=;
        fh=vlFEGdij83GYetLrOUaCnR04sbYRvtckD5L7fw5192c=;
        b=jNJqDdm961+JIpNvsaJ49GHNm3r8yGLPW4Du+5z8MuvRNXjrev6XeEUUrICWZM6KYW
         i8T1KRkyxRSsPD7CehwYfj0H7cjamfaltzFqDjW+/q1eUGt2qof3dbPKL1xDV4GJsXal
         h3zKQYGmAG2vrn/6TjMGZ+mPuOmvUTB/TRzcrxtvAEXfqe44ooNYQTXzEUEKeRmbz+68
         pM9HZ/zjWLfUn1I4WdU8S84HKxc4vxTyC6xd5BZ9cqRpIbCruCHYRMbuTwYPH+tJpq4A
         br2wGFoDgUmiLQEEyVsuAgsK5TazjfYHLa28LS+yOpreg3Fou82cn8L1S8ieFx/FetFR
         DTvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L6BOL5aM;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id em4-20020a170907288400b00a1f7a9f5541sor1867184ejc.13.2023.12.12.04.36.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 04:36:52 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L6BOL5aM;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702384611; x=1702989411; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QFKe5fpokVIiAkSRFD2bRfU4SaX29W1o3RfhIDFCgNg=;
        b=L6BOL5aMs25CqF8GpA7sCKYzBU9MpFNN82/tKAfZdvvM6nrBEu74Cu6UgiZ4Ij9JCa
         fclKJ6B4/VhQV+YGj30eCCTBrHSgaYw5Eycd/KhvIxV+7qk/6ioJc75k3v7dN3O8vgfW
         jB3ZSTs9yx45KKUqhnYq6BvHqUAwEhXNUP4hxhRWkAm087EWpVc550J6UowEfiWzWHCn
         SNSyqson0PgRgiOOpq7+GmamKb1RT0glN1G3f4/mU+ConMwNRUbN8ST81pxfajgo6ESX
         753LvcovxX2iYl8+QMzaGk0By/jNGH+GvQhwxlNd2OmO2v5B41qWOVR+sLOpihLRrJNp
         +BIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384611; x=1702989411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QFKe5fpokVIiAkSRFD2bRfU4SaX29W1o3RfhIDFCgNg=;
        b=kq15msfG4Pf/UqrP912L5tmL8J13WxFVDaK1YKhXvJrd2hicGuJL6+cZ7y1MNVRiyo
         aKOVkWbnsQpNHydQm9JiKhTeg3es+UboxUWxUGHdGVsp6k9O8stLeRtVmjUUHakcpWMF
         2vJTUbOTTwPiMDntL1GKJmwNXx2UPMnBDc5L0UENVNy9s/stbdXU0TJ6Ihc53RdoAu6V
         jGy1/NLswBUi3YhRub+Qu2e3vlHF/4e6YjD2Xezh/xsJ+jZbfn5Km9+wYzLsqA9l5Y+0
         +x5QvZ4qA7scqtg3rqf7+6XxJPvY+326LLh4bAsL2cUB8puZvBlGKZPiQVIZaDWa1gu4
         5YxA==
X-Gm-Message-State: AOJu0YwFW2q1sYN9AJohM4jVXAUKi4mWNp/LdiUMECh3fy4gTrSFRxcL
	zyDtVDCx7uPUdXP053Z87NYS/+FJrlEaPHriu6fJ4Qei
X-Google-Smtp-Source: AGHT+IFF7iCrEUraOTsqojZyeZYPSVUonA3S/n22uK3Y3ScvB2ZYIEk3THogrsIssxV7Ekr/5rmurQ==
X-Received: by 2002:a17:907:7251:b0:a02:54fa:4f2f with SMTP id ds17-20020a170907725100b00a0254fa4f2fmr3683854ejc.53.1702384611672;
        Tue, 12 Dec 2023 04:36:51 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id tk3-20020a170907c28300b00a1cd54ec021sm6243423ejc.57.2023.12.12.04.36.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 04:36:51 -0800 (PST)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 23/23] exec/cpu_ldst: Avoid including 'cpu.h'
Date: Tue, 12 Dec 2023 13:33:59 +0100
Message-ID: <20231212123401.37493-24-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: McW1dXDtp3Zu

"exec/cpu_ldst.h" doesn't need to huge "cpu.h" header,
but simply:

 - exec/cpu-defs.h           (TARGET_LONG_BITS)
 - exec/tlb-common.h         (CPUTLBEntry)

 - exec/user/abitypes.h      (abi_ulong)
 - exec/user/guest-base.h    (guest_base)
 - exec/cpu-all.h            (GUEST_ADDR_MAX and env_cpu)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
env_cpu() will soon be removed from "exec/cpu-all.h". Do we
want to move GUEST_ADDR_MAX declaration to "user/guest-base.h",
eventually renaming it as "user/guest-addr.h"?
---
 include/exec/cpu_ldst.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index e039cc7f80..ec0784bf15 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -65,11 +65,14 @@
 #include "exec/memopidx.h"
 #include "exec/abi_ptr.h"
 #include "qemu/int128.h"
-#include "cpu.h"
+#include "exec/cpu-defs.h"
+#include "exec/tlb-common.h"
 
 #if defined(CONFIG_USER_ONLY)
 
+#include "exec/user/abitypes.h"
 #include "exec/user/guest-base.h"
+#include "exec/cpu-all.h"
 
 #ifndef TARGET_TAGGED_ADDRESSES
 static inline abi_ptr cpu_untagged_addr(CPUState *cs, abi_ptr x)
-- 
2.41.0
