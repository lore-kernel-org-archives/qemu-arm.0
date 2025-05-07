Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94444njb;
        Wed, 7 May 2025 16:43:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0GUhb/UYjWeW0puClj1rVTjmtks3GtPkGPsqt9YphqWMwnb4q6m7H+URZ8kmeUIOCWaHRZ7epIzRDDg==@linaro.org
X-Received: by 2002:a17:903:1c8:b0:225:abd2:5e5a with SMTP id d9443c01a7336-22e846e04d9mr18393625ad.4.1746661391354;
        Wed, 07 May 2025 16:43:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661391; cv=none;
        d=google.com; s=arc-20240605;
        b=PWB5n6f5rHRjaj6OWoIJISn60RU1chtkwMnUtOh1UmcGNvU7qvPmHF1BnCcbajrKKz
         pQcZydIOt3z4CdE2e7kanwtx3DpgRpsDNaINVjyKbWGbYiJUtPxYTlCRpoFTcsxY89Vf
         yJ8kSh7hTFT8i5CBDehKqQ2T1kiFKndD7zkuvo0wWABEUfDJYK4eHTW/1p3i7aGnLzGj
         P70Fv4dagpOpZ2JIW9eaqcbN2w6bvRKuOLvLDkdnqKOX7LyyfHx1vYK5yifEmdoxKQEU
         8glp/M88QQBfXgX75Vv0Jv6C80PveDwFJVwvCCN/wnHEylVWfjrsx5Nig1QlB371FqNW
         IkjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=E27VnLHwdjjgu7+qzkSpdD6sP1u8J5fzfB0GITxze0s=;
        fh=zk1QIgjLL0C2NRnbnT1bn5gZAWiukRvJf2Oq15lzAvo=;
        b=AkwLJhD2f4ej0epwUmwg8Y188TfAJY63wyb1Ki+q0IZ+IynNh0/yw9Fz/0KU2w9sRa
         EFm+oQmztEUD/7Np0xoJIaUwH1tHhtWNBq7LWQ/re47Wd7W7wnzkToj2tKd+KgHy8gLX
         aNQ8baCZfgXHp2/NM7K3qD30A2jzJ0nW8dpcq7AEeN4xnQcJpySaLQdZGMkP+aFfuTHM
         JHtXFmcR20USYSzKVcvQ7Y7xzV/SpjgP3/SPyrPGZBxoCMTrpBIv2dbKmHnijcbp00QZ
         BD7oYpYjXglbSY6FNaJ/Ti92adRU3VfA0AptVDyogaGmZrfTM12IdEEjgwATfdgT/Vaw
         LwvA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d5TDQlEI;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e7f1f633fsor5952075ad.1.2025.05.07.16.43.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:43:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d5TDQlEI;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661391; x=1747266191; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E27VnLHwdjjgu7+qzkSpdD6sP1u8J5fzfB0GITxze0s=;
        b=d5TDQlEIMnzOSIvmWbQuAXa1445TPlZ8Pqk1bYkKIGPpXvQnsirh8yZ7wdR3s2XwuW
         IqGr489HKkJ2b2UlFK+MMiq8SF7zYiXMFMVy1mRnd9x6bHrahW9q6P6iU6skPvApW2Ir
         pHf9kGz8fiLBj2k+4lrAUhwFhgNRnOee/L/7110MNyPuDgSQdxfYN8SGnQOVtM/zWVDv
         cwwubkzl7/S7ZNp1hCF4FH00akHUA7uEu2m74m5E+OrzWzdN5ygqHs7PV3/vMfpALEkE
         /GY8AXxBj+F0azZlWUJRmgkA9FP6CUdtHwYFezZdl9wwyfrfUI7ZjXIDiw1utWroiI4k
         0OIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661391; x=1747266191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E27VnLHwdjjgu7+qzkSpdD6sP1u8J5fzfB0GITxze0s=;
        b=Z80t1XejhfhuotQY4CUlhBZ3prtZGzPXDp+A5l/FzQzoJb3kh+2sXxZv07WYQDZo/s
         iPSrqk4gNZtPKETQXzEnuOobQYxv3ZvaKRsfvwjWms7ANuW9YJEe3+Dq7Bfpob4uZHm8
         f7DptbP8S2EbIlztzYOePfNJg1EhdLpTpDep/KA1t47fcO4yAe/Tma4XGEu+/goW4C2/
         7aapfotNJH1GgCBjbITD3fWWbhdGrRFLWvoivMiT+vPvaDjn8GZpFzXbOrcbRMGn9+gj
         X0aF+kPoqKcIdoSGvXnRw+qvx3UGnW8BPe0Ru590Qs4KzhCX4mvTE4y4sSVzPiO+PgoL
         eaUA==
X-Forwarded-Encrypted: i=1; AJvYcCWEG+C2kmNjKJtdG/bY/FwaYPW2B5Tscwshcoqvi3+kcqw00iI4MfChamHoKZcJkUq9xpcfiaapDHsdMg==@linaro.org
X-Gm-Message-State: AOJu0YzougfMi8ZnmxQFno+f8M4+/qog1debHgw9LBW+o6tBLUKYZb8I
	JVMc7rD62Y0q2bq+v5DVXFLydJM3l3I8weFlECSP90v319Jz3k8YXs5QKUzXcR2wBg==
X-Gm-Gg: ASbGncs8j8PCUGJHairlRSIkcVacu60cEB3q4ZEb96xMkTohgnfGPG0HOTJ3ryvHZfg
	05oGcg5BAONPEt83HMPo8LNsXsqpnPMeqHWZ5v+mLE4YzvuswNulMUjTIJtnnYoS95LIJqHuR2p
	UsOH78B6mE8byHAxmv40ntjXW/VpU+djfi+LhQn7RpDOBgpjjxgEgV/+uVStYkZoHm4Uca2+wup
	IjeqqWYbD1x8nXAV5jd1YDRIVs7JRKsFqLuLqe14AQL4FRcWHCtDNLuDLvPpZHOMxZ6aKcnxlcJ
	rwqxkblISekmy0eRahboE7RT5Dy7Lq8v7o+bxzEx
X-Google-Smtp-Source: AGHT+IGctSV+DtKGe121ux6Zk+dI1dkMdB7jLPCmVMZdvVH6IdFd/gND7HK0CrSpxI3zMYELxI5nOw==
X-Received: by 2002:a17:903:8c4:b0:221:751f:cfbe with SMTP id d9443c01a7336-22e84751aa3mr23792315ad.19.1746661390879;
        Wed, 07 May 2025 16:43:10 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:43:10 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 32/49] target/arm/ptw: compile file once (system)
Date: Wed,  7 May 2025 16:42:23 -0700
Message-ID: <20250507234241.957746-33-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: RtFSoRXqc2nA

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 6e0327b6f5b..151184da71c 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -17,7 +17,6 @@ arm_common_system_ss = ss.source_set()
 arm_system_ss.add(files(
   'arm-qmp-cmds.c',
   'machine.c',
-  'ptw.c',
 ))
 
 arm_user_ss = ss.source_set()
@@ -40,6 +39,7 @@ arm_common_system_ss.add(files(
   'cortex-regs.c',
   'debug_helper.c',
   'helper.c',
+  'ptw.c',
   'vfp_fpscr.c',
 ))
 
-- 
2.47.2
