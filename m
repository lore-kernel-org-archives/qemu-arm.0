Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp701835wru;
        Fri, 27 Jul 2018 06:23:49 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd6zKA4tMWOiXtWbXxkKvp3h9TzUYSuFaRl/1VFtswnfGWIsEJ+dTa3oP0kK6JXLsqE1Hzs
X-Received: by 2002:a37:380f:: with SMTP id f15-v6mr5977065qka.177.1532697829174;
        Fri, 27 Jul 2018 06:23:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532697829; cv=none;
        d=google.com; s=arc-20160816;
        b=YL0z3l6Q82NDraycSKwYs0t9lLLCvBVJsp0yMrfcG/NDlhCItv/CZ0BW2+kowGoJQh
         6MDQJZYxUeZiv1FIVaDPdMfO7Po8FgVfQqc0b2OGPG7/3dJcgZUy/NxTxVYsmPP0K6Ee
         FRo+AvoZishJU2uwpUk5bdZT7Kvd52jTTsBxduM96Qi1ATBj/b9kHBjEeAiq969hjT4M
         996QHMRsQCJPUsTShFMAczmsbpkeyfE4hLVzjI7upPqz21R39WUDxqzNjZhwCd4dEqBM
         BEeG7ZudqejKGIObgPQ5bwBuNIMOYuZAObcIWgDlLmmSnHIj2CN8lwX+wZuBUWxbCQUO
         i8sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=BQpSGTB/7ryYy++gMKe7Sgm4V6Ji9ge0MCMbAjNVolA=;
        b=CtX7vdfE3u9bMVzG4jCV9KotMICfW/9HOH9lOkUVQqkQ0Exs8oSNtXe2k6DGZS3d6s
         jD4N674sWz5u0n8YQLKTpWBpNvWFUw8gJkyfR1CuqZAIi6cQVD//4bSO+Hha0H+tAb5i
         w6mCdvI53H1oo05HcSx3X97Ggdsu7Kf3TbKZ1jDbxMauebW+ef2ZqtTcCTW5VUT13qND
         r41UsoQyRD67DjqHcTHDGi8u+kdRTQRG8Dt05AVvzrv7NVpLARh+bdc5ITMtKtEV27az
         KGg48CF7uPYC1Zdi3+WY+KwYyA2Kbu7f2QJ+3M4A7rCxSeHsVUkAYoOdahw+g3IKBhIq
         Dycg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Es4A4foI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t2-v6si3534997qvm.126.2018.07.27.06.23.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 06:23:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Es4A4foI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41280 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fj2ii-00087F-Mw
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 09:23:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46342)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fj2iV-00086v-4h
	for qemu-devel@nongnu.org; Fri, 27 Jul 2018 09:23:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fj2iR-0005Is-VJ
	for qemu-devel@nongnu.org; Fri, 27 Jul 2018 09:23:35 -0400
Received: from mail-ua0-x241.google.com ([2607:f8b0:400c:c08::241]:46791)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fj2iR-0005Id-P7; Fri, 27 Jul 2018 09:23:31 -0400
Received: by mail-ua0-x241.google.com with SMTP id r18-v6so3308441ual.13;
	Fri, 27 Jul 2018 06:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BQpSGTB/7ryYy++gMKe7Sgm4V6Ji9ge0MCMbAjNVolA=;
	b=Es4A4foIfhTseRAm8uX6XHGJDk4Cp2BBw+xTlhAy3MMoSa1bVFBAwypkxvwGGYSLlb
	D1MD3Tih63Fkz5/DDm6upGK1C3wN/8wckJxWcuTxBTVGC6RQPeLSK45yIzfVNWcKsYwX
	1UcHKfv35/0a+4tC4ycbkADepYwdSJNf9bBO8V7JccW58mNvUuYx5j4B4vxsbBFbDuOt
	RI8vVOFx/w9kfya4+T0r/9/UoAWOLbKcKz27dqJFs1GbqwS4WLvpf5XoztkAE3Eo7Hyc
	hjcwPI57uzDOCmWljeJ+iHmiy9B32vBs/WoTXI0TAomngp6BcbxbQcJGDOJwdNDTstfc
	sFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=BQpSGTB/7ryYy++gMKe7Sgm4V6Ji9ge0MCMbAjNVolA=;
	b=hRFo4t0B+PSAuoS2hHmAJiUhSKUCD8XfG2qFVhOO6kEzfFrxG5mTuHoV0Ap0+YIAQA
	nE3Djdee/SWX1SemkiiaWLRAhVhKTZjWmIU12ccvIR9bv7YnTGGYmoMjB3GW8aspjZQT
	EOouuLYRvQHAMmGtkev66VfowTrNgGDJOfKHXQxs5agH2PFFZgN7obBo3iZQ6+yGnAgH
	EzO2B7agrgmOGj0SPhVBh1v0fAv0JlqcYlidKdF9polfCp8m3M2CJHgKJPK0/yoYGKd7
	U/mT3pvuNzoa2RtcDb/Cojz1Z1hVGPfLBlnrofdc27UEX0J44uppgHPSqiHpHZCwnitv
	TiPA==
X-Gm-Message-State: AOUpUlHvT6ju3Ang2hav71doCl+hAOdLZHVB1HpD5XR2MfI4Mb8DfLrX
	2/qvn45MVt1FzSx7krVGd4A=
X-Received: by 2002:ab0:6583:: with SMTP id
	v3-v6mr4473698uam.107.1532697811129; 
	Fri, 27 Jul 2018 06:23:31 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	g10-v6sm944558uae.40.2018.07.27.06.23.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 06:23:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Jul 2018 10:23:11 -0300
Message-Id: <20180727132311.2777-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::241
Subject: [Qemu-devel] [PATCH] target/arm: Remove duplicate 'host' entry in
 '-cpu ?' output
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
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FSh2maWGh0IK

Since 86f0a186d6f the TYPE_ARM_HOST_CPU is only compiled when CONFIG_KVM
is enabled.

Remove the now redundant special-case introduced in a96c0514ab7, to avoid:

  $ qemu-system-aarch64 -machine virt -cpu \? | fgrep host
  host
  host (only available in KVM mode)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/helper.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 22d812240a..66afb08ee0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5591,12 +5591,6 @@ void arm_cpu_list(FILE *f, fprintf_function cpu_fprintf)
     (*cpu_fprintf)(f, "Available CPUs:\n");
     g_slist_foreach(list, arm_cpu_list_entry, &s);
     g_slist_free(list);
-#ifdef CONFIG_KVM
-    /* The 'host' CPU type is dynamically registered only if KVM is
-     * enabled, so we have to special-case it here:
-     */
-    (*cpu_fprintf)(f, "  host (only available in KVM mode)\n");
-#endif
 }
 
 static void arm_cpu_add_definition(gpointer data, gpointer user_data)
-- 
2.18.0

