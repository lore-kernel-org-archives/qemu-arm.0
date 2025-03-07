Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp2398492njm;
        Fri, 7 Mar 2025 11:05:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUl/plxcDf3/IA9bx1q9fwb0+Dgg6sQsqb7MJ4Xv6UwZLe7TQVvp28iUw5O/4uwsaR6GxLF5RUUC5XQbA==@linaro.org
X-Google-Smtp-Source: AGHT+IEgUNuazuQNKxSuuLNuqxGfOKTMlY+Qbi2xkkz8JQBZ+vgmg6UQmUzCIEdBIAZPJxzYF4W6
X-Received: by 2002:a05:6102:1625:b0:4bb:9b46:3f71 with SMTP id ada2fe7eead31-4c30a5aa783mr3696798137.8.1741374311882;
        Fri, 07 Mar 2025 11:05:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741374311; cv=none;
        d=google.com; s=arc-20240605;
        b=Z+sp+rEHSuK3oYc9WXNEu2Nnpy/QCbffUmStRGud4p786d+r7OQe65Qs82cYAWjYdJ
         Uga/UsovCinJTyGyIhWhVtSdJFim1QQfQjZO1Tl0kd75uEgXmpnhoPyFjx3kYlibKMO8
         6txe6Erad04I9CR53MaGbn4/O884ghmjz0uZtcXKRSuRSPE/jLC1vrF/Ivi0m4fwlUWC
         CPdxGCXg3Cpg6hU7qfFkZy6CiIkUCrTr4TSAUII9iwEihrFB/ez6jS6vCwENroZoKJL+
         TQqiKt36J4Ikbip1sfPglN76dVxT+D52D+wBHWTKkY4lHmAQBs8NPWzVj/0nIjBMHY0b
         vXKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=0BJUdnRxvBNifVF+p0Ojv58i7O/Id2TRClCiTjlq4rg=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=TjyvIpxPFqvAWv7ToRq5dRLtk5Z9ZKuttDAIZBDJ5iHiL52bkZ6lqns7EqIsNYJwRU
         oc7bwC507gSLE0nC7ZPaJ1ohtIiGVUvdya+dTZieQERKZL9ZR8TvtufmYHwgRJjsW5iv
         ezeCCVMAxSsGl374k1+jY+HpU+Oriag7qrQR5ElcUnoIActQ9Ozt7DTKSWxSwc9Dg4bS
         8v6wzH6nrOWVO8pTC3lS5in1XObcMn2TgRLoCpPpv8hHWUjhbWDxVuMFx9DuHggF6c7m
         3b37QnrkNYhDRZkI59CXeES8967j0zxg3C83B6XAn9Etd0ZZxYIOka1jFxWnp48kMihF
         bUdw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N9xOqI7L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c2fb4273e3si1156549137.53.2025.03.07.11.05.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Mar 2025 11:05:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N9xOqI7L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tqczp-00044h-Kz; Fri, 07 Mar 2025 14:04:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tqcze-0003xM-Hx
 for qemu-devel@nongnu.org; Fri, 07 Mar 2025 14:04:22 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tqczc-0003he-J7
 for qemu-devel@nongnu.org; Fri, 07 Mar 2025 14:04:21 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-224341bbc1dso13945715ad.3
 for <qemu-devel@nongnu.org>; Fri, 07 Mar 2025 11:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741374256; x=1741979056; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0BJUdnRxvBNifVF+p0Ojv58i7O/Id2TRClCiTjlq4rg=;
 b=N9xOqI7L/rrQ0M2IaiU7DzzKJPNw/crRfSyLFWZGjWV2k6wz4sxMP+3RQDXp7OfIhv
 x/DM/YajXVVeNksh4wS/CpnDzr0JBGXjTzIG+Uzq+ulZT6wNO3zYM3NJi0/VRslLJtjn
 MD6RuNc5E4dwUd57RswG7KTltgfzM6th8r+dh4R7LMzbLGRfFF+Bo3qds6WdfrU48bob
 905vmj6w75jxcMomv/eKEbBrW/ekFGal1NSNqO9b/Fr1haxxlcS7F2JN4czvYPPcdrhd
 hK9dpQhgWkU1lT+Aui1IVCroWISFolHSRTyNI2rNmlPAo047zdkkvBfeVyVC51OcH0O8
 4xyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741374256; x=1741979056;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0BJUdnRxvBNifVF+p0Ojv58i7O/Id2TRClCiTjlq4rg=;
 b=qHA6CC5p65/gIIjxRPcvEEBfFA9t9+MfOsAdG9PGf6D6afropDWGUs5ZNOO8tB+QcC
 vUI9YZxFVvAW5Af/H0n/WOILylP9pvPtkWeVtBwVshVQtzN6T5ZcBGqXOUGJ48uJRO/8
 6S5MFn/N8gl/BCRbldbv4OiAIMKSnY3jKso3R4J1DdXumMw4k7kmysJopKcWhIwOJaCf
 5EPvSpirzwHOF43f+61MryvIgdpcc5KuOQ01IDqw4OOamDFO1Pccb4Qtxf6+lmYfeGA1
 f79nW5H7r4vxuLA8zUSFJs3i3AVeHHLBM4nN7nm1fqseGa9ytQHQqubLY5WJ+LdXz5jj
 rPfg==
X-Gm-Message-State: AOJu0YxDuurIbzSSBpLFvSVKqdp7ghJXkLgn0QWGBNxwuBz/L+pzVoyD
 2EtWq50wfC/Df/KgRQ+PG4SBMhKDI7rArP+36TsN0gVx8aAA7KdlNJi7w4QMJls6iZY3EF0TNvh
 q
X-Gm-Gg: ASbGncvA2cVzy24bxS42lDAzAag8FvlEaBnMZS/wyFwnu1zXb6CyMcIV+vO2h8gDYWz
 usmh1f4uYIbgRPf86LRzwXGpwQcgqasnWqjrua5HbNoATv7PxvvxtJgqXhQe2ZRpYUK/1LQrTcz
 5ilBb3P/7mxtaDdVFdjO1BcXQcqf6Z/KMu6+1zVKPYxO4JLzPodzlYGSvsHO6/w99tEFqq5S+wy
 rFVqba23rh8pgGWW6EoiI7OvSb9g5KO89gA89oINuLvARToHLsBOKhbbPiS0c2WaEGiHqwvUGRR
 TkexKkmlH8bbeA+ROw4XnQpcl129tRbbG4BCrAse0xraSZujAAzdO+5I6xscpgwRsdy3Zs88ZFu
 X
X-Received: by 2002:a17:902:e74e:b0:210:fce4:11ec with SMTP id
 d9443c01a7336-224288696d5mr68325875ad.1.1741374256504; 
 Fri, 07 Mar 2025 11:04:16 -0800 (PST)
Received: from stoup.. (174-21-74-48.tukw.qwest.net. [174.21.74.48])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22410a91c5bsm33686335ad.186.2025.03.07.11.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 11:04:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 0/2] target/arm: SME vs FP enable fixes
Date: Fri,  7 Mar 2025 11:04:13 -0800
Message-ID: <20250307190415.982049-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SUharTRl8i0L

If SME Streaming Mode is enabled, but FP is disabled, we get two
assertion failures within the translator.  Beyond the assertions,
this combination should succeed because we're executing on the
SME co-processor's registers, not the core cpu's AdvSIMD registers.


r~


Richard Henderson (2):
  target/arm: Make DisasContext.{fp,sve}_access_checked tristate
  target/arm: Simplify pstate_sm check in sve_access_check

 target/arm/tcg/translate-a64.h |  2 +-
 target/arm/tcg/translate.h     | 10 +++++++---
 target/arm/tcg/translate-a64.c | 35 +++++++++++++++++-----------------
 3 files changed, 25 insertions(+), 22 deletions(-)

-- 
2.43.0

