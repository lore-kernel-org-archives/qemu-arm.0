Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp836136lfp;
        Fri, 24 Jan 2020 09:29:58 -0800 (PST)
X-Received: by 2002:a5d:4807:: with SMTP id l7mr5695431wrq.64.1579886997973;
        Fri, 24 Jan 2020 09:29:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579886997; cv=none;
        d=google.com; s=arc-20160816;
        b=mLwCN9p0nTsyEViVjo+/jPwsj1EfMfKhJWeaO/ivorUs2IvROsxaCRlWWhfMzZBf3Y
         LdtwB6Z9H5tZ5rupsafTfOBQSvMqzE54UB7+qacNmPvtjdd1K3TwWDup83eLiljhu6W+
         h9zpolQWIK3TQCSdylB/hJoEUY3HTjGL8pPX7j5yy4w37NgkawllGibXwUv9KUW4Vi0F
         vKfj4Q/V88r6cEeRzCI/3hzqq4RL7JKsENiHNPEZRPhSWue2x6W2h7btSuu9EHk2FWxI
         RVE5esItziD+D573k918DxwOlDz1EHldftWEPxb+1RUiIxnYjr3RXswT/xQVAmHizk4T
         1AFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=tb/hBOQ/Z9evM7DGTBEiJ196hd0t4e21Je7XZaNWrmU=;
        b=W6LPNCus0DQBa4I2muEns//mpzwN7kjH/y2kfTeSu8tuoFFDO1W+NTw0HmStbq+sIa
         nMlms8Ww3VtbuxMdZFuaQFZG4t5HvvqTcAw3jK6kqjp2E+IYWozNNUbIHsvPelXsAIWD
         oOe+G4Lr9b+Us0KPKhzYRsMzmvtdcIVusUS/QDTaPUHl0c0QRP5CauaL1Ix82NqXA8Ep
         ds7k2ZmQWL3FWo4mnFrkigTZZaLegq4hsDqapY1RiToZO+YH2xYATrWPqNuSYw0KE3Xm
         1eVY2Eb/TptwtriZaCNZlIun9G/5OYQNN23AYlrGTXhwQ48ErNmHvVLPzLlzgheeEPtc
         7IFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iKF4oxnW;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q3sor5913262wmd.1.2020.01.24.09.29.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 24 Jan 2020 09:29:57 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iKF4oxnW;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tb/hBOQ/Z9evM7DGTBEiJ196hd0t4e21Je7XZaNWrmU=;
        b=iKF4oxnWP84MlYolKGatOyonemJkmGoaSaAr03QZ+jEFV/fPGwHDv3joyiKk8BtchE
         MXq0aHW0nRB3CkrWaTO0CHfJ1m9GqwjyskLYnW+ZTiLRw4v1579ch1aVjpMjH0NH+pI3
         M0i78E8p7kTSi1yar2CRqdKMI2ldgtejlHSuoZjrTboG4c3uuTTo5mfge4tiXXDIuDZ7
         nzxa3i1nSmmtD24cDUDAQzHd7cZOQaOcKDBtT0jmRJMkBAC43XCGDsLISaY2IpURuWtP
         VNrnD/zFHFBlfGI+l5pZWe/vpncXg+5n7iGbY0joVERzrNJ357VwbwE12QTSZEP6l1NV
         gqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tb/hBOQ/Z9evM7DGTBEiJ196hd0t4e21Je7XZaNWrmU=;
        b=ZQreDwdSFOYH7jAO62iI3dE/NunrofJnhMoZmJhJf639n6eQeXmQNesm0xywbQPX/9
         F8FbgXPQhC8A3lok2TDw/mRHrkbXkurv3T+M21J9PZfRB0M6kJLcPbw13b5GXNuZwmDa
         qem3VXus96DbmkRxNSLKk8wUhYWCGtpTEgLr8x/h8l9F6ZODwUNrKKDKu/DDNw8xo2Dx
         kLTo0LKlt7kVo1XaQbdcEhPXBh4woyxDCJBbsLLCdtcRW3de2JLULh6LP6DQy4EvOJeS
         Vqc35OoiNkjatnI9TxK90hF+RnsbCCaAdm/DDrI2lBzjGNyM1QmknMzr0iqFgD+faM3i
         z2Jw==
X-Gm-Message-State: APjAAAUmcZFiLeYueAbwPQyDN1POIvGMiIIfRhdioW/gwI845TGxIApj
	usGBsWmkxQLoAJj0cGwktLWpjU0hijn81YhO
X-Google-Smtp-Source: APXvYqzprLQgzsPoOViMeaJTy2NsMFrgToy5Mi9igaT59v6tbvyEN1q4wMHhg2cSALLFQJvdkTBpEQ==
X-Received: by 2002:a1c:b603:: with SMTP id g3mr246049wmf.133.1579886997665;
        Fri, 24 Jan 2020 09:29:57 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id x11sm7501504wmg.46.2020.01.24.09.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 09:29:57 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] target/arm/arm-semi: Don't let the guest close stdin/stdout/stderr
Date: Fri, 24 Jan 2020 17:29:54 +0000
Message-Id: <20200124172954.28481-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: yLOSB3nrFWgG

The guest can use the semihosting API to open a handle
corresponding to QEMU's own stdin, stdout, or stderr.
When the guest closes this handle, we should not
close the underlying host stdin/stdout/stderr
the way we would do if the handle corresponded to
a host fd we'd opened on behalf of the guest in SYS_OPEN.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/arm-semi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index 788fe61b51a..8718fd01948 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -403,6 +403,15 @@ static uint32_t host_closefn(ARMCPU *cpu, GuestFD *gf)
 {
     CPUARMState *env = &cpu->env;
 
+    /*
+     * Only close the underlying host fd if it's one we opened on behalf
+     * of the guest in SYS_OPEN.
+     */
+    if (gf->hostfd == STDIN_FILENO ||
+        gf->hostfd == STDOUT_FILENO ||
+        gf->hostfd == STDERR_FILENO) {
+        return 0;
+    }
     return set_swi_errno(env, close(gf->hostfd));
 }
 
-- 
2.20.1
