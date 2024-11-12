Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7223609njc;
        Tue, 12 Nov 2024 02:15:20 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUaZbcrJK5k0KjXjl969qD/QasnOwjli1mIeiqSRyG73m6fxlagJhqjNMRnEMJV/J5S0XxGpypkY70mmg==@linaro.org
X-Google-Smtp-Source: AGHT+IER8gRmGfIMd+VUyZJyVYQIuvQyW0pr0w/j11qZSFpgYOhFAzkEsh9vRPDPYs74mDqMsuGu
X-Received: by 2002:a17:902:cf0a:b0:20c:5909:cc30 with SMTP id d9443c01a7336-21183d1095emr210658055ad.10.1731406519712;
        Tue, 12 Nov 2024 02:15:19 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1731406519; cv=pass;
        d=google.com; s=arc-20240605;
        b=WEDOqvKvom4RyHHxQovjx1NHqWGukbNRBRjp1ooKLDp2QX73dssflGaZr1hpDS2HpV
         CRs8pbbqFx/3oyFY41n63K4Ig3j2+2OgYUu5/S49Y3ho2YzWkuIPMEPt0Ygh1aTDk4vm
         SgJcQXNYDX4UwWK2QTkDYJ3EfAO6OW7O4ZQofBILzM8tNpkq27j3LSO3yyMZVRBnCYAL
         mMFIHJ+c1JIsaa7euQNycfLIlUIxiqAD86CFgxCqtgNzFV8/uwjXwa6uYlHnoVT54871
         m3as/yhrGoV/9qFfuAQJIi5tax9Vp3YJJwnqpzA2umHVHFsGDb/WgEv7qqEYtFc8sBGL
         qwxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kht6cPYE0eBVU2zwedJ5/2fuuMzyURqW3NM8lANtURg=;
        fh=JQKbFkjfJQWoccs7g14nDRvOPJKaCohmqvrPXxI2tkQ=;
        b=KPExNsOD6hDk9omDXlSoRa0oDyDlSpo2eEIXmntlGEzcPdW0qV5kgAHPpZTFXvnRja
         EdKd/I7KEJHXZUbarUFm0/ivhZDuCUUHXo5SNTsd8deghfTYVILnLV0ktjZ8obhorD+C
         rmg2n9MMDO6J3GhXa+hr5+5VB/BzeXaLgNyarmJcXJt4/5KA6VDZEXpZWgQ5E1Leq2fr
         vWvOxjO3d7jJJErPmnmGVpqwN1NLtC1HRhe8i/bCLCRbAQNDoZ2Ol4WY/AZBVvMx3/DT
         OKiHwU8s6Y1rBrz/0mm4uWGCdm8tpMa6p8jJ1CrrqOusoBOJY1mHlsfxfBLffbbwBE7T
         VpZA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=CpAIGCPz;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-405563-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-405563-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-405563-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d9443c01a7336-21177ebc8e2si135464365ad.599.2024.11.12.02.15.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 02:15:19 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-405563-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=CpAIGCPz;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-405563-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-405563-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F4A2282EA0
	for <alex.bennee@linaro.org>; Tue, 12 Nov 2024 10:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858C82123E5;
	Tue, 12 Nov 2024 10:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CpAIGCPz"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3578821217C;
	Tue, 12 Nov 2024 10:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731406510; cv=none; b=A7YI+im8SOuaP1B4zU9IwMtR5QKwpvmfTzkAAKlt7VQ5W5pDrCK4NnxOcd2NF+1nZV5lnnp2h3Lp+Nvb6pycUw2Xi01vG+uXUrBKQ/f+hwPVwTtHo00HYGvdTuRYlgdySwP80DkQhlZz8EnTrspfAv+QjvAfzahfRk9rFfhE6bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731406510; c=relaxed/simple;
	bh=gZRgH1s/cCNEFX8xLSnC7mwjctXwEV543Xrdpddjabs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jSBDwQSU56mJMC75jyo5HBBctPrO9kQyE8N9bUX9ewcXhudBvvdY9+hHXUJjAAd6q3bzZ0KBecPzNuM40IDez2x3acIv58vnHKnE5dXmRUukwT47FMnjmwaQb3wbEt/2dTimwXXZPbMH179d8XylyatH3A09lKYjniQtzMQW57Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CpAIGCPz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCF3CC4AF09;
	Tue, 12 Nov 2024 10:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731406509;
	bh=gZRgH1s/cCNEFX8xLSnC7mwjctXwEV543Xrdpddjabs=;
	h=From:To:Cc:Subject:Date:From;
	b=CpAIGCPzgLkx4n9gtfH7GATjIZqvFRiIIlxQiqia00L6/avKOdun3uGNQrVv/VH22
	 niAAYo0WSUWJf4fYKnU7aRyviDSKH49JvTSWpK0rU+RDYfn3bKuvTNILuZgew+epB9
	 hS7Jf+mMV4KWkZPxFi5SZIVZtDiaxAP6FTHZqPLu2JrWWzwMy25UIzaA8kXeudfR/q
	 5Vt+XXJ4nfN6zx2NdEa5Y+DEbyh1aaxN7MKr/x3Y+up8LUd8EwL8kGDpttf3WdWE72
	 sj/4WxXFCQ9pK75KEDuvApPvg3P22X39M3HXB7E4kNFdw1KuVVXQIdUbE2JTb2jQ1q
	 qMWUAbX/jvb7w==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tAnvO-00000000Jcb-41oN;
	Tue, 12 Nov 2024 11:15:06 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 00/15] Prepare GHES driver to support error injection
Date: Tue, 12 Nov 2024 11:14:44 +0100
Message-ID: <cover.1731406254.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: V5Oc6AGsmEZP

During the development of a patch series meant to allow GHESv2 error injections,
it was requested a change on how CPER offsets are calculated, by adding a new
BIOS pointer and reworking the GHES logic. See:

https://lore.kernel.org/qemu-devel/cover.1726293808.git.mchehab+huawei@kernel.org/

Such change ended being a big patch, so several intermediate steps are needed,
together with several cleanups and renames.

As agreed duing v10 review, I'll be splitting the big patch series into separate pull 
requests, starting with the cleanup series. This is the first patch set, containing
only such preparation patches.

The next series will contain the shift to use offsets from the location of the
HEST table, together with a migration logic to make it compatible with 9.1.

---

v3:
- improved some patch descriptions;
- some patches got reordered to better reflect the changes;
- patch v2 08/15: acpi/ghes: Prepare to support multiple sources on ghes
  was split on two patches. The first one is in this cleanup series:
      acpi/ghes: Change ghes fill logic to work with only one source
  contains just the simplification logic. The actual preparation will
  be moved to this series:
     https://lore.kernel.org/qemu-devel/cover.1727782588.git.mchehab+huawei@kernel.org/

v2: 
- some indentation fixes;
- some description improvements;
- fixed a badly-solved merge conflict that ended renaming a parameter.


Mauro Carvalho Chehab (15):
  acpi/ghes: get rid of ACPI_HEST_SRC_ID_RESERVED
  acpi/ghes: simplify acpi_ghes_record_errors() code
  acpi/ghes: simplify the per-arch caller to build HEST table
  acpi/ghes: better handle source_id and notification
  acpi/ghes: Fix acpi_ghes_record_errors() argument
  acpi/ghes: Remove a duplicated out of bounds check
  acpi/ghes: Change the type for source_id
  acpi/ghes: make the GHES record generation more generic
  acpi/ghes: better name GHES memory error function
  acpi/ghes: don't crash QEMU if ghes GED is not found
  acpi/ghes: rename etc/hardware_error file macros
  acpi/ghes: better name the offset of the hardware error firmware
  acpi/ghes: move offset calculus to a separate function
  acpi/ghes: Change ghes fill logic to work with only one source
  docs: acpi_hest_ghes: fix documentation for CPER size

 docs/specs/acpi_hest_ghes.rst  |   6 +-
 hw/acpi/generic_event_device.c |   4 +-
 hw/acpi/ghes-stub.c            |   2 +-
 hw/acpi/ghes.c                 | 256 +++++++++++++++++++--------------
 hw/arm/virt-acpi-build.c       |   5 +-
 include/hw/acpi/ghes.h         |  17 ++-
 target/arm/kvm.c               |   3 +-
 7 files changed, 171 insertions(+), 122 deletions(-)

-- 
2.47.0


