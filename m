Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E390B606A31A
	for <qemu-arm@archiver.kernel.org>; Sat, 31 Oct 2026 16:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s4ElI+G2
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNC8W-0002HH-P4; Sat, 31 Oct 2026 12:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xNC8T-0002Ep-Dy
 for qemu-arm@nongnu.org; Sat, 31 Oct 2026 12:40:53 -0400
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xNC8R-0007j6-U6
 for qemu-arm@nongnu.org; Sat, 31 Oct 2026 12:40:53 -0400
Received: by mail-dl1-x1233.google.com with SMTP id
 a92af1059eb24-15943c9c005so1225026c88.1
 for <qemu-arm@nongnu.org>; Sat, 31 Oct 2026 09:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793464850; x=1794069650; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ijec5IqKtte5FEFZKHuL2v/76f/YDRGlyoBcQv2L4Uw=;
 b=s4ElI+G2vqSPwYwlcIjA2K0PcSKxEovzUhO4M9mIbR5NAKKDdviGshirY9SLqXtyA/
 yXISa6bbc/BYavBlPFrCsS1QmasFgi9LEjwU2mkh5vmEcMQrNHv1jRJXuLAzjgIEXs8i
 HK5nQ/UZYTWjZ/g4Hp296F1s6kI32OEp0jDbLWefXuzIHfGs3oyDvVVcjALTvzdtkM/1
 yKh+69rGwcuBhgzCXQnKB3KNM0H2fQ9lH2GdxbaHa2TbTdh0QNGFQmJ7R10knOESZwF7
 u1J7/7M31q8dhQ+KMWdhTQgLm1Jgf5VXWvn+yu0ZNIswwghjDDyn4Rum/8D6M6Jp/jFs
 FUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793464850; x=1794069650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ijec5IqKtte5FEFZKHuL2v/76f/YDRGlyoBcQv2L4Uw=;
 b=wvVFOfgQrsEUrzJ/PrP4O3nrEBolMalHoUybt0jWJ3nKH1FaWcmFr0oix1G3Nk//oU
 4TtoimRlzrReuCT51Re3j6v+z1b95t61K/43ehd9JRC5WHOcPHMaa02paDpvEeFkl+C+
 tC0LRruldOl04l+/R6/R9z/M8MZt6IYAl2FMOLU3dPpz52q+sHdKufpffQbJIKXqjK7E
 AwzWZqxdlLffE0r8Yf/JIeCh1b22X2tSE+pZYf3rjTAzw5MnEUD8Ab8zVZP4glFXeIUN
 E/kr6xfDdqrlumsg1Vd8iuYfYlncfrBjjDY0a0ushJnO86MM6zaTGw/Q5pX7UwgRLbhP
 RZqA==
X-Forwarded-Encrypted: i=1;
 AKwUvBw9dFKbMSf+M+3X47vUhWyenODXGKnkejw0Qx+tXe1dj1jacpOgaetxWoLAxUfJMo6TPB7WuIAAxg==@nongnu.org
X-Gm-Message-State: AFq9FYJE1/0PFGwqRc0jTiwk3xqaAvKQuy7fXK0b6DWYTNGJOgWLRCEV
 F0o5gzd5LzJ0H9iurMj7aYEAP0cKZji59GuREVIvvOmUDR+spohy1Z7g
X-Gm-Gg: AYBFou0wPhCeWkLnhwPzwsJJVJv2OIIfuWpLkAcvfqhUiw74+NKndnxc4YS9xLCyB0k
 8uQp2LuKZsfB2hm4q/JK6E6Cv4dro5JLTZMhl2pdMyNt5JarU3yqMMkEjlaYGOszMLzybQLBMFz
 w35BvRrAzbh/783oVf3rYUQf/xk61Y8PJt4fj1KL9+kAEod3mZ/TFknPhnji0SWv/WBjwO5ztVp
 NGZg1XScq0UX91KMn0oqCoCquatsbdA1fVawoVJterDl0uZ5EMrq8lB7DHEvy2mQ9MkbBMpX2fg
 dpGf10F9PA5lGhtj0VCgjntERpEhO3Sik68zG8YPYiQOYsRN6SVLlmLivV/9vUgi2bcOE4sGM3D
 LAdDkQLk5+dP2kuhO+RcYu323XrjJdvrzHUpdKs465gqcGDmtTaQAyB28Eu+KDtPqiqoTN2qO/K
 P4Ce5YNr1mKgkPJCcJyOLJMm5cUqrFhTe+zIAIcst9IQuKZ/PzFt/yaziNQi0qxidTFYAzBjaxH
 czHnGwlOlLDnZK8tuFtJeQX1UAjAb36AgGAfaYZahYb7J2zR7xKQTEQNjX+Deq9dW07vqHeShb+
 8zVaOvIk81uPfX304tezGep7TEKKqsYNO+nw0LA0VPGja1ws4g==
X-Received: by 2002:a05:701b:2710:b0:189:ff2b:b194 with SMTP id
 a92af1059eb24-1ac5b9cb051mr7767795c88.16.1793464850203; 
 Sat, 31 Oct 2026 09:40:50 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac193b8179sm19574572c88.11.2026.10.31.09.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 09:40:49 -0700 (PDT)
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
Subject: [PATCH v2 05/12] hw/xtensa/virt: select virt machine types with
 is_available
Date: Sun,  1 Nov 2026 00:40:00 +0800
Message-ID: <20261031164009.2048-6-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261031164009.2048-1-luoyonggang@gmail.com>
References: <20261031164009.2048-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1233;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1233.google.com
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

The Xtensa virt machine uses the QOM name virt-machine, which other
targets register as well. Register it only when the selected target
is Xtensa, via target_xtensa().

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/xtensa/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/xtensa/virt.c b/hw/xtensa/virt.c
index 8c8fdad72f0..962646ba98d 100644
--- a/hw/xtensa/virt.c
+++ b/hw/xtensa/virt.c
@@ -29,6 +29,7 @@
 #include "qapi/error.h"
 #include "system/reset.h"
 #include "hw/core/boards.h"
+#include "qemu/target-info.h"
 #include "hw/core/loader.h"
 #include "hw/pci-host/gpex.h"
 #include "net/net.h"
@@ -131,6 +132,7 @@ static const TypeInfo xtensa_virt_machine_typeinfo = {
     .parent     = TYPE_MACHINE,
     .class_init = xtensa_virt_machine_class_init,
     .instance_size = sizeof(MachineState),
+    .is_available = target_xtensa,
 };
 
 static void xtensa_virt_machine_register_types(void)
-- 
2.55.0.windows.3


