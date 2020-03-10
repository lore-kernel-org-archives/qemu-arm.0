Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp847788lfc;
        Tue, 10 Mar 2020 07:54:33 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vttHnE8sTah2MMw9JoKHa95gbE67WXJCSH/h+QsId9ytAilUwiJrdAWe/u5bgJW4rjm+8YX
X-Received: by 2002:a9d:b89:: with SMTP id 9mr17457805oth.297.1583852072859;
        Tue, 10 Mar 2020 07:54:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583852072; cv=none;
        d=google.com; s=arc-20160816;
        b=xT6nYAC0ZDlkIzRrvf5tnwxLFLb8X71awOt53JZwS2ns57nZm02CD5/Hq/+MDDbfky
         b/0HpZVvOBnTbakTiraVY01Yg5Ar5yq0rRQPKeuVXUmven43d7y71KJdFDtZkQDx6U+z
         nAyXZMqd3/atMxV1GLHIsU0ftoZDihnTvpYhdQLlPoiyYg8L+DyTg+wVKC1zeT08BhYa
         LoixiDcoy3/2vorvxhblODpVWVHxoIGFi3ae57GAK6g4o9f/kaRZ+w4dqrqM+tVjA+ml
         tbGcsmCzXLkQ7Eax3V5OhdQC9oci/YU36llnuh6+D+o1tMvmLWuJn0QNys6xP8XApZqJ
         cSZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=jUPGPmIvaDDGzVaAE49y1ve21avwQxlD6sBJrt5aqiw=;
        b=QZUFHZv/wJ2Q4raakShIhhKY6GGbk3aCew20F3HDPauQykvJg97Qe2XOmF4N4BRJe6
         +sdOk1bT6MVWVat9K3WYi0DROYKqt7OnGO5Z7w5B+LFjIoJbOSye6ACXIRAHoDhWBmu7
         +RXwLzf3QCK+XSkVM7OtgXCQ7Q1u38+IFMwD3J3p6xhBq799ey0arNaqqAt0+nkC5OGI
         ouqJN9AVr2J/sfB7xhPDoDY4GkFqqUGuC7GchJmOul9ZKwnQD4X37ID8SMlvCdPmkatZ
         DFfMnR1xmExsxKpc5VuN9peOee7vU0rswW7tTWJCf26PPYB32BMtsKA3IqocujX5ct+K
         cBvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Q/LVM0A1";
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id x24si8259514otq.261.2020.03.10.07.54.32;
        Tue, 10 Mar 2020 07:54:32 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Q/LVM0A1";
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727547AbgCJOyb (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 10 Mar 2020 10:54:31 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:35158 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727390AbgCJOyb (ORCPT
        <rfc822;kvm@vger.kernel.org>); Tue, 10 Mar 2020 10:54:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583852070;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jUPGPmIvaDDGzVaAE49y1ve21avwQxlD6sBJrt5aqiw=;
        b=Q/LVM0A1oLXRTHC2mSy9VDDF9lwajnvN3DdyO+ZXiIs90JWJHUFHeeuKBbptnfaAql69nU
        aBUsItwToPH8mNKBsCzV5TDToHX29C6S4YUG1G8Kdmh5el47h/6NGZU3xbtqMA/yk0VsW4
        mktbCPe6QJId7PiLy0m1pDoH1cQoI3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-X2jbR5sjN_-1IeYNAHOm9Q-1; Tue, 10 Mar 2020 10:54:29 -0400
X-MC-Unique: X2jbR5sjN_-1IeYNAHOm9Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78519800D4E;
        Tue, 10 Mar 2020 14:54:27 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-85.ams2.redhat.com [10.36.117.85])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0C67660FC1;
        Tue, 10 Mar 2020 14:54:23 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH v5 02/13] page_alloc: Introduce get_order()
Date:   Tue, 10 Mar 2020 15:53:59 +0100
Message-Id: <20200310145410.26308-3-eric.auger@redhat.com>
In-Reply-To: <20200310145410.26308-1-eric.auger@redhat.com>
References: <20200310145410.26308-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: SUSJ0tEYsEet

Compute the power of 2 order of a size. Use it in
page_memalign. Other users are looming.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 lib/alloc_page.c | 7 ++++++-
 lib/alloc_page.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/alloc_page.c b/lib/alloc_page.c
index ed23638..7c8461a 100644
--- a/lib/alloc_page.c
+++ b/lib/alloc_page.c
@@ -155,7 +155,7 @@ static void *page_memalign(size_t alignment, size_t s=
ize)
 	if (!size)
 		return NULL;
=20
-	order =3D is_power_of_2(n) ? fls(n) : fls(n) + 1;
+	order =3D get_order(n);
=20
 	return alloc_pages(order);
 }
@@ -175,3 +175,8 @@ void page_alloc_ops_enable(void)
 {
 	alloc_ops =3D &page_alloc_ops;
 }
+
+int get_order(size_t size)
+{
+	return is_power_of_2(size) ? fls(size) : fls(size) + 1;
+}
diff --git a/lib/alloc_page.h b/lib/alloc_page.h
index 739a91d..e6a51d2 100644
--- a/lib/alloc_page.h
+++ b/lib/alloc_page.h
@@ -15,5 +15,6 @@ void *alloc_pages(unsigned long order);
 void free_page(void *page);
 void free_pages(void *mem, unsigned long size);
 void free_pages_by_order(void *mem, unsigned long order);
+int get_order(size_t size);
=20
 #endif
--=20
2.20.1
