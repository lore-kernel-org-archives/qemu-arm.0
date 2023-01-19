Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp132747ejc;
        Wed, 18 Jan 2023 23:03:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsD3rr5GYTe8aJhmm0NAOpOgNH7vmWdZCfcxXI+YAdRhy5cJdFRo6PJbGq72CBmgsl11TOp
X-Received: by 2002:ac8:44a7:0:b0:3b1:54da:d629 with SMTP id a7-20020ac844a7000000b003b154dad629mr12559649qto.34.1674111831672;
        Wed, 18 Jan 2023 23:03:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674111831; cv=none;
        d=google.com; s=arc-20160816;
        b=Sq5wqTLSIXzHv4qKbo/JBMC4GRdHlQRb+BnbjPUUKz33yXuaae+ThvVlxnhJIR6UdD
         NmTe3IhBcyaz+eScqIHzfYgSUAVY+6dtOLQ/uorW7k8YFNWVUppp6PuXJCFHaj7OUKNf
         hK7CTZ+zLDZHqX4c/RFKshh9XGjyx7afpW2EGiBqtzF12u2f0flqt+dsKcpHysNFlVcQ
         2TkjfBOi+PQJANHTiDoXpBJ8+k8++yWMZOLWel3laImqHXoCqIU6tY+fSNpU7nigcGwZ
         ztFbgChvyXPSLO4yFH4gsoOxjyamBCrT3XSJmFqI2EYXJHG8oHpSBYidTUtY+UvhfVJH
         outQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3Q6JawOwNUX79rDzr8EPQtv6xKDyu95x0CthaLOBjJY=;
        b=OWhW9pAgZMwbw3zv1/DkeUPZ2NTwBg8VlosT8i2B+SK4gAPa3Ho6yVnmbZaallXdYJ
         rI7w4DrXUUkfQmZYudwD1N8MjGrPz47S1TlojL0i/6ukDCWYLznA2is2LC9bg9D3TUAx
         y8bKatvrbU+A2QneO656y34uvlKqe71agenNM9VWqyNQiHPfYOKOrfac3TIEtvqdeF6T
         6h2z/pxvUPFr+XHa86GyB3/68NNP8uLVhXtS33wpKIUzl/lOcKqrQUHUPs9s3VvorscV
         sAW9GfhWI0tE750ZlDMhp3WXlG7KEBqA71baaqoVjMGjj0llz7Ewl29PCBoTxpSTzwg9
         vzPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Z/haToSu";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fv8-20020a05622a4a0800b003b68b5a08f6si1978141qtb.49.2023.01.18.23.03.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Jan 2023 23:03:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Z/haToSu";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIOuy-0006ot-QG; Thu, 19 Jan 2023 02:01:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOuM-0006Mr-CF
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:00:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOuI-0008Am-De
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:00:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674111608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Q6JawOwNUX79rDzr8EPQtv6xKDyu95x0CthaLOBjJY=;
 b=Z/haToSue7U6YwxbAv/qcFpoYNxK5aQ4DdMXmgjrUYG1lZ5KIkX4TkUlhMdg3iVW2iyD1K
 CguL2b4CKXji8GkJrC0MrRwaYwx+xq27vffcJHJA1CtdTeZpQn0r5CGBxCPgkLaxg5SRSl
 vOuwK4ckKtXW5Qq4eXv1OYALDciiSBY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-aajyhcBPO_if6EqpbgRvHA-1; Thu, 19 Jan 2023 02:00:04 -0500
X-MC-Unique: aajyhcBPO_if6EqpbgRvHA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 637BE80D0EB;
 Thu, 19 Jan 2023 07:00:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CA0A492B01;
 Thu, 19 Jan 2023 07:00:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 568B721E6821; Thu, 19 Jan 2023 07:59:59 +0100 (CET)
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
 qemu-riscv@nongnu.org
Subject: [PATCH v4 08/19] hw/tricore: Clean up includes
Date: Thu, 19 Jan 2023 07:59:48 +0100
Message-Id: <20230119065959.3104012-9-armbru@redhat.com>
In-Reply-To: <20230119065959.3104012-1-armbru@redhat.com>
References: <20230119065959.3104012-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
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
X-TUID: 6Nb3n2xJpoqU

Clean up includes so that osdep.h is included first and headers
which it implies are not included manually.

This commit was created with scripts/clean-includes.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/hw/tricore/triboard.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/tricore/triboard.h b/include/hw/tricore/triboard.h
index 094c8bd563..4fdd2d7d97 100644
--- a/include/hw/tricore/triboard.h
+++ b/include/hw/tricore/triboard.h
@@ -18,7 +18,6 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
 #include "sysemu/sysemu.h"
-- 
2.39.0

