Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6D1CC6B1F
	for <qemu-arm@archiver.kernel.org>; Wed, 14 Oct 2026 09:45:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGvXb-00069t-5j; Wed, 14 Oct 2026 05:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvXT-0005XJ-Qx
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 05:44:48 -0400
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvXS-0002Ab-2a
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 05:44:47 -0400
Received: by mail-dy1-x1335.google.com with SMTP id
 5a478bee46e88-33c2520ad38so9002135eec.1
 for <qemu-arm@nongnu.org>; Wed, 14 Oct 2026 02:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791971085; x=1792575885; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sWqnMtVBapcAMkNSzz9Oucq2kSJcuJ58bnoxZuu8/QU=;
 b=h28cYMYx83AH/25b/yFQ9Y0kuo0M18OtVgEOL3QjFDsJxoYvInqVvMsHjoB/9vquzx
 +AEiYBpOwSb+p63YpzxMNPR96Qsd9D0yzDgNCRuq5hEq8PiUTedPmjzZ0UhJc+onuV54
 7sPkbL24mSTF017grmOaP5BL1xWvClzRTo7dIR9bKyg24o1d9N4W+IDMQQpu8rl0lIux
 vtn8KsN/aUh7Jq73pc2BSSLwOTD6Bi28iSHa0PcJMNtkap6+IHf42eQ1Cuuuiy+eD9Vo
 CCIICYRWlx+uzwjVmM+SBbsCD+KxpXy3+gWLcUgEdaj9jlABpPMZIRGhRRvvi+SFMeZj
 0eow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791971085; x=1792575885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=sWqnMtVBapcAMkNSzz9Oucq2kSJcuJ58bnoxZuu8/QU=;
 b=cFeL3yPKGw/DvJAjRm6+pmPRVjNAI6zCN4FmWCWjPuFEuKcMOgP84jyzLoDgc89tyz
 NZaJ5KrX9C8yo/GgFlUuFh4TD2DbWNJEhoYYXl+HC6xmNvP++ZQCPAj3GzV+wD0+hnD3
 k/tXl3NrwmQX0CM5+hygIU9gsiII8hLaZaiOvLLQu+UHqjXifvrQBiQh7D+lNH7Uiifl
 gPp2GKvg6EwXhs5k6AN7PWnRZkOyUyLltS4F1rvm99UcaoTcbqM2MVySK0gdTCBEcjij
 d3hwKpz8quXZ6LROMXJ9yyFNuNuDkLoZsM5occOUEmX9zGaAJV00hSHk4eNMTjtCLleD
 wcoQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx1vo/c8RZ4C6M+w0nR1AJ8tz+YfBiAENY+o7bAwbbGSYkPtOoemd86Gci9jhgjJ5olz9OxHQMw1A==@nongnu.org
X-Gm-Message-State: AFq9FYJYJ3V0f8B+5mccRrqEYUyhdj6zkq0yY8dn5tjbK4Ep38bD2uiw
 +tozikUgVgsA14DgYSO1WBYDKoh5nu3CPp/0B6SYG3UZotWPjUpjFeQG
X-Gm-Gg: AYBFou0rQk8qrK09nUEDv7kiBIiDwj8FoLJWX+ocIjxejjF41CUmWx9uBgDe+YM06YV
 /eE9AmFsP/29COG0gFvwyD1QGHSRgqpuQ5iK2l+1YqV0juqraKNS05jnzQlI/EiONLvOIUXBp1N
 ElsZZ9E9cDxZsEyM6GuWR/PPjqDMehdVTzCxmOLAIOV8LoXQ1Mow9UifRJ2ZO+/w/zOyopG1Qg/
 eJSkp01lClJsJL7rm0QhBh9mBu6WMFKceTl3jzEoOPp+HYQG90k4X4fd2j/m7ihUZm6UUYNbknn
 rfP/HAokytz8YsDNAihWOlEww0sWbw6R3eoyRrzQMBnHBDCyOJizygmMpWGqeYDTUuOobgLwHts
 16d0SeOUAzg2uZFaBck0CWmQ56Qu1Iue7BjJQLrBX37lFpZ3lB6NxLyOENngxg4InmWfnYUb0ao
 zn0BEXOCe7HFyHKgfeRHGtdd7VDW19cWEl4nzXJVW55CLemRlT5kSqIB3cljXB7hCGvYKCRbhUC
 5O8db2Lg4KPn/75ew==
X-Received: by 2002:a05:7022:7f14:b0:14d:c53a:f6a0 with SMTP id
 a92af1059eb24-16a5dcf6278mr21934044c88.13.1791971084559; 
 Wed, 14 Oct 2026 02:44:44 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-169a31f6f5csm44348380c88.11.2026.10.14.02.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 02:44:43 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, Eric Blake <eblake@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-s390x@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 David Hildenbrand <david@kernel.org>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Fabiano Rosas <farosas@suse.de>,
 Song Gao <17746591750@163.com>, Fam Zheng <fam@euphon.net>,
 Markus Armbruster <armbru@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Chao Liu <chao.liu@processmission.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH 29/34] system/arch_init: update qemu_arch_available to handle
 non-target select condition
Date: Wed, 14 Oct 2026 17:41:44 +0800
Message-ID: <20261014094224.1976-14-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261014094224.1976-1-luoyonggang@gmail.com>
References: <20261014094224.1976-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1335;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x1335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Under multi-target qemu, target may not selected when call to qemu_arch_available,
return true for that.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 system/arch_init.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/system/arch_init.c b/system/arch_init.c
index b8362b12a6d..5424ef8cf24 100644
--- a/system/arch_init.c
+++ b/system/arch_init.c
@@ -24,9 +24,17 @@
 #include "qemu/osdep.h"
 #include "qemu/base-arch-defs.h"
 #include "qemu/bitops.h"
+#include "qemu/target-info.h"
+#include "qemu/target-info-def.h"
 #include "qemu/target-info-qapi.h"
 
 bool qemu_arch_available(uint64_t arch_bitmask)
 {
+    if (target_combined_binary()) {
+        /* Allow all architectures until machine selection sets TargetInfo. */
+        if (!target_info()) {
+            return true;
+        }
+    }
     return extract64(arch_bitmask, target_arch(), 1);
 }
-- 
2.55.0.windows.3


