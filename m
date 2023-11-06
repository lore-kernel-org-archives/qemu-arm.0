Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2679878eja;
        Mon, 6 Nov 2023 03:10:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgb95tTN7LoO6Dgd1ZI0dZZmXksEN2aF+z2W3RCQ+hEuUUMBJDe2iuVSb4b01ddseKfUu5
X-Received: by 2002:a05:6214:2467:b0:66f:bc19:3e2f with SMTP id im7-20020a056214246700b0066fbc193e2fmr30061157qvb.28.1699269031123;
        Mon, 06 Nov 2023 03:10:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699269031; cv=none;
        d=google.com; s=arc-20160816;
        b=i3pAwGLnutpRkONhBO5UnjMh8Km7Z4jXl949v/Yhy7IP6nUWuSJUiPXd2wiMhw8xvP
         Sj1bj2zRyagCBft8GF2QSiqT9rF9jiuQ4O8K+9/Pg90Zdv3V6jWf/j2l+gL75E0H2dWQ
         lZNV1ieoCWT6KQff+7vUCLSeQsohpLz68ScO9JQvn54PcTkxWHGb8JlQXirwWvQJ/1Yn
         UN6QiputsWrdkauL8VVt+aEyFr4+ZTLid11SJrNyqVIPXWVxVTCv9+s1HnjG41clixqq
         7OBTAuG1S2gMRaXizVlfjhiGGHfzsB8w9xfuKU2UWGv72soepNbK873I1SMy0/EyOmxe
         vbKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=RacUCXaZM0ryRlMszwI6IYYuk8+9tjRt89OkiSY3LIw=;
        fh=oweprlIPI+Wl0nooSfyV1b8Ww9lY57oEY/HLFECOUGE=;
        b=HZGCuKcHT5KEeQOBhQ2vnPNojqoKYHiLeXAgrpxwL5gp/+iN9+IXy8ksSEBDNyoARK
         aKrujCh/fM+NDo5IgDmEsvP9ZEMOh+XVa+HKukjO9Jy5RA72nIDC1Zd0TvCUSP66J/tY
         e6Xcu1/VJSz5Ne7G/5x00k/En4V/CRJsu0BAJ9l+/9Wo9J0baR01Y8oJV8xbCu0aT/Uf
         H0R+UITu4HUnhreB9LAk5m7j20DhWdoBrKvD0CQjQYb+vwd9abT/92oF2BZMtMs8rTxP
         xuEBu29gmeNkjhhVfvUpxcr+28fnlLa0pU+jY4vb5MWj0cUDljbmIUGlSZ/5ZnvS0xT4
         43Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DJtXwULa;
       spf=pass (google.com: domain of kvm+bounces-728-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-728-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-728-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id h14-20020a0cedae000000b0066d1e996112si5691197qvr.135.2023.11.06.03.10.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 03:10:31 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-728-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DJtXwULa;
       spf=pass (google.com: domain of kvm+bounces-728-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-728-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8C231C20AB8
	for <alex.bennee@linaro.org>; Mon,  6 Nov 2023 11:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A601A596;
	Mon,  6 Nov 2023 11:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DJtXwULa"
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999BB199A7
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 11:10:23 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E4E6D70
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 03:10:19 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40839807e82so26144695e9.0
        for <kvm@vger.kernel.org>; Mon, 06 Nov 2023 03:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699269018; x=1699873818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RacUCXaZM0ryRlMszwI6IYYuk8+9tjRt89OkiSY3LIw=;
        b=DJtXwULaVfLvNnHd7c2dUMhI0PeZ6VPAmZymGaBihCEm2vBizGRralknfw9Zqm3hDl
         a4mWzVgWgw2+iIctfhFbnIiK8gP7vAWY2ifAPCvWTZJ17J7wqFIamCrbCL/JIuC73aTP
         eiGAq/NixRg0fcR5ite9uswFQuNPONUngMZTn7YhpXqXmO9p2ZqcMDb60IrLSekrb1a9
         HDOoIgjloNSjkqqV7vBU3f/OxWg2hOKBs89vAAhvwj5DzJQF20IPpbDM9GSJ2l4CXtTK
         h+5mWHd7f7/B0fijwgUx3qROIVqJAbTwSUgHzH95/sbrT2MZ+LRaXdQxy1rJlqS/LYSs
         VA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699269018; x=1699873818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RacUCXaZM0ryRlMszwI6IYYuk8+9tjRt89OkiSY3LIw=;
        b=SL7BK8cSgZiTepiSxIOnBlRsGfMrjXapufCecwtO8mt53lSYGKHL6coFbVqnmC33sG
         WVmbrq7hEbha1Bf9nG1DF21kppMa0MbwDfCZfqMMDSipElk6VKTxZJXvIZqm20iFCz4c
         44MZqbSFC2+ecz6fBoAIz0YIwWNWcVsjRIx1vwsJSsCd6Z722a1HB8Rw1bGVXVJbAmuD
         PBYJH1Ik6wQ95uX5TkkwhSsBE7ArG6HqRon4yawztEpLNcHm62kq54wKmFBxidzxcHlC
         utgzt+QxSBJfy1N8PENUGWgO0hYnXN/0/waIBM3gYgH7KDEjWVmA4mOq6gKey21TCfpR
         x8OA==
X-Gm-Message-State: AOJu0YzSpH9Y52/FnACx/wDaj5yK/Feb+8rsatNojozmceLuRE2MZWMJ
	yLEhLUK8OMVJO+T7aEbqmTHqzw==
X-Received: by 2002:a05:600c:4e12:b0:406:51a0:17ea with SMTP id b18-20020a05600c4e1200b0040651a017eamr11538636wmq.10.1699269018513;
        Mon, 06 Nov 2023 03:10:18 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
        by smtp.gmail.com with ESMTPSA id c12-20020a05600c0a4c00b0040775501256sm12046304wmq.16.2023.11.06.03.10.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Nov 2023 03:10:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-s390x@nongnu.org,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 59/60] MAINTAINERS: update libvirt devel mailing list address
Date: Mon,  6 Nov 2023 12:03:31 +0100
Message-ID: <20231106110336.358-60-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: TH7k3/RwKnY4

From: Daniel P. Berrangé <berrange@redhat.com>

Effective immediately, the libvirt project has moved its list off
libvir-list@redhat.com, to devel@lists.libvirt.org

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-ID: <20231027095643.2842382-1-berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c57868c94c..3582e2a71a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4049,7 +4049,7 @@ F: gitdm.config
 F: contrib/gitdm/*
 
 Incompatible changes
-R: libvir-list@redhat.com
+R: devel@lists.libvirt.org
 F: docs/about/deprecated.rst
 
 Build System
-- 
2.41.0

