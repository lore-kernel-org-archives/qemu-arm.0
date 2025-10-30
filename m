Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBD8CCF9F8
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Oct 2025 17:01:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEW00-0002Nt-Kk; Thu, 30 Oct 2025 12:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vEVzt-0002MH-FO
 for qemu-arm@nongnu.org; Thu, 30 Oct 2025 12:59:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vEVzf-0005HD-RN
 for qemu-arm@nongnu.org; Thu, 30 Oct 2025 12:59:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761843554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hWmmkEUNuPGh9RNwegX9zD/J9TxS8gEM8JXHywhlakk=;
 b=D0APvWgfLfkX1gmPlEWoHw8GdSSO/tQmoXPKJnBQM0tLWQHA64n6tnapQU7Ob+jhPzdLOO
 RWgZdjD64BrudZd5kbx90rPMiZZMaS9I9Re1KIrnfqZTQCgla+tIvREu5ORS+y8YVVHV00
 ozuJsielmftjk6TKPhwSJqIng1rChHU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-_zKYSPe5PL-uFjpvf3iDFQ-1; Thu, 30 Oct 2025 12:59:13 -0400
X-MC-Unique: _zKYSPe5PL-uFjpvf3iDFQ-1
X-Mimecast-MFC-AGG-ID: _zKYSPe5PL-uFjpvf3iDFQ_1761843552
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-471001b980eso8319625e9.1
 for <qemu-arm@nongnu.org>; Thu, 30 Oct 2025 09:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761843552; x=1762448352;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hWmmkEUNuPGh9RNwegX9zD/J9TxS8gEM8JXHywhlakk=;
 b=VxYF++HXGHUJaXsOX+oADxueZU4FXqzkcJcXbhxadiSntr63SUmW8xCKVlxJLqrFgP
 BjI5CV1xUehpct4v8GfeZtsV21Ozb+3kryHCLcyidWgbP1Moip9vBaHDCZoUa0WwisOR
 sDybxqUc4sHhSYkOQ5k5dhyTRwj6ECRE5ux20zW+maGooY+e09sUBJHQs3sPKmnzmUxO
 jNDvrXtXUIV2djYP1vKpqUqH5a/UgL2eqa5IP7qGenx6Xo0DVSw0tT7j5E3DSlzJ3aBZ
 747FywdBX3/poWmELiEhbYjabOwG6P9D646vz7TdExyXZSGkMczJiPuf1409qV6AeL98
 yF8w==
X-Gm-Message-State: AOJu0YxcrFSFOVUKvP3fg13CsNtCOPpgZRbSle4vrU7gwn3gMYMkJYbu
 2NZFkmH7v/U5JEoO9ZHrBMw6Tco0d3vVt2eT5nYrPnVQs+WHZZluYAZTbnmDuVNl8qHmtj0wsbv
 Jxm5itPQ+fl3lISBHiyIEzF12MHA7Lqmvad/N11luvagyxxLJYUTF4Q==
X-Gm-Gg: ASbGncteAP3ItnHu53uQbpKBU/MBH1zrhdlhlatCJGwABjhuhivUgiFn6D4twBT7SNm
 iQorwFbx70J6pYSAyxG1KCa4/2e5BF7VJ/zJrUqRNb45hw5LK/tUGS6LATe9VBylT1UMqcxP7T5
 UGGQQ93Zdy7FX9pK5Aateg1eKjhhpO/mK1n7kXQiz/7q+iKT50R+h1rFB/9U1ZmEGH10CQU1dTs
 EsQqP9S/O001Uk0qxjhSMSI5Nrv8MSbRcT/JHXwyP5XQb1sKvedqoaisy4vXDGf+l1/slkrdCfQ
 mkQy1hwQf/TBU7oRkq2h2kPvj4TOLYorZTS/efypCBbXpGFglKOTu5lXc1TZRnrLsf2dcMHpCul
 LrmF9NO+QsiSKkFdGbJLPGBtfkzdAhvdjbNZHSiJ/Hk0AtnUWXTf5Q619gqiXP3M=
X-Received: by 2002:a05:600c:34d0:b0:471:114e:5894 with SMTP id
 5b1f17b1804b1-477308721b1mr4431695e9.25.1761843552024; 
 Thu, 30 Oct 2025 09:59:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdysDVvnycX2QFcyER9PBsXwHxfA4shM0ptgu5S+ePqTnpY3IFDLDiXiVx7sJ1KtjfLnplcg==
X-Received: by 2002:a05:600c:34d0:b0:471:114e:5894 with SMTP id
 5b1f17b1804b1-477308721b1mr4431485e9.25.1761843551618; 
 Thu, 30 Oct 2025 09:59:11 -0700 (PDT)
Received: from rh.redhat.com
 (p200300f6af131a0027bd20bfc18c447d.dip0.t-ipconnect.de.
 [2003:f6:af13:1a00:27bd:20bf:c18c:447d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477289e7cf5sm51104085e9.14.2025.10.30.09.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 09:59:11 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, Sebastian Ott <sebott@redhat.com>
Subject: [PATCH v2 1/2] target/arm/kvm: add constants for new PSCI versions
Date: Thu, 30 Oct 2025 17:59:04 +0100
Message-ID: <20251030165905.73295-2-sebott@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251030165905.73295-1-sebott@redhat.com>
References: <20251030165905.73295-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5XMy3nDvDjPgeX84AONjY3tU1GxBUp3ycaonzAa-B1s_1761843552
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add constants for PSCI version 1_2 and 1_3.

Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 target/arm/kvm-consts.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/kvm-consts.h b/target/arm/kvm-consts.h
index 54ae5da7ce..9fba3e886d 100644
--- a/target/arm/kvm-consts.h
+++ b/target/arm/kvm-consts.h
@@ -97,6 +97,8 @@ MISMATCH_CHECK(QEMU_PSCI_1_0_FN_PSCI_FEATURES, PSCI_1_0_FN_PSCI_FEATURES);
 #define QEMU_PSCI_VERSION_0_2                     0x00002
 #define QEMU_PSCI_VERSION_1_0                     0x10000
 #define QEMU_PSCI_VERSION_1_1                     0x10001
+#define QEMU_PSCI_VERSION_1_2                     0x10002
+#define QEMU_PSCI_VERSION_1_3                     0x10003
 
 MISMATCH_CHECK(QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED, PSCI_0_2_TOS_MP);
 /* We don't bother to check every possible version value */
-- 
2.42.0


