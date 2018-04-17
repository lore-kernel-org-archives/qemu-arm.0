Received: by 10.28.4.212 with SMTP id 203csp4253334wme;
        Tue, 17 Apr 2018 13:43:10 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48CEfTaDvhH5IufuQY60BQ9RHKOOdue+yuJDfV2lC5M3P/IQ+IxDhsev65InbxkzvIaRCW7
X-Received: by 10.55.78.199 with SMTP id c190mr3486313qkb.166.1523997790170;
        Tue, 17 Apr 2018 13:43:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523997790; cv=none;
        d=google.com; s=arc-20160816;
        b=HNfbxyrw4B/PizCH6o0f8LJkQGnpQnXTZrjcdu1cCC7W2Ga39JL+/RbzprCRMe4Usp
         +LRDr3bXM3E8XM/WBXxKzpDOjmsAqyqcr/GZ8TlUgHms2FJjHaty/6NkYDB+mAuL9+VY
         q/SZqizAPDq5Mf+yRuUYcR5tM3TY4dQMVpE6xd9AAGON0SJ+vHVB6Lpzkrk0IpBY86h2
         lnGwXAshbRjL61EzpjvOv3wzci2zd9J+k3PAr4IpXDe/BHQBJqvowwKHVOOft5HUxN/v
         dyiW5otFZXH3HKRuTCj9gfn91hMZ1xu6Y4Q9uK1I5PTcl/EhgncEPvMSFZ9Cxr1waz3M
         9rPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=it+86Dm8dwtSbI4yonrp9FtBBK7nEy2n+C7TJ0bTkdw=;
        b=Sw9Fo4qoxy4PnaibmqmeHTzYud4G3AeVGL2VXJFQj9abl9GO09Fiftj5jEPmCigpfQ
         vhgUys9Rpe/DFpLCxbXBeRyoLxPgPs9/faaGVyySkHp1Ysm0WyW/zve3a5D52fY9eD5/
         qw7uwAILTOmY3KIQpDIhVcubKPwQQfXHpjSb+SektX7VxLBdDzed85KW/FkzUYzyRVZ/
         cxDB3AejeAbSYaWLwGIjwfBzA+mR3cW7iTUkoaWcvKq1326bA9krl3wOF9wL/iPstOwK
         PhgDm+8H54c9ppjBkgWSC34geNOMQ2uSTjHmNW47GQUrxZJ9E8sIgiRnoo9tC3EqJ5vZ
         miqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=F2U0OUaN;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=F6kOlw+0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e8si6772326qte.201.2018.04.17.13.43.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 13:43:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=F2U0OUaN;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=F6kOlw+0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33319 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8XRV-0005jx-GT
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 16:43:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNi-000377-3h
	for qemu-devel@nongnu.org; Tue, 17 Apr 2018 16:39:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNe-0006eE-UR
	for qemu-devel@nongnu.org; Tue, 17 Apr 2018 16:39:14 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39996)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f8XNY-0005pu-Oh; Tue, 17 Apr 2018 16:39:05 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id EE2B060807; Tue, 17 Apr 2018 20:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997543;
	bh=UZVnWRQeFWfCjiPjGTH/s/l+NHmWpLAtzuytGsscYYI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F2U0OUaNuwn0J3QHB39sbUvusNYWDhnSBlh+pwTivxXY8E8LdA9L3lzIajhqKS4Xn
	pY5ja1nL+3hsv7JPQSW9Gv1jg3MK2Hzp/JtmVEd+JP93a2fthookuVviKI1tklRNG4
	rFGMvCXZeuTL2jkmsYu35A1757J4rFE4BgPVlhaQ=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id E9F3A610D5;
	Tue, 17 Apr 2018 20:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997539;
	bh=UZVnWRQeFWfCjiPjGTH/s/l+NHmWpLAtzuytGsscYYI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F6kOlw+0DNqcsqAodhX41I4krzEpoyUMuqP/hEgxzkyAOiI7P6aOh7kkMB92G5ehV
	B9wm9enPVQyLv1wSy6FLw0VKnoyoOxb+AwWkV2OT9n2LJsp05udn9JOxNIPiLP7lZF
	gg/bsSE7cu0Kco9RO1EWjHeqzUz5Xg7ORADBnBzk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E9F3A610D5
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 17 Apr 2018 16:37:56 -0400
Message-Id: <1523997485-1905-13-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
References: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-devel] [PATCH v4 12/21] target/arm: Make PMOVSCLR and
 PMUSERENR 64 bits wide
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
X-TUID: l7oZI58Wg6fw

This is a bug fix to ensure 64-bit reads of these registers don't read
adjacent data.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/cpu.h    | 4 ++--
 target/arm/helper.c | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a56e9a0..9f769ae 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -367,8 +367,8 @@ typedef struct CPUARMState {
         uint32_t c9_data;
         uint64_t c9_pmcr; /* performance monitor control register */
         uint64_t c9_pmcnten; /* perf monitor counter enables */
-        uint32_t c9_pmovsr; /* perf monitor overflow status */
-        uint32_t c9_pmuserenr; /* perf monitor user enable */
+        uint64_t c9_pmovsr; /* perf monitor overflow status */
+        uint64_t c9_pmuserenr; /* perf monitor user enable */
         uint64_t c9_pmselr; /* perf monitor counter selection register */
         uint64_t c9_pminten; /* perf monitor interrupt enables */
         union { /* Memory attribute redirection */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 62cace7..20b42b4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1427,7 +1427,8 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcnten),
       .writefn = pmcntenclr_write },
     { .name = "PMOVSR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 3,
-      .access = PL0_RW, .fieldoffset = offsetof(CPUARMState, cp15.c9_pmovsr),
+      .access = PL0_RW,
+      .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmovsr),
       .accessfn = pmreg_access,
       .writefn = pmovsr_write,
       .raw_writefn = raw_write },
@@ -1487,7 +1488,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .accessfn = pmreg_access_xevcntr },
     { .name = "PMUSERENR", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 0,
       .access = PL0_R | PL1_RW, .accessfn = access_tpm,
-      .fieldoffset = offsetof(CPUARMState, cp15.c9_pmuserenr),
+      .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmuserenr),
       .resetvalue = 0,
       .writefn = pmuserenr_write, .raw_writefn = raw_write },
     { .name = "PMUSERENR_EL0", .state = ARM_CP_STATE_AA64,
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

