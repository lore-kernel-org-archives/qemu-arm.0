Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp152562lfc;
        Tue, 19 Oct 2021 01:09:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJnGSaIEP1XQctf73wE0RroTU3e6nJl82rJz4iuQK44aJhbv6RFkE09oJu3YXb7wRyAMCR
X-Received: by 2002:a05:620a:4706:: with SMTP id bs6mr16008911qkb.122.1634630951662;
        Tue, 19 Oct 2021 01:09:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634630951; cv=none;
        d=google.com; s=arc-20160816;
        b=IagXwCDlzcy7WoIac9rzg3mgQaGN7zOLtWLe0AhNaLXjNMdY/IeHbirkCdjdM3X59C
         dQ3+oz5QYawVRv3Le3+9p1okZwq+BJ/RMvQF+eCFeIgtfv/bIY/ZME3iCYC6GRv6biGK
         fx/wVKQvzu5fdG/HHq4Yp0jazDaw6h1iTau+m9op4I4YXidVbxBRH8Q8Joc+WGrjRShh
         0SA9wPn7ImCg3wDyjNvHjg8+7fbGvvaz9iHdWPCeZP2WjBjWDwTPrOwJBXhxE8SPWiG5
         cr3SVuZ+uOUpSGiV4yaEUZbswgYYXh7Gx6g2n38+LRwriRiGdADeU1dMH/al7no0yHpK
         Ij1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7rKMODgkMX1iWaLLov7L8wkvTA1BmGYczydq2aUyyk0=;
        b=yDJvfrxq99bgFUIGXw+Fafe2UdIW/YKkDywap/xerWx6iyrwyzMk4dgZUNDV+pstIQ
         50yf56fKmQFEtbMrmf1B5Bt7ArSG3TlR59KmtWij8M3Sp1MIr9l9qoa5J506xKa4se77
         aqGklEo+vbCPwuVk4fc12vTu7L4Ql9FWPI29wJpsVNTDS2IhzOkOU7ymNiRxHE+6y2uO
         2EMGL2KqpKxDO/NLIPnBZHiTomc71T3aYc58VnPF10Xub1t1zjFwyNhqPgDaoGx1yxS5
         dn8SkkUeK4iVjS7jfRNexAAvr7MoEGHrmc7B8ZlacrglaPhVKY710FacZ/Z7U24Q2USo
         Vx4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="L/gTOw4L";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l30si13307961qkj.148.2021.10.19.01.09.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Oct 2021 01:09:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="L/gTOw4L";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mckBK-0006hr-QM
	for alex.bennee@linaro.org; Tue, 19 Oct 2021 04:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mck4I-0002Rl-1O
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 04:01:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mck4F-0001vt-BU
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 04:01:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634630510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7rKMODgkMX1iWaLLov7L8wkvTA1BmGYczydq2aUyyk0=;
 b=L/gTOw4LqjRSCOnLgO2z5Xp9oNdfBsQ3JpeEigifvhX6JHBab0n6X7lIafZipBq7+bBzd2
 sfphUQYr3koseBuPqS8V+guQFXibWURdKM5jXVWmieNwYFyR74pZSxpyc8G7+vdcSW/KwJ
 +UVzrE9Oxl7OCCf+gjo579Kl7WR1hag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-dn-wI0MHNs2RxkjILbQL6g-1; Tue, 19 Oct 2021 04:01:47 -0400
X-MC-Unique: dn-wI0MHNs2RxkjILbQL6g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07D995075D;
 Tue, 19 Oct 2021 08:01:46 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B4F75DF35;
 Tue, 19 Oct 2021 08:01:15 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, mst@redhat.com,
 imammedo@redhat.com, richard.henderson@linaro.org, philmd@redhat.com,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, ardb@kernel.org, drjones@redhat.com
Subject: [PATCH v5 1/3] tests/acpi: Add void table for virt/DBG2
 bios-tables-test
Date: Tue, 19 Oct 2021 10:00:35 +0200
Message-Id: <20211019080037.930641-2-eric.auger@redhat.com>
In-Reply-To: <20211019080037.930641-1-eric.auger@redhat.com>
References: <20211019080037.930641-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: gshan@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2wVGi8FOUqOx

Add placeholders for DBG2 reference table for
virt tests and ignore till reference blob is added.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/data/acpi/virt/DBG2                   | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 2 files changed, 1 insertion(+)
 create mode 100644 tests/data/acpi/virt/DBG2

diff --git a/tests/data/acpi/virt/DBG2 b/tests/data/acpi/virt/DBG2
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..1910d154c2 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/DBG2",
-- 
2.26.3

