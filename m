Received: by 10.28.173.206 with SMTP id w197csp3160419wme;
        Mon, 8 Jan 2018 18:04:01 -0800 (PST)
X-Google-Smtp-Source: ACJfBotFn3T885dFmyNdxbzbgxZe+uv7nHnBYZVPdxIZ38nLHv6y7TjPl1PytiEVpG31/rtVWVJc
X-Received: by 10.37.220.6 with SMTP id y6mr13121074ybe.27.1515463441587;
        Mon, 08 Jan 2018 18:04:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515463441; cv=none;
        d=google.com; s=arc-20160816;
        b=V5YcjYrZWcRV3LBTItuorrRNcuAbtCbKTfJkgZodzU++wXmN79UpDQlr68ZdhjcR6l
         w0IPvc/O5IG3i+Erx7U/TdNgbZoZr8CvLzuu1sVYY8V7HyrDM+KNYwP83w7kLsvYrZML
         3eiUdKjD1oWGrJXk8gXouCWNCGqDTfMu8aISpNBN5eoYNR4sgxLG9y/R73FE1wdXPcPo
         0GlrVibwMWjitrW4f3q6PQ4e2fZNdfkyZsA/ZIlZj7Y08EpJNPPI2FsTiPIJQuUIL0S2
         Qmj0mOxbF9wdGFQXzVDi++3Q5XeU0yz5Nwnfn/kkegk7VNYpjW77mZnXpe16uOy91zu+
         +f3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=iRVzwIyDIw1qEuietI0vBeTPalh4aD38YPF6cY00jBI=;
        b=mbuambc2UuK1PwZQ+kDfBn7k9wG0fmi9eNs4E0qKsNgrPu4X2qYpdwjYLWKYUOto7e
         H4w8a/tQH+dhx+kThPr07Q7IpXw6ErDf1vmxHCxkhjCIrRXzPLBvpSrhoA+eUbt/bsl5
         4+t1dtBKkYMviHPX4MyrKf6r+HJMLwAWl1i9oYhVj0e1Q1H6y8FdhaJaB5IaaEJ8ZI1u
         6yjQD+vfp9VjpEVrJhSuaz1A5jcnGYNsG5yZRHAUXWRquAK6b+rtAZwI9FURO6R3VnIH
         BHsehnd8DwRxtAx5bm9svUfu6tiYQtJ4p5+TLbiwo+P5XnXiG/vbFIattdCsZkXt0h2M
         FcGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DsdWCOIe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l13si2784967ywi.435.2018.01.08.18.04.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 18:04:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DsdWCOIe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45771 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYjGi-0003GB-Tq
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 21:04:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjEJ-0001uc-3x
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 21:01:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjEG-0002D9-0j
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 21:01:31 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:32843)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjEF-0002Cb-Ha; Mon, 08 Jan 2018 21:01:27 -0500
Received: by mail-qk0-x243.google.com with SMTP id i17so12342316qke.0;
	Mon, 08 Jan 2018 18:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=iRVzwIyDIw1qEuietI0vBeTPalh4aD38YPF6cY00jBI=;
	b=DsdWCOIeFSdujsufRlUyTgj/aOnLfgJ/On6qMgLGnuXbXPRKydfQUF15wkuiRRf+aU
	2NTTdBsc2YINg5k1+Hf5mfOjJqmDiia32Km1WdFFSATC+9YUzSr3/3WEHROkt7gmR/sI
	IEwJTViKq39p99KRGzmppprJ9JRk/gBFYvd8NSiX1E3R0x+oFwFMsXX65zmEQeWr07AV
	57EpMpHmNrQVFN3mboX0KFaGE8UCIf06DMBxWeQLSw+Qsf9q7YIO3pGZXdsPIxdjXTsL
	FREZZDV7S/el3f6rWusz5zEvzjHFMein07M52sWtM9K+SWkXEthaF+X7hb3Dx+2ySqJo
	2wUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=iRVzwIyDIw1qEuietI0vBeTPalh4aD38YPF6cY00jBI=;
	b=IrdKmEiQlQZShrK68gFTRtpZ6JiKxn0rw9EjJnxw7nRTR/OCsBlG4TxCkveOht/HLR
	NqG9He83WVw61oJU63xh/9LEsRXYi7FDXl2lOcWR4f/sFPob0vRwLuv36rNe4OoYuP2X
	0Lu5uSVl5o0A4EPqRqsARMyeUXAdDptiZKZIywH+zO8N8SxSm52v7FuIbw9biP7PBfmB
	5GIa/WDsJShivFDSxcDKzFqg28nElewIqdAE1brWqH1Ts1ykzrAIfrzlUcOAgjH0qpY6
	YuSxQChTRHm6SdVB9UcOEvEIDL79GuK+U5voKtu+WCW6+aRjQbEkkWZIuhYvlBa6XUW0
	x25g==
X-Gm-Message-State: AKGB3mJqjA5PlleVj2LLovf+LmOd8z1/m/qW1m659IqmeHJcbolJdSlP
	RQ5g7R/xhUIRwmcSmgsZSIs=
X-Received: by 10.55.165.3 with SMTP id o3mr19628109qke.262.1515463286785;
	Mon, 08 Jan 2018 18:01:26 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	r22sm8605027qtc.71.2018.01.08.18.01.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 18:01:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Date: Mon,  8 Jan 2018 23:00:48 -0300
Message-Id: <20180109020054.32553-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180109020054.32553-1-f4bug@amsat.org>
References: <20180109020054.32553-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-devel] [RFC PATCH v2 3/9] hw/net/cadence_gem: add FDT aliases
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MNr76qZMRxGe

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/cadence_gem.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 3943187572..34ff738bf7 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include <zlib.h> /* For crc32 */
 
+#include "hw/sysbus-fdt.h"
 #include "hw/net/cadence_gem.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
@@ -1552,6 +1553,15 @@ static const TypeInfo gem_info = {
 
 static void gem_register_types(void)
 {
+    static const char *gem_fdt_aliases[] = {
+        "cdns,gem",
+        "cdns,zynq-gem",    /* Zynq-7xxx SoC */
+        "xlnx.ps7-ethernet",
+        "cdns,zynqmp-gem",  /* Zynq Ultrascale+ MPSoC */
+        NULL
+    };
+
+    type_register_fdt_aliases(TYPE_CADENCE_GEM, gem_fdt_aliases);
     type_register_static(&gem_info);
 }
 
-- 
2.15.1

