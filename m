Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2538942lfy;
        Mon, 24 Aug 2020 06:01:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHFFzmOFiVlcDLjVqfPI5NOqxasp4uYcYeZ4c70G2ABzQrl6jWY50Ldcevrh+bpGPuc4p6
X-Received: by 2002:a25:ad4e:: with SMTP id l14mr7403146ybe.322.1598274100519;
        Mon, 24 Aug 2020 06:01:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598274100; cv=none;
        d=google.com; s=arc-20160816;
        b=GGOdHuMp/HJaw21g/R0/o+rei8XEqSbo5M+ZjZGXMj/puHv+xqchEPiSEhS2DnxhTM
         aiFtimw8fgUS3e9MRjTwQcSOyGL4GGCY1Rz9yz3zf7k/bYzJrt65SNdzJiSuxgr7FlHK
         NFC1e1NPt7CKqllUtEmgH8VHpf5YTncnG22kwZjrFfs50FFnEFwQs7++XOjqnuruHxSW
         zJQ1XCmt/SiT2hZN70zHRbn3NF4wMNdFjQaohLhZeQ2Ccxs7hYv13hPx6FTboIxWGLWj
         L4k4uQ1ro/dNCqA1v7dRVmBqTogwrWWmXc/dhrG2I0VFzheB6s0dEDf+IMxWpU/BfSc8
         1pLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=esL1dkHZinACs22qmxIaFrjRQ3jGjWpeBvTqQ19GGJ8=;
        b=Qf84tmpommUzQV4nnM/EtcYgNUiX+wMHXfCsMEY5NIzzm18ZydXlJppUy1+nfK3Mdh
         gn4pWTzyotPJEj9sYdP/slnAG4XpYMxJACVMGavN8VawQ/WSnZbDi9iy8lc84UCpjwte
         Yl4ZQfFiF1hGmrgFIv9oKjsE3Y84X6ShQAWB4ErREO8XYeW2AEMa7ln3PB9ENhmBNE0G
         dg8SDlQDJ/qXe3zM1DHH2A3WyE/u6RyEgpTX444lG20EV6NbiQF0cZxhZ9bXvssOHBGM
         eN87vJ10/KGGRbuPsN/I6g3NhabowdIOSA/5a9t9sFb2+41oIm87lRSR/FlCselYXjm/
         0W2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EnmzFm9O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b3si10666841yba.271.2020.08.24.06.01.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 06:01:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EnmzFm9O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAC6V-00037r-TJ
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 09:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kAC6L-00037h-AM
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 09:01:30 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56323
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kAC6J-0006tR-37
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 09:01:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598274086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=esL1dkHZinACs22qmxIaFrjRQ3jGjWpeBvTqQ19GGJ8=;
 b=EnmzFm9OUHBNJ+m5CEhRtwtZF5HIwIeSVj8L5lvk1+D0ZBpGEMfew/Fddp1DvxoIbnQRBX
 kTLuBz+F7cRxR0NyZ8PctgJHVNsXE6gyLlJy3QU1RKTN7sujllACCN6zS1gsK1i1YJWO9s
 rS6L6ALqHEAKR7jchpfTZL57N+iuzm8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-WEYbk-JXNlGKI9cGCSlJOA-1; Mon, 24 Aug 2020 09:01:18 -0400
X-MC-Unique: WEYbk-JXNlGKI9cGCSlJOA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91C8380F043;
 Mon, 24 Aug 2020 13:01:17 +0000 (UTC)
Received: from thuth.com (ovpn-114-8.ams2.redhat.com [10.36.114.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 514FF5D9E4;
 Mon, 24 Aug 2020 13:01:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] disas/libvixl: Fix fall-through annotation for GCC >= 7
Date: Mon, 24 Aug 2020 15:01:14 +0200
Message-Id: <20200824130114.41368-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 06:40:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.956,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B6jVAYzsBcbs

For compiling with -Wimplicit-fallthrough we need to fix the
fallthrough annotations in the libvixl code. This is based on
the following upstream vixl commit by Martyn Capewell:

 https://git.linaro.org/arm/vixl.git/commit/?id=de326f850f736c3a337

 "GCC 7 enables switch/case fallthrough checking, but this fails in
  VIXL, because the annotation we use is Clang specific.

  Also, fix a missing annotation in the disassembler."

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 disas/libvixl/vixl/a64/disasm-a64.cc | 4 ++++
 disas/libvixl/vixl/globals.h         | 6 ++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/disas/libvixl/vixl/a64/disasm-a64.cc b/disas/libvixl/vixl/a64/disasm-a64.cc
index 7a58a5c087..f34d1d68da 100644
--- a/disas/libvixl/vixl/a64/disasm-a64.cc
+++ b/disas/libvixl/vixl/a64/disasm-a64.cc
@@ -2985,6 +2985,10 @@ int Disassembler::SubstituteImmediateField(const Instruction* instr,
           }
           return 3;
         }
+        default: {
+          VIXL_UNIMPLEMENTED();
+          return 0;
+        }
       }
     }
     case 'C': {  // ICondB - Immediate Conditional Branch.
diff --git a/disas/libvixl/vixl/globals.h b/disas/libvixl/vixl/globals.h
index 61dc9f7f7e..7099aa599f 100644
--- a/disas/libvixl/vixl/globals.h
+++ b/disas/libvixl/vixl/globals.h
@@ -108,10 +108,12 @@ inline void USE(T1, T2, T3, T4) {}
   #define __has_warning(x)  0
 #endif
 
-// Note: This option is only available for Clang. And will only be enabled for
-// C++11(201103L).
+// Fallthrough annotation for Clang and C++11(201103L).
 #if __has_warning("-Wimplicit-fallthrough") && __cplusplus >= 201103L
   #define VIXL_FALLTHROUGH() [[clang::fallthrough]] //NOLINT
+// Fallthrough annotation for GCC >= 7.
+#elif __GNUC__ >= 7
+  #define VIXL_FALLTHROUGH() __attribute__((fallthrough))
 #else
   #define VIXL_FALLTHROUGH() do {} while (0)
 #endif
-- 
2.18.2

