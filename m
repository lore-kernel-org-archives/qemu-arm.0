Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42536njb;
        Mon, 12 May 2025 11:05:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXOddVyWOFX/imOTe6FNLcJLPxExl2xSSGz3ujbM5W3ecUZDJvUW39zrmtaP1ZGh31OhVkJVLsJPsxBbQ==@linaro.org
X-Received: by 2002:a17:902:dacd:b0:22e:421b:49a9 with SMTP id d9443c01a7336-22fc8aff0ddmr178207285ad.2.1747073114060;
        Mon, 12 May 2025 11:05:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073114; cv=none;
        d=google.com; s=arc-20240605;
        b=I9d7rdnIL8OIYbOsXKGJgt7qPqtWcZ+33Vrb5kHEN/RtNtQtsqQ1CkOGTxRggn/jNI
         8XXxF/uRAqAfMxx9MjCpCSt2yfMY0xHAcAceXau2Ib5N1gmBixCVhfhaq6QUTP4zlpyX
         f6vUfH1A+Ioilbytb9u34tgT0fXcqJ5LOlQu7kSsIgj+A6bFQa6xNmLfdTOZSai+B+lW
         KTr8wE0+iAmkOiV2TtUszWo0IRX+gu7kMhVjLLsT+deypLSJBoKsGeNZcGfbXTYFLk8+
         gPpusU9svjhSGCn+NKAVFBqvHAt+zzg4x7HEyppcK5oaoh0sfIrSYYabVIiE1iBBjfMo
         yWww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kJMyYCTFAIbu3EwtVFYHiNKkH2seNanmqLNgECsCQ48=;
        fh=gVCsKrvIoWzs+iFDMfMda+WZI8UhUN6tOvYik5dS1R4=;
        b=YhtAaEYv8/x2Pv/sTJ2+Ypaa/j/g+LpP4WlOVOaQWUh8+GWWdFNCDnytcAMKPfVOlY
         XsNpwD/SHU/GZRD0TSeeZay1MjLum8IU913stwflYclJz/n+Ne8gpsozS/Wwbw3YM4R2
         o/agcnlvPYFdiMkWzQUwQEOVM/g3nf0N2oUjQOCoxcaBNsn5HCB5PhfAtwULvV66K7KQ
         1VsJLtXy9diF775RqjhLErq6zoh/8yM7dVY/fV7D3qJB7+4P8Njy+X7TyUG0/PUH/Y8M
         ftFkDSMK0LPPsYBAPFT4uoKTyEukKYgZwf9XakQhQabXdWMPlE8QalnJOBJMWo+ToAvo
         HfDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LZuAWtSU;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc6f136d2sor42014595ad.13.2025.05.12.11.05.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LZuAWtSU;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073113; x=1747677913; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJMyYCTFAIbu3EwtVFYHiNKkH2seNanmqLNgECsCQ48=;
        b=LZuAWtSUl5DRFXjVWH7P0iirZ2ggq7FROO9gCX2D1KFPDUptD9U+vL+VeJVItO4N24
         UV5zZc8oqcNMm6nKHXHF9EWYyso1uYNd0NTi5WSDaSa5O78ei+wBi8ATieMIW54NXw0X
         gVepez7TqQ9tvgkZIf/i69+FSEdoSRWYuFsa4+LnbCVDZZe3CmfAiFfKJSpMgwbt7/jq
         Ddszwt+uqPGWR/KKIooKlAOIppDBbIEnbUMygZ6qAl4UjIub7uBdj+cAH6jr4dUraOMp
         x3gWy2lZhG4AW63NWVbYF6gv2RQ88zQmNVaW2KKVwXb9WWzO5yWfUDGucYuYbuYg6CTM
         O26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073113; x=1747677913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJMyYCTFAIbu3EwtVFYHiNKkH2seNanmqLNgECsCQ48=;
        b=jbVkjIyVSadr26fa1Cr2k8KXciOzIn21WAn74XSpUB5gMT0vxCqF84H5xqph1uaoWk
         SGJhhF51Odx+WoaOwKunecNd1h14ILHK0/Q89TxnCXPdE7+3QBgvZWXHHrTLt5I2zRdf
         WFmhmgIos/JITAsvIpzwbI4EXlvafysQFR8jxXozdSrsFpfJuK5bguAj5kgp4oksmsMu
         dUo81AplobZSYvqdxoye6608nxDHDZ9lf4Nyp5ZLlwBH6g5o9gDRycqP+r0KDwHgLv/d
         bGUsbNionmeIMnl91Aq67Mv6kbva50xvhhwpB1U4CHR8U2PoVpIwJ1xFjOR6kXsuSAxz
         Z1lw==
X-Forwarded-Encrypted: i=1; AJvYcCWTx1EFD9UVHGjfEdCdJA8HPEbqEYl4PZVSO0gF9A74gUF0fILNfrFo6cYQRRoMI4t1CBG3FWNS2LsLFg==@linaro.org
X-Gm-Message-State: AOJu0YzHMt8EKSd0QpC56YONMNaYfzlet8M62oPZwyym0pgiZk5sDpru
	z6mB3D9765O4dzQUW59YR6Bk45jAgjnlplG3ubCYQuLsBge/HQ1vn6uJICa6q+xzXg==
X-Gm-Gg: ASbGnctb71on883kHjJiK9Rm6PmETlQ7Dijh8CUrXuP8k0lhlz7nNmO/Xw9oPJx0yLB
	4EWCcRpQPWFDe4B+eyCOFVxZQuJOBVSYLu7J7nTCVC3o9xwfrzbdOq9wQYfBWa6cdFfnUcrGNBR
	NaszQKdRgLuwNmVJcf7xhQ8lokl788bZpQiJxi7pwniO4Te0KQiwQgeIR7GponT+6EWOSAlLtVg
	FsvPFtwnwuV4KAS2kAThm4nJ7vgfskOBuQe3ALK/9Nz3ELL5uFwRWwF4ptWFVtBwl2v2DxiUtXY
	WCIeMQShxJ2hP61EPy6AgXl41FHT2/HGcnSQt9I94eqkcpNFvZbWPXU+aA7SHg==
X-Google-Smtp-Source: AGHT+IHdpFnpSMK7x9VszJ7ESn4Xre+yM34qcZNm54/vUIBuvH533/FuI4IGWiU34ZcU4u+AyvAchw==
X-Received: by 2002:a17:902:c950:b0:22f:c83d:d726 with SMTP id d9443c01a7336-22fc8e99ec8mr190068085ad.33.1747073113601;
        Mon, 12 May 2025 11:05:13 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:13 -0700 (PDT)
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
Subject: [PATCH v8 02/48] include/system/hvf: missing vaddr include
Date: Mon, 12 May 2025 11:04:16 -0700
Message-ID: <20250512180502.2395029-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: t4tf0uVc9+Gh

On MacOS x86_64:
In file included from ../target/i386/hvf/x86_task.c:13:
/Users/runner/work/qemu/qemu/include/system/hvf.h:42:5: error: unknown type name 'vaddr'
    vaddr pc;
    ^
/Users/runner/work/qemu/qemu/include/system/hvf.h:43:5: error: unknown type name 'vaddr'
    vaddr saved_insn;
    ^
/Users/runner/work/qemu/qemu/include/system/hvf.h:45:5: error: type name requires a specifier or qualifier
    QTAILQ_ENTRY(hvf_sw_breakpoint) entry;
    ^
/Users/runner/work/qemu/qemu/include/system/hvf.h:45:18: error: a parameter list without types is only allowed in a function definition
    QTAILQ_ENTRY(hvf_sw_breakpoint) entry;
                 ^
/Users/runner/work/qemu/qemu/include/system/hvf.h:45:36: error: expected ';' at end of declaration list
    QTAILQ_ENTRY(hvf_sw_breakpoint) entry;

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/system/hvf.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/system/hvf.h b/include/system/hvf.h
index 7b45a2e1988..a9a502f0c8f 100644
--- a/include/system/hvf.h
+++ b/include/system/hvf.h
@@ -17,6 +17,7 @@
 #include "qemu/queue.h"
 #include "exec/vaddr.h"
 #include "qom/object.h"
+#include "exec/vaddr.h"
 
 #ifdef COMPILING_PER_TARGET
 # ifdef CONFIG_HVF
-- 
2.47.2
