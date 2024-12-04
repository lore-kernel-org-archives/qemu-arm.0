Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp24046njb;
        Tue, 3 Dec 2024 23:42:47 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUBRHYKwu5dYZQhgHUjxJTDbxxgflIHDxDYPLBsQyvpmQujRt1Yk3+HBBp576si/36hk4k+mOzoRV0Tag==@linaro.org
X-Google-Smtp-Source: AGHT+IHEHyVwaI5Y3L6/eEPTtngnW/HEsCD7mikesbK/aXE2yVfbCDKoNSyakBESPQxH/wH8Gr+D
X-Received: by 2002:a05:690c:6c87:b0:6ef:7fdb:7d41 with SMTP id 00721157ae682-6efacb20161mr83742977b3.0.1733298167389;
        Tue, 03 Dec 2024 23:42:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733298167; cv=pass;
        d=google.com; s=arc-20240605;
        b=QRb2yBFbwONqZWPgwUPx04sMWY7T5JYqBZWWbBMyjdEaG+hrxOaL5/r0yG2eqjknKJ
         HPDCy/3LzFwh0xqkuAcSolzN2tMFefrwWTNsgO7Y75GsBkCnLQ5fGB+HCRdp8/gSjVBV
         lNYN/HrYbnfszE+7nq+Z9Y9LGXtkjFLqN1f3BGq+dzMiOs2s9B9Uc3qSzYk30kY5Ghqk
         dq25gM65QEZoHvNmsJW7WTWwbBl5mveBJxmv3D2m3PrIdeaZmgbyID8+8GXqhuOPsAkx
         Oax2psy4VkEiCO/NNQC4i6SOegJluWkLQebueUnMwRi8qrPQjU97xIDquXJR1rJ27Qpl
         MFRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uXnZeAWqbFX6W0enzfZRlqU7lvcmaWHjjS9byeq+Scs=;
        fh=JQKbFkjfJQWoccs7g14nDRvOPJKaCohmqvrPXxI2tkQ=;
        b=QeLaXPOUie5Td6w7KZywJzAobZS+peIH+6d5/iw4rO9CsLRpn80s9bawL9N9yxL8XA
         5ELX35R2LiLRKN76HNKYPKEnjPUxITca6eswLJYK0mDoFoOI/h2uXFVXxiSp8RJ+mVoB
         NXV/EKyMmaH6Oq4td7G0upLb8wkXS+96ElSGH4hBOdNuwXxl8wTdxXMPjo1v3dcq/25Q
         sGqA5lpvX4MYAyU+G9eQp42TrAsnRqn9rYCfGWo5O+bcYN02A/fnAmjp+vwW8MKXErcQ
         yulDncl1jWV0KVEcuJV0WZP5dpgoEUnoiz5hd1K1mPQIQ9hd82aieR0O7mO6t7KQb6gX
         5Vmg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=LqvDH7UT;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-430666-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-430666-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-430666-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d88648253fsi134948316d6.109.2024.12.03.23.42.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 23:42:47 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-430666-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=LqvDH7UT;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-430666-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-430666-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B353F168126
	for <alex.bennee@linaro.org>; Wed,  4 Dec 2024 07:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B937C18F2E2;
	Wed,  4 Dec 2024 07:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LqvDH7UT"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B0218E025;
	Wed,  4 Dec 2024 07:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733298153; cv=none; b=pRzbvjtDWe8b0MK0bWvvJS5pYnPq51BoavkJ5yBVOerGLlDlVICyK9pf4F3AbZjHtz2QlZ2rJBfuadjWxhO9qxJgDBZVe4NdwW2ECV6Ais+AilWRF3wwZ7tJpjdDK8zzzTnlzjZ8ez8OLscKb6vXapCB7L60iGyoZFBV4tT4O7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733298153; c=relaxed/simple;
	bh=K42FUlB9Nt15dod2oykG+ZKdZDbK5Uic2xMqq2DGkdE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kb7UjqGtz7p2Hem7GVyloMb5OjZkes1g30MB5exYAj3dqkXKgtds9YhhxCY4i5GE6HWgVZJsr5jduuZDkTwQMD46pXF7QhIU7mHQ32vc2CEDECwCG/qF8LRUOXGlkxyXafQXA24L852CUoR6LlD0jmKnxy9HP5KQIbMlTlBWZmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LqvDH7UT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1179C4CEE2;
	Wed,  4 Dec 2024 07:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733298153;
	bh=K42FUlB9Nt15dod2oykG+ZKdZDbK5Uic2xMqq2DGkdE=;
	h=From:To:Cc:Subject:Date:From;
	b=LqvDH7UTcropXYAHcM9fkPDByy/hd+aN0GQ4GZ2chTEfCE+ivCxoFhV4ax6MIYzPV
	 voJrBu+wXtCDPmsHvBRH0lfq7n6OWd6uyQLOSVBKox0Tt/coE5jqDqPxUp6p0Mp4Dn
	 8x3t+GkDtf7wa0nhV1zRcFTtbViVVHt5bIwxP99stK89A3BNE/AqACLe3vRA9qzV73
	 m7h+IHOhN29WWAlNH64PHkxQzOhDOiK7SL1wCYzyp+0lTI0N+3ubimlPQP/py1RI6j
	 66Y5DAEmmwg14Nnqdtkokvsdfacn1txlrvVC2vGEYB1GWHDIaFRy8HHMEkkc4jEnP3
	 z9Gatb+nnksig==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tIk1m-00000004Kif-3t7i;
	Wed, 04 Dec 2024 08:42:30 +0100
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
Subject: [PATCH v5 00/16] Prepare GHES driver to support error injection
Date: Wed,  4 Dec 2024 08:41:08 +0100
Message-ID: <cover.1733297707.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: RttHgYHobr2L

During the development of a patch series meant to allow GHESv2 error injections,
it was requested a change on how CPER offsets are calculated, by adding a new
BIOS pointer and reworking the GHES logic. See:

https://lore.kernel.org/qemu-devel/cover.1726293808.git.mchehab+huawei@kernel.org/

Such change ended being a big patch, so several intermediate steps are needed,
together with several cleanups and renames.

As agreed during v10 review, I'll be splitting the big patch series into separate pull 
requests, starting with the cleanup series. This is the first patch set, containing
only such preparation patches.

The next series will contain the shift to use offsets from the location of the
HEST table, together with a migration logic to make it compatible with 9.1.

---

v5:
- added a new patch:
  acpi/ghes: don't check if physical_address is not zero
- removed a duplicated le64_to_cpu();
- changed a comment about writing 1 to read ack register.

v4:
- merged a patch renaming the function which calculate offsets to:
  get_hw_error_offsets(), to avoid the need of such change at the next
  patch series;
- removed a functional change at the logic which makes
  the GHES record generation more generic;
- a couple of trivial changes on patch descriptions and line break cleanups.

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

Mauro Carvalho Chehab (16):
  acpi/ghes: get rid of ACPI_HEST_SRC_ID_RESERVED
  acpi/ghes: simplify acpi_ghes_record_errors() code
  acpi/ghes: simplify the per-arch caller to build HEST table
  acpi/ghes: better handle source_id and notification
  acpi/ghes: Fix acpi_ghes_record_errors() argument
  acpi/ghes: Remove a duplicated out of bounds check
  acpi/ghes: Change the type for source_id
  acpi/ghes: don't check if physical_address is not zero
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
 hw/acpi/ghes.c                 | 259 +++++++++++++++++++--------------
 hw/arm/virt-acpi-build.c       |   5 +-
 include/hw/acpi/ghes.h         |  16 +-
 target/arm/kvm.c               |   2 +-
 7 files changed, 169 insertions(+), 125 deletions(-)

-- 
2.47.1


