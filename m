Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp2404880njm;
        Fri, 7 Mar 2025 11:15:11 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUq/M+0KSmqZWCl+FwHgw0nRcakWvWrqpqaBp8j9qzkQhLThSLzRnTukDg2NqCfIhFMtqdxCBPhk4S1Ig==@linaro.org
X-Google-Smtp-Source: AGHT+IFiUBPln+6eoECt+FN5OLZTBRqLptMnbtijTyjTR2VrnutQqVHkVNIZStHGFGy95kSUv0CC
X-Received: by 2002:a05:6402:d09:b0:5e4:bea3:a74d with SMTP id 4fb4d7f45d1cf-5e5e24d5d1bmr4760495a12.30.1741374909239;
        Fri, 07 Mar 2025 11:15:09 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1741374909; cv=pass;
        d=google.com; s=arc-20240605;
        b=TjmsfZfJUinN2Mdctauu2B3LM2lktrJQGBwcAc2TICfEAENn6/xkTsCMrcKWZ3cCoi
         bJkxJoIokSefLymMvIGYpbEn4JBA1gApu4XUCb/XU48kFzeVjzvTHjqChdLVSMT43H5Z
         w2FwRFTRmzVxfDbvpWyyYtw1aveFDOnoyqozIJ5Moxzts0yhsAfLMZ21dMuf9voNKsO1
         M/z1E1FpvscYDKnrN1DO4DkRppl07rmA+GdBkjxBFOFwws1prVBBuaO/2d0WF+ohE9R7
         RlAVlPGeiCd4a06pXNr7BhoCrF3VNXvTdfT1x/LHavx8Sc9XVWeCgiYYIkM+dJ6WpQ8M
         A0zA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=v1MpxZ/4CxzVpC4764im72egPzCUGqm2zalRNoealyg=;
        fh=G/iztjpJmuf62QnY8qQLa8MWWC5y4XWz0BPBBAr0A/k=;
        b=IhCGh5e3GA4bkLHc5zP1RTmbalOmMpeaq6LGqKZhgxNjvGYr8rktp7QTonmUMk581/
         spOW3+2GKGkASEXDojl3yFv9i1NSXJY0LWgZHxTLzpugxOvQaxOBi0AeQgMb53rWAXSC
         Z+hY9dVp5IgK5mpy+kNoLfI5tFEO4c3uh3NmY8okToaPa1jy5ZqgZXBvU0zzu7byt5to
         LQmfQo/NeyT01qY5NcRKfHDuO47apK5iqt9FCQEb/w2SvdzqFxgQuvnfqAFgoJUps8x9
         OeSb/l0M/E83G/e5Huxg1OOzx4KgEw4Rxo+oC2/tlp6qnxuY2G7xj8JBYD2RIZYdKSku
         1bkA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=pp5argeY;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-551804-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-551804-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-551804-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5e5c766041fsi3864773a12.374.2025.03.07.11.15.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 11:15:09 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-551804-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=pp5argeY;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-551804-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-551804-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A031C189846F
	for <alex.bennee@linaro.org>; Fri,  7 Mar 2025 19:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA572512C9;
	Fri,  7 Mar 2025 19:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pp5argeY"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B72215F49
	for <linux-kernel@vger.kernel.org>; Fri,  7 Mar 2025 19:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741374898; cv=none; b=LrCgkqCh6nvwrw8vcQjyFyRP3RvEWCLr7uWELCS+ywTOdiYpguNxmSY2Zycms7d7vGCyIqsrGynyz/PBui5R1cmqJgt9DL1rxm76b/U683donoqCEJXCPoYN4tP4wKbXPdRoh5V46ep2aT9MTY18/L2AVeDI//cBdkJm9+Sl+Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741374898; c=relaxed/simple;
	bh=PiuWIkSjCkUR5cKMYl3R483tUjOwqr3t/DK02cU26Gg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iseIDeEVFleQ3OiaYmmUHyhQjev1qNOdmf08+alHTkgkhfPOvKrJmO1WZqua/ZQHgJsQ0jwRO052jk2LOEZoUT8xjFkC7NdrheoB1qYOnTU98jrnexJRuu/s7qO12LGYI6p+y4F/mfIBWbCka4W9YRekjM1acqCyNos+JpiSqZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pp5argeY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F14C4CEE7;
	Fri,  7 Mar 2025 19:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741374897;
	bh=PiuWIkSjCkUR5cKMYl3R483tUjOwqr3t/DK02cU26Gg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pp5argeY6gJF6uC3gVRWpspPSQaqNvcL8jvFPV/zQD23sAZV+d66FbRbGbTcffRff
	 r8OgzEF3UP8VvOkOBzHTq14j8VTuqRvVE3zJ3wuluYHHx7VKJ/Ww0XvEABMCezAsRF
	 CGteiz+/7Ky/e410qWVcoWMug+FZiymTVpCrQJiSADA1BaR5R5TYbvxZEU1psyGJ2m
	 Gv0I+jl9GgKKoK3Wggru5ubWei6mouZwD6wRUiQnNxAYRiuAGpApsxsJaSksMNmSYD
	 TmZvGxhxMWtOGWRgtAIB0yjm9SLbqlUSXyJ1VobE5W3WUb5M4Yt9XuvOVYNKRvA1b8
	 ERxH807d/Qfkg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tqd9r-0000000BQmE-2jsu;
	Fri, 07 Mar 2025 20:14:55 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Gavin Shan" <gshan@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Ani Sinha <anisinha@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 01/20] tests/acpi: virt: add an empty HEST file
Date: Fri,  7 Mar 2025 20:14:30 +0100
Message-ID: <7b2e37814081c237c5cd3fca55ce08d57049aa9c.1741374594.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1741374594.git.mchehab+huawei@kernel.org>
References: <cover.1741374594.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: OMIoFokw7ceU

Such file will be used to track HEST table changes.

For now, disallow HEST table check until we update it to the
current data.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 tests/data/acpi/aarch64/virt/HEST           | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 2 files changed, 1 insertion(+)
 create mode 100644 tests/data/acpi/aarch64/virt/HEST

diff --git a/tests/data/acpi/aarch64/virt/HEST b/tests/data/acpi/aarch64/virt/HEST
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf4..39901c58d647 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/HEST",
-- 
2.48.1

