Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0AEC61DBD
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 18:43:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzIaX-00079e-ET; Wed, 26 Aug 2026 14:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wzIaV-000768-To
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 14:43:03 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wzIaT-0002GO-4U
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 14:43:03 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2ce7d2adef4so17551465ad.3
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 11:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787769780; x=1788374580; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=A8nlgx+yI5uXCE0ljkSUS5BHCQ1iuqkZ8gRew5LCZY4=;
 b=EHr5ul7Ii9DpZ/MRkDioZ8O4L8eWXRHxRqdkJ8H4LdLEycoGEgeljAdjHh6wWAkjkI
 bAEbjHBabo6Z9Ae0YdUw4070oLch7Yp6/DKDPRNywIEzsttSxco73thkYU5NjpK1mImh
 zZYI9jTgIrY+trLwypz2FEUUUtH0vKYVyZp88s4yzJO+3fy+Ie1fOVb++AIHRTHlAUTE
 A1DUBaVqR6sa/EHxGo+SPhzNUstfN6wfZKZ93WNJ0UJh2UxmM/MSvJyzN8Gg5uQuxwef
 YjMe7ioiahZivcAu1c2sdid2OsedYNRTshQ9HY+oTqUqQKZgdeFAsnyeqrblcGUbuIK9
 7JDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787769780; x=1788374580;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=A8nlgx+yI5uXCE0ljkSUS5BHCQ1iuqkZ8gRew5LCZY4=;
 b=NnnRNck2X3KMArXIMeN+uNIRMHXwfCcI6OlRaNSd9iCVoqicL5h/bETyZhm7LX9VWG
 Mu5hDmzwQXpvOfVhtrjFOVX7y2pQk5og7GSE+PKKfKmleUZhB6NmV4U/LgTwhKmCPcZw
 wVc1Wcq5TDzVM7boM52t142PBbcHB6jY83xqWOAnkUZf9PJ1qqRkPTSeUnwgXkBSuY1M
 R9fTLZ6w3KXgYiVEox15cDGzgI/gmeu2eArz7QBwMVHAdraEucGVHubGXqk9CN7inh8p
 9kDEJpYiNYIopUGV/J2D4IGwFZDeo6w2r+AsjxF3b73pOHYOuJmwbwiVsUPdc53sSJmW
 niZg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqNH1gQDwNwUwHPVp+Wxm+nGbO1UTyr1SQ7cYl7Pgr5O89PPggUKhZbf/Quyce4kJ7eOYGi6KtUZw==@nongnu.org
X-Gm-Message-State: AFuF++ljo8z6+q3rMpxBnofmXFDwIn7p2nfW8a308wbPT6wdqQ1kEsN+
 ECxtiFZkFLaoQwLmM+K57no5RSwm7icLuxzH5PEIvidudNspnWHc4Qma
X-Gm-Gg: AR+sD12eEUwyt3wtNZ8/cdTswOX5RElGX99dqudRBfWNmZU1+AdHmepkFaim/4rSYn4
 aUpiaVu3Jy07fsqQoL+0OfolGKHWbGG5oYyb6KkJ50G15jF9KRNYTZkKtGjZIBWps6iJsKjoa0K
 27jNEa8m7CSKJ8LEDNtDjfj26hxavJEr60gNEVwk9aWKL1/4ohDfOqIfjpmhnoamuddw9q/4FlJ
 TZSJgzA2fRjpnEaLfoX+1PryxrLhHK3eNLjy2+Yp+0yBjau8AwQd80Q0vAiPBf8HE5SNkbvg3B9
 ropM9mgfOj8Wps/dpiiG5g1XgzgdX5L5l5XRignnry/6peHoKvMSULSdypASw+1KY6h2T0ml96G
 tcZtVmcyoobs1CnRDW1CkDCrPBkShaE3bhXEeW9VnrVHEFGRsmeIEO+QBRzo/759gIZOvGpItSJ
 wbx0GM5SFv0qD9m+vnPz+JHlWAlLYNeUvRRlIOPJrC0eXth58FVUO5xN/vCTJHO/ESXKQagj53W
 6yhniReEaxkjkEzyseRJg==
X-Received: by 2002:a17:903:3c46:b0:2ca:4f33:e86f with SMTP id
 d9443c01a7336-2d707b416famr168344225ad.12.1787769779699; 
 Wed, 26 Aug 2026 11:42:59 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-3283d60c291sm17681846eec.6.2026.08.26.11.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 11:42:58 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-riscv@nongnu.org,
 Song Gao <17746591750@163.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-ppc@nongnu.org,
 Xianglai Li <lixianglai@loongson.cn>, David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Bibo Mao <maobibo@loongson.cn>,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alexander Bulekov <alxndr@bu.edu>, Chao Liu <chao.liu@processmission.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Glenn Miles <milesg@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Laurent Vivier <lvivier@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-arm@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Ani Sinha <anisinha@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH v2 02/13] hw/riscv/virt: register TYPE_TARGET_SPECIFIC
Date: Thu, 27 Aug 2026 02:42:16 +0800
Message-ID: <20260826184229.1145-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260826184229.1145-1-luoyonggang@gmail.com>
References: <20260826184229.1145-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=luoyonggang@gmail.com; helo=mail-pl1-x636.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hide the RISC-V virt machine when the selected target is not RISC-V
in a combined qemu-system binary.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/riscv/virt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 2d242ef71a5..b767c5434a0 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -22,6 +22,7 @@
 #include "qemu/units.h"
 #include "qemu/error-report.h"
 #include "qemu/guest-random.h"
+#include "qemu/target-info.h"
 #include "qapi/error.h"
 #include "hw/core/boards.h"
 #include "hw/core/loader.h"
@@ -1718,6 +1719,7 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
+    TARGET_SPECIFIC_CLASS(oc)->is_available = target_base_riscv;
     mc->desc = "RISC-V VirtIO board";
     mc->init = virt_machine_init;
     mc->max_cpus = VIRT_CPUS_MAX;
@@ -1790,6 +1792,7 @@ static const TypeInfo virt_machine_typeinfo = {
     .instance_size = sizeof(RISCVVirtState),
     .interfaces = (const InterfaceInfo[]) {
          { TYPE_HOTPLUG_HANDLER },
+         { TYPE_TARGET_SPECIFIC },
          { }
     },
 };
-- 
2.52.0.windows.1


