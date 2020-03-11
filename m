Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp796207lfc;
        Wed, 11 Mar 2020 06:51:42 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsbzgzBmS3Z0nnAoDPMI/gC06UNJfPO8iV0tnqitF9dsiELxdChYNjfmlz57/fKrpgfcl0S
X-Received: by 2002:a05:6830:1645:: with SMTP id h5mr2461987otr.317.1583934702492;
        Wed, 11 Mar 2020 06:51:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583934702; cv=none;
        d=google.com; s=arc-20160816;
        b=WBd4cJPiE41YGTsJ4GsU8QXXIHgx0jzVncMho1Ym45z/LrugUzFY/q3eyOB3dExIo3
         ygMCz0TELEUjWWkcO7E7OO4OPDCu20TFs8+rCHvoLPOBXFGz9qKEt8dVQwXqVPwyiMaT
         QeKk+6eZw+QP6VPl0klMPS8/NAr/SsZom/rzTtx48BRQ+mSdDi7Vmv4pBdSv/vumSav9
         jKYQHKfl6qXQGMKhFQfgEeEJdXFfTXJasiENnzum24c/7N1H2Yh/DBVMvtKzYEiHi37X
         HyrgBet3lP4ZeNWN4GaYjOsyd7uGhQMsNzDx9bz1x+HCdASDZZjGZZQS/ual+DLWKYEU
         2vyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=jUPGPmIvaDDGzVaAE49y1ve21avwQxlD6sBJrt5aqiw=;
        b=XS+v1/hQiSRRnoFKpD1KlnESMUKeM+gPl1RamdthKAOeBGyU18ZRmTsu0mNSIP7uHz
         NGEQSyeiS6BF3lj06Q2F9TTGkaL8hnXtTXBCkIt0NV8rO/GA4AoJl/WGJoALJFHuUH6z
         wds9ai5qYwBDQsZNXW62erbfYws3RsasLXxVKBmR8qebBWmUtWhbMo4AIVhlsjClicjB
         0YUV4DUZ9CfstjavBnJ2OJ3fT4DJ3kW5GT08aVc8z8T3xlkYS1ZVOiNb3M7LSeRVeE6/
         k/diJhfEmbuRFpebmZpb8x/3VMj0S1dTyCWQbAmNS1pqN6akGvyUtwyM3GpYFRMaKuoy
         Jtzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="H7Nz/9mC";
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id c6si1189088otk.233.2020.03.11.06.51.42;
        Wed, 11 Mar 2020 06:51:42 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="H7Nz/9mC";
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729677AbgCKNvl (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Wed, 11 Mar 2020 09:51:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56387 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729473AbgCKNvk (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 11 Mar 2020 09:51:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583934700;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jUPGPmIvaDDGzVaAE49y1ve21avwQxlD6sBJrt5aqiw=;
        b=H7Nz/9mCcSfhxfQbnUWrm7gPVk85VlPQUqx+ZH3fBQtIAeITCiUSSCnZ2vw5PW8poR8phN
        0D2VltYY8aPieGJ2v5+/+2W0r9DqwMG7gpEwGaqyB1lsS7mCWwIEsUZX0yG4+7IOTfWnOX
        oWYcrksi01s6IkatMeyOaOMV2/tWUqg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-q86QP9qvPrOOza30Sdzhzw-1; Wed, 11 Mar 2020 09:51:38 -0400
X-MC-Unique: q86QP9qvPrOOza30Sdzhzw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 994451137849;
        Wed, 11 Mar 2020 13:51:36 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.36.118.12])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0D69D5C13D;
        Wed, 11 Mar 2020 13:51:31 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH v6 02/13] page_alloc: Introduce get_order()
Date:   Wed, 11 Mar 2020 14:51:06 +0100
Message-Id: <20200311135117.9366-3-eric.auger@redhat.com>
In-Reply-To: <20200311135117.9366-1-eric.auger@redhat.com>
References: <20200311135117.9366-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: zzccIcUUAAyL

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
