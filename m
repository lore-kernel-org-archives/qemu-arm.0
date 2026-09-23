Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7014C9830D
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 13:29:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9My4-0002Ii-TG; Wed, 23 Sep 2026 09:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Mun-0002ib-5J
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 09:21:39 -0400
Received: from mail-dy2-x2b.google.com ([2607:f8b0:4864:36::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Muj-0007Zi-OM
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 09:21:36 -0400
Received: by mail-dy2-x2b.google.com with SMTP id
 5a478bee46e88-3346e75082eso423126eec.1
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 06:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790169692; x=1790774492; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=huS4A6FsKFDWrrXfwa21/vS+oZaWC4wTWSJg3SCD6Do=;
 b=erRSj/rX2rqG8nciCcPtkXy2+oUmsJhg3N1Ihc4JEe/C1cynFVovl1Xg/ZhkedyfB5
 HfQr7KgEI80u4g7aAQ5tzz5m3k5cEtho1H1hLQBunJ5CX+5xO3ds3CEeKs2bBNpi10Pe
 oItRVb4ptpTWKDhiGVxHjFEXBfsAYg7qYVTGrAkPsHGChLZTsgWGrW8k/Cep06J0NRtP
 5F1WGafNyDJnN+8WbsCna2J95HaUHa6sqWrVBoFwCnXoFaKrrYpVjxG+aK7GPIDJF5Pi
 6ghOm/PzKhWtxzmV5swibUhSF7UTFiijSHaAStMsoBR6YZiWwFQyHQ09J9CyzmH+4/b2
 N8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790169692; x=1790774492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=huS4A6FsKFDWrrXfwa21/vS+oZaWC4wTWSJg3SCD6Do=;
 b=BA70aoUFD7NDcZl5rYDb7yuGDbqWkjwdb7sXY8iHnD8uQCryYwnTrym6zlv7ezunK0
 7vJVIHtC2ZVUNomr3RXaBSqvIlgOYvDw4dC3NuBghPLseLrSdXW7IB3R4RuEOeXgc/g3
 HaphPo6P3KL8ET8twfNvmwo92kWbXItT1hXAXZtG0wk8+1GXjwAeAU2ZhL/PAhd5BQPc
 3I6mu80FHkfXuzPM2i0RFqxzF4t4ekMW2Kvhl/cjaxKGrJ79onqEkg39NLzS2ebEliA2
 nExrbi+bX7eBug0XbRjN9ybr0No2K4+Mw2bcE/joh6s8XIgHLvDGdFdsw4pXmg987y0S
 OYXg==
X-Forwarded-Encrypted: i=1;
 AKwUvByeHj+P7z0sBvMJbau3v93gHsiK+kmbbTkGKuWxlGp6VzIshhJWFOxRvkpFcLQwWt3b7EcvMzc+qg==@nongnu.org
X-Gm-Message-State: AFuF++k51DUYFnvUOn0yHdgzgodcRicrRh47ibhAlJYNCoJ1Jko/cAX1
 bWpruMVU9kSqAqOBTUKnWMJ2yzx3ZjituJMVVbwp3KPlmWkdxWbu97fy
X-Gm-Gg: AYBFou2d0IrL33LpSmmyIBSCAyUolM5AafdnXGI7kedxHfGForGtWPtsuLxaHnDYc0/
 /dsPiQkH1DpBysdoKRSGZxpzO0ZtxFecxu/HXrYvUsnTr1ZdUR4ktJ3auWtiD3N9aRe1SQ2xHib
 VOFy43Jhblb/X1DrzaELi78KEmPDZtzqcpRVB71F+DHFiviLzqanFq6dRRKx6Ntl1IfPXTeUPHR
 13B2aF0bbght9xviQ6gaq1vTOvR/WHjjgZRcrT3xx7CA1Xnb3zsEM7LzFIW2l3sHluD4EoQuylE
 d9tpviBVZaNzRL8H5XJKQ/ZrSUm0p9SIyrZ76GWMLVxmq6O5ByLJsmGnA8anmVbE38KOTmT9z0w
 Lz/2lfjGLdReJc7SIjStkGKBKsFeWKLjVRrQgNTfLxKgPhf5n4sXWJlQI044j18eEYaGz5L8Pkx
 TsZ9wcgPMZqJ8Qmht4L6XEm/OI0pbsDPY79znNYkmiplZrUuVQ8kIdWT2HrXD0tGYL9M9/FFXBQ
 FSIOEDzQLzshSyCSKqXyDTrVtVzxI2vbqHrsLeS7g==
X-Received: by 2002:a05:693c:42d9:b0:33b:e75b:cc42 with SMTP id
 5a478bee46e88-33e8d7d8b7bmr2063395eec.19.1790169691801; 
 Wed, 23 Sep 2026 06:21:31 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:21:29 -0700 (PDT)
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
Subject: [PATCH v3 027/114] hw/misc/riscv_cmgcr: replace target_ulong with
 uint64_t
Date: Wed, 23 Sep 2026 21:15:01 +0800
Message-ID: <20260923131635.1894-28-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::2b;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

- Change get_exception_base() to return uint64_t so the GCR model
  compiles in libsystem_riscv with -DCPU_DEFS_H.
- Match reset_base and cpu_set_exception_base(), which already use
  uint64_t.
---
 hw/misc/riscv_cmgcr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/riscv_cmgcr.c b/hw/misc/riscv_cmgcr.c
index 0390996f78b..2086a33f08e 100644
--- a/hw/misc/riscv_cmgcr.c
+++ b/hw/misc/riscv_cmgcr.c
@@ -110,7 +110,7 @@ static uint64_t gcr_read(void *opaque, hwaddr addr, unsigned size)
     return 0;
 }
 
-static inline target_ulong get_exception_base(RISCVGCRVPState *vps)
+static inline uint64_t get_exception_base(RISCVGCRVPState *vps)
 {
     return vps->reset_base & GCR_CL_RESET_BASE_RESETBASE_MSK;
 }
-- 
2.52.0.windows.1


