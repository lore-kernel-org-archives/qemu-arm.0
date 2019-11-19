Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp584533lfc;
        Tue, 19 Nov 2019 06:13:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqz9PpZeNBZlOAtYIogZ6L1L66AFDkAmOUQPa3MaN0n9SKePnzUGSgKIPujXfGeBBq/BC3gT
X-Received: by 2002:a7b:cf14:: with SMTP id l20mr4136553wmg.172.1574172809477;
        Tue, 19 Nov 2019 06:13:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574172809; cv=none;
        d=google.com; s=arc-20160816;
        b=ehzwOHftvQYCzJx1C3zAsItiFKeTSAf3kcmkBV6deqAYsBY4VdM/h++gUMlcpojtiR
         acJqrIT+yrLszlfZg4FwXowri46M+cCZ/vU2+3HY8Wa0oOeoZKxXud/0erJ4xRnBnrAp
         vKNl2yJy0t0DujMvda9HJHaURtnuVZdw7KzEbTYg34KRnoPzhsiUoA3MADIlwoo7toYZ
         FlAb+7XJCUZcblTPoAEuIxgWUyJBvBkcF/BU2bbxgn8eJ7oM8gbaUOfz0nRzBGvQ4WSS
         6h92T2my3AElyO7KVCE8//fYMNbZnPCLr26WiOrmqaS+KTWZiyQp3C0VpEsrEqYgluuy
         d9Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=p+DYPlCu2PyeHr9Y/FWpHWR6Fu2WYPvj9x3QsGFXZAE=;
        b=c/EQvkvOjpwev7kAb0XfBErBD2thtrHluKvNW2hdx2kku2csdydVt1p/mGJCCeUtmn
         P8XCaGuKxbg7kjpBIu9lWgYkpHxVehhP7qWbgrb8XismDpWkGCNa9mrRSgvOKgETaTdg
         C7tBmz+pRGtNW8iL1auUSIRLG0llLV+th0FGKxKMPrPQcnGdOowV2x5deyt2VwRqpMOB
         6cJkQGx03ThTpPWr4NU/NsGxg4zTXjY2Nl5E0bILgKtJ8C8UrItCv3dxkJFQ+MrDIABg
         ntVNP7nu+5UCFwgQm8esVhACdqtU9J//cBmUIjGNrPxqUSp3I+wAqJfZsCQIBRgPCwIg
         9elQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 46.105.50.32 as permitted sender) smtp.mailfrom=clg@kaod.org
Return-Path: <clg@kaod.org>
Received: from 7.mo69.mail-out.ovh.net (7.mo69.mail-out.ovh.net. [46.105.50.32])
        by mx.google.com with ESMTPS id k3si19591291wrl.211.2019.11.19.06.13.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Nov 2019 06:13:29 -0800 (PST)
Received-SPF: pass (google.com: domain of clg@kaod.org designates 46.105.50.32 as permitted sender) client-ip=46.105.50.32;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 46.105.50.32 as permitted sender) smtp.mailfrom=clg@kaod.org
Received: from player795.ha.ovh.net (unknown [10.109.160.143])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id 21A19727D3
	for <alex.bennee@linaro.org>; Tue, 19 Nov 2019 15:13:29 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
	(Authenticated sender: clg@kaod.org)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id 8EA5CC18AB7F;
	Tue, 19 Nov 2019 14:13:20 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	Joel Stanley <joel@jms.id.au>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 08/17] watchdog/aspeed: Improve watchdog timeout message
Date: Tue, 19 Nov 2019 15:12:02 +0100
Message-Id: <20191119141211.25716-9-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191119141211.25716-1-clg@kaod.org>
References: <20191119141211.25716-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17908845394972281617
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudegkedgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpudelhedrvdduvddrvdelrdduieeinecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhgnecuvehluhhsthgvrhfuihiivgepfe
X-TUID: K+adotcoI+Nv

From: Joel Stanley <joel@jms.id.au>

Users benefit from knowing which watchdog timer has expired. The address
of the watchdog's registers unambiguously indicates which has expired,
so log that.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/watchdog/wdt_aspeed.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 145be6f99ce2..d283d07d6546 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -219,7 +219,8 @@ static void aspeed_wdt_timer_expired(void *dev)
         return;
     }
 
-    qemu_log_mask(CPU_LOG_RESET, "Watchdog timer expired.\n");
+    qemu_log_mask(CPU_LOG_RESET, "Watchdog timer %" HWADDR_PRIx " expired.\n",
+                  s->iomem.addr);
     watchdog_perform_action();
     timer_del(s->timer);
 }
-- 
2.21.0
