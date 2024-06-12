Received: by 2002:a17:906:6a09:b0:a6f:1bf6:7fc1 with SMTP id qw9csp242592ejc;
        Wed, 12 Jun 2024 01:16:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWdY+hx7W5lGoBthE2dZJKHV7pR3bezFxKxltWD/ywrwudteH7VUBW/Y4p/C7L/nN0FxvY8kF1xLqTqC34ieF+JkFwZtYAO
X-Google-Smtp-Source: AGHT+IHRWiDeEvdBPUv0EbGhtS17sH3vzvUpQ2ANiGGvQn8MKz7gP9ybwNoQhxNjCUa7lAlZkanz
X-Received: by 2002:a05:620a:4094:b0:794:ee2e:c8ff with SMTP id af79cd13be357-797f60e02bemr103317885a.49.1718180183434;
        Wed, 12 Jun 2024 01:16:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718180183; cv=none;
        d=google.com; s=arc-20160816;
        b=q619YZggMAlpZpZgyZkYcI5WSv/rcKfpHntYJvNRrSqVYB939eM4cInuENMKrXDDBB
         Jee/SZm94PRrZ2d6hVyO4zFRZ3s1ewHZeOjOzIJWHbqtpJ2xLCQGyfXnukzPzJ70tKv8
         7bo7ldeEx59ex5Q8bIyVv+yN3/RN5+9p/n4fuP+zUHBVOut6yc+Lyy7n5VTwcKRgKFFE
         UeuDzIr+EMjjvlwmsZDRvq1YPGGNtyoEE18qZ0EL97xqr0M4oTGxrDXJgKhoyThUBf7n
         F4MzXBEe3lte8aeCK8taf4Y0hk8T4Ksh+pByjulv4ahv6hVDwCEGZnhEzGZyMDXuzsOV
         vVdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cAY0jW33Nj782SxENctmS4bNW7VRXFYMi+Au2pU8GGg=;
        fh=TDBzvxSfdE6oPbnRjgmpeHbbsHtVpAEN4utndjBnqmU=;
        b=n9nuckDIYs4sJHqpZfb+S0nS1oulN8cyiPVDZLoNGj6+9rERhIOytGgI9Lf2pQorSL
         7p9cnM87nozzEr7GXcbYCllitQ2BKo6Qtqt0DhpxGQV60qRlK1Rf1U/JgNTTCABl/nJr
         eezEcRVJgE3ewlk8YeLVWXdsHdeA/L3DehV0wxb52GCHaF1cYC+I+bJ/Wui6aA0i6jit
         be9y/FC3JBeLPMK8SCaXxQsy2FvCjBDyShfgxkR2uZZlUQkRCA+6Y7/wRvHE7qPLkTuk
         UAGDeoJE0JS5n9y8kb7MI9s93fqrw1M/ZwSrheFylP94cASEi6rT0iNpm0ZxQwMwBmrh
         alYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=AkFChHSR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7954bc7f677si1130236485a.189.2024.06.12.01.16.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jun 2024 01:16:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=AkFChHSR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sHJ8h-0002rJ-H1; Wed, 12 Jun 2024 04:15:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sHJ8f-0002l5-Np
 for qemu-devel@nongnu.org; Wed, 12 Jun 2024 04:15:25 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sHJ8d-0006RE-No
 for qemu-devel@nongnu.org; Wed, 12 Jun 2024 04:15:25 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1f692d6e990so61548725ad.3
 for <qemu-devel@nongnu.org>; Wed, 12 Jun 2024 01:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1718180122; x=1718784922; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cAY0jW33Nj782SxENctmS4bNW7VRXFYMi+Au2pU8GGg=;
 b=AkFChHSRi9FuDXAqDe2qDD5ieYTd44LLsZ5Sml08XQezQoyaBUBucwFB5kYOVyCinF
 bHk7o90d9ajMeiWFAdegIg4F3OVxHCCZZQT1vE/YEUk+tTOzjPmtvT4GqmyoROlWU6+W
 L76ORVFZPlULW46bopTc8Pbh5wKATpSbMHHUBLT6cl+p4CzsaQEWcD+JF9tGcsHw8P4o
 6psMSWgAt6tvs4PRsiLhlFKz30tWPnfyia2B6VTIHei9ZVAYtv8Dsseop2BiJ5gT0DGQ
 llCdAKZtVQ6XlCw562lBX6A2mUgobCptAkuE5cLAVA7WAzwOmh/amDqkn1BeN3gS9UPm
 ypIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718180122; x=1718784922;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cAY0jW33Nj782SxENctmS4bNW7VRXFYMi+Au2pU8GGg=;
 b=oUnILmrIBBWKAEMIOK2txPDz4RrekqPTRZmRFc/kaRg2SQzq6vZh1j1xt0DB5jCZbJ
 q2q6/rffW1136/qEGf6SywHio93uxELihT2rqC5C9D77b1p/T1jaaPj74dZp3XVk96qS
 H/pIEPFsLfpPuIxeaRVVY9/AYtM2D4CIlT9unMlkjqozA8XYFTWwXzENm8//wmAcz1td
 K84IWtOgAxh7ktHalDsiAvKGkQYcVaTtjaFunYQHl9OMNjzO4NsSeDh4oZunCqMb8fUs
 AjZ/K6GfsaJ7BJgxRuTJahLisXQ4xPHlSZ1kT1c7XYDRMx6Y/gp4GVPyB8ZzSjgZ973M
 VK2Q==
X-Gm-Message-State: AOJu0YzJwyEAHv8NRH5Za/6h0hnTvmsws4P7vuo4E6L0iy4ETAAo14OI
 go6FEfoNcWon9woNWkJyPMYabB8gBxzF0RS7XpzIU6rkP2Htr+0trSFhFCdfjX784A7opWxQ9XG
 qRkMqyc/XRWReAchQzH1SqWS3giwjabypaPfRoAN95sxNmYJ1oMhjRS8LaaHdzcLbuDl/ijV2d6
 p0589C6K4ak2rxXypUcte+XaKgaUaTvlvKzEyjsgg8rg==
X-Received: by 2002:a17:903:234b:b0:1f7:13b1:753f with SMTP id
 d9443c01a7336-1f83b5e1de8mr13440535ad.22.1718180121827; 
 Wed, 12 Jun 2024 01:15:21 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f8393e8e53sm11363875ad.16.2024.06.12.01.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 01:15:21 -0700 (PDT)
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
Subject: [RFC PATCH 08/16] target/riscv: Allow global WG config to set WG CPU
 callbacks
Date: Wed, 12 Jun 2024 16:14:08 +0800
Message-Id: <20240612081416.29704-9-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240612081416.29704-1-jim.shu@sifive.com>
References: <20240612081416.29704-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x635.google.com
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
X-TUID: wwR6LAzg6JLJ

Some WG CPU functions depend on global WG config (like num-of-world), so
we let the global WG config device to set callbacks of a RISC-V HART.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 target/riscv/cpu.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 2d3bfedbba..50a0fba127 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -431,6 +431,10 @@ struct CPUArchState {
     uint64_t kvm_timer_state;
     uint64_t kvm_timer_frequency;
 #endif /* CONFIG_KVM */
+
+    /* machine specific WorldGuard callback */
+    void (*wg_reset)(CPURISCVState *env);
+    void (*wid_to_mem_attrs)(MemTxAttrs *attrs, uint32_t wid);
 };
 
 /*
-- 
2.17.1

