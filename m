Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp2405257njm;
        Fri, 7 Mar 2025 11:15:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXv3e8+RRJ93BLKG1BbEDwanedWLUs5pBHcvOg5pI0c3mp2abiYj5ppdQyQnNJBD57SLdLLqpeOX0raIg==@linaro.org
X-Google-Smtp-Source: AGHT+IGxGmDDabsFWeEaalNbf7F53DfLhfxoSIs8YvaAnMoHkKpUg10GyBF6brT4s3n22XgTX6Eh
X-Received: by 2002:a05:6102:809c:b0:4bb:9b46:3f6f with SMTP id ada2fe7eead31-4c30a538979mr3726950137.1.1741374943100;
        Fri, 07 Mar 2025 11:15:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741374943; cv=none;
        d=google.com; s=arc-20240605;
        b=hNm3vJUBHnMacQluiVDTRveQU0pic7HhgKbButUo+yTvdCpMgdQHCYadJEHH9B8Djj
         lHBQkbvDPvQqUzJ0j2cEf4exkOBA4jAzBprpKWtc1GJUnaMMKztIPBoMqwkNStYMyS7M
         MdyNWnCE18zaU1rR7awqhkhcrADIWvu19bAWsajneQbKsW71SgaCm9YrYrajKXhqmQF6
         zC9s31Qqck1VTu3smtgtRyYFMDyi1A927Dt0JUyV4iQlK3e/hb5PVPnbSLSge2nnn1dn
         PO7aRguL+P6iksqAVFJJ0qQUCWPGnOz023wzrFYN1g+2j3WCI4cJFhJexMeiZhCSPxtP
         RHsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pG4LCYbyqBw13I+5ztxpTtN7dWWiuSWIU02vmduiZGk=;
        fh=G/iztjpJmuf62QnY8qQLa8MWWC5y4XWz0BPBBAr0A/k=;
        b=U17I069EayKek287PaVpCBm9bbOUpM7FhXBokijgUADlCaxv7qB/WmqVZmM9Chkesd
         HYTa6+yyg2joiTW0nxAkQRCxkdN/eIpVu+QPordxfLdkTfQKD8BJj+X+lWH67AbOTO73
         2ZlOqozbWHE7I0Aqomvf7s4u/XxQj8hSAKd0rcL5e0iHAsFewi/5xMKJHS/nVy6miBuM
         N0ghHoCyBrd3cre80ixm/ioJ28yCQp9Sz9waKxk7LWjSsgAk3diTgbuOxrgWRzA/ibDo
         PFZybpE+R05Dndxdj/7Hesfrp0yusAmboSpdxRhJgv/b/SkI/L/2L4NM6A3I/Wv6ZuP8
         Bojg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=DO8+upvK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c2fbc7221bsi1091842137.267.2025.03.07.11.15.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Mar 2025 11:15:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=DO8+upvK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqdAY-0005sb-Un; Fri, 07 Mar 2025 14:15:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tqdA2-0004p9-EJ; Fri, 07 Mar 2025 14:15:08 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tqd9x-0007n7-Ng; Fri, 07 Mar 2025 14:15:05 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D4BC55C5EDC;
 Fri,  7 Mar 2025 19:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC71C4AF09;
 Fri,  7 Mar 2025 19:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741374897;
 bh=VNVwBUg9DLb/+TaZToRj4L6G17tMKOtxkr5IyNsYATU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DO8+upvKpdj1XjGnfL+q0bhszRi+bVr7lP3Q5GvjKOHK914PuHAsZ4NXRhR0vnFI8
 tHJtphCstCxvje8hr/q9PVVDmcvhPMCTdOzi7xhEZTce0rb5zSykVIQPOmUPbbZtS/
 JKcRvDBaZZueg6KR5V5D8c7CfBtuFESyy5Ut/jXHh5B8YONcIgkj5JXu6fxGNIsmyj
 Ej2MwwuPdDV85kuErOaeWOQooedwRfpvoflvV3nBBpN/qZnl1W1Xg6sh6Tce9Cla99
 plhu6FFrE7TTxhkaYxptO4d81Dt8hvQUTYBFjPGKbQmG2UvIV2yd6S0DFajxR+BxlS
 GPUemy/LD9AsQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.1)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tqd9r-0000000BQmN-2xvP; Fri, 07 Mar 2025 20:14:55 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Gavin Shan" <gshan@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <anisinha@redhat.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v8 03/20] tests/acpi: virt: update HEST file with its current
 data
Date: Fri,  7 Mar 2025 20:14:32 +0100
Message-ID: <d8018aae7fb35b7f7882ff590676568fbf2fb2d6.1741374594.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1741374594.git.mchehab+huawei@kernel.org>
References: <cover.1741374594.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: bJSOpxceuJ56

Now that HEST table is checked for aarch64, add the current
firmware file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 tests/data/acpi/aarch64/virt/HEST           | Bin 0 -> 132 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 2 files changed, 1 deletion(-)

diff --git a/tests/data/acpi/aarch64/virt/HEST b/tests/data/acpi/aarch64/virt/HEST
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..4c5d8c5b5da5b3241f93cd0839e94272bf6b1486 100644
GIT binary patch
literal 132
zcmeZp4Gw8xU|?W;<mB({5v<@85#X$#prF9Wz`y`vgJ=-uVqjqS|DS;o#%Ew*U|?_n
dk++-~7#J8hWI!Yi09DHYRr~Kh1c1x}0RY>66afGL

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 39901c58d647..dfb8523c8bf4 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/aarch64/virt/HEST",
-- 
2.48.1

