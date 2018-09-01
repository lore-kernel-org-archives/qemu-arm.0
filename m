Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp546369wrd;
        Sat, 1 Sep 2018 05:59:37 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYaNd4d2KLh3BGulayYk0aDMeIVL5AoEn8smfLZvVo2rKOrexRDmtSo7qzqt1pkVsGY7Qqs
X-Received: by 2002:ac8:148b:: with SMTP id l11-v6mr10318148qtj.27.1535806777167;
        Sat, 01 Sep 2018 05:59:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535806777; cv=none;
        d=google.com; s=arc-20160816;
        b=Dgz+KZwAPftbp9hVBmd1q30um+aM2auKOOjuIDSEF3Dv3YKduy5y3oZgX5vLNpyC//
         3NlQnK13/d3IIRUGK3NDTZkyOAc4hoUiBVmg+nINwhKXuls4fuTIU01unB4xDKUk+iU2
         QUbgjc8VShPobQeIarXxsXcUScofHm+unarxNKObcs3I31WCTqmzJ+Jt76bhyc/Zg5/H
         oAcCddOo2pvvjcTJMkdLjd5rH+dw9FeoKY6imVXdrnp6zrDPApEODxPVOmmpbLmbL9qb
         SWh1dgcKR+kZlOEBBL81cdL3esOx2k9ZCgd+4bJt2StBAe60+QaFz768gAJWEEs7BNxW
         8HsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=vVIHicQFy0NRxmD2gNcZHKYT8+C1S+2yQJKGXPzURFk=;
        b=G2KVhvT19ckv97sTh+ZnWk3jVQmVvIwlRe1WWvR+P9X4nqee8BzHNV2OzLPEM8ZLjv
         UoTZ000m57fVCBwnAPH4RQceI2vruwtX2LVLO5gN2Hsnj1Cj9VDu2+ixRoixxF7+dlS0
         pz501FBrE4QVju539B3u+ur7rDd+I8vLp9NlPND8wx+BseyH5XDInMh+xPsyWJXietTy
         n8AwfjE/hrsITFwY0ke+8To4DG/iYCkFPdBUW2zYBimTyUJ1FDRGW816oIGh7nR7/ejf
         x9ISSozpnuXUizjBHQS5NXtBbbzKudX+UgvC2X+dqXUSzdenpa9gSK0r7YQAcre3z3e0
         XVrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=C8e2rf1r;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=IIfmdgVK;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=IIfmdgVK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u129-v6si4886214qkh.336.2018.09.01.05.59.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 05:59:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=C8e2rf1r;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=IIfmdgVK;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=IIfmdgVK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37102 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw5V2-0002rL-P0
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 08:59:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35587)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5JW-00066r-9v
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5JR-0007v1-AE
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:42 -0400
Received: from greensocs.com ([193.104.36.180]:40644)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fw5JQ-0007kT-Uv; Sat, 01 Sep 2018 08:47:37 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 5C0D0DFFE1;
	Sat,  1 Sep 2018 14:47:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806033;
	bh=53E2KYfvzxY3RVepuu8hlX4xIk1DTU1T0gbwnQ2ryxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C8e2rf1rIosFDm5rsHIJ7nkjXWhsLyDLiwP699M/ksRKCwK/iyI2dEX6xpgm18phs
	k6rUP5K0kYf9Dn0VUZrKAEnvUpiqvmH7W7NkSWXPwBkReEBuejQKyubTudLaURyi15
	jmW/RhfB7X103l+/mfBnbOM8NzBOsYJ4yEsg6Sws=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=IIfmdgVK;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=IIfmdgVK
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2voZMw0TAPth; Sat,  1 Sep 2018 14:47:12 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 89377521AB0; Sat,  1 Sep 2018 14:47:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806032;
	bh=53E2KYfvzxY3RVepuu8hlX4xIk1DTU1T0gbwnQ2ryxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IIfmdgVKUNmLbcmjk6aGujGgsj2NjLGLfgmuMBLkYrtKNGe5YlfwpzG6ZEGIfzuPT
	kuR3KYA5OdhRPpQkjdGBLMthe7eoSt+Vb24NQp1jTBFl8lcJaBm6oRJIs1SFBQWjcm
	wlIiQb588186vXhnq0XhKnoPnH6Ulamo8Pv00KAk=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id EB636521AAA;
	Sat,  1 Sep 2018 14:47:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806032;
	bh=53E2KYfvzxY3RVepuu8hlX4xIk1DTU1T0gbwnQ2ryxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IIfmdgVKUNmLbcmjk6aGujGgsj2NjLGLfgmuMBLkYrtKNGe5YlfwpzG6ZEGIfzuPT
	kuR3KYA5OdhRPpQkjdGBLMthe7eoSt+Vb24NQp1jTBFl8lcJaBm6oRJIs1SFBQWjcm
	wlIiQb588186vXhnq0XhKnoPnH6Ulamo8Pv00KAk=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat,  1 Sep 2018 14:46:38 +0200
Message-Id: <20180901124639.19735-15-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180901124639.19735-1-luc.michel@greensocs.com>
References: <20180901124639.19735-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH 14/15] gdbstub: add multiprocess extension support
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com, edgari@xilinx.com,
	qemu-arm@nongnu.org, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ndJTr9w7/lTH

Add multiprocess extension support by enabling multiprocess mode when
the peer requests it, and by replying that we actually support it in the
qSupported reply packet.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index 6a55bf2785..d249803c8e 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1688,15 +1688,19 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
             put_packet(s, "OK");
             break;
         }
 #endif /* !CONFIG_USER_ONLY */
         if (is_query_packet(p, "Supported", ':')) {
+            if (strstr(p, "multiprocess+")) {
+                s->multiprocess = true;
+            }
             snprintf(buf, sizeof(buf), "PacketSize=%x", MAX_PACKET_LENGTH);
             cc = CPU_GET_CLASS(first_cpu);
             if (cc->gdb_core_xml_file != NULL) {
                 pstrcat(buf, sizeof(buf), ";qXfer:features:read+");
             }
+            pstrcat(buf, sizeof(buf), ";multiprocess+");
             put_packet(s, buf);
             break;
         }
         if (strncmp(p, "Xfer:features:read:", 19) == 0) {
             const char *xml;
-- 
2.18.0

