Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp368160ejc;
        Sat, 9 Mar 2024 11:24:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWEyw6x8PBZeJ4kf134dZhzQbRzuOLd92giv4UCzOz6MMb4c7+JgcU0XjujEgQpVlkNY4dRWDbwBWGlgIUok+F60FxL2jse
X-Google-Smtp-Source: AGHT+IF8xRATKVD9p4U6cxuaIY/rnYXW7hKqG1tUELGFtdLEFun8l/n7SEKH2Xna/ytSYMuX407x
X-Received: by 2002:a05:622a:105:b0:42f:208a:9ab7 with SMTP id u5-20020a05622a010500b0042f208a9ab7mr3166105qtw.16.1710012265241;
        Sat, 09 Mar 2024 11:24:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1710012265; cv=none;
        d=google.com; s=arc-20160816;
        b=h/xs7BGc7EZyfPfJWmpGkT3j/R5glIojD6irgZNt9YPeU0WTpeSYWHDq/BKktLAX4B
         e/w/PKgkApZZ8zHco9Hp5ysz98azzexPK916DUZFiHmTsWkzUwIPtVTqU7K4o84+8Nb/
         suOS/DyCPjnUZuOq91l8a3CpySlHgcJbc7vDjuOI8bR0znWo8LoG6bGu26eRN0UfA8r0
         K7u87s9z4VyIlPErmwx+texQEqwFgvc2xCSBOlCnKI4Lyk3J9V3a98lqTgEkj4QYoRd3
         tSYbYCJXMDYt03pTH2m9G2Jgs7vtGdglW/qAqH1TyX7zg50VLTiSP3AcuzS41InaUwyB
         aRhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tC/kiuQFLzAJIELEDb51aw3s24kLy7eDbWP5W63QeD8=;
        fh=eBh2TfVQsMfvWEcD4oSPnbZFQ7849nUB5XI1EIxjzHo=;
        b=tRzKE73GFmIAHAQc3ILkMmFVfWJpOG81EM6Qmz1GHGRRZ/H3qjJB52EH62Id3V0LZN
         xeUL6cjk7j/pNCOywPWrmyIfvEfQxYs36FwP0Lx2TVXDdk7T7SwUGqknekaNVONSEDyD
         ZmORCAhv+ZzrXFPSGCBMbkfcHGH/6jT9L7vvKxWacxI5OjF3dpWJYOOlGSpq1rXn0O4L
         3IolYi2E0GrJ+6JjNyc9U5QBhZhsZMkj2PmnUrAfqxTj5IDHzdko2NeJrhC6dUgFEKEA
         gQyYEPSmA26i/TBeGT9Ar9tUEDXPO+fH/1teMyyJLm3k88nPwoa0z6lf/EMAKEhhv3t1
         RcPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LrTYXNRc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2-20020ac85c02000000b0042f05240fe3si2156211qti.469.2024.03.09.11.24.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Mar 2024 11:24:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LrTYXNRc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rj2HN-0000H9-Aa; Sat, 09 Mar 2024 14:22:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2HK-0000G0-W2
 for qemu-devel@nongnu.org; Sat, 09 Mar 2024 14:22:43 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2HI-0002TO-Sh
 for qemu-devel@nongnu.org; Sat, 09 Mar 2024 14:22:42 -0500
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5683089d4bbso1940853a12.2
 for <qemu-devel@nongnu.org>; Sat, 09 Mar 2024 11:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710012159; x=1710616959; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tC/kiuQFLzAJIELEDb51aw3s24kLy7eDbWP5W63QeD8=;
 b=LrTYXNRcvDKTSH6APYZi8ttX7KMHjSzNikukosk3P6FDhMnOvmM1U5zpMalSoQCA73
 2S8pjOgjs52wILRm1dWrE8ntnCoy+gwqYmaHRUUH8DazlALIz9luec7mumfH3hj5gGWg
 gQQsMcJYkQ+pFlKOZ3JOQVckH0pvlSMK58EykPCJ/kt5xykZ/OIBX07g1MZm9ooidBBm
 z9axii3WqIrSjIwsOUwDv8YPtkbB9eJaRGcwdAayNoB8hYryX7BPUYoA22+PYxp6PeCk
 QwsemhQAwirijWLOB5fFkktJiD8PMGBl7IsiGAkDfHvOVvKJka7g+rcts5KyCViMFFnB
 vNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710012159; x=1710616959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tC/kiuQFLzAJIELEDb51aw3s24kLy7eDbWP5W63QeD8=;
 b=FCRRPnOLnE/8fVJPzi7nAqZex91euzM6t6M4Q+2soPYtcib2PPuE1/Pqr+ZVI7y4Nx
 kyG4SD1V6eJWJVuhN7Ycv5Ebfv+2R/CqZI2fKQ9lGvM0BTpvK1OCsJLyQUDtbNoa286M
 7wCBsbYDCRSuMS7X3Bf3khM+qMuRwuAUln8V4Qmxp8wOGszoGkN6h8gDd8wAtjkd7egX
 R9cXEb79ptPuPywxf+J9qE2eJbnhFbKh4HaGNepngxb7Y4siqz1DbAcuCW5wd6/i7yD3
 hr4a6rsM9sI0e3HsqZ/RQrb5WJ8VxaEq7ayTTDradKCFzDFz/rX01ZuZiGoQTV6xh/mp
 h5xA==
X-Gm-Message-State: AOJu0YxUQD5s2aEEJiYs9LnBSr1in7eytjQaLoGZ23fPT7HVB4ztYex8
 cwbfZ4FQuYsi9Zoe+pj6dQ5uQjTQpSAWT/82uOkC04Dk0kXwpuF089FX9AQCAqM9/Mdv4t5BmTb
 W
X-Received: by 2002:a50:8717:0:b0:568:1b9f:d6b3 with SMTP id
 i23-20020a508717000000b005681b9fd6b3mr1590136edb.40.1710012159128; 
 Sat, 09 Mar 2024 11:22:39 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a50e703000000b005661badcccesm1148488edn.87.2024.03.09.11.22.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:22:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PULL 04/43] system/physmem: Do not include 'hw/xen/xen.h' but
 'sysemu/xen.h'
Date: Sat,  9 Mar 2024 20:21:31 +0100
Message-ID: <20240309192213.23420-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5v5qv+GUYbta

physmem.c doesn't use any declaration from "hw/xen/xen.h",
it only requires "sysemu/xen.h" and "system/xen-mapcache.h".

Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20231114143816.71079-5-philmd@linaro.org>
---
 system/physmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/physmem.c b/system/physmem.c
index 3adda08ebf..6e9ed97597 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -35,7 +35,7 @@
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "hw/boards.h"
-#include "hw/xen/xen.h"
+#include "sysemu/xen.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
 #include "sysemu/qtest.h"
-- 
2.41.0

