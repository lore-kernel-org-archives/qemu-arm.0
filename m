Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp5576442lfa;
        Wed, 4 Nov 2020 02:34:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyr5qLpwjZjYMWZT8QgEHw0jf26cFNsv2G/tOMDME7ohOM7vHxU0Sd85d9OhMAWyE461CO8
X-Received: by 2002:a25:2389:: with SMTP id j131mr32181022ybj.124.1604486042345;
        Wed, 04 Nov 2020 02:34:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604486042; cv=none;
        d=google.com; s=arc-20160816;
        b=Y2W4OaEJohcyfNcgd4C0SaCpUS6FhgLwZxTi3hu1PlKUIMe2Za58p8QcAJOB3xX7Pb
         o4u3DJQ4ntpnjGoX7ATMckpFq0iz5EECRjjMWiizMsm0JeDXr4MiuQJDGx/oF0MCpNoL
         Gqee7eyNelI7bkETTRNqkphWyFz5fOlrS/u7K7t5gBCMRCLFdKQL9HDUhhO4Hk803W7Q
         Pr46K7YZvEiRjHCac4D+DALSjyoulubyc1aJcZKeoZobPUwU1bR6dAGje9msyj7uewDf
         Sd5brNcMLrSd6bXHBYtmevyVSy1Z6rViphvjs3dVkODwu/l9bY6Zjc4guMZJl8C9CA7d
         AxfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=SCYTCJZoPtuTkcxQDcG1n/GSFdqBYce7+yR57hQbrLc=;
        b=DiVJ7woEkRFI+EHDAgo+qhElLrxTfGPdtFa42C+sk4//NovUSblA2K2GboGua7ytF1
         gh02W5BYcFv6m1ycbV0puUPrcgMUHLMNw+pRzzK09Tt3da+fU9hrCR53Wyomhm0QhyFL
         1W9JHvnHBsq0mZCC4Gj4Srr/B+XHjI5RchtClbUEBoW/flytgzdssSf/d3w8wzAAsuaE
         A0n9f6RNNodn94m8gWLy/x7ocq8E4o8oihvDdBiF7FDZxs70bK6rFnDDanIwiJD5gsC3
         3DKmvJIFswyShvfa44Xmb1PsdvcVpLPBF87HVtTVk7H10/8HeKK6sh+IQKikYsYANPui
         R26g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WAjQlBDN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h127si2067699yba.254.2020.11.04.02.34.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Nov 2020 02:34:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WAjQlBDN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kaG77-0004QM-Mt
	for alex.bennee@linaro.org; Wed, 04 Nov 2020 05:34:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kaG6y-0004OJ-4F
 for qemu-arm@nongnu.org; Wed, 04 Nov 2020 05:33:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kaG6w-0003ir-Nq
 for qemu-arm@nongnu.org; Wed, 04 Nov 2020 05:33:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604486029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SCYTCJZoPtuTkcxQDcG1n/GSFdqBYce7+yR57hQbrLc=;
 b=WAjQlBDNYQjgNUlJnyfHcwthUgwUwtZ43no6Jc6muZkGdpY/gpOiXruEuV+ezsPPE7fpLl
 2dhGVM6kXAgIRCBS8wAxNcxoL8D5YaxY/NcpFEsaT9uhtWeJ16W70NeguE+TEistjX3Osq
 qA+EJZ0yttqx9G1PeGazg8S8Qb/EQyA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-cHytBQbpOwyFvZC-rbm0Vw-1; Wed, 04 Nov 2020 05:33:48 -0500
X-MC-Unique: cHytBQbpOwyFvZC-rbm0Vw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDB33108597A;
 Wed,  4 Nov 2020 10:33:46 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D2F710013C1;
 Wed,  4 Nov 2020 10:33:45 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH] hw/arm/Kconfig: ARM_V7M depends on PTIMER
Date: Wed,  4 Nov 2020 11:33:43 +0100
Message-Id: <20201104103343.30392-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 22:09:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, f4bug@amsat.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gfyvK1Jxg8rr

commit 32bd322a0134 ("hw/timer/armv7m_systick: Rewrite to use ptimers")
changed armv7m_systick to build on ptimers. Make sure we have ptimers
in the build when building armv7m_systick.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index fdf4464b9484..7d5d89e1acf9 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -291,6 +291,7 @@ config ZYNQ
 
 config ARM_V7M
     bool
+    select PTIMER
 
 config ALLWINNER_A10
     bool
-- 
2.26.2

