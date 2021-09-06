Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3748823lfb;
        Mon, 6 Sep 2021 05:36:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlYrMmcM4W1jNJ268VO3I+l5WkP0Cu5YmtwNOdk12cJC4i9x7o4bvrtOZdx5ELgvcdeoBm
X-Received: by 2002:a05:6102:d8:: with SMTP id u24mr4079498vsp.48.1630931802808;
        Mon, 06 Sep 2021 05:36:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630931802; cv=none;
        d=google.com; s=arc-20160816;
        b=BzNtNBGfmds+EQlSlgjTv+gM7Ej7tRy2H3ajMIu8aheboWp1X9GIE+YNZ3Sh5lUGX4
         LFaWdhG5G23hc6ZKnZ4maPCTGH/PyPi+NmsTC+alAw4EpTRJkyFbxcpOh5tJGBv4bNVg
         AB73BaRrPGo08xdZXXhqFSmbFTLXUF+RrmHDez8gMfWqxUkz1uum2DbCvBBkh9YLHUwO
         IB9bLSgI+QXUn4P4cMsnB2CnI3Bda0hBmLu+0EvD3YSG5Vs9Z7UJslP9aFq3rVAA2gcl
         DcJQyAhk0PG7OKgg5eZMgK2tGk2ePJI9Thil6/ckQg2qxcoAdcgZV2nVaJvFHhlST++q
         Sszg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LK6aUScJjJPwZ8zofjWt0AwCUuJ5xKj9bLlJfK1d/s4=;
        b=BwTnZ5wdpppjsGuXdcGfB7KvNIM1crwnyqGC2rhKkxmwTAlGySzHSIIaFlVQFSR+/8
         zZkYOeoTVSEgqpE+Yb3aQkYBfR7arssslZAxg+GErBHjOfzNS6fMc5lSrfnaSndYzotP
         BN61lsnwUSCfQ24XiFU7zpoCGOn+Tjxov+2mnrh4aXS3KXJVh0VB9Ewjyc6ul8BxzEkK
         IirkvxcN5tqmF0XJgioUghi1/pdtFQx64bgxRTBJSRAoUeWY2z8EgPcTU+7GkDPo1yxP
         ujXryVlt5j24dmiY/a6WFQZQsEN8UO/Ji6slxWrh5KRW+FoflPag4StI81k+lpTOVDIc
         gSzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VgooU4+w;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p103si1901490uap.88.2021.09.06.05.36.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Sep 2021 05:36:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VgooU4+w;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNDre-0008J6-4I
	for alex.bennee@linaro.org; Mon, 06 Sep 2021 08:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNDp5-0006JM-R7
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 08:34:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNDn8-00020K-Rx
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 08:34:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630931521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LK6aUScJjJPwZ8zofjWt0AwCUuJ5xKj9bLlJfK1d/s4=;
 b=VgooU4+whK5paTblLmbt7TZKu2CLbP3L50ZIL/MKq+M6FAY9O5pF23czEeqOUJWqcMsMo2
 p8Sw34Yrko8QuUO839seCOk0ej6T5fD+zAJgDcXigySWNIPzSQvtOE2gmK9hZkR/6azegj
 9ZkoSK2EAaPuPo55TP9wAqSxDC6sqZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-k999USvkMp-GucyJo4X4OA-1; Mon, 06 Sep 2021 08:32:00 -0400
X-MC-Unique: k999USvkMp-GucyJo4X4OA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CEC7188352B;
 Mon,  6 Sep 2021 12:31:59 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 128AD1B42C;
 Mon,  6 Sep 2021 12:31:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, mst@redhat.com,
 imammedo@redhat.com, philmd@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 ardb@kernel.org, drjones@redhat.com
Subject: [PATCH v2 1/3] tests/acpi: Add void table for virt/DBG2
 bios-tables-test
Date: Mon,  6 Sep 2021 14:31:37 +0200
Message-Id: <20210906123139.93593-2-eric.auger@redhat.com>
In-Reply-To: <20210906123139.93593-1-eric.auger@redhat.com>
References: <20210906123139.93593-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: gshan@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sgckt8MIYyKZ

Add placeholders for DBG2 reference table for
virt tests and ignore this later for the time being.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 tests/data/acpi/virt/DBG2                   | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 2 files changed, 1 insertion(+)
 create mode 100644 tests/data/acpi/virt/DBG2

diff --git a/tests/data/acpi/virt/DBG2 b/tests/data/acpi/virt/DBG2
new file mode 100644
index 00000000000..e69de29bb2d
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf..1910d154c27 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/DBG2",
-- 
2.26.3

