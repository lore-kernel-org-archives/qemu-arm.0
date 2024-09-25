Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp94178njb;
        Tue, 24 Sep 2024 21:04:58 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUul6UJG1djcCV2CO8z+Kamj+Fg4GTui1wiI6zdK/27JTGfitRhW+ivfvs3x57FQIl3kKQfmVlmbXj8mA==@linaro.org
X-Google-Smtp-Source: AGHT+IHMQpd5gnSliEsYAS0A/OqbHScjEM8ILjf67vyXn3RSFg7vT2g+3ddPuzaG2RkjZbQHqpS3
X-Received: by 2002:a05:6902:2689:b0:e1d:a3bb:d5f9 with SMTP id 3f1490d57ef6-e24d7919ca1mr1271018276.7.1727237097862;
        Tue, 24 Sep 2024 21:04:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727237097; cv=pass;
        d=google.com; s=arc-20240605;
        b=jNatDw1pAHb38YPJYaOkCSO4vGWdV0UWojpHsEygtPwPMEWpXHGNL12y0BsJ9ic9Ux
         rcLLhAg7IlzLnbRWH+xJyqYwmeiA9umw/otdmfOfllR8vaj5OlmUsE93mMb6WNNYRapi
         opovIorHIq/u7QSwHYngbZ87kQJ0mUIOBQm6HhKXNOaE7TDkITaKtj9cgZAM5vlJGD+y
         /PI4SeAeRqs4Gx2Dgb8RmNFvAq0Si5uj5omJNfBV30CD2Op/OE2Z2O8lJyAD8PNbc94E
         154JTI7G3dVRl/KgC3eysTd6+maQwmPPwfhDwZW3XQfBsKouy/BdJAxoPdnLfqfO+Lkg
         hyrA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=WFWW71LIVkP3HOgf3iL/IMd4aYLRITUK7ef3JQavFtU=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=UEH8yAzAxHoGOCEoV3XSj84NwPV6inqS1SgXtWCMJOP04ZEJpjCK7R8pfMPu3e/bPM
         DoAtMWhd4LNKkPXBh9XsDvuSTAWbqXEO3C7O9m/fZXMwuL+hbNHqLWMCUIzuAKFLnVCF
         rHr3Fk3oTcFnf2Crf4ywIHxh68+EkaCWKoqvbG/oJBeF6a5QWvPwEMuUsKJfWmBcz08z
         t70nu1paYwCsR1Dwd25AxUDkfJbWFx7uyzgH/Hn+VhCGqswrTZCS5/AZsrTzxT4ho5ne
         lLLW0xwpjlnhdod1z17bXC8loQ5lp//4bWbH7Wgjjp2uOesqC3YOHN+z4di/G/g6qKpJ
         np+A==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=p1+cvVm2;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-337975-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-337975-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-337975-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id d75a77b69052e-45b5256c6e4si29042031cf.154.2024.09.24.21.04.57
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 21:04:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-337975-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=p1+cvVm2;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-337975-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-337975-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DA6C1C22C19
	for <alex.bennee@linaro.org>; Wed, 25 Sep 2024 04:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B2E14D2A2;
	Wed, 25 Sep 2024 04:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p1+cvVm2"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4E614B950
	for <linux-kernel@vger.kernel.org>; Wed, 25 Sep 2024 04:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727237088; cv=none; b=fAX9C0fYrtjWksRNIBhahA3oaEu6bEtaR2yG01pwxX4jHzxcYu5mI+FFvGKlOhyNgFQPTp4UcGwnY9EdZ108VwJhyxEwg9Y1v3/8Qvqe1+ThwIQIKMgK73lnhqnRh6SQS9UdQABU3ucyTFW57CEEpnTKNSySLVGcmIT0RhRMiig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727237088; c=relaxed/simple;
	bh=8SPGtmIk/Wiv1BG4hlHht3DlqkOVUBdSPbbEYZCXUmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cqU7mk1YXtnpgSBsHOUUyvLj4nBHt53sFcvV8NfZvgXUshpTUnTYx9SgU1ZzLKgd+snZuNx60yjDNfUPWB0trF6fB52K/QztYAEBpkanUOJhQvCOV5IizXEYq3D/hU6L35O2KgDme8asJogV4rKnX1YDPBEj02l5UbuFvzdO8gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p1+cvVm2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09544C4AF0B;
	Wed, 25 Sep 2024 04:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727237088;
	bh=8SPGtmIk/Wiv1BG4hlHht3DlqkOVUBdSPbbEYZCXUmo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p1+cvVm2GHorVtqr04U8x2CYuw225+q17Jf7hT5fnlwDXrS+VDldRYEIVirOelyKS
	 qbIYl2x7zogGlAmw+C7hHiw7rNiG3wB7Tknz3nYK3uwggh7J1E05/Ua2iPCZ/OCJBJ
	 LNbqRMXNL3F+5KYiwLA607Dp3PfMxwA2akgmdr5m4zQMF6FOkp03KKM39Galv95qEt
	 hEhMUTlJ+33Rm4wu+03RcdkJnDsrzTnDD+di/wX+a3u+B8pM7azLTu1iNiMFR9CB+K
	 vtSL79ioEU/AUIpp51lHh7hQuuwiKdM9RxA+2sErxHSlaDitx2EGgbn/qoKoP6b1Gz
	 z9x1NEsU8kjgA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1stJGg-00000008281-0sVD;
	Wed, 25 Sep 2024 06:04:46 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 06/15] acpi/ghes: Remove a duplicated out of bounds check
Date: Wed, 25 Sep 2024 06:04:11 +0200
Message-ID: <271a2d24854e1d63c0913e5d68ac565dc0b8dd42.1727236561.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727236561.git.mchehab+huawei@kernel.org>
References: <cover.1727236561.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: c416HJnxXwOV

acpi_ghes_record_errors() has an assert() at the beginning
to ensure that source_id will be lower than
ACPI_GHES_ERROR_SOURCE_COUNT. Remove a duplicated check.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/ghes.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 7460cd1a8d56..b932b6fe2c2e 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -404,9 +404,7 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
         return -1;
     }
 
-    if (source_id < ACPI_GHES_ERROR_SOURCE_COUNT) {
-        start_addr += source_id * sizeof(uint64_t);
-    }
+    start_addr += source_id * sizeof(uint64_t);
 
     cpu_physical_memory_read(start_addr, &error_block_addr,
                                 sizeof(error_block_addr));
-- 
2.46.1

