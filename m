Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1145877wrt;
        Thu, 13 Dec 2018 10:33:06 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XCcWOKpZ7Tp+DhV6wJ85uAzBhKKQNRKDmG64F/fuzGlOVdRYZyEiu//S8eVkTI69+JVlVi
X-Received: by 2002:aed:23c5:: with SMTP id k5mr25465724qtc.39.1544725986879;
        Thu, 13 Dec 2018 10:33:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544725986; cv=none;
        d=google.com; s=arc-20160816;
        b=0+ZnzQfrn0zMJDn7Xqk9xVnoRpP8K0YfKR4CLgWTIjB5FDS/xqBwti2yauT1hHh8Xp
         6U+2ajbFsxIxdvloAxxsHMtPf/Hs1KE+mo7B4qTSfn2agd9BMwhkIpculklJwmYj53TP
         MduZptGxcyDch6l4ZPQvrgeBn2OeKDivoSYyY/aXCfcTpirYttbTd2UVXS1xfitvwrme
         sErzft6HhuYDDBb5ERcn53uL8l5gfqzJkpDiIfAkUXrnhLjG9G7dqc3GXQBrv6JX0hg8
         23mZZLzCOtkiUJ8607XI9ffES167xGQ92YvyCKdUxKaM0knHi0OifysMMZzTjTaQN44o
         cy3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=hni1dgj4pTAWsllfITNlVcrBwvetiRiaVm6vUrQJEtU=;
        b=SWF1J/35JoN3S3F8RhdnToNHlCbxwDIaUcuw1mHdd84RkZUzGYo8fkHGnNzpS2U6vj
         YH8rK2WlLWqeLVCD+G4lSg24VJ0q8MeDlKm0KBhqgUvmGRJyIrO0tOWsxCPAFUnXj7nT
         RZJkeTjxGBSocyDkqHIksc6IjvbjKJI/voJzG/hZf2UMJqfWpL2uv+H5aKT0q/ABDipD
         4bujsCYwC9IeCD9nW2hTIJOhl5QnJZHSK+HhET31q3fs2oCRqxOpxY4ZPHPKZoXPRbF0
         ckdrSDvss9GfU9qBzDa8cktaY7X1v3X1ApAx3u+k2pb2IthNY8p7x/lGicumsA6QtsAj
         AddQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VZR7ZdU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o6si1449413qtp.370.2018.12.13.10.33.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Dec 2018 10:33:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VZR7ZdU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54167 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gXVnG-0006Q5-EO
	for alex.bennee@linaro.org; Thu, 13 Dec 2018 13:33:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50211)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gXVn7-0006P7-P6
	for qemu-arm@nongnu.org; Thu, 13 Dec 2018 13:32:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gXVn3-0004UZ-Om
	for qemu-arm@nongnu.org; Thu, 13 Dec 2018 13:32:57 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:53128)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gXVn3-0004Ri-IB
	for qemu-arm@nongnu.org; Thu, 13 Dec 2018 13:32:53 -0500
Received: by mail-wm1-x341.google.com with SMTP id m1so3367521wml.2
	for <qemu-arm@nongnu.org>; Thu, 13 Dec 2018 10:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hni1dgj4pTAWsllfITNlVcrBwvetiRiaVm6vUrQJEtU=;
	b=VZR7ZdU31yNihsMAPM57x19r1Tym/Zsf6D+j6H6+LZi+mNuGo3nx5kWFKod4EvzPIx
	sAVgxpelWgmZRcpxuXgsZS5kaRifZjrtL+ickVCqBpB0fXkLgSAsMvNdylQIrL0OmUyO
	8kQmt8zY2uz1gH6jfiLWR64c0EM6kHWvv6nv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hni1dgj4pTAWsllfITNlVcrBwvetiRiaVm6vUrQJEtU=;
	b=ckQpllwCvFYb4nNTiNqB2I31VV1TBnEzJ1CnYRc4fIb7C4JbMAMu/e4ZNq4VwJTZDY
	IesfswZnQi9nZHzNU3NANY5GoiYdwyS1AQ0SqBHhimZO4ws4EvP3Ww64VHC/9oRR1eUf
	ziEkWuOb3iac67hxdJausYUHuSdYHLQtpcHp2fcYvgSArvH+iUZf9EoqGqDnbh+QaGqw
	dxDDQ++Li/QO6o4Z2ZRBvexBYoY6Ye+30dilW21HzYeZIuadHSBsM755erelHI5XKFum
	MrCicFv5qqsHuOBEMGZca9wHdp6sK5niSADgJb26aNPBG7s5lWSaP0rthSE4S8WYgI2h
	q/dA==
X-Gm-Message-State: AA+aEWZsf8bfABJTI22F6Q8Kk8VSbI3wpn3ZiIz1Pb8H2sqB1qFTJJK4
	8iChbtJgOLOizfWBFImi17c8w7T1OWw=
X-Received: by 2002:a1c:2b01:: with SMTP id r1mr459542wmr.7.1544725972256;
	Thu, 13 Dec 2018 10:32:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	o81sm3598793wmd.10.2018.12.13.10.32.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 10:32:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 13 Dec 2018 18:32:49 +0000
Message-Id: <20181213183249.3468-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-arm] [PATCH] hw/misc/tz-mpc: Fix value of BLK_MAX register
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
X-TUID: KPkN5F1W/QFQ

In the TZ Memory Protection Controller, the BLK_MAX register is supposed
to return the maximum permitted value of the BLK_IDX register. Our
implementation incorrectly returned max+1 (ie the total number of
valid index values, since BLK_IDX is zero-based).

Correct this off-by-one error. Since we consistently initialize
and use s->blk_max throughout the implementation as the 'size'
of the LUT, just adjust the value we return when the guest reads
the BLK_MAX register, rather than trying to change the semantics
of the s->blk_max internal struct field.

Fixes: https://bugs.launchpad.net/qemu/+bug/1806824
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/tz-mpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/tz-mpc.c b/hw/misc/tz-mpc.c
index e0c58ba37ec..946147b1c02 100644
--- a/hw/misc/tz-mpc.c
+++ b/hw/misc/tz-mpc.c
@@ -150,7 +150,7 @@ static MemTxResult tz_mpc_reg_read(void *opaque, hwaddr addr,
         r = s->ctrl;
         break;
     case A_BLK_MAX:
-        r = s->blk_max;
+        r = s->blk_max - 1;
         break;
     case A_BLK_CFG:
         /* We are never in "init in progress state", so this just indicates
-- 
2.19.2

