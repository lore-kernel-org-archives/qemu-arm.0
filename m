Received: by 10.25.85.209 with SMTP id j200csp826257lfb;
        Sun, 12 Jun 2016 08:52:00 -0700 (PDT)
X-Received: by 10.200.43.195 with SMTP id n3mr10596940qtn.72.1465746720151;
        Sun, 12 Jun 2016 08:52:00 -0700 (PDT)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 54si12454935qtt.23.2016.06.12.08.51.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Jun 2016 08:52:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 292216DDB1;
	Sun, 12 Jun 2016 15:51:59 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u5CFpu6V014651;
	Sun, 12 Jun 2016 11:51:57 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, wei@redhat.com
Subject: [PATCH v2 0/4] create the mach-virt 2.7 machine type
Date: Sun, 12 Jun 2016 17:51:49 +0200
Message-Id: <1465746713-30414-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Sun, 12 Jun 2016 15:51:59 +0000 (UTC)
X-TUID: W/i4n6I0kk1L

v2:
 - drop 'is_default' setting [Peter]
 - fix checkpatch warning [Peter]
 - add a couple R-b's

This is the first new machine type mach-virt has received
(2.6 being the first versioned machine type), so we need to
do a bit more than the average "new machine type" patch.
The first four patches prepare for easy-adding of machine
types. The last patch adds the 2.7 type.


Andrew Jones (4):
  hw/arm/virt: separate versioned type-init code
  hw/arm/virt: introduce DEFINE_VIRT_MACHINE
  hw/arm/virt: introduce DEFINE_VIRT_MACHINE_AS_LATEST
  hw/arm/virt: create the 2.7 machine type

 hw/arm/virt.c | 66 ++++++++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 50 insertions(+), 16 deletions(-)

-- 
2.4.11
