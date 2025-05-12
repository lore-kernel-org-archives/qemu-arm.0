Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42844njb;
        Mon, 12 May 2025 11:05:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUTYV6jU0+3M8MAPBGeL1mOWHLe8wHDaIfUwBwC/gvauENGMJfacACfhvUJlJpLk146OJTpeLcFY/44zA==@linaro.org
X-Received: by 2002:a17:902:e94d:b0:22e:6d46:a5d7 with SMTP id d9443c01a7336-22fc91862ffmr234318665ad.35.1747073135483;
        Mon, 12 May 2025 11:05:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073135; cv=none;
        d=google.com; s=arc-20240605;
        b=J6ICRinqfufRtQcwlomNygtQ747+E/6sbpwNIfy+IuKi9qRSx23cQPbdevz9SIZ2qw
         2ECWER7pkjWgbgOQaTcBqZgJy3oqUgAXL/qdaZesg2q8+2UddWEv4oGcBPSco04RvWp1
         t26j2Fuiol8wJvH9zC0gLnt3STvLVraebtv4fDBIJgxh8wdU5tbfoKiRCWAaTVRXHleV
         brhjGtO9QdotqL9JGaLu67RlGFP4XvX9lC+tQUQu2dnaqo5nrjkTTCKxu/meXQpfavuW
         CyVb8z9MjKHgqwLbigmPv/jj9RU6OWulQUBq2Npx+NsUSsgvO0vBNG717M8WWcCxyMN9
         XNlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=j3Dpv/gYklKxQ6NcaNjklM8os0pkN4N34WBJsdRDY08=;
        fh=286uxMoiyl9KZZoCUSJm7+QpqMqeKbcsL6RWEpQLqS4=;
        b=js8VgAEORNyeG+gT0d9LBFiVQcaFaq6eNmIS00gzBCTGCAoskYVxtZUXgcvVe14BmY
         F6dY41P3ikweIrOQ/oHxQayeB707wRBNgjlJGj3cXhakso+NmQYU3yRC2+lRoxu2uCCe
         U4T5OPDEEiIKzvO0cm7HHGQfoEeyFLnwTdzal0NYKuILrDINTEk8bF7O0yCXhoVmDbqu
         Pkt4FKjjOsHmS2ZQqpcpp+1GC29/py+LA2gWtzXAF5Xh6BJV76DjW2ssIkZD3ZdjqSb4
         bXyFGCZJYB5mM1QxngPuk9BsD1e1D4jBch4vDInRSUZT413ZJE3xBkhHPxupnI4/phWo
         0Y8Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rtfof8bd;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc5824a39sor40572805ad.3.2025.05.12.11.05.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rtfof8bd;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073135; x=1747677935; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3Dpv/gYklKxQ6NcaNjklM8os0pkN4N34WBJsdRDY08=;
        b=Rtfof8bdzssJ3FNIL5eilBuAzodsyx9OFOhaZu+fDOxEYA6zOCYGZPTtCnxJswCGLj
         sRYDMdH/zSVbuiZ7P/rdlQQnoRHYYCnpOFhwhyRlgaiySkfdqDM5tCexwI13+wqWOheX
         DZLW+iSbSPVGKThW0C0+cqJdWkM3kNHXYp2rYcKlC6ugN7C2Btp0KoxVBYRH9tKccbx7
         86ZQDk8B08OCee7LJK0BvikooInmLrgNMB8MkqQaQ5QvYEd/nEO/nU3KEvl+EIWyLg71
         vGoD5Bcy/UJqm5qm8xjOy7D0MmBXRbmTKye7MY6Ah65+N3vhXjsSLVsihvvXjk8mSCwi
         uOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073135; x=1747677935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3Dpv/gYklKxQ6NcaNjklM8os0pkN4N34WBJsdRDY08=;
        b=HwornfRknQM/KkEydbUjWsuRs616fwn2NaikVsSUT+bj5NaWGMpdd9WHHd+SuCOGr1
         zygEIOQwSscaz6/JJf17QUmtaFzuJNMkrjLQHHIEbq0SURlFUSugR5nBMhmgImVhpgc9
         WOoKcWjWtjoktTG+AfIWA+PPPY4lp/mfvrbJ+Y6Y3djvJOZOhL+j5fS+6KCD+VRWzvgA
         muRfreoOjEX73VzIw34gYRQxI1552LTnhRXEJOEOzMvLK2VMrA5YwB2ipfXTKf9prmqO
         W0Eu/7XLcj8gcmBHRKll6lxZRF0p1wxCOYIeOGtTZZ1fhFHWCz739cS7pi1IeHh2YZYP
         VyeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNCUzb12XwrC4eeTU2LHcpFuGtT3rT+6s2QbLw8H0D4vGB9IS4CuGMomaL2ElRu5/HcXNg/XoFLB3b1A==@linaro.org
X-Gm-Message-State: AOJu0YwhQaZ1iCFL9MfNQ7LyJstpj9KnmctZhEMMZRux51j8ni0rxqN9
	RTHySUWVpFtmVyE+sQCT4/NzFrvizwfFzMHB7nmtE2lsizPjN8yBcyZ5Iy3kenXkkw==
X-Gm-Gg: ASbGnctYNSgdObyJ2nXKUPALNmcVzLzvXA1XmuR7iDmJiCKxpZaMuhVwJd0qWf1ur3A
	sQ4TUczDzJwul6maxdBkLRzr/IBG7SIpQceh/73rCIrTbDsOmV6rvSBNaIDrdm9b24UhQgS52Cj
	7FElI76BV6gCm5R6WEnF9OSDIihDKQe6rlgg5CievXQ/6qHW4QzHaWwE/z00xu+DbDcW9zZeGVH
	BGfKeci9hPrbv4//LNXGpK7lv717HSlG/WLmwWmmd7l+QS35x68Veg2pRacAa7cyJZkPSyGdIsl
	KaayTMr0nopn/CS4L4iRZlXByfp8aSY+CuakA5y/xVHsQZJbfVk=
X-Google-Smtp-Source: AGHT+IFWkB6Mkaeg18gGVG6rVCrQjmce5SbsAO0IjrI+eadfe3VGrlqawH9YWYf9Z1SF5DVoMnYAtQ==
X-Received: by 2002:a17:902:ecc2:b0:223:4537:65b1 with SMTP id d9443c01a7336-22fc9185f13mr185461285ad.36.1747073135057;
        Mon, 12 May 2025 11:05:35 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:34 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	anjo@rev.ng,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v8 26/48] target/arm/arch_dump: compile file once (system)
Date: Mon, 12 May 2025 11:04:40 -0700
Message-ID: <20250512180502.2395029-27-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: fFg9lZzu7+wb

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 06d479570e2..95a2b077dd6 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -15,7 +15,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
 arm_system_ss = ss.source_set()
 arm_common_system_ss = ss.source_set()
 arm_system_ss.add(files(
-  'arch_dump.c',
   'arm-powerctl.c',
   'arm-qmp-cmds.c',
   'cortex-regs.c',
@@ -38,6 +37,7 @@ arm_common_system_ss.add(files('cpu.c'), capstone)
 arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
 arm_common_system_ss.add(files(
+  'arch_dump.c',
   'debug_helper.c',
   'helper.c',
   'vfp_fpscr.c',
-- 
2.47.2
