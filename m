Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp304086njc;
        Mon, 19 May 2025 23:42:17 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCV7pdZ7im3Fwx2BLy2C8KITXupW2pNr1m2IMJ9NLrO/DMtaXFD/DKJN+Nb3jX564ZdWjRADrS6hT0wyjw==@linaro.org
X-Google-Smtp-Source: AGHT+IHJTHJ7T3XnWudk5ZTCh4Vh0NVvXIUZcQwRjx+kcSX8ijXuabWn02CakRNvm8N02BFHLm5X
X-Received: by 2002:a05:6a21:e89:b0:215:d4be:b0b2 with SMTP id adf61e73a8af0-21621a02357mr26345344637.34.1747723337530;
        Mon, 19 May 2025 23:42:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1747723337; cv=pass;
        d=google.com; s=arc-20240605;
        b=CEyq8aqLxkZHCmHY02ZvKZgfNTaXqIUG1DF8dJ6np3FNWiLRt3vmiwmXeHTuq46gaL
         WvizJwiAO+bLwwHbl14oAszbpcy8p1T0cpy1XyavUGAqzfauKGC6tItYECDpdW8YcYL6
         XViWe+P5Su6ysU7qO+AMeD0IEAcRHgZ6sbMqWe/h+aO4JzxslNU/uMQzpWi6mB8XkzOy
         gnTpIq8mSgFWDg2YBQlElim83HmYdHWnCVpYQG7t+WwTb22M2zJYObZm0Ki0bvTZ2aZn
         hPBfgI7gactExBRcjx9ySG1v9prN0MptW/XvSXWt6TUYvo6DMLZR403p53MhQRfxWMIk
         iPmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=+RQBf/ybHaTwn/s6B9TolHsBMtoW2ZGS+Nytovzrdv8=;
        fh=vRlcgZ7942FHQd1Q9f6uT6HY2D7AnE0jt7dFCXEYTHw=;
        b=TEowtKQ090g6h0UnXBSpaMlC3m0fOx2hKPNblzYP2hZdhZDYvF8q2c9Hp0n/lIQRrw
         1ucnCKlMmrdurvpFa2E+tPf5p7PhbxkSd8QCyK6zHAbDaHo73WCWCJV0gGNXNCYamlR1
         Guw7YYEEXb/5UmUew/Yg3/sxQzsP4ex0JjwjVvlcqFmrLSXaSu4RhufbMVYrcO+jaO9b
         zmd9fMMUp2/v8vfmf+xHIVyNFw2MQE0F5XP8mLDsKyVikzPDqhhDAFTRXL2UswVI/b+j
         5+IqlmCMt8kPy6MS6fJDqSYrb1+yGGoNS25zeeArhRuZSo/QsURoxZ4PEGpTqxS3LXPh
         SCGg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=uvpQZvo9;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-655008-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-655008-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-655008-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id d2e1a72fcca58-742a97cd646si11717742b3a.169.2025.05.19.23.42.17
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 23:42:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-655008-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=uvpQZvo9;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-655008-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-655008-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1FFE7A5B65
	for <alex.bennee@linaro.org>; Tue, 20 May 2025 06:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE5F25D1F7;
	Tue, 20 May 2025 06:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uvpQZvo9"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7C925CC69
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747723316; cv=none; b=a3u5wJmOUK+BihH8cYkLMCK9Gz0vdIcgozoo1I38sIcXbzSGb3fg0jVYZcmp2nGGbkXc0auBdMnFb+6WFbCNxlqFM1krVACm7QlGxaxNb7/hHQ5XGA6NYYuUVJO4dMkh+8bZAhJPgSrybV4OAJuV6FpKZ1CVgNJ6XOZayqoFIDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747723316; c=relaxed/simple;
	bh=5800+9pcKbpwq9CBW/e+YLPVT84qYs9jAiAX5nQsi/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p9YEkMwAm0ZV7d7Bv4uhiQp3nKF/mMBp++pncC1hLgioaxb/fAGGPt7FqjDZoyZF+fb1PuD0r+ESUAStt2o8Cx3L3WWfoq+3OMp+gdre1Y76JE+AJvOMi6dVkVPUIUi1moOfuQ6gr2O+MaOfVaML8W5bYMLxZZb9QBAgY/7R5iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uvpQZvo9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B8AC4CEEF;
	Tue, 20 May 2025 06:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747723315;
	bh=5800+9pcKbpwq9CBW/e+YLPVT84qYs9jAiAX5nQsi/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uvpQZvo9EPb1u7NTzIgzcgU6azMIAEeH0HkmaMSL4vjhWM5Gl07e/SkXyjP42xcNE
	 55IMlT9HHJe75l7jSL+BA5mdZ6wyopH4uvgu0Wb2EDcAwWC0s/Xioqoeg+70052Xmw
	 Rv16B8nDEo16mOYBFPCM5r+BT2U3//9M3L3g2jB2r5bOYg0AaiKYPettWgyOM89MqH
	 djRlvN390SUwMUMBllh6fWE9fmQoKogmKi/DmFu4tOly9bPZNTXMcl+OXSuITy0KbK
	 sf30Cvxy+vc3yEGJgNVqwOD1YKk4RYPAeyikKPd/OzBpGWSdd+CPz0xS5j+gGtpqUu
	 fp8jz1LwCXAwA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uHGfi-00000005qts-084I;
	Tue, 20 May 2025 08:41:54 +0200
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
Subject: [PATCH v9 14/20] tests/acpi: virt: allow acpi table changes at DSDT and HEST tables
Date: Tue, 20 May 2025 08:41:33 +0200
Message-ID: <0c9eb582c0b0a9c8f74e901384416ab39d01a3d3.1747722973.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747722973.git.mchehab+huawei@kernel.org>
References: <cover.1747722973.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: vDRi6yNttdL9

We'll be adding a new GED device for HEST GPIO notification and
increasing the number of entries at the HEST table.

Blocklist testing HEST and DSDT tables until such changes
are completed.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf4..0a1a26543ba2 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,7 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/HEST",
+"tests/data/acpi/aarch64/virt/DSDT",
+"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
+"tests/data/acpi/aarch64/virt/DSDT.memhp",
+"tests/data/acpi/aarch64/virt/DSDT.pxb",
+"tests/data/acpi/aarch64/virt/DSDT.topology",
-- 
2.49.0

