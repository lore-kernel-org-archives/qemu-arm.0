Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp519254ejg;
        Thu, 18 Jan 2024 12:07:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMNeWuApRhPiGKDdqlxDczvUVAgUHbMlGpWOtAXhXMZvbSP7eq+/WPBYcyxNJmsFBEofbJ
X-Received: by 2002:a05:6a00:92a0:b0:6d9:b66f:3d16 with SMTP id jw32-20020a056a0092a000b006d9b66f3d16mr1580204pfb.50.1705608474064;
        Thu, 18 Jan 2024 12:07:54 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1705608474; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZCi2EZFgHkfMuKZp9XTJ3xtj+7Na5Cm8C3uNDr/N5fYwrt80dkl9w1YOyzq3Uval7c
         Ai41EiP5z7DLXr0ruQcFYDn3RMvyrTjgO91JNpkmuhKqEnbkck8PRXSdAVlqTe+E4uzd
         uHm0YvuyorGyUvn13KIYPDi9nor87wwW50aCI1otMD+4TdjnKD5QXAEZWE1socN/1d6t
         oq98JKNwkBJYAOxn1pAme1UnOB8WyWmYsvkW1XgI49eyMH/GAbuXAnMGYCjOJiKSmZCS
         m68vhEkem/K3v8H0qfwRd1f42DkEBRlpSfiGNrHj9RusW42cf16hFn922P0bqi9n3gr7
         Xszw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=LrKc6a2ST12i1A3LtQl32z7hhWzowcoULUtetVq5wyM=;
        fh=cUgEM3TMHOIH70RmHTmTZxZmItZJnKfBWHSaci49aLY=;
        b=eWHh3QzecxFFV9DETH9YO/I55pqDkGVkf0jTqmrvdR1AKrHHOPBUqY4CPs7E3wTg26
         iY/AeuQCR4FKPCSb3bUE0FnT9dxAsUW0e0XZBcuuvE9axl31JzgsljQdpDxKCMh9lnv0
         LRbW/CwQ4qIcNdtO08kiHacxJfljLTk9CKt5B3uCEFH+JS8Wm/SoZ9c/bbgON+YBObJW
         iN4HrVVnwfhXLCQY7pwZjzrcYmQ2XnF9i6oRsmb7VbT4CI8kam8/sTOlfrQGZ0IFQMxj
         PG5AXKLtuW4zvlsRQ5T/0Z8SZAYdH9yTW28pj2B8JgEJ7CgaxjU512vdCDmspIF1+4Ol
         dJwQ==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FLunNfAb;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-6438-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-6438-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-6438-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id jo38-20020a056a0090a600b006d9845743a7si4355051pfb.20.2024.01.18.12.07.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 12:07:54 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-6438-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FLunNfAb;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-6438-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-6438-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83CC7B26696
	for <alex.bennee@linaro.org>; Thu, 18 Jan 2024 20:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A852E84F;
	Thu, 18 Jan 2024 20:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FLunNfAb"
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5AB2E824
	for <kvm@vger.kernel.org>; Thu, 18 Jan 2024 20:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705608449; cv=none; b=s+ecigwUWpqDhBNr5Q28z05mHOQeobduMkxk/NeM4qw2EmBJD/ji6ipOQTXOZ4q/5ZEd8RxZU6fSLDsCUnTQoY9EpvCjs2vj+rDW/EZobzWuieBukDW5VQ6Cj52dTdrtsCqc1D6lgk4hhSgwfEXKge+1ZC5YSf8pQuG4ckjDkdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705608449; c=relaxed/simple;
	bh=UD0YWUXxdRhVhWW1XBCJE/clMtnY4lWjw43nndD/cg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EpSqhm6O9EMhmzz93h6TyYw3QVFWknqJ1CMzwgQfPLY4VEN4ujxzrP91PRYv+sCKdN+V/oEBlveV+mLYFCcNfQu/IBXcGnErBEIqoupcf8kjKEbFNqkkOnH9PUgnfZTfA6VuX63E3fw0XK4g4ObnwFc1eTemh+93NOmRrLgiqFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FLunNfAb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40e586a62f7so236325e9.2
        for <kvm@vger.kernel.org>; Thu, 18 Jan 2024 12:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705608446; x=1706213246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrKc6a2ST12i1A3LtQl32z7hhWzowcoULUtetVq5wyM=;
        b=FLunNfAbd90m62EWz1ocamnDtecUZHktBxKaCRH5G3JVRuugKMoSvMH2vrSRu16lyB
         oqCY8iwO+gGfff1SgDAqgosrJ3PSzXkdNpkEC7d57Yk3TteTq6cA5q4fvJowwRW8UXe8
         4PIv4KqvE7PbpDi6RxC83V75UNjMZXDwy0PetYhJzCuTAq3qnShrblTVWMvqF5eBW23q
         vOYOKhqybxbBZMo9bFp3s1j7LAPLMgKf/RceFI4INpc9dS1jN9ANUQY+RLIE8HOlurLE
         aH/KYAav1vZ24sp643YpdNI1J10QEYmtrrqQpRrWPyC8516qMuYDTANFDJvQbJa9zaQi
         xuqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705608446; x=1706213246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LrKc6a2ST12i1A3LtQl32z7hhWzowcoULUtetVq5wyM=;
        b=vHr3gKVoPL2ZvkSVJOXivQdF3agl84IiooQIcx4j9OMRONo4CZoAEL+kGtwJd9LUeu
         p1OIyXGmbvn+klFokDQ7avLNzUKmod2FcGI+HNzfqeqAoRNBqMlUL3jdCYUXCpyL7eo+
         vYiVasRLdHtKLmnqiJEfHoScHcyPr7C9Bk8dCeAwHvtFmjrBhxcf0qOaEaWsD80EMwJi
         7th2SObVUNaqx0GtlNUawEjX49hLGPh71JoZQLUxF1lRQgfqfFdQv9CV5vdTpikqxZMd
         CIDhFCv94+3veeUSBCSOHrqyL1HAFZSeJT9mivIWK4xYl9tEA6Z7NPCcHQ3REcG2s/lP
         tVzg==
X-Gm-Message-State: AOJu0YyE9J/Wij8lehAy+xoDUOR9LMmTWUQnPAqBP6jozINanq1dz2gc
	9DH2T2+b3ROy1K8k9vol5ylZ3tGCyJi3j6x2SqmDxg3KXdgVM40JpnLFyTAxLo8=
X-Received: by 2002:a1c:7511:0:b0:40e:8f4c:9fd6 with SMTP id o17-20020a1c7511000000b0040e8f4c9fd6mr1045616wmc.137.1705608446722;
        Thu, 18 Jan 2024 12:07:26 -0800 (PST)
Received: from localhost.localdomain ([78.196.4.158])
        by smtp.gmail.com with ESMTPSA id t18-20020a05600c199200b0040e5951f199sm26612681wmq.34.2024.01.18.12.07.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Jan 2024 12:07:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	qemu-arm@nongnu.org,
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Eric Auger <eric.auger@redhat.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Alexander Graf <agraf@csgraf.de>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Ani Sinha <anisinha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Joel Stanley <joel@jms.id.au>,
	Hao Wu <wuhaotsh@google.com>,
	kvm@vger.kernel.org
Subject: [PATCH 07/20] target/arm/cpregs: Include missing 'kvm-consts.h' header
Date: Thu, 18 Jan 2024 21:06:28 +0100
Message-ID: <20240118200643.29037-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240118200643.29037-1-philmd@linaro.org>
References: <20240118200643.29037-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ZxK0r/okBIyk

target/arm/cpregs.h uses the CP_REG_ARCH_* definitions
from "target/arm/kvm-consts.h". Include it in order to
avoid when refactoring unrelated headers:

  target/arm/cpregs.h:191:18: error: use of undeclared identifier 'CP_REG_ARCH_MASK'
      if ((kvmid & CP_REG_ARCH_MASK) == CP_REG_ARM64) {
                   ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpregs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index ca2d6006ce..cc7c54378f 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -22,6 +22,7 @@
 #define TARGET_ARM_CPREGS_H
 
 #include "hw/registerfields.h"
+#include "target/arm/kvm-consts.h"
 
 /*
  * ARMCPRegInfo type field bits:
-- 
2.41.0

