Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp941628ejb;
        Mon, 30 Jan 2023 05:23:18 -0800 (PST)
X-Google-Smtp-Source: AK7set/I8aY/OKLmis3hD3hXnuFVso9Ijhe5RsjtUaguwOoh9ObHhoeHl6paBOVu15vwIrKv+YVX
X-Received: by 2002:ac8:5755:0:b0:3b8:525e:15ec with SMTP id 21-20020ac85755000000b003b8525e15ecmr11918941qtx.27.1675084998593;
        Mon, 30 Jan 2023 05:23:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675084998; cv=none;
        d=google.com; s=arc-20160816;
        b=KgK7LV+rmhiZRWcTAWOqaEmK7h6L/4GFd9p8Y7pzVaMe9p3KKuHvp5qg+JZZDlOShe
         9U/b5YPqAt0x7SqTN7bgk0u8wOmLXBPaseQk+h46BPvsjX7Om/ly5rGy9A9rIaxOeH5r
         M7KXcmL29znhAs138H8knFPf/2v4hTbRaiCYYojruPOcVCuqtnnn9ksfI2BLGZ4DJb0u
         6ghDDx79ysU80zpLRPQGrftt5bndtlLszAIvNjXkeyML70WwHUWoq7Eru5KEcVOSzU20
         6flJZoiUM7SA/3j8NYzCeprUOJ0lQy0La8i4Z67OoMca67AA630Nd7paPkk58AMu7J37
         uD9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/362Z3pcgaH/3G/FmJLvNtlNA+dkVrK5ca4wZjXOGww=;
        b=NXjMb2d30kawxIFEH9pn91efz4jKPyX11DYvVdLegb95oOal8dI5Lv05IPSW2Ypkm9
         atvT7maa88DS0gVdZBj9QYbKgtwMAP9QkKMxz6JMJBPsAbs+OjEkJCu/76NLDRXl2ISo
         pUiPMlln4A/1npCPkZc4/WruksrWbytF7+y4gDQME3v4rZEjfwYc0UMPEjILpLQmZ1TE
         PZxrfQaxxJvuJnWD3RiP9NFZrw1CzDrFwRm8Nl0NMtACFKQDKBZRZbIzkqYHy7LTrCHw
         NztG9WWTMBW1nMXCoCZ/XD+Jqwf4m8iKtOvd4Te3wpoB9qy5UOerOKM+BbOXKKsYkBJI
         1REw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hRcHFqd7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11-20020ac85e0b000000b003a984ea06e2si6512609qtx.208.2023.01.30.05.23.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jan 2023 05:23:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hRcHFqd7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMU6x-0004b3-MJ; Mon, 30 Jan 2023 08:22:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU6p-0004Fz-MC
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:22:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU6k-0005hQ-K8
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:22:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675084921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/362Z3pcgaH/3G/FmJLvNtlNA+dkVrK5ca4wZjXOGww=;
 b=hRcHFqd7i+wBuGNJvVqJipwUVWfyu46u6wCNN3QuI7Pz/aueT99ZZw88U7sa4nTTYXqrX0
 CoOyC0ByAKN/gzSVGcPowtf21YI+i5yZwUaTZNQncX8dcFcpDVTscvebTHCDGjqaBiQjD1
 r6Bt7jZJeZA2VkvE1kqmuBHeUVfUn6Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-yuw6uEm8P0avxDzICJrltA-1; Mon, 30 Jan 2023 08:21:59 -0500
X-MC-Unique: yuw6uEm8P0avxDzICJrltA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE55429DD987;
 Mon, 30 Jan 2023 13:21:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A4C75140EBF6;
 Mon, 30 Jan 2023 13:21:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6803B21E6915; Mon, 30 Jan 2023 14:21:56 +0100 (CET)
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
Subject: [PATCH v5 14/20] riscv: Clean up includes
Date: Mon, 30 Jan 2023 14:21:50 +0100
Message-Id: <20230130132156.1868019-15-armbru@redhat.com>
In-Reply-To: <20230130132156.1868019-1-armbru@redhat.com>
References: <20230130132156.1868019-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: vkLs943WPl/f

Clean up includes so that qemu/osdep.h is included first in .c, and
not in .h, and headers which it implies are not included manually.

This commit was created with scripts/clean-includes.

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

