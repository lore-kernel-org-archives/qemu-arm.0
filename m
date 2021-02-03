Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp490037lfo;
        Wed, 3 Feb 2021 11:13:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKqRnvXcfJHGGH5iHeAzvtNHKcV0wbVYN9W5SyMsZid0joLZvhPM7NjlfK+lLZsSzNb+lQ
X-Received: by 2002:a25:f309:: with SMTP id c9mr6314146ybs.379.1612379630459;
        Wed, 03 Feb 2021 11:13:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612379630; cv=none;
        d=google.com; s=arc-20160816;
        b=tSG/nhP9WFzOxmxY41xKlJg5TP6x2s8Qu7vHdU+F5gxIZjmXBrbnboWuyqgRgdQzpQ
         ae+2Mlk4hRXm/h990wsVJLJm84ZqALDS5sT7Ig2booev2GMRlfK2unUi8Eak+y6ydTqe
         91wWIff2vIvCn4QB3b+oYs5x+RVvuOPaZ0jVsmL3LCSdUVjcHxnlfqrID55zdGVd/PZU
         3IvZF+1qPWOjw1l6Brv1vJwa86G9qKbmd7Qxj1RwQOiFPny/jkltBwjz3lgVNOMDSZzu
         BX3ekAVluN3Qbqza9guJuBB9pIRyBivQqV5MSK455qBvJSHaInl1ZlBDI4eJ1jMOeQDr
         IjiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vzS7YDdAcF7U4pxIlp6JJD53EW8Zqfir+/pxfdOUhEg=;
        b=SQzrElH3tG7HoegnLEchE5yCxEcrtW8iXJm87C9WM1PD2dETzK13FPLdW1UJVWtseZ
         AErdeuFNDVGSwCn5B/OK95sjf30E7vE3QtSqrHn6fe4jr3t09kvysR8Rg8/Mj49ngDYk
         39XgOe5bXJ0s2wODNXeIQNtBCmQS74VWODlVW9yZrvsQFuKkLQhSP46eQCfMQ+cQtpKh
         qunaQlcZLlqcsKkMudrpLMdso9LfaAY2Q9h278VZ8qFMxsE+bEmPbJuyz0iC8eM4VRid
         Jzw/PsfQkq+CWItZxzZKjXIOs2uoPf8FZboNxvD6pW788vbdpSSXkaTvPCz3umYvZxp4
         oqIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iErAgUEc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b142si3200158ybg.16.2021.02.03.11.13.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 11:13:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iErAgUEc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7Nb3-0007wO-Rv
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 14:13:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOU-0007NF-Ex
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:52 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:33963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOI-0001ZX-Sh
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:49 -0500
Received: by mail-pf1-x42c.google.com with SMTP id m6so439890pfk.1
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vzS7YDdAcF7U4pxIlp6JJD53EW8Zqfir+/pxfdOUhEg=;
 b=iErAgUEcRrsEXkLk+inPBZ0Ai2FNNvfG0tmcoaGVxP+ablTNytzE355JBKsaZzWZkz
 pb8o5TQxvGUCjK7id9VQQpH+rQ48eDDgsHYeSD5ROvBA8v7dY6Gs+7q7kxLoEz+xO97D
 QHL5wn5qt6lmiV1wTHN6FtptqJ6lNIaw0C5ZmqRsXzkrHhug1nDrvY9gKNYscDO3NLfG
 9Hweor1cPa9eQ1OODpVuyZVPzWQRhoQ67f1MG0zijDWzt5puikkecMUD6RH7dRms26X6
 QyqqSpwm48JviUrocq0KzrtND17ClHjP47IUNonelEL8Kr3KvHKZli/5HSSb7Wo8kLqd
 tbRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vzS7YDdAcF7U4pxIlp6JJD53EW8Zqfir+/pxfdOUhEg=;
 b=T6vXwcdXMTEz+6A0CkalgdgiLYRODIRRcfGeFykt2TH7zrcuheLMptKmPP2raxYDG2
 YJ5hNvbP901twXnEiOIuC75podnwYl3k/Rh0KABvzJikqS399gv8QTStAkFYXx2mF7v6
 J/guI0Gep8chencRVGNW/covlK+gbsStqwhBtudOQWgiTtRJCO0r/HJsLMFBjv3hDQ/K
 ItdkcSwH4BooWwTIxUSEs9mQXvU/SwzqxvUDDe9DqNPvBt0JAiS+np/BR+433u5E+u2h
 d2RHlOIFnkc7X/01SoHsLV6gRCS83JASbcRwXHl17m/6e9yiswsPOKM4qaRODGCI8E5I
 c7Nw==
X-Gm-Message-State: AOAM532qYYB34pfAoTRYs7qbPcTI69Bm/32e3dLArmTv1y6A6AkbC8f4
 NpoPshhhAN/oJ46i8W1o0vxyQWlZy2B6sfwx
X-Received: by 2002:a65:6715:: with SMTP id u21mr1986515pgf.312.1612378837054; 
 Wed, 03 Feb 2021 11:00:37 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/31] exec: Introduce cpu_untagged_addr
Date: Wed,  3 Feb 2021 08:59:50 -1000
Message-Id: <20210203190010.759771-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 0fOfy2TE7HB2

Provide an identity fallback for target that do not
use tagged addresses.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index e62f4fba00..d9dc1de414 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -69,6 +69,13 @@ typedef uint64_t abi_ptr;
 #define TARGET_ABI_FMT_ptr "%"PRIx64
 #endif
 
+#ifndef TARGET_TAGGED_ADDRESSES
+static inline abi_ptr cpu_untagged_addr(CPUState *cs, abi_ptr x)
+{
+    return x;
+}
+#endif
+
 /* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
 #define g2h(x) ((void *)((uintptr_t)(abi_ptr)(x) + guest_base))
 
-- 
2.25.1

