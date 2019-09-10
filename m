Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5257598wrp;
        Tue, 10 Sep 2019 02:57:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzr48JPrkky22n2hQRX6gkwjAXV7g3JJLB2fjWK+n06mQi/Wf279LN5hzhz5u4XNzC8j4eG
X-Received: by 2002:a05:6402:2039:: with SMTP id ay25mr29270820edb.273.1568109443342;
        Tue, 10 Sep 2019 02:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568109443; cv=none;
        d=google.com; s=arc-20160816;
        b=ZKR65mLrIDmhKMhW/dbAEyUuTHMmDMrDHMcjvyrmNB4gmN4mbqzI9nZCtSC5fC5lU0
         dL5Co9iRipgxOFh0zJypBsCLfVYMiQhJGcbEv7pnAoyux9VWNZW7ZL52HCBKlHGaPfAh
         HgvQrH1eeDl4k24xYXKHOkqNicVbvNZM6bV/n5zzWzDpzzCsKmhQwxRw87527jvF12KE
         SS0QUt9m41vg1LyoDHbxeu3Eq1Cle03mAChUA0qFiEvjrFlFF0k69rVyYM25WZLLklP9
         sz+OsdJrMIB7fV963cdohahIJ6xXc08krAReyZmvVxnEdXnf1xfKnhL9osc98eW7mX8C
         KmYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=V8rbWEWlHyHd4UbRaLskqjLUrYsGkHiX8TMo3VrUG1s=;
        b=fLzjldpOmveX7Vwd+tLEgFNh7BVKbSoiFVYDjenYPuvtzV4Eq3MgvQOW0gTQxFdHdh
         sV9mImXX7N9lY7Wl6qI8c+LHVCN7HfEbj2Zsy5vqSEJC8OKA2M3bxwzLExm08sm15JN+
         ib7fuRLqEahmtv/0QyT3KOl9CDA+249cU/HMjSApeSRSCB6+jArgwXSg5jBptwO61EgQ
         LXvfIPRrTHSYTMwrZdnlmqCRGjntYAyBSY8EMZJ8jz4aBzcJSAusSwmRfW+mADTNlVqo
         ag6cJw0OdAN3OuhL1wLc7shaO10QY3cPgOnZnvuxe/5dIfD3+TTCM61N+2cMriHgA5bc
         fK2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MHABNx7D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2si8470581edr.183.2019.09.10.02.57.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2019 02:57:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MHABNx7D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i7ctm-0008Pc-7b
	for alex.bennee@linaro.org; Tue, 10 Sep 2019 05:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50766)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <beata.michalska@linaro.org>) id 1i7ct0-0008P8-PW
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 05:56:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <beata.michalska@linaro.org>) id 1i7csz-0002Xf-LQ
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 05:56:34 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:33382)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <beata.michalska@linaro.org>)
 id 1i7csz-0002X6-Fs
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 05:56:33 -0400
Received: by mail-wr1-x444.google.com with SMTP id u16so18897042wrr.0
 for <qemu-devel@nongnu.org>; Tue, 10 Sep 2019 02:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=V8rbWEWlHyHd4UbRaLskqjLUrYsGkHiX8TMo3VrUG1s=;
 b=MHABNx7DC1/9SGQ/iNb/c4Dte1b/++/wKMVMg8NIdcJVi0cLj517karVPxy6+Oc4eA
 YObSxH1pfn7gVTBaVjWWJlOWpueDwr+CyvAfxdMqoPajh0Tl4DMj5TPNZeP9zXU1bF/5
 keKzi/I/CGz6Uo9BCdEqly97R3w5TUXAzM2FwXQ8rzO784ExZV7E8XkzWZzldm2CMA2I
 xc7Aqf2x0jBsFjrvODEAA+pYfL1sOuwfpZSM+4olFXGDxm5d1eN3xjSr46Avrm7Jp1MW
 MIAOfVxbbK2pv8UEjFEYtnBzs9/oXpFlSyX2QVypvbhL4Cp+laFAYs8I7gfH4raERacn
 pNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=V8rbWEWlHyHd4UbRaLskqjLUrYsGkHiX8TMo3VrUG1s=;
 b=Ge7Iy8w/rLJg8Wq0kIDFdoL62X46ng1aMMKMhTTnvPmnYx6AYZ+ePnLHzx578BiBKw
 gB6shkkK3IgkYv9+MHBT5mwAV3eYfzEkXomoGj+RIvtHc/xTfoHXImiZ8LC84oyicI5C
 t7VijwlN4DVKWRMD3eAiJZC0Nzqm04sDQ7JPxO6FamgExezTL7O1nLq93SB00WrVf4CY
 AY9EwJ6vH3XiTyCw4r0DePn1ARq9S6kbjOT0ezgqjrEZUlQtD5ymcVRgVhb/Ia5YDBuY
 w7yoRPSLl7fvk3TFjnAcIk5mLlEYoFGvA3V8YdQtwCq/I2HNMhbqTJ5Tklf998zA23Gd
 qRZg==
X-Gm-Message-State: APjAAAUHCjofJWVpLi7ti87N91pCM+DFxKZ5X/P4GxEp1UPoJZLqxJVD
 RK5qfC/wf53TToGUATEkltKn/ZVXjbrFcw==
X-Received: by 2002:adf:a4c8:: with SMTP id h8mr25265331wrb.293.1568109392396; 
 Tue, 10 Sep 2019 02:56:32 -0700 (PDT)
Received: from moi-XPS-13-9350.arm.com
 (host86-144-13-57.range86-144.btcentralplus.com. [86.144.13.57])
 by smtp.gmail.com with ESMTPSA id e30sm32403540wra.48.2019.09.10.02.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 02:56:31 -0700 (PDT)
From: Beata Michalska <beata.michalska@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 11:56:07 +0200
Message-Id: <20190910095610.4546-2-beata.michalska@linaro.org>
In-Reply-To: <20190910095610.4546-1-beata.michalska@linaro.org>
References: <20190910095610.4546-1-beata.michalska@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH 1/4] tcg: cputlb: Add probe_read
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
Cc: peter.maydell@linaro.org, Beata Michalska <beata.michalska@linaro.org>,
 quintela@redhat.com, richard.henderson@linaro.org, dgilbert@redhat.com,
 shameerali.kolothum.thodi@huawei.com, eric.auger@redhat.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QYmcNjg0CiBl

Add probe_read alongside the write probing equivalent.

Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
---
 include/exec/exec-all.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 81b02eb2fe..e1785700c3 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -319,6 +319,12 @@ static inline void *probe_write(CPUArchState *env, target_ulong addr, int size,
     return probe_access(env, addr, size, MMU_DATA_STORE, mmu_idx, retaddr);
 }
 
+static inline void *probe_read(CPUArchState *env, target_ulong addr, int size,
+                               int mmu_idx, uintptr_t retaddr)
+{
+    return probe_access(env, addr, size, MMU_DATA_LOAD, mmu_idx, retaddr);
+}
+
 #define CODE_GEN_ALIGN           16 /* must be >= of the size of a icache line */
 
 /* Estimated block size for TB allocation.  */
-- 
2.17.1

