Received: by 10.223.161.27 with SMTP id o27csp2035172wro;
        Sun, 29 Oct 2017 20:28:09 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+ScY0FizqKuPM9urRgoYd/zAM3ysO3eSazWiRKgP/z5V1HxKExeyTt43dY2Ue6ofnoZ36pW
X-Received: by 10.13.233.197 with SMTP id s188mr5512571ywe.23.1509334089144;
        Sun, 29 Oct 2017 20:28:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509334089; cv=none;
        d=google.com; s=arc-20160816;
        b=ggeYtbtzydAEHLLTcjfW0uenxEMawB2T9cEQu4Q05cKkVnXLaKhdTYA6ASZYKiF864
         JHMgo8ZQIYhRGDJsllcpcTpQmDKSoum7OsRYmxQ03HqrPhDISWaoij2mfJ7g7IzfERQd
         hcoD0xCGrzxZJqcu0SBg5GvAcXjZuIOC1UtlaDeOq8k9385pSEQ82SCSwYgXSgCtoLRi
         LIx9/ScBQHd23yApK1cXUgtsPes7/2Kf3QFoPQdgN2+mqOh6Jm34n2RynVx/NGNYoXM9
         U4/52SXreTRTE32t66tISKTdaQL/9hvOGZ7U2Ug4PqawoONPuIloHGAhp+kpxFnsuY5c
         OnxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ER91t1vzbUDyVUMOrThVbEm3Hp+lOinvah4b2Yu0Kyo=;
        b=HcGbrgV0KVp7D7VulavOUHwXXYV8QbkDlGVoWlyTNQpuaZXvfqCwbm9ct+TWAuXfwh
         Ios5ZI/uJm1zuO9UXVx+HIvwiKBSECxkVRuParT9ihMupAtUuNvpjz4w+klpCbhmdph+
         2XUtuvfFjAX7zdIpBS3e95o69ay+cUckqDNWVMg5Gr4aBcE7uqg2+oOAfjSZVV+YibGB
         MA3dngEfrK96T3kOhi1IEcYNl46Z+EfsF84AUKHwlkU80JKpKhD9K4HgTBnH4WvAWnYA
         fQ7AIFTmVWJxbPa/Yd4YvwuqFltCPQOLCc9k56MLR6iN1+eee5eSiNEPh3UcXzZhyTAp
         JZXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=E76AbaWD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j133si2359018ywc.257.2017.10.29.20.28.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 29 Oct 2017 20:28:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=E76AbaWD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38516 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e90kC-0001RN-Kl
	for alex.bennee@linaro.org; Sun, 29 Oct 2017 23:28:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36232)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e90jK-00019v-T8
	for qemu-devel@nongnu.org; Sun, 29 Oct 2017 23:27:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e90jH-0004ik-Pw
	for qemu-devel@nongnu.org; Sun, 29 Oct 2017 23:27:14 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:47863)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e90jH-0004iJ-KY; Sun, 29 Oct 2017 23:27:11 -0400
Received: by mail-qt0-x243.google.com with SMTP id z50so14757758qtj.4;
	Sun, 29 Oct 2017 20:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ER91t1vzbUDyVUMOrThVbEm3Hp+lOinvah4b2Yu0Kyo=;
	b=E76AbaWDn7KDQA/8fIrQvqx9Iw+ZDLajHjWkiqMTzYnw+ZXYbp1TwsG4S3/lMVueBY
	jhd9609fdRqetXFQjLofVAy8Fj8DN3KgxJjDJ008HIkb/a6Jnr8r7cK8FmAv3HSamY/K
	JPS1PDaqK7aolFnk+xjWxQDLL0H1sns/Tx4QiZZRDKX9+ECPfS+UUJUcZZWv7TWTyWM0
	1AbIbur4Z5C3lLJ6CzTh1UXdR3tiT3dw7rXVVg97gmqcWgQ2+7KGufVm306d7drNMj/K
	+BiILyoLgGm7h2PofThL87BHq3gKsZqLsi2QejmpLXj0vq1Im1gdbe2V/zkQ6vC1OQHp
	6ftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ER91t1vzbUDyVUMOrThVbEm3Hp+lOinvah4b2Yu0Kyo=;
	b=ZSlEcDfXZ3Kz0VbRK8/GCwH4FXPHckKLQz3DVDgbdI7gvayTVBivlRKDpxkV24TD5D
	N3yDzFtlLkJozyd+seZh6kwMvVkaXxXt/c32WD5+/J0g+WHKaQM3jP9p/Tzj+KEuJ5yx
	noqchLrbm2dLQRNiHMXQq6ncS35DDkRtbc5VcI8BmXZTobo3aixD/lQ2jrZ/TY1hABDD
	/CZ96fe1fvI4ZtUHHcNnaP9HNwDjC2fSetD4gi9Mji9lun3KkBciPDwAdyOZ/Tz9TlK/
	FNHauMkGTL9aoEhZKaRgiWdoxM3ap4yk2GCDQ+ZTdCdFiAC/8tI/KZJ47NUXnIGBML/R
	at6Q==
X-Gm-Message-State: AMCzsaVy+JCmePCtAN5PWuoo0NAitnOZxNB9UFSr7xqH6AWoYaPXv49T
	8bP3JZxXixXdQwNjv5kPoMQRuX/f
X-Received: by 10.200.43.252 with SMTP id n57mr11800509qtn.141.1509334031181; 
	Sun, 29 Oct 2017 20:27:11 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	t81sm4231534qka.37.2017.10.29.20.27.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Oct 2017 20:27:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Date: Mon, 30 Oct 2017 00:25:21 -0300
Message-Id: <20171030032521.2441-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc2
In-Reply-To: <08178b4217d1692297b8c9620b6d13a80bfb6822.1509175660.git.alistair.francis@xilinx.com>
References: <08178b4217d1692297b8c9620b6d13a80bfb6822.1509175660.git.alistair.francis@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-devel] [PATCH v3] xlnx-zcu102: Specify the number of max CPUs
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pc0TCq/enrfd

From: Alistair Francis <alistair.francis@xilinx.com>

Specify the number of CPUs that can run on ZynqMP.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
V3:
 - Fix my ASCII noncompliant last name in Reviewed-by tag :(
 - added Tested-by for what it's worth
 
V2:
 - Use macros

 hw/arm/xlnx-zcu102.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 519a16ed98..e2d15a1c9d 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -240,6 +240,7 @@ static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
     mc->block_default_type = IF_IDE;
     mc->units_per_default_bus = 1;
     mc->ignore_memory_transaction_failures = true;
+    mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
 }
 
 static const TypeInfo xlnx_zcu102_machine_init_typeinfo = {
-- 
2.15.0.rc2

