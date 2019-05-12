Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1640901wrg;
        Sun, 12 May 2019 01:36:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz4Qhtc/99NQSdpOTP4S4HKyCHRrsQiVDAxbZ/z+LCVxJvaO7rOgCcaXJEPP+3QZnRbnvxA
X-Received: by 2002:ae9:ef4c:: with SMTP id d73mr2531277qkg.325.1557650203760;
        Sun, 12 May 2019 01:36:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557650203; cv=none;
        d=google.com; s=arc-20160816;
        b=yMid6LeXZJ37rmHTxj5R+UUjS5YVFNeGbtK8gDe8rtplGwCt+KoP+isaSooVhSpm4j
         n4oDCZrGxq0rw6GkTm7zNjKRssUnK9sHxP0HILLwq9qU9LuCgY2NexZHRHxP/H7WOw67
         njG4oDtznYtZuST7V6K8bn8Me8HGtwfYdOQiqwqoG6CQlBdzt8ZkiY9SCHchBbDZhPrB
         TIA+2iX7YJ3hpPUVltT15fx+kTFgGJ2PlzdMyn6Z1pYjYnB9W4ykfcK9odktjZRNpE2Z
         9enc3ylThLn8PpoGxcbwnj0QfVZu0yoZwOYxNXQgjREhHx4vuxFjwBA0kGcIvylxkGZ2
         O8vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=7gJWASQd9R5dvaLGxLmljQz1myPVvQcYJSTcIsyU8BA=;
        b=VuqIWm4FjrvBJ357zaPypicvR6zFHVTdQsln29IL4+vbh5C5D0cvbWrtmw/yZyiwz7
         oEGw004xTMKjJljzBrIQaQ9gPcJRivJ/yD5z4BniGXdGX2dhaE3jnbTh51bLBaTbseHT
         4wgyTGRDa5xS57JldAbD8vipweDUqXfl2boqVRCAIWCeHm5aLJ+4023krQwr/5MhSOKK
         9l9aPDnvZBBmctstNxQpXkETZ9Das4el1QTBtTgh/fCwknAgF4Eg8cJo+CB51TgFbJP6
         qi5qw962Vu/2KD3u4VtEs6A5MnbLGhhbiUfJF+TwVYuGZ69fvSkGQTtrT0QxsWJWqebI
         w4qw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id o22si6068263qtp.5.2019.05.12.01.36.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 01:36:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D0F633081244;
	Sun, 12 May 2019 08:36:42 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-87.ams2.redhat.com [10.36.116.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ADB865D706;
	Sun, 12 May 2019 08:36:38 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	armbru@redhat.com,
	eblake@redhat.com,
	Dave.Martin@arm.com,
	abologna@redhat.com
Subject: [PATCH 02/13] update-linux-headers: Add sve_context.h to asm-arm64
Date: Sun, 12 May 2019 10:36:13 +0200
Message-Id: <20190512083624.8916-3-drjones@redhat.com>
In-Reply-To: <20190512083624.8916-1-drjones@redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Sun, 12 May 2019 08:36:42 +0000 (UTC)
X-TUID: S3yaxFG1CD+Y

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 scripts/update-linux-headers.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
index c3819d2b983d..e1fce54f8aa3 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -99,6 +99,9 @@ for arch in $ARCHLIST; do
         cp "$tmpdir/include/asm/$header" "$output/linux-headers/asm-$arch"
     done
 
+    if [ $arch = arm64 ]; then
+        cp "$tmpdir/include/asm/sve_context.h" "$output/linux-headers/asm-arm64/"
+    fi
     if [ $arch = mips ]; then
         cp "$tmpdir/include/asm/sgidefs.h" "$output/linux-headers/asm-mips/"
         cp "$tmpdir/include/asm/unistd_o32.h" "$output/linux-headers/asm-mips/"
-- 
2.20.1
