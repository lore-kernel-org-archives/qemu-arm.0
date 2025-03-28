Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp713685njd;
        Fri, 28 Mar 2025 11:38:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJRIA1nCa/cXL/HFg63+FP9Mzx89Rjow9eAyrZ0te5cF5aNuypiSm6Udwo4qh3ih4hQp2x5VAbQ7H0LA==@linaro.org
X-Received: by 2002:a17:902:e5c6:b0:227:e6fe:2908 with SMTP id d9443c01a7336-2292fa006bcmr2775625ad.48.1743187104967;
        Fri, 28 Mar 2025 11:38:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743187104; cv=none;
        d=google.com; s=arc-20240605;
        b=jVfD5PMBsoGvtyg3UEVL1xnlLorzP/L+hAjWI7OQRXfJXpeXor0nPT22ZlIHd4G03w
         ZxQd/+dNDZ+XLr6+A2U3fGU9HUK5x/fZZ5euIGVG5QsqLr3+IGA5eUdNgUAbL+uwL4s5
         vfiwjQfbBJXJJ924uvrFP7ICpQ+94RPH0koy4+J75o89G78oNOF1IpWdFdUaPdomGHfN
         VAV++8NeKsl7cfX/Dfe8Uo/v6L1m89dbR1ZntWYRZJmQl6BPgbPOXSMNTQDxocHuDAS4
         jFaRqAV15IMoATn1aCAPh4lrX6pXWMlZTx48ZI63qKqZtuHN+epRUtJ9aw1cDOOPwwCd
         qBJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=ssdVNB+g9zRxrEC+Fseszdr1LEiiY1jNxyK/Gm+atso=;
        fh=G5QSzlHqb9d4suIyedQf1iEk0BK25C3MfyB+O8uuWSI=;
        b=gu4UTsk/Myvz8fjPYo8rgzhBjDk5Ohj+11Qj8tmFYTf/+yLI/QMrDsvRBz804K7+Er
         6D+e5zFQ+7kWy21E6YEeDAEO9l54otYGQcR9YwNRkER31SY3ttr+iKQiyGHLjyJphGF+
         ATDqLVwK48HpMuq05ZwncKLRKi53QfGm/LNhEIiAZ/zGN0FKkT8JrjiHnG+OddgSOQEJ
         VyIJvnSD1KIGmqZZb+/qBJvc4MDv/4hXCngq+3lTFUBPtYdVcWYXtnun4oHz0BPLJjsv
         XyOx3UstpYxsQJJFYmEDnEsID28m2MGxZFbXPnXd/09LU5HNlt1MFputirTuzLZYJ4io
         u+zQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bmGkUjKN;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2291ec4bf96sor25615835ad.0.2025.03.28.11.38.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 28 Mar 2025 11:38:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bmGkUjKN;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743187104; x=1743791904; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ssdVNB+g9zRxrEC+Fseszdr1LEiiY1jNxyK/Gm+atso=;
        b=bmGkUjKN/Eq8pdRqrkxy+K7I+txXqp0ozp7+KzRg8TTYuNFCCkobxwXup6vty7bdYd
         uJ8mBVePwSFA+Km8ihI8DFFsoS8hFpFN7Ql1TvLj0mkeqgYWdj4g+UxZTVfJqbGzHJK7
         JaXkyNEQTkEqbxX8eDt9VLK3tp0unFrjeneXeXXaLHQeb+B60v8sW1B7eaQxEQMoMUTf
         qACxmiZzqEWvcC7fn1JbPbE/INPtFfOcqzpYkBBdoTd0KOa0atm8VWiFlMWL3WMJDg2m
         +HVAb0MbxgQ8BTVA1WbqEwtVVkp9GMOvuwB1iKUyuCDe2ZSI69p0+BzH7QV3SevU8gM4
         UoqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743187104; x=1743791904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ssdVNB+g9zRxrEC+Fseszdr1LEiiY1jNxyK/Gm+atso=;
        b=nYhqHYuVqew0zp35jg/MlWfY2i5vHAem+DIN98TJ9LazcF80zreURoHP1CQACPxoyD
         vkekubhFIsNpBZD5DBceVJXLWJiNIZvK6JMAnCLieipJPRPny0vXo36rneolQV+/Z4tQ
         iBknlm73INcn7CUuw+J1XNRxzkdG+83XFM2dEpJrSTJFBeWTItCOWdItGV1Sa4KiFmgt
         1KYSHWYt1ZQYJ5x8FV+A5VfeQGKfr4KjGW+KuKX+D5cQ80anr9da3GoOP9lurv2DaK2B
         UffjJMvVo05OexJXS3uQMBKumXS5DoFMe8GyB7YDwWqKVtWhg81aSqOa9NR5GDErgJjS
         7MEw==
X-Forwarded-Encrypted: i=1; AJvYcCUGhLzs3Z+gCJUHfnFsPBRmIWZTLUqHtwHYtIr7WgVgtd8VDl/ul7bVEEJ++pNyTOe58GkCZVTbUnKtGQ==@linaro.org
X-Gm-Message-State: AOJu0YzWegm3qe0xKWP61c26H05GGOFcaZCvAdxx3n42xSx80qp3Nwy0
	clNDpLb7znxmSMubWT/8Q/D3mXGxsHYSp1ReAhMqlZH9IXE0k2/45tcvqJgz38LMFw==
X-Gm-Gg: ASbGncu748+XAcuvNKFJ9o9e99+JCS6m5Oo4E6SHYdZjR5egkqWpxUJUIqD5iZXNvqp
	eVllXdjK+PPXsiXrB7uvbvxxnI08spdgUUmfl12jNi+eR0rEuYY4HU6IDQGI9eRCW0nbpVksqxQ
	CcdQMcRAjVAap1q0A3OKdrnX27C0MpwvbokW96MUpmDY8dox4o3D8vDIGLSkcht6voT4fKpOiSI
	191POxYQhhFxjl5ETpr63A5EXgl1fOc0ZF2KJ3TJqU46qkCXaIAa+biPWtdN7HHj1AkcJ6zZdiB
	m7waFslys63GeD+mtfF1CyBrMJhU85VmvE9rbxJLOv3qiGOMJQa/X4k=
X-Google-Smtp-Source: AGHT+IEsZ5CLLHOyuF2GEHYYXBy/cC/N6iQErdqNB/GMTo64QUs+RuZUh4ZMYIY1irAWy6xA2xFR2w==
X-Received: by 2002:a17:902:ce0b:b0:227:e74a:a063 with SMTP id d9443c01a7336-2292f9e53d5mr3138525ad.37.1743187104272;
        Fri, 28 Mar 2025 11:38:24 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedfd85sm22010365ad.77.2025.03.28.11.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 11:38:23 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	berrange@redhat.com,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	qemu-arm@nongnu.org,
	thuth@redhat.com,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH] tests/functional/test_aarch64_rme_virt: fix sporadic failure
Date: Fri, 28 Mar 2025 11:38:16 -0700
Message-Id: <20250328183816.2687925-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: kaT8XGVTz5pa

This test was randomly failing on our CI, and on dev machines,
especially with QEMU debug builds.

From the information collected, it's related to an implementation choice
in edk2 QEMU virt support. The workaround is to disable KASLR, to avoid
accessing protected memory.
Note: this is *not* needed for the similar test_aarch64_rme_sbsaref.

More information is available on the associated GitLab issue.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2823
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 tests/functional/test_aarch64_rme_virt.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/functional/test_aarch64_rme_virt.py b/tests/functional/test_aarch64_rme_virt.py
index f4ad4d33d58..a1abf584f0e 100755
--- a/tests/functional/test_aarch64_rme_virt.py
+++ b/tests/functional/test_aarch64_rme_virt.py
@@ -87,7 +87,9 @@ def test_aarch64_rme_virt(self):
         self.vm.add_args('-fsdev', f'local,security_model=none,path={rme_stack},id=shr0')
         self.vm.add_args('-device', 'virtio-net-pci,netdev=net0')
         self.vm.add_args('-netdev', 'user,id=net0')
-        self.vm.add_args('-append', 'root=/dev/vda')
+        # We need to add nokaslr to avoid triggering this sporadic bug:
+        # https://gitlab.com/qemu-project/qemu/-/issues/2823
+        self.vm.add_args('-append', 'root=/dev/vda nokaslr')
 
         self.vm.launch()
         # Wait for host VM boot to complete.
-- 
2.39.5
