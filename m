Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp5086928njd;
        Fri, 4 Apr 2025 15:35:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUXljb+mgynJopK2o1hQsdZPoAdABdk2GuPp3f1cp9t4yepOiO1ZNq8Cj+FGxr7Os5lrnG86deBBFJwxw==@linaro.org
X-Received: by 2002:a05:600c:a0a:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-43ecf8d0a37mr36071005e9.19.1743806149442;
        Fri, 04 Apr 2025 15:35:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743806149; cv=none;
        d=google.com; s=arc-20240605;
        b=isVIvTczMKZ/4ot884Py/b7Wr03C5s4fWLURWlFpLLe/Cs7HRepQpqQM9jat/ncInn
         B7cyZlIUgoUpb+4ymIDo4ENjqxRBXZI9XuwVJxGK9W4LWIyqLGGe9itUbtts0aUdowE9
         GoTM8wikJfJD+TdOodxpen26j2DIV0tWEdt7h+c/N0jjK9TZpvEFp8ZNz24QNZJ+V7zQ
         nEdBkr4bwVLI1tNGO4RMdR97CJdDH64ixeOJHVNp9isi7d1kSBGitIxVdF7KrcFSQnFT
         K4soKgigC/aqWuYSC0CJd8uhev57OLKYLQfD7P23JHgyazooXPb9sVR8xS/eqw7YQ1HH
         AgKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=aIKjbL/Q/KXdvXQSiletYLg6oVeSYWM09NCAwSNeYqY=;
        fh=ghmBmDv2xu5fw3F2m+3r60QgVr2iFlgtjU1dB0r3Ep0=;
        b=EqHPwVq8ILPkDUoB+lmy9f6QGsPjM3YxQp1CLCziD+IP+VWiFb7n3lj0ql26ctVhVq
         9IvYKhDX+UooYniC0ja0516ZTABvfePqrT4Bqyy0qxSB1PclCfi6+9KEyz1HmfAqa6pV
         8Y6PtsC+UrhJNcgBtIOIo4nP1hT5SXoRp1aQqB4z3Ky4CO8Gnm260R5tJyR+Mn+N9TNT
         RGw2sB9Vn8mWVI1a6+W86CHMJpVtKYvl4P8jTLQJCGTJpdUgyimn3h+KHO7yaDqsZ0+X
         /3s2HmVDWIiQ6c28P9fBfET9z2r7eUvdC1js+cHdRpER/DjZtoWIVDt0tvAPz/icWUb8
         7EJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O2I8yxx+;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43ec2179915sor20183715e9.1.2025.04.04.15.35.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Apr 2025 15:35:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O2I8yxx+;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743806149; x=1744410949; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIKjbL/Q/KXdvXQSiletYLg6oVeSYWM09NCAwSNeYqY=;
        b=O2I8yxx+ZqJfLSsOSQKpyGimJWgQJUGB4N7lsb1CLMqdOyXmgGe4s3sZg7+CIte38E
         tI7Uzctfhakw6zZ8N/I5x0cRkf6muJgZa7/iZbnNHSNnIPV5AOF+SB+HlxiYforblbi2
         tg5648+FqbiokngMGK2qxio0RLkdd6FArURez/9iUUJtER/Y0/+sUi1INxELWmKCDD33
         Xc5ABOtH3aJGuiB6rWwwqxx7M5a5uxS5xNy2S72PT3qr7YGIrvCf3xMNAaR1hddpn6TS
         CHjLb8oEujXraBx8ji+umWe/zh4UJu0wlhzLkpByKXV4fDLbjAbaO22cRTl2bG4wgEB9
         t/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743806149; x=1744410949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aIKjbL/Q/KXdvXQSiletYLg6oVeSYWM09NCAwSNeYqY=;
        b=sBp8blWkZLnttb2gncEhjoHvMrQVs2QsoEfDjqn5lHIEsyX9JP7zGc38+R6ciivdGT
         m7frrrCvbvuzbii4J2FdAmGQRHCcxLO5X0BaiEGZ0rLppPDybd8NmVweli7KkmkjTjOS
         MQjt801Gdn0yavRCF9pfjYThbgVn6lLohVVkygnmHdgVdQTgXJ0HGiHVwvyP5CG+v+g+
         Y4AUCYmictK3ihPZKjrkDkuprQSGkMaK/ellmdbJcAo3oTmD41G/De0Xc0sPkaY7+zkO
         +7nflCaeHrQTlHbcSUvbQl2x+eqL4A5g+viy5wcmQeOnsrkqoVC+Sh8T00v1fAmqHr65
         Fpww==
X-Forwarded-Encrypted: i=1; AJvYcCUzmfXomYBvKqmiZUBTpN8GHxhVD/aaTYLQRBZy1ZfdlQWdIPtV+iD+19qP2s+eo/gEnbQEPj+RLNF6Uw==@linaro.org
X-Gm-Message-State: AOJu0Yx6geEZP04WgZYR3ikKoUZxBkQ1wRbNFNYQ9e0LwiWvVSQS+oHN
	p77n4Njqv5RPIWLM+aTDqtWO2extWE07oAfmivP1lHwRqVqCKcHpm8tbCcbwR7x3YA==
X-Gm-Gg: ASbGnctaklWUVsK8q/yYNqHEbICKzUlluKqYhWJ6VYc3SiE8NFFzV+5PAYgMGYgM7bJ
	YcmfR4wuDaps/LOFTtMvAizt55kGz/7vByXXUmm3PHBvg3AP+O6dQzl3PPDpj6kRHAHwZp+yYAX
	107A2Y4h46E9cI/CxdzedDlGn5JuS53fbdE2bG1g/nfnVfZaJPMb52EJYZmhQdak6zyyspTU/Bf
	MUy5Jl6QWRadFbmgpLo96RJsPxXK0526E9w/bAwfzLObB1Iy3FfTvMkIGg8DZ5tf0WRWdQKlOHq
	oA4O1iGSQpXkQQbw4wi9I/F8Cac6nVbZ1Aj7wtAME6L9eVcWrnMk5CCmT1ORfygZ9XnO4t74Z9t
	45IB90L71u5wJY+Ezq+uV0rHMd567XklT29c=
X-Google-Smtp-Source: AGHT+IFPlJvU8WnmjqubHKWN7Lh+e2t99UD8VqTnax85RvFEZd3MI9E02BmGLnIEMArSsoBlpJqxlg==
X-Received: by 2002:a05:600c:6c11:b0:43d:10c:2f60 with SMTP id 5b1f17b1804b1-43edd3bd68bmr12589795e9.24.1743806148873;
        Fri, 04 Apr 2025 15:35:48 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec3429f67sm58989755e9.7.2025.04.04.15.35.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Apr 2025 15:35:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 5/9] target/arm/mte: Reduce address_with_allocation_tag() scope
Date: Sat,  5 Apr 2025 00:35:17 +0200
Message-ID: <20250404223521.38781-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250404223521.38781-1-philmd@linaro.org>
References: <20250404223521.38781-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ww6gu7FTSQWV

address_with_allocation_tag() is only used in mte_helper.c,
move it there.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/internals.h      | 5 -----
 target/arm/tcg/mte_helper.c | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 01408e40a34..0728e5c5348 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1701,11 +1701,6 @@ static inline int allocation_tag_from_addr(uint64_t ptr)
     return extract64(ptr, 56, 4);
 }
 
-static inline uint64_t address_with_allocation_tag(uint64_t ptr, int rtag)
-{
-    return deposit64(ptr, 56, 4, rtag);
-}
-
 /* Return true if tbi bits mean that the access is checked.  */
 static inline bool tbi_check(uint32_t desc, int bit55)
 {
diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index 9dcdc1d91c1..8a6e6e4719d 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -205,6 +205,11 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
                                     ptr_size, tag_access, false, ra);
 }
 
+static inline uint64_t address_with_allocation_tag(uint64_t ptr, int rtag)
+{
+    return deposit64(ptr, 56, 4, rtag);
+}
+
 uint64_t HELPER(irg)(CPUARMState *env, uint64_t rn, uint64_t rm)
 {
     uint16_t exclude = extract32(rm | env->cp15.gcr_el1, 0, 16);
-- 
2.47.1
