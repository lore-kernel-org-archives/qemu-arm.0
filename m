Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3872899lfb;
        Mon, 30 Aug 2021 01:28:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzP1QI7IByf3Fu6Fb+N+kP6mIJIcSsvCJberNeDoc8tHEaIRrpe9Vu6YFslllEFwYbHFc0S
X-Received: by 2002:a25:1c06:: with SMTP id c6mr22786585ybc.498.1630312124906;
        Mon, 30 Aug 2021 01:28:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630312124; cv=none;
        d=google.com; s=arc-20160816;
        b=xKXHGQKNrPE46/KQwZ4IhzsLRbBjypTjW5w3+ak9V/G7jZBBqmiyUSqe5m8imBFddp
         Qn9LkTymfRz3SlU0of3ICJUurfmjhifqRt+z4gCF4xlEXdiDjN8CHO4P37kP2GsR5zoI
         WeHdsqwvjQl2yaQItCuOHkm+G2ENzXT6NHLP5djE0O1WglQe658wA8yNQN1kL+vCtKAJ
         OPJqwUMWlS4ZOb2h3bdIRLE5e8ghY63I9ZVCZB25tEKzcMmMvDNTAaicslB0LlnKLB5n
         Gqz/pMGdeXezpi3LEbOT9iYUVcDnTgm3mPC186x9XS3Mku7VG73jstcx6GoipQ8FY0QV
         i4ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:ironport-sdr;
        bh=p5mP9GA9D72HmDh3mDwc5M9fkUknw3A6+3TOoufc3fM=;
        b=axlL/yeAM9GNGt1DGhjlTdyeHmx4QGo6YyXpC7OaKrd1tlnb4048UNuzKAbkuKRo1H
         uYWbKAaPocX+lIQFPtUgFToRx2OtC9JHzouEciB5eUXm+xv7U+Z1db9BIQ/JnyikYTkQ
         DS84f8qNmgFxACWxovx8Qxh5SQiY5v/TfXL36OYiSdss7PRTYxyOemOgODmTKN5yBLU4
         lTQ4lzGltJ+vrUT0JEXMCt7Wn+hfT2hKtJByWqQKyLLk1bJ7280LmnI+8G7+Tm37FvNI
         v/SU8BWVDjGqE2OwsCkigQge2r9xR8ysdf44GAlLKoo4kqjNr6qPcqsog10lJZe+gJWt
         ok/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fujitsu.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d191si9648258ybc.281.2021.08.30.01.28.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Aug 2021 01:28:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fujitsu.com
Received: from localhost ([::1]:56928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mKceq-0005jW-77
	for alex.bennee@linaro.org; Mon, 30 Aug 2021 04:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mKcee-0005ik-AR; Mon, 30 Aug 2021 04:28:32 -0400
Received: from esa1.hc1455-7.c3s2.iphmx.com ([207.54.90.47]:19482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mKcec-0000rR-7l; Mon, 30 Aug 2021 04:28:31 -0400
IronPort-SDR: KiKCVpIS5gZJU9pferFEPYuZJNL6fYRuHm+aorHSnjVXuA/7+mKsYLJHeeminqcogPWSirOkMc
 4R94A/YKh3fB4dNv4p7AJeXARwzS85VZJeJhui4V/xyZf5wkyH/6BCB0Ub6pdnw1kBHPoJ1Ftr
 VZDhmLlfIlESkw69ads8+5HfYGZJBEbqO3D7lG9uc6/0ogAgGdlJxG8k2CviFhz19/f2xvPBrf
 fd4SP74uZYzxqPkEMJWJFlQH1iLmDN+ct5infHqjFio4g2Nu3mz9buqOHI+0n1L4iaJtL0+6x5
 0o7L+rjfb/fYcxgZNrDmhhm8
X-IronPort-AV: E=McAfee;i="6200,9189,10091"; a="42326698"
X-IronPort-AV: E=Sophos;i="5.84,362,1620658800"; d="scan'208";a="42326698"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
 by esa1.hc1455-7.c3s2.iphmx.com with ESMTP; 30 Aug 2021 17:28:26 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com
 [192.168.87.61])
 by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 959B61FA832;
 Mon, 30 Aug 2021 17:28:25 +0900 (JST)
Received: from yto-om2.fujitsu.com (yto-om2.o.css.fujitsu.com [10.128.89.163])
 by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B62D7DD74C;
 Mon, 30 Aug 2021 17:28:24 +0900 (JST)
Received: from localhost.localdomain (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by yto-om2.fujitsu.com (Postfix) with ESMTP id 81EBE4006D7E3;
 Mon, 30 Aug 2021 17:28:24 +0900 (JST)
From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
To: peter.maydell@linaro.org,
	drjones@redhat.com,
	qemu-arm@nongnu.org
Subject: [PATCH v5 0/3] Add support for Fujitsu A64FX processor
Date: Mon, 30 Aug 2021 17:28:17 +0900
Message-Id: <20210830082820.2690275-1-ishii.shuuichir@fujitsu.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
Received-SPF: pass client-ip=207.54.90.47;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa1.hc1455-7.c3s2.iphmx.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, ishii.shuuichir@fujitsu.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6hAh88VlZ3x7

This is the v5 patch series.

v5:
A64FX supports only 128, 256, and 512bit SVE vector lengths,
but the QEMU implementation prior to v4 did not have an API
to specify a specific vector length.
Andrew has implemented an API (cpu->sve_vq_supported, commit:5401b1e08d
etc) to solve this, so we have changed the implementation to use that API.

v4:
The following changes have been made to match the SVE specification of
the A64FX processor.
- Implemented internally only the vector lengths of 128, 256, and 512 bit
  supported by the A64FX processor.
- Removed sve and sve-max-vq properties due to the above changes, and
  fixed them so that no explicit options can be specified.

v3:
When we created the v2 patch series, we based it on the v1 patch series
that had not been merged into the upstream, so we created the v3 patch
series as a patch series that can be applied independently.

v2:
No features have been added or removed from the v1 patch series. Removal
of unused definitions that were added in excess, and consolidation of
patches for the purpose of functional consistency.

For patch 1, Implemented Identification registers for A64FX processor.
HPC extension registers will be implemented in the future.
For SVE, the A64FX processor supports only 128,256 and 512bit vector lengths.

For patch 2, A64FX processor can now be used by specifying the -cpu
a64fx option when the -macine virt option is specified.

For patch 3, added A64FX processor related tests.

Shuuichirou Ishii (3):
  target-arm: Add support for Fujitsu A64FX
  hw/arm/virt: target-arm: Add A64FX processor support to virt machine
  tests/arm-cpu-features: Add A64FX processor related

 docs/system/arm/virt.rst       |  1 +
 hw/arm/virt.c                  |  1 +
 target/arm/cpu64.c             | 48 ++++++++++++++++++++++++++++++++++
 tests/qtest/arm-cpu-features.c | 11 ++++++++
 4 files changed, 61 insertions(+)

-- 
2.27.0

