Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2599460lfo;
        Sun, 31 Jan 2021 03:50:37 -0800 (PST)
X-Received: by 2002:a05:6000:1362:: with SMTP id q2mr13190861wrz.341.1612093837144;
        Sun, 31 Jan 2021 03:50:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612093837; cv=none;
        d=google.com; s=arc-20160816;
        b=FVQkgO6Ui2qgQ7LVt2Ax4xlpVpy/Nho0rdH34KeH7nT66vYefaT0Ym4k2DpPF+aPbI
         9AlD/uLQSIj7+EAP8qPFLgH07H2QjowFDlhvW2XGC4pZ4Akk6Au22WGxMFuhOLhLx7vo
         w8SyAP1M2BGBcarqRzFcJVRODGFAJ71qugDz20vxVXTL+7ZQCSKvtdfL2yRT438Kz2ng
         yVKUGciePNaO9lvkwQ3YsG+uKdj+P9U9iA5VZO6q6W8Htzw2b2YXX9zdhZ5bPhhDlpOw
         avKpSVTF3TZMpBgUSsYkbZ4OLx0UUdkmrSmR0GG0SneULU6hiQsPFsPHteczfTWUcW+O
         nQig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=VqrmhVxmrVpTinVk4e74EOokFJxAnJGleMWOvxObkGo=;
        b=cK8UUubukYA2bDfLjgNCxV4JKA0myCycC4NzqsDIemIKSWPRQ3dg4Ug/ndb2ERLT/8
         NcC3B7JAT4W2nFOEbh8SidjnNrDu/s+JUXexvfN5dW8j7ed6RF0o5oQJJE04iJVOU3Lk
         yigu3z1cKO0eEwSXNpqccioEhqs/hzSLpIPdm/mi3EYQ/BRr7bVyZnR+t2VmsX/Ms5K+
         S7xro1NzXzBZUf+uHMnBjQNxRKIfhBO/b2cwQogfCBtKfzkFDg61C1IpSV3hxHnzUD3e
         lGuXSUF7DIHm240ey0DRDRhKnl1n4z8WnUVF81XIkfcW0RC5LhW3QHkusEqk8ZKAo682
         NgrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=lyvsp3J4;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v66sor6777335wme.2.2021.01.31.03.50.37
        (Google Transport Security);
        Sun, 31 Jan 2021 03:50:37 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=lyvsp3J4;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VqrmhVxmrVpTinVk4e74EOokFJxAnJGleMWOvxObkGo=;
        b=lyvsp3J4UkNurQZJVFz9o4JYa1UA1x5dEPXNh3rSqZoz/D+ftmCq5kSipCIzpP4yYJ
         nSMUwmKcyyFsbqMKa8oxpCNGlXb93gGlqm4bjingFBgZuIWD7AbI0OZpdaMufJDvHG9c
         qC5+dIBepWCX6LFsUMA77xsp6mvys75KRB+jURkPOHD/pN99OOtyoQ9btbVCGzoyfl6G
         MxbJzJi5FBOYnndo2ohyVKrRVbQ75AEh0rEWOFzVWJCmjvCGgSofwmaqh36oRozeOnfA
         jlgBJb1qNwvqao+3AOuUECbxkneAizqC36qIYrHOlMkRF5uKw5qN2ZdR2YCXPAzeFzfO
         Mz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=VqrmhVxmrVpTinVk4e74EOokFJxAnJGleMWOvxObkGo=;
        b=s73VIDHIi92Z4cpK4PIa96YJDxK6IFhm+yc7kvYjMK3whjl2kYeLf1lHcOrG/YQHGw
         eZeAfd5PGT3T5AbazMDuGlC8ERIuwYMs0ODOpPcsA6BSTRlqISF4ElS7pGXlddwBPVXV
         IXou5X/3/sNDGACGKkkLFPtVIfFAk0PFuV7u4GRAGn9u9bu/NWgHetHrSIPeITMKeUrh
         a0G21feZ1QK8EyEt8UeFUpy5wwglJHKay6Y7wmRjgln6ipk4vb15vn2AlqA0ITu4GcRw
         Lh5xCM4Ecu0IsLsojgVrDsRyDGLyvzuBrBdccDazctqjDRne/CbdCJtfbKvSkdokZgLb
         Afsg==
X-Gm-Message-State: AOAM531n0yLa2RMw0mBMIOnbj35ql88caoAkWUbSa4fkFbC3qrPIJ1nu
	jlBPeboNgXcaar7yQ9ud30E=
X-Google-Smtp-Source: ABdhPJzlUZ0PoftyMhnvPgCuDfPl7bBhNXVdBlytKA4JLNnnwx1y1kPvC5kny0EUlqDJX52wkKjIyA==
X-Received: by 2002:a7b:c196:: with SMTP id y22mr10912502wmi.91.1612093836938;
        Sun, 31 Jan 2021 03:50:36 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net. [83.57.171.7])
        by smtp.gmail.com with ESMTPSA id a17sm19517259wrx.63.2021.01.31.03.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 03:50:36 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Fam Zheng <fam@euphon.net>,
	Claudio Fontana <cfontana@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-block@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 02/11] exec: Restrict TCG specific headers
Date: Sun, 31 Jan 2021 12:50:13 +0100
Message-Id: <20210131115022.242570-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131115022.242570-1-f4bug@amsat.org>
References: <20210131115022.242570-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bKHpzWbDus6g

Fixes when building with --disable-tcg on ARM:

  In file included from target/arm/helper.c:16:
  include/exec/helper-proto.h:42:10: fatal error: tcg-runtime.h: No such file or directory
     42 | #include "tcg-runtime.h"
        |          ^~~~~~~~~~~~~~~

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/helper-proto.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/exec/helper-proto.h b/include/exec/helper-proto.h
index 659f9298e8f..740bff3bb4d 100644
--- a/include/exec/helper-proto.h
+++ b/include/exec/helper-proto.h
@@ -39,8 +39,10 @@ dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
 
 #include "helper.h"
 #include "trace/generated-helpers.h"
+#ifdef CONFIG_TCG
 #include "tcg-runtime.h"
 #include "plugin-helpers.h"
+#endif /* CONFIG_TCG */
 
 #undef IN_HELPER_PROTO
 
-- 
2.26.2
