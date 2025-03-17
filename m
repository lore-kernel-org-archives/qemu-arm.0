Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2160665njb;
        Mon, 17 Mar 2025 04:16:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV5IXr2DbWjs8gngDefBsI/ddDN1vsheIiK8qDYIj0Foq3yC7FfQijPHhI6c/EG/Dgr7HMiFaoOGn98TQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE5wigFIYexZzqr610z3T6XMrtUF5Shh0OBZO1RussbhG9cJxtE64aVKM8S+GHdf2uDBgE6
X-Received: by 2002:a05:620a:29c9:b0:7c5:5cd6:5cf2 with SMTP id af79cd13be357-7c57c7d29afmr1544210785a.17.1742210212959;
        Mon, 17 Mar 2025 04:16:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742210212; cv=none;
        d=google.com; s=arc-20240605;
        b=MudncwPr1I3vaXLe8Wtf7idpVD34oMdUqvxdZ8OG1OU6tALl1KEpny+ASwEyvJqXMv
         O6KDhmJ9wKH4RNVmsEiuTfx+Oa4BpLGViRhEhVlj2ZzqtqXmQFBXBbq+1U4KLoG6ByZc
         HHH9Ydwmno7/3oWAxyFqC/syq6t8+ZPLhhOl1Z8poqtyO58IxtXXXGfY/P9NSyugrQmg
         75v1SYmY0sIu2NK1rJPeBR1cl20t0qjmszp15pV4YPOVQgkr06V/8IlkWW3+RHtQSp+e
         Jztylvpp/sijWryzN/gIaq7CTaImV7fvcTUAxWU9C+SOppcmPZH4TIapQE+DY6/gcdfd
         l6iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:content-transfer-encoding
         :mime-version:message-id:date:subject:from:dkim-signature;
        bh=8AjyUr5UV/1dn4diFISWJ3OhQI00qD4NOFwWowWJJZA=;
        fh=u88MoWRKfIE1QYCmQOI3a+TuAb/RKYUpgrOnoknszxM=;
        b=BPWO3QbSybgICtRR1kB326nTwKL0l1Npk9sxg57lMLfi51ih73iQwCMwPr019+l0nO
         pHnJ0LxN4W6eAsj6GByt/kJfOK4mKFZGLiMyCg1cMJSYPIcxtePAdGJEQt2cUSemR0Sr
         iwgislRT9r0yxQMRfjjJYgKluKVh77Jw/ZsIhBJ70q+mhlD1ZcHXks0WuTRmuzpWPWDg
         4QLb230UGazTEYqAHZhfYRzDNoZO2GDOrxWnk4wh2SxCXnPBMASK6K1gdd50N8A8k3mh
         0hbLfKNObRtQrFMuu4dI8TjThSwRrkIDaOAJ9m0acxdcGjB738tMwpCE7nNg6fvByqR5
         KEOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=iASZ8L7A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c573cee705si650167485a.356.2025.03.17.04.16.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Mar 2025 04:16:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=iASZ8L7A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tu8SX-0003Cu-73; Mon, 17 Mar 2025 07:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tu8SR-0003Bm-5l
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 07:16:36 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tu8SO-0003k8-UG
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 07:16:34 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-226185948ffso11746355ad.0
 for <qemu-arm@nongnu.org>; Mon, 17 Mar 2025 04:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742210190; x=1742814990;
 darn=nongnu.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8AjyUr5UV/1dn4diFISWJ3OhQI00qD4NOFwWowWJJZA=;
 b=iASZ8L7AG0otoZ6vyJG5Y8am31zKpyXs9wR29Lztknjy7Y21kKTSnSkmQCjK8eqtFK
 bxWr0RRAm4knmU3MbUI3ns38UExOkMmLbbn7HSjdOcN+shJxXnGvxdUPp9J8fuyD1InU
 w24YzzucsghWOnuxZqs33RfB9JUrBBWARhpMznW+kYhceDk5a+FqV7M8ecLuuTkzt5za
 RUzUL+Obw7EAUgLh77SyHfo/dEBIIoIJ4t0Jne6zyB2shtsxLEL1JUGOwe8qwMN1vFE2
 DouHasfSTvMrSK5eC4XQ4zQ/6TdcSS17MQ/kk3qQIdsuF5D05c5wiSJrpNDGyHVq+7TO
 4s+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742210190; x=1742814990;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8AjyUr5UV/1dn4diFISWJ3OhQI00qD4NOFwWowWJJZA=;
 b=WEi+1voD09j/gMsw19+vjK6pFM/sbc6FIOUOhVDmzFaWVOu+8Wo98+qZ4/+fCDNDs9
 lJsEH75RlfQQ5aAlPc3nHCd5towKMgCKfcy2JyNrU4h/MNZx2iL+xUn8XkAaynMbKdHJ
 TWYEysDEHNqmEX2+DJ5apYa7p8xyRd92l/JYilvEMTwcFsdjMTTqRKelD1pw01+Xr7aC
 yWfVdofK9mtvm+w/gTdvAQfAb3Be85LYKt7wuRI10yWZL8D8DrOlaFpEj07aMyPUQzkB
 9Fz2DK82j+UVROY7aWZYtOIcI/z9Hm7AJcJrHETGMuS1xhpcPLH2f/jxyR3ez300uAUd
 Qn5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSjLW9kNSeZ85cC+9UB7KfcQb0necwfahdPX3wm+7CqUhPsjqk0RkYLpzcdbmmJ059guK6RqESoA==@nongnu.org
X-Gm-Message-State: AOJu0YzOoGasCq1y+y8PKkATvrZMJw5mBq0UyRZ7iLtl/Q909SS9Ra5J
 WvhQ1S1N0vGtZKpSbGtIqPnJdzZ10T41lVAoUHlDzZLdzwes+ypixSm5kJBifT/9ms1nsWv7Ui0
 L/ws=
X-Gm-Gg: ASbGncuXCzQ42i5Fvfwc2Sez/cuAyqBsHpuNWs/oVZ7ltg3ToiO/HtqNE4t+57f5Anj
 abdbeLPAC9Sqdi2ROZlkvU3wOeYnPGRhVisfNIa9W6nxdCX2GZOo7hgqBIat7NkZbhkkIOGW9dC
 Xsz2t209jvK6/aVD/aZEwzddOTdbf41v0BuPlz4c3U4cLwyR4/odlaYzdokBEZlJ0jQcejoU47n
 KEcIV657GfMIKXeVy7e2WkBk+F/9jSxyqlSzKzx2AgEOc3fn8jYKC2QwPRMdeSBTE5CSTKTKKr2
 idXfeA5iSHwm8sGymJNHehhFBuQe4VOW+lPC2yD2p8bbaVlD
X-Received: by 2002:a17:90b:1113:b0:2f9:bcd8:da33 with SMTP id
 98e67ed59e1d1-30151cef70emr12805613a91.21.1742210190578; 
 Mon, 17 Mar 2025 04:16:30 -0700 (PDT)
Received: from localhost ([157.82.207.107])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-225c68883b8sm72589135ad.15.2025.03.17.04.16.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 04:16:30 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 0/4] target/arm: Flag PMCNTENCLR with ARM_CP_NO_RAW
Date: Mon, 17 Mar 2025 20:16:21 +0900
Message-Id: <20250317-raw-v1-0-09e2dfff0e90@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIUE2GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0MT3aLEcl1DSwsLC9M0M/Mkc2MloMqCotS0zAqwKdGxtbUATdU/NlU
 AAAA=
X-Change-ID: 20250314-raw-198885f67b73
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 devel@daynix.com, Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.15-dev-edae6
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: DOEqFI0ifkWx

Supersedes: <20250314-clr-v2-1-7c7220c177c9@daynix.com>
("[PATCH v2] target/arm: Define raw write for PMU CLR registers")

A normal write to PMCNTENCLR clears written bits so it is not
appropriate for writing a raw value. This kind of situation is usually
handled by setting a raw write function, but flag the register with
ARM_CP_NO_RAW instead to workaround a problem with KVM.

KVM also has the same problem with PMINTENSET so add a comment to
note that. This register is already flagged with ARM_CP_NO_RAW.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
Akihiko Odaki (4):
      target/arm: Explicitly set ARM_CP_NO_GDB
      target/arm: Do not imply ARM_CP_NO_GDB
      target/arm: Expose PMINTENCLR to GDB
      target/arm: Flag PMCNTENCLR with ARM_CP_NO_RAW

 target/arm/cpregs.h        |   8 +-
 hw/intc/arm_gicv3_cpuif.c  | 100 +++++++++---------
 hw/intc/arm_gicv3_kvm.c    |   2 +-
 target/arm/debug_helper.c  |   2 +-
 target/arm/gdbstub.c       |   2 +-
 target/arm/helper.c        | 229 +++++++++++++++++++++++-----------------
 target/arm/tcg/tlb-insns.c | 256 +++++++++++++++++++++++++--------------------
 7 files changed, 336 insertions(+), 263 deletions(-)
---
base-commit: 825b96dbcee23d134b691fc75618b59c5f53da32
change-id: 20250314-raw-198885f67b73

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>

