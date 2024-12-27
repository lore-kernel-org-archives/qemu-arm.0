Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp6561052njk;
        Fri, 27 Dec 2024 12:25:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUeXJDQ4ezAyAxlb/JJtgpuIni4C/W7CLHGl5cMTnw2ql1ooNz82mybswfeVd5uQgG1ZXinJ+N89UQRFg==@linaro.org
X-Google-Smtp-Source: AGHT+IH6ONpHa2/amK13rP8HJwF7IZdvDqJrVB+l96TjHI9WqdoPQCuTF8yAh5D+CU7yFH4Pkzv6
X-Received: by 2002:a05:6214:5298:b0:6d8:a967:8387 with SMTP id 6a1803df08f44-6dd2331e1ffmr406957026d6.1.1735331124668;
        Fri, 27 Dec 2024 12:25:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735331124; cv=none;
        d=google.com; s=arc-20240605;
        b=YMTQ84xf7CqTxQ2aTT9/C1+gZ7LKCv1VK998mT0Q23oHh0SZHfZYFQXZ+IzWdugxEI
         jI9TUVvSQpZUTNhJjPicmu/SVXiGQAG27LppjzYtxmgwnqgnLyvEVmj65JiZ6KTkJx8n
         T9UhHWhI9BG2Eu+QQeBzbPvNv7haecaIfyldtsJYXX013/6VrvdJEDhIDHbxe4495JVR
         hoKK162uM/6xBU6FYcygxVZi1rSlw2JWHisnNCcieLwqJoWoDFkMqZ//zA6b6JkbDzB2
         w3wWU/wLCu0OtodWW4j68SVWgGzbKSiUd56NLSWCXIGgHtNPW3rjTNvJHIAX1eOF/FYJ
         Gj8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tOiBkjb8mh+lWuc5hL1sFnWxqlY1hmRaS9nt/JCya4M=;
        fh=k8zYA+hn6S3VpZxG2YKRKBB+REJlR6ody6hJhWomFSo=;
        b=IOK8/mRdZVmzbc7sei/iVKZXMoCGgdfOm6z2Bwm491/d008mzugPBrosi/r50OXFuz
         Kt5eySxlIKy+nnL/eJwfOjOi9KYjcP7ljPT+MU6O7iayWO7t1pP5bL+tyeUBT0sB0c3Q
         WrzpaAxsAsdRmQZEanBHGoRRp9m8MZC8CWNj+vVlhtpLUBMRT/SYT0Kafu+e4n+N4y7Q
         ZEFhRDWkyvw6/9PO5qhYd5KocSSaD8uFuCMwU7scdDEH8HHbGK0i1Q/baOPDGNyBpUvl
         f+rXHKxR4CCK3avL/GqNH2YZGU6yX9h4BSAfBzNaiMxLRJ2Jz1gia9a/WwJlfBSSa4+T
         xtIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P9lmwGmT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dd1836faafsi224507986d6.519.2024.12.27.12.25.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Dec 2024 12:25:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P9lmwGmT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tRGt9-0004Gr-RU; Fri, 27 Dec 2024 15:24:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tRGt8-0004GF-6N
 for qemu-arm@nongnu.org; Fri, 27 Dec 2024 15:24:50 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tRGt6-00051B-PU
 for qemu-arm@nongnu.org; Fri, 27 Dec 2024 15:24:49 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso14785675e9.0
 for <qemu-arm@nongnu.org>; Fri, 27 Dec 2024 12:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735331087; x=1735935887; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tOiBkjb8mh+lWuc5hL1sFnWxqlY1hmRaS9nt/JCya4M=;
 b=P9lmwGmTDKeOMBVmx4pIn1O1WZ9Q33RqOq8nKZLMYQWIiKe9+y31/brpMlvg0/oohc
 TyN2NsIzkB2ByCsFVACQaHvMJHd22EEY1qqLdwwHBer66v9OZZbyf/GAZG7eagw+ME3h
 3/RDgZOT+M8kJsTJFgzkJEeij/NwBtbIt0oEzpb+9yN0Y2lXiFiHPz9dHqgJ6nZkUfmp
 KV1C3+/WBWm4qBKAf38Fy515M/V6Tsx6JM3LY50ewm3XsoN1hmRrzEUbz7Id/0FAsn+l
 cHOUuuah6oT/RsNB95MEVOIL25/RqC/ADffbEjDgnGCTtRDiCk5nqMON8UbDQP1Fdl0/
 4KUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735331087; x=1735935887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tOiBkjb8mh+lWuc5hL1sFnWxqlY1hmRaS9nt/JCya4M=;
 b=Wu8LON9d0gmRjH/az5st/DD69PumoiZEFtKC3e9CpHlnYfnyglan14Bmu6BE6uEPI6
 9WxOKj7dr7S8VG/e8GjaJaCn5SmXP8bzAyODJYd692e3UPatFa7EILfsIVXjhUVc5LKP
 c1ogO160qKM8Jsz8xogRtCtohbrKHm+uqhragSX+2BSOIai+isYPsnv5JyFQmsLRLIw4
 6ktgJ9YxSxCQVEoX0m3tfP+jeWFO0n/8uRVyIElsV3X+ALdiUug140E14ZYZiL6XOvyy
 98Kaa08fGwx5oxZovcilAj2o1VyGbHqkV81iKomn1Q3Xe+EYRumaQnP5rfj5yMcBAT7o
 0i3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVK2xMvwj51A6uWaHyBPxJcKige1OoBHcMvYJ085OCModbEUY7njXTKsy5fbTHrVzyQIjDzpJY5LA==@nongnu.org
X-Gm-Message-State: AOJu0YyOEK+tuRLsQ3T+IJDnbcB4tv9yy8QI75Z5njNhEpf+UZsEOowf
 gGF/btmgcU4qTn6U2waGIruAG+6rS1T6XBIy+kPnj4pXsvgiTVUC9KwozfKmJ9I=
X-Gm-Gg: ASbGncuu8lwIEmDJdOXQdIo4ef4lHfvAjURJpHCtiy8hs9ZZQ7T12c6Dwz8g2dWMZo3
 rJ+smHwPV1+1sIgssaU5kS8CbBFyiuw7z/DhlueSpgwR7qSbn9zNNv1idYs9BmTBFLWimAsMDse
 tl/j0h9UjH+tb38NfMnuq/xYdjly6A1oQfP2KFYeWhvMQL/STdstHbkwONQ1fXC84qr8YMRjFpE
 iCXLd0rbPYNcI2wq+lZEaV8xuiX3NcHLZR9TyGP7a5MgPN7Tur9SuhCrai2NV6bGS4jDGVha6PN
 LdvZ8UtmajqK1/Ynt2jGcSzWgcUPH/k=
X-Received: by 2002:a05:600c:350c:b0:434:fdaf:af2d with SMTP id
 5b1f17b1804b1-43668b7850emr246307105e9.30.1735331087390; 
 Fri, 27 Dec 2024 12:24:47 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b0145csm310239725e9.15.2024.12.27.12.24.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 27 Dec 2024 12:24:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/2] hw/intc: Have ARM_GIC select ARM_GICV3 when KVM is not
 available
Date: Fri, 27 Dec 2024 21:24:35 +0100
Message-ID: <20241227202435.48055-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241227202435.48055-1-philmd@linaro.org>
References: <20241227202435.48055-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KTPNeU7Sj6+9

When the KVM accelerator is selected, the Kconfig ARM_GIC key
selects the KVM GIC implementation (ARM_GIC_KVM).
For other accelerators (TCG, HVF, ...), select the generic
implementation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 7547528f2c2..762139d8df3 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -23,7 +23,7 @@ config APIC
 
 config ARM_GIC
     bool
-    select ARM_GICV3 if TCG
+    select ARM_GICV3 if !KVM
     select ARM_GIC_KVM if KVM
     select MSI_NONBROKEN
 
-- 
2.47.1

