Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2966270lfc;
        Mon, 1 Jun 2020 03:23:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjZefekItwMgPXYw18XpHXBVkfYjOcyDXAg9RGU7uLDek8COKvWbnS83FYV0VSL7aNHje0
X-Received: by 2002:a25:4f44:: with SMTP id d65mr35067102ybb.149.1591007017667;
        Mon, 01 Jun 2020 03:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591007017; cv=none;
        d=google.com; s=arc-20160816;
        b=kOFzKsMAWg1ZGu+x854pRSFrdYx1g/NgmTYxougreZQNX7iYbBWBFbVT+HZAUoDJ0w
         ZgHeGP8lQj+Bg0qVVkbdSmG6EyQ9prYGqbabq7iVurVvE1dxfWJ2JlLin3+lSTZQgSwK
         MXh+AWnxOq7MwYBJjRslt87h9FQGrDiqIEKtHA7LCdigR4Y/XwHTHt/nGCnoFxeSqKmd
         u4r4BwGNiaPMezcOqwCva5Dff9pIHzJ4GEO0Vx5Lk0YtXBXoPm3BdtqhknsuOjEjGQoJ
         sFLPt2+6XTyqKDaYj3kOIvPLsnwBwd77B4mKe7TU+zd+4uq+Vs/DC9jX03rzOxubcMdQ
         zLvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3ix7laFcZDqSSMMGZDE0PHXmSoYhXSqBlDP2AmRi/iM=;
        b=Jx8/obVE38wrLAYpAgt021hp0ldMxnLt3z3TuN5uPfzQ47EO3GgFbjUnWUi7dq4oOC
         HkFD8QON0NZcB49gAeZg8RfnXpnY/HH2PL3S7kcM6TKcZoHZ7ss4QZ2SIQ2sYN5kQX18
         Q8bgBveuOrql8bV4bm5v7DNPk9eBAM0dHwXqq96lQMjphYGXkP9aH50GJK+mtJcsqRBa
         34P4I0coe++LoaAnSDsoorhcfujPfBrtYuvdRFlju+OEBSQ/EfbA1SHJfwcXsfvvlH7d
         gUGXBYOYcCWFgRzwZDr4VZ5+X6WjVNtXCjS20AtXoRR/ZonXRMUfZ2fGe70IBel4rxnP
         Pn0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Tmnv+ChP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 73si8898485ybf.30.2020.06.01.03.23.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 03:23:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Tmnv+ChP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfhbU-00024s-Ue
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 06:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jfhZn-0000Ro-Db
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 06:21:51 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:49251
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jfhZm-00007q-NL
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 06:21:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591006909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ix7laFcZDqSSMMGZDE0PHXmSoYhXSqBlDP2AmRi/iM=;
 b=Tmnv+ChPdBebKjNM5Ah/xUeM81Sno0dYq0WnkQu/Zp7D0TMZWGr5HOmO1OMyWxBMJPFH/K
 U6Ycl/7z+8A96aRHpVKfKDh1hdsPgUuOuLienoJQXupBZJQTJAuybw672261xPAdUvXOcK
 KILJG1+7I5zlrnhNSaevcJOTOTdWXGQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-4L_aq5O_Mq--rJXw1uKo2A-1; Mon, 01 Jun 2020 06:21:48 -0400
X-MC-Unique: 4L_aq5O_Mq--rJXw1uKo2A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DFC0100CCC1;
 Mon,  1 Jun 2020 10:21:47 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-56.ams2.redhat.com [10.36.113.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9D8DD01E1;
 Mon,  1 Jun 2020 10:21:33 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, shannon.zhaosl@gmail.com, imammedo@redhat.com
Subject: [RFC 3/6] tests/acpi: Ignore TPM2.tis and DSDT.tis
Date: Mon,  1 Jun 2020 12:21:10 +0200
Message-Id: <20200601102113.1207-4-eric.auger@redhat.com>
In-Reply-To: <20200601102113.1207-1-eric.auger@redhat.com>
References: <20200601102113.1207-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 05:58:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: marcandre.lureau@redhat.com, drjones@redhat.com, lersek@redhat.com,
 ardb@kernel.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6j7lte1YxklZ

Subsequent patches will alter the content of TPM2.tis
and DSDT.tis so let's ignore them until the references
are generated.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..a2a45d1d31 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT.tis",
+"tests/data/acpi/q35/TPM2.tis",
-- 
2.20.1

