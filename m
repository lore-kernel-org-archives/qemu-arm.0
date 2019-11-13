Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp4667896wrr;
        Wed, 13 Nov 2019 14:13:16 -0800 (PST)
X-Received: by 2002:a63:734e:: with SMTP id d14mr6226858pgn.357.1573683196647;
        Wed, 13 Nov 2019 14:13:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573683196; cv=none;
        d=google.com; s=arc-20160816;
        b=02GFNyOG35UJVIzwJ3bUtzEPwNS8A3epndwn0B081heyzS28PORdI52tLq3us/ir1S
         +v4bW33kdtJR6xpl6IdS9o/r7/A2AV/8cCfy2UBRfkIVOqObMjhGyGHpUADOA9lETTU5
         ZGH1nGq2JM15JsL1hP9qSuEH3O92w6NL+TZZ/XQLmdkIonXz9wesY9ico/G6HKFr7Fqs
         W0nZVQUCSy/VuxYSqZr/qxk0Hgj0kEA2dwoQ8mb/wo1GAoYV1z0TWaH8IXQ0rtJh51BH
         betw+RDU6x6agZATUD5NH/82mj/HrDUi+Dl4pBdhY9OcvR0ITI3m/qe6lMObm27pwsYw
         +bvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=rndpeHxbj/C4hJGnw+1eeHlSftg7rDiNlHx9DUUhsi4=;
        b=ob8Rh/MJ0cg4/3lEbMkm034ylvBH3+CDemZ+mRDV2WLIN2i0w2Md83iNGh5IgJwt5G
         zB/jvTO2O7IR3MrXWm20gNhye966JTO3sPeDF+RGMoqYsrrRfBnOxrX6PTb/K8Ix2jzY
         V/Xp5d0pBj/nUoEi8KubjfUyb+AWxG/NvizQmuzYEeblMPVbZUiGxQyZ9wOytCSnHrQN
         uB9W7j4CwXmGTmNnBOKg6fj0pcZcRWkstIx8giGtNILOhghJGYK4f4lSo9Y4bqrzW6an
         oU6GikqgghpQgjLmb9OYu68013E/Ux3iGNrFq2ty4ClBpcBPnLGdZow9hKr5M+lWaNc1
         oG7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q2QvVQrw;
       spf=pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=joel.stan@gmail.com
Return-Path: <joel.stan@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m65sor4553534pje.19.2019.11.13.14.13.16
        (Google Transport Security);
        Wed, 13 Nov 2019 14:13:16 -0800 (PST)
Received-SPF: pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q2QvVQrw;
       spf=pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=joel.stan@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rndpeHxbj/C4hJGnw+1eeHlSftg7rDiNlHx9DUUhsi4=;
        b=Q2QvVQrwr9Y3i0kbVP9b8obuulJ3ApAcpv9Ah5q8l7T/dGYWdytdIGMw5bmf1BFeTK
         wRS7bWxxual+nURxenc8DRDmfKIoUI/Ne7IvxhXLF3n9mC6EdGUM7qZ+EARwCRRCWL43
         HQje+51Rmrz87LooE+hDqVZbT/NQY3NgpK9XtSXYWyWF9tnr0dqYsF4AkMQh4knGxPEL
         bIkt41rh2m6MCNEiN5MJcWLVBwEPNBA7RMfrLbZlAj1bk7ZHu71XHDANajRhazl0W9Sy
         Jx036vQ8eEYauPjzybjMyUknqb+sPYUe+b7hl0mJidNlfwLJoAKXC6+UIRc2hgCF0ZFA
         wSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=rndpeHxbj/C4hJGnw+1eeHlSftg7rDiNlHx9DUUhsi4=;
        b=h+3zx3AjeXc1illYTTPox1XvHO7dSxhBCqUl5Ugxww7xfWlhF2KOwFLhjsc7OcnG9l
         ma2LXIUqo+wwo+NMDrTwaZsiyIXczVzSieSwb6ZtkN2aheXt07dG/RLyslCtDWxMHgEa
         jXWFoqrVjqizdH+NZoQeQzhIeFnhvv3ML2IS8ISID0aHW4fOlj8O0o8X909Qp+FjKr6S
         qGz66nuiBdV3aaAW0p4aRE21ksszCW2B693DWk41StHLkRVutDv7Vmq4iefUXlBduJJa
         8IxpnX3AJbUbw1c/4IkrdIHYNJOVXrYKwA7Ody6eqV6t+wnuPqL8BtZ2JnRUqasBNBW0
         xK5A==
X-Gm-Message-State: APjAAAXUl9A05Bg2kiY1GJf9qgDdabbASWwyddTUWTbiyJ6y3vi/zzTS
	dwZFRFashwLodknFTckDbufT8wAv0sU=
X-Google-Smtp-Source: APXvYqzakeii9HBttyGDQRJTQdroyE9HlIG2xOy74QGnsDrejzKqXTyH/Yu3FE2tDAlOvlHnxstEgA==
X-Received: by 2002:a17:90a:b28c:: with SMTP id c12mr5739070pjr.22.1573683195848;
        Wed, 13 Nov 2019 14:13:15 -0800 (PST)
Return-Path: <joel.stan@gmail.com>
Received: from voyager.lan ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id w69sm5252005pfc.164.2019.11.13.14.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 14:13:15 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 1/4] aspeed/sdmc: Make ast2600 default 1G
Date: Thu, 14 Nov 2019 08:42:58 +1030
Message-Id: <20191113221301.8768-2-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191113221301.8768-1-joel@jms.id.au>
References: <20191113221301.8768-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7gkpiuj4Zlco

Most boards have this much.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/misc/aspeed_sdmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index f3a63a2e01db..2df3244b53c8 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -208,10 +208,10 @@ static int ast2600_rambits(AspeedSDMCState *s)
     }
 
     /* use a common default */
-    warn_report("Invalid RAM size 0x%" PRIx64 ". Using default 512M",
+    warn_report("Invalid RAM size 0x%" PRIx64 ". Using default 1024M",
                 s->ram_size);
-    s->ram_size = 512 << 20;
-    return ASPEED_SDMC_AST2600_512MB;
+    s->ram_size = 1024 << 20;
+    return ASPEED_SDMC_AST2600_1024MB;
 }
 
 static void aspeed_sdmc_reset(DeviceState *dev)
-- 
2.24.0
