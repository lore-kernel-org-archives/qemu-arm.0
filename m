Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3949485wrd;
        Tue, 11 Sep 2018 04:29:27 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbJldJOsAoq2uVhoC5N7qE/EMCdLvsTM/ymmyAE0ztE87tUVIxEl17EoxEsAsTWW793ftnY
X-Received: by 2002:a37:48e:: with SMTP id 136-v6mr18778294qke.26.1536665367215;
        Tue, 11 Sep 2018 04:29:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1536665367; cv=none;
        d=google.com; s=arc-20160816;
        b=b9RgtogMXls2t1RRWPU8flqaAMZgRxPzJ/9F5gt+ORP8onYCsUShb9AvowdaIc4qCG
         +AIoft6gf2mb98NYOMWygPG+7zpwQ2iu61vnhRFJoQqxewkZR4RfL7u/1qg7ubqExdbv
         FKA3joNtJHcknGpCbL1NkOBZK95RknngMQcV0YZpZKYxbAuVGVR+t4l68YVhgW1AA6kG
         b2kq2DqXoaG/OYoBE1m+KRYQcnRzGR0olJKpPlCGmdjvKH0GpAIdZRaLYcFd5P62uhId
         gwNqllvIRuM5oeJEvSOdasAEooNpnx7y847WYk1Evh2ZhrBx3un9hAf/EEfIy0zbrxye
         NGEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=ti22XjzuA3P2U7p+yTUxOohe/3zSfTZFYWpxuFBcVTY=;
        b=nbeWkhZQQtdvSzNO6lePOje/UTHRHEyemW+I9LL/5U8wPUHyGBxbw+xDm/9hTYh4TX
         oBgd+kjs+N9QFglirvv/R/5zc/sTiv2PRoVXpTk5/1B51xCtWqsVIH07pWabcApm6w+P
         C1w83BYgumTTzPoWStAD7S2eUj2MlQkKX9QfbrD0FzNCZqH4W8t+h94bvr1DbDXqu9U1
         LhmQHOUj7TpyGCOop9ymGCroHjJEx/ULKGTVxFAeTtDFe1W3Oc+21lUSkx4kkQEMg6Ed
         na5+ClLvRv6yj8dZS79NCIDJoTyNU8qQVsMRz/Nl55s2C2mN6Ejx6KjIz/4x+o+eDeA2
         f+Rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uQDRatB1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a67-v6si496107qkj.35.2018.09.11.04.29.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Sep 2018 04:29:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uQDRatB1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57023 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fzgrG-0001Xm-NW
	for alex.bennee@linaro.org; Tue, 11 Sep 2018 07:29:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59502)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhaosl@gmail.com>) id 1fzgoz-0006qi-4M
	for qemu-devel@nongnu.org; Tue, 11 Sep 2018 07:27:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhaosl@gmail.com>) id 1fzgoy-0000YB-BJ
	for qemu-devel@nongnu.org; Tue, 11 Sep 2018 07:27:05 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:35532)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <shannon.zhaosl@gmail.com>)
	id 1fzgom-0000OE-W6; Tue, 11 Sep 2018 07:26:53 -0400
Received: by mail-oi0-x241.google.com with SMTP id m11-v6so46451494oic.2;
	Tue, 11 Sep 2018 04:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ti22XjzuA3P2U7p+yTUxOohe/3zSfTZFYWpxuFBcVTY=;
	b=uQDRatB1al/ZZnLCGJ5H+m1Ayr3lf1KW1au0xL7MJkPiqnjmfEQ0VMAxwvvS+6OjzZ
	12IpZ3wRkJVxsI5srblbhNwYdBmRUSRjQ/sjwqKWXfT0B89yaL1kBgyQqViS4pKNT9Rb
	LoJSZJ5IoQzMAu1deMi49M3Mx8DQEkFmJIDGZ4h9h4mYYlUtNvLrcfwfUfM1qWtVVWsz
	Edx49e1omD/wZ02XKOCaoLFs14kgq9qJwCBpKUEN51i4fIT9HEORFvZdAt8M3qGpbY3a
	ya8s8JW/voortJ14wSJqfQ2Qp4OjzBoFRqI7xWqH80uXqX2oJwGdfeVDBVW0tiICjOsF
	MLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ti22XjzuA3P2U7p+yTUxOohe/3zSfTZFYWpxuFBcVTY=;
	b=NR8KeVzIdGPin/QrnaRYzMj7v+zI2h39p0EO1x/3nlYPdxOAoE+zwdbfiScGo3Xsgc
	O7olYw/Yhu6P8KDmRMaalNEuJh02BkptOhpVfXmTJv7IqmwnCBTgks9vLqTO6NLC6xRJ
	yfJGXIpsdHo5kg0F4NZjH0Sz4FQHI+CGWEgC7dt/ouTq2P6SW5DtBcTUc77Otg++whVa
	+7vA2yLIcXexwO725liFp7pd6nKsh+gXC35ABKNHLF7pwwXZNpW2ak8O/JQXeaVbOLEn
	bTvaYQcY1B90yro82LxT+cNjkGkTe2JxBCU08dZics13dS2MpwKvbwzJai+htP7eKQMB
	nZEw==
X-Gm-Message-State: APzg51AJw4PLxF7AU6U9S+Ljwa7OMjTL+Rjj2c7UY87jntyzOFTSZySf
	MnoFsgF+gDhth0bqB4Q8DZKEu+bt
X-Received: by 2002:aca:7513:: with SMTP id
	q19-v6mr25237465oic.13.1536665210608; 
	Tue, 11 Sep 2018 04:26:50 -0700 (PDT)
Received: from MININT-0CAG7HA.hz.ali.com ([47.89.83.37])
	by smtp.gmail.com with ESMTPSA id
	w84-v6sm15341456oie.40.2018.09.11.04.26.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Sep 2018 04:26:49 -0700 (PDT)
From: Shannon Zhao <shannon.zhaosl@gmail.com>
X-Google-Original-From: Shannon Zhao <shenglong.zsl@alibaba-inc.com>
To: qemu-arm@nongnu.org
Date: Tue, 11 Sep 2018 19:26:43 +0800
Message-Id: <20180911112643.19296-1-shenglong.zsl@alibaba-inc.com>
X-Mailer: git-send-email 2.18.0.windows.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: [Qemu-devel] [PATCH] hw/arm/virt-acpi-build: Add a check for
 memory-less NUMA nodes
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ioO5OEfwf9Eo

From: Shannon Zhao <shannon.zhaosl@gmail.com>

Like commit 16b4226(hw/acpi-build: Add a check for memory-less NUMA node
), it also needs to check memory length for NUMA nodes on ARM.

Signed-off-by: Shannon Zhao <shannon.zhaosl@gmail.com>
---
 hw/arm/virt-acpi-build.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index ce31abd..5785fb6 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -562,10 +562,12 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     mem_base = vms->memmap[VIRT_MEM].base;
     for (i = 0; i < nb_numa_nodes; ++i) {
-        numamem = acpi_data_push(table_data, sizeof(*numamem));
-        build_srat_memory(numamem, mem_base, numa_info[i].node_mem, i,
-                          MEM_AFFINITY_ENABLED);
-        mem_base += numa_info[i].node_mem;
+        if (numa_info[i].node_mem > 0) {
+            numamem = acpi_data_push(table_data, sizeof(*numamem));
+            build_srat_memory(numamem, mem_base, numa_info[i].node_mem, i,
+                              MEM_AFFINITY_ENABLED);
+            mem_base += numa_info[i].node_mem;
+        }
     }
 
     build_header(linker, table_data, (void *)(table_data->data + srat_start),
-- 
2.9.3.windows.1

