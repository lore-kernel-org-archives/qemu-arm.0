Received: by 10.223.188.70 with SMTP id a6csp1296394wrh;
        Fri, 1 Sep 2017 10:32:24 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb5I/zIqkLZya4fwWAOexR9hdRMF4OQvSsV16j6QDJNoe/JSgCpfuhOvgEwTmgXcB62SPOjY
X-Received: by 10.55.18.67 with SMTP id c64mr3383454qkh.10.1504287144492;
        Fri, 01 Sep 2017 10:32:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504287144; cv=none;
        d=google.com; s=arc-20160816;
        b=qUKSh6nB+a9UKbqJAoKQktHyaBm1q4R8pZ2Hz+w1WCStwmlmqcOak2TYHpk4zZCpiU
         kUCHQJySx+OeuFi0zb1Pa0s/nMF6HuG/qhcyGwQ2Q9oBZP9+ouSGL2aCOCRccyCFjRI0
         FY8L5tnw41ThLYYsjivpLQ6pbaSosU4mQvI+CJZKAQYmLIDfxjmYEdxQWUdh/dyCaBiU
         UYQhh7wwdP1iWZ3z1jcAp8zu2YKNa8GcpNZm7JzBfqSrMap7FyQO/eTRcbDQnaPbKCEQ
         a40Q2dNZipY/jMQnoCMrdbcedZw08BUM3kfKWOmyqcqmE+j9SqIJ+NXBVg932uq5bvy0
         X0SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=oOQGFPagikkMP5Y8gwJlgUTSJG9rFarDh0SFelk+Mtk=;
        b=jHPuNbVgAQpngR3kGPrbsv33ia91R4ybLdZn+YVc1MTQYQx86NsEFFDPz8XKCsV4gU
         Qn/+/cvdOsGm+IqCAANa93uBU84aqS91eH+bh2AU6aw2ujI7kVto9f+YbH++T+z8zZrF
         eiASq8wE96Eqm5BMAUxS7WjtqAdT3pZEWqWlnjtI2Vjv01IQ9vcpj98rDczz/XymYIVh
         lngXFlH/B/e4n7ziSkHXwatj9isRubNwAS3VwMWJhOWlkEhyMIHDoiFb22a6k7y9+1ch
         pTyQR77gJseQeSfFGs9Zk2iRhORIejYnQUt2yiZQhom+sC6vzeIDUKXvNRJqNOdzlC7z
         tutw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f56si569540qta.496.2017.09.01.10.32.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Sep 2017 10:32:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51355 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnpnq-0006lN-66
	for alex.bennee@linaro.org; Fri, 01 Sep 2017 13:32:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38146)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpgX-0007BW-EJ
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 13:24:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpgS-0004WF-Ms
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 13:24:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57970)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dnpgS-0004VL-E0; Fri, 01 Sep 2017 13:24:44 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 61A6661487;
	Fri,  1 Sep 2017 17:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 61A6661487
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-117-241.ams2.redhat.com
	[10.36.117.241])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2F99F17100;
	Fri,  1 Sep 2017 17:24:36 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Fri,  1 Sep 2017 19:21:22 +0200
Message-Id: <1504286483-23327-20-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 01 Sep 2017 17:24:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v7 19/20] hw/arm/smmuv3: [not for upstream] add
 SMMU_CMD_TLBI_NH_VA_AM handling
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
Cc: mohun106@gmail.com, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	will.deacon@arm.com, robin.murphy@arm.com, peterx@redhat.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org, wtownsen@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EwcelJfVPxCy

SMMUV3 does not support any IOVA range TLBI command:
SMMU_CMD_TLBI_NH_VA invalidates TLB entries by page.
That's an issue when running DPDK on guest. DPDK uses
hugepages but each time a hugepage is mapped on guest side,
a storm of SMMU_CMD_TLBI_NH_VA commands get sent by the
guest smmuv3 driver and trapped by QEMU for VFIO replay.

Let's get prepared to handle implementation defined commands,
SMMU_CMD_TLBI_NH_VA_VM, which invalidate a range of IOVAs.

Upon this command, we notify the whole range in one host.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3-internal.h |  1 +
 hw/arm/smmuv3.c          | 13 +++++++++++++
 hw/arm/trace-events      |  1 +
 3 files changed, 15 insertions(+)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index f9f95ae..e70cf76 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -289,6 +289,7 @@ enum {
     SMMU_CMD_RESUME          = 0x44,
     SMMU_CMD_STALL_TERM,
     SMMU_CMD_SYNC,          /* 0x46 */
+    SMMU_CMD_TLBI_NH_VA_AM   = 0x8F, /* VIOMMU Impl Defined */
 };
 
 static const char *cmd_stringify[] = {
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 9c8640f..55dc80b 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -880,6 +880,19 @@ static int smmuv3_cmdq_consume(SMMUV3State *s)
             smmuv3_replay_iova_range(&s->smmu_state, addr, size);
             break;
         }
+        case SMMU_CMD_TLBI_NH_VA_AM:
+        {
+            int asid = extract32(cmd.word[1], 16, 16);
+            int am = extract32(cmd.word[1], 0, 16);
+            uint64_t low = extract32(cmd.word[2], 12, 20);
+            uint64_t high = cmd.word[3];
+            uint64_t addr = high << 32 | (low << 12);
+            size_t size = am << 12;
+
+            trace_smmuv3_cmdq_tlbi_nh_va_am(asid, am, addr, size);
+            smmuv3_replay_iova_range(&s->smmu_state, addr, size);
+            break;
+        }
         case SMMU_CMD_TLBI_NH_VAA:
         case SMMU_CMD_TLBI_EL3_ALL:
         case SMMU_CMD_TLBI_EL3_VA:
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 15f84d6..fba33ac 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -26,6 +26,7 @@ smmuv3_cmdq_opcode(const char *opcode) "<--- %s"
 smmuv3_cmdq_cfgi_ste(int streamid) "     |_ streamid =%d"
 smmuv3_cmdq_cfgi_ste_range(int start, int end) "     |_ start=0x%d - end=0x%d"
 smmuv3_cmdq_tlbi_nh_va(int asid, int vmid, uint64_t addr) "     |_ asid =%d vmid =%d addr=0x%"PRIx64
+smmuv3_cmdq_tlbi_nh_va_am(int asid, int am, size_t size, uint64_t addr) "     |_ asid =%d am =%d size=0x%lx addr=0x%"PRIx64
 smmuv3_cmdq_consume_out(uint8_t prod_wrap, uint32_t prod, uint8_t cons_wrap, uint32_t cons) "prod_wrap:%d, prod:0x%x cons_wrap:%d cons:0x%x"
 smmuv3_update(bool is_empty, uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "q empty:%d prod:%d cons:%d p.wrap:%d p.cons:%d"
 smmuv3_update_check_cmd(int error) "cmdq not enabled or error :0x%x"
-- 
2.5.5

