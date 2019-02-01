Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp7541362wrt;
        Thu, 31 Jan 2019 17:45:54 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7YQb8e4Mt8VxbSNLc95mFui9pPUvj+le7swweQu/uOXpRS3Q2iT6Zdsr2mcE8CZ1RZd1JN
X-Received: by 2002:a25:a501:: with SMTP id h1mr34807189ybi.440.1548985554243;
        Thu, 31 Jan 2019 17:45:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548985554; cv=none;
        d=google.com; s=arc-20160816;
        b=VKK9aibwatIhNWpYX4QSZ2wyWsS8iAijV1FkDK81JquNR2D1xxyLOPPzEeBTtEn+Hk
         rsGEuI4KuefETpQuzKklS9ZosJuNPUb2N2cxFhGem6Xfo5reFMQmTX8vNBwj8nfr3Bbs
         /UgSJbaYLDaXIsD6KUsWwN8IdsPzUh0HVOTX68f7xRe56yxo2PdQoXGXASVUtLPw6AqW
         LPz111bd3/gn1VhrDUJiOl7s3wWZHs2IoLYY2cZTOEu3LqE173e/SXj0L+YKa1RkwAOX
         GZJPAAZJUsuMdj7iOSDaohc8JFyb0eepzXZTQeOIIYCXNaslzDOcV/Ktdxr/EGw4tF0p
         p+cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=WTdNhU8ryYaufrelMnXjcRozsxwAQFzQhcN/2AgKcHE=;
        b=yKAoqei5iDnGkMnTzfuViUjaxE8uLJsL0YDxjNp/vpz649tn8k7CWL6zYrdp8ZpUCT
         m36lJlpXy2rlCFvhwNG13y9Xf6KpS1qepwZFeZjsdm51mTLbr1VzV/WJFG20PuFR1r7T
         SycqCjK0e6BEBd743efW/N0bXRPExkO4fYaF2nm85CmvZzUJp9hzj6XBvgBtBiOhbafn
         yotGdVRcrWZClhUacNbu92eixm6KOHLmxUhwqXC972qYQXf9ETn+CLhTUUDSzqJokFme
         0XLbb3oMVAu1GIk+R1aas7LfG5Gyhgh7+fVhywlPRaNCwPsZlOlbVNd2H7NwpeA/hnCg
         AV/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dK1Gijps;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t18si3477959ybl.105.2019.01.31.17.45.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Jan 2019 17:45:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dK1Gijps;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:35552 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gpNtx-0007PN-PA
	for alex.bennee@linaro.org; Thu, 31 Jan 2019 20:45:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59022)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <catherine.hecx@gmail.com>) id 1gpNsz-00071P-Gl
	for qemu-devel@nongnu.org; Thu, 31 Jan 2019 20:44:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <catherine.hecx@gmail.com>) id 1gpNsy-0007wJ-Th
	for qemu-devel@nongnu.org; Thu, 31 Jan 2019 20:44:53 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:33124)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <catherine.hecx@gmail.com>)
	id 1gpNsy-0007vt-OI; Thu, 31 Jan 2019 20:44:52 -0500
Received: by mail-pg1-x541.google.com with SMTP id z11so2185857pgu.0;
	Thu, 31 Jan 2019 17:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=WTdNhU8ryYaufrelMnXjcRozsxwAQFzQhcN/2AgKcHE=;
	b=dK1GijpsvMQwnByAwmZuvt5haVM2YI64wteuFHZNUrjx5PbtJX3/SNInnCQpacFJrq
	h61fustUlirDTSHaHEhOwg9N+HMgzLXB2rhwmskkOYNnHSHVC/gI86Oam/edac9LZdqc
	SxFZp2x4pm5WuVSHJ4smuoVLGxqXmvsMLopPazxfHkBrzKHGNoNpDxsk0KQp9hkcrcgB
	JjZ2NGRcMc1iJfRx1YMy0oHM6hz231rAMzUVouyIaesHUyEt1EeUbRi5hf/gwXVOLCl0
	R298bymce7nVUwqVoV27SUC97hbPVMxmSP4EiE48VV+V2WXLDomCb7iCqq/Aez1HIJa0
	BDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WTdNhU8ryYaufrelMnXjcRozsxwAQFzQhcN/2AgKcHE=;
	b=de1VUMpgIP/C7WSTPD3Rh7HCkfn7PLCYB54x0wq4DMIJkBACADp3vdN0Ns2SF5Qs1B
	CCOlLYZ9ysuBeSFFdbZO0BTMnxAURfJlKwEWgKbgttuNygNwyTXF/28/37CkNCgwGsoW
	XO3fgD27BSGCla4INiDU/n0fvKNiTHOc+nUXx/U6HnY8fzzNSlRC3oYGDFQA4hY5Qvjp
	Vcz7NyjFKsLDXlsbP4oeOcYvNVByGdKXvca0k7476U4Z0WfZFWJNfvoopazxIlODFaoe
	Z0dHcpKbQZ5VEYngEq6Umg1C1c+s5zKeWztjZVG+JklRCZgPcqLCYsSfze77uQcqznV9
	8n0A==
X-Gm-Message-State: AJcUukcGBY3CGx6F45IdDabvvrIOMaKqW+R79uuPDp/+1hgPp0QlxWax
	/iMGohH0uQLkda4sz6owm5Y=
X-Received: by 2002:a63:4c4e:: with SMTP id m14mr34112805pgl.173.1548985491122;
	Thu, 31 Jan 2019 17:44:51 -0800 (PST)
Received: from host.localdomain (96.45.178.72.16clouds.com. [96.45.178.72])
	by smtp.gmail.com with ESMTPSA id b2sm11329587pfm.3.2019.01.31.17.44.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Jan 2019 17:44:50 -0800 (PST)
From: Catherine Ho <catherine.hecx@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	"Emilio G. Cota" <cota@braap.org>, Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Jan 2019 20:40:44 -0500
Message-Id: <1548985244-24523-1-git-send-email-catherine.hecx@gmail.com>
X-Mailer: git-send-email 1.7.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-devel] [RFC PATCH] target/arm: Fix int128_make128 lo,
 hi order in paired_cmpxchg64_be
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Catherine Ho <catherine.hecx@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hv7Aq65gWJio

The lo,hi order is different from the comments. And in commit
1ec182c33379 ("target/arm: Convert to HAVE_CMPXCHG128"), it changes
the original code logic. So just restore the old code logic before this 
commit:
do_paired_cmpxchg64_be():
    cmpv = int128_make128(env->exclusive_high, env->exclusive_val);
    newv = int128_make128(new_hi, new_lo);

Fixes: 1ec182c33379 ("target/arm: Convert to HAVE_CMPXCHG128")

Signed-off-by: Catherine Ho <catherine.hecx@gmail.com>
---
I didn't see any obvious real error case here, so set it as RFC

 target/arm/helper-a64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 101fa6d3ea..70850e564d 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -583,8 +583,8 @@ uint64_t HELPER(paired_cmpxchg64_be)(CPUARMState *env, uint64_t addr,
      * High and low need to be switched here because this is not actually a
      * 128bit store but two doublewords stored consecutively
      */
-    Int128 cmpv = int128_make128(env->exclusive_val, env->exclusive_high);
-    Int128 newv = int128_make128(new_lo, new_hi);
+    Int128 cmpv = int128_make128(env->exclusive_high, env->exclusive_val);
+    Int128 newv = int128_make128(new_hi, new_lo);
     Int128 oldv;
     uintptr_t ra = GETPC();
     uint64_t o0, o1;
-- 
2.17.1

