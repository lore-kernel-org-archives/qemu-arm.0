Received: by 10.25.0.198 with SMTP id 189csp1569107lfa;
        Mon, 8 May 2017 15:18:54 -0700 (PDT)
X-Received: by 10.237.53.184 with SMTP id c53mr10399816qte.227.1494281934852;
        Mon, 08 May 2017 15:18:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494281934; cv=none;
        d=google.com; s=arc-20160816;
        b=NzWPKeoi9NBDnHaEiGeu7HtwRY8G0ijZj6kCjfQ0VR/UdOyhfq3XXFxRwGdC/ZrI4A
         RExGZAipe6pXLVl4j7xG8cxsjeSnFhu1NiNFSF5zm+Q0nbSPL1BQ1vQUXkxnXU37lgE3
         XwlHkfouNkM8ha2sSqGdZwvs4KAUwmlPEF92Cd8/uiau95ieAXh4ZH7+i3JqGQ75Gjia
         dNXVxKSAEv6BtPFiIhBtzuKu5NwSMhyQ9jBWkMT3pagWI6LGaCLFnFPYFeNXQLMX3U1b
         RF8a9L0Cl1QohjITsi7R08uuZAIDm63z1bADiwWSghuN+L0gWwBeIBQbubBg5oxdwJSR
         JJYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature
         :arc-authentication-results;
        bh=SRYWMWt8XqZBkbeHbyWI/UBaFh1H/eQwnSReyPxdjMs=;
        b=AsURof8sFVQWB0hd3RMb28ohGTtHrnt4zHe4j1y/Qlz3sY3AAitByz6vq5z9XBAVGa
         u03KYsPdWBKvZnNDp5XNzJYTDGMVRqMbtuxktmWAvRrSVy5SCfDv6J3O06qoRjm9YlUX
         l/kDyZmNotzdt3iX/muhdzDmkAxBjzBSA0pS7D0UDcSHvCkFfaIph8pgazuFyK2CIWcX
         p4d40Akm1B8gY6Y53X4Z8vFvGkESK/8D3vLZd6jYaVjB2/YuQIMi+e9KEOziXNnwqyXf
         5b2d+VAor+sQCVjqmeR8PQlGWRP1hhGym0JVodOXBmWr8L6ZB5mx8T5yxpagNiigP0zy
         NJpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c09::241 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com. [2607:f8b0:400d:c09::241])
        by mx.google.com with ESMTPS id m53si13992009qtf.77.2017.05.08.15.18.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 May 2017 15:18:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c09::241 as permitted sender) client-ip=2607:f8b0:400d:c09::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c09::241 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-qk0-x241.google.com with SMTP id u75so12128326qka.1;
        Mon, 08 May 2017 15:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SRYWMWt8XqZBkbeHbyWI/UBaFh1H/eQwnSReyPxdjMs=;
        b=H9tGw2gaMTZEMP6w8q1tuzLS2EQcet6VUsIrCq9t1MDEj3nKHLCoWM80J9U0UhUxwA
         vfOFYykoJmVycfL4kEMEHvnbmEa36dieI7EpzxBqBUejVTj2J5XDBQnlE4Tj/U83oqzi
         zkonUBdTmJy39nx1n3HN2AzJ+nUBKZa0pvaFOI+HI2ff6zQl/QYO0+M+5rIlFZ7ZTuOF
         whQxEe1TgtDmPIf7NsHsFFCD/9hwirINMFOG6bfVvfLU0MOceiOeSeHt0s/fvMBXwrJ2
         +Vv0obYFqDAvQTKpmRz6e4DBJbRe7n4rcXh/qYtw1MHdDc4W71o93ZialruffsXr81dW
         Dj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=SRYWMWt8XqZBkbeHbyWI/UBaFh1H/eQwnSReyPxdjMs=;
        b=R0NBjn5T1vn3ra7wMf24b2rlFrDnkK9rzSzVV2T2fePntYN94afbLBvmYnhP9hgtvD
         jRNQAxV3W6WfzEgl4lY85Na0y2vmglDMBLJ8qNzxKMQckpaBYhnHstb5ELeSF/opeIUy
         EyqDfQKyR7vmDhc2jri98CYR7SqpebVWx0rmgbINbsl+eAl5CrBd1XKq8BTdolmcPE0t
         l8RofyiQtniIVEDelCb/hJV1Wc1h4D6R5cdV++Fb/kohkiT1Uc82r2FXQ+Ajm7yECtVG
         /9z0anxVUZwMYnUC37r5+EBRSzSkY2kT5/DCgHUBgKxROrdJbjAS2fhWSDdhFgZN3JlT
         gPxA==
X-Gm-Message-State: AODbwcBZiMRHGUaHPetlUDYCtEvQribqdJ+mtrRD60oiTU3545tYb1CS
	S/aYyE7WR7La+A==
X-Received: by 10.55.24.9 with SMTP id j9mr25342635qkh.25.1494281934418;
        Mon, 08 May 2017 15:18:54 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain ([138.117.48.226])
        by smtp.gmail.com with ESMTPSA id k65sm10157286qkf.18.2017.05.08.15.18.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 May 2017 15:18:53 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <famz@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 17/21] shippable: add armeb-linux-user target
Date: Mon,  8 May 2017 19:17:55 -0300
Message-Id: <20170508221759.15616-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170508221759.15616-1-f4bug@amsat.org>
References: <20170508221759.15616-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DlE3VyS7L5rF

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .shippable.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.shippable.yml b/.shippable.yml
index fe360f85cb..2070c4d827 100644
--- a/.shippable.yml
+++ b/.shippable.yml
@@ -6,7 +6,7 @@ env:
     - LC_ALL=C
   matrix:
     - IMAGE=debian-armhf-cross
-      TARGET_LIST=arm-softmmu,arm-linux-user
+      TARGET_LIST=arm-softmmu,arm-linux-user,armeb-linux-user
     - IMAGE=debian-arm64-cross
       TARGET_LIST=aarch64-softmmu,aarch64-linux-user
     - IMAGE=debian-s390x-cross
-- 
2.11.0
