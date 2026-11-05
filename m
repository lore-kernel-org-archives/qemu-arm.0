Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D97606A31B
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 18:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KDVCUa/E
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xP2JT-0006C5-9H; Thu, 05 Nov 2026 13:35:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xP2HU-00059t-JM
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 13:33:49 -0500
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xP2HQ-0007h3-OP
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 13:33:47 -0500
Received: by mail-dy1-x132f.google.com with SMTP id
 5a478bee46e88-36eb1cb7aabso1099238eec.0
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 10:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793903619; x=1794508419; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=K6QnG2OWy45OWEL5o3UglLvd+yAc+id9BaTefFb/yno=;
 b=KDVCUa/EJhIOKjQ67S3/fsn/a4hF4M/H2ayb4IHKe4e2e6VvuKpQ4FrhCeovu/JKcG
 lmh1VlJv3uHe95Y2Th9dkSGd4EGBplZDRqcuwEAjr4K9frMGlltgcZcagx+TTTIIZlGh
 NvRktQZOYWdVIvzLLne+YOSRhIQ5u5IuYtIQBEKetCDrmOVaTdaWaASBLehxCLvUjBC8
 FS7O/xrYt3V2VU8tfuBEQ7y1iRceB9h214C9uGDbOR90GVf+SnBxD9AH+Wo9VM39ERrz
 JXJN5BCx26mTou5wi721nDCX9u+eBDQ0t1FENEMJJPN7eF9BQiLH4r4K6NIlHPI+EB/i
 hi6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793903619; x=1794508419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=K6QnG2OWy45OWEL5o3UglLvd+yAc+id9BaTefFb/yno=;
 b=wDZmclRdE+doMJ9XKD6QhIYfsz53FekvhwxyuUlMcx35XRy8M/VuCIMZmDgcZ1B7aT
 eIX/98ovByHVN8bvzDWbAJXh7CsA2GHUPB7QQmGN0v81+LwqQtaGveW39UbUyEOnS3vY
 291eM6rDXHnZvebOnJ9MpZ2pHaNBjyi3QHfgaaN5tQH0gyoIN7knM9JvY4lPHcvcCjay
 yncVK6RIUvcAg4r/rxN2tH4gez3hd5ZW3KADW4cHbEoCx7tasIMuXLJY7GhqFSIVnh10
 NJSbLqNjY5popRvcGi5iC3ZtNzhQpkZXaUrHCVKT2V+BP8ZR8RqfTv6j49Ac17DlcvSG
 chrQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxhMMFCDVo6aF6oUFO4Gvwijm4ncpLM3DrfFdHEtuo6k/+Jj9lbMbygOEkTjGHK8XSkOctCBZTp8w==@nongnu.org
X-Gm-Message-State: APuU4Z97WqRqHowCxZiqo6+Dj2sLNH/vUPU0P/yl/OPr8W52JyrN7NWX
 yf1w2xWs64GLZlsIypKba9578A5dIEnWVYlVld9t3yOmPWQR3VBWhG3Q
X-Gm-Gg: AYBFou3w5Q9MjJnHBU0+Bu97sSWweXtX/xmnGVHN4DK/wwFPHcmnTIj04ltnhWayjyh
 pHNVqYeGiKXqtjg7ck8IdzVhFKQ0JXoT/4rEMtWT61CZ1YO0oacyIwo2smYUNi3m1jUG5tbeYqR
 PSP8/sJ6B5YoppUZymFfl9SFeMAQwmkkfKugqe5S85uiLGXlE00TKqmyN4TiMcaMnDGh6QYc7Co
 3qnLR7RMRbMTTY66CO3JXmQB1X8wYd1dmah7Mra73jge9LHNvcpjdrSuRebX9aQP78IiCg/3J+M
 3Gxzm/PmQYXoUm1S2SmzNvdQaic+Owquvl2lRLp9+6LioXNnSMKY3bh7D5W3sJTKjC5CaEA02Z1
 4kEhwx3U/EIgruD5Zv01alW3YJAWW6wDhyJU6rQzz7EAYhHXvRpsh4yntI3UpVz5Hl3irKwLo55
 YbtG2XJDbvJFvy6dlP0KF5o2cRguDFkKIvsWiJzX8wayEsE0os0eACQ8Fibd4z4dGMQ2y2Ui7mc
 ya7ujFvvg6GQFqR8M3HF0NNUoHFqpen1Cqu2k5RdyosDmHxd7ZCfMpyOZwUxy/WVC+wlhP3wYwc
 61Wi5yt1Fa5Sh8nuOAsZImzfoqRRveyiopqGA5zDIdcG9Yaa
X-Received: by 2002:a05:693c:8854:b0:36f:6d81:3f99 with SMTP id
 5a478bee46e88-36f6d81425amr52897eec.7.1793903619219; 
 Thu, 05 Nov 2026 10:33:39 -0800 (PST)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-36f66086a4asm277795eec.0.2026.11.05.10.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 10:33:38 -0800 (PST)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>,
 Peter Maydell <peter.maydell@linaro.org>, Weiwei Li <liwei1518@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Glenn Miles <milesg@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-ppc@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v4 3/3] Revert "target/riscv/tcg: restrict tcg-accel-riscv-cpu
 to riscv targets"
Date: Fri,  6 Nov 2026 02:33:09 +0800
Message-ID: <20261105183310.1614-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261105183310.1614-1-luoyonggang@gmail.com>
References: <20261105183310.1614-1-luoyonggang@gmail.com>
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

This is redundant now as all accel-$cpu_type parent is already registered.

This reverts commit ec65e16fd2ba012d57b1bbfcfcd04c31c4111924.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/riscv/tcg/tcg-cpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 5834ec1524..3d9c997329 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -1755,7 +1755,6 @@ static const TypeInfo riscv_tcg_cpu_accel_type_info = {
 
     .parent = TYPE_ACCEL_CPU,
     .class_init = riscv_tcg_cpu_accel_class_init,
-    .is_available = target_base_riscv,
     .abstract = true,
 };
 
-- 
2.55.0.windows.3


