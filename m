Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4D2606A31B
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Oct 2026 11:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lf68dkDy
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLf72-0002zq-Dl; Tue, 27 Oct 2026 07:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf6v-0002vM-1Q
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 07:12:57 -0400
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf6t-0002rL-BR
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 07:12:56 -0400
Received: by mail-dl1-x122d.google.com with SMTP id
 a92af1059eb24-156cbe59524so3305763c88.1
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 04:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793099572; x=1793704372; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rIC7MLyqSf1PTjvgf0DPfcgctAOg/kiuIWLyJR9bmrI=;
 b=Lf68dkDyyWPMUVemaox69kcyGB9kT+hQOxejOgS6bGRizcUBvX8MoJe0hWkTJF/HJj
 tNf4lAhrnRWAoizPA7fTtqFOd/JHnYYAjk4tuKuKSo3G2lLREUlPkVI8gL1cgA+dfUNN
 gKUDxbLSxzRWV2wLlCMzSLDedZugA8hF//cOzzf+v6fYNgVF/yHHSsM6rjK6cWrQjaSm
 qY8b467vfR8cXj5Qg+K2KOfASlFa+btmViddP3kLs81/s28g+LEDWMwxjZ8eubIzgNr6
 2OcIoO8KSKDsUCY6VjyE9mT0Bbh9ZJXNB6WXSCfAbreQORB550/laZB9HwN3kJuVzq2I
 KA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793099572; x=1793704372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rIC7MLyqSf1PTjvgf0DPfcgctAOg/kiuIWLyJR9bmrI=;
 b=mg6uZEyjrbSvhFZ6oXCKkoAojxC/6qGBEIj01ozpl0uiQX3hImlp+sRerZpoDX0dHA
 eLda8/MgXoxdpaW+7IEceGXFLPp5hZSZhWvUXoe2qaSutAtYx5s/wVLTa3+FUV+TvB0o
 0R+UA45M9JtNiQWmrstT/VAGerYd2LtS1onj6LiZk9ZQM5X5E4095+DbE/8vLLvXG1jZ
 xBEpUtamThYTpL9zlcvuFQqYopzdKTR5lONdjDVg3L3/DHZTrB1LN/moWqP8Hn7aNgTA
 ZUuiEumjwnHPLhugmwyq0s+TUI8t0HavYZI/Eq70+qcErHVoYMnOWMIqpMZpGvHt3ZcZ
 STIw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwEsX/hcd2pERCtp8bFmenYQVrCmUTlJore9viYEwZKpLczmmQoRHdaIZd+oXP8diuSYcxb3ShmBw==@nongnu.org
X-Gm-Message-State: AFq9FYKX2uo/agMDYYbMZbnaixEIIArdF8GZtI+0YaC9s1LxaoRCz5Ne
 wef0gQjm0knwb6AC7LstOEC1nvbrR6Ne0nvzhhILiPHTEaOFtFfgsmN4
X-Gm-Gg: AYBFou2+37gDnkPb9qJzhFfc728OFxqGH/bzyv1wNP43DmWFT7DBOEHBNL/dgeehVNg
 5RmC4x0V5PoVb1ZGZntkQhVF9Qiji75yDR8P6Jt7R4y46KIffOPxOYbJLeDle6vP+VIua0SyoT3
 4MHYplPXsLnhndFdkndx/Ox3irVxV8P/d2i8ATYXEh5yx7N8wMbdRoC1sT6V4q9JkYDzW0Yeggr
 oxqKCrrecX+eEHFmG5guF5sgjAiMbjlL7+8IQdjyaecelmblHzhRceoHdpC7QH0qiBzmXLbTkty
 VWaihuPlpc5ED1/ILm1lET5sm4T96c8wL6+YQpbqQ7TJNMjC9nFrTMm0idqBJckBkOCUtGCIehR
 kaZZss7AMNy1YLSYwzbxPGbJyxJpQXtKfsgQYQqEI5xX7EqQrKJeKeJ0B+BrkyJkEQceSAja+4S
 HTWv6cIagxxjfZHd3dQqv75Sx/EIjiv1DtYqmnIvHF3aMCW1BkYhj8KXebYrCCZsfw2RRC5zKDb
 QqZa3CP8pGDOR4PfyvAtE0yWpaV2NrPZxJAF36UC4Wel+O0/TCLm0I5ksPA25MxwLeMax+diVfL
 ibkOy495S8Ok
X-Received: by 2002:a05:7022:e28:b0:14b:cf58:ce5e with SMTP id
 a92af1059eb24-1991b42085bmr18542078c88.0.1793099572020; 
 Tue, 27 Oct 2026 04:12:52 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-198a0f83cedsm40453042c88.13.2026.10.27.04.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 04:12:51 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Song Gao <17746591750@163.com>, Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, Philippe Mathieu-Daude <philmd@mailo.com>,
 Chao Liu <chao.liu@processmission.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stafford Horne <shorne@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Eric Blake <eblake@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v4 04/17] hw/hexagon/virt: move virt TypeInfo into its
 type_init
Date: Tue, 27 Oct 2026 19:12:02 +0800
Message-ID: <20261027111216.392-5-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261027111216.392-1-luoyonggang@gmail.com>
References: <20261027111216.392-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122d;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x122d.google.com
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

virt_machine_types is a file-scope constant, so .name has
to be a constant expression. Register a local TypeInfo from
virt_machine_register_types() so a later commit can compute
the name: "virt" for a single-target binary, and
"<target_base_name>-virt" for a multi-target binary.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/hexagon/virt.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/hw/hexagon/virt.c b/hw/hexagon/virt.c
index b601cd77a92..4823b1d8ac4 100644
--- a/hw/hexagon/virt.c
+++ b/hw/hexagon/virt.c
@@ -375,12 +375,16 @@ static void virt_class_init(ObjectClass *oc, const void *data)
 }
 
 
-static const TypeInfo virt_machine_types[] = { {
-    .name = TYPE_HEXAGON_VIRT_MACHINE,
-    .parent = TYPE_HEXAGON_COMMON_MACHINE,
-    .instance_size = sizeof(HexagonVirtMachineState),
-    .class_init = virt_class_init,
-    .is_available = target_hexagon,
-} };
-
-DEFINE_TYPES(virt_machine_types)
+static void virt_machine_register_types(void)
+{
+    const TypeInfo virt_machine_typeinfo = {
+        .name = TYPE_HEXAGON_VIRT_MACHINE,
+        .parent = TYPE_HEXAGON_COMMON_MACHINE,
+        .instance_size = sizeof(HexagonVirtMachineState),
+        .class_init = virt_class_init,
+        .is_available = target_hexagon,
+    };
+    type_register_static(&virt_machine_typeinfo);
+}
+
+type_init(virt_machine_register_types)
-- 
2.52.0.windows.1


