Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp2732241lfc;
        Wed, 20 Nov 2019 16:09:35 -0800 (PST)
X-Received: by 2002:a05:6830:1f29:: with SMTP id e9mr4000557oth.272.1574294975245;
        Wed, 20 Nov 2019 16:09:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574294975; cv=none;
        d=google.com; s=arc-20160816;
        b=u1eLSAdJbmOmKFMRt0osYK0IrL9YdhQHN477RXE8edn2/7AYIn5/km3AigjqpllUmY
         NmhXmVRJSLSumMVeVlG/4OBlqCmES/zapADr5LTHvUYMavPbyUkkglkulaOqFcbhbm77
         c3CG6UDSsPNEcHmzwuF900p2ULfmoHn63bWrxTASlAyDZaW6Ng6RQ1FnoYPs4D5ipdF1
         2WWFNcLd6xRDArfagWMh4oNVBFHKZKRoCCNNjgzJag3ex+PmNrHhBrGmnwGPwgoBFvtp
         T7Z8AnW17wrVgxDV3kccc3PSGiHcPWfhn6UHajpIQGu+e2kzBjfZrnUCec+f6Zd8X620
         7Jvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=HsdErY/VOvmYyLB8+2L3+K8sDccz0NDXgt0JMSNXxNM=;
        b=RJV2MDWAWsVHMv3UqkweUQCekX7+ZnFIkvKIUQwVqcdKAKsh8zerV3DcD63SLr5cm3
         XNyZAKP5D3e2oBC3zd9AXVGU02WUtqqga9Y0qHwnTzHj3rU78ezpQUWpCvJj1v8u4pyz
         FQCL+Q0BUlAZlDKKbNzWyi2+1zVKXlhhrVqWhKnPYPMLIfdSGoMbyxffZCQHsPEyYbBm
         gPPRyGBozwu/VhxEOrMlRy7sVX7fVnC/9cReo0vcLEgLLWspM/xn7tZiMovdE56g0cVR
         EaFcKp2n7B8BPN8z6iZKrA8Z0CS2o/tTlLwqI22AkEXD2lyPdkiKHozLHptD6NaIM7si
         C18A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yE5W+q13;
       spf=pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=beata.michalska@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <beata.michalska@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z131sor398502oiz.11.2019.11.20.16.09.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 20 Nov 2019 16:09:35 -0800 (PST)
Received-SPF: pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yE5W+q13;
       spf=pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=beata.michalska@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HsdErY/VOvmYyLB8+2L3+K8sDccz0NDXgt0JMSNXxNM=;
        b=yE5W+q13zjR9HSIv2qTmit1G376oCNK63mE87vcAp5m3BCmNcERZ2pI/DleA241pJG
         KQQ2qIzR1Alk1Fx9KC7+oD3k/jWJCLdXdpbGU0T6NjYou9MjPyj+83LE9v5igjXdUwUL
         U+kknaJFZB98dHa/g9StcN1KFj2LRDm6AR3pQpgJhSbQNJbAC21ImS4ky+u3ScWZtAvL
         03sMIARyePANvzh1s81EWaKdUIUR/99qzFxP/ef1QMKgpCEHsLI/s9TREBtpGjR2QB5n
         Tt1PXsKfn2aACAqFmIPaIVFwt1lUwUS4WHWSbrdNRkiHUmHtS5D8OJMeKGpYuEAuLFPR
         yEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HsdErY/VOvmYyLB8+2L3+K8sDccz0NDXgt0JMSNXxNM=;
        b=EEN5nWAmeHYnt1rP+rC3x7LQvXOUlb2E7Wu23nIRolMFeVZ4WjHfkXIs/j+2+jW1pB
         Hk+v11NjTL0Dc5+mabgnG71pbX5ANqjoln3p/mBWk56ok97kIOrs3qoMqAioFGqP2gR9
         U73IjUKOg+E2AMUozl6HAwzOaP9z5DAn8ZrAxEV3qtY6RdHvPdaTlygJbn73LtNgZzPG
         ceenSZfvfi7Hq7E9WuKCn0em9mLGHfhX0doJcQZ2k3Dlz+g5g4UIEeD/V2yKXbNFiqP5
         szp5OO6JLfjukNy0opGyUh6b8y6jw/5v00k8gtmK1WIcNNuMMH3XPPERJGZgFkb7S1AQ
         vUgQ==
X-Gm-Message-State: APjAAAUdFWdGsf/lFRiApgrELRZjPE2YxxAD5DCVjsOU/KNDc2vjoHDj
	RPT2ADHVnZevmyVnBM853cvH7CeW
X-Google-Smtp-Source: APXvYqxcT5JqL5Y3heq9E/QnQ6K0pwMAYWD6DKsbRMakjfptkS7mNKtxkm7p6bdt3e7R4TH3PH3wVw==
X-Received: by 2002:aca:ddc2:: with SMTP id u185mr5222506oig.174.1574294974817;
        Wed, 20 Nov 2019 16:09:34 -0800 (PST)
Return-Path: <beata.michalska@linaro.org>
Received: from moi-limbo-9350.arm.com (host86-181-127-240.range86-181.btcentralplus.com. [86.181.127.240])
        by smtp.gmail.com with ESMTPSA id z17sm351439otk.40.2019.11.20.16.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 16:09:34 -0800 (PST)
From: Beata Michalska <beata.michalska@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	pbonzini@redhat.com,
	quintela@redhat.com,
	dgilbert@redhat.com,
	eric.auger@redhat.com,
	shameerali.kolothum.thodi@huawei.com
Subject: [PATCH v3 3/4] migration: ram: Switch to ram block writeback
Date: Thu, 21 Nov 2019 00:08:42 +0000
Message-Id: <20191121000843.24844-4-beata.michalska@linaro.org>
In-Reply-To: <20191121000843.24844-1-beata.michalska@linaro.org>
References: <20191121000843.24844-1-beata.michalska@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5LUd9fFWu0U2

Switch to ram block writeback for pmem migration.

Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 5078f94..38070f1 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -33,7 +33,6 @@
 #include "qemu/bitops.h"
 #include "qemu/bitmap.h"
 #include "qemu/main-loop.h"
-#include "qemu/pmem.h"
 #include "xbzrle.h"
 #include "ram.h"
 #include "migration.h"
@@ -3981,9 +3980,7 @@ static int ram_load_cleanup(void *opaque)
     RAMBlock *rb;
 
     RAMBLOCK_FOREACH_NOT_IGNORED(rb) {
-        if (ramblock_is_pmem(rb)) {
-            pmem_persist(rb->host, rb->used_length);
-        }
+        qemu_ram_block_writeback(rb);
     }
 
     xbzrle_load_cleanup();
-- 
2.7.4
