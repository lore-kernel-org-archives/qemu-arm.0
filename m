Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp506045lfy;
        Fri, 24 Jul 2020 09:43:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8zfAREvd7TURY+YTMNvl3s/EX3qLe0atB976YZ/K/jxYp1000QLZZ9FNqkY7eKT8VNzn9
X-Received: by 2002:a05:6902:52d:: with SMTP id y13mr8547520ybs.94.1595609016294;
        Fri, 24 Jul 2020 09:43:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595609016; cv=none;
        d=google.com; s=arc-20160816;
        b=kHFivRwNxTjeHx1wvm2uKRr+9BwBVC8oU74t8v5dq5TY+VPWZCNQt1k/hdQIEQDJ6N
         1JVoNV9zyyfmUtljbkMiK9e9HBYwQ9GIdH+z1UK0N4KgyEQAYSNI/iXSy0+LwkkohJuh
         K245EQIi+FFdV+QLydzp4x/lz8lwNAGKsAPDJrwfZPIE5kjfHMAAz+vMReyIAh2oM8DT
         4dCyMhm/rySD96CAgnG5xKtK4B0A3oZx5tgh4n/jUhuljAoWFKMamLOU3Zc1tBqiN32n
         xKBIpZ1KdhJobB4jrtOGmeIrikZ7agG8T5lR0/MKN5lyeBot7csj6AgUyh5ruzFOzOxL
         DhkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=HjciOT3EI31nPUC4rwgPKpHpeL3y2GcS40JR0oEFXyw=;
        b=u2diZfHgkmbTUEgTJMJs/5JTwtkIlqsqQqp2BEYvyZPcfLa/D0i39zOXv1AhmeR21E
         6eilofoqKfPnzLN3OMAaJLZCO4BZB4DhuXXa0kb+3GCv0mAtE6c4SKfJNcaonBxfK4k7
         F/C30SkbQ/ijcP7vImQThiVYwRRMJB/TxZ1T/CxrenvQq6rNeIyWWn5VNdgb9yZD4Ksi
         To9XUKTwDqG/YztIjKO315Ma80PbiKmDbQLtIKT1b0K0WDKLTMuO1wyi6VD2m9SqTQlJ
         a3e8JVXy2abiyN/sdlKkme2uQdOlmYhotJy8p+tp13rQ0ETfz4OOatIHBKP7v0kxemAw
         7PMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CMRs58f9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10si1280948ybb.15.2020.07.24.09.43.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jul 2020 09:43:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CMRs58f9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jz0nH-0005U4-Iy
	for alex.bennee@linaro.org; Fri, 24 Jul 2020 12:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jz0n0-0005PS-8y
 for qemu-arm@nongnu.org; Fri, 24 Jul 2020 12:43:18 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:52922
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jz0my-0002aj-8Z
 for qemu-arm@nongnu.org; Fri, 24 Jul 2020 12:43:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595608994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=HjciOT3EI31nPUC4rwgPKpHpeL3y2GcS40JR0oEFXyw=;
 b=CMRs58f9vd7kDq/jsRRLWj5B819UBdSDI7tZcJIfX0PKYkyLRkk52Pe1dsv+Z4OiO2Yb6e
 sOP6f3mkPYBnsP+e0t0O6oLVtZC+WFJaWm9AtCsUUY6YUboV4C00ex+flZKBkRAY5u7bsG
 arq3cHLZQm+A+KXqFlK97K7PhlIhRD8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-nrvR9thLPvSFgNDAOHmVCw-1; Fri, 24 Jul 2020 12:43:10 -0400
X-MC-Unique: nrvR9thLPvSFgNDAOHmVCw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BEBB800597;
 Fri, 24 Jul 2020 16:43:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-89.ams2.redhat.com
 [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD4535D9D3;
 Fri, 24 Jul 2020 16:43:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AA2989D94; Fri, 24 Jul 2020 18:42:58 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] hw/input/virtio-input-hid.c: Don't undef CONFIG_CURSES
Date: Fri, 24 Jul 2020 18:42:57 +0200
Message-Id: <20200724164258.24886-3-kraxel@redhat.com>
In-Reply-To: <20200724164258.24886-1-kraxel@redhat.com>
References: <20200724164258.24886-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/24 06:44:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HPfoQfiAQdeA

From: Peter Maydell <peter.maydell@linaro.org>

virtio-input-hid.c undefines CONFIG_CURSES before including
ui/console.h. However since commits e2f82e924d057935 and b0766612d16da18
that header does not have behaviour dependent on CONFIG_CURSES.
Remove the now-unneeded undef.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-id: 20200723192457.28136-1-peter.maydell@linaro.org
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/input/virtio-input-hid.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/input/virtio-input-hid.c b/hw/input/virtio-input-hid.c
index 09cf2609854f..a7a244a95dbb 100644
--- a/hw/input/virtio-input-hid.c
+++ b/hw/input/virtio-input-hid.c
@@ -12,7 +12,6 @@
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio-input.h"
 
-#undef CONFIG_CURSES
 #include "ui/console.h"
 
 #include "standard-headers/linux/input.h"
-- 
2.18.4

