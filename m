Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp490415njb;
        Wed, 4 Dec 2024 12:29:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWTobKm5Dd/SiNlNcP4F7GARXxvTafITipG5xpaKpFAQCI3iI8428IvwRB8XcWSJqRXcDtlBAmcSNoFhA==@linaro.org
X-Google-Smtp-Source: AGHT+IETjkP+xOEOxBheKT48kLV0naInsyRso12rq43oa3fewKfh6gQUD3lyEtTGiQU8L5MDiGGh
X-Received: by 2002:a05:620a:1991:b0:7b6:6a76:3a44 with SMTP id af79cd13be357-7b6a5d52697mr766953985a.17.1733344194997;
        Wed, 04 Dec 2024 12:29:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733344194; cv=none;
        d=google.com; s=arc-20240605;
        b=FarHvXMwmfEk+78+aA64FtmDc1AzxxIMitzu0i36pFpxlGU+Bh7EWU3+IGFAkkdPDn
         E536n6plidhOhGkEL/Kaffc1bLIgTinHleaoKeuAln195tmTBuBxkRHliqyqiezJVWvS
         rFy0UIghrdk58oEqal4QLo8K2woscLCqDtVm56lH3MLGGv6h588L3oD9xvsAPLz78MbS
         OjjLWRRYvXJ2oep7ZHJkFaBPXdDSZMkDdnVXqSfDoUFQw0aWB9iQetW5gR4isUuvCK7Y
         R9qLE6dZmAuWThjT/iqKeGjBDzUVDDtNhLbCPyni5ySxwfI2b42bK5YsNxrHJ+dj/Bjo
         z+GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NfTBm75o97Cz8/aU/8hyy/8ZcyfCCBeJMjQXzg2r+cU=;
        fh=C3mUDLj1W+9SL8pcaJh7whwq+nxmIHVikyyR1iFHUe0=;
        b=RIq9obDLwdpUos9v29akozNaIkYUa8XvmNcUJZRB8cbbhOenJdvaGnkPfq/NQyvTcg
         BuMEBjvnXBWdKa9cpFi1H98POHUNzG4ZipSv6KqaLoWZs0HaIo27Pqjikg+69QIY47Ot
         tIh/jXqKBhR/Z42lGQmNdkMk5TpuiYX+DKRkBxG7c9u7XKt+JgoJhOARB+TSaQXaonR+
         gZzSQNTCA+QoUhIwKoRQ1Mg2UQRtNLVUVf+X5UUiLm27YNRmUYt5KnSV44kgPiOHyOgn
         FyUl6vtrW78gnrHne625kug8SLlwLDryBmWpX5hmVeYxpKsNqnHSo/CI34hwC+pgh++r
         ttfQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SqzBevB8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849d727bsi1732224085a.486.2024.12.04.12.29.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 12:29:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SqzBevB8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIvya-0001eF-Aw; Wed, 04 Dec 2024 15:28:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvyP-0000rX-U4
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 15:27:51 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvyO-0001TC-BO
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 15:27:49 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-434a1639637so1987285e9.1
 for <qemu-arm@nongnu.org>; Wed, 04 Dec 2024 12:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733344067; x=1733948867; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NfTBm75o97Cz8/aU/8hyy/8ZcyfCCBeJMjQXzg2r+cU=;
 b=SqzBevB8p6YpDZUC18/k4mfzMsQOFPVYfWXFynLdgOnQpPBRBO3Y+kKuNnf+SMjXqW
 2mklqPRFcdij8SWFl/3RyuY/IkYy6WGVd68mlNle7EBlomp6jZo+16tV09b4Dbe9euCL
 e0uIBwZe09PgyBsoa0Dq7kg1lTLi3SMdF1//kQXAkOAgNdgL6Kpo4i5hvr429g6FFKxP
 Bx+oSGgHvgNmuSO65lUbAYvGgkJf+HN+Kbov9wOqW3vitHHON4D+Hge0rZ2GSlBdI10p
 xsBiYFpvLQ2S5OYHofqonzDkZDgFN61IST4lsZ0qm6CM+QgU704VGLPuaA5XgO3Cqh/q
 6EWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733344067; x=1733948867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NfTBm75o97Cz8/aU/8hyy/8ZcyfCCBeJMjQXzg2r+cU=;
 b=S7yHwMTECArZFwtui/MC1FBtaXTm6bLPHRYfCWBeWthiA/gZvsUl9XE38bcngkwjp2
 SbkW4M+qL9fUFG/DZqdakoNkYQa9VFL6QlitmOWrEYrSKX/Xtt2DbOsZ34tUsU6Hi1me
 M1J+X0Aw3LpAacvymM3yAnm4OkC1ujGhov9+XkQ8Y/OEqHj8ioDXekbXgtsfMZZ1EF0g
 QBlV6iTagJkQ6TPMIr6s3tMvnX/hXwIdTT/cpJQDnE9TlPxZ9eQBE8yLR25dbeV2L8Ah
 Sj/Zhgf2VJc5ASpt7hZXZkMJFFH9x63HLirr6XTUc6fajpmTf+Gm60PhGUpup8ENB41Z
 CrYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6zoQWN7kaDnOJCQM1ZIbkp6onDNnDB2uducJ5bYCxU8gG/Wq533d7OPxqJ4daPrv0Ou9swMvrlg==@nongnu.org
X-Gm-Message-State: AOJu0Yz7Um0cm9WDpbdQHVyk/oTEp/IAgkIBE5WmTXMp8KFihdYh2vxV
 JYFKCj5avPUEBhYBSbmXudm6Z6g63PVP/MOyrxSF2plEeRx7WPXSzeC49Rr1jm4=
X-Gm-Gg: ASbGncua9QDbLuZzSF8dFAylJUACgcNKEwSWKJrRPMxO58N4j3xnNaYDvHKJ7tJx9yE
 VQgphGxgjL6x/sxWqIW+0c04UHtuiMlJxAdXTe0rbZ91PpDI/CmvYclFwYpXsQOggzwGtds0Swh
 uOxYBjwn9I/kY0zq3dDJ4jbXhKWUfC6fThuM9LbisxWdlCTbhfDK4vX7SFgNhlidawe2sk6aLjQ
 0M36NLov2E5SgCwejUnqFZZrmMbtmAdI2T1mFu6LuAhvUw+ZJy6P+gZiQbdK93IfqABTwHRMXPi
 FVkwvDeIoK/FMoW4WOmf0KIw
X-Received: by 2002:a05:600c:4f08:b0:434:a754:661c with SMTP id
 5b1f17b1804b1-434d09acef0mr65607085e9.7.1733344066970; 
 Wed, 04 Dec 2024 12:27:46 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d52aa0b4sm34940765e9.35.2024.12.04.12.27.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Dec 2024 12:27:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>, Anton Johansson <anjo@rev.ng>,
 Zhao Liu <zhao1.liu@intel.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 12/20] target/xtensa: Implement xtensa_isa_is_big_endian()
Date: Wed,  4 Dec 2024 21:25:54 +0100
Message-ID: <20241204202602.58083-13-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204202602.58083-1-philmd@linaro.org>
References: <20241204202602.58083-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: Edzi34mS78PE

Xtensa internal fields are opaque, only accessible by
the Xtensa libisa. Implement xtensa_isa_is_big_endian()
to get vCPU endianness. This should be implemented in
libisa, not QEMU, but I couldn't figure out where to
contribute this.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/xtensa/xtensa-isa.h | 1 +
 target/xtensa/xtensa-isa.c     | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/include/hw/xtensa/xtensa-isa.h b/include/hw/xtensa/xtensa-isa.h
index a289531bdc8..1cb8e6ccb66 100644
--- a/include/hw/xtensa/xtensa-isa.h
+++ b/include/hw/xtensa/xtensa-isa.h
@@ -829,6 +829,7 @@ const char *xtensa_funcUnit_name(xtensa_isa isa, xtensa_funcUnit fun);
 
 int xtensa_funcUnit_num_copies(xtensa_isa isa, xtensa_funcUnit fun);
 
+bool xtensa_isa_is_big_endian(xtensa_isa isa);
 
 #ifdef __cplusplus
 }
diff --git a/target/xtensa/xtensa-isa.c b/target/xtensa/xtensa-isa.c
index 630b4f9da1b..36eb4bcf3d4 100644
--- a/target/xtensa/xtensa-isa.c
+++ b/target/xtensa/xtensa-isa.c
@@ -1741,3 +1741,10 @@ int xtensa_funcUnit_num_copies(xtensa_isa isa, xtensa_funcUnit fun)
     CHECK_FUNCUNIT(intisa, fun, XTENSA_UNDEFINED);
     return intisa->funcUnits[fun].num_copies;
 }
+
+bool xtensa_isa_is_big_endian(xtensa_isa isa)
+{
+    xtensa_isa_internal *intisa = (xtensa_isa_internal *)isa;
+
+    return intisa->is_big_endian;
+}
-- 
2.45.2

