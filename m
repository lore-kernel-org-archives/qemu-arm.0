Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp94215njb;
        Tue, 24 Sep 2024 21:05:04 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXcNcinZwkhLUUK8oZtRH3L4dXynNOiWkm2OsAxyVeVn0Nio5/5jpIQvVkXrwQS9iYplPyCs80OpZVacQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEXu4lZQJF3UBr466ToS9kfMVU3gu6V5IjcZMlMFa0okoBF0QEmthSTkyDPlYJHLYjiwRR4
X-Received: by 2002:a17:907:7f18:b0:a86:b923:4a04 with SMTP id a640c23a62f3a-a93a05e6e15mr107876966b.50.1727237103964;
        Tue, 24 Sep 2024 21:05:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727237103; cv=pass;
        d=google.com; s=arc-20240605;
        b=O4gKeE75FSoP7eO2lpJa10c/LeZRnvLS2xdMssswO8akfvfnj70vHbpR/Dq+uyD4lQ
         gBSGTGDkfW+puEkeuZapuCXPUnR25BaR6y+BNsrRJquW0MvQZwApV2h/h6EBtnHl195O
         upE+3udLpk7/W2451GbcWcHnbvvN6vo/0eKx1tQQSP3gEL+Uzj0yIdPiYCmEpgcrbpTu
         f48vOR7a3DclhdWkUc/GLGoLMFjXCnHEcrfEcR15ZgFWtEesm3TMrgftsfY35kBnqEB0
         MyLAQCiRkt/+xvMuZeKNGf1OSEyDPcRKsckYg580ON2QZV0oTKXZ9FeUCdLh957KyJHg
         zjdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2oNFefJtIAI+Wpbu2dxKg0zWE2mYjq+vavy6wxRF5vQ=;
        fh=Zqcd4fjbro/wvimr7Su6mUkGIUXQgufLFExcKcl20TQ=;
        b=AyBXoDf/vj009DBqjFbB8cYnXJzZ61LUaK9i19js7Dh3ZdrlS3XDdM4YX51IKBKnSJ
         qHR12GpIq/jK0kHNJ52wFuHmuNJLogRSM45bQJmnjJc7iPg7Y6TJO5k49fN/YpAur9id
         vlNczQ+kgYROco0154PL8H5YJNGevuxa/mEAkmpbeHYI+dMeluPSR+jk1713lkpUVBEw
         vrSVhgKWeJZnmjELoXQ7IOKi8DQklxUGHsQcbTQorRXb+zrDNtrLURnEdBfvkic+n1SS
         TpALiY/nCkMBBfXof6YkVs9qrB77BnIsNWaXmnkIaxphytf1SOtDSehaP6Qwwhe8/bA9
         ANwg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=AXyH372H;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-27403-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-27403-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <kvm+bounces-27403-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-a93930bc93csi188739366b.458.2024.09.24.21.05.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 21:05:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-27403-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=AXyH372H;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-27403-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-27403-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A9BE1F23DAF
	for <alex.bennee@linaro.org>; Wed, 25 Sep 2024 04:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D459514EC71;
	Wed, 25 Sep 2024 04:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AXyH372H"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E68314D29B
	for <kvm@vger.kernel.org>; Wed, 25 Sep 2024 04:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727237088; cv=none; b=pyAyf3/nvo6zjz5PcgjzrpAleLC6BRm0Rmc6lXIrE5jVjs+I31aajJYbdi8wypWDjFJq7/I1kf/RjphQSH98pC7ew5CVVuzqDrE33AkN18iSi/ljXxE0+n3QBeId7XaDBSy4szhs7oICnsc/nXXc14Ksh/LF3L6MCvfoY2Yciqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727237088; c=relaxed/simple;
	bh=4omANBFai2DET+2RuHd26H/DXlWLFuz7XxNzGw4IuYU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EGAYHYQuS7Q7+W1TMM5u3cwbdZt3CBfFVe9959j4NYuy9Fe5lQ4XXrKnq9f5YrnIcb+gQQ9e615no3wgzem/ZMligWUiGVv0avopZbUQN3rZz1xidtp/j6C47mOT6J339D1z+7dD1Jv9drGVzsIDtOZltsHOvHKKjn+zamfMAbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AXyH372H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C716C4CED0;
	Wed, 25 Sep 2024 04:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727237088;
	bh=4omANBFai2DET+2RuHd26H/DXlWLFuz7XxNzGw4IuYU=;
	h=From:To:Cc:Subject:Date:From;
	b=AXyH372H1EQXFhWVe0BLf5P8wyrOFMnnJW9SV5rEn4rMBUnvEw5/icF88hNnKZBdf
	 C00YUH8M4JdoOa9dtEJXXEoOPh5BPbSEMimVTAez20vkR4EyRj3STkTdOXWrSw21Sv
	 qReOQ5a73c4VBp88cCvAtsrDiLokc/WEbInZmSOvCr2pTYUQa7Pn0RIU3nVNdQbvfx
	 6Fey3XYSrPo70/zIpgPSssEDP74DJSjucPcpOyq2HoD0TyMlU8NBOhgwgaj+hHojsk
	 wTnoVeqGnVEDIXtRIO7sJXbALBQN+7fBy/3elSLPHwqNM4YedWH3GJVmHeulwx9dsQ
	 a5OMwZGGe5/qw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1stJGg-0000000827e-0DCu;
	Wed, 25 Sep 2024 06:04:46 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/15] Prepare GHES driver to support error injection
Date: Wed, 25 Sep 2024 06:04:05 +0200
Message-ID: <cover.1727236561.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: 8ZKLaptPO+/1

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

Mauro Carvalho Chehab (15):
  acpi/ghes: get rid of ACPI_HEST_SRC_ID_RESERVED
  acpi/ghes: simplify acpi_ghes_record_errors() code
  acpi/ghes: simplify the per-arch caller to build HEST table
  acpi/ghes: better handle source_id and notification
  acpi/ghes: Fix acpi_ghes_record_errors() argument
  acpi/ghes: Remove a duplicated out of bounds check
  acpi/ghes: Change the type for source_id
  acpi/ghes: Prepare to support multiple sources on ghes
  acpi/ghes: make the GHES record generation more generic
  acpi/ghes: move offset calculus to a separate function
  acpi/ghes: better name GHES memory error function
  acpi/ghes: don't crash QEMU if ghes GED is not found
  acpi/ghes: rename etc/hardware_error file macros
  better name the offset of the hardware error firmware
  docs: acpi_hest_ghes: fix documentation for CPER size

 docs/specs/acpi_hest_ghes.rst  |   6 +-
 hw/acpi/generic_event_device.c |   4 +-
 hw/acpi/ghes-stub.c            |   2 +-
 hw/acpi/ghes.c                 | 279 ++++++++++++++++++++-------------
 hw/arm/virt-acpi-build.c       |  10 +-
 include/hw/acpi/ghes.h         |  34 ++--
 target/arm/kvm.c               |   3 +-
 7 files changed, 206 insertions(+), 132 deletions(-)

-- 
2.46.1


