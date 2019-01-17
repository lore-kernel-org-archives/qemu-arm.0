Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1848327wrt;
        Thu, 17 Jan 2019 05:51:57 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5fYavMwGZKezuTy+/bGIOMTZ+PuZ0pCDjOjB1Sgiivk9nOiOTJ+wjs8e3z2QLzOZOWSfD4
X-Received: by 2002:a1c:5f8a:: with SMTP id t132mr12249832wmb.40.1547733117854;
        Thu, 17 Jan 2019 05:51:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547733117; cv=none;
        d=google.com; s=arc-20160816;
        b=whxBsVtdV805qweF2vgHMXB5u0VlMHSQZrhp4j3J9Oo+1UiKTRXJOaTOSbMtz1jF1h
         upWxxviYQQceS6+IHnONyhcy0v2P8+SobUqeM1L/LmncXXwl/YCv/4i9Gby9JG3UVYDX
         1Llr/TKSFVxpVRM2JseQGyVel3pigFjCV9EnRqlUHFHMDcHGE8cBnpI2EcUevIRh57Xd
         gkPnyKKQy51nK2B/UCVamNKwM4Z0rpMazTA7HnFB9o6nksA1fA7PadtmiHHw1KCE7eEK
         J7KLfHdCTFP9aDD118j6ESLPoyTF9deWbRX4meFFIMDOJYv4TON7VqgMvJp/clfJgP4r
         DVaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=6R9mI8GNZ6gdYJ2d85EWnNzi8WC2wx3DvoLVUg90EnQ=;
        b=GlTV9hbrvn5OLmfUVIsAzw7P1iDnPk5SW/KvqkfYtpZOihLKfk4rrYnuft8an7B5jp
         pB31Lfh0n+9FujMh9R4w/RtIIjGkfUonO7Lda+RQalwM8pZdJxgNH13JbT+yc5w/wWV8
         BcEJxniFsBzTimTy4jfakueMWYnoW3J2FZPgRi0tXVRFqZ8bgiJqST3zcSdzav35C9b6
         Cl29kQYDgNWZCZebkhts/ekBnIV2K8bk2mHE8uFaT1sRd9t1y1Wxr2tlFTPJdD1h1N1Z
         EwK1cSwWqI9nw6NaYgaIh6kvrfvCA+fIRPeZ3uasNSF2NeNYfyxIG5nzCsErHKH11ege
         bTTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kMCry3ye;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j10si57013953wrc.116.2019.01.17.05.51.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Jan 2019 05:51:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kMCry3ye;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44902 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gk85M-0000Ya-V2
	for alex.bennee@linaro.org; Thu, 17 Jan 2019 08:51:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34056)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gk7sV-0006Jv-L0
	for qemu-arm@nongnu.org; Thu, 17 Jan 2019 08:38:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gk7sU-00069m-1q
	for qemu-arm@nongnu.org; Thu, 17 Jan 2019 08:38:39 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:33104)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gk7sT-00068I-Pq
	for qemu-arm@nongnu.org; Thu, 17 Jan 2019 08:38:37 -0500
Received: by mail-wr1-x441.google.com with SMTP id c14so11099764wrr.0
	for <qemu-arm@nongnu.org>; Thu, 17 Jan 2019 05:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6R9mI8GNZ6gdYJ2d85EWnNzi8WC2wx3DvoLVUg90EnQ=;
	b=kMCry3yeCFoOTW0Otz+kSZth9gHPJk0QxhACFN37gjq2m9MBKmm1dDm9CR7DLjzNpE
	I21aEOriIY1SDz9tUIwcFI6waXqQjOJtMnpPcsQAZN6x/L0BScp6e7bYobLzJWlsdg8W
	hgODgCqftagxkZH+kfThgIF5M2MOBJPObg7EA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6R9mI8GNZ6gdYJ2d85EWnNzi8WC2wx3DvoLVUg90EnQ=;
	b=cN/yx6Zf3exC60qELD9EsYrSGRgg0VNujHcZF0twMtzMSgLysDMdbrsOleD1KpR/iQ
	2KL1lANq7wyq/nP/Z8T5mDNI8PWN+StxUbqOD6bcFfS30sDRKQJvLQIcT1Dfc45ZpUgg
	WGghZuTnd38yxovIj81gIe2x69fV+rxg/QmQ7lLzfXIkB1IfF+BMBAxZe1KsXTGXX+Uo
	UtDVjNai99f6JPcnpCvkOiicBiEBKoUbFfSj5GleTSBl0ib77BLpyys1cGrjrPNk4001
	zOZJkDmlsEDEtKArPwhkFooCCHY6Q4/mt6lPLtVmg+iO6II1QREgjv8ikDP8/o1jfmLR
	g3QQ==
X-Gm-Message-State: AJcUukeQZ0T8lH7ogEBo5fHdf3kMZ8enzmBfGDue0jlZ0HoTkxjStd4W
	N9je9B3iKUFcNOg2AfDEQZEVyCQOpql0Dw==
X-Received: by 2002:adf:e34b:: with SMTP id n11mr11426272wrj.91.1547732316353; 
	Thu, 17 Jan 2019 05:38:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	g197sm3700903wmd.29.2019.01.17.05.38.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Jan 2019 05:38:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 17 Jan 2019 13:38:34 +0000
Message-Id: <20190117133834.7480-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-arm] [PATCH] exec.c: Use correct attrs in
 cpu_memory_rw_debug()
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 60go+2Ircgfj

In the softmmu version of cpu_memory_rw_debug(), we ask the
CPU for the attributes to use for the virtual memory access,
and we correctly use those to identify the address space
index. However, we were not passing them in to the
address_space_write_rom() and address_space_rw() functions.

The effect of this was that a memory access from the gdbstub
to a device which had behaviour that was sensitive to the
memory attributes (such as some ARMv8M NVIC registers) was
incorrectly always performed as if non-secure, rather than
using the right security state for the CPU's current state.

Fixes: https://bugs.launchpad.net/qemu/+bug/1812091

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 exec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/exec.c b/exec.c
index 6e875f0640a..2f0f40b0be6 100644
--- a/exec.c
+++ b/exec.c
@@ -3881,12 +3881,10 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
         phys_addr += (addr & ~TARGET_PAGE_MASK);
         if (is_write) {
             address_space_write_rom(cpu->cpu_ases[asidx].as, phys_addr,
-                                    MEMTXATTRS_UNSPECIFIED,
-                                    buf, l);
+                                    attrs, buf, l);
         } else {
             address_space_rw(cpu->cpu_ases[asidx].as, phys_addr,
-                             MEMTXATTRS_UNSPECIFIED,
-                             buf, l, 0);
+                             attrs, buf, l, 0);
         }
         len -= l;
         buf += l;
-- 
2.20.1

