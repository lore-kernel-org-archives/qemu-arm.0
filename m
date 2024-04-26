Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp638482ejb;
        Fri, 26 Apr 2024 12:46:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVx8wbJHXb1JL27PJNHecm5KlT7yqfgzJEss0TxPT/ocnSUnEZmaJvEXpv8t7ylJ0iRYRv0BdNd1DskRk9aDQYxNEJLSKl3
X-Google-Smtp-Source: AGHT+IHnuTJjW4tvGJU8ysOiEJLfp1K9BXW9KHu0QXYW4TpMZbspM1RqzUZAua56T2Vc0kgwFBJH
X-Received: by 2002:a05:620a:15b1:b0:790:94a4:c7ae with SMTP id f17-20020a05620a15b100b0079094a4c7aemr3739934qkk.19.1714160808048;
        Fri, 26 Apr 2024 12:46:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714160808; cv=none;
        d=google.com; s=arc-20160816;
        b=zkDlzxyB8rS9Bg5xhlh5oMAUBD/I0F5FvF5vOJzLqd80uZIFyFheLMLxe3GODI5Vga
         YpcFZO8Q+L1bm+8VDkM+4eyzp2b+zZNvyf4ixOycroqQ4/VbrOnvalONoY1Y775g4bUc
         4U1mfKLdI43VjOT9G1dgIrZr+NkVpv8ltBMgYkBOe4QRWmH6rl+YJbKfUeSITsl1FHgk
         /pjyfwCa6r4ZM4aw0VIGxmwtTGS1XPzuaklxUneALrT6Ls6Oi6PKT3Yws3Bk1itdWK6W
         OPrpT7xHUipb09WLVHGmQRiFIFaCvNykW4joW69vTlWQ0Y6Xblko/nOvhiazC1dPEa3j
         z5Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7TM8vdBJsyiS8N9/BcT+cG9GVrIFZEEoAIJDE88Bqbg=;
        fh=gUEsd95llBLtqUKhUnPIoHQ/SNwiv/bmtZ7rMzFWY9Q=;
        b=R41yXctRBp6T6flq2w/0BN8CUAvRkMR8398H8hjqohOHG6+w4SeQslyqgqxUUR/rYX
         RFry4M6RUViy84JiNLeGoZjEFMKFMBvjqfRzwppMlYfKBEC1qbV9nQBxF3yH3Z6YkEzi
         umWmNV0zydYLd+frMOnj29kBAi3tkXD3DIVI00w/6z8AbXobElZq2L81IK9IoqUDbjFM
         ZLMa381UwaVLfEFnbRtj01BAbDvnyd6RAvm8Yk4PzOVwsyVtKJbigW3h07b3gOGR5VJR
         wr33flDL+9RFh8FLL86MPpnilQ/CTTH5MtddcnNp+FBNSUexYq+JGo52fJNUEOOL8E1c
         g+Nw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=arlsN9et;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g3-20020ae9e103000000b0078eb967b9d3si20226922qkm.369.2024.04.26.12.46.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 12:46:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=arlsN9et;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0RUh-0004xB-3R; Fri, 26 Apr 2024 15:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RUI-0002my-Jt
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:44:02 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RUE-0003KK-U7
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:44:02 -0400
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2def8e58471so35735001fa.0
 for <qemu-arm@nongnu.org>; Fri, 26 Apr 2024 12:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160635; x=1714765435; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7TM8vdBJsyiS8N9/BcT+cG9GVrIFZEEoAIJDE88Bqbg=;
 b=arlsN9etaO/ndGX0QWFywtqhnSpWdEOR5KyFtBojbdVzKtuLkEOeCxi2Xr5wz2SNnj
 VBogtvFjVDS83E34Wm40T8hcoJGdIIXosVR2p6pX+Rv8A3TRJnj3EQ2NzJkYXCxASlRb
 RUteAPJzykKnkD0AkCQj9Y5rqXNlTknmhKrL5MQ6Ct3yxsnGbOcablX8AutaxFtniZ/8
 A0LyGA0EA5GZ8V3wkWO0iDMuBlhhh4Ar4XnT2vEGmiZjK+/PoqNYfQbIaKUW81PZkPKs
 SPMitYdt+CM+G0fCiJ/mBo35kilvzxR+e0nQRHdcAtYdjGSlanFPrFHx8iJHbB7znNzC
 WbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160635; x=1714765435;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7TM8vdBJsyiS8N9/BcT+cG9GVrIFZEEoAIJDE88Bqbg=;
 b=g8x3STu3Wgm+KtYTfliid2YQXqAFvf/YCKL8wQbFKrF5G4Mn6c72UWJCJtqdm2yI6k
 sUZicg/4KYkjVlE15kc+G4D80QsQVED5rRWfdt0IRR616nV9Lq31DL9G5W/eHmc04lpQ
 JofpOvrtjTpyivTffim3Yh2NAXy2nxU57RodJBGfG0sPCGvw8X2buuErnh3hnLAj4dPh
 razQcuh9GNVBfkg/FinqL6frrgeQCDxctwJPwZ6K0tYLKEUtwkpjquEI3sZF/A3QU0eA
 6AJ4qGkeTnV8ugujsLU0nl3hZBJ8kstQKCYJZUG+aN8NA4pA6GpP8BtwSUVroITMmXB8
 nTkA==
X-Gm-Message-State: AOJu0Yx85VomP7/kfg9p37Yxa6MSl9/RGEY5q6/uUY1WSP1kDWsJlTA3
 h7kVyLM3I6HdGRZbB8e66l7KJJcjvUlyf33vTPJtmNLDwQHQM8Z9gHARAoXN64M=
X-Received: by 2002:a2e:7d09:0:b0:2de:75de:5b0b with SMTP id
 y9-20020a2e7d09000000b002de75de5b0bmr2771242ljc.18.1714160634772; 
 Fri, 26 Apr 2024 12:43:54 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 i22-20020a1709061cd600b00a55a10eb070sm7881150ejh.214.2024.04.26.12.43.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:43:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 19/38] accel/tcg: Rename helper-head.h -> helper-head.h.inc
Date: Fri, 26 Apr 2024 21:41:39 +0200
Message-ID: <20240426194200.43723-20-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: F+ex/1OVCmNJ

Since commit 139c1837db ("meson: rename included C source files
to .c.inc"), QEMU standard procedure for included C files is to
use *.c.inc.

Besides, since commit 6a0057aa22 ("docs/devel: make a statement
about includes") this is documented in the Coding Style:

  If you do use template header files they should be named with
  the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
  being included for expansion.

Therefore rename "exec/helper-head.h" as "exec/helper-head.h.inc".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240424173333.96148-4-philmd@linaro.org>
---
 include/exec/helper-gen.h.inc                     | 2 +-
 include/exec/{helper-head.h => helper-head.h.inc} | 0
 include/exec/helper-proto.h.inc                   | 2 +-
 include/exec/helper-info.c.inc                    | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename include/exec/{helper-head.h => helper-head.h.inc} (100%)

diff --git a/include/exec/helper-gen.h.inc b/include/exec/helper-gen.h.inc
index c009641517..d9fd3ed72a 100644
--- a/include/exec/helper-gen.h.inc
+++ b/include/exec/helper-gen.h.inc
@@ -8,7 +8,7 @@
 
 #include "tcg/tcg.h"
 #include "tcg/helper-info.h"
-#include "exec/helper-head.h"
+#include "exec/helper-head.h.inc"
 
 #define DEF_HELPER_FLAGS_0(name, flags, ret)                            \
 extern TCGHelperInfo glue(helper_info_, name);                          \
diff --git a/include/exec/helper-head.h b/include/exec/helper-head.h.inc
similarity index 100%
rename from include/exec/helper-head.h
rename to include/exec/helper-head.h.inc
diff --git a/include/exec/helper-proto.h.inc b/include/exec/helper-proto.h.inc
index c3aa666929..f8e57e43ce 100644
--- a/include/exec/helper-proto.h.inc
+++ b/include/exec/helper-proto.h.inc
@@ -5,7 +5,7 @@
  * Define HELPER_H for the header file to be expanded.
  */
 
-#include "exec/helper-head.h"
+#include "exec/helper-head.h.inc"
 
 /*
  * Work around an issue with --enable-lto, in which GCC's ipa-split pass
diff --git a/include/exec/helper-info.c.inc b/include/exec/helper-info.c.inc
index 530d2e6d35..c551736d49 100644
--- a/include/exec/helper-info.c.inc
+++ b/include/exec/helper-info.c.inc
@@ -7,7 +7,7 @@
 
 #include "tcg/tcg.h"
 #include "tcg/helper-info.h"
-#include "exec/helper-head.h"
+#include "exec/helper-head.h.inc"
 
 /*
  * Need one more level of indirection before stringification
-- 
2.41.0

