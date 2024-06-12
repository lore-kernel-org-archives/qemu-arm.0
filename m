Received: by 2002:a17:906:6a09:b0:a6f:1bf6:7fc1 with SMTP id qw9csp242608ejc;
        Wed, 12 Jun 2024 01:16:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXDYEPyPrhf+PeHnW/3UHQg82n9umafp/KCgjECvrdsEDcdiZjZlGTwdfwhuO09Agd80sGI/LNO78a+SLDzD0uuo9bMO2lG
X-Google-Smtp-Source: AGHT+IEabGZGpneKZSf9Sv6vIfNdimKsY6PXgQhkFV9Gk/938aUMvNVz+ApwVMsBbJ+rkqJuCQWk
X-Received: by 2002:a05:620a:410b:b0:795:4a3b:3c16 with SMTP id af79cd13be357-797f60c0500mr111776085a.48.1718180185706;
        Wed, 12 Jun 2024 01:16:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718180185; cv=none;
        d=google.com; s=arc-20160816;
        b=gLvHH0ynptQqbOb5Jifz8pTiPpNUp4+bx0mrGvAQF0AVPi+HKL5aY82xM2C73b7uNV
         h4irVe6j/zDeEZDzps3AEbquF+s22m3TUnbfvuhYjYreLvcKK61HttiNnxW6LoOCLTnm
         XrWWV5jRVB2Zqet8+BRdAIIeO5+SwlOi9e5QEo5XhQ00iBB8l1yhn3E4b7n9ZxXhTtSk
         uG348+E3XmEJc7NL8yS8sLl9fCDur8lIGbDzJkIyIBsVozpc2KRx+neJ0AyeNbCATa/h
         LQxcz2YsXqfOZG+Yvy7tZ+KpoFMsboBTqGMmaVAOV9nNlVj8QHBozwYzsYzBSTRBDVqG
         dIhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=N1D0EBwsV6VQtcv780/DUEjjt7vhGVA63Te3ctWhZfA=;
        fh=TDBzvxSfdE6oPbnRjgmpeHbbsHtVpAEN4utndjBnqmU=;
        b=C4rR37CiaGNDc7lpf3FMkug7CdZ7MdwmSuYkiDUQEl1bjnUgNiD7qOBHHLODg0kxFG
         E8op9fRTIEz85FprqhqHF3Hk3jzpAw/vvr9oxRYI1JI026p4aD7s1G8auRFc+zMFoiNv
         WEuQdKT68S+j69AIUVHQHFxFd1dHYwTiEQ8P0cys232UC5gUx8jcMWPAUQD9DBBSKVDs
         6bxlxegQ929UJlAQh+DC2bpWRHWMocWLyj9aZyuyiK+b7nva7lsf8phLTJz/9itW0BtZ
         +bsKK4DYHCXKTUrXwJdVtleOl8/BT7geEJxvme0NWgaPQTsyS1iR0GtHdylgJJDcm1lJ
         1EaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=mti9qCRs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79558be283csi944878385a.291.2024.06.12.01.16.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jun 2024 01:16:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=mti9qCRs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sHJ8E-0002Fu-M8; Wed, 12 Jun 2024 04:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sHJ8D-0002Es-BF
 for qemu-devel@nongnu.org; Wed, 12 Jun 2024 04:14:57 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sHJ8B-0006JY-Fi
 for qemu-devel@nongnu.org; Wed, 12 Jun 2024 04:14:57 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1f64ecb1766so50546675ad.1
 for <qemu-devel@nongnu.org>; Wed, 12 Jun 2024 01:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1718180093; x=1718784893; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=N1D0EBwsV6VQtcv780/DUEjjt7vhGVA63Te3ctWhZfA=;
 b=mti9qCRsNJmelYIZR/D/m3ezfW3mxqAD7hGR4vnie+B3dDRqxjcd0XSWdzAPcAjl8h
 /ALR2RQHk3Oaxb7nqqmovjpBQw5GfCAd8Xchpn+SRwNFY+uc9IlnaSvDi0eM11N14vZN
 j23lYgRUCgci6ihTZS3lRHmmfRWDLYP/F8I7/mMT2BZVYm7JtPID2TEMUJ42aa0T0g56
 88KnZMyspzaDVC+Nf7ZTHp1dqBZVOf/w4fxoAgqEACVQm6F2CLCwkN8GHJs4FCqEWgVc
 Crj5WOC3cJMb7nduWEGSrGUiUoCyvQ7lTHKlRC+xjzj6yd6pW7d7k/Xn85PDHu8AfS22
 LbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718180093; x=1718784893;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N1D0EBwsV6VQtcv780/DUEjjt7vhGVA63Te3ctWhZfA=;
 b=wmO8+I0EszqRm61dL8VvULxMc+3xjfVoJxc//77maJVKPAQNAAWF01MTBBeyh+iN3I
 aL7avKYWbt5vBvaPTkV+htgt8AHhokUAM4Dhh85PQt5yPGb61+sQUMoRg+PJS/xdcYBg
 4xT8KGHIHRBQgfYRz8DiF7ugjDsfGzdRsbaHw0gAkwqMawgvGBCJRAmdqjtOw/dLP/+M
 g8246ofP4cIvNwgplHGXZNy/Wx210jzlEN/6sEbvBYEuvGl+rMxdEUW1MWD5fxy9CADC
 ZPf8sOdpwFVbDBHQtyaJsi+9IoIsTPLKF6lAAn6mCaY+Gv37hVT3nR8KBiNCaWGm5LwM
 gQ2g==
X-Gm-Message-State: AOJu0YznfUOTxWVMAzgF7VJio5+ijKAhIxNKbmhBdsWL89x15Hx+V5GZ
 oa9kPfMAWQrCzDDx9LKZN5/qxd7T6PihzRtXbMM50S18CB/AtIfLaNOLTPFZIgNjafzueVCfi8m
 0mBzFFWruqV1osFqwMurxN1raWkscLbmRdJfMtULE3mDtJuiJLA5y1LA3oVdTvf2oNl+AMKemTk
 qivU+AGf61s7Ucs8aRu+W4pCqBfh3LPVYGNeLPDy37xA==
X-Received: by 2002:a17:902:cf08:b0:1f4:71ef:98f8 with SMTP id
 d9443c01a7336-1f83b6990aemr11303805ad.16.1718180093024; 
 Wed, 12 Jun 2024 01:14:53 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f8393e8e53sm11363875ad.16.2024.06.12.01.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 01:14:52 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs),
 qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs),
 Jim Shu <jim.shu@sifive.com>
Subject: [RFC PATCH 03/16] exec: Add RISC-V WorldGuard WID to MemTxAttrs
Date: Wed, 12 Jun 2024 16:14:03 +0800
Message-Id: <20240612081416.29704-4-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240612081416.29704-1-jim.shu@sifive.com>
References: <20240612081416.29704-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: b6vbeyLMulWy

RISC-V WorldGuard will add 5-bit world_id (WID) to the each memory
transaction on the bus. The wgChecker in front of RAM or peripherals
MMIO could do the access control based on the WID. It is similar to ARM
TrustZone NS bit, but the WID is 5-bit.

The common implementation of WID is AXI4 AxUSER signal.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 include/exec/memattrs.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 14cdd8d582..d00f3c5500 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -52,6 +52,11 @@ typedef struct MemTxAttrs {
     unsigned int memory:1;
     /* Requester ID (for MSI for example) */
     unsigned int requester_id:16;
+
+    /*
+     * RISC-V WorldGuard: the 5-bit WID of memory access.
+     */
+    uint8_t world_id;
 } MemTxAttrs;
 
 /* Bus masters which don't specify any attributes will get this,
-- 
2.17.1

