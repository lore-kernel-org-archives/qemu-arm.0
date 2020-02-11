Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5355101lfp;
        Tue, 11 Feb 2020 09:40:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqzkKqt5szXinDkTk/vrnDXO8J7PiVqjMx1jbw85YD0b+/zV09Sb0m43oEoFbCzzFYf4qSTK
X-Received: by 2002:a37:f60b:: with SMTP id y11mr6664471qkj.183.1581442812518;
        Tue, 11 Feb 2020 09:40:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581442812; cv=none;
        d=google.com; s=arc-20160816;
        b=oM8p6tRk5t2ARhmTE4twCOSjukERoRr8hjrYfPM3A0IN2HMkBj5gyaQobOTr/KB4jr
         7rmAFetSPDKKMt6STAmr69aQmvuK0NQJrtTsIfNwVBEuqLRVllN+Vo5K5q5cyNVJXx81
         0fcse/G7lF1Oj0Xg2u8rrmdR6hDt5YcKaTA64pRrA6jR2MhsKJt52V5kbG+/kuP/17VD
         HyYbWMIGOP48/R9qH27AjsxfVU5aMiAX4yaiBPUZkFeVOWtYC0yAGPmszdil66IH7kiY
         HiacfNvkpBpIL3S3/bhQc/H3+FnB/mrvTQRfY+In5T1GHKZy5LuVUgkhbIZ3TwFg3KYc
         b6Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qxQxsH3Nx8XV7gIhtppy/YXx/6TNRZKK5/Th8LAFzrk=;
        b=ti0vhMcbXdhkNj6etcnteP6WPDD9pSAyT6HdBfkSQ32hmFvQNyJFN1wkCWqTDEgFgq
         Pfmn0IUBZWF2f9pnTVYVux43S87HorJXm5FHrDQYzyYTs27ecfPzFg02n2krJ9Cy60aj
         c7GYPvVXGT6c9bdDsQX8Eme+KsknIhBQ6BDredR8FjpEYmljnsl4nnq0xBiTzcJYDDvI
         yFVfNuuta/NrbHVPtmeW5ylseorFr2UG6ThHwXSvAl7KHH0ESsQT8icE5wDdXD03emmW
         obtht4pMEMICrPuICkz56U40rRA/Qp/l8j0PH7hKovGYeyTW9ZmI0xIXJ2UkLhWDUjZ/
         hWAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Or+uJnxK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s189si2244933qke.311.2020.02.11.09.40.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 09:40:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Or+uJnxK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1ZW7-0001K6-R2
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 12:40:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48575)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j1ZTk-0005lL-CO
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 12:37:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j1ZTh-00047g-H2
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 12:37:44 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:37309)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j1ZTh-000425-2R
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 12:37:41 -0500
Received: by mail-wr1-x444.google.com with SMTP id w15so13493452wru.4
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 09:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qxQxsH3Nx8XV7gIhtppy/YXx/6TNRZKK5/Th8LAFzrk=;
 b=Or+uJnxKkB+GMkRP2hg+4vyPMAOYFHQgggoAJPhT9R4YxuWXTgS2WgwCv+sdziRws1
 cd/vVZvzpO8Ck8IyQ2Hz+Y/7JKqMPcofJNUN5FFW2M5Aeqo4Yo/qwlc/LdLWOZgplh+R
 Vr7SkBSa1A3zgLTCie7P0/UPYKrUDSk8EZoNTBKqOMOsCUtvwiX5W/Hsn93dm2bjqI0d
 mUUcUQpDOKnCnYIQHBeISv79NXTyfzrFcEk+4eB5z6StWh66XQ24dfi4iRKPDrMfuYw5
 Y0m6aHGoROcaY0HPSckQXhiXMIK5kbnNnehEykk2ZlQ6FHFOtw4kU5O8dphR5Z46nrtv
 +IsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qxQxsH3Nx8XV7gIhtppy/YXx/6TNRZKK5/Th8LAFzrk=;
 b=rHoZ08bYAYijlYRGuqoA1sdeVTLuyrdEjKlCbYKkxrAK3eEXGz7D1aR5F66GjTO6MB
 r4dBTvtlQ4S6mwIJYOyND4s16QmdiFiIa4gWM/f+kgKzThSma/NdmM+HFuvF9keZrzvn
 e+WHU4nP+FIt8wOiVlDkVHBRm/OJHfNp7ivl1bOQwGQVUA5aTKZxvuusPm7krAFXDDLf
 MaSD/Au+IKez/Yl8x1NsmuwKRms/oqZcenqyvWUkGgT5lQALAsyjQX1cCcOHSkvZYSCj
 Ve/ODfg4QSnPtK2zvEsgb/qFg816YkaE7Yl2HiQ1xcogjoJfha8CfvqMkCdj2pq6RjZi
 UsfQ==
X-Gm-Message-State: APjAAAWj9V9gTvgKTAJjGujDBJgM+Cd87b3qX5SvNv68Az3saD/+Cfhf
 9Uw82+JaqEIE7rlrzLHysg6EVYQ4BE8=
X-Received: by 2002:a5d:6082:: with SMTP id w2mr9633556wrt.300.1581442657385; 
 Tue, 11 Feb 2020 09:37:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y1sm6109675wrq.16.2020.02.11.09.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 09:37:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 06/13] target/arm: Use FIELD macros for clearing ID_DFR0
 PERFMON field
Date: Tue, 11 Feb 2020 17:37:19 +0000
Message-Id: <20200211173726.22541-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200211173726.22541-1-peter.maydell@linaro.org>
References: <20200211173726.22541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /QmeQeZ++9wu

We already define FIELD macros for ID_DFR0, so use them in the
one place where we're doing direct bit value manipulation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
We have lots of this non-FIELD style in the code, of course;
I change this one purely because it otherwise looks a bit odd
sat next to the ID_AA64DFR0 line that was changed in the previous
patch...
---
 target/arm/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index dc582da8fa4..e7858b073b5 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1603,7 +1603,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 #endif
     } else {
         cpu->id_aa64dfr0 = FIELD_DP32(cpu->id_aa64dfr0, ID_AA64DFR0, PMUVER, 0);
-        cpu->id_dfr0 &= ~(0xf << 24);
+        cpu->id_dfr0 = FIELD_DP32(cpu->id_dfr0, ID_DFR0, PERFMON, 0);
         cpu->pmceid0 = 0;
         cpu->pmceid1 = 0;
     }
-- 
2.20.1

