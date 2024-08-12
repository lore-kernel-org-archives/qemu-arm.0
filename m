Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp768332njh;
        Mon, 12 Aug 2024 06:06:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWAzljqQX+2vZ2K3mJsd0feEba2HmbyjKIWUBsmvhjUCvr8R//nhq1EPRszgL3SyBhzK0waUFvYLRy4Qw==@linaro.org
X-Received: by 2002:a05:6512:3e1c:b0:52f:cf2d:a1a0 with SMTP id 2adb3069b0e04-532136cabebmr7989e87.26.1723467981955;
        Mon, 12 Aug 2024 06:06:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723467981; cv=none;
        d=google.com; s=arc-20160816;
        b=bsxm6U/5oYRM1PI9co/ZN7W/zsQ4autA8WVQclCVI07T78pgPKjl86DevQQf41B+Da
         VFyMDkIy3JqRpHvXOUmLkwUOyftjKixsyAKKcs5ajf4q/JM/m+RTpQmvKnJ5YHxWx/72
         coPGLFCG3i9ioPMWbT8WLCLklG+jLh3JpCIfD97hfRhcaYpwpHeS44DZo9SnpuYFoKYD
         HWpvPMg8rOcP3UrqTTl//DvYh1wlBu/FDAA7i95PzpIr1CQLoebhHV4xEpVdRCYK9/OO
         eoFBVOnnC3h9lJX+L5k5AGILcsH6ucbCWyrGRiqnFXGx5lzAzm7LtAgcrmHHVnRSruTl
         GuqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kOLz6jSGUU8Xiq4wmRd5lgikGGH6JiIyvQ0oMaht6JA=;
        fh=cJ1FfWftaJ8Vhx7AE/TvUAS8aMOi7x1xhMBhgDF37F8=;
        b=S4XqOnx38W/yfcFQtV3FDQEm5s3yMFZycisEuW8YbQ4/s1zlqsKyfvFq/f6ZLBO0+t
         Rcz5FPnC9luCy7CNRacDSYv/MzRmdyH9BeX4cx2eD1X/uCrHgpiyu2R1n+JsXnL0ZWXN
         DBARGwyBsqPzap/x/67mc4/03Yvsl8ooTHo9uWVN3L9dq8derRlMtih/bR3kN5oXa94U
         RFuoM/Xva8O0jHdnJbhycoj/hpB0WLig8o+VqkYIDVka0o4YXxlz6M9102nO5rtwGXez
         OfajUdJJhTn7e9KDlKJ1u5d6zpUWUz1hzBecFa+lF1bcCriJaUGB9ytBrjhW9ncKcnlg
         pyjw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=bvS38svt;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-532004c3afcsor665879e87.2.2024.08.12.06.06.21
        (Google Transport Security);
        Mon, 12 Aug 2024 06:06:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=bvS38svt;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723467981; x=1724072781; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOLz6jSGUU8Xiq4wmRd5lgikGGH6JiIyvQ0oMaht6JA=;
        b=bvS38svtD7g56BtIfwHYRanlSEV/YD85kNOiBB5zLoKrWZoUlkD+fEzEPljoxnpEGc
         3GRh1L1ZP0sZNC+yZHczmfAO/5T/EYxjK9Pp1VUuCNW/7BxquWf1HVfo4WYHYKJtRfQ0
         eiqUa2857qFk0NscRQkDmwSgIkDyO1bkGWpuGTqh33SptzXVUUJD9jALbYFaCsSPL5pg
         1UqpTVNcNiksTtt0TwZlyTfRhljhK+qva4byXuLoB5soAGYZIp/SQ/qgwKAU8ySp9y4x
         dQkxYKfJGIn+JXYXnfyuBHu/3+EF5g6pDkiurYWzOoWqn4bgpIlbGB6SyXkRhYbb/VfM
         yAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723467981; x=1724072781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kOLz6jSGUU8Xiq4wmRd5lgikGGH6JiIyvQ0oMaht6JA=;
        b=FcefZiGmzPMzudliTX/c75ja+xNn1rtgQSeMnOugW3yMeFYA94Gpn75ELRdyStf5O5
         ppri31HR7D4AWZ/ePEj7MbaIO5EyZ2CyeEFAAvMCMG6ZB3eyWUPKxQQJ0J6aklA2TZmN
         NCaKX/KECOaj9NeoZg0SvTubILZBABb6Bl4LtpyGG2uOzvyoZikLieDYwVbWX+CoP2CN
         +Y3EtI21d+H/vdW+Opbul43ZsLOVGkdSf4WvNej9uhLsrN0qCpQV0W3BbH90qRQi9LnH
         k/mKxiLOL7a2ljTZsYN5qMkcTcm9uIGrAHh3JYvsaGBLZhBCgBV2yczSDd6/QAAWMT2N
         ps0A==
X-Forwarded-Encrypted: i=1; AJvYcCW11p2wh7h6PYo4Czlep11z9FwfsaY+/Vyc/Pux9kTAn28CJHKepnC7TKn/OBpTDF3u4/E1cUiHKX3cFQ==@linaro.org, AJvYcCX2mOhya8T1Uz4wN7odX76RO+snn7+9E/KXaBOzI4RE1T3LRFEr/1UTJMpCBskBx0QDnYiJpZ0pg0B0doBZKw==@linaro.org
X-Gm-Message-State: AOJu0YwhR8d0F9cZ8Q8x+jlVI+1QX/1QCC7xcsHKgtd/6FD+l9iYzrLd
	sDWz8q3Y9/2umEZMLHlvPrkr1sdh2tfupOgSBp+XFWwR5aHZJiwP
X-Google-Smtp-Source: AGHT+IFVFpgUsSJvoRktx9P5RahE3NL+hK1oSSRb0VxLTivi6mQbcvmAYVxkizJenzqOQTjrR9idAw==
X-Received: by 2002:a05:6512:4020:b0:531:5b03:b1f7 with SMTP id 2adb3069b0e04-5321367c4ecmr11696e87.10.1723467980688;
        Mon, 12 Aug 2024 06:06:20 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53200f4227csm730447e87.279.2024.08.12.06.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 06:06:19 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	xenia.ragiadakou@amd.com,
	jason.andryuk@amd.com,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org
Subject: [PATCH v1 03/10] hw/arm: xenpvh: Tweak machine description
Date: Mon, 12 Aug 2024 15:05:58 +0200
Message-ID: <20240812130606.90410-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812130606.90410-1-edgar.iglesias@gmail.com>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Rg/y+0thxEAI

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Tweak machine description to better express that this is
a Xen PVH machine for ARM.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/arm/xen_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index 766a194fa1..5f75cc3779 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -216,7 +216,7 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
 {
 
     MachineClass *mc = MACHINE_CLASS(oc);
-    mc->desc = "Xen Para-virtualized PC";
+    mc->desc = "Xen PVH ARM machine";
     mc->init = xen_arm_init;
     mc->max_cpus = 1;
     mc->default_machine_opts = "accel=xen";
-- 
2.43.0
