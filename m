Received: by 10.103.124.15 with SMTP id x15csp882385vsc;
        Sat, 20 May 2017 20:30:45 -0700 (PDT)
X-Received: by 10.157.2.232 with SMTP id 95mr8206441otl.219.1495337445416;
        Sat, 20 May 2017 20:30:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495337445; cv=none;
        d=google.com; s=arc-20160816;
        b=e0klhM2tucxrwfFcOkKLQAJJ25T2UtJHMx0BT24mrUdJ8hlFENlAnOj7Qh01ZVNx0O
         1pNSaDv0M4TxPn95Y/SN0LF5Q0j2cYOfhbEaH61MbWvAbbwclwwXkwre13fys1qNw5Qb
         oMIDkVyk2OqVU6DWb60PiAy/bmfDYfAzud/z1CBrwey2z4cSLPXvT92m7nl4syuJtDmV
         BR9cxGP02ZSDDYjeeC7EOv8upukI+4ag6XNO2mJJVhIRaQNiBc5erMQwCjA9Oxcc7s8A
         1xd0AGsO0FH3SY3b1xk72kuzwoauudKVduC2B6bjyGQexgFvwT7UkULHWDOCVsUt34r7
         37oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature
         :arc-authentication-results;
        bh=SRYWMWt8XqZBkbeHbyWI/UBaFh1H/eQwnSReyPxdjMs=;
        b=UTtxNyVNlzxsdv/1eXqyjGpMN4OLosszR2hTf/H4Io4udxMPbyapjPEXkBoOjwjR2a
         BRibUVCL5LAqmrs0jONUTIMu2gMSEqGEg9k1o/GR9wtOaRb/Qh1KXrSh0nRyJ+ET72vB
         EYl8TzMFHERLZ0ITEZC7HlZj6K3QXUoQBO57I7cGG6pfuYb85koaK7rYjZ/3azgijRlG
         1GyKULY60k1d5WNnbsquIq83q7HorAhRXnnu5R3M8aJicGKj7QU4oJ/xTtxrcxrwAorw
         8o7BbLs5Xbvh1CCKAxG+O8yaQoXT8K5tUDFKjuOC7z4SK0EdNbntwo3IeHojH6vRkQbx
         RMJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::241 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com. [2607:f8b0:4003:c06::241])
        by mx.google.com with ESMTPS id g77si5639927otg.208.2017.05.20.20.30.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 20 May 2017 20:30:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::241 as permitted sender) client-ip=2607:f8b0:4003:c06::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::241 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-oi0-x241.google.com with SMTP id h4so18064255oib.0;
        Sat, 20 May 2017 20:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SRYWMWt8XqZBkbeHbyWI/UBaFh1H/eQwnSReyPxdjMs=;
        b=QcosTi2QY2s9No3AWm+kXx2nW3m/v7Vh13fim9gkQSQ/4DuizG87IHZzXS1HsDDVQX
         KUbwiND3brFtLI0xhuUwZViwb1Zoga6CaN4lOMDVo5FgZWIYI6lOk8d0k0iXUW2z9Y+Z
         4g7pjCIQoSVEobsiQyt19nLZUuV4XnPAFIsd233YIOAdVym26MzbAnDNg3bVRmexBKEY
         i0aVodbOQPmZVScPlckrt1owbqivZiryzBfuRMIJv7kUmvFDrKPRXF9Pu9DQjCYeFzxI
         SOqsqiU1wQk9Ex6FWjxK95bC2cIanHMHbvb9EwMCHnfveL2D6ZMglEkHapl5LNee3wow
         /U7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=SRYWMWt8XqZBkbeHbyWI/UBaFh1H/eQwnSReyPxdjMs=;
        b=jsJHLHZPtDcLeqUVmJtixgBKy+qApkJSxM3pYbpc4vLeOj9tQXJvuKwp/5eClaCc/d
         HeE54wLLr5I7CHELKbp6Z5N5MyOXgRwfJoRxX/w4uddgqoKGyiYyHGYTRtwOX54s8VHX
         p9zxau7GMir3VAshVlTsztvYkkU7iPwIegYkin8c2dLMfm7tkmAAXVIpIbuB+QDv5ikg
         jfIVt4Vtu0zdBqfbJXXhCXcK/wgh8Jmsv30Uv0nYhgon8hSKea9huluRHD9soYk4zSfv
         ZNGoROdbHgrFop+3Vr2CGJSINzZkeReXBdqhj1n7eVoXrLKgll0Ea1n0sj9lG3VuZaiC
         J8eQ==
X-Gm-Message-State: AODbwcDRkXz09FFqiLoS1F9beAKBqi9ez46V4Tyc42w5U32+tmO5J1N8
	SXa6UDcuyvqTjg==
X-Received: by 10.157.5.106 with SMTP id 97mr2667340otw.98.1495337445164;
        Sat, 20 May 2017 20:30:45 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from yoga.attlocal.net (162-231-236-127.lightspeed.miamfl.sbcglobal.net. [162.231.236.127])
        by smtp.gmail.com with ESMTPSA id u23sm6499219otg.31.2017.05.20.20.30.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 20 May 2017 20:30:44 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <famz@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 20/24] shippable: add armeb-linux-user target
Date: Sun, 21 May 2017 00:29:52 -0300
Message-Id: <20170521032956.27446-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170521032956.27446-1-f4bug@amsat.org>
References: <20170521032956.27446-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: C03WeTUDVdtY

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
