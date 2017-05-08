Received: by 10.25.0.198 with SMTP id 189csp1593682lfa;
        Mon, 8 May 2017 16:44:49 -0700 (PDT)
X-Received: by 10.200.40.87 with SMTP id 23mr4613203qtr.37.1494287089727;
        Mon, 08 May 2017 16:44:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494287089; cv=none;
        d=google.com; s=arc-20160816;
        b=vdj4n4ACOJ52QXDFSVlAKUIjy5NfXxr2UiAIwg/uUsXFyFNca1/aNxLHKOkIm9mPX9
         mg2Fvg2LazFzokRZLAsoAmE0FnfkvYuNYaWe4r1XtCUymJwEimg+y4v9HnQyUoEANa8i
         LTikEocsLZTv7LHsDZ1oWJHWKgXByEsPfuB0t4Jlmo4BaD5tm2uk3jrf535Q1VVbYW9q
         XZBM6xkVMLeUoRjxPsp5SKzRZahlpsx+orJWAXpwk+D0eKrnndLaRFkcXCkTTuH68lfH
         55zvOTdKoePnEjJeyI7QiUymxqo6s4h3BkkMDx+Xf3rUvjqyqsh+rkqddSQJkEdOLVjz
         IpMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=cQlJSUHA4US3m+zDfsgHz6T8gVYffWCQO4uMkgmAxv4=;
        b=xHHv4keH+P5N54acIggWZMDEQaltlxuqa/7jRz5l792gC/h9gMEw9iECGvK/5w5JEp
         37+qEx2fc2TgAtoVIgXBM6+PqooL7Aw6Tr4Gi6dMSPkyTek72qVs6kTQatesXadxR7Xz
         GBv/vPFQ9DGOQM3xpgQkS79DSk0V4eoi4CveO0jOlPEZzMpNgJfPe5myag4wUcLEN6DY
         wIezRFj0eAtBSeNI0BEoVk3DkS9b0hXjJsD8P2xSzJndUthv1iCGKk3mQSgfJnNopzPI
         rA8vn2wVXn9XoFGXya0rOFlfpq6I8sDqXVOzMpIxCDrM06ErMZof7IHpU+uoJkPT1b/C
         Vseg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f2si13501506qtg.148.2017.05.08.16.44.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 May 2017 16:44:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34170 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d7sKf-0000T3-5v
	for alex.bennee@linaro.org; Mon, 08 May 2017 19:44:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFl-0004zQ-07
	for qemu-devel@nongnu.org; Mon, 08 May 2017 19:39:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFk-0002Hx-AA
	for qemu-devel@nongnu.org; Mon, 08 May 2017 19:39:45 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:34000)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFk-0002Ht-5v; Mon, 08 May 2017 19:39:44 -0400
Received: by mail-qk0-x241.google.com with SMTP id u75so12344413qka.1;
	Mon, 08 May 2017 16:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=cQlJSUHA4US3m+zDfsgHz6T8gVYffWCQO4uMkgmAxv4=;
	b=TrbwfelNiv8po/CZcAyGcLDJX6lVzrMBJZI5SMeFjqxEwJmZ2wf5Ms+uV4XcXXnmkE
	rn/sWOhQfJn6ikx8FkBbe2S3eXmRinmLeaJkb/gmjfYCjN9isGfaEM1RdSZPXVcul0nq
	qNyzbo9HPOO+RbBMDtAxc7ffgdVglf+mChB4jVOPRUlfpRwgaqL/UVseEiiyegDLZZsY
	sHg4jfbWzd40uNFPFAIGYOlxrDkHrpWPG2wiMJnBbK/tTgleMB0m+v2NFSGjRROxj2Vm
	9iwAj9dx151TpIfmHzdal0jtGU4g9KjJsBzG8zo/V0T+rU7bOAhdLflxVKOm9UdG6Uaa
	RGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=cQlJSUHA4US3m+zDfsgHz6T8gVYffWCQO4uMkgmAxv4=;
	b=rsJxuQg46a21iLQvbEo3YI6U0tuEUKR0gl0R+D0GUkA7IqR6hCmEOcuOQ6XssH1CRI
	1XRRh85UP+qdQgk1X5Kpy9tBZ7xvBFb21q+McYW1MgrfM/hf7m0eqk5sxG9cAMxOX4du
	hQtCWG7tIkD/cbEqh98p0TG8pow5MTWvkvitd1o6hAdR/OC+Z2YQSlRNaAgfRkplca0f
	5Bsr3LPbtz1twbY0v89tdHRAehtACqSv3f6m6rVomavt7hbtQGMgs+B/7HM2H+kpT4Kh
	3nrch2lx8GsSbhBjp2lFxUaCLUxteJAjC6TKCUf0VinSuwdFpGZrlsXzc7wWi8ken5M5
	ZT6A==
X-Gm-Message-State: AODbwcCGu1j/E47XeehHprPNKaTNdeftLv71M0x3drQRfIdohAkDqvB7
	YB3YiK8S32js9CD+2YjluQ==
X-Received: by 10.55.212.24 with SMTP id l24mr354882qki.165.1494286783518;
	Mon, 08 May 2017 16:39:43 -0700 (PDT)
Received: from localhost.localdomain ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	v64sm13556099qkg.38.2017.05.08.16.39.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 May 2017 16:39:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Date: Mon,  8 May 2017 20:39:13 -0300
Message-Id: <20170508233918.9043-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170508233918.9043-1-f4bug@amsat.org>
References: <20170508233918.9043-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-devel] [PATCH 06/11] hw/arm: removed unnecessary include
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +Z8qm0uSY50L

"exec/memory.h" already includes it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/arm/arm.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
index a3f79d3379..b9c11d3fb8 100644
--- a/include/hw/arm/arm.h
+++ b/include/hw/arm/arm.h
@@ -14,7 +14,6 @@
 #include "exec/memory.h"
 #include "target/arm/cpu-qom.h"
 #include "hw/irq.h"
-#include "qemu/notify.h"
 
 typedef enum {
     ARM_ENDIANNESS_UNKNOWN = 0,
-- 
2.11.0

