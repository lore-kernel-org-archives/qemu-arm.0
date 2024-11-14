Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp26110njc;
        Wed, 13 Nov 2024 17:14:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUfLZro3gra3jm1eOsHc94iBc/SwXtR5ScCHDOybwa/BhOoRopmObMGGCQAua8qo9pAT3U1qhNrnZMAig==@linaro.org
X-Received: by 2002:a05:600c:1554:b0:431:44fe:fd9a with SMTP id 5b1f17b1804b1-432da789d2emr2500345e9.19.1731546880972;
        Wed, 13 Nov 2024 17:14:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731546880; cv=none;
        d=google.com; s=arc-20240605;
        b=GD86jKrUzSKhKAEc4i8OyHd3FXOrz1K6NbxAKGrVzeQa/adsqR9h7YKYbrqZV1RTCO
         jn6H+BK9ne3ldL7nxzzAXPODuD9CW1qU5sS2ElKDJJq8Rjj+5bkrsOLF9sYkridEV+lM
         mpWLooKKlJWa6UD6A+Y4NJ/p1IfS8KsAOl4n2DSs2dVq/wRmbHTeygTrqtazqX8o0/am
         dKVQKCzYKIiLt072J3BU0fM9Gq6xKzboomTrGgT9MHhhy7XRzIZnwXqoeh6Mctv5HCsW
         oiEEWUAoPTNm07ZaQBb9GT2q5ElnW2prRcMDp1W2iZO24wiXzM68ITxNIKmKERhdjD2X
         0qlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Yi8oP/SEa8RdfPU0nVwuwaNWFqTgpMIdFqeiug4H/W4=;
        fh=bkaLuxWly4/5+ixEfT7DH9QO7hbiuG62QoIbFxJt99o=;
        b=GG5gn+RvRJswPmzWlck/m/ioWnawJt7+osf4kV/2t+bf2X3YkOcLdxH/SuApyrqfe3
         gVv93JUED5U4iUC3Gt9loDmpVC3wz1Qc0Cg64wq2s8ADowixNkv/PW5W9SROERRtwY5j
         041zGfCjy2y+KS02Q7mJ36+e6ZQgb1sAqNH871suidKz4UmA6rVt5lk+ld/yoJM36WnT
         oj62zYm8I+WRmDrbLch5Bu2DWXHnf/01ZY3nRXcJ0Y8+adnYgPS6XBzcFBYQW9n/dPsG
         CRPT1uwOQAFvki5OERWx0tPfcKFua24ds9HnXOMhkRzXBQrbdNCRMenK2tag9OLx/5b/
         mscA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KGd/UFv+";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-432b0ba9fd5sor61945085e9.10.2024.11.13.17.14.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 17:14:40 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KGd/UFv+";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731546880; x=1732151680; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yi8oP/SEa8RdfPU0nVwuwaNWFqTgpMIdFqeiug4H/W4=;
        b=KGd/UFv+XTss3MMnud51WOmzsERwpjnNg4oWpEuaaMtiDDeL5pw6fsPY7ymLE+f/mN
         iNX9Xl7sSt/fFrvXOlPLx+MIbJMhMSvaoCRiUfzCI4/AjrnEP41V+sdowvBwiwRrkPts
         yLDi/HWfu3ZbTQNjwJgyzJbuyWPabCa5VZPssfBwQQFyTAOqkccv6n9eIPT888nLDBOV
         jGMCB+oOAZlPN1BTU5Dqm4Y948vr24Np5jkt/t62vQPj/fpyHdG+OjBubGbmN+/eBO+n
         sD9ILnTY6IH6mGmzySBfevCGDkS6vuBucIsJ7wb01xhDwoj71Bi5vCeRuH9M93lkBBS7
         XNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731546880; x=1732151680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yi8oP/SEa8RdfPU0nVwuwaNWFqTgpMIdFqeiug4H/W4=;
        b=eeZ4fSvs4hd7WaCQUr48pTUuCoXZ84GgMAYMy+VHq9ISBBYcN/z0bQvuwhk+Ok2yL7
         6zMDe4yEH5WpocHyn8hV0tDRcnZiB4wDgPZ4oPbEC2lVrSJ+yZhjuihCSRp+wC2Hoyzo
         1iSaTNm2fSG2NdZyU+8j1m/ZOZyS/gG8VK6+Vs3rwhAh5jERbYltEobJ6sawqZXHOSnU
         fmvKGdrO0Df84BVNekofFbzzapaFqcQW1CQh9rG97pGUbREBF7IQXZbx1SUrASlDvDHc
         +8n9BuqcR9KsiJqxF2mxUfO+2hClD9yDgX0SvL03a7ojV5zb4UJbjofQRC2UOWNteovp
         JWIA==
X-Forwarded-Encrypted: i=1; AJvYcCWUfL+R4tnx8a6Ws1gbJDO4qnOKFCHE9UV74xR3Fare4wuV+71EWL2DIm/ooZwQfDJsQ0Qagx8OSmCMuw==@linaro.org
X-Gm-Message-State: AOJu0Yzjbb6eX7gO/xzvkX2nioKylAvqtsvyiotH2XVELoGmTlBl8sdn
	XNncjGOIZxY1reMbNEm/rYsN2GyrdmicArafzh8hl1DDgsumlh+3yDCX2nIWnaqUKg==
X-Google-Smtp-Source: AGHT+IHshN65SEUSiXRSla/0TLQwOrSSZwJsNVoNHIKZKVGyfpL2AdokvGedv4UPA15Nq3l2/qFYYA==
X-Received: by 2002:a05:600c:384e:b0:431:3a6d:b84a with SMTP id 5b1f17b1804b1-432da767a27mr2552595e9.4.1731546880412;
        Wed, 13 Nov 2024 17:14:40 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.209.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da265ca8sm4806795e9.14.2024.11.13.17.14.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 13 Nov 2024 17:14:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 10/24] target/arm/cpu: Restrict cpu_untagged_addr() to user emulation
Date: Thu, 14 Nov 2024 02:12:55 +0100
Message-ID: <20241114011310.3615-11-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114011310.3615-1-philmd@linaro.org>
References: <20241114011310.3615-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FA9U4mYj+OGK

Move the #endif guard where it belongs to restrict
the cpu_untagged_addr() implementation to user
emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d86e641280..12b8466542 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3355,8 +3355,8 @@ extern const uint64_t pred_esz_masks[5];
 #define TAG_GRANULE      (1 << LOG2_TAG_GRANULE)
 
 #ifdef CONFIG_USER_ONLY
+
 #define TARGET_PAGE_DATA_SIZE (TARGET_PAGE_SIZE >> (LOG2_TAG_GRANULE + 1))
-#endif
 
 #ifdef TARGET_TAGGED_ADDRESSES
 /**
@@ -3382,6 +3382,7 @@ static inline target_ulong cpu_untagged_addr(CPUState *cs, target_ulong x)
     }
     return x;
 }
-#endif
+#endif /* TARGET_TAGGED_ADDRESSES */
+#endif /* CONFIG_USER_ONLY */
 
 #endif
-- 
2.45.2
