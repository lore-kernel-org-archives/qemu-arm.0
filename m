Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp473352wrt;
        Fri, 25 Jan 2019 07:57:25 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5MMIzZGgd9/jZXfMdJTMtF+AIHXTGudbESFLXuHx4AXUsrKV3FFiPQjbTw/46NvN1ILr97
X-Received: by 2002:adf:a393:: with SMTP id l19mr12395819wrb.110.1548431845192;
        Fri, 25 Jan 2019 07:57:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548431845; cv=none;
        d=google.com; s=arc-20160816;
        b=MdKRLo5sbHQEkr4oWx2mRZ04Rl8XrQSNCH/YIQP0P4Mmzi6iOBXGTCWPi9LVypSXfP
         CiO9hd1utQT/uO8OYvE1o25wlDP+LwSKXw4kRROOiczEAY5kbSLLa+LoihMAdrKjPyFt
         p8r2Scmp113O4tgfycs09GOhKKcmdQUR+jTcleH1gEwfhkZK0XCOFtcrbKsGETxMRXUU
         iu2H9XPY63k6vC2v676ohfCCPPTsR2RVn6ZhOGp+Y1KYCBCDNoK+xqIV5neWYKKvqxow
         Kt2ynpse/fgp8TdFQIJHgL1Pov1J8HyEw7ES/asSCvy+PNJeznAGMUPO79Gh7WkXQ4dJ
         knSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=TTpRtE73zn9+9XaAgwkTXd6X+SweJAaNdeUuT7cud4Q=;
        b=VAV7HOw7mV/X/psK2UcYRQjjznhtLn8nhpmQZgU2XmxCastPM+uBi8jf116DwQWray
         /eLNDZFddE748HS5UOgVJZLadLWrWIivTZka/H9//GDKLMPK9Zl029baZZ+HSn5UZuuC
         rJa+aA2uvTVrcbzBWqnGKXJi94ikWxIxPXqSnhg+lHVt04oo51Rd0NsSjdQzD0ssGdgp
         8wWdBsbQMy00DTqwqNOrZqqv9sd6ndbOy+8Zm86Kx27u69Lcu5K0jNI+PcHdo+0O0pxE
         5J1CEactKlzi8oED1Yi6sZkQkdzv9iWJcONdnVsMpMcF1tAmOAkPGkzOSDeFwmzeH3Xi
         8GYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=noDmVd7H;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l201si3045434wmb.201.2019.01.25.07.57.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 07:57:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=noDmVd7H;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:46578 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gn3rA-0007vv-2Y
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 10:57:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sourav.jb1988@gmail.com>) id 1gn3qb-0007qy-1G
	for qemu-devel@nongnu.org; Fri, 25 Jan 2019 10:56:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sourav.jb1988@gmail.com>) id 1gn3qa-0007h8-CM
	for qemu-devel@nongnu.org; Fri, 25 Jan 2019 10:56:48 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:33495)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sourav.jb1988@gmail.com>)
	id 1gn3qW-0007ex-O8; Fri, 25 Jan 2019 10:56:46 -0500
Received: by mail-pf1-x444.google.com with SMTP id c123so4959797pfb.0;
	Fri, 25 Jan 2019 07:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=TTpRtE73zn9+9XaAgwkTXd6X+SweJAaNdeUuT7cud4Q=;
	b=noDmVd7HKeCq5XMB6KcNrX9oPg5Op95rl7BBz135AcLZLbQxzcRzGr3RjjlLqpacv3
	IG7ojydAhUd7d99AkgtA/mOkJmkrBB7JyommlAnCYBwzlGmBZgBVXKjh12rSweCwLYUX
	21ngabjaibeK8PeojY8KiQffsQ6yc9uPQDMjEa0xLeCCY7LQ4+xqF6w56BVqZbaBRkvg
	ArvKtXNhELKb5bKCTNae6GFO5i5a00jYDsv43Ae7CjT4eGZtSY88AuLqbntm1x9VDdUC
	edyt2zE6ffug64DjzxchFWYw2VpVgaIyWbMXxMcT0wVEKM2fiQ2BqVW5lVbSfukM7dJ7
	OfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TTpRtE73zn9+9XaAgwkTXd6X+SweJAaNdeUuT7cud4Q=;
	b=Af1a3Et6HMZ1GEkz3UW555cmbcqFNoEoXOzhv1+KYDEfDPwskcQCYftF+tgqVrCPBg
	iANryqio7wI089nZIQitCWkqKAqvbh74+HWm4QaVxcpZEeC7dLBI6OsIcDI+vZg6OCF2
	cUfe5WjuPmhczyS0MrcTYXMioa7KjiGyzL2LQpoHChcxIeIH7WJBu+k8V8it1t00CiDd
	Snxu/EC7c8uc1snW6ik74+v5SzDn03+W4r01kyJGv/ARgo1vEyTxeD39jSYMXWNPOriy
	/xzVRvHiTDD5pEzpCLmt6rtjWoTBdV78i/b/xGTVxTJdEQVio6cHRwuz+zjmEna5wNp2
	68ow==
X-Gm-Message-State: AJcUukfySc/UolreKGdVPpplmctsbseQ/ewIhJXN2EbxGyKTw29JgB+U
	peIgDRmAm0PuPEJwdj6aFBufyqxi5J0=
X-Received: by 2002:a63:e344:: with SMTP id o4mr10287195pgj.158.1548431802602; 
	Fri, 25 Jan 2019 07:56:42 -0800 (PST)
Received: from localhost.localdomain ([27.7.213.28])
	by smtp.gmail.com with ESMTPSA id
	j6sm46557634pfg.126.2019.01.25.07.56.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 07:56:41 -0800 (PST)
From: kumar sourav <sourav.jb1988@gmail.com>
To: qemu-trivial@nongnu.org
Date: Fri, 25 Jan 2019 21:26:30 +0530
Message-Id: <20190125155630.17430-1-sourav.jb1988@gmail.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-devel] [PATCH] hw/arm/nrf51_soc: set object owner in
 memory_region_init_ram
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, joel@jms.id.au,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G4v8fb0oXT8P

set object owner in memory_region_init_ram() instead
of NULL.

Signed-off-by: kumar sourav <sourav.jb1988@gmail.com>
---
 hw/arm/nrf51_soc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index 1630c27594..3a1c7e200c 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -89,7 +89,8 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
     }
     memory_region_add_subregion(&s->container, NRF51_FLASH_BASE, &s->flash);
 
-    memory_region_init_ram(&s->sram, NULL, "nrf51.sram", s->sram_size, &err);
+    memory_region_init_ram(&s->sram, OBJECT(s), "nrf51.sram", s->sram_size,
+                           &err);
     if (err) {
         error_propagate(errp, err);
         return;
-- 
2.17.1

