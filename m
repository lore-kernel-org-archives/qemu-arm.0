Received: by 10.25.159.19 with SMTP id i19csp62602lfe;
        Fri, 22 Jan 2016 01:51:03 -0800 (PST)
X-Received: by 10.202.224.10 with SMTP id x10mr1357102oig.48.1453456263043;
        Fri, 22 Jan 2016 01:51:03 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com. [2607:f8b0:4003:c06::243])
        by mx.google.com with ESMTPS id pv10si5086937obb.80.2016.01.22.01.51.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Jan 2016 01:51:03 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c06::243 as permitted sender) client-ip=2607:f8b0:4003:c06::243;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c06::243 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-oi0-x243.google.com with SMTP id e195so3577233oig.2;
        Fri, 22 Jan 2016 01:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=HB53Xl9ouDUwYO4NCz4d6dPUF8B+1Spmeu4RLpeUZAU=;
        b=pDZCnPzk8i6VL6cK5EULAl9eisgP5GZ2Rt2NUI5IDxtuVl8ZT6pBJDjUzA3IlBccZ1
         4hnvpqFxlB58ydVU8wj7qgS3tr/tCX4egLSw+tInf0jpK2u1kCEMqV8RIy1ejoQCm1Ot
         /9mhDVk1Nm4VoFFIV2RhZk6EqJXKgn/D5jFGPVYs1Xu6Dsn0wfoBQiTRUvH5Mkmkw6Bz
         N2W+an7LkGoeqGSRcALdaIFIDkHJ2qM2Ssg9vbRKFETDe0ZxhGFF10YCcL/0DYTH4EBu
         RhVGkzCYh4kVpdhYDl2u85LPEfFDLJfiGW84y3GfjhKxKzKexHovqJB8iYXa7JK1LFCE
         lxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HB53Xl9ouDUwYO4NCz4d6dPUF8B+1Spmeu4RLpeUZAU=;
        b=AIQdeAWZ2qc53Ze6RC5emBCbBM803TKw4lBd1T423Ek5bGthIbTNccxwq00WpW0nYv
         4smGKrEOajff2TwHTBMtsU8eOljKLaZCvO3SuW7yZjD8ABo9TFOaudTgEs967hK1xkGn
         R6u3XEthVc1fS3kv9zuPPJnX/Bhn9O/7wFPuqCDcylwmepzu1/wCKgzVx3+acGEcO+3t
         ANqBAJ0hIrY67CLriHD4tdU7Q8otVn7lJ8vYpm8KLNI3beAJ5X5IKTntu+MhCAvxSUfU
         mX3UG1oGxprikbkhM7sQVyJg1B1Wso/rxDe3Z2octxK5xThyWXejdNY2b1FxebpX+e/9
         gL+w==
X-Gm-Message-State: AG10YORlHaBAemTN7K2LqfouoJxeLaviF35RUjMBvIYbI6uuR0hmwNer6O9/IcrXMynOGw==
X-Received: by 10.202.73.213 with SMTP id w204mr1584345oia.0.1453456262588;
        Fri, 22 Jan 2016 01:51:02 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id e65sm2737769oif.15.2016.01.22.01.51.00
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jan 2016 01:51:01 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v3 0/3] target-arm: Add a few more S2 MMU input checks
Date: Fri, 22 Jan 2016 10:50:40 +0100
Message-Id: <1453456243-19879-1-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
X-TUID: OAkI0j0ruj/u

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

This adds the inputsize > pamax check and also fixes the
startlevel checks to apply to the 64bit translations.

Comments welcome!

Cheers,
Edgar

ChangeLog:
v2 -> v3:
* Document pamax arg to check_s2_startlevel

v1 -> v2:
* inputsize > pmax check only applies to AArch64
* Fix commit message typo < should be >

Edgar E. Iglesias (3):
  target-arm: Apply S2 MMU startlevel table size check to AArch64
  target-arm: Make pamax an argument to check_s2_startlevel
  target-arm: Implement the S2 MMU inputsize > pamax check

 target-arm/helper.c | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

-- 
1.9.1
