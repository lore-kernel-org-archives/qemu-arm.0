Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp899737njc;
        Sat, 20 Jul 2024 02:32:10 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCU7IKbjEY8FOEehNRQ3f4ULcudXaipbzXXhUya3idoz3SkHf9KcWFNH7CSY9dTGPTQxsOSYO+qr83rRVM+iVFLQ3mVsQVnl
X-Google-Smtp-Source: AGHT+IFKHBYV2Eq5NQB48ujCf9rSg2RHkotgukzPiHqMuDg53IVcRoqfHyBHD8cHQwZ7DNIoImL0
X-Received: by 2002:a05:6a00:2d13:b0:705:c0a1:61c9 with SMTP id d2e1a72fcca58-70d0efa8cd1mr706748b3a.9.1721467930604;
        Sat, 20 Jul 2024 02:32:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1721467930; cv=pass;
        d=google.com; s=arc-20160816;
        b=ASLP0anf3WTaNAyYg2Qri+z6aWPQDN6YUkrtm25KFVlQKJeo5QhckQF0rJbh3gFnXh
         SOrPGp3LQ66i2Y8BpHV+QXCq55d+iGDOA2AQ2Jy+uoB1bbVdfNfEIMSQ+VfVmk+EvEM4
         dtc8SLUNYjgUWWm0G7csMIR1nkUkN6OzGGuj0APGfXWKfK5ued2RWolFr6ovnN9rqra2
         B9bZQgvrjMyXvg6GdDVhfhGL0fEriu1clsjjRRHsX1VwIQtePRM+cYH/IQUjVF7h0F8h
         WZ0cc58S1L2FSUHnVh2yRMeA/buDB49cAAb4VbOggo+Y1U/LLEMpdpcGJjGu94JjtQWz
         iKtw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :subject:date:from:dkim-signature;
        bh=wrhfxyQiCKIug187Kcca0q3LwAZ1kZXZGPDwQT1UwgA=;
        fh=Z9CnaQfKHsWioDkD7VllJeoWYfbnlbUVv/JIpn5z7H8=;
        b=wVLyfthc75Je4AuEavp4LAUFTYM4eUVCy8En5gLuBTmJ/GyUPP3Nzwad2NhnOPsnVc
         D3yfWDEjxulcluVFNay706MyBOy9tZ6LZo8aC0y5KTwCOPcbKB2g9hJe2uQib+m3/Giq
         d8mkdF5Y2f4vOrF3KVYJYCq27qEvNwGWe3AEbFc2WSAEJLei74lhSb+WistGq3fRxVpr
         mFU+IOj5XnmD5UzfK89gK3yMD873RT0Ion8hayOxi6ovv/j78ZK5mGTolSzfwmeDrVD2
         Z2kuo6qmKmg74r9+GX2S+DiU5/ssUgJPwoYHArXtLf70gfHrEKhDG4U4eN4M2bpacm7X
         S9VQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=TTbgd7+1;
       arc=pass (i=1 dkim=pass dkdomain=daynix-com.20230601.gappssmtp.com);
       spf=pass (google.com: domain of kvm+bounces-22011-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-22011-alex.bennee=linaro.org@vger.kernel.org"
Return-Path: <kvm+bounces-22011-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d2e1a72fcca58-70cff498dd5si3287285b3a.5.2024.07.20.02.32.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jul 2024 02:32:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-22011-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=TTbgd7+1;
       arc=pass (i=1 dkim=pass dkdomain=daynix-com.20230601.gappssmtp.com);
       spf=pass (google.com: domain of kvm+bounces-22011-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-22011-alex.bennee=linaro.org@vger.kernel.org"
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B185283CA9
	for <alex.bennee@linaro.org>; Sat, 20 Jul 2024 09:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D9B2913;
	Sat, 20 Jul 2024 09:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="TTbgd7+1"
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D961347C2
	for <kvm@vger.kernel.org>; Sat, 20 Jul 2024 09:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721467896; cv=none; b=W8IeMX8vZioNp2QpLPcVVjLRHMW/SxC0rewfCb7BdJEw56opSH9n4UO7BKcYVttnUcM82WXDjAg4ZE9Q2psHUCUGGJ9kRteRwfqoFdsagOrrkGBapyN8PLVBsxJE0yCD6ZjnA6E2x6OM3r25wZkvVzYSH8TJT84TsFJXxJOA6sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721467896; c=relaxed/simple;
	bh=DYnqaWjAQ5Swa7SOrX13jfrs0jdvTL9wDFwzo29zQ9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MqINVxP3+VMDfcvKBs0aHOMEmSsg4Ze08pSv+yQNY6hXtV85e17DyvJoCQkU5d9tS8IhwbzBLFqLippLgQReayLfu+TiwIGT9wtAAcaT56KL2etYL7FaTQWEkM3kRPHk8an1hPM79ej7Rknpwm4AaIg1soeP4moB4BZaq1Jr6g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=none smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=TTbgd7+1; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daynix.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-70d01e4f7fcso829442b3a.1
        for <kvm@vger.kernel.org>; Sat, 20 Jul 2024 02:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1721467894; x=1722072694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wrhfxyQiCKIug187Kcca0q3LwAZ1kZXZGPDwQT1UwgA=;
        b=TTbgd7+1e9cfH7smSr5Qsu0a1xhcQcKYwvP8XwTyK4EaLHNi/G5K/V9UZIGj0WU8rg
         Kw6zyp2HXSj1+rUVMcE/NsqeOodlDmGe5A9EyfI2O7cNpXOdaRA7aQGT4c+Dj3Zkc5hj
         zYKbxP+WjhcN1OB6Mr2W7nGvTUSEHEfhcUOtrk1Sgm6NyrOC1dwnsZQXLSPMg0zoyYH5
         kuw+MFBIpdJnnuopQjF0c+7fAcJcfS4jhrVDmqSn/uxHfRLvBnfutieSg5IO5g10iPwz
         m3lq5HaKbJU1ZANUGfcnEPQux1WU57tUMWIHY0Z9pJUGFkoYxlwizkrpEsh5yAEftxjx
         G5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721467894; x=1722072694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrhfxyQiCKIug187Kcca0q3LwAZ1kZXZGPDwQT1UwgA=;
        b=VLwcGhns+VplRfxML3pZ+GP+/ofRDZVTofmYMxmMRWMIaIzQ963EA6NS0YURpj0BPM
         rMxU4nAZ3Xdc2T79ekjVRWhV4LqvOv6cyIJVD4YiFFX9PP3TJxLwVk9inVgv8EsJj3Z4
         yHV0KepFDMC5OWuOueoFGxWYnW77NtfXUpARm0tVpqQaMZz0bFtZDgo+RIfWvspfo/CC
         EiTfTN9h+yq6c7g5rIDIpybckIBP08qioAw+Z+5IRcTlQt/rTPZ7IoKKFsBEOSukOK50
         +B+xQh3MnDpWpd6SJlYDXzQEadbfnbAGLhXA7B5RIwS6O6fmxB1lurPtVGQXsNj1yKdj
         gDpA==
X-Forwarded-Encrypted: i=1; AJvYcCVlVMPO6LSXiG2WdcjQDQSBpyiLY3t8FFZMmS5HVTBbq9c4MDRyEC2MqMXX95174gZaOCb0VwZ3xT0FFwJAr8VGVgGe
X-Gm-Message-State: AOJu0YwGRNcBFY+ort0qgfJUlnf1oZrxTsXLhd/CtbUqHCQ61vCSRj5Q
	BoYJcHWGYaBZZtwzXWhdP4HgV2jDRKU16in+s/LB3IlqV0E2Ronr/5TvfyoJpxM=
X-Received: by 2002:a05:6a00:1887:b0:70a:fa5d:ad97 with SMTP id d2e1a72fcca58-70d0ef82323mr719873b3a.1.1721467894392;
        Sat, 20 Jul 2024 02:31:34 -0700 (PDT)
Received: from localhost ([157.82.204.122])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-70cff552c39sm2341661b3a.136.2024.07.20.02.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Jul 2024 02:31:34 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sat, 20 Jul 2024 18:30:54 +0900
Subject: [PATCH v4 6/6] hvf: arm: Do not advance PC when raising an
 exception
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240720-pmu-v4-6-2a2b28f6b08f@daynix.com>
References: <20240720-pmu-v4-0-2a2b28f6b08f@daynix.com>
In-Reply-To: <20240720-pmu-v4-0-2a2b28f6b08f@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
X-TUID: bdachUdCSbB3

This is identical with commit 30a1690f2402 ("hvf: arm: Do not advance
PC when raising an exception") but for writes instead of reads.

Fixes: a2260983c655 ("hvf: arm: Add support for GICv3")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/arm/hvf/hvf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index adcdfae0b17f..c1496ad5be9b 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1586,10 +1586,10 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
     case SYSREG_ICC_SGI1R_EL1:
     case SYSREG_ICC_SRE_EL1:
         /* Call the TCG sysreg handler. This is only safe for GICv3 regs. */
-        if (!hvf_sysreg_write_cp(cpu, reg, val)) {
-            hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
+        if (hvf_sysreg_write_cp(cpu, reg, val)) {
+            return 0;
         }
-        return 0;
+        break;
     case SYSREG_MDSCR_EL1:
         env->cp15.mdscr_el1 = val;
         return 0;

-- 
2.45.2

