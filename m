Received: by 10.28.4.212 with SMTP id 203csp723549wme;
        Fri, 20 Apr 2018 05:48:50 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoGKjljL9kSYvYhLTB1vqBc+cAxmBTY6y21XhdSg2JG/HBu2UgPuX4rFwmfnC5yYv476SQu
X-Received: by 10.55.94.129 with SMTP id s123mr10436379qkb.5.1524228530379;
        Fri, 20 Apr 2018 05:48:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524228530; cv=none;
        d=google.com; s=arc-20160816;
        b=MCp/c0QQqiANz06kqU6RnJB7rLfzv0iUpftFUk5VzeHx9vbiYV6A82chT4ZdLy5Zgg
         tOmZRABOnb6PAh7I9SHP4UCpchdBMJD7QFaNDA3aNhOlwkWFu5Po/nUtGJJSlgHhkGQk
         L3RscAkYgRNyNw+GdyTk8rbWw364B22poHcOw0k1J5UWzNpVQ2pQ+n5CKzO2tBIcOQI9
         WwmoaFODk2QpcGIV8ihZJlWrD/sdT0EBXY+dUkc4P6eBv3EbDMYu3x4ypE7coxjXTKJX
         yQ4ql2IVyRfemGFd3EpKy6sEHZhACk3QV9+9hnXKLDHn4XGCqzzfekCL5BQkzGfbouwK
         pt2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=LrsRadDR4NpPysOCMA9dptuvaj/Pavo0WJXYucwhLeU=;
        b=CNQ+dlJr/cLG8wsxvlVe0wlJ4PscYApn6FGgrxIO5xGUdTzTQwouLowsDyyuakcGTv
         /2887ZWAIhcRMm98Jovb+ygWarLYZ1Lv2P7kGn11wfBJ7w2nAUSRh6M59ldoVoB8tc8n
         u4VgRECGffKtJwymsld63C9To7BXCDeh4IEb/8OxkG5htXmIdJ6gfBHvYPljZzEzAnwF
         Hvffp7Km3isr9vs5g23TuEFEJ9UMQpGSy6R7e+F5YABgkwoaHKosg/zGrruhSpA0W8E6
         gPYL8M/d4jyxRxwyl3kjWIs3OInpcE6SyaUd89twkPs1qtGXFUlt7TzRekEy21qauTGf
         adQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h184si3051400qkd.325.2018.04.20.05.48.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Apr 2018 05:48:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54562 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f9VT7-0007VL-To
	for alex.bennee@linaro.org; Fri, 20 Apr 2018 08:48:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1f9VSz-0007Uz-3M
	for qemu-arm@nongnu.org; Fri, 20 Apr 2018 08:48:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1f9VSy-0007su-AU
	for qemu-arm@nongnu.org; Fri, 20 Apr 2018 08:48:41 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:40952)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1f9VSy-0007rm-3z; Fri, 20 Apr 2018 08:48:40 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1f9VSv-0004mZ-AI; Fri, 20 Apr 2018 13:48:37 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 20 Apr 2018 13:48:33 +0100
Message-Id: <20180420124835.7268-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180420124835.7268-1-peter.maydell@linaro.org>
References: <20180420124835.7268-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 1/3] hw/arm/highbank: don't make sysram
 'nomigrate'
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
Cc: Rob Herring <robh@kernel.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G5CGz7vO46QR

Currently we use memory_region_init_ram_nomigrate() to create
the "highbank.sysram" memory region, and we don't manually
register it with vmstate_register_ram(). This currently
means that its contents are migrated but as a ram block
whose name is the empty string; in future it may mean they
are not migrated at all. Use memory_region_init_ram() instead.

Note that this is a cross-version migration compatibility
break for the "highbank" and "midway" machines.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/highbank.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index 1742cf6f6c..88326d1bfd 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -291,7 +291,7 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
     memory_region_add_subregion(sysmem, 0, dram);
 
     sysram = g_new(MemoryRegion, 1);
-    memory_region_init_ram_nomigrate(sysram, NULL, "highbank.sysram", 0x8000,
+    memory_region_init_ram(sysram, NULL, "highbank.sysram", 0x8000,
                            &error_fatal);
     memory_region_add_subregion(sysmem, 0xfff88000, sysram);
     if (bios_name != NULL) {
-- 
2.17.0

