Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4748090wrg;
        Thu, 6 Jun 2019 10:47:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqysub28oLYs95RT/ELhlxX/t7ar/ViLU8MY3VzdW067Dfw1agMFn4mQagGrtf9rpUUx7d4o
X-Received: by 2002:a0c:fba2:: with SMTP id m2mr16202699qvp.204.1559843222648;
        Thu, 06 Jun 2019 10:47:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559843222; cv=none;
        d=google.com; s=arc-20160816;
        b=arl7DepaVnShFZe6nvga1NpUwmBMdG/qVJxlGgNIhEdVnJbX0Mq/eExmPoZW2Fsz35
         akSdJROjt80BraZln3N8G4NSVT6BW3YpzlC+zGl8QXsoWiAW5sCUxRLGDXWvndQbaPCH
         91TIf3LuD5A5VpVDUUI8kxfUIRXtwoPxpIJeTojLs9wFya7p7vSFmCNbH/S2J5tmvuIz
         6Su5i+F01dU9hlpZGDGsqBbpW52MqBzLCJynXOr2mqeNIOVojDCzNDAmDMzHC+2txZYe
         NqKe2vBzKE98a/dHb1gl8+RQhQxNEdYEt67AStQrFjbJiM3RuVe7ZVntn+WU8QcoBFrf
         5u/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=pYfiMlZ410Gu/yfJlg4smSlx90e446JdIiRcC7Wt8I8=;
        b=ShKCFAm+dlhQMn2vAu8VrOfCy+/GAdUBiqD5NCpeagVh0zAOlWgfvKNIVdK11jSO/K
         cNiCp4TEJoDxA0e3HNf6o5DaOPfnanZV2E/IiJIPSFYRa28FPm9qhO72I8fNXpg+YRYF
         sMNan2GfSdIxjW5KbVIaU+GXIuVG5/Pm2mpl+Rb4MWylJKn1uK3VF851x4LxQ3sR/lKr
         wUI/rcQ6R0NxUJjyKbI6Uyxr+WhGTWhzfkQFtSIXxmFVTSBA4gjoed+ggJXIiluuetcV
         yvlA8xN1+raeiB4gcoABtbVBQjXCsJblKEJdPzfnT2F/r2bVRc+brgKlAzWlKVaL9OiF
         EVVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="N/5VKgXJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k28si2241958qvf.36.2019.06.06.10.47.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 10:47:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="N/5VKgXJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35855 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYwTe-0003lg-3q
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 13:47:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44205)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTP-0003kN-3o
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:46:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTK-0003Bm-40
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:46:44 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:39236)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hYwTF-0002oq-En
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:46:38 -0400
Received: by mail-wr1-x444.google.com with SMTP id x4so3331304wrt.6
	for <qemu-arm@nongnu.org>; Thu, 06 Jun 2019 10:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=pYfiMlZ410Gu/yfJlg4smSlx90e446JdIiRcC7Wt8I8=;
	b=N/5VKgXJeJgKaBkyidWHeRwTXUGH+kCReU1OdaXezEzQylde7mvNxNYq9ewGJqWN/b
	Qssd6wWbuEd/kOq9FrEeCUqNl5MlItnGRo5OgfLREYpOqyxKX39sc4gBDue6kIzDmWQi
	ddKHw2lo3jQekv8aE4+bOXpihzXtfAOSKlZ22xFVOjYznI8cid0O1FqVIhzCAdqcf+sO
	GhDZyudLN2KiwzNMmoVS0J4aRZ2YtckDmqMlAzcItHfCt+9HqM4jPy81Mdg7tbRZ+4Ml
	Tvg32iEPjWLmJV8s/xSNeGYGd+zJYDs/jgBQrH5NjzBZLv97zsGGMhbRqXO72AL7MgGD
	TpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=pYfiMlZ410Gu/yfJlg4smSlx90e446JdIiRcC7Wt8I8=;
	b=N72d4xz5wShp6y0HwrcBeXgSd7fYPmVMr4UV66EydUuLV6uMjk7/BZ6utRt8MknSC1
	Ly56dbaC8i+Zib3IFGR4TsgMwT1zzhacWIonk7rBooiVkrBXR9WdADmbjzaZuExYOUcf
	qfuCjkb/u+gXHudzJ2TBzkU6ZqLxG1cbt4y4FITtJT7s+iu/wJNO12lywod2T0kNKd6Y
	DNj4r58M39SuXLPL06+4pZji8DPAPwIGrutDJH/OmZxNQ8/HfqvSJyvL7vHgHG8cZaR6
	4GOVJVQfpeSd/5ySAGdscVKnXyh2RhUseebIhExRVJ17azlv8O6TNSwTVjxbYvnmFRpl
	yVBw==
X-Gm-Message-State: APjAAAW+Lgzx9pxPLW1xXSHuC3EZDArFPZu7SMCT4vqY0QwRi4+KwkbK
	oCIlJJdqzbyswh8+WwZ94a4EsbvB6RPgwg==
X-Received: by 2002:a5d:4603:: with SMTP id t3mr7682237wrq.315.1559843175592; 
	Thu, 06 Jun 2019 10:46:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	z135sm2596784wmc.45.2019.06.06.10.46.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 10:46:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 18:45:31 +0100
Message-Id: <20190606174609.20487-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606174609.20487-1-peter.maydell@linaro.org>
References: <20190606174609.20487-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH 04/42] target/arm: Fix Cortex-R5F MVFR values
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cZGGx5U/jksp

The Cortex-R5F initfn was not correctly setting up the MVFR
ID register values. Fill these in, since some subsequent patches
will use ID register checks rather than CPU feature bit checks.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9b23ac2c935..044c4dd738b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1608,6 +1608,8 @@ static void cortex_r5f_initfn(Object *obj)
 
     cortex_r5_initfn(obj);
     set_feature(&cpu->env, ARM_FEATURE_VFP3);
+    cpu->isar.mvfr0 = 0x10110221;
+    cpu->isar.mvfr1 = 0x00000011;
 }
 
 static const ARMCPRegInfo cortexa8_cp_reginfo[] = {
-- 
2.20.1

