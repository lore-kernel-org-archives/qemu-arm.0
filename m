Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp848985wrg;
        Fri, 21 Jun 2019 09:34:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyLfpI/z6ke86Pp/eI3Yljg6UqjdWBoSqleuIRGZ6r1dpWwDB2LgogIdOCvq7ijgcM7iVZU
X-Received: by 2002:ac8:6b95:: with SMTP id z21mr114905809qts.337.1561134891582;
        Fri, 21 Jun 2019 09:34:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561134891; cv=none;
        d=google.com; s=arc-20160816;
        b=TGw2K8QUcvtRxl7yvn5+JBJMwuoSUb8Mr9l0wcwjbcrFLm96Lm1H1lGe0ijYmqM3u5
         S3w9DmxbRKoCMY3QcHXBgYBWsY3rTQKMN4QHPAgvG2gWQB9p48WSH232ROK5TmBRGaWm
         qbhwjNVFrz+orQjGnxste7bzVrOwtsBb+NYIQs+2wBkqJ3DyFLbuhXyhQIuVKLDAGtgi
         g2mkNArsxJP6fXJmjybOo7f2bbFpOykP5lnq6tAsmiSCpaEyFiRjbl749I112ofO7vH1
         oXp7mkS2RWu5gPFeSFqDOlpklR1cXPKicAjqNtzxR6zDfM1KvG0JTFnj5ZL1o9DhgpWT
         c9FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=LDOEBtvaPs1TXUNyRYeG2FGjHyCMwQ2zEiPO9Pit8jM=;
        b=er8Eq6WPf78h7YFmy7HeMCKjxeUa9tbF0Xp4n7HSNzp3qeVwAsw8ck1TMubmouu0NK
         zqgfRuTJWyUVotD7YiNd5PoOaJTlwqzFeGYrMNxqpCQqoOeFm45HaFHfChx2T+S1n2Pw
         R7IZd57zerEM3oomzbok6XFtKFE66gZyUIyPUY1tBxL+ajMUFhtBgMRMsIJQyuyIRYq4
         +XfUw85nJl8hBjmWZh4Ogx0l9wblIIqWgTZCl3yD9Mct4egEHZLv6rCNdF18t2bJfdTJ
         aoV3r0k44hQV6W84/95Hwlt6YtWcJl4UUZrp1NbFrl7bSjWF1ejtTMBik+vWkrj8ctwl
         Y0RQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id n2si2035268qkg.267.2019.06.21.09.34.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 09:34:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5A4BE81F33;
	Fri, 21 Jun 2019 16:34:50 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D8AC61001E73;
	Fri, 21 Jun 2019 16:34:43 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	armbru@redhat.com,
	eblake@redhat.com,
	Dave.Martin@arm.com,
	eric.auger@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v2 05/14] target/arm/helper: zcr: Add build bug next to value range assumption
Date: Fri, 21 Jun 2019 18:34:13 +0200
Message-Id: <20190621163422.6127-6-drjones@redhat.com>
In-Reply-To: <20190621163422.6127-1-drjones@redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Fri, 21 Jun 2019 16:34:50 +0000 (UTC)
X-TUID: v3rPPqx6XUEA

Suggested-by: Dave Martin <Dave.Martin@arm.com>
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index df4276f5f6ca..edba94004e0b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5319,6 +5319,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     int new_len;
 
     /* Bits other than [3:0] are RAZ/WI.  */
+    QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
     raw_write(env, ri, value & 0xf);
 
     /*
-- 
2.20.1
