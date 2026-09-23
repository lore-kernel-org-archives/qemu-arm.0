Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D475C9830D
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 13:20:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9MtO-0001KO-4c; Wed, 23 Sep 2026 09:20:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Mqe-0008Q5-Bg
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 09:17:24 -0400
Received: from mail-dl2-x0e.google.com ([2607:f8b0:4864:38::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Mqc-0006mV-KW
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 09:17:20 -0400
Received: by mail-dl2-x0e.google.com with SMTP id
 a92af1059eb24-1437b77c274so542217c88.3
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 06:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790169436; x=1790774236; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=t43puSbRZc523NBj9nQXSYWDHrWaj0cvHGn4qE6n+xk=;
 b=NNPybJImWWpGcZ+N5Vgr6S6xsqUFSat7rC4pyXEkZbsxeLBAOVgpV8BxXTv8Up8LHy
 OEp2g85FciNmtOFOfe2BRU72Dno3k+D4zi6cDIdwplDtJu6Ywj50NWlKMu8EeGAocVm+
 C9W9Nfsb1FrztQggYk6qeS52D5v1AnrfcsB/y1/4/tMWHcbn6jhXnqxi1v+/xX3wkuj4
 cUHhr3d2oBoj8KkA/6Uc4R/FbDfrQimPnkGweNLZjHG+8MtkY8Se42dxkmai1xWsmUDp
 9Je+gdzEpkh+EuoJLSR1sh868Ft+mkYzjz0LN+24f4KsXsuJc7FniE9OEALSDucwZrzA
 HqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790169436; x=1790774236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=t43puSbRZc523NBj9nQXSYWDHrWaj0cvHGn4qE6n+xk=;
 b=Z1KpBOP3uyTcVaFxUDVCJtS1DYjAqr8eZERm/qp7jJi4WkLVOQg47gbmH1+GOsXW0+
 On2IQKgmcRJB3kIaH1mTBfdEi659xCxwTIgv41lKvh5xEQF6SLmZQTQOxZ6r7XG9P2MB
 1wP3ry7NEMqXu8pYOCWOxqmpTblOc7cpaEIuAHKjiYiZGYLuHrSUl2ojMohnnY6K/GT2
 TbAoJZa/9b/BQryin7p1BmOvo/ZF0T2cTE4pmmtaXWGbuA2+NvAwx/VuiPcJGblNPRu7
 NnrgOCd2O7fa+190GkcyBDFwU2qm3rfQ+1xxaCkfIu7FEyrj0pcl9WGhaxSUxqBvcH2v
 3irg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxN6Co7uY3tMBN4cJ1VQzm2NMvoXCm0MWmpe4H7PhXTy80B9S/N7VSYKa3t/JPmAsb1i5ChnoZMWQ==@nongnu.org
X-Gm-Message-State: AFuF++lnaXy5VC5MD++WCqnqqnHZchV7svxslLe38lhFbQaYQUxngoJN
 I5veBOIPXioW2bjwxx1NKbwq16ORcRuzbmHTEQvjnbBu+NLoq1D+wMPh
X-Gm-Gg: AYBFou2FHyZvXl0UQVIDNUOKFqUiuvNzQECDRjw3293nR6sl+kfWkVzk12h4pcM7iba
 v7Jn6rvSUukE5qAJuGIQrxuNdw3t4jIp5yWqUDQsFtv3J2DlFtMNuP2Yj/ViIts4/9dbWz1nFTY
 YDgoA+ByROeuMqWLvI/UVRNIr3/WyX1glSEG2Bk4BqP+dCpVjOL3+JNyGr16WVGJpWr3EIFzgmp
 wji04MwvuQteFVk3io5+ykkGxSdoSEdZoehJDBuzCkeXRp/tyS1Z6OM+oI8Hcj3j1f55a4SfbMu
 c66mwny85uEIwT6CL6mldOMQ+DjUtqcJ7gqN45OVVhux5y9iGVRxoKGy3HeW7hldjJie5K3023z
 OMwj6aCXR4apmWKn0kPCr3x8mq2eLmHVhvx5lTK6W+ZsuuAL/N7Yh85vAzKjLlwibRYEIf85xvh
 yfnSZ00knozx6Q0TpGkSwyvuCqg4QMu9+1I8bjcRVXIVFCV9rbYhg8GxgftUZkNaoDAoV5+ojkA
 wwyuZRePTJJ20ZfgrM8ynXldGAJ2rY=
X-Received: by 2002:a05:7300:8818:b0:338:2485:ad03 with SMTP id
 5a478bee46e88-33e8c53c0d4mr2821124eec.16.1790169436068; 
 Wed, 23 Sep 2026 06:17:16 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:17:14 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, xen-devel@lists.xenproject.org,
 Chao Liu <chao.liu@processmission.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Fabiano Rosas <farosas@suse.de>, Xianglai Li <lixianglai@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bibo Mao <maobibo@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 kvm@vger.kernel.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Song Gao <17746591750@163.com>, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v3 003/114] target-info: rename target-info-stub.c in
 target-info-def.c
Date: Wed, 23 Sep 2026 21:14:37 +0800
Message-ID: <20260923131635.1894-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::e;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

Now it's the only file left to define target info, we call it def to
make the intent more clear.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 meson.build                             | 2 +-
 target-info-stub.c => target-info-def.c | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename target-info-stub.c => target-info-def.c (100%)

diff --git a/meson.build b/meson.build
index f412d917d94..8bd2d725ca0 100644
--- a/meson.build
+++ b/meson.build
@@ -4330,7 +4330,7 @@ foreach target : target_dirs
     endif
   endif
 
-  arch_srcs += files('target-info-stub.c')
+  arch_srcs += files('target-info-def.c')
 
   if target_base_arch in target_arch
     t = target_arch[target_base_arch].apply(config_target, strict: false)
diff --git a/target-info-stub.c b/target-info-def.c
similarity index 100%
rename from target-info-stub.c
rename to target-info-def.c
-- 
2.52.0.windows.1


