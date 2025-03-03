Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2820821njb;
        Mon, 3 Mar 2025 10:57:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVzL6dc1PNgVkXxwL4dFzioxTvRp0OcDVZoEHkU021H5FZ9uYlE1wvYhm79/xCvEMnHkG+ye1g9RWTfEg==@linaro.org
X-Received: by 2002:a17:902:f683:b0:223:4bd6:3869 with SMTP id d9443c01a7336-22368f73e44mr218491775ad.15.1741028273670;
        Mon, 03 Mar 2025 10:57:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741028273; cv=none;
        d=google.com; s=arc-20240605;
        b=d5/2wfzLaIoRtabUjHVOXvkPNMwX9sKhLoFJavlKfITG0N6D+IpGG/w+ZkXomswHCW
         cwxLkimCDOZbvBAD3wCRje7q1ECQIE9PCCgF9tC1UPzAUrdCl8rtKyjv2ltfqgdWWqHc
         2IcKV95RwnfzbOY6TEI3PBDdt07HjA/tl8flsuYfeFP3OYTVY5M8tQ9G520RMwq9ccB2
         H76lPbnYeV2C4QDSPhL0Ei2ypQjDz2PMFo3sRuT42Fi2m0+BIKZmPnS6HyLYt+CAyz7q
         dzkY9bp7U/Zvjr7+A63yksoOjFqwZu1m/D//nhcZCQUP4V/mszPXIYOyIC8xmteOGm3S
         gw5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=MlxeaBTa0OnfkqZwMGX009w7nxjBMGcnOIKYJ90xgwk=;
        fh=RiBcf5VqCVsJdWFAu3SJy3PGCW3AIif9RQckT7Wsoh0=;
        b=CB+olENA0tZThJvwd5xvM11X9dcxMBMSlIr8fb3uQc0QEe/vWD+6Nu6FTSl1Dp5C5O
         Ln+1tDNk4UkFwzwtnQYQkCsgrxbK32TRjQGUa2XSA2l0i88Hx33nRd9aDkgrerorlgsg
         1vyppEGHHTy5aCqEsgflaJiSodsvL/ILXLhBYzW7gZSerSmyWmy+hHp14Ow2M9wnrTSf
         xs7sbPvSzI8A7kGH4QAxpmIVhhDBGmY/5jhQ7hL4JnDm2CQT+as/spH3HrW19Uh9IBeq
         XqcRP9zbxa9cOI2S1er66jv1EUSs6CZWcMVwFxiITvuSOHBi9v2qK9ZC38FMWleNMgkB
         YydA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nGwfGafa;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2235050b4a9sor89543815ad.15.2025.03.03.10.57.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 03 Mar 2025 10:57:53 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nGwfGafa;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741028273; x=1741633073; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MlxeaBTa0OnfkqZwMGX009w7nxjBMGcnOIKYJ90xgwk=;
        b=nGwfGafayEfFB9NY+egkZEVAjv+roUTubVJlXJGjRs90+ol93jIUG3FaA1GMjvT/u2
         dqfks8ocNFLYTZxHooxbXlZAUactaxtuZsWz0dzDCviTbWjkiigh/pHj1yk6QivrtglB
         UeIzvObCA+Y3GVHYmMncrs9sMK6I7ZgL8pnsKB7AA+0AMgXygQZBvQskLp1xZ0Npb+HZ
         BB3LOAtM4GPmnw6pNmw5qJrzDdT9cHxSsqjI2aZm68sEVbpojdNmo+VHkFJufm3ODGH/
         MLulxnYdkoGFbTJ5UYakPUOXcFtCuz63snxigXXxoePovkBweJEYzR4e1dOXjO5rzx2U
         4F6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741028273; x=1741633073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MlxeaBTa0OnfkqZwMGX009w7nxjBMGcnOIKYJ90xgwk=;
        b=ZbMKV2P+m/9yZg+wIgftij/L7UuRWLk0tMbSYzA8DInl/33Gm0UyQY9RIVwedLwpbE
         id3VVpFcYh7PWnlFWmy/3cmQnzjANBFylfHVIbnM3gwO0cbX+qcIbqMMacrRs7qpqckK
         zSRU5ESFNChHic2teMyhGmNWWWqjsdbkOmXdekhk5kuonNse5HiSLcbDbwjzMI8GfMpY
         qdJv9Yv2Wxin295Rg0kAvosdm8X9GMGqOJOgZRuwyPuo6LPxWw3HdnjzAMCd8iQjjR9s
         xBctCVkcjPwyyY+uxg2WZzRs2NK2AIBGH3V17axKv2qww57GIiVSmeO8mCUOQsVhs7KW
         kU8A==
X-Forwarded-Encrypted: i=1; AJvYcCV0sLfZinxq6FakU6ONVTww4W75255hVeaD8YZhTR6OJNfGMFr/CzQxva9TPf8dKxje+Zi2NlvuP2SF4g==@linaro.org
X-Gm-Message-State: AOJu0YyzWqjG5yBJPUGfSfyIaHJdF0FdZ+qWfCReZ15vitQaaJqu/YlP
	BP/thxngFIGvD7QDrCwAthGj/WbfhM/MWJkC604hMUGtE3jjXAZ4vgUaIiHyBzDxSA==
X-Gm-Gg: ASbGncv6bQOnJGWefW3HzseqecyFhjNAq0J1vpOhb76c2VdvXu5gi4Jgdp7RXXnD0Jq
	++127MawV0d/wYVJpWkdjMzFmRmkHhE0cRoj9t0IFm4rOjUFo1nPZih/gLnX8vXX49uJWQGcvyh
	Gu0I/lOwOGaUbq90qEMZo1pEqRzvG6ctPHgt4mCkNUIRSEWgvSzZoDJNOglbUDiJIgaq31lS9xK
	wO+pAFLl567xlwmHZuYkOZs+4of411ZuJBd9mQk7B5/LtDFLK+8E8f6+f/jB9CInm46PRgTWc1t
	axGO2MEW4OYGoQKn+Qhwd12IhTVXDzb2VhOXqvcxEFir
X-Google-Smtp-Source: AGHT+IEr1r5Kupen/oAqfiVInkafhwrGRmuUCtCl8NLBBS29DKperNqda8cr1yKGp166oxGBwubrSg==
X-Received: by 2002:a17:902:cec7:b0:223:5c33:56b4 with SMTP id d9443c01a7336-22368f91d03mr219979805ad.20.1741028273256;
        Mon, 03 Mar 2025 10:57:53 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c5dcesm81214225ad.119.2025.03.03.10.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 10:57:52 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Troy Lee <leetroy@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH] tests/functional: add boot error detection for RME tests
Date: Mon,  3 Mar 2025 10:57:45 -0800
Message-Id: <20250303185745.2504842-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: YW14vRqigC7m

It was identified that those tests randomly fail with a synchronous
exception at boot (reported by EDK2).
While we solve this problem, report failure immediately so tests don't
timeout in CI.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 tests/functional/test_aarch64_rme_sbsaref.py | 3 ++-
 tests/functional/test_aarch64_rme_virt.py    | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/functional/test_aarch64_rme_sbsaref.py b/tests/functional/test_aarch64_rme_sbsaref.py
index 93bb5283386..ddcc9493a6c 100755
--- a/tests/functional/test_aarch64_rme_sbsaref.py
+++ b/tests/functional/test_aarch64_rme_sbsaref.py
@@ -60,7 +60,8 @@ def test_aarch64_rme_sbsaref(self):
 
         self.vm.launch()
         # Wait for host VM boot to complete.
-        wait_for_console_pattern(self, 'Welcome to Buildroot')
+        wait_for_console_pattern(self, 'Welcome to Buildroot',
+                                 failure_message='Synchronous Exception at')
         exec_command_and_wait_for_pattern(self, 'root', '#')
 
         test_realms_guest(self)
diff --git a/tests/functional/test_aarch64_rme_virt.py b/tests/functional/test_aarch64_rme_virt.py
index 42b9229b4cb..38e01721a4e 100755
--- a/tests/functional/test_aarch64_rme_virt.py
+++ b/tests/functional/test_aarch64_rme_virt.py
@@ -89,7 +89,8 @@ def test_aarch64_rme_virt(self):
 
         self.vm.launch()
         # Wait for host VM boot to complete.
-        wait_for_console_pattern(self, 'Welcome to Buildroot')
+        wait_for_console_pattern(self, 'Welcome to Buildroot',
+                                 failure_message='Synchronous Exception at')
         exec_command_and_wait_for_pattern(self, 'root', '#')
 
         test_realms_guest(self)
-- 
2.39.5
