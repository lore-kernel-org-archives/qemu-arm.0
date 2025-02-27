Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp140521njb;
        Thu, 27 Feb 2025 03:04:21 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUdOK6jO1btyoabBiQvOf18PfAFjmpMuJvNgBJ9RfkE22GMzbudVjkN/I09Ijh6KXGHJCkuPmSZTUaz4g==@linaro.org
X-Google-Smtp-Source: AGHT+IHXjUtxLtC4VZdtila3DtyY7D/ZEpizgDAs8rqDN4AIjA1fVF3RcNenQyHTC9BgiWyDsT04
X-Received: by 2002:a05:6214:1c8b:b0:6e6:5d61:4f01 with SMTP id 6a1803df08f44-6e88686f5e6mr104794356d6.8.1740654261698;
        Thu, 27 Feb 2025 03:04:21 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740654261; cv=pass;
        d=google.com; s=arc-20240605;
        b=Nx35TmSMc8AnUkTKUuphmv219lH2BNkhf6kpkAZImzdIXXTxymJZVgv/UTBPPReU/G
         PiB3Cv+XY/k/pMAqDaLSxXJ+mc3IcGJpb0++T9a8Vyl1xw+fk1xuCcUvAphQQtXcNDOq
         M+7xcUqdBzmwMlof/fCJ64FUbTm0ZFQStcpqmWUEpxl9eaYhQxpS2A9VSWMjvE2cjUrE
         aI0qDAU+T0tmCqJP3wFPdFc4qWZOae+uu5MfkIQd7Gzwguh/SXsmdqnDRQl8qdZvXUAE
         HmjRUJbTI9E8+4Wtpieqe8lXsi7tPC1Gz/nkQY3W1nkv+ZLoxhG5Y9qnWBzMZBL6/rz0
         y3wA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=iCqTKGNwRTNoiw+fzL937mCV95SJHygQHeQfbhPDKPw=;
        fh=vRlcgZ7942FHQd1Q9f6uT6HY2D7AnE0jt7dFCXEYTHw=;
        b=GEA+VGXlVj3yLbPG30WUAF0tac4NndiLh23YIAwRav2jEXpEtXfn5iK59AetTHAY1U
         O7hUV9gUr3stjyl7VizafHx1A4XnC0NJn/LjhbWbTyzlpb1hxXwIYBlWywrVMiRVCssH
         aSakBa5uJI6TfcwUy9zfNOvM3pbWu5x+yKgVPYntD6XMSQo5RWg1IrtZQK3MQeDFo3DZ
         yk0VXlNkBj1Wf2MCvpESC5GAIDSWkGzHM1vMJVC6q6YeMwABQuuYlQyju3iFkHtAwj3/
         IB3LF2Ljca3APSjpKC2X5dzacOGy0PT2OrAqIidKys1OUqWNiPGYP71kdWL1OSWr5Ayl
         6+yg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=dPkMgDOw;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-536067-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-536067-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-536067-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8975e792dsi11157676d6.75.2025.02.27.03.04.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 03:04:21 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-536067-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=dPkMgDOw;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-536067-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-536067-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF38916B01C
	for <alex.bennee@linaro.org>; Thu, 27 Feb 2025 11:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B9F22B597;
	Thu, 27 Feb 2025 11:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dPkMgDOw"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7966122AE49
	for <linux-kernel@vger.kernel.org>; Thu, 27 Feb 2025 11:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740654238; cv=none; b=g9Oh4+5Xiy2bC8hHiFxQmalncLz8OSvUo+cdwlR273hgyyeJ5gtDy44hmktctR4/mxxN+81pTTpWPApdTVwLpLoZ98UmL4fvlYZaRU+lNEhFdOtjIReV3Ss46R+UvlGLGD6m9jutmgsI9C0yay+SZP29OKQt7mJWK1s/C2MBdsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740654238; c=relaxed/simple;
	bh=gFsu0KV9QuSPVXuISXEtByquD4FCrL2R+VMNFdYByDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QwHUefbMHW5kxuWCke328p0aVH3FHgn6qzIKLV8EXxy+guADv96DPBeahyv7Ll4YXy2QepHqxMg5AobnUvnjgyt/DybHfWquYDTWJf+/gpK3Apt2xDVAip2RNOD+e8SR3Lah+YO3ITtfVymss3U1MWujxpKNAO8TqSXz7v5+ol0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dPkMgDOw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A00C4CEE9;
	Thu, 27 Feb 2025 11:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740654238;
	bh=gFsu0KV9QuSPVXuISXEtByquD4FCrL2R+VMNFdYByDM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dPkMgDOw+uI3+ohzWB7EnwqZNduBZh9AYCEYe1Sq8y1bWv4/fTseshijRu3SEr2kD
	 jsPOd7ORbG6QmaYLEuU29bqPffJcZER5pni8Gq6QDUWwTzKdMIm6w/E5ODvA8FE9vV
	 j3R5AURzstr9PfVS64LeihabY1LPVJadsiWD6NDNaccB5BCN93v0RDxGcPx/AuvSjQ
	 4c46HpHpIpMb4qpUpngNfhUZvLGbAFZndmEttB7S3Ne//9Rx32aPtgLLGP000WyqaI
	 3TfzGeJbDxGktFpwbRt7RSTBp+Co+46zeNRhj/5MDWR1bvv8UT0QWw7Quw+z82maSB
	 aIY8/MyNMQPYQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tnbgK-00000001mQi-0LWE;
	Thu, 27 Feb 2025 12:03:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 03/21] tests/acpi: virt: update HEST file with its current data
Date: Thu, 27 Feb 2025 12:03:33 +0100
Message-ID: <5bb163b260d6a29b082d12cbae31035fa68342df.1740653898.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740653898.git.mchehab+huawei@kernel.org>
References: <cover.1740653898.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: PEGObApGORFL

Now that HEST table is checked for aarch64, add the current
firmware file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tests/data/acpi/aarch64/virt/HEST           | Bin 0 -> 132 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 2 files changed, 1 deletion(-)

diff --git a/tests/data/acpi/aarch64/virt/HEST b/tests/data/acpi/aarch64/virt/HEST
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..4c5d8c5b5da5b3241f93cd0839e94272bf6b1486 100644
GIT binary patch
literal 132
zcmeZp4Gw8xU|?W;<mB({5v<@85#X$#prF9Wz`y`vgJ=-uVqjqS|DS;o#%Ew*U|?_n
dk++-~7#J8hWI!Yi09DHYRr~Kh1c1x}0RY>66afGL

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 39901c58d647..dfb8523c8bf4 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/aarch64/virt/HEST",
-- 
2.48.1

