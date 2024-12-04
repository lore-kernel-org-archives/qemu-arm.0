Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp489362njb;
        Wed, 4 Dec 2024 12:28:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWFf+UUCK8hVp6SOBsvlU58NN/VwVyDfO8rfy59KyCh8AdaToke+Iz+EHHzh6FAsRHgc90vTq+WTGjg/Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHRszOL2wFwEKEqnbJbZ1aBmn1655XaXuaM1N8WpSLQb3A/FGVDguUbsgPgSVg0pJjuW1FS
X-Received: by 2002:a05:620a:4050:b0:7b6:7a35:3194 with SMTP id af79cd13be357-7b6a61cb944mr844286185a.49.1733344080198;
        Wed, 04 Dec 2024 12:28:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733344080; cv=none;
        d=google.com; s=arc-20240605;
        b=Sy1UjUQ3IjVnLXco6ssyMBT3AL+O76f3JQ8bENTi//pkSW5KwWDWflOzZ3JvfFaq7o
         8T77M39/E/sFXFApoyHFkXlGtft/a2oY0lZBW5xoZ/YRWeejWsfJ8hP2oT5Ft1Zcu+cR
         ANoVl6gCzSQ2sDDWiqW5KTQx6/AwlGCF9mWbR14nvBuX+Joqi+mdbsIXPn3qaniFtAo2
         9NyztprZw6enyrWHpB/SBC7YV00llVLtz2w28LQBthW9rYSnqtv17yRc/tDF8c2KlVuF
         nQ9EuXxLvW+Qq1F8ajWNWtZhkGr3u3agohGUCnc2bLbiogFbAvQy44sEER6zgjytbRn1
         /hWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0gEXG14yGHmTwK2PkgnJuKn3fmfO28N4tNUnsroDG+o=;
        fh=EfMUgBlFvEjKY+W0rK1JC+aciYzSoJPlKkGv4CaMJts=;
        b=fjhJj9b1mlhQVkWOp5FTrh3JbMtMYr+h7H8ugRT9VBItzkvu9sXfQSQ0pRed2GWJI9
         H5pohNO2GXj82QEKn4zVWRgu5C0gqvQa+W/rflTnwcEY42K+LBzIdoBmL76ktpiF0iQm
         CxCUIOAkRWO2MWo8zMoF24ckZqVlwWHFce/Y++7XMAbH/NkG3nGivb9huS4UgYhpnX2S
         hqQ/l97IIju+WvhjE1zM8j+3sCNSiOd9N+q8bXjRGeWeoY3xQUMAjLT8UScRa87KvALQ
         Gxzd4YQV7FODpLGqgWih7q5IIjgPiZlLY7zRv/U60BCeQ3j5+xB80jDLN/PA12DOGYxV
         Tk/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Glp+Z1yU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849faebbsi73043685a.710.2024.12.04.12.28.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 12:28:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Glp+Z1yU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIvyP-0000mu-Qw; Wed, 04 Dec 2024 15:27:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvyB-0000RO-9P
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 15:27:37 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvy8-0000Mm-V4
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 15:27:35 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-434ab938e37so1475035e9.0
 for <qemu-arm@nongnu.org>; Wed, 04 Dec 2024 12:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733344051; x=1733948851; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0gEXG14yGHmTwK2PkgnJuKn3fmfO28N4tNUnsroDG+o=;
 b=Glp+Z1yU/0jga31NZn4x61NUaTQLfZabWAkdUbej0ntLhq01Qbg8L7rJYBeFC4S+s4
 w1lZsmj15fGTG2Hhiput/kT/tkpeFmGEPUyxaEu0UJMNgmxpHj+sAAUJ58hARdlrAs6e
 sTTLvzt7tULHWHMwCHs3EtCbNAL4DNP8wRrb1M8Jmw8TKjpIMuiN3W7oFZ1le9vcA5mc
 xJYvkqdbWxjBHLdRQdLjJubx1zyxwT3YamIr3k+ZCZnUJrJRVHxzJqt2dsZFzBalyigJ
 e3liYxZX1yL2hhffiui1lOvLlvS8b4P9tLFikL3T8HU/4p/Oxm0d9aHdZnFisdmOIP5w
 7NXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733344051; x=1733948851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0gEXG14yGHmTwK2PkgnJuKn3fmfO28N4tNUnsroDG+o=;
 b=SepKt1X9+6cDtTW4Val2AyYRwVwOwc4D5yFvxR3M0e7arGizVEHZVFtG15nw23XFqO
 YpPwTlY3NwvdursqYqCJRmlPtGre49lsHt/HqmDc+CHNupgYl93J4WypLNi/nqpecDgW
 bGuvEfcP8yGbjjFK41tq6UMXF3KTrG+mn13Pc2MoGlfm16VLlVKmXxZZhz4EqfVytfPg
 HC6/Q9lwDZ5NO/EYu72ep1dZHqdRxn5hom8j00p734FVprZsSp2MnaziwBwEvSs1e9hv
 omENIPFOxuiNee5dq+FYKOqHFh1M7pnweU5bttOaGtlNg811PPg3zdBOrxiHXNyqLbFg
 2XDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtwMa3NOYyZTvg4w4cpmg8E91Fn6nb3to9LPLR2mjCx6sflMaXS4xAFkxIyF2Q3Ktd4QtWUbRq1A==@nongnu.org
X-Gm-Message-State: AOJu0Yw/StUT2sj+u/GY8OqYzwVWS5tgUjH4csmdt5Sqbu5jMtxzLice
 cfzqje7iWZIWIR4srEDpJ8rgPQMS/P0crDXC1eSU67Bn8Pp+J/Y7O64IpiXOZ+0=
X-Gm-Gg: ASbGncvJlVJZfeSQrUu65GU6ggAr4dDtWCMQhwYYnwPJGfm+dpfWCWbTt61tbd0Eyn/
 xrpgeMwtd2kBhDq9Yr5kmmiSrhskeMzu+onIiXvFbcELk8v22i3C75RGwfNGI3i/M4QmH9SAQ+f
 +Zk6vZ9+2ZTnWZFyZGOuc5eILt0GAmGvLIl8gnt1L+7DJeyUz+ieey0lsKJbxYBi3+dKrUi6EfM
 qk1xF7vv7q4k1p9TRFoq5qO5SeFpvaJ0Y6DvO76I42BXt4/agYGpt3vY6zDfxeCS9K1hQWmKrhZ
 NHOUW45NSx8twtj+uXFtJYeK
X-Received: by 2002:a05:6000:1885:b0:382:5010:c8de with SMTP id
 ffacd0b85a97d-38607c164f8mr4720969f8f.46.1733344051161; 
 Wed, 04 Dec 2024 12:27:31 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385d80a77a0sm17412914f8f.58.2024.12.04.12.27.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Dec 2024 12:27:30 -0800 (PST)
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
Subject: [PATCH 09/20] target/sh4: Implement CPUClass::datapath_is_big_endian
Date: Wed,  4 Dec 2024 21:25:51 +0100
Message-ID: <20241204202602.58083-10-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204202602.58083-1-philmd@linaro.org>
References: <20241204202602.58083-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: Ri/85PHxs0XK

Implement SH4 datapath_is_big_endian() helper, returning
the 'little_endian' property set at reset.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/sh4/cpu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index f54005644c9..69108c1676e 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -29,6 +29,13 @@
 #include "fpu/softfloat-helpers.h"
 #include "tcg/tcg.h"
 
+static bool superh_cpu_datapath_is_big_endian(CPUState *cs)
+{
+    SuperHCPU *cpu = SUPERH_CPU(cs);
+
+    return !cpu->env.little_endian;
+}
+
 static void superh_cpu_set_pc(CPUState *cs, vaddr value)
 {
     SuperHCPU *cpu = SUPERH_CPU(cs);
@@ -283,6 +290,7 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
                                        &scc->parent_phases);
 
     cc->class_by_name = superh_cpu_class_by_name;
+    cc->datapath_is_big_endian = superh_cpu_datapath_is_big_endian;
     cc->has_work = superh_cpu_has_work;
     cc->mmu_index = sh4_cpu_mmu_index;
     cc->dump_state = superh_cpu_dump_state;
-- 
2.45.2

