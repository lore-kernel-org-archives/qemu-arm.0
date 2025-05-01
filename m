Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19726njj;
        Wed, 30 Apr 2025 23:24:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVzm+4ZzicT8hv+7UDduw08EBbspIlwiF95bIdRJ3I+xAfa9v1Oq+uqOFeNtysGAUl8EbcEj2PyEhQIDA==@linaro.org
X-Received: by 2002:a05:6a00:22c9:b0:736:51ab:7ae1 with SMTP id d2e1a72fcca58-74049239c7cmr2037870b3a.16.1746080661184;
        Wed, 30 Apr 2025 23:24:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080661; cv=none;
        d=google.com; s=arc-20240605;
        b=VcduhxXtWniO+x8fIGrxmWOc/yKHwVOm+5rxW8uxThBpee6ZtvJFwcO5EphmhPRa2c
         TABswKdhZIxG0qwcZO9+Px+5lP30LGpwEKI+8BvWRuc7bVNRuA2K9faeQJ6LhUSf9+Kc
         ooDksBdR6YLhCw0mFRGIhMucJzuWtt2egqDSLoq+j0xh7CtZU/ZgjcRTXDujNz5n7LoM
         Z/QK9aKE+b+LJv6CuvBNDr09x8+g99i/rsqsEFHXigB4rUh17xgib1RDEfWBlcikinOa
         6xtxVaggI/fgRU2YNmAxXVqUk47p+gNY1Z+LoqVTHBfPaDBPmda4rxCUqLOvPExvvcTj
         1lXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gBI5uPHzYMY6eh2c7dgtwBog8gNzmSQclyZLzeP9xXw=;
        fh=CoffsEFn/bhawBs70toDn8ss0/5bAk+/FHB1bSK1YM4=;
        b=RnR4DXg1HhTPTdlWZhq9ftNbUvfCg2RhS6ts4UfThomRzdTYucD7BLe6F7zqrr0rOC
         fLRJM/uP5713U32nEUlBGJmACzlPZKqAvlqlvcPo9KXdx7Xnw4OlbYSPqP1zI1yV9b72
         8aDNaBcGuYQ3NVXQXv0a/jFwf0DCFikzpUY6wwCKlMIJ3ZphyC0S2Xox7vlWV0ePNYTp
         G5pOuhj9kis28tc1V0FidaOJLJrzEMKejzT2vJyM8vt9lSu1o02+d/6jBzDUg+/bCJFV
         I26WNEYwVUV7RbVw7+QzI7JdY3XyHOmF1ycChKbjcDJWlzu+/j7ABgDyPRwAOHo7pi3f
         jmUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mgjrrw1l;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f9e870csor60116b3a.7.2025.04.30.23.24.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:24:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mgjrrw1l;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080661; x=1746685461; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBI5uPHzYMY6eh2c7dgtwBog8gNzmSQclyZLzeP9xXw=;
        b=Mgjrrw1lzX0x+4DIBNGqFcdX2i6u2b9hehhvjgP2fRxnYwGkERzfpkbHjCQgZPGNHI
         9TzhN48SA4eW7Ed7bn4K3stZoj+1jIV+6lw8FfR8Fl8nmxH38RpjzJV790o9HVHIzGym
         jM6UYEtAuxpcZDiHRQtX++HMMO/aEAwo3i6+VVvkmB2Cy3BrmQqNpmp8myDaO0sVho1P
         QMF7To9qAiKKa9dBIbRVRwnvEzc9FdOBC8R11tDqha2UdJ5K0XSm4Io2HWxVSe5m+AeP
         EnRSAiWkbQcOWHpifB4deX/71sc3yKnK/7cJHHIgE5cWbGxJKa/GuxJZ1EkDnb9QNhbh
         IBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080661; x=1746685461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBI5uPHzYMY6eh2c7dgtwBog8gNzmSQclyZLzeP9xXw=;
        b=dmsyJG4pypB2Lcprf0B/my+uB7+P704ab7Sp3sv+9FDaLUBQM70+MaK9z4SvRq9JK/
         6Tcttpi+zlYuQmcn2nwS0oslOLWaZhEfHYs2avEPIMJsKEF/u/i7I+LpAkom0X/uobMZ
         JC9IM3pgfI8awFcNkSARaUhZu5QoGd5Bdq8J8nY9XV6sSEFK+lnr2UeOANV0JrcP8euG
         tGv0KFZsCmIpD0lFQlNnQESg2XUtODzC1iriXL6WqQXot8YmexDo32ucoRVXgp+jNIu9
         7B4Pk5EJvMokH8hydnI99OICCtb7iKU6lQMY/7vsKAid+1FaUGdQcKnbud+SEuUnJhqR
         h12A==
X-Forwarded-Encrypted: i=1; AJvYcCUwvMVoH4iMe2FIK5n6j715uTnNJQOxQ/CK1tuMpLVFlaIVI7ciImNOkG7QRERV9wdZ2GH8KklNijY2+w==@linaro.org
X-Gm-Message-State: AOJu0Yy2Oe7dJ2R3yaj5FObxHZsE0ZqnkJ+rM1xpMp1RdG6T7kgcN17f
	5ehgmT+e6SeOT3cmjW8TOJux7FevHrHZgv/iYk98agsNAmxIMkZIrGciUQCNoE/ZUg==
X-Gm-Gg: ASbGnctbIXz0WTWbUqVUK5TZz0t26vnm/w/CBEC7YI9cG9IumiCRS/zo7nKeX5Iep0i
	E1+oPLBAxcAC5D5TjFo2yylsTNc0eUooMKUtMehpMo8dFY8yRbWK0oOg0G+8uH3R/JOFUmAWRe7
	cD1S2CXCMZDo/xEXYG7VgfgdVao4/CrtTh7urFvb7FsSBUNK1lSzQPTdg8sLoCygH9SGVTJ9iaW
	WYmKrfG4Xb7wSXfOuuyB0PN9A8hIKBtmalmU4tV7f8MOazZzsSNOv4iJImkCSKaJf3aNX4bR2Wn
	BJVvnbQj++E8GktxwQGA2wxkq1r6z+ecA45pwgVG
X-Google-Smtp-Source: AGHT+IET5AJXzcKAYJBSnisETMHpG9TeThJDNZVtwu2V5zDEzGbE3MiHWS/rW9B33TSjVTYXS9+vxQ==
X-Received: by 2002:a05:6a00:2286:b0:736:a6e0:e66d with SMTP id d2e1a72fcca58-740491af0femr1922678b3a.6.1746080660829;
        Wed, 30 Apr 2025 23:24:20 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:24:20 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 33/33] target/arm/kvm-stub: compile file once (system)
Date: Wed, 30 Apr 2025 23:23:44 -0700
Message-ID: <20250501062344.2526061-34-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: gCKBr5hoU98c

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 29a36fb3c5e..bb1c09676d5 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -15,7 +15,7 @@ arm_system_ss.add(files(
   'arm-qmp-cmds.c',
   'machine.c',
 ))
-arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'), if_false: files('kvm-stub.c'))
+arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'))
 arm_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
 
 arm_user_ss = ss.source_set()
@@ -32,6 +32,7 @@ arm_user_ss.add(files(
 arm_common_system_ss.add(files('cpu.c'), capstone)
 arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
+arm_common_system_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
 arm_common_system_ss.add(files(
   'arch_dump.c',
   'arm-powerctl.c',
-- 
2.47.2
