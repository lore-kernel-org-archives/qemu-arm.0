Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp584331lfc;
        Tue, 19 Nov 2019 06:13:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqzE9qA3xEcrqBt3NYpIMtLgwhtB26w3ztqVUrTeMciKtv8JQ0MzlDim1StP+4X98Xw+llTN
X-Received: by 2002:a1c:2dd0:: with SMTP id t199mr5783442wmt.58.1574172797301;
        Tue, 19 Nov 2019 06:13:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574172793; cv=none;
        d=google.com; s=arc-20160816;
        b=0qiHIckOnP+43lwdEaHSvhoksKhGYq/h3wtPB9Lc5ZjZ2dl6D0YqKj+gIHoOCYYi9w
         4IIyvpNzmFXHWgikONfUAvX9XOabfYHloM26/hnuN0ZQ7QBkQtSfVc4QZU/T3N9GI2z/
         QllCVvhX6sho1KwHJHATTPTSIpoyhN0zpXqKme8dvnrgErFaRBvhC8d7MSCiayKR/yyy
         Lq6WTAt9GC0LHIknhXAMnt22xEEZL9BJLtnszTb0biSeo44lrJ9zJfNZCrV9zZkmIL56
         ztWOIF4WUecngfPLVo9+iDuyuDTy5XUBbkYFbQCaQvL0c8dZ/OPoBz178jvAYilX6WYm
         GFkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=cTCnA7/38KB8rTXgzDMyOp0f7WQjwzsZmIJQfcA0nIM=;
        b=rC/+/eU+5flLqLzgiRTJk6N1qqZOhQjQHsrpmxB0JCAk9pJnI15YishuNBuXcqoytC
         ZJfC0dvqcJfSlcZ8UpqpI4gfgSRd2/Gi0TwtMkztQOOpQUHRJjG0ALMiubzHmJ4xtIUP
         B0w5piVwONiuYcbn8p63QOFTh6alg6dVFv8SUTPVTbnuI1rOD0Rii/TlVgHRUnsWyT6Y
         nyALJi10XZIX4zPHtktmrr0B8Sjq71O6TasRFuYZninYZMUokpk0lHpZSNVbccV2K7yK
         puUqWfUeySD8s/wuPZ00nL+pYqr8r9c17KBA+jBE9bgML3p/Cu50hr5mbcWd1NGIcFs7
         kgtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 178.32.108.172 as permitted sender) smtp.mailfrom=clg@kaod.org
Return-Path: <clg@kaod.org>
Received: from 9.mo1.mail-out.ovh.net (9.mo1.mail-out.ovh.net. [178.32.108.172])
        by mx.google.com with ESMTPS id i6si3006981wml.80.2019.11.19.06.13.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Nov 2019 06:13:13 -0800 (PST)
Received-SPF: pass (google.com: domain of clg@kaod.org designates 178.32.108.172 as permitted sender) client-ip=178.32.108.172;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 178.32.108.172 as permitted sender) smtp.mailfrom=clg@kaod.org
Received: from player795.ha.ovh.net (unknown [10.108.35.131])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id D6BAC19BE35
	for <alex.bennee@linaro.org>; Tue, 19 Nov 2019 15:13:12 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
	(Authenticated sender: clg@kaod.org)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id EEE2AC18AA3E;
	Tue, 19 Nov 2019 14:13:03 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	Joel Stanley <joel@jms.id.au>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 06/17] aspeed/sdmc: Make ast2600 default 1G
Date: Tue, 19 Nov 2019 15:12:00 +0100
Message-Id: <20191119141211.25716-7-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191119141211.25716-1-clg@kaod.org>
References: <20191119141211.25716-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17904060320515590929
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudegkedgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpudelhedrvdduvddrvdelrdduieeinecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhgnecuvehluhhsthgvrhfuihiivgepud
X-TUID: RRNo+231Xd2+

From: Joel Stanley <joel@jms.id.au>

Most boards have this much.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
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
2.21.0
