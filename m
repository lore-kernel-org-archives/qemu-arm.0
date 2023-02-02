Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp383674ejb;
        Thu, 2 Feb 2023 05:40:46 -0800 (PST)
X-Google-Smtp-Source: AK7set+IYCEXrdm4vA2IIEKQw/fwMKGYwWCefGysCD8QkDSFBZzhYVHrgoqBegbfq2NzMrpG4DQV
X-Received: by 2002:a05:622a:14c6:b0:3b9:b619:42c1 with SMTP id u6-20020a05622a14c600b003b9b61942c1mr9831087qtx.27.1675345246158;
        Thu, 02 Feb 2023 05:40:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675345246; cv=none;
        d=google.com; s=arc-20160816;
        b=OQV7bJc7KLWmsVBKIbvH9YStwxEDBr8HWizNP1ZkePQQZCC87UGxyLSHd7sKMMHzlW
         wdIKRFG/3YczkU/YQO2PzKke52yzNsliPShlwa9kAXfsAMYJasNtppW4eJwUrhjO8Eey
         GAbiJChTIGpMfsobPdpA/g35MiaY5YA1alqsTwKCDfhlvp7alvlg6mVcQPIVH0hJ896V
         5/wGXq+WmrL5CdyJqi64b35mINn+iQHKH/Rh+BaIgKUdrSWtSRhcCGVgETZwSHKa7jBI
         EDPG5D6TDviTOZ8laM6fd+DliLmmRE59vkzOw6DDJbahL/Un9yJpUzbdwX3Oe7HUt0Zg
         NgEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xFHFrla/CoDpGKYnUvkSvuBtJSpBKqfFTk/sxIyjCL8=;
        b=yWFUuovqeH5fKgsURv/A/aIu8oW2t5pw+w/KlNe3tZ91Qfj4g9rW8rVEGZq+Kk4kLd
         RnOwgzgBvYS3NFjlpVgp7ZXpalF9TKaQPlCAc6kEYtObhndXRGM4S+k8WBTioHSWUUeE
         tJpXZlJGxdKr4BjvadM9+Bg7MiTouX25/yW9RSViSltE0gn+9A/9dYS50aMHIsXWEJAt
         kK8lAwFH9Ytyo4YyvoGLMurLodGtPBW9Ouz36aEDZVqSdqfKSqkaxBHCKNXkdSRrDZAt
         bmASXHG54eld7AJDK99yO9e4OW7NhjjiPuzubCtwjTTHPsbg7gv1NEKZI5ch7O0/X/62
         LMhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=axiZgNhO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pr11-20020a056214140b00b005374b10b4e8si11666704qvb.442.2023.02.02.05.40.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Feb 2023 05:40:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=axiZgNhO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNZoh-0007Lc-3e; Thu, 02 Feb 2023 08:39:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNZnv-0005ly-4l
 for qemu-arm@nongnu.org; Thu, 02 Feb 2023 08:39:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNZnc-0008Au-64
 for qemu-arm@nongnu.org; Thu, 02 Feb 2023 08:39:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675345124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xFHFrla/CoDpGKYnUvkSvuBtJSpBKqfFTk/sxIyjCL8=;
 b=axiZgNhOiHkYRcBFwl7GfHgDulNCXUKcSDhAwoMOs7HN2RXDqYn5pg8nWx/KgR7zSk8n2t
 Qaqd95S4Jf7WHFwMaWrQtLBizjdcAUUJGTailwwOsW/2DRGEuic0O1Lzf9SKeFiMqNT2F5
 F9m6xIcilABeXdweZ+Lvh2FRaEYyzDo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-aByc0waXPQSjy9VAxvjw5g-1; Thu, 02 Feb 2023 08:38:38 -0500
X-MC-Unique: aByc0waXPQSjy9VAxvjw5g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 318E8281722D;
 Thu,  2 Feb 2023 13:38:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CEB012026E04;
 Thu,  2 Feb 2023 13:38:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AFE8321E6A21; Thu,  2 Feb 2023 14:38:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com, philmd@linaro.org,
 peter.maydell@linaro.org, alistair@alistair23.me, jasowang@redhat.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Eric Blake <eblake@redhat.com>
Subject: [PATCH v6 02/20] scripts/clean-includes: Don't claim duplicate
 headers found when not
Date: Thu,  2 Feb 2023 14:38:12 +0100
Message-Id: <20230202133830.2152150-3-armbru@redhat.com>
In-Reply-To: <20230202133830.2152150-1-armbru@redhat.com>
References: <20230202133830.2152150-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HndpdXBuJrpf

When running with --check-dup-head, the script always claims it "Found
duplicate header file includes."  Fix to do it only when it actually
found some.

Fixes: d66253e46ae2 ("scripts/clean-includes: added duplicate #include check")
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 scripts/clean-includes | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/clean-includes b/scripts/clean-includes
index 86944f27fc..8e8420d785 100755
--- a/scripts/clean-includes
+++ b/scripts/clean-includes
@@ -177,9 +177,8 @@ for f in "$@"; do
 done
 
 if [ "$DUPHEAD" = "yes" ] && [ -n "$files" ]; then
-    egrep "^[[:space:]]*#[[:space:]]*include" $files | tr -d '[:blank:]' \
-        | sort | uniq -c | awk '{if ($1 > 1) print $0}'
-    if [ $? -eq 0 ]; then
+    if egrep "^[[:space:]]*#[[:space:]]*include" $files | tr -d '[:blank:]' \
+        | sort | uniq -c | grep -v '^ *1 '; then
         echo "Found duplicate header file includes. Please check the above files manually."
         exit 1
     fi
-- 
2.39.0

