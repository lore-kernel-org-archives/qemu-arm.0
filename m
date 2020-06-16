Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2452750lfm;
        Tue, 16 Jun 2020 02:35:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwGFntbm5BHlcWC2Q87iE8wNPeFSIkiYiIWI42vcW87K23wrHPoVv8f7xWIFoulMH1K5bt
X-Received: by 2002:a25:d146:: with SMTP id i67mr2769602ybg.123.1592300158470;
        Tue, 16 Jun 2020 02:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592300158; cv=none;
        d=google.com; s=arc-20160816;
        b=yCWLZ9o7sBmF6DHqZexy2T5DblkLJzKl3ml8KYvi3zmnlabXCGhNc09FdKf1kidLdj
         tbwQVfK2IGxbA58pBQ5dbYiHKHbevHBFYLxWj7+/XL1NhzHMSzSP9cvIvg9s2+ZqnKV0
         LDUVqQU5YnUwrwYOw80+7xFt6ao2PVNzG8pZ9rL0zLFjSTU8nO5INZwcSn/fd+15OaQz
         drL1PUWjf69PB8EEr14hTkTXCcVoWYXebFJ5+8arnrEKNE91Lva9XcHKQTyz7ltXcDob
         Nq7mqauuXsCz/xniaEOISotOGfj4PN8o4GDxkKwnUbE/AgOp3eezKowPfouzxQq8XBjM
         /3Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qDNBig6IWQiFeyOxhMViPcQxZlm7fNfvrCXicg2128w=;
        b=vXpgrsy7/M5CWWPbjFM3CFsVCxjUhVwg4jrsxs/0l3aNCYoshfaX9Zfo9tpNUup3IE
         kr6Hjg2VFDtKnD3VInhnGpZb2lOifTTMvINQ+1rWW0rJn6qaV39XaYAEFcCpkQduzWkj
         w8k7Krc0cwvYPsZbJE3luOl7rUkuyM1O/llbNG6FQI9dLf6o0W6yXI98pdrQKL8/75Ka
         V9qjr+A7Db31XvqwdSiSNPzAsZ69JPw7OgAYe88for26l5rlU7egB80JgvVG2V3nkaQ8
         ySBK5FraDMRqjUmbOdkuW3w7mIdFVdcqoElpUxtDID7X9JjZysguteedKQ/GJ1SpG3MX
         +SVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bNcG3gIy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9si15407040ybp.419.2020.06.16.02.35.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 02:35:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bNcG3gIy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jl80b-000157-I7
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 05:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jl80L-0000p4-6b
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 05:35:41 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:47412
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jl80I-0000Ko-D8
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 05:35:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592300137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qDNBig6IWQiFeyOxhMViPcQxZlm7fNfvrCXicg2128w=;
 b=bNcG3gIyLlcVLyZ2dRXTgLg6md7D1+SphVuS0N4DTwfhUDeSxVgtYVJaU0HaA8p4R/aw3b
 QhJUCDwHdkOx5yK7eGOWOOr2W/88hb4rW8ZfJtxEE5lfW/UJfUS9CSZ0ZAyLeXCzMJdXgj
 3UV/KPYigov/ICi8JcSrUsCiBbIidxk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-nKtsuXKmNG-R_jQlY-OSYw-1; Tue, 16 Jun 2020 05:35:34 -0400
X-MC-Unique: nKtsuXKmNG-R_jQlY-OSYw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0407107B7C5;
 Tue, 16 Jun 2020 09:35:32 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B1F45C1BD;
 Tue, 16 Jun 2020 09:35:21 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v5 3/3] docs/specs/tpm: ACPI boot now supported for TPM/ARM
Date: Tue, 16 Jun 2020 11:34:57 +0200
Message-Id: <20200616093457.24709-4-eric.auger@redhat.com>
In-Reply-To: <20200616093457.24709-1-eric.auger@redhat.com>
References: <20200616093457.24709-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:01:17
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
Cc: thuth@redhat.com, lersek@redhat.com, drjones@redhat.com,
 shannon.zhaosl@gmail.com, marcandre.lureau@redhat.com, philmd@redhat.com,
 ardb@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WS31STk3G2OR

ACPI boot now is supported. Let's remove the comment
saying it is not.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 docs/specs/tpm.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
index 5e61238bc5..eeeb93730a 100644
--- a/docs/specs/tpm.rst
+++ b/docs/specs/tpm.rst
@@ -346,8 +346,6 @@ In case an Arm virt machine is emulated, use the following command line:
     -drive if=pflash,format=raw,file=flash0.img,readonly \
     -drive if=pflash,format=raw,file=flash1.img
 
-  On Arm, ACPI boot with TPM is not yet supported.
-
 In case SeaBIOS is used as firmware, it should show the TPM menu item
 after entering the menu with 'ESC'.
 
-- 
2.20.1

