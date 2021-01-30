Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1618737lfo;
        Fri, 29 Jan 2021 17:52:35 -0800 (PST)
X-Received: by 2002:a5d:4e8f:: with SMTP id e15mr7465359wru.9.1611971555854;
        Fri, 29 Jan 2021 17:52:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611971555; cv=none;
        d=google.com; s=arc-20160816;
        b=cqCJpQDi5/oqT5Xe8eLIg4PXTZvpgAG0l5/q8Czj8hrEuTccjsLK+rZKUntopq7dK4
         l5VlO6lE76PLBxPrpRRdfMtp8iLRfKB8Bgo0FqZYJgpu7u6AiD22QuCEgKZ3ln9NzhdS
         QexSfxw2WXZ/pNSNLHmR9y7pYA8JU4FD0InLxaod6yeFwBrZ8v6ZgQUMXoxXhmgEOB5Q
         BZGFef8SJbfHGYFWdLgp0EB4Me/H3RNN16WFpHoB6h+EigQjQg9TCAl7xlULxx/+serf
         PSubxdN0B+UxcdSr3YW3TGYAyavU8hzKkwvDn6DIasoH/+4nKluTZSjbacqTG/lFw7U1
         kpsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=TWOO2zfu8P4UM754zwKeQRqNcelSJ+Vi3BwaB87IrgI=;
        b=KGWq3bIPixhXaZScrHmHcdq/lbxmL8XdilXWKJedc4Y9WP0K1EnEs4kRkmmVWtp+4s
         izg/icWft2dvdnWZdRbhBK3JQDVQ10Nh8WYArYPoRuyLcwOkHcQCU0u968l7RnocBAhn
         FVGOo/6HZl8l6fskudtRA/vvIg4waAblVXVDLwGcEEZ1VwzHkrLRfp/VZBsz1Vksq12Y
         W5v/OkaV6GXbG5x5i2fyaanq4bmHWLIWBwsF7szMW6XJIMZbqGiyiHAMismPREoUdCEL
         T7kXXnunmTo1wBhoUeSSsAfNITfPuqE7gr8YDENcwn3TgPfMg6OICoHHvwu+BgcQ4mjk
         WL2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=EZ4R0A6K;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r16sor5660926wrr.10.2021.01.29.17.52.35
        (Google Transport Security);
        Fri, 29 Jan 2021 17:52:35 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=EZ4R0A6K;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TWOO2zfu8P4UM754zwKeQRqNcelSJ+Vi3BwaB87IrgI=;
        b=EZ4R0A6K45GJEpt3ikVxK/mZ5uOp/qSvLKwjO7LS5PbjeX+3sWdmNlr+4p56lnPtqL
         CUdY1yW1rTe7NWAKG6FtSRNNZKnZUAI2VEHfT9t/GySrE8ds9BQbysvGJYiW2faVZNpm
         DGZ+2ZzDYpOjHkDu0jST31KidNc+L9/fohOoZJZMRjKENmO2boj+1Bne8nOdoKsZZOk2
         hms4LiJZ9snctfQC29BzW0EhHYsmNCX7dzY+CxfZJyC29i8WBBxcI2hmd0NS7su5sU/F
         vCixTZjkQ3F8hOmBQQBzuo5d3mfiya1x/ZzCDk9XbkWe7CW7UiXUFmxJzINuRhOtpEh6
         vHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=TWOO2zfu8P4UM754zwKeQRqNcelSJ+Vi3BwaB87IrgI=;
        b=PxpOeQY17v5NbCvt7xLhRiDfF6qLrTKyBaqRcfiWnssNjKjWTXKmsXRZqIQMyYzmIG
         ePt/GNiDhTXRu9lrF1gfObXlZAZN9Prgv5A3dhuMbUR/9g44yj6dKizPhehAeehsSsiE
         e6+xBskyQKv/y149tTyfmtuszcpn2QhH1znSVGSjMWzg08YZJTMLF7QDklwA1A0jPcWE
         F8rWsANCFhJbkiuuy9LFMb5wmvQ7deAIUZjR9GFoFEkB6eJjm7cOdfo/k4ZMfDhmqI4q
         24OOF2UlDR8plz0HT6zFFrgtW11BbXOW5a3qjYciy7AC0Qk5kB7T+eFVBfEHrMXMqWVZ
         es9g==
X-Gm-Message-State: AOAM533AdXsD6mADzZfq7iQoDe9fYhGuNkymecvOLDlOuDf+Ft1z5qPf
	WjSZi6Kqn6StT/VuOWvPnog=
X-Google-Smtp-Source: ABdhPJwm3L7bSc0x4zKW4ljahz5/V9fkUWnJDpwudDy2IcbG2e/6dOTMtKI7Na8SK+4UY4kLg/lEbg==
X-Received: by 2002:adf:e4c9:: with SMTP id v9mr7191301wrm.277.1611971555621;
        Fri, 29 Jan 2021 17:52:35 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net. [83.57.169.13])
        by smtp.gmail.com with ESMTPSA id u14sm11707719wml.19.2021.01.29.17.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 17:52:35 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 01/11] exec: Restrict TCG specific headers
Date: Sat, 30 Jan 2021 02:52:17 +0100
Message-Id: <20210130015227.4071332-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210130015227.4071332-1-f4bug@amsat.org>
References: <20210130015227.4071332-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qVw0eC9Zu9CG

Fixes when building with --disable-tcg:

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
