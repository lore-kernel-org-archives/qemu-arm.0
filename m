Received: by 10.223.159.74 with SMTP id f10csp5601560wrg;
        Thu, 7 Dec 2017 10:15:24 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYJGqdeitmm6a8uRLaUHjti7DosJSdTlXvi8Z8cMl4aQaCvKaxQcmxzT7f0dLghtNiKNFuD
X-Received: by 10.129.160.213 with SMTP id x204mr19606924ywg.498.1512670524224;
        Thu, 07 Dec 2017 10:15:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512670524; cv=none;
        d=google.com; s=arc-20160816;
        b=WR0AhxDYOu5xrJfRlbVYnaTMnZQt3Mk7F1TYkU+243SuJw96wi43356gn5aChNqaXn
         CwXXr7iw4VkOZ6fT0h74urTFX9z+xfeGEJDqXcxS/KFObA03BHY+a9iOp/kImoe7blaP
         Xi+LXA8I9p0uDG8bK3JyvRkhmCT/6uGqJOl1ikt0+2w5Vo+AQq1T8D/7VhdVQ7LAtBpF
         ccg6WzeAOzwgVYrDxpXClB7OIBe+peoUvo6krrTULtIcWMVeMOjQNKeRLykJZUJBJ4N8
         6O60E06ZLXbVqF5/WtQCiHgruAyMDuyOOQ4EhBTnA9JSyFW24Q9YOHjXehm6dMs+mWnH
         Dk0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=F0Add09HWDw8QjTIXh0KfJzQVLkGkQgYSsIZGSDfKME=;
        b=ZgSqLDLKl8qu8XndVFQQtbz6MwNFIog9CmhVDg0RUmmP4mO7rZwvOGeq0n3byGeQko
         a0ejAuePrbNmG6c+m8NczcVgxbeavbbnfQm+mi7DSWlFjZ8oLEwDxeLFdWxRvWrNck3v
         UAQecMHahycm7UuGcjdD+b3I19FKAz9Wz1OjSZvdl9tuU//glq4ffa4UF/eZU6JT5NhK
         wlaUh/pzMAi0+JPQ4Qt4sfCywBbk+7+568fwrCoHzx06UW9FXtxfWjPjy/urW5x0Pwup
         qav/F8RC3gMxApIrzHCzT/rtsRwQjGsOjdCXwrq9IH7YwvRIWgj3qX9DL++dK6ChU7pn
         lchg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d185si1254894ywf.197.2017.12.07.10.15.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Dec 2017 10:15:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33724 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eN0hf-0008Pw-JH
	for alex.bennee@linaro.org; Thu, 07 Dec 2017 13:15:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eN0hI-0008FB-Th
	for qemu-arm@nongnu.org; Thu, 07 Dec 2017 13:15:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eN0hI-0006mW-62
	for qemu-arm@nongnu.org; Thu, 07 Dec 2017 13:15:00 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:38888)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eN0hH-0006li-Vq; Thu, 07 Dec 2017 13:15:00 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eN0hF-00082d-RZ; Thu, 07 Dec 2017 18:14:57 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  7 Dec 2017 18:14:52 +0000
Message-Id: <1512670493-18114-6-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
References: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 5/6] hw/arm/virt: Add "max" to the list of CPU
 types "virt" supports
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Richard W . M . Jones" <rjones@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zdPWqJTF70CU

Allow the virt board to support '-cpu max' in the same way
it already handles '-cpu host'.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 62af013..92bd776 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -167,6 +167,7 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("host"),
+    ARM_CPU_TYPE_NAME("max"),
 };
 
 static bool cpu_type_valid(const char *cpu)
-- 
2.7.4

