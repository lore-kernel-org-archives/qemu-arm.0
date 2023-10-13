Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1531891ejc;
        Fri, 13 Oct 2023 07:04:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFfIe5UC2P2yguF5EfqN7DyvynxDBSMuwKw8nKUt7eJ9yUTmrMJjAvLiR730CKOv4IgPvJ
X-Received: by 2002:a05:620a:454c:b0:773:b623:72f7 with SMTP id u12-20020a05620a454c00b00773b62372f7mr36645430qkp.50.1697205872681;
        Fri, 13 Oct 2023 07:04:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697205872; cv=none;
        d=google.com; s=arc-20160816;
        b=OPHFHBM/L7GcsCjZiW4HRGw0BHfjagReKcUa6EJFOEub6LvJxE7lCdswCU/OTdh1sO
         GPs50dYuEscVWtjb2mktjMqeocKv9f5/oLtkMbKV1yI5/XzesoOkq6KbVPeIWr2xiE7Z
         uJYjeIUhjDtA4HvfGGOEE/2+LSBA/U/0tMmpa+oy8437pEnnSNqxNTQ586RU3h6gJiRA
         6Lzcw76O6fHr+8U2Fp3o+9v8PB2bCfHHEt1GJn+E4NHHHYcUstNrnEbX4ODYlEUSsrJS
         SY3lAbeesUQvOWulELU7LHDgRJD8DxymjgPbUAIxXqER1fAYRESoYZasvkc6EH2yk/tX
         47jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JYQqRVLJAhl+fLy6uRokDviZ+oqxKbk/XYiufUYaTEA=;
        fh=yvC9ZPM7MgJn7Xb0eJwxiCf2t+VfzDAYAfYYKFMFkpQ=;
        b=jdQxffGG/gViLhA5iTmsWnoV7siUM4NOIgVgGi4HXu8tm3unX4DDpG+6iKkbZ1RZGp
         EFfywQrcrNdib33ySleiHY4V4Iv3N/7DTBk6laQbzWRPis/1U5kvAWjhcZuq3nD8ZiQV
         upu/AsXGMi35h2SOSFxrEpEImtteN/WLbWu+MsQOgqyGaiBTazAoqtuqh6DCFyQkr7e1
         zSB7AbBHi8jHP+fG8/eAY6j82ekOTwVbZjT/0dsZSUiZBfcGWmfXgayAXTW4Oa8+z4nz
         2okCU/DCdiiAEIjTcwffx+/yo1wE4PPkLb2DHbx6d2f6BrTyOqSd1sV5hY/hHOuzLsRZ
         Bn/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x5l8X0P0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az44-20020a05620a172c00b0076da8b217e9si1286318qkb.694.2023.10.13.07.04.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 07:04:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x5l8X0P0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrImE-0002vE-5z; Fri, 13 Oct 2023 10:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIk3-00073J-Mc
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 10:02:18 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIk1-0002Gv-AD
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 10:02:15 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-53de0d1dc46so3745935a12.3
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 07:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697205731; x=1697810531; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JYQqRVLJAhl+fLy6uRokDviZ+oqxKbk/XYiufUYaTEA=;
 b=x5l8X0P0l/Cor98f2sOCwAdc2voDBWfXl8s5Gr0zrLLKKQloUwdw9H54dkjQMxIsNr
 +eJqr9nCL6eGebZc3qRwBBEu6r8TsfluDiIefltNzCH0JatvKy8dngM9cCvn0RNdQMT4
 4AMwIrOW2PfGb+mgclSHTcO5oA0LL9KIQhiYFs0H6NhKj5Omlplvb44lQJ5TSvaX8fFT
 ydZDrZW4rznJT3Ex6JroiDQHGlYEzUwjCILYc1PYSlmVLkLM4pPAC1a3UrbVgMF6M5vc
 sy9yeeb0JuSjwoZs8+U7yL7fSc33qo1qYT8mPts3H4HpA/oHIoDFMsGOrSn3a6ScsA9E
 QIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697205731; x=1697810531;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JYQqRVLJAhl+fLy6uRokDviZ+oqxKbk/XYiufUYaTEA=;
 b=BsDgv0qNHV29nrrcH7LxICBJBRwJKpsD1249M2tFFzTyOCJOqpRjXuiedlKacGk/I4
 d9zUXho+ME3IRrWJyGuiEZ7lpGfizuotIMgd1m7iHDkjAtRP0sR9Nc1Z4cGjMjYine0w
 U1LLOSBwJ0VZ/zy0LEytOHDvl3n3edasSb+WwqQbRhDLiYvEpbnbJ2UFpN6+96coBvT9
 K5X5GRqtn29RALoGgQbPXY6uLtSPcPPVIhp9FJm0anSoi+b+sZYZZNH0Mz6dhyEMlIs1
 L+VYRWH8Lak1m8eoCaXHhG/8laTr7hTyd1X6RxsHycER0aEUlUy/X0SC9oUxE1K6yTdt
 2KNg==
X-Gm-Message-State: AOJu0YwJY/PqKe/tPG0dUQ5WRUfPc4/hcyF1i4+1KkSVankv+cW2tAIe
 FnpSqNqWZ2QpvYJrZD5t8SkBYw==
X-Received: by 2002:a05:6402:751:b0:532:c41d:1dcd with SMTP id
 p17-20020a056402075100b00532c41d1dcdmr21618936edy.25.1697205730984; 
 Fri, 13 Oct 2023 07:02:10 -0700 (PDT)
Received: from m1x-phil.lan ([176.172.118.168])
 by smtp.gmail.com with ESMTPSA id
 v18-20020aa7d652000000b00533dad8a9c5sm11513550edr.38.2023.10.13.07.02.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Oct 2023 07:02:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yanan Wang <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Marek Vasut <marex@denx.de>,
 Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH v2 05/16] target/riscv: Remove CPU_RESOLVING_TYPE from
 'cpu-qom.h'
Date: Fri, 13 Oct 2023 16:01:04 +0200
Message-ID: <20231013140116.255-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013140116.255-1-philmd@linaro.org>
References: <20231013140116.255-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x530.google.com
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
X-TUID: vsYfFc6tndXB

CPU_RESOLVING_TYPE is a per-target definition, and is
irrelevant for other targets. Move it to "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu-qom.h | 1 -
 target/riscv/cpu.h     | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index b9164a8e5b..b78169093f 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -27,7 +27,6 @@
 
 #define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
 #define RISCV_CPU_TYPE_NAME(name) (name RISCV_CPU_TYPE_SUFFIX)
-#define CPU_RESOLVING_TYPE TYPE_RISCV_CPU
 
 #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
 #define TYPE_RISCV_CPU_MAX              RISCV_CPU_TYPE_NAME("max")
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f0dc257a75..144cc94cce 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -32,6 +32,8 @@
 #include "qapi/qapi-types-common.h"
 #include "cpu-qom.h"
 
+#define CPU_RESOLVING_TYPE TYPE_RISCV_CPU
+
 #define TCG_GUEST_DEFAULT_MO 0
 
 /*
-- 
2.41.0

