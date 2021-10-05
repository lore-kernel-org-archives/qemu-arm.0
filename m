Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4674909lfp;
        Tue, 5 Oct 2021 01:41:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+DePAA0y7WYwplkiC8+U6aaTeMLkjdL+gHldK5wpZ0ridCk86RKO3NIEPuCOAM8uxF/fF
X-Received: by 2002:a25:1ec6:: with SMTP id e189mr21323593ybe.150.1633423285144;
        Tue, 05 Oct 2021 01:41:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633423285; cv=none;
        d=google.com; s=arc-20160816;
        b=XRKiZEqJGV1sIjVGkPNYc1S1WCXK4q1oTZxUxiZgGXBbfveCI4oOr4dy8ls8cxYCbX
         b1zLZY+sRl1gUKK5Gn41BAIaNAa2tVnPVb+FMO7o4eK7nhElZoDQVMmQiCrFv4uzc6Xm
         sUKZp52+WAF64jbC+7Ot7PdUB1NnMBeUqw/4zU1As28I5uLBYDplbxIJxC7WTALuE65+
         VOeD+p+Vvx5Xv2/wsdHyUpuoCHS2oqUfmFpoIL8ABpE/Wys8LVmrEu7luuTtBF9FFVm1
         7D6zl01zP2fhS4N3FtemgbGmvtmEbPtClEbPYWVFlf5B5oLI8Zj/+MXWPZtoy+4JmaMK
         PVBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Ra5JVFmLKWSbFjZK3Fr3W1ySvwBXj16KO5md3YTpAAY=;
        b=VRbsTC14EeLgVfBu94yVNNAjCcpnwM0plkPD2k1wAF7qIVjnmDXZbWK79Al7RTx8Cj
         +QLleDmXcKthqRdWPYZYjzMzB73+qnPEVNL09uxj6USjKRxKZvEAfkbn1Ab/TcZyuB5K
         oYMCy8yagiQxMKVBFKcTv30NeAe8QMw2M55Gg8P1EzfSYGwMT/Jb5AgBsY42O5S7ScNf
         3P8YpFJ+zs1x3W7vmHYDGogLiZ2gY+RnX8MP6Pcq4rSLZk0tA9G7HCqMPuRDxVDoy29a
         pYCcQ95iP6bUzzRzycBjZFt/KY9lX0eBB8U9ul4jCCd518BKy4nIXAt0LfnKZb5OHRu5
         GplQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cwFhQAhK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r5si25911569ybr.392.2021.10.05.01.41.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Oct 2021 01:41:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cwFhQAhK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mXg0q-0003Km-I4
	for alex.bennee@linaro.org; Tue, 05 Oct 2021 04:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXfyp-0000ls-UC
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 04:39:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXfyn-0003VJ-D5
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 04:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633423156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ra5JVFmLKWSbFjZK3Fr3W1ySvwBXj16KO5md3YTpAAY=;
 b=cwFhQAhKAa7xB4Znfw8Xsbc2dqT+uVFVl0vzlrFVntOD8k+5TeJW+9xqi0yjT7QdhzwucD
 7xdoCsGVXW24/MN6lTohyz6RD3ioKVucJJPqE1DtxERKA44rp3+x291xun8DWayuhuMCOq
 lkCP/P1rmzmjvUtS8jUelaR9sBoU9MY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-qts_h3rYNQGgNWRXtS_ajw-1; Tue, 05 Oct 2021 04:39:15 -0400
X-MC-Unique: qts_h3rYNQGgNWRXtS_ajw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 634D1948;
 Tue,  5 Oct 2021 08:39:14 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEBCD9AA20;
 Tue,  5 Oct 2021 08:38:45 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, imammedo@redhat.com,
 philmd@redhat.com, peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, drjones@redhat.com
Subject: [PATCH v2 1/3] tests/acpi: Get prepared for IORT E.b revision upgrade
Date: Tue,  5 Oct 2021 10:38:03 +0200
Message-Id: <20211005083805.493456-2-eric.auger@redhat.com>
In-Reply-To: <20211005083805.493456-1-eric.auger@redhat.com>
References: <20211005083805.493456-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: gshan@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iaT0xNtd8GKf

Ignore IORT till reference blob for E.b spec revision gets
added.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..9a5a923d6b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/IORT",
-- 
2.26.3

