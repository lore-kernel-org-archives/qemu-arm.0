Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4733592lfc;
        Tue, 1 Sep 2020 09:20:50 -0700 (PDT)
X-Received: by 2002:a1c:f70e:: with SMTP id v14mr2532870wmh.74.1598977250857;
        Tue, 01 Sep 2020 09:20:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598977250; cv=none;
        d=google.com; s=arc-20160816;
        b=IRutpjHTl2Kp4ajfKAnn2xs9/RO4Q5ZUaqigVPZueI84URtuE5yZWfevI4RQvrVvO0
         G/WY7C3FJRfiOz9vOL1GVYWLTi71GibPq68opr1/pWK1QPtDBVCX01SeUTYkM2m+HbNx
         XiNncFRWLqZn6eFkhtt+UiMchdix4QKP95hjUCzowwAH32IWBdOpKpRIY4Fz/xSyhVXJ
         CjsV5RO8qmxjujhOB7eb3mvwvpEDnW+xqyRqW70pwOFTmlZk8GlJRgC3rkxdy+gkFj52
         SpmcClYpPsr3caT/qKjatlC2RbVLtgMC7HgGXt3y9iRLsf769Z+njD3PNWkwytJBFkGL
         33qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=v6n4leECUwl2iEi0R9v+99s9eMqL6GE90my6qz6/blA=;
        b=cT1cM8faO9uTShkjyOH+6ltLODUfls+TujypFUCPidXjQoFJxipZkiG73GMnzSrrTN
         KG8HppujjmDxiWUzbgACcSkNn98mkN1gox41+m0kB/7DryJODcaGxKYgcMuWzStZs7hU
         g5aD3JGhptuFxc8k7biNXoHPSyJASIqPpFR+y+WGM+d40YIKSQMFZ6qKmkoEUMnryOjc
         CG5SYVMg8wg6SaOkVB7jnxzmXhpKjCJXZAnj2Hc1/M8T98JtGXm6keTwLjPNV/8fEiJq
         dKmLmlL3BP0FFNtLAB9xGOAXWMG9ARHaZSWly0s93cD8Q/vf7kAMWJHak+fHZIGn+v3i
         tB0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pMrUX+RG;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y14sor1152818wrs.35.2020.09.01.09.20.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Sep 2020 09:20:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pMrUX+RG;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v6n4leECUwl2iEi0R9v+99s9eMqL6GE90my6qz6/blA=;
        b=pMrUX+RGvIfAmXXSIfxIZSCitTwPrTSmpsS7BGs1vAQ6E7FPeTpK5tYqKEGTexbZv9
         ML+tPsYQBB87jhzJnSpgioZV6RRxbqVsPN8Kuq8Jn7LDusbNT8/sFBFRNSDfZu4c4/pb
         YZfQh6OeL/2SSVm4W1vBWihM1pwuFypPGMAIvanwkseWFa71oamRS9vFlRyvljp+KWli
         yMm+tWlV33J4orCRp2LzyqrhT1J3UhShCmlNH2GHJHvVVFNCab9x8807GOfSlbLuNpb/
         peioBGuLOHxa05ycSKj4Hqlg/LXRUhnTvtELrqwLppG+fm8ECA9WNA2kwOVzQ7fZctAX
         O9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v6n4leECUwl2iEi0R9v+99s9eMqL6GE90my6qz6/blA=;
        b=orbG++8FNuh4djvS1PrcdHOLA9YKpKnIv4dJ1PBQYbukSgh0BKHHjs0XDQP/fqjIvR
         8qM9YvnDJ0os+TUoDJ3OASWrrBXAo0NdbbSFndfGNwFZ8/aTavtZWvga82nZUu0hGR8m
         5nJctJnSyiFCSrxwMhN4X3wk0mC89pQW/q9H/3838uJYMhEJdQcvnlGQCeMxMx8BRgqY
         dABkehqF0V73RygZeiDWwRBSnK81PQt5W3lUYzBWIc0yKNt2fv1LIMPYZJe4A+Ex2YJT
         A/eGP9naEqZfg1Rvk3jCl9cs/2mjYGtpX9qiFILGKquB/m39JRdLpjTiQs+tD5CDSP6q
         GDCg==
X-Gm-Message-State: AOAM531f7a2DVVyLFtK9zd4hTFKcJ9jFclEKGAP6xq/HLcpHydpD63US
	3S/2TpBcqJKDZ6gsHQH/WHVhDNd5
X-Google-Smtp-Source: ABdhPJwYt/uKVRbNZ0WSQ2pgTNe9S87QCx+kCR+ihVAqCoHDUIHOm+kp4FgbpjCXdF01ceborQOXlw==
X-Received: by 2002:a5d:6051:: with SMTP id j17mr2928093wrt.81.1598977250596;
        Tue, 01 Sep 2020 09:20:50 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id c10sm3145097wrn.24.2020.09.01.09.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 09:20:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 2/2] arm.risu: Fix typo in VCVT_B_TT pattern name
Date: Tue,  1 Sep 2020 17:20:46 +0100
Message-Id: <20200901162046.32670-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200901162046.32670-1-peter.maydell@linaro.org>
References: <20200901162046.32670-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 4UxVTsiC3NUG

Fix typo in VCVT_B_TT pattern name.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 arm.risu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arm.risu b/arm.risu
index 43a72ae..048215b 100644
--- a/arm.risu
+++ b/arm.risu
@@ -669,7 +669,7 @@ VABS A2 cond:4 11101 d 11 0000 vd:4 101 sz 1 1 m 0 vm:4
 VNEG A2 cond:4 11101 d 11 0001 vd:4 101 sz 0 1 m 0 vm:4
 VSQRT A1 cond:4 11101 d 11 0001 vd:4 101 sz 1 1 m 0 vm:4
 # VCVTB, VCVTT (A8.6.300) [requires half-precision extension]
-VCTV_B_TT A1 cond:4 1110 1 d 11 001 op vd:4 101 0 t 1 m 0 vm:4
+VCVT_B_TT A1 cond:4 1110 1 d 11 001 op vd:4 101 0 t 1 m 0 vm:4
 VCMP A1 cond:4 11101 d 11 0100 vd:4 101 sz e 1 m 0 vm:4
 VCMP A2 cond:4 11101 d 11 0101 vd:4 101 sz e 1 0 0 0000
 
-- 
2.20.1
