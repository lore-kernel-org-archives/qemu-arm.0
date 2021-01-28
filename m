Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp621016lfo;
        Thu, 28 Jan 2021 14:43:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJws9k0aIpG/G3BJ+446i0l8GEMiX+4LU5XPQwEPD8e5vKuXCUFLeFBLn3fBdWTOY2YvOaiB
X-Received: by 2002:a25:c386:: with SMTP id t128mr2342145ybf.148.1611873833259;
        Thu, 28 Jan 2021 14:43:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611873833; cv=none;
        d=google.com; s=arc-20160816;
        b=XSdlQuv5n385xN7Sqc3GYLKAuSxblCkg1HoMjCfWA0Mp2c0gSdDtDeBvWgD81HKpRs
         dlgLj3DznnM8mVA+zzzvQCjiC3fq0rC874gILQa5M+sQKuuajTBLkFFGnYU5Ve1jrxXp
         K9bnxrGbM4pOS99ydKFWTPMFrfXQOIOTiD62Cb+eAK8fZzglvVlTKxnTZaBpdES+11bi
         AdpZ7PwbHqivl8+sRDpY5/p6BdAX3w7HCGJ1dMXPLkBpetj45E8uI+XeOiBmfopCGRLo
         5RojRXM5Ro3RsUIGDo2OJt5SGHec54YJtCqNtA+l6SE3N4FZKB/H2zlMQlq6Js5tzr9d
         hkuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XRNC7TN62/mhJ44h4TxsBn3p8qzX1+L1EKv8lKpxGuM=;
        b=J9sbF/7jLj4FFp2gj1ZEgZbQeQ3PNNV2IsmPj1s2Jt5wXwRNZxXhD1/5dIoK7fsaA6
         IB01wRzyj5OzSAcT3VMBYJq3B12atszut8wN5bHcBNpUEgqCX4SFywyK8BleODKESyO7
         nvdpy8DTxOtAHwwhb81Gs703/7galbooQ88lvBgWzN3pId6mePSypn3FOmpskDT53E+h
         I15hHItMF0mwikxT2ZkT6SWsFVYKc+mh8UuKKKhV0gzKqodDHXwznjDR0t/nEOqW87Zy
         UbvJbFqPROoyD44sI4PXurjDP3bG/nmSNQGF8Hl2vS/ZtG8hSCfum41nlsotYBHewjy+
         aSuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vblZAsOE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l66si6663252ybc.219.2021.01.28.14.43.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 14:43:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vblZAsOE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5G12-00067i-Gy
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 17:43:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzQ-0005XU-2S
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:12 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:52907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzH-000897-Lq
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:11 -0500
Received: by mail-pj1-x102e.google.com with SMTP id kx7so4731488pjb.2
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 14:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XRNC7TN62/mhJ44h4TxsBn3p8qzX1+L1EKv8lKpxGuM=;
 b=vblZAsOEFd82DGYDOVgYbHn0mioP2LeWtRtyFGs/MRXk8Nth5Y3ZGqgUJ92pJkjLgS
 vER9jA1vigrP+IkeDmO7lndLQc5oVMQbOj7w2OSJkckTrK3PV6Rb7Dg+ARBzrgU3LMld
 de7FT484SRvm4vGGUCTFjAamPeHgsXoaf72TOE481v/kAJIRv8S7dXskl10kJmuafyeq
 Cqv+iPTHYb6WPE1W0UOBp+aLj3leOnJ4owhvpoiodhO5r6ruAzDgDsC8hU7rnHWNXQ1/
 Q+57NHLDo1GIZjSMiErfJwGpxRuuMvwEvfoV4GgFRu87P0oXsAj6XRZpW5HVDYKzCwc/
 Hthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XRNC7TN62/mhJ44h4TxsBn3p8qzX1+L1EKv8lKpxGuM=;
 b=gyQKHrWChLbdiq+ZN8VIQU89nG4iMNG8uiWiqO4ci1T/3ONg5kAv/F3LXXujTzGqpp
 vXsrjowfZIE3xq+7Kx+YvV4jb/vCPTjhCZ6Tv6uCAMLXt0EkpDOwpBEdSOKJkkEcFInM
 i4H3BHEFTX3SlhAntlMLKCSInR9HGfpqYvAMebEIqebTlXWXKYr9bU70xk0xpsIjkR6W
 uZp37DYAP0O9PQndTBIs7na2hL7O/Iu+Db5Eo0eiM9IEZZ5BLsXoiiKi4QWO2vm6htIS
 w7geDCJX3Frb/BgMLnuzwg7p9ILL/XqeXC1MT5NEpxxKHSgBZU0kfwcFk6x2AYZ7hvq6
 FCbg==
X-Gm-Message-State: AOAM531sFtXtOHppJHkMVKqpHeLbZYiTsy2KWvS2Pyn4xdmNAtsE8DPp
 WalYZmktTj8LE8LY+QQWSYG7BWLZwb5sdOP2
X-Received: by 2002:a17:90a:7e2:: with SMTP id m89mr1522901pjm.2.1611873721204; 
 Thu, 28 Jan 2021 14:42:01 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:42:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/23] linux-user: Fix guest_addr_valid vs reserved_va
Date: Thu, 28 Jan 2021 12:41:28 -1000
Message-Id: <20210128224141.638790-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RDoveadAnARe

We must always use GUEST_ADDR_MAX, because even 32-bit hosts can
use -R <reserved_va> to restrict the memory address of the guest.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 4e6ef3d542..e62f4fba00 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -72,11 +72,10 @@ typedef uint64_t abi_ptr;
 /* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
 #define g2h(x) ((void *)((uintptr_t)(abi_ptr)(x) + guest_base))
 
-#if HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS
-#define guest_addr_valid(x) (1)
-#else
-#define guest_addr_valid(x) ((x) <= GUEST_ADDR_MAX)
-#endif
+static inline bool guest_addr_valid(abi_ulong x)
+{
+    return x <= GUEST_ADDR_MAX;
+}
 
 static inline bool guest_range_valid(abi_ulong start, abi_ulong len)
 {
-- 
2.25.1

