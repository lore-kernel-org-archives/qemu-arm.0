Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61C7606A31A
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 20:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J24gzf9G
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMA4g-00055A-Sx; Wed, 28 Oct 2026 16:16:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMA4S-0004zR-SI
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:16:30 -0400
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMA4N-0002Dg-7v
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:16:26 -0400
Received: by mail-dy1-x132f.google.com with SMTP id
 5a478bee46e88-33fb4680717so1515763eec.1
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 13:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793218582; x=1793823382; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jxKoLwAp1Bl4rnQorq+3BYZr6+qu/Ilca8ukToeEfCc=;
 b=J24gzf9GCPCBsf3Up97UU6TVUtkCbOHXcIBQf/koc5cJtB1KEmbHtkrolGqmTt6Nwl
 rMp1LwKrl/U08E/gpepKIERJxI6qB0AYsVOJsCGl2LAbVX+qUZIMThzmKIZ/Qj9qitZn
 Yv7H4aLfxvla7BQtAmyY93lplAR2HPDSTqFJibM+lIbObrMxZFocP5zjXNswB8yTldXX
 TIayzJhto7Vj3o+/h5FJfH2y28Qi9ANDZ3nQAj5GVJJy23xOtiLonhklzk/Bv0rc9b4T
 HfX2z6IP+PArBcTc0Qmbp1FUygqHMTiSFTcrtfavRjiIfdavkKlZNbh1ZQMdxfnUR4Qs
 HUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793218582; x=1793823382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=jxKoLwAp1Bl4rnQorq+3BYZr6+qu/Ilca8ukToeEfCc=;
 b=BRd4QVuJE9wPfWMkSdKO2KY1ENQsBS7GRD+YBVt+bZWgKtel/zchmjWP3Ru0NVpfK+
 8wSiA6i/7AluAulCoUkAdY7t5NN3lv7gIte0g+bjzstkXZ331KIBpN7gYWKIQHep9uiR
 9be233lZuzu2vVkNf3jWp8gAGWp3yH3OGs5VuwRlcnhJthLuVxU3pxiBVIpA/ryL7EdS
 MLw/iSSnXKO64KJakJTfWvbBu9IZKalr/DznKa/+epop5RfPc4H6oUUCKdKtq4ObH0El
 JBu6sGEQlvPTnTEF4MB2b3dxjiahM+rfhE8BxeU5x2JDWMf/F7hmyjpjV8a4vie3u/Ko
 zwUg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxurHN76MyxKLNniJSPaAjs/S1y3f41VTNTHA0W3gylzOWX9Xht8fapzWWELBYEYzIgFPmUSDrjuA==@nongnu.org
X-Gm-Message-State: AFq9FYKWz91wWmxJJ93d7f1O1SpdYiwkZjmIPO2xkX3IeCna2XezBgEy
 /uMwm9dO+8zhE8O+pe8XhHxzWFPefMyJJhsQWgtAdTXiO58riU/V9Qmu
X-Gm-Gg: AYBFou0f+4z2thpHJc1327see501uus5B7LAWHVps3Q7TUr52vMasYrhURjy8prbwvD
 ujhtoyMLhy4ewktH8fuEczYn11cpMBpJ8oPNpDL6Cx7UTgUAcKW9iMP9Or3BhF857iLifIJvtbT
 9AxHm+FT+8w5s/dJvsLYjxoQb6CRaSB8cXyBHY9v214KlUfcobT+FkhVWQCkgijngdT1TxA2YqC
 QXUeUV+My851O11Zn293L4gDlMTY53MeP9a/VmTfHw5RrMIJ5bCC14F2XGrwZaZtKhhht5kmEtB
 QrZnQtmi7JWbUXjh90u21QCk4MwwKYMgoyFJkRGC1WBGc1IRi8KyY70oBhVtu0w2jQi72FVq9m9
 AFUzTliqd4CcbbQUMU8uqNt5OPdp3rR2dSRXZuskWzteLhSlDf1KJvTKxPC3SH7ndGLZyV3jzJh
 1jKUNUn9qzMgWOwKJP2GZbMDJU6dOz/KS0ol7iN8js2IKBKpLgQ2VI8Oi48UwdfxrWWK2QVAWcN
 vSLl1aKRkEsMXtAtHWZ5LgA73aT04khWZ9cfl3S2lmjQ4Xq5/zklOUzV2Lj47ybzV5mJpUVXw5s
 +vCvzpC8o1YScEoYI3tcrcNeQdJ0NARfcQYB4nQuYMNFT7Ib+9P+8yc7owK+Wx4UHsQt4Q==
X-Received: by 2002:a05:7301:78d:b0:36a:1d6f:917c with SMTP id
 5a478bee46e88-36a203ff237mr4351578eec.22.1793218581543; 
 Wed, 28 Oct 2026 13:16:21 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-36a23951e00sm12016896eec.20.2026.10.28.13.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 13:16:20 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@kernel.org>, qemu-s390x@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, Song Gao <17746591750@163.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 02/12] hw/loongarch/virt: select virt machine types with
 is_available
Date: Thu, 29 Oct 2026 04:15:46 +0800
Message-ID: <20261028201557.2688-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261028201557.2688-1-luoyonggang@gmail.com>
References: <20261028201557.2688-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x132f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

LoongArch virt machines use the same QOM names as virt machines on
other targets. Register them only when the selected target is
LoongArch, via target_loongarch().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/loongarch/virt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 9c5371af9de..3f1b82f25ef 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -11,6 +11,7 @@
 #include "qapi/error.h"
 #include "exec/target_page.h"
 #include "hw/core/boards.h"
+#include "qemu/target-info.h"
 #include "hw/char/serial-mm.h"
 #include "system/kvm.h"
 #include "system/tcg.h"
@@ -1553,6 +1554,7 @@ static void virt_class_init(ObjectClass *oc, const void *data)
         .name = MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
         .parent = TYPE_LOONGARCH_VIRT_MACHINE, \
         .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
+        .is_available = target_loongarch, \
     }; \
     static void MACHINE_VER_SYM(register, virt, __VA_ARGS__)(void) \
     { \
@@ -1587,6 +1589,7 @@ static const TypeInfo virt_machine_info = {
     .class_init     = virt_class_init,
     .instance_init  = virt_initfn,
     .instance_finalize = virt_instance_finalize,
+    .is_available   = target_loongarch,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_HOTPLUG_HANDLER },
         { }
-- 
2.55.0.windows.3


