Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C422606A31F
	for <qemu-arm@archiver.kernel.org>; Sat, 31 Oct 2026 16:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zb315e5u
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNC8C-00026k-RM; Sat, 31 Oct 2026 12:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xNC8B-00025c-I3
 for qemu-arm@nongnu.org; Sat, 31 Oct 2026 12:40:35 -0400
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xNC89-0007hP-Vh
 for qemu-arm@nongnu.org; Sat, 31 Oct 2026 12:40:35 -0400
Received: by mail-dy1-x132c.google.com with SMTP id
 5a478bee46e88-33bf40b0c8bso2080057eec.0
 for <qemu-arm@nongnu.org>; Sat, 31 Oct 2026 09:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793464832; x=1794069632; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Z4uozW/RGYivh9xm1tzOVceXV/9Dw7Pp0AvBXKQfEMw=;
 b=Zb315e5urVuSVCc63q+CqsSke+wnd0U0W7Dmpw/7LlLz4zhNIDIB9+1NxU3S6bDLTP
 RH5JKzZIR5x8PpVbwL3H2pmCyNwObKWPSd7+blO4MCKn9A3Fpsw5kiWzwVvl30HbO5oG
 EvxIEcyb2vKM5BbzfBnJO5Zke/N+SK/ZQwK6bXReA0l5bn9sRDP/aVXbz0BLZWM1pIxc
 tIIrfo+Fyex7xobX+cNBLolVyF4G5SPd0jQVN8fc0VMwhV9q8S/LtqSq1XZheqPPPS5E
 WbaF7i5CU4neaMaOP1iTY1qiZsAm0Bqf3TBUWqVLdn1TCCTUQtcF0B5Znns5ZsZCkAA0
 Ri+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793464832; x=1794069632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Z4uozW/RGYivh9xm1tzOVceXV/9Dw7Pp0AvBXKQfEMw=;
 b=KiRbU4HvFyDsEN7pn/VXZThy3tpJq5mLp89AAb/IRqFd5uZxBeLVomI/74+oVvHiX4
 a9dDVo9JXk6jXOfqjXkzFgkuL+PWt2JHpFGaEX2kFup191A7K9XbdzIp2QFprJFFL0vl
 mCIjy2Y8sLewnJLSvOayRMx0PypeWc/rAn3kezLPCyUZjMtNgb9ETvLbB6hwiXcb5YgT
 6QjdiSEKJQoFCNR4x2xp5pS81QsPYMI8TEnpBzkkQjuUgUU7WFqO+v0WSYP2QnQ2XXoy
 6E3pDaCrryxJIEEtASvpnGX6dC3/zPY2WUiNSIWSJeHEeLqcwH8+KWjViWs5REzamkQo
 /xXA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzcC/SXuFHdA9cMS9LdSPpccCvNXEPl0vWXTWag14+bKV2LXgXsOFZ0cZDnStrZ9Ir+hSZoaVGeSg==@nongnu.org
X-Gm-Message-State: AFq9FYIoUAIZAXeBufpnuimYkt490ww4sosT5Gr8Ml/vofF2xgO/r76M
 apJZfZXmAeENGBtwSJSucCNuluAWbsmsYi3b4UernLaE2ZxOBybjVf7L
X-Gm-Gg: AYBFou1CSyiys8iqZO8WC1qnzacVViqk45GKYiAVf8qecILfMpkQxzmtQod9wr+6Tom
 aMV+k26J1v1NhENMALL5bFhK+sZVl+DgvKep5rcngDFSv8I29p2QJmEv1JscL2yYTbhMRXlS8+L
 gnqEyGaHkvDS9d2PssZo4WYfBT1V0+F63X3v7za6fhkUToEiVysDkw4IdUwzKZ/m3U399mcFFfo
 zs2xiqn1y91KSAPLCpgdxv+yCvGqYvLaaqpNCwGbNI9t7NNunHpL47LL0FcNuCXlbXYnWb5s1ov
 WCBOPJziPiyuctymXoX/sCSjz/qcEmAwMNMk0QANoaSudiWMSVimMqG2ubL0GUs6ZLVFJ3lfJpl
 6sfrDsUXi5FQizHx/R0Tlr9KOKZ1/O3SkMgdq4FxOKG7aRaReji9r2E3jOs6EUhTe2ULL7E/79W
 4cloMQQIiW+jVtssMkCctqpUIwDqEmxgTZcxOtQ43FD4t9hzzvOGVO34YmLAC2ETpISgsERpv6j
 VRh8MzSaq0xDHvEejc2730ZKvH4KWfPn3eUWef69+dLPfXXVNhT0gHPqeXeSv0zO8cqAecEJD0Q
 apvEkAFylcg0hS1FBl3+HOKSTYFheJh588+hTEgRXqmn7Fr2
X-Received: by 2002:a05:701b:4502:10b0:18d:96e8:b913 with SMTP id
 a92af1059eb24-1ac5f64afcbmr7629294c88.47.1793464832354; 
 Sat, 31 Oct 2026 09:40:32 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac193b8179sm19574572c88.11.2026.10.31.09.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 09:40:31 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Song Gao <17746591750@163.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 David Hildenbrand <david@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Fam Zheng <fam@euphon.net>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eric Farman <farman@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 02/12] hw/loongarch/virt: select virt machine types with
 is_available
Date: Sun,  1 Nov 2026 00:39:57 +0800
Message-ID: <20261031164009.2048-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261031164009.2048-1-luoyonggang@gmail.com>
References: <20261031164009.2048-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132c;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x132c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
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


