Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp26657njc;
        Wed, 13 Nov 2024 17:15:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX62z0C2BH2oXUDHX9M1loa9a8j3sFv63CzZ6WXui1UfesDD0Uk0VBGgUTsYLzIxfb0zKyRnrTDWs7lMA==@linaro.org
X-Received: by 2002:a05:6000:4289:b0:37d:373c:ed24 with SMTP id ffacd0b85a97d-382184fedc2mr207466f8f.4.1731546932200;
        Wed, 13 Nov 2024 17:15:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731546932; cv=none;
        d=google.com; s=arc-20240605;
        b=dRR8UYqgSu1uN8d7ZlLXqmUmoMZq0GNRaMEMTSAoVexF8BPLgVXe87q20kpcCm2MDA
         JPo7MD8esH/+DM4INA3I/GE6OQb55Bo2Go+5NEm4WWjLbknTg3JCs1eX1f7CztvJHPQz
         Z+N7uyTUlTEKl6sxM0KSg46a71dIHayBn7Cm61qcQc3OQLZInlHb6D8nmjMDzcccms1O
         7Arz9QTGGOJcq+Kml1N33cdXcaH8h+KL9kMVu6NIV0RPDu6bHQJw/L2iL90BVsuhopUJ
         jJwt+avrTfrt1OccfEij9dIrdgv2me/r1+Xckg7fIvR8IDfQldQL4Oomp7RR945LSBaB
         XSXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qrrkoTna7tufOe6qwJFGaLdax+anmf+pXIEo/rEb9w0=;
        fh=4cOpWN8kAYvL3uyRyJz70+9hJs0koyfBVDntPi2xy0M=;
        b=Jn4Xvb2olFUYCKoIYKjsmO/4lNh7TytFX0F0O5ZPuUXPO0lvER9K2OpHWVrpGLmWLN
         /5+puodXeFTZQDlfwqR1HhJK+oMKRNupSHn54iXxsL8iHgFN1+b1Gy1fI1BT8FpzF17m
         HwV418gxtvhyC/cQsOAORZ2h6MSdySbOHCVGfIuKQ5ptzCZ2D1vPmGENV1rXe0WZt3xT
         5El46xvwg1DNxsDVXk1evj/ARF+7PwBrGvg+yikiaPc2CaIvYkvmXabfvMybe7s9NePh
         fMXBqjCJPiWVGllZc6L6/wukGgxo6avuXkGPJIqd0OeLfiqg09FPlLpBfpYlleogQ+Ei
         7x7g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zb2zMDym;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-381eda141d5sor5506137f8f.10.2024.11.13.17.15.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 17:15:32 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zb2zMDym;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731546932; x=1732151732; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrrkoTna7tufOe6qwJFGaLdax+anmf+pXIEo/rEb9w0=;
        b=Zb2zMDymY/mFAJSI3qwtvYoi3gR+bbgl0P0CNRp571GoRxmodxI/t0+uTvHkbiZDN+
         mGr3azuRp58mPb358RIjYx2PBlIdMoNpHLeui8NXq8/0NsxHzClbOzHGDBsiUnS2fCrX
         jXEi3JHu7dVp801nixkdxFqVdjb1adaZLh4xVw1HxhrY0nSj9lWs50VjAJo3Yf6n3xB4
         RhLOzN0Xic4m4lEUXw1PKlf+Sx/Fto7L9fum48uCFfEnQ+HZR7v6NoyGR+Yl89AVuYs7
         qIoavPTop0wIUjbgIM7NgUWIoByXE1tU/jZHClh2+YPFTb7SjumxH6AG6QQ53W8jnb0y
         ajgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731546932; x=1732151732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qrrkoTna7tufOe6qwJFGaLdax+anmf+pXIEo/rEb9w0=;
        b=HsrJYDDH1EzgdSpnDbLmo74kusitOsaeCL+C2M8rlL+QqCkymt7zgLNUUuYhNuEsGe
         r2a4ZAKQ0pWvJaI9zPkuAz8yZ0XHd01z9vz/o8CA6T99BzRF4kp4XMJmmj8DXdntfRqK
         ap/IGWZZEZlrWknRR4zQEubx7jhCrJH4o3jP8jmOEXRH4lSyYQ/QbMM5nnotmdO+0Jp/
         B3BEupUWtfhQCdd7uoRt0oqcMbucKbU2N015d0Qkm6ljyQgcop+al2Ir56c9TQ9p1eHH
         DaSHgadcEIsDyB67US7krUHuyEzVyH4EFElvDrxJzVHL5E4/RYpQ/3aazzXYo5u0Y9AF
         nCqw==
X-Forwarded-Encrypted: i=1; AJvYcCU/e0NRITnZ0JNtq6oY2wGh0mYz5QC3Ix603K0k+3K8FY9NBiH5IGjLWbrLIPB+djeNu4860pMvQYZigQ==@linaro.org
X-Gm-Message-State: AOJu0YyWMrkJXksUR55UtrhYnnEAr8JC00g4woHdqED74qXXhmvZZxIs
	zE2PkafxznrSScAySyRxifSInBbXNqMZfX5svdQD+7IsswTMe3q7As4TQAUha6oLuA==
X-Google-Smtp-Source: AGHT+IHuhhAiEzkVHTWofBhBqgpOXZdBh/rWL7IMEM1ux8mz49czPs5z3Ayh4M4BEC57KqIzUKPO9A==
X-Received: by 2002:a05:6000:186c:b0:381:cfea:2818 with SMTP id ffacd0b85a97d-3821851cc75mr155127f8f.30.1731546931624;
        Wed, 13 Nov 2024 17:15:31 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.209.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dac0ae51sm1409755e9.34.2024.11.13.17.15.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 13 Nov 2024 17:15:30 -0800 (PST)
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
Subject: [PATCH 17/24] exec: Declare tlb_set_page() in 'exec/cputlb.h'
Date: Thu, 14 Nov 2024 02:13:02 +0100
Message-ID: <20241114011310.3615-18-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114011310.3615-1-philmd@linaro.org>
References: <20241114011310.3615-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: QJWQTWKbfagp

Move CPU TLB related methods to "exec/cputlb.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cputlb.h   | 11 +++++++++++
 include/exec/exec-all.h |  9 ---------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/include/exec/cputlb.h b/include/exec/cputlb.h
index ae4798a017..9075d94ec5 100644
--- a/include/exec/cputlb.h
+++ b/include/exec/cputlb.h
@@ -108,4 +108,15 @@ void tlb_set_page_with_attrs(CPUState *cpu, vaddr addr,
                              hwaddr paddr, MemTxAttrs attrs,
                              int prot, int mmu_idx, vaddr size);
 
+/**
+ * tlb_set_page:
+ *
+ * This function is equivalent to calling tlb_set_page_with_attrs()
+ * with an @attrs argument of MEMTXATTRS_UNSPECIFIED. It's provided
+ * as a convenience for CPUs which don't use memory transaction attributes.
+ */
+void tlb_set_page(CPUState *cpu, vaddr addr,
+                  hwaddr paddr, int prot,
+                  int mmu_idx, vaddr size);
+
 #endif
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 2b314d658b..2e58540005 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -174,15 +174,6 @@ void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *cpu,
                                                uint16_t idxmap,
                                                unsigned bits);
 
-/* tlb_set_page:
- *
- * This function is equivalent to calling tlb_set_page_with_attrs()
- * with an @attrs argument of MEMTXATTRS_UNSPECIFIED. It's provided
- * as a convenience for CPUs which don't use memory transaction attributes.
- */
-void tlb_set_page(CPUState *cpu, vaddr addr,
-                  hwaddr paddr, int prot,
-                  int mmu_idx, vaddr size);
 #else
 static inline void tlb_flush_page(CPUState *cpu, vaddr addr)
 {
-- 
2.45.2
