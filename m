Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2470222wrd;
        Mon, 24 Sep 2018 05:31:59 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63NDbewOnKzpR8X65q+DqqWwBPE5K4kh1sdCpxOetS8ukLalYMU8mPvUMp4RdGB0jgF59mx
X-Received: by 2002:a37:2f82:: with SMTP id v124-v6mr4455192qkh.1.1537792319281;
        Mon, 24 Sep 2018 05:31:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537792319; cv=none;
        d=google.com; s=arc-20160816;
        b=s13jV75LEZNqdDnFi70ASQC6yiIxxBuZSbNL9omUGZWQQIzP9xWlJqeRiTtMXc438M
         94m7SAoZ/W+WHzYSKHz4fU73SUMxUXEKI1PsaOOi12iU3nJQCfpx2g6uwjnA5ybY3moI
         nn+8+u+w1W7SU4BCJV47MqG5Syerg6pMr6V2i4z4wnHYXFd+MNPkFRnMS/Lfw89Mlwy4
         Bh9uEuqUmzlRoTtSTuEd9/D9DQ/yOfZcMWqPt0BT3oIR8UP+NJKEB1VeVlZnkjzLTqlm
         IpJKQLAbLaj6q5GljCa0tU46PGai5UldOpmIX6GtteDYX06y9yqn/WkYNfKampk8Q+Vy
         dSwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=Q9w3I8BpytM7cVady+XJr6tPsR/mATEvk5J7vCgGNzA=;
        b=EveJ6w4vIJr8u2Ins5ZAsNrbr45l4DTUIQ67+QGSm8g3BWVE+cMK53yP+FlZ8netuW
         9LWnUH3EPgBVAtZrTrn9ib1ZoHwaAknAEmM4rXtXVsfH2Ls7iO+BYQ14nJqGfZx5szK/
         7bTY4nPDpryGJArTC+RU0nm3KJMPnFvyZOPaRsDr41qECSFwJOjMnwtqfznRiTCBsEWN
         GCPD8j3HysRmHiqvB67KUeNwqcFdGrYClHLflIiFuu0hWRgqTbXBowB3MAlPRreolT9M
         lMi1zpprRcqi3CIODlLScNf4Ballg98g+ASM2+Qe46uqJIluuUxoR+YcnIsN9GoeyRLz
         Q2jg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h189-v6si1145091qkc.297.2018.09.24.05.31.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Sep 2018 05:31:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44973 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4Q1u-0003Q2-OZ
	for alex.bennee@linaro.org; Mon, 24 Sep 2018 08:31:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59437)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g4Q1e-0003Ov-Je
	for qemu-arm@nongnu.org; Mon, 24 Sep 2018 08:31:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g4Q1a-00062c-HQ
	for qemu-arm@nongnu.org; Mon, 24 Sep 2018 08:31:40 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48584)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1g4Q1Y-0005uE-4u; Mon, 24 Sep 2018 08:31:36 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1g4Q1N-0000RO-NG; Mon, 24 Sep 2018 13:31:25 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 24 Sep 2018 13:31:22 +0100
Message-Id: <20180924123122.14549-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] hw/timer/cmsdk-apb-dualtimer: Add missing
 'break' statements
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1TJZ2bWDq9oJ

Add 'break' statements missing from a switch in the APB dual-timer
write function. Spotted by Coverity as CID 1395626 and 1395633.

Reported-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/cmsdk-apb-dualtimer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/timer/cmsdk-apb-dualtimer.c b/hw/timer/cmsdk-apb-dualtimer.c
index ccd49753b7f..30245990f34 100644
--- a/hw/timer/cmsdk-apb-dualtimer.c
+++ b/hw/timer/cmsdk-apb-dualtimer.c
@@ -296,9 +296,11 @@ static void cmsdk_apb_dualtimer_write(void *opaque, hwaddr offset,
         case A_TIMERITCR:
             s->timeritcr = value & R_TIMERITCR_VALID_MASK;
             cmsdk_apb_dualtimer_update(s);
+            break;
         case A_TIMERITOP:
             s->timeritop = value & R_TIMERITOP_VALID_MASK;
             cmsdk_apb_dualtimer_update(s);
+            break;
         default:
         bad_offset:
             qemu_log_mask(LOG_GUEST_ERROR,
-- 
2.19.0

