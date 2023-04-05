Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp480553ejb;
        Wed, 5 Apr 2023 09:05:56 -0700 (PDT)
X-Received: by 2002:a5d:58c9:0:b0:2e8:9db2:d294 with SMTP id o9-20020a5d58c9000000b002e89db2d294mr2167172wrf.26.1680710755941;
        Wed, 05 Apr 2023 09:05:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680710755; cv=none;
        d=google.com; s=arc-20160816;
        b=NAJslXrClCX+IXQsqxL1Q8arzP6H+ePl8V1W3DHEg2htkwHznA5Y3WMut8PRPUI17t
         ZEMR+e0HGusubbn/AJqn+rU4ID3/k633mVXXO6iPusJyX7nly5PNznhEsRF79lM6qTmG
         hJqrcDTs0NQRIs2zv5qPQdJCFmV5BfytEpuY4Au6kcDokBBXmz3UMlqRopJwKoBwqTQB
         N3Krro0PsviCqQLNwwX2Es+zr12amWmJrTZXsfkF70lFb7/L47xRrXd+oe6LOH86FbeF
         Y2eS7mGjxnOigd+zecnbFVcPAukBcbGktAA13RgB8g2didqsvVtVE3ECT0UAcs4ug/ba
         sSkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YCSdJqBx+24lo5un4mJkeawVRhwXkPODtT/ypBXdn1k=;
        b=IWnpNcGr+FBApzM5fMG1mPJlbeqKs+jBTGjtUZxr6nDnOds1m/Qn2HQGYiAHBpWu/W
         Gcl8lXc1qQ1WRAo4nMdgWCtE9KVyj7Lv6HjLiWs2GtsXFoAp1gc91HImO3TtWiY6pMJm
         vwjhmk39owgKBhELI7XhTXpU46wicZe+vVuqQSB3q+kT0T/7r9OTYvUbUf0XuVFePb45
         RMc8rKR41mZtwgQQwhlFs2LoX/0IOnM8v9n/zMbp19flLnsLnRxOTWooCoW7EddB8uQi
         zXnda7DcxjVUgakmuMLTh+xhcNLUWIO56gI5y9o1JiZfjD3sUGls+hQRmKVpGOZ30ONV
         mThw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nYNsq+8y;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o10-20020a5d58ca000000b002ce32bbb8c0sor5721488wrf.44.2023.04.05.09.05.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Apr 2023 09:05:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nYNsq+8y;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680710755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCSdJqBx+24lo5un4mJkeawVRhwXkPODtT/ypBXdn1k=;
        b=nYNsq+8yFO7mMRk2/GCs4D4e2iDu1F5AjhPlSj5MwnASO0hw5U/4oxpVLogb6drfmz
         3xU+KV29anaINmgzTl9ZhOc9H9utB1dE343KJ/Ch3nsDN2awoc2m/uGIUTaVMxmzxSgG
         xqRD/xBZxEreYRjFvoqcqzu5XK6hiX/J8pDK3O5eVEHmU9QCzAK4BaAmplmm9aESOaiO
         ae6Uv7SF5z/IgEENdF+M+eAcH47+wYVpnVgBJUOx9FPSM7Zy1/YL3ZUrvW8BmVJCLBZH
         ZI65eOSaRJWzT4iXngpJ6wyoT9UFNgKF6YSG3WUY8ns0z8i9D9egnrZvA5oKcJER0raT
         J/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680710755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YCSdJqBx+24lo5un4mJkeawVRhwXkPODtT/ypBXdn1k=;
        b=1g9T05pJpY1RHdzfWAz532ynIIPMwNLQkUSvYJScdwb7qCJxSLwz0Hyihc3RJG5h92
         4KJAJWcwRApqk+UEBE1BEoUitI5d8oACbYS1eT+kCVXqaBji201WSVcduYet8rVUnqY6
         M9rOCPzvUEk7tcoPIlCOUwjlUA9JDoNz0BQEHGWVXtqbNSTsk9wEENNRnAgJlgJMxsIN
         w2ru2XB2AXz22Yg5fwqKjO6pIjrAl/Dc8t9LNgIsjIgICMVf1YAzrMx3wbi8ZJLWnJEL
         wtqdSKxsvR90mT+jr3VbVKDFwTjcAje1epFmej1daZtCZWVTEsFw4GzM5pi45uotOp02
         TM1g==
X-Gm-Message-State: AAQBX9fZUDgPLJresPqJszgQ6GIYG0jO2lMhQ0r8bMNHjZ7jvNm8dn5O
	zN/u5QHDmll0ZeZtGYxj9bf2BjCE
X-Google-Smtp-Source: AKy350YkYdiHXB0g5ih7Cr+SgsA3BhgsWi6U992BWoRDvOtWKxTNhNkKh0iJQeFeR5+OUd9Zhgsf8g==
X-Received: by 2002:a5d:4745:0:b0:2ce:a835:83d4 with SMTP id o5-20020a5d4745000000b002cea83583d4mr2147619wrs.27.1680710755745;
        Wed, 05 Apr 2023 09:05:55 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
        by smtp.gmail.com with ESMTPSA id a12-20020a056000100c00b002cea8664304sm15199709wrx.91.2023.04.05.09.05.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 05 Apr 2023 09:05:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	qemu-riscv@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 10/10] hw/s390x: Rename pv.c -> pv-kvm.c
Date: Wed,  5 Apr 2023 18:04:54 +0200
Message-Id: <20230405160454.97436-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405160454.97436-1-philmd@linaro.org>
References: <20230405160454.97436-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: D+kZIhH0GDDA

Protected Virtualization is specific to KVM.
Rename the file as 'pv-kvm.c' to make this clearer.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/s390x/{pv.c => pv-kvm.c} | 0
 hw/s390x/meson.build        | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename hw/s390x/{pv.c => pv-kvm.c} (100%)

diff --git a/hw/s390x/pv.c b/hw/s390x/pv-kvm.c
similarity index 100%
rename from hw/s390x/pv.c
rename to hw/s390x/pv-kvm.c
diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
index f291016fee..2f43b6c473 100644
--- a/hw/s390x/meson.build
+++ b/hw/s390x/meson.build
@@ -22,7 +22,7 @@ s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
   'tod-kvm.c',
   's390-skeys-kvm.c',
   's390-stattrib-kvm.c',
-  'pv.c',
+  'pv-kvm.c',
   's390-pci-kvm.c',
 ))
 s390x_ss.add(when: 'CONFIG_TCG', if_true: files(
-- 
2.38.1
