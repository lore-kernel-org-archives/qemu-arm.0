Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp923257lfm;
        Tue, 7 Jul 2020 06:09:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTr+JqkOiQnL4J8YvbM3W0u9UNfmNbHpcx5nXo9VT7ZWwroW3dkBa6rzo48Lz8A/UlgQIO
X-Received: by 2002:a25:b4e:: with SMTP id 75mr79341390ybl.198.1594127349457;
        Tue, 07 Jul 2020 06:09:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594127349; cv=none;
        d=google.com; s=arc-20160816;
        b=h8jFJiSc5Xr8YEn6Uccn8WSxiCu+9LUZJ1jAmKWH1NgBVAx8bYg16mEGFss1KnuFAx
         Dw98d2TX9+qrv8dEv6J8gLokn3gXXaroX+/ceyg3uAA4CCsIyztRptBphV+TGwZonrsz
         gehQAw6e9v2c7StH26UbaVho9e04smN/7uAZlBoJiccpzyxuQvUMZt0k9ilWjoJrBJCR
         NqyKiD9kdJpDocAQizX1M/NaZ8spHz/RokVs18ETjkSBy2I+VVRQYtKdP/O6iE1KnZQE
         SB6L/NBQqz/YF86wVISnIf8WJRxbIEE0prYQEK7FNq+N1NLzN1dG1IZa5rMv9sBI6anG
         9Mjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=Jc3CkjMTS6eJgOpPYjcQtTYta9twaD8HtlqKoRcWa3g=;
        b=fog4KPMc/o7jYlJclbYmcOYw0/zJXjgSMOQM6jFFZhfXJ9AHBRzgCBahLRaMePCMEZ
         ANUd1uC3MGZYaSg+KFxLOtEfE6w+jZqVSule4Aap2jHqfLanNTOresy36r8f3cTb+UXH
         k4unknWUZCIVr8jZ1G+9M1Q3+jByRZcSmH6AY66bUk/wTlj6wnR1NpBjPqR0NDjPdM//
         SHpsBIAy+0BN4vHmbXBEqEQvUjdgOki7VJVRfkUqJL25w5qk/rxt/BQCF7zb77F27Qa9
         eXOZ8YMnds8rMAYsXcNDtgwLJD9kWvzK7IsHOjrUCKMuJVPqExnvwO7VJv6YhLx0bOrm
         IzOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="LDycx/I6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x80si22451990ybg.445.2020.07.07.06.09.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jul 2020 06:09:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="LDycx/I6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsnLQ-0003Rs-SM
	for alex.bennee@linaro.org; Tue, 07 Jul 2020 09:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jsn7g-0008Ar-3R
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 08:54:56 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:47262
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jsn7c-0004rM-M2
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 08:54:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594126491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=Jc3CkjMTS6eJgOpPYjcQtTYta9twaD8HtlqKoRcWa3g=;
 b=LDycx/I6osABxEirXebiIqOmsuKeZPdzcdt+etz229wzyDmiCQJ6JiPlLcI5nxYkawCWMC
 o5AkQ16LeUhyftsDp39RDSFHl6eKVstRprS5dW0lltUfW35mYRQVhf/6+dPuJLr9gLubxG
 8qjz0pGiz2j4O4wMVWM6ESLipYPSKsg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-SEuGukI6Nx6nATJjUp5Aeg-1; Tue, 07 Jul 2020 08:54:48 -0400
X-MC-Unique: SEuGukI6Nx6nATJjUp5Aeg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB1AD1011F6A;
 Tue,  7 Jul 2020 12:54:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-200.ams2.redhat.com
 [10.36.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFE92C009A;
 Tue,  7 Jul 2020 12:54:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C1AAC31FA5; Tue,  7 Jul 2020 14:53:57 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 19/20] tests/acpi: add microvm test
Date: Tue,  7 Jul 2020 14:53:55 +0200
Message-Id: <20200707125356.32450-20-kraxel@redhat.com>
In-Reply-To: <20200707125356.32450-1-kraxel@redhat.com>
References: <20200707125356.32450-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 00:31:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TbyHuSOMSJWD

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/qtest/bios-tables-test.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 24b715dce780..b5b98d5c0742 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1007,6 +1007,20 @@ static void test_acpi_virt_tcg_memhp(void)
 
 }
 
+static void test_acpi_microvm_tcg(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = "microvm";
+    data.required_struct_types = base_required_struct_types;
+    data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
+    data.blkdev = "virtio-blk-device";
+    test_acpi_one(" -machine microvm,acpi=on,rtc=off",
+                  &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_virt_tcg_numamem(void)
 {
     test_data data = {
@@ -1118,6 +1132,7 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
         qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
         qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
+        qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
     } else if (strcmp(arch, "aarch64") == 0) {
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
         qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
-- 
2.18.4

