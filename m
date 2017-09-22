Received: by 10.223.172.38 with SMTP id v35csp3210752wrc;
        Fri, 22 Sep 2017 08:01:17 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QC6OAUKKrcYdFX0cZGnwzFQt+WvKCnsZyvhkt/gzOfkePHaFKvuo+5eYyxcsk3yuenwcslR
X-Received: by 10.55.74.133 with SMTP id x127mr7679378qka.239.1506092477643;
        Fri, 22 Sep 2017 08:01:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506092477; cv=none;
        d=google.com; s=arc-20160816;
        b=IQ0jaZ9FoFGdW78dYxTTwwnPkcamPcO3hsYUiGzOo8IpprqNNUh6NjItyS8DXIu+O9
         34xXJKtACkAqxzf9EE9ftG5oJ6I2e+YBEcjPFthu0BbBnyS4IuWEBoECSHp0q+WiNRVU
         pESjm4XfTN7xvwJ2G/4oEfNbMea3UB1P1ov3pSR4HRFTu93NCMvhObzZwri6J+fqzMNl
         skgspQtVfjbPP+2ywNhkSNKdoSqt7fIBEBQKHYowI6DHIp4uZI7zAHIo/M70ubltziE8
         KsEiOIYPzNSmMDA+XjZaA9K2aw2937DY5ODIShWYYhGpaIZ88jqAt33Qeq2cwib4MrRb
         Z06A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=WciqT5eXNhVuhRnPYJEgWwPg+vb1oPeS/CAmqHTXfhA=;
        b=ergdfaRF2AOIHTew5g28jR0EUBHtAUGMRtq1uPxmCSCuLM6Jc3fTMXd/LNMb1SYSIg
         atce9cmDnZC06rdbSWge1mmjr0UoH0ykefkW+XpZku/WWDQ7nq18WJcPTqZ3+5l47s8n
         khV8I2nweLinZdzY2Sr7FNOb1x+NcvDiPid3qoKlnB49XtQgqAojaDDuKZq1P+k/GA7W
         SYilQLa9EJUD2Qb6t3f1lfzXXbJrFspUUtkNUnYWDIfGHJgw3C7abDaNS/I4oWTeppkN
         22PEOrpp2Q1Oo4BfuR8y3nFu8QLLwlLe2SjrT7uaPZfQDwBHrF+8RA/1nyspDG0JHMRp
         j02A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z144si17083qkb.253.2017.09.22.08.01.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 08:01:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59319 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvPS7-0000o9-Gh
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 11:01:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46821)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQU-0007s4-KY
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQT-00040k-UD
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:34 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37544)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dvPQT-000407-Nl; Fri, 22 Sep 2017 10:59:33 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dvPQS-000790-H2; Fri, 22 Sep 2017 15:59:32 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 22 Sep 2017 15:59:51 +0100
Message-Id: <1506092407-26985-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 04/20] target/arm: Restore security state on
 exception return
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
X-TUID: vi7T17jEB1iK

Now that we can handle the CONTROL.SPSEL bit not necessarily being
in sync with the current stack pointer, we can restore the correct
security state on exception return. This happens before we start
to read registers off the stack frame, but after we have taken
possible usage faults for bad exception return magic values and
updated CONTROL.SPSEL.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 509a1aa..a3c63c3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6371,6 +6371,8 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
      */
     write_v7m_control_spsel(env, return_to_sp_process);
 
+    switch_v7m_security_state(env, return_to_secure);
+
     {
         /* The stack pointer we should be reading the exception frame from
          * depends on bits in the magic exception return type value (and
-- 
2.7.4

