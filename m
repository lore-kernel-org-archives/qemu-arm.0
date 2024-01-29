Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp296509ejk;
        Mon, 29 Jan 2024 08:45:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGT95WZuir8UzjWdOkrpufjpF83gwqRSuppvxN0g1EW2D3xmLFrATT1sahlnpjVBhYNyZuM
X-Received: by 2002:a05:6512:110c:b0:511:fd2:b2fc with SMTP id l12-20020a056512110c00b005110fd2b2fcmr2353549lfg.1.1706546746672;
        Mon, 29 Jan 2024 08:45:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706546746; cv=pass;
        d=google.com; s=arc-20160816;
        b=ws3zqt3i+1kaljqejb8ErU52gCW1DI/eD+I96ByaDIFWbGQUKjWP4Y4QJVferTQv38
         WH3Kl8KNQ/1n8qVgC+njWNQ2n2pUI4VcC6TXpQAG5LURmvRUrpBruMnhFLsIyy1+QKA2
         WcGq47Z+Iq9FX63VYihHqRsYMGpA5aosAWAadSkhS4FMVnFiUOJLZdi0dr+zxCzYb3gF
         6fg3o/uIXXHLSXDxEPc4tDrojDxg8hneBgUrfLQLdC1i+cQxDuPWRWIVd3Oc0ubJDHdn
         Zg14qeLRgEdVT8nqDa5O/CB+mBK7/rk4BKD5hhheuPQTiXNhetSbqa40dC7Cv4jqhtM0
         qMUA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=DX37RoqmIV4LbscHP0LblED21zanCtHAqywHz6ZSi8I=;
        fh=7hIRZt5w8KYtPKlA+ieBA5IffPWaoEpFy4DxkqPnuoo=;
        b=d4e/8uUbLi+z7JL7ge9aLzo2Yb8qGzTeQMQSF/MhivC5oobmeOqg5+tfg5gDhxDrig
         /VdXjyFYe6zJOAtaP19sWxFvy6zaM+02nhMHJQPio4vb8g+t0udEknAofsYmkwPUCK6c
         TX166uEDB4cyQde7BvoNqm6igzhQmsAkt3A4pUJg0O+i8MyzegjY1Q5Q3HPoVhZqYtJh
         5BBqu7GsXmPtaaep34ZX3yXr7SGI0GgiqosZ3zJ2DVYP1Vj7s/70qvPoBdtVlvAqoWwy
         P9/sEdpkSi4btlHR9cERlEolmU4vrYmr4V7sOyMczw5HwCu3yzqcMoQ7Ix03mNP/drh8
         AT9w==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SkZQIuio;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7349-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-7349-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-7349-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id oq27-20020a170906cc9b00b00a34a4effc5csi3664113ejb.39.2024.01.29.08.45.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 08:45:46 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-7349-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SkZQIuio;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7349-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-7349-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CF931F245EF
	for <alex.bennee@linaro.org>; Mon, 29 Jan 2024 16:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A207155A5F;
	Mon, 29 Jan 2024 16:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SkZQIuio"
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906DC156985
	for <kvm@vger.kernel.org>; Mon, 29 Jan 2024 16:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706546741; cv=none; b=bXB+zRpDNaLJIvchlqnf014IozAIC59H8jkZtIp3g6um8Z7e2YFKHMh5i1XQbSUyEoc8qQ7qXaBOrF8kRTrfJZIBq9TcE4osODM9Qctl7XbiE13wQJjaUNHH9Zad8/JW9q3MHRuL0NCPTfMuwLfoM2IR/mHiJYQ3A/t+555JNUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706546741; c=relaxed/simple;
	bh=ofVK47wtlfiohkIAcZCoxDfNqHXSK7mWUQXexl1YOe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K0J5lvn9igQ0mM1JkWNXNRYUpOL3RfhiKGm65W1Gx9swmM5cGTzGpxCPOoDjTiqAHvem91yuEarqfFjaUW23oebGGdnAT9PAa5DXjRtB/HJQyE42ttLa00liyXjPicwDsY6Tx/N+X8uuajhJWsKqFGuRNvyNX0TJaOvPSolBzyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SkZQIuio; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33aea66a31cso737008f8f.1
        for <kvm@vger.kernel.org>; Mon, 29 Jan 2024 08:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706546738; x=1707151538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DX37RoqmIV4LbscHP0LblED21zanCtHAqywHz6ZSi8I=;
        b=SkZQIuiobPjKXPOpwPBBRE/96V9BFI2lke2X0Kz9xolTTLN6gDSOrQiNDe/ljj/92Y
         tEIkdM8wcKF2Z0p4IQP604Z/4rCO3wyFDFJ5q2BjPKApJzYo3zPw4RpiEn19+QYWwN9l
         +AcYexPKNRBZ0lB7MFoHk1T+m8jO2qmV6jOA/kCy6dxW3kTSSIANsWEgC/y0uwgSRUxY
         lYLrPzJOoQ0FQ4Nkq19PmXqxtgXtn1Pv8d7xw8vg04RoTgxvNaHWBMGyEMOdP70QEz6w
         7KqOB8UxdUkQnywJK5IvLqHigeqTn1zVxd1eSI+LqOcwu9yO5V7o2lbJpIsR1HEMHLVW
         G8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706546738; x=1707151538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DX37RoqmIV4LbscHP0LblED21zanCtHAqywHz6ZSi8I=;
        b=CuvPV40OoI+o3mu0/T9bakbdxMNPArRp4NTZx0kttOxKSmkLOok0OtLX+ddrxj7Mql
         inXtgrY82IBJEeGGqvo3mNoj+fKjrdRF+VrN0eWdNz5AI1Mmrh3M0OZVebU8+3os+HW6
         7acmCXjA4kWvXdtuYmRQu+auNmEsCyVXjnFkIjzlTm+7hcDjMLeZ3DNHv2huAeMhtzid
         6bezK5J6KD3bB2qU3F+dArOYM8y5zedXK7X6r073uaRPkYoLLpEAT2Z+NiVm7Y7yR2bW
         4dQ0smPlbuuWMxSvqFITj6pDhWUFqnIfXrZxTqpDNMTgIcgOoenaCdruDvyeAyFraUno
         ZjEw==
X-Gm-Message-State: AOJu0Yx8bEgofNA58pvY50COuAy8o/SL75BrWAHQV3GFCOUPOUXFIHoi
	s6vRpaP51BcJKFAEkwuDdFZMuL64MUPgj+t6tpTTcRnbfO4geObo2oT4cHabpnM=
X-Received: by 2002:a05:6000:1888:b0:33a:f12d:61c3 with SMTP id a8-20020a056000188800b0033af12d61c3mr1992032wri.68.1706546737831;
        Mon, 29 Jan 2024 08:45:37 -0800 (PST)
Received: from m1x-phil.lan ([176.187.219.39])
        by smtp.gmail.com with ESMTPSA id v9-20020adff689000000b0033af5c43155sm653530wrp.56.2024.01.29.08.45.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 29 Jan 2024 08:45:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Ani Sinha <anisinha@redhat.com>
Subject: [PATCH v3 03/29] hw/acpi/cpu: Use CPUState typedef
Date: Mon, 29 Jan 2024 17:44:45 +0100
Message-ID: <20240129164514.73104-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240129164514.73104-1-philmd@linaro.org>
References: <20240129164514.73104-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bSxHyxG6NgSB

QEMU coding style recommend using structure typedefs:
https://www.qemu.org/docs/master/devel/style.html#typedefs

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 include/hw/acpi/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
index bc901660fb..209e1773f8 100644
--- a/include/hw/acpi/cpu.h
+++ b/include/hw/acpi/cpu.h
@@ -19,7 +19,7 @@
 #include "hw/hotplug.h"
 
 typedef struct AcpiCpuStatus {
-    struct CPUState *cpu;
+    CPUState *cpu;
     uint64_t arch_id;
     bool is_inserting;
     bool is_removing;
-- 
2.41.0

