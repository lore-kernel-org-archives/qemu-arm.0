Received: by 2002:a05:7022:698c:b0:8b:e46e:3391 with SMTP id cj12csp64625dlb;
        Tue, 1 Oct 2024 00:04:16 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVfGzxabm/ikM6ghk6pe5A/MYk79YGphUHWdXxcpVSYTxtNpsTD9MQR6bMagkjp3+6tA64PTSbxZkrBYg==@linaro.org
X-Google-Smtp-Source: AGHT+IF3YBt+vBtLjxOdbbZ3Ue5KzLYS/5FpJWiQPl29WiiJr5iX3teU1L2xkiZc9g70g0y5+BYr
X-Received: by 2002:a05:6a20:6f04:b0:1d2:d001:5677 with SMTP id adf61e73a8af0-1d4fa694cf4mr23225561637.17.1727766256697;
        Tue, 01 Oct 2024 00:04:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727766256; cv=pass;
        d=google.com; s=arc-20240605;
        b=DMm4Yg3LZtxhDLyfd8wie9W2Sipu7n5PSC/b4KjFlo9+C3/PCTc+i5aa2/kQDEClGe
         5MYuF6kYIZjU3/R0taBzxCAqcs/x9UlHWSX+ylgkrO+t0qpZ9uO7uvIOSxd4QTLMPRWm
         IOwiL8UxQyRYbJb8o2rIvcKdImyLZS9PfurbcrDOO5g6O6+NfzaCTXErw3hPojBi7B1O
         ZUoUhgpZfe+a+gEazBUncb0B7t3z8JQSYMGcuHTuA/bain2k1DiK56hG8n1JzweA/VZ8
         H/R3Dy7iyTzUP55wnQN0NMGLX7CLTDuJmOw9Xasb1E8AaW085accqd/wgnL6dWAangGE
         1PoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zzNIDGhUPFoikwoITWv26Qw9469aEnueHU71tq4HoPA=;
        fh=zdFI+LA2CQ8nX1WmejGImVVlAbrAEbmnN8qzTIIu/W4=;
        b=QjbEorPDaJdSSoaB+WqCE+DQYf7eb2xELgZrJQtKSNxQ3IYBJl4EhwBKNTvAGizCJS
         LlGL6HyZ/pVd5eGY8+rgQWMENIQGRZwsnLLDW30OogFoOc6QTvoMSh4VhzVK/m+h26SW
         N1zCrYlePeJp6ZBz5MopkNnU2/Ta6QJ+A8GTnO+JUx4IxZCm1FavaIeG5uRYIEp7Tby9
         m5AxHNqY8YnN2KidhCCGM+Syc39uUNzLqdD44x9qXUNAAdhRJBIIXT3W+qm8qPErj80h
         gcSjHz6HZBlnxL2LF1cshAKlbouephuRqUHSNCaZ48k5Q4jxq+xzRA3z8ZGmH2/bGO0n
         uZlg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=U48KyXAp;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345349-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345349-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-345349-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7e6db6c4fdbsi10126282a12.485.2024.10.01.00.04.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 00:04:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-345349-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=U48KyXAp;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345349-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345349-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43DB828202C
	for <alex.bennee@linaro.org>; Tue,  1 Oct 2024 07:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82338194AD6;
	Tue,  1 Oct 2024 07:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U48KyXAp"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FD51BC9EC;
	Tue,  1 Oct 2024 07:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727766251; cv=none; b=kHrjGlseE61eTumwkxFJE/v1F3VHVLWU3J0X1oA1jgwqF3JBBJz3N9okSsWM77PrZsifLqEFq5bB586ODcIansn9+VDrwkb1F+NqbeCUNRMxikxF/EAXP/MAR5x4hUgfqFaOWeCpapbSrhA318MzqNN/QNqvOytVaIFlurysVos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727766251; c=relaxed/simple;
	bh=YxTGQndDRXUrIv1rcoZzDFrSZkpN1CHT/gS1t6B9Ipo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vh72BhbmxdBqiqyUpAUhg2OJWYccs7pnezxLkeOePeUo8q8HpT2FL85kQlTpOF/dx3HImpqEGvCDcqewle1yuzhXWJ+1NIFiwJLajRvEhitNcsRLMLZwYoRTeWfrzLY4484lPKHv1N53qGIf6f4i/hue9uAgEctZujtqz/rFQ7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U48KyXAp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F49AC4CED2;
	Tue,  1 Oct 2024 07:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727766251;
	bh=YxTGQndDRXUrIv1rcoZzDFrSZkpN1CHT/gS1t6B9Ipo=;
	h=From:To:Cc:Subject:Date:From;
	b=U48KyXApci3UtxQWQZGJOivaoaBm54OMwNhLIDUKNMLk/lKydMXiobmwy5JQap02V
	 ycIF3JFoJWdIMs/UAvzUC3/ph6sbhe+8p9rONZY8gMkG5DaG6tCMFpQh+YRcE7TrE3
	 o2L/4EL8amY1ChcXXLqz796i7CFCMGM34YgBOWVx5K+r0l42fRA+2OayziUVTvJAur
	 WG4RpsH+W6KDcvbDE3UWuyXneac9Sa2ZoAHqJDlHanFq5uo1JxlRYY4tF6WRsj5t90
	 DsbjQketoBNk9Ar24iXB5vVQSgrEKe9hgWNIWvnXkFPCTKafUu6+l69lJCe1TiOWuN
	 0QE6YNbFDuxzA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab@kernel.org>)
	id 1svWvY-00000001V0L-18y3;
	Tue, 01 Oct 2024 09:04:08 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
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
Subject: [PATCH v2 00/15] Prepare GHES driver to support error injection
Date: Tue,  1 Oct 2024 09:03:37 +0200
Message-ID: <cover.1727766088.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
X-TUID: gp5kxj/QbS/M

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
  acpi/ghes: Prepare to support multiple sources on ghes
  acpi/ghes: make the GHES record generation more generic
  acpi/ghes: move offset calculus to a separate function
  acpi/ghes: better name GHES memory error function
  acpi/ghes: don't crash QEMU if ghes GED is not found
  acpi/ghes: rename etc/hardware_error file macros
  acpi/ghes: better name the offset of the hardware error firmware
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
2.46.0


