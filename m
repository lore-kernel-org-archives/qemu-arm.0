Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4599CA1012
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 08:22:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uu58L-00025S-Fi; Thu, 04 Sep 2025 04:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54x-0006Vd-Sh
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:25 -0400
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54U-00048t-2m
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:22 -0400
Received: by mail-ej1-x641.google.com with SMTP id
 a640c23a62f3a-afcb7ace3baso137859966b.3
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 01:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973512; x=1757578312; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3RQ/9rxDUPu7uJRVAzp79eYsa4qcVHBXmURVHyZAYUo=;
 b=QvvOZY4e+6Y9MElx3E/UsQ+MVCtWL8O/KjmnFYldWxcLcYUBEum0te7ae+wuAZS2s6
 6qu8PaJW+c0G6dFsWIcG6KnnRHoKvR2+XIWMqwZSU+MW2JVer5ByVAsxSkUtBy/UKJ4o
 IP3ypoZN0kCLj1d4eBDQVmLWB3Q86JQkLoZBjC3cT2xlAxPz5ihWp6z4AYaTsI/iUZhP
 ovCfnXACSurZ3f8DpcZt2hMbOO6rRfrbSugJHBDYHpqsBcolS6LDD7Vmb6q9jDAotjzP
 FxlPTG/aGlskm9EqgxDK94rUpWYCqnxxFfeJgpbIL+USe/PHfORkFDDeydupIwIx2Sag
 iNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973512; x=1757578312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3RQ/9rxDUPu7uJRVAzp79eYsa4qcVHBXmURVHyZAYUo=;
 b=v2QYQ6b4YXakRy79rh7XkBTsKBngld6ssPslgv683m41JQ/pseibjqNHNU3KGvcd42
 9uGzPM6Br298mo+JcXbJsdPrH5+4exgEUz8z7dNsp/GaLmvm/nzKQPZIavghWjVjkclu
 tmBV7DU/p3Gvytz3RZhymsO+Hy01/uj61VAyUZ/fWvTf032W+nU7G9dvXYh7NhazaR64
 LP/1NqtELqmNmuZVjvLqGprj2eJOtxKB9ELI0iLzyBHzcEaSqdmtCz0rxamUr0J3mndE
 Gh64oeJRvvo6dlUdzHnixt7nbKKr8IuSVrBcjJnS2wkT0QkUxoFcX5wcabXx4y80UaJn
 DCog==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJzEgEUZfyqcGWbUoWQqCVDmXzXYzZn/pq65D+kpyAFAb0mtiks7xMoZDAt9ytMGCYvuAi983gUQ==@nongnu.org
X-Gm-Message-State: AOJu0YxemJ9CdFJZMDsHiqRtXB1NYnSy2gEbExOkDdEkhd0Bn+674yF2
 36FFlhnuH7d5ES+vSMH3iuVswivNY62OdHUlmfEsmLttWjle0HkrY/mdG7N/jH91VaM=
X-Gm-Gg: ASbGncsDPybHIkwiAKy9znVXL8ie4rhqzvvum+VwtskUtwzM8p5TZaYeQI7dce7VQaV
 7EKV13AYHEqXk9AENG//gnUcxh8LqBp3hhBnC4Mb4O8xDbkJs98a1f1YgVxyb31NK+ENY3WpljF
 4UhC/+hbE6S5UxFGCEaWaOqX/N1dn4cPqWVaQtz9cCGz/sSCmyCh6ngxfqHz8neL/ktoKdvKUAv
 5K0lUfTnliAXAYmHjz+rbBYcIb7liH/ZYmKvC3xDWvmCegvE8L5yvN5XpQx4lhyPkUHjATSE8kO
 y4g2sCjBmt6Oq+OKqrkROVqBMhSOXDpimwytBfQUgyo4QXdjZmlUHIIdzcmBbqyufInBBBAz7ZK
 9WnVtje+OAa7efKhCL6642HT3KMTKRiBeCYX4PVAmk7f9
X-Google-Smtp-Source: AGHT+IEMiQUnZCUx+REMU/XcQ5tTI90e+ZSsd/3pD9djADv7KyFZS6DVOw7EVXdxkO4rIlRK8VaD/g==
X-Received: by 2002:a17:906:12cf:b0:b04:11e5:9a8e with SMTP id
 a640c23a62f3a-b0411e59b44mr1462216366b.40.1756973511178; 
 Thu, 04 Sep 2025 01:11:51 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b04129eccbfsm1161132866b.7.2025.09.04.01.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:11:49 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id DEE096019A;
 Thu, 04 Sep 2025 09:11:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Helge Deller <deller@gmx.de>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 qemu-rust@nongnu.org, Bibo Mao <maobibo@loongson.cn>,
 qemu-riscv@nongnu.org, Thanos Makatos <thanos.makatos@nutanix.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Riku Voipio <riku.voipio@iki.fi>, Cameron Esfahani <dirty@apple.com>,
 Alexander Graf <agraf@csgraf.de>, Laurent Vivier <lvivier@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Stafford Horne <shorne@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, devel@lists.libvirt.org,
 Mads Ynddal <mads@ynddal.dk>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Peter Xu <peterx@redhat.com>, Jason Herne <jjherne@linux.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Kostiantyn Kostiuk <kkostiuk@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Warner Losh <imp@bsdimp.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Chinmay Rath <rathc@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, kvm@vger.kernel.org,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Michael Roth <michael.roth@amd.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, John Levon <john.levon@nutanix.com>
Subject: [PATCH v2 047/281] rust: move dependencies to rust/Cargo.toml
Date: Thu,  4 Sep 2025 09:07:21 +0100
Message-ID: <20250904081128.1942269-48-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x641.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Paolo Bonzini <pbonzini@redhat.com>

As more crates start using the same dependencies, it's better to not
repeat the versions and move the dependency declarations to the workspace.

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/Cargo.toml          | 5 +++++
 rust/qemu-api/Cargo.toml | 6 +++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/rust/Cargo.toml b/rust/Cargo.toml
index 0a83db15356..6f8884eb30b 100644
--- a/rust/Cargo.toml
+++ b/rust/Cargo.toml
@@ -15,6 +15,11 @@ license = "GPL-2.0-or-later"
 repository = "https://gitlab.com/qemu-project/qemu/"
 rust-version = "1.77.0"
 
+[workspace.dependencies]
+anyhow = "~1.0"
+foreign = "~0.3.1"
+libc = "0.2.162"
+
 [workspace.lints.rust]
 unexpected_cfgs = { level = "deny", check-cfg = [
     'cfg(MESON)', 'cfg(HAVE_GLIB_WITH_ALIGNED_ALLOC)',
diff --git a/rust/qemu-api/Cargo.toml b/rust/qemu-api/Cargo.toml
index db7000dee44..c07a17a28b0 100644
--- a/rust/qemu-api/Cargo.toml
+++ b/rust/qemu-api/Cargo.toml
@@ -15,9 +15,9 @@ rust-version.workspace = true
 
 [dependencies]
 qemu_api_macros = { path = "../qemu-api-macros" }
-anyhow = "~1.0"
-libc = "0.2.162"
-foreign = "~0.3.1"
+anyhow = { workspace = true }
+foreign = { workspace = true }
+libc = { workspace = true }
 
 [features]
 default = ["debug_cell"]
-- 
2.47.2


