Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp742635lff;
        Sat, 18 Jan 2020 11:16:32 -0800 (PST)
X-Received: by 2002:adf:e40f:: with SMTP id g15mr9640111wrm.223.1579374992263;
        Sat, 18 Jan 2020 11:16:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579374992; cv=none;
        d=google.com; s=arc-20160816;
        b=H1Z3YECg1khQRYPrz8U9UQuVGlxS2hZ3ZQE8EV/mvxbH/G4cmDS14P+hLxDFKHXnGI
         7YL39qQc+UDCunwyZjvRXxsM3c4zQ4TQ7U7hn9YJQUBxKRiL81J8+m2kIxM4doqXiA7e
         +VeN6NBo7hNSCju8gewINDBeKd5ecxGLwRbKGIUZebSTLFgp/RZn2/kYt9rdGr7P4b7Q
         zf0G00JjNMtUhBmvUOywVixiLqfLcagUGdVc2xB4eMcHc96EQ0zI4b4b1oZUXl8pcX06
         x8mj83CkmiLN/QOkuIBefFMovW+ldz+DKy1+c0eQAnPtTMP6E+Q8s+qoF7cWmWDiUQMw
         itVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Wj10eBNNliOseBoV3NfXic+RLhYYHXWcALJg05xTsWU=;
        b=RAF1A7Pgz9LkSX6fwcJvqAra5G6XG1UQ4X59RECj9vrz1n2GbFQU8Tf7ToAC/8GZj+
         6aoxXIYEB1IvD65/v4ZItypeijUzUh9mLDiZgpZfv8tj432rbarA7SKH+1fM/zzMLv8l
         E1W7ulNCCxjADe6Psx6INXsP6aKikYITke6w8MiAhYpdSGPcClAk1SVnmtC9Pnjkw6d8
         8JfQoebuXtmpPMNyAjUViWFCLZiY0DESbit1eBQMWkX2UyayOM+2YrJz5Pt/5W1UVRpo
         EqPqiABmPZv1miz7XN5jU+JNzTsH8OirYQLo+FAmttg8y0ehjhDQiiAxEq1R71m4ao/q
         gJGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=V2jUqxi0;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e18sor12965693wrx.12.2020.01.18.11.16.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 18 Jan 2020 11:16:32 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=V2jUqxi0;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wj10eBNNliOseBoV3NfXic+RLhYYHXWcALJg05xTsWU=;
        b=V2jUqxi05t4BSeYoj6trfR6gTwh6MxcBoc6zIYpbGvoSLTWpOuNs5jekY1Z+C7A7mV
         OYFJvA2aLvq16COKHeI9sxLOHioLsjBXMsLPTHm/X+lulb1tJwbWf93kna3iVWhWc30n
         Zh4+wuTBfdO8AKAw2Q6fjsnex4MkxWwZxttzVMK6cTEeQ/+Zd4/7JYbm1mo3xfrAZ9gw
         4M7gMmsEX0COImb5aXEgPoOWH7Cr7Utw9kg/Vu/uy3r6ssC+tarLexaofqNs29k25iKy
         pK7acuaGOBC/JCTLFySOA829FOtzTzfki91ci+wv01mcMHAzkxsakFxNiot/XfP1hKsa
         OWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=Wj10eBNNliOseBoV3NfXic+RLhYYHXWcALJg05xTsWU=;
        b=M40nA6YTQtJ5o2unuIB+Km77JLM0ouL7vrXWr8zpJgT1HtKwohfCza/+X+IH6xJi38
         S/LTVoxlLohqLuOF3lUApcc6X4JwmC6dy4iTzW1/9xa6LNSxmvTRVVe/+FnHHAEmCpXL
         c2+m47D+BMAHwfRRofr7Yns2d9CZN1tPS2ysPPMGHqfnpnfJ2gOwyfK+xj4NJa/icK8v
         IbrEGa6hY5cfT/LQhyl5oY/r2XdzNO8ABvXXBEL+Mpt0UbD9tzgXzK+fqjOEB1nNAZ0U
         g3g5HYnKVnPNJItr56QT3ELzCyQcia+S7UNOmkicCQs9kN+b9CHDsAyBD0FzopjoYV3p
         YEPg==
X-Gm-Message-State: APjAAAXlHx6xv2OZjyhKDLjO1by+aIzEOn5tnNqdE2Ns28JHlUCf/ejj
	pV097Am9rvXh6xWcGJZKL+U=
X-Google-Smtp-Source: APXvYqyDxgWA6j4xBS1u4fbW08f3Al6ZIwrCyS4GyjjnIYEls4PheZajK9waS6cCTsRG22517ZzPXw==
X-Received: by 2002:adf:d184:: with SMTP id v4mr9755024wrc.76.1579374991986;
        Sat, 18 Jan 2020 11:16:31 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (113.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.113])
        by smtp.gmail.com with ESMTPSA id z11sm41339690wrt.82.2020.01.18.11.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2020 11:16:31 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 4/4] .travis.yml: Allow untrusted code and large files
Date: Sat, 18 Jan 2020 20:16:23 +0100
Message-Id: <20200118191623.32549-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200118191623.32549-1-f4bug@amsat.org>
References: <20200118191623.32549-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: k824Np4KQuSM

As Travis CI runs our tests in a disposable environment, we don't
care much if the binaries are trusted. The more we test the better.

Also, as of this commmit, the smallest available announced [1] is
"approx 18GB", plenty of space to run our acceptance tests.

Enable the proper environment variables to allow Avocado download
from untrusted sources, and to download large files.

Note: As of this commit, all our tests "Ran for 17 min 7 sec"
before succeeding, see [2].

[1] https://docs.travis-ci.com/user/reference/overview/#virtualisation-environment-vs-operating-system
[2] https://travis-ci.org/philmd/qemu/jobs/638823612#L3817

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .travis.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.travis.yml b/.travis.yml
index 638fba4799..b8b9df65a6 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -260,6 +260,8 @@ matrix:
 
     # Acceptance (Functional) tests
     - env:
+        - AVOCADO_ALLOW_LARGE_STORAGE="yes"
+        - AVOCADO_ALLOW_UNTRUSTED_CODE="sure"
         - CONFIG="--python=/usr/bin/python3 --target-list=x86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-softmmu,arm-softmmu,s390x-softmmu,alpha-softmmu,ppc-softmmu,ppc64-softmmu,m68k-softmmu,sparc-softmmu"
         - TEST_CMD="make check-acceptance"
       after_failure:
-- 
2.21.1
