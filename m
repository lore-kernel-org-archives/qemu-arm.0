Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp384268ejb;
        Thu, 2 Feb 2023 05:41:50 -0800 (PST)
X-Google-Smtp-Source: AK7set/zQfzh6hrrounDMSUaT2tLyR9xL2BVHNKFJojf4yxuBoQiM1D/4+K6W0iBee6UmGlmyOl3
X-Received: by 2002:a0c:c20b:0:b0:51f:f4f4:e4f8 with SMTP id l11-20020a0cc20b000000b0051ff4f4e4f8mr8479811qvh.25.1675345310596;
        Thu, 02 Feb 2023 05:41:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675345310; cv=none;
        d=google.com; s=arc-20160816;
        b=eFNjykfYv40lx/H8JcIGJMtgpnmpUzXAAhI/rhBf4oJjrq8Nia8w7Sx4efcaPon3hw
         nVI5cUPpCAxY1CtDYRv+ZIWfVxCnmeiwsuXVLZCzV/QabFOVAKSPY0KJ7MffawuDLuwl
         iQjZNrvk6N+98HYazCSvLhojm2SiCfPVCqjJbnFJQNkCNUrPuO8gcZD8thxnUr+W0ofw
         LhnTC7xsof7TUQlUWAzljfjSzKggD8Q/LaC8RITrPgQ57s/vHuXeQn72xav7VcJ5JXp+
         +9tsp1Y5neOli4HpEherlupx6ubHhmk6mYNkJMRKemPWeIHffc9m2NnFG5Ez84IgPtOd
         n+mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4rlqlORfAGdapcWelCj8imJUNWe566i/j5mjT7jTFcQ=;
        b=uvrKeNO0vxvP9TG54FFvioLkxwHJCn3inFsvaZKt68mqEv7kYcV42E3Ann6xB437/l
         hE53B5JDgAxS6X+oB6LLKrFiQNrS32nDwAjY9P2HCf1hLX4iVEeEJQ/dHpgcCt/1l7NL
         o/GeBl0Q8OHYR+LAU7BPnRpy+PdBayCz9LbStHyoqc00hlMTuJ4ROZCxLCpE0dKO9Q7l
         IrA66ZWaBT1vciPOZSQ/y/WHgUi9Eh4PoF0l530bsc/YpUs2Ht4FzxJBa8JFDmE91j7X
         2c7L9ePsOM/5Pu4swm7F8Q4y4ImBQHp+Tp8w52UKAPYM7ftmlLeufWOUMeGf6WhGqREO
         ejZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bDjF6qBx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v18-20020ad45292000000b00534f2e547afsi11685922qvr.205.2023.02.02.05.41.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Feb 2023 05:41:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bDjF6qBx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNZob-0006uy-IU; Thu, 02 Feb 2023 08:39:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNZnq-0005dt-Ck
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:39:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNZnb-00088d-QN
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:39:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675345122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4rlqlORfAGdapcWelCj8imJUNWe566i/j5mjT7jTFcQ=;
 b=bDjF6qBxfij6Bdyyiz1TWu2EjhIIegoGQvaOiWG2CCJuREEYY2/3PnJMzHSL/+HsdXA8sI
 oHm7OrjvZ84/G6cefJ/KwY5bcEBctB4QFLyDnXxZYGxLGOIzTwiQdPm5AL+ZJwRbGygYX3
 fyFNHNvRbN/gA3x1by0IobqHkdgIK9Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413--tC_W_xaO7yVsxmqRKEmbQ-1; Thu, 02 Feb 2023 08:38:39 -0500
X-MC-Unique: -tC_W_xaO7yVsxmqRKEmbQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3947A1C3A07B;
 Thu,  2 Feb 2023 13:38:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAC5E492B13;
 Thu,  2 Feb 2023 13:38:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D72B521E6915; Thu,  2 Feb 2023 14:38:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com, philmd@linaro.org,
 peter.maydell@linaro.org, alistair@alistair23.me, jasowang@redhat.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 14/20] riscv: Clean up includes
Date: Thu,  2 Feb 2023 14:38:24 +0100
Message-Id: <20230202133830.2152150-15-armbru@redhat.com>
In-Reply-To: <20230202133830.2152150-1-armbru@redhat.com>
References: <20230202133830.2152150-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jyMWRqnKCqBs

This commit was created with scripts/clean-includes.

All .c should include qemu/osdep.h first.  The script performs three
related cleanups:

* Ensure .c files include qemu/osdep.h first.
* Including it in a .h is redundant, since the .c  already includes
  it.  Drop such inclusions.
* Likewise, including headers qemu/osdep.h includes is redundant.
  Drop these, too.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 target/riscv/pmu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
index 3004ce37b6..0c819ca983 100644
--- a/target/riscv/pmu.h
+++ b/target/riscv/pmu.h
@@ -16,7 +16,6 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "cpu.h"
 #include "qemu/main-loop.h"
-- 
2.39.0

