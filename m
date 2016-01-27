Received: by 10.25.159.19 with SMTP id i19csp29785lfe;
        Wed, 27 Jan 2016 14:16:40 -0800 (PST)
X-Received: by 10.66.124.200 with SMTP id mk8mr46307144pab.43.1453933000700;
        Wed, 27 Jan 2016 14:16:40 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com. [2607:f8b0:400e:c00::242])
        by mx.google.com with ESMTPS id rx5si12015025pab.151.2016.01.27.14.16.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Jan 2016 14:16:40 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::242 as permitted sender) client-ip=2607:f8b0:400e:c00::242;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::242 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pf0-x242.google.com with SMTP id x125so1032411pfb.0;
        Wed, 27 Jan 2016 14:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=IvXA7xV5M6sKYH/PjToWVWseNcbqA77Ac8bkx6byajA=;
        b=rl1PbTmKuIfCQWSLy0Kxs/JwBh7bGU9XuMQxxMFCF7JsJxqa8WlRILwBWaRpjZImzm
         Ema+tKCE1e2fHsa4cI4lq0VF8T2/cSDAD5Z0KINAb6K8v3sSCHH2UyijK0UHMiTlYIP8
         8dPprigSDKBbmtUrs9dyPkfoibIbvuxR6X22zGyZiT1bi+UwgCHZJ4+rmMm+6aylhl9N
         6BX07qXIKujStU5lhWUSKPDALGLdsiN757kxi5YRP5gyyIKkKxpnXebAn1Yf8f659wf1
         jyZZN14kuBjOdT/hKvBa/8TieGCKb4+gHNh5a3/EazBs9D/e98/Nq17Y9cUYwVMN5N2s
         8VNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=IvXA7xV5M6sKYH/PjToWVWseNcbqA77Ac8bkx6byajA=;
        b=cGGOKvp8DAbrBNeLd9Rf7YZrSKYqoTHZqWtTXZxw8BM+89wFeN3HZawCjbcujvXLeO
         cWpPFZ/5QveecDLcqazDgap+5r2nIxS59LqMijBHvbWB3X6oy7V4t0IEOt0zsG9hMaSY
         tPY6tj0cq4grg17vt0JXGJ91j124iCyClsNSDcNfLKrrMpYqebodH9MdkXy3Yn8fazk6
         91KvDVzPI2YbV6M8IsHUO2IYSPYTwEpcYkLuIkBTV+aOkNBYtKeAnaCtAxaupnph9OUo
         oSOFP7RTo8ZBd2QTu71tlx0F1aSFuUajBssxwyIdXLvl64VqkftoSeOUCmhGcZR25Y0C
         ZUeA==
X-Gm-Message-State: AG10YOStx9IRIg0LDAfCNAgSjKGIyixwCoMpbtW4w8EltdqESNV1OfOZf2gIHh6QHCUFKQ==
X-Received: by 10.98.14.81 with SMTP id w78mr46383825pfi.26.1453933000269;
        Wed, 27 Jan 2016 14:16:40 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id by2sm11306965pab.6.2016.01.27.14.16.38
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jan 2016 14:16:39 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v4 0/3] target-arm: Add a few more S2 MMU input checks
Date: Wed, 27 Jan 2016 23:16:07 +0100
Message-Id: <1453932970-14576-1-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
X-TUID: rGZtF05AW+Jm

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

This adds the inputsize > pamax check and also fixes the
startlevel checks to apply to the 64bit translations.

Comments welcome!

Cheers,
Edgar

ChangeLog:

v3 -> v4:
* Changed comment regarding our choice to fault
* Rename check_s2_startlevel to check_s2_mmu_setup
* Move inputsize check to check_s2_mmu_setup

v2 -> v3:
* Document pamax arg to check_s2_startlevel

v1 -> v2:
* inputsize > pmax check only applies to AArch64
* Fix commit message typo < should be >

Edgar E. Iglesias (3):
  target-arm: Apply S2 MMU startlevel table size check to AArch64
  target-arm: Rename check_s2_startlevel to check_s2_mmu_setup
  target-arm: Implement the S2 MMU inputsize > pamax check

 target-arm/helper.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

-- 
1.9.1
