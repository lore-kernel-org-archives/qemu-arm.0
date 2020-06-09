Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp460535lfc;
        Tue, 9 Jun 2020 05:56:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbxIEDZVCzRRTIh2uYAE2JfAUlTZdbCk/AmCKP+EC67X1tei+usuxYUUU2k7v7vgXNZ/SW
X-Received: by 2002:a25:b88d:: with SMTP id w13mr6138754ybj.520.1591707396856;
        Tue, 09 Jun 2020 05:56:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591707396; cv=none;
        d=google.com; s=arc-20160816;
        b=TfRBGg1nnMroMbUkijUnp/iHLL57f88prq70bXWbNNfmOsON3nGBQBzghSUSJnHBun
         7Srp620E6WekUrk70XJgLyjUuzbGo0a5s9V6FnUMXXcNqo+7JdSHj9URkNWTkwKh1ahH
         ty6zBPS950vAdLO8K+MUj/yeDzwfi6a/P71JyBiF7st6xe7XqmxV7b3knG+Qdm1iAuVD
         nk53hNN/j2+0aLcE2oIlbYb+PkL6GwW98PmBRHBmU5MkMAJGrzubeUJonDnM+PWHxPu6
         yDaBswSdp63ZCtkkr/9r9kAZotVen4tKLwPuddbFN11IW2aEao1W6+yvztWt22qcpHcp
         huGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1LXoltFh6aawui8nHM8/NmGE7RpX3pQSaASvH0tGBBM=;
        b=RJ7hzeXfOwvbAEZDqaVFXkvOsu/EkwBo2xy9Ne0BprSfbFCmA+UlY341NJgd3gsa22
         isZSPq9VZWy+RBNoc+ej/2ipmIlMqxDQLQ62wmETr8RQMNe2GCzDXw0iTsKcOyO66t8z
         e5HqFPUV0/TmRHvKnM5nqE9fAuPDm0dezI3L5Cm8GGJoUiJGXtyB+1UQhouWSuGZ2jME
         qOtlRWFk95B+4+JPffB3NtV1wbZCN4RQtkAMq+oREEYXWHIqRtF7PzNR7Ft7BqF8xl8t
         pagHTvtTsQAEVhMaDisYlGHBjCVV6QP7c7g9QfF049uC4RVtp5Pk2hVVPVm83e809YEs
         zy8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WjXrTn6N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s3si2382772ybj.225.2020.06.09.05.56.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 05:56:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WjXrTn6N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jidnu-0006Ww-GP
	for alex.bennee@linaro.org; Tue, 09 Jun 2020 08:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jidmv-0004ft-Ae
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 08:55:33 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:49073
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jidmt-0002Vd-QA
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 08:55:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591707330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1LXoltFh6aawui8nHM8/NmGE7RpX3pQSaASvH0tGBBM=;
 b=WjXrTn6N3jlsMwhypm+WRQzNmTlihc0mY6rm30RQ46+4+K446PGDAQ1vfIci3BQCgQpJeK
 As43xgyKD4VZPnkv53SPALxKtmrYHJGkqT7Q3xNo2CnXCxUr9l4xVf6myTXqoJdEJUCZ95
 1byAQwcdJkVDOei9uoEK3b+DJ+giy9k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-E1UYCuWGPeiJdODKFNlhbw-1; Tue, 09 Jun 2020 08:55:29 -0400
X-MC-Unique: E1UYCuWGPeiJdODKFNlhbw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0285E846348;
 Tue,  9 Jun 2020 12:55:28 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 003585C1BD;
 Tue,  9 Jun 2020 12:55:18 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, shannon.zhaosl@gmail.com, imammedo@redhat.com
Subject: [PATCH v2 3/5] tests: tpm-emu: Remove assert on TPM2_ST_NO_SESSIONS
Date: Tue,  9 Jun 2020 14:54:07 +0200
Message-Id: <20200609125409.24179-4-eric.auger@redhat.com>
In-Reply-To: <20200609125409.24179-1-eric.auger@redhat.com>
References: <20200609125409.24179-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 02:41:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: marcandre.lureau@redhat.com, drjones@redhat.com, lersek@redhat.com,
 ardb@kernel.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vTuuQT0MY0GC

bios-tables-test executes SeaBIOS. Indeed FW is needed to
fetch tables from QEMU and put them into the guest RAM. Also
the FW patches cross table pointers. At some point, SeaBIOS
ends up calling the TPM2_CC_HierarchyControl command with
TPM2_ST_SESSIONS tag, most probably steming from
tpm_set_failure/tpm20_hierarchycontrol SeaBIOS call path.
This causes an assert() in the qtest tpm emulation code.

As the goal here is not to boot SeaBIOS completely but just
let it grab the ACPI tables and consolidate them, let's just
remove the assert().

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

RFC -> PATCH:
- reword the commit message
---
 tests/qtest/tpm-emu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/qtest/tpm-emu.c b/tests/qtest/tpm-emu.c
index c43ac4aef8..298d0eec74 100644
--- a/tests/qtest/tpm-emu.c
+++ b/tests/qtest/tpm-emu.c
@@ -49,7 +49,6 @@ static void *tpm_emu_tpm_thread(void *data)
         s->tpm_msg->tag = be16_to_cpu(s->tpm_msg->tag);
         s->tpm_msg->len = be32_to_cpu(s->tpm_msg->len);
         g_assert_cmpint(s->tpm_msg->len, >=, minhlen);
-        g_assert_cmpint(s->tpm_msg->tag, ==, TPM2_ST_NO_SESSIONS);
 
         s->tpm_msg = g_realloc(s->tpm_msg, s->tpm_msg->len);
         qio_channel_read(ioc, (char *)&s->tpm_msg->code,
-- 
2.20.1

