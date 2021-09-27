Received: by 2002:a0c:90cc:0:0:0:0:0 with SMTP id p70csp1641731qvp;
        Mon, 27 Sep 2021 06:47:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyakTXG4VUHr7C1O3dGv/y5oZSPu4A1r+i5ihZ4HQdibJwDMl3JVGcJdxXcgZcNTQnCnz0s
X-Received: by 2002:a05:620a:632:: with SMTP id 18mr22587440qkv.457.1632750470488;
        Mon, 27 Sep 2021 06:47:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632750470; cv=none;
        d=google.com; s=arc-20160816;
        b=UhEt2PAuQsmmrxSwygW/sDwNvJaGQ/mfImDiht0pUGNUAfSlJxH6wHC9cZwUsJIfsz
         fNqrswrnQdNrKcTbOdF0tiqnaI8CSJiqPnJseiJonZbPpgZkP2gUBcY1e9feNWuC7upY
         VkQG7qqqSCWBOucLT4D8jWiW2cDrYDTHRbSC9Xg22k0Gslqy9nCJYrsx1NhMs+ZUhhoF
         wKdBGc+1PhFVj2P/aLWYmTOxtnWknczziws+SI9s5SVMnWamSBgItLI/BJoqh5zYlSm1
         HM2Q5UyaV5O8BXfasx5wDtXovzNiPoGxdVRGY7arTs+d5SkylJG5bxkG5MSe3oYsAx/u
         vvPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2UF3tXFX/C0ARKDZ6oAL6a/PJdnT7KdiG/33xvqq9Vs=;
        b=cf7hTs0UGuP439It+Xl4tLgBKav3hGtO1NgEzUrEDOk1e7WVjNLvkFY7Wz7TTQE8L9
         G0q6OxIdwXqIVOCQIdb7CJQUOLTcIeTq6Qzm8AWyyelZMKtM8TsPQivPh+wIeyiQQAUn
         9DwPIQvfFq1gSVE3rMLbhD79vRNMyKkFoPA1LqGaMNAcIbaMADydlEPGjA9/rpWLAJ1C
         jRe0bmya46oi0adHnSa1z+YKwND1Uq5Tjtho8N076N3fSgvTB68XFP75+r2qHyyOrwA1
         ikn4RzHvlPStbvfY1s9E2CyXbtup3kce9/cOS3HrCvBI1niSilbavOgaC3fAYeIFoTk+
         eXfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="HTsX+H/D";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10si8959432vsg.251.2021.09.27.06.47.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Sep 2021 06:47:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="HTsX+H/D";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mUqyz-0003PZ-MD
	for alex.bennee@linaro.org; Mon, 27 Sep 2021 09:47:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mUqWI-0005AW-LB
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:18:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mUqWG-0002bK-Vf
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:18:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632748688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2UF3tXFX/C0ARKDZ6oAL6a/PJdnT7KdiG/33xvqq9Vs=;
 b=HTsX+H/DuSA2mlraC9JaNHp4vGz44G37oawwDrYQEpI6jh+PwtGUorEqcufbI+irwXIAL6
 JE156z6Y2MkQf1DH6PaOmKw5wBIxH39+WBqdjXrG42e4zfwZuefZB0ElkiLI/0a8BU+p88
 E5vpuCchEBuPiQDKGr8hpr4bkcvn0o8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-fxQeIfPiNJauYHrZ2FXY1A-1; Mon, 27 Sep 2021 09:18:07 -0400
X-MC-Unique: fxQeIfPiNJauYHrZ2FXY1A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6D0B10C9C60;
 Mon, 27 Sep 2021 13:18:05 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 422A919D9D;
 Mon, 27 Sep 2021 13:17:58 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, mst@redhat.com,
 imammedo@redhat.com, philmd@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 ardb@kernel.org, drjones@redhat.com
Subject: [PATCH v3 1/3] tests/acpi: Add void table for virt/DBG2
 bios-tables-test
Date: Mon, 27 Sep 2021 15:17:30 +0200
Message-Id: <20210927131732.63801-2-eric.auger@redhat.com>
In-Reply-To: <20210927131732.63801-1-eric.auger@redhat.com>
References: <20210927131732.63801-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Gk5jfUpq8PWl

Add placeholders for DBG2 reference table for
virt tests and ignore till reference blob is added.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>

---
v2 -> v3:
- commit msg rewording according to Igor's suggestion and
  added Igor's A-b.
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 tests/data/acpi/virt/DBG2                   | 0
 2 files changed, 1 insertion(+)
 create mode 100644 tests/data/acpi/virt/DBG2

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..1910d154c2 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/DBG2",
diff --git a/tests/data/acpi/virt/DBG2 b/tests/data/acpi/virt/DBG2
new file mode 100644
index 0000000000..e69de29bb2
-- 
2.26.3

