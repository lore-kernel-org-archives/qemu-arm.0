Received: by 10.28.91.67 with SMTP id p64csp1279714wmb;
        Fri, 16 Mar 2018 13:39:51 -0700 (PDT)
X-Google-Smtp-Source: AG47ELulc1hiu9O+NRKXprME2RgDPFXmApzQ5gzLfZXdbQ4EuzmdDiB67xDaOkKibHPF1Bp/O5YP
X-Received: by 10.237.33.40 with SMTP id 37mr4891849qtc.4.1521232790947;
        Fri, 16 Mar 2018 13:39:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521232790; cv=none;
        d=google.com; s=arc-20160816;
        b=rm7IhHqaLvQCki2TKR4VVVoJu78Dw4qtmmu0wINKv2XdWTcZS8tpj1LXVxKcR1Xkcg
         mgXQGwmDcmjXMsP8mhBuGmmmzz/09J1RNwobg6RG/z8q3YnxIOBMGzKNixdjCW3KAtyJ
         CJOpPFlxTNkXXdz/ie9IyfR/fsvNwlikImJK1tRk6sSaObTKu7KXZqWumrYQHSGqf8GZ
         f5VVVrfZ3s9GhmuiBShy1l/AY5inH62Rl1OQmYQI+li6VmeGbGuNOd66Yp6mcmN2HgNK
         haVcyGESLzv5l/E44QW41LEv/0dbTG5D9VfmS69QdpKKrAAk9LuqnHYtXHedBDXNgYlY
         FNWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=vTjLLA5M+sMUHlEk0ocjW6icmLR6uGtEuE/GMV6qmjc=;
        b=Xw3+jDgk8aXnMMarEAbTxrTBuQZyCDMmE+3dM/G8fJ9hRlFSV954FMK3SVWpfp1hbR
         EH7+XeYIB45B8qmwXeB6BD8BIG/DQj+NxTDUp6t3yxtkQa0gRSrBuQFvr5jLAqgpQK6b
         s3zS56e+nk9+spI9NPrXpsTqAryQ8ScQfYrGPX0ermzanESPmYE1URFQzFdKYtYBUF3a
         QOzM5ZxgBGxeYLU7TFZUb1c0N0D/yABdSYPrHgIzfhFv/vwAdw9UqnZHs+2lAqihmAIx
         WuhbXlX/1ALDcOPQ7vVCH1eHmmXUHayJLQRM8WqSJcGCzw0TFHjnDhoCZEyK7EPYsQYL
         PuTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=JpWjBCz2;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=UxG5OZvD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c29si8882601qtb.39.2018.03.16.13.39.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Mar 2018 13:39:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=JpWjBCz2;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=UxG5OZvD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59472 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eww8k-0003DO-Cy
	for alex.bennee@linaro.org; Fri, 16 Mar 2018 16:39:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1Y-0005z2-IB
	for qemu-devel@nongnu.org; Fri, 16 Mar 2018 16:32:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1X-0003UJ-Kj
	for qemu-devel@nongnu.org; Fri, 16 Mar 2018 16:32:24 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:56308)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1eww1V-0003QJ-2F; Fri, 16 Mar 2018 16:32:21 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 0987F60FF4; Fri, 16 Mar 2018 20:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232340;
	bh=PHnf6i8wD/cY6te2bgq1733P+y+k3iE7tmKwMegAp2M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JpWjBCz2hhA7uIXcT4xW4LlaMJT59bCkvtDvx55fTxqkMW0pIvYS7QK4PL5TqMzLD
	7buVYuDI2XXglcQnGcTPj9tgTXtFTreBY4a3uyTTJre2rin3K5ezBkmqNp7vjTdKkK
	l8HbTLuJTKPtfZLMZFjycmz7+1l4LXy+2HmM7aBc=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id E82C460F61;
	Fri, 16 Mar 2018 20:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232335;
	bh=PHnf6i8wD/cY6te2bgq1733P+y+k3iE7tmKwMegAp2M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UxG5OZvDcVB7V/vgh1h3OsZ8sXFMLYN6cAZdJfLpNRbgBrhSPEt3IvFZ32e6FkXn3
	ER0SRymAzXXB79l49BGaIgzDaoKcl3G4YPUzW/Pw+Jy0VF6nLeMUcdSIhPqzJWAyT3
	lqhsFtj1UIQiJC8TuuZVfEeV1FddxmgBlnnmMSf8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E82C460F61
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 16 Mar 2018 16:31:12 -0400
Message-Id: <1521232280-13089-15-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-devel] [PATCH v3 14/22] target/arm: Make PMOVSCLR 64 bits wide
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
Cc: Michael Spradling <mspradli@codeaurora.org>, qemu-devel@nongnu.org,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: biEoaS5+kRMf

This is a bug fix to ensure 64-bit reads of this register don't read
adjacent data.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9c3b5ef..fb2f983 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -367,7 +367,7 @@ typedef struct CPUARMState {
         uint32_t c9_data;
         uint64_t c9_pmcr; /* performance monitor control register */
         uint64_t c9_pmcnten; /* perf monitor counter enables */
-        uint32_t c9_pmovsr; /* perf monitor overflow status */
+        uint64_t c9_pmovsr; /* perf monitor overflow status */
         uint32_t c9_pmuserenr; /* perf monitor user enable */
         uint64_t c9_pmselr; /* perf monitor counter selection register */
         uint64_t c9_pminten; /* perf monitor interrupt enables */
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

