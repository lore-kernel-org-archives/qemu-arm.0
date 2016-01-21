Received: by 10.25.159.19 with SMTP id i19csp3654525lfe;
        Thu, 21 Jan 2016 03:19:00 -0800 (PST)
X-Received: by 10.60.39.136 with SMTP id p8mr27592948oek.81.1453375140455;
        Thu, 21 Jan 2016 03:19:00 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-ob0-x243.google.com (mail-ob0-x243.google.com. [2607:f8b0:4003:c01::243])
        by mx.google.com with ESMTPS id u132si703685oif.139.2016.01.21.03.19.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Jan 2016 03:19:00 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c01::243 as permitted sender) client-ip=2607:f8b0:4003:c01::243;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c01::243 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-ob0-x243.google.com with SMTP id oj9so2481060obc.0;
        Thu, 21 Jan 2016 03:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-type:content-transfer-encoding;
        bh=1REl11RSjNFPLmCelV3StMMHfBl2ELyKWREuny76YIY=;
        b=KD4g8M7JXl/EOoAeIQr1r+wwLY1SZldutUuS35FqQS9BY48BYaKxDwaZW6ps7UAT5b
         CY9TcyJj295jeJhMsziIoj4zP9ImaKdjxaiG58N8QTqTeO3esbJkDjIHdDqyKuRG39IF
         545f5nvW0vIqHKj/yDLmdb/EorY92tKT0QQOKvwT6kgRRrcs1wC1DSI0i2vM/OQKDj15
         Zp2UhZeyapuF7yQgrpgbafDlPnj/ycXODDWesYmmiUoVW0q6uSfRUxpJIm/zC6Sa67Oe
         nk6O/ah6P2Re7GmJgh4VKtKkofnW5MS1zvFJ5RNJON40RKE6ShTI+0VhE+ONplzVzEjb
         XqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-type:content-transfer-encoding;
        bh=1REl11RSjNFPLmCelV3StMMHfBl2ELyKWREuny76YIY=;
        b=lnIsNG5Ng6g1Dj+ttzeaD1o6jj3F5Ua4KKgoCXUffX3Re5HdBtvkC7Ft7YHHlGb44Y
         ZQsrOP4+HOrRXamYYHRkslzFYquzjQ2b33kYGENkBLGbMDD9++tEa20gr4eO41ti5Rzu
         bKeyRksmextD3raV+iaHOa76eJ9fnLV1nbR6BEtOUZauLrg62FANcXEnegFHQtov6K9c
         FCpezpxtzt1HVOXu6QTC9+Fcx+5/ejI8VClaf3r0S/+57bLaMMT1pnGMtfLbPTkV1TON
         NqyyNsSAjqDQSEfWh7gX7uVXfsdjysNd7AeI4iiC7AacC/ZtnKgbtXsz9K+UrtuBpI3i
         E83A==
X-Gm-Message-State: ALoCoQk/awWp0yNelUQc4mMfy+jZpoVM9dE49e6kJuSstSivejUVgrKQIa7R4iZPnWbXjXS/Dcgnvx34OpZu3gOmmiUlD2Hr+w==
X-Received: by 10.60.117.65 with SMTP id kc1mr33228373oeb.32.1453375140160;
        Thu, 21 Jan 2016 03:19:00 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id v142sm296804oie.28.2016.01.21.03.18.58
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jan 2016 03:18:59 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v2 1/3] target-arm: Apply S2 MMU startlevel table size check to AArch64
Date: Thu, 21 Jan 2016 12:18:26 +0100
Message-Id: <1453375108-25229-2-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453375108-25229-1-git-send-email-edgar.iglesias@gmail.com>
References: <1453375108-25229-1-git-send-email-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5Dd4/ejjhbdJ

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

The S2 starting level table size check applies to both AArch32
and AArch64. Move it to common code.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/helper.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index f956b67..8aedce9 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -6581,11 +6581,19 @@ typedef enum {
 static bool check_s2_startlevel(ARMCPU *cpu, bool is_aa64, int level,
                                 int inputsize, int stride)
 {
+    const int grainsize = stride + 3;
+    int startsizecheck;
+
     /* Negative levels are never allowed.  */
     if (level < 0) {
         return false;
     }
 
+    startsizecheck = inputsize - ((3 - level) * stride + grainsize);
+    if (startsizecheck < 1 || startsizecheck > stride + 4) {
+        return false;
+    }
+
     if (is_aa64) {
         unsigned int pamax = arm_pamax(cpu);
 
@@ -6609,20 +6617,12 @@ static bool check_s2_startlevel(ARMCPU *cpu, bool is_aa64, int level,
             g_assert_not_reached();
         }
     } else {
-        const int grainsize = stride + 3;
-        int startsizecheck;
-
         /* AArch32 only supports 4KB pages. Assert on that.  */
         assert(stride == 9);
 
         if (level == 0) {
             return false;
         }
-
-        startsizecheck = inputsize - ((3 - level) * stride + grainsize);
-        if (startsizecheck < 1 || startsizecheck > stride + 4) {
-            return false;
-        }
     }
     return true;
 }
-- 
1.9.1
