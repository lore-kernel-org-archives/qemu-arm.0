Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp311456wme;
        Mon, 21 May 2018 07:04:20 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoB+6Fk3gvw/UK5cKL3D+qSSPBVDff+yLFRicLVEqk0F2dDU3exNYEdTfR7miOaY2IDzoKw
X-Received: by 2002:a1c:2703:: with SMTP id n3-v6mr10308141wmn.109.1526911460168;
        Mon, 21 May 2018 07:04:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526911460; cv=none;
        d=google.com; s=arc-20160816;
        b=yf/nhHIoIliq7WAHRDEAgYv2edVOAEGFbfPUJyM1c0t2oJ4KiAVg2WCPsWFgtkXmMR
         Y2aWlfPHccTNtSuZPFuBZEOPxJ0/dRka4DOQc8SWeMgymxtpgnx44uxKb9yNdZmeWvnp
         gpHncZTtFpBYHMfqJmxr8QI+MgHhu86UO8RpLg8B6w+nvr5w6VaZ7DHkoYPNTewIvFkE
         PQLgkrFzL1HSAxa07pLYBESCHwxEVZflXChHFhNGai5QEU+6Ia4TfKRMLGZzuGdBbaPk
         KnZ1JWv6YqDMuntSkqf5Kgl4QUqxczGH5op8tOXkGufPTDq31gyyuoV0pUmxMQR/J4C+
         Gapw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=a+ZLCCQwEkJPoCLPY0S+kA10IHjsH/mSzbbpWbLMRG8=;
        b=Y6fw6UusPAMyJDg93lpuoOCBBBywwbzo9/qpR34179pRZRbsX7v3xFVvSyxHo5qG2U
         RCeLiR5ibMjSumDHbHr6osrpuUBr2VCVfR9lB/knFDK9PJKYR/zpx3VTkIAhgikrYAG6
         zQVl1F9Gw2b7gCWtf7Yc08VApdhXJJwHkVEvs+xknbI+EebQt5AN7Ltceae1I2syr7aN
         1KUrYAr01h1jszpdAe0UYZwM76sogw4aMXOQdAyUbT0wDy9F2QyjwF436xUTKT4PkTPu
         rlZfuypVKcCRHAKu4df0gSs6aRjtG/7KXdtAG19BoTOO8t24XstaHaTKggsJ499u88hi
         Ibig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id m130-v6si10001367wmf.67.2018.05.21.07.04.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 May 2018 07:04:20 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fKlQB-0007n9-Gt; Mon, 21 May 2018 15:04:19 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 22/27] vmstate.h: Provide VMSTATE_BOOL_SUB_ARRAY
Date: Mon, 21 May 2018 15:03:57 +0100
Message-Id: <20180521140402.23318-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180521140402.23318-1-peter.maydell@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
X-TUID: BLgIMV6jBGQN

Provide a VMSTATE_BOOL_SUB_ARRAY to go with VMSTATE_UINT8_SUB_ARRAY
and friends.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/migration/vmstate.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index df463fd33d..59fc75e418 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -870,6 +870,9 @@ extern const VMStateInfo vmstate_info_qtailq;
 #define VMSTATE_BOOL_ARRAY(_f, _s, _n)                               \
     VMSTATE_BOOL_ARRAY_V(_f, _s, _n, 0)
 
+#define VMSTATE_BOOL_SUB_ARRAY(_f, _s, _start, _num)                \
+    VMSTATE_SUB_ARRAY(_f, _s, _start, _num, 0, vmstate_info_bool, bool)
+
 #define VMSTATE_UINT16_ARRAY_V(_f, _s, _n, _v)                         \
     VMSTATE_ARRAY(_f, _s, _n, _v, vmstate_info_uint16, uint16_t)
 
-- 
2.17.0
