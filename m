Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33E8EB5976
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Feb 2026 07:50:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vq4yh-0001Ac-Aw; Wed, 11 Feb 2026 02:49:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vq4yf-0001AH-1e
 for qemu-arm@nongnu.org; Wed, 11 Feb 2026 02:49:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vq4yd-0001j7-6t
 for qemu-arm@nongnu.org; Wed, 11 Feb 2026 02:49:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770796173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=GuQ0NvYrelwHNZ4wAnzmDtTLpI7wZFQuifKBPWGu0oPmSXt182J3H0scLE9hwxd9ISRilN
 sOKgOhI/NFWLodiHJOA18lg1mayek4YpEcTX3RHrkvXKXWXyb47Pc0snkgGaTv2PSpkfDC
 nRerpOUHP5992hbWG4/eKJhvM3RfQVw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-QRKeHGuHPa6UedBzA_0cgg-1; Wed, 11 Feb 2026 02:49:32 -0500
X-MC-Unique: QRKeHGuHPa6UedBzA_0cgg-1
X-Mimecast-MFC-AGG-ID: QRKeHGuHPa6UedBzA_0cgg_1770796171
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-483101623e9so14266105e9.3
 for <qemu-arm@nongnu.org>; Tue, 10 Feb 2026 23:49:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770796171; x=1771400971;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=PncBdVyY6IJBWWuo6G8nMC/DRnwSrfjR6CNVoFAqQc+hJQBDTnpPlfA4j8TreuM1Qx
 26xgMMA/xJnK+WrFyd/lINY3teXm79/QpnbBDD8tNgX19Yf1llm8nVZY/zJocyosTRHE
 ShJdVgc9th5Mq57H+Ei5Io/H645YpeDV1+nBBx3Fj1H7i4tRX6dH9n7QW/BPNAdf5GqK
 KwmdumtEBpyqvjXa6B7FA1LWFWekR55Gg/vvUTfBZXSX+Ir8Fs9C7PyqpPNNG0G+Rt05
 y0mjLOgmcSsgA1zryesMhvLBXHyq7Crv5+6Sc/5I9xzhHJUUwg2JGRelhXQ1PV6YT7KU
 QBNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+0GBqBW6FjdNM1p9yvzOseJf6ShnHsLDgVHEBTENcrTup+gns+U8yzWJmUBM8GcQeEEEQEk3ePA==@nongnu.org
X-Gm-Message-State: AOJu0YwnKkgPVBvinl/zp+xjivfqxGMQE1kY1fLEelQRMaeYr8h1pRiR
 hBCIWtw7ImsaA3+ZbCNg6NUKv7EqmQQoFwyeN+ey5kYU070HA2v+rmfhUs0Shm4QWo336NrfaMM
 GZvCFTxTREzMmcArzFdlSxkkb/joH/HKhwviLT8s+ZyPs4xEmYJXOxg==
X-Gm-Gg: AZuq6aK33YcNVmjN0QbxD3djBEBXxZZGbQVE438u4cT3OooUlx6CMOv0PrprO6Tphbq
 ru96I7FyE3NVIkAddE4pGEin9f00S5O2yrdVh1BL0l3oknCx0l+/9UlkGJNpw2yEoG5G2Oq65J3
 aq+hC5Paqci29UHMAZ3BQD4/wI12lQ4hdHlYMDYLD12agx+gXig3RLiDJwH6QH9EstR+XeWesWf
 SZiPl1SmPWvSYfMA3iBM58Q3PrmjT89B9oWnYSk33X3eCvi3XaMQfHkaIyWoHqIQxW8p54XWnBl
 3KUpvVhpa3cIdTIPHKZkWuzWDAtHmy8UNJwZ80j3ovwIpaMSycAwuRfR05/0bP4Ou8ck+jvlPKS
 pI0gXlp9s1LDehdQabyRP+AZSzUAL1RaugtdvvYEC/Z6ZM4gXb80xZnqKJJpXdXg9pzSwFzOdAG
 oAhkNiXPXNzA6nhusF7mm4svhdIw==
X-Received: by 2002:a05:600d:6447:20b0:47e:e2ec:995b with SMTP id
 5b1f17b1804b1-4832020dfadmr174072185e9.9.1770796170712; 
 Tue, 10 Feb 2026 23:49:30 -0800 (PST)
X-Received: by 2002:a05:600d:6447:20b0:47e:e2ec:995b with SMTP id
 5b1f17b1804b1-4832020dfadmr174072025e9.9.1770796170350; 
 Tue, 10 Feb 2026 23:49:30 -0800 (PST)
Received: from [192.168.10.48] ([151.61.26.160])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835dd20519sm40750005e9.15.2026.02.10.23.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 23:49:29 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>,
 Wei Liu <wei.liu@kernel.org>, Roman Bolshakov <rbolshakov@ddn.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Magnus Kulke <magnus.kulke@linux.microsoft.com>
Subject: Re: [PATCH 0/7] whpx: x86 updates (2026-02)
Date: Wed, 11 Feb 2026 08:49:26 +0100
Message-ID: <20260211074926.1411965-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260211055356.44664-1-mohamed@unpredictable.fr>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -Odxopp3cfRfUg4HdQG6KmogJc3ZxtclNsZ_n_sKDbU_1770796171
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Queued, thanks.

Paolo


