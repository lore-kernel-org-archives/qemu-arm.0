Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1530712ejc;
        Fri, 13 Oct 2023 07:03:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhs4w4DcqjwCLDO48emDHVVV8KiWwbSUFn2aBgnDnwQrdfUL+z67joEkDf9jkjmF1WwT1+
X-Received: by 2002:a05:620a:408a:b0:773:cbe0:ed30 with SMTP id f10-20020a05620a408a00b00773cbe0ed30mr31356138qko.3.1697205787553;
        Fri, 13 Oct 2023 07:03:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697205787; cv=none;
        d=google.com; s=arc-20160816;
        b=ESGmNLZ1zAb1IFZwrje2WZYChnksOLan5ION+zqD50Y3zRdPIKxV8cQkm4ne88cJJg
         mfoKZgO3cI5nX7Dpb41S8Rl2o8V9L6pxrcT+ONESOnCQctr9vJudxTPyUxjxKmuHLNEe
         VtoKPIRq6iVkXUT451KpBK5w2DE3q6RxIEOBfoQiTURD0clLL2//lOMeCqn5yGM3O4xx
         gLQrjDfJCw7Dv8dR/E75TZ2tWHF0Hn4RqbAdq9/1gJwBWF0EM30jbcnY6yRXw7RR+15Z
         KKEBinnagOtl8n0z669liR9AYYEJX0/SbSwCMS3DxnXz6+rkpRMLQ53+WfYHNQviZRjX
         8K+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Z+CI7CNyKCf2sfXCVGyXf+Xiyom2vjAqTqQsK0XbX6w=;
        fh=yvC9ZPM7MgJn7Xb0eJwxiCf2t+VfzDAYAfYYKFMFkpQ=;
        b=AUxVUIc5I3c2PZ6UFqtgAB7W/DA/VshkJhfUoo4KvvxQ6JNt2Cvx3zZKIWuYo9Lo6U
         piXOpBfDOli8PlOirel12xFeK0EZgwMXoUO8pdTXzsnpoDXRJZOu1oTqJk2czso8cKdQ
         WlUfeY8nkfZnNAxsyLJu5VpehAHUK9hyjg5Q3IoZaRVMZM0tLnMaKR9OmNY1Kd5xdq21
         vs2zyHT1v2TR/gGPGa6lFyJcfU6nQK1hRLaLKOuWSEIve2NgBtNFv+U04mwzXC5nh/R+
         nMu6PwTmPtLoVySysU2XMqfzzWRAcQU3IdZtLoMaKoLshpasstILZcH17UovyHayYjBo
         Eb3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nowTJDg9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8-20020a0cecc8000000b0064f4589991esi1198097qvq.320.2023.10.13.07.03.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 07:03:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nowTJDg9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrIjq-0006Xe-DS; Fri, 13 Oct 2023 10:02:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIjc-0006S0-Ig
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 10:01:49 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIjX-0002Aj-Q7
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 10:01:46 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9adca291f99so323827466b.2
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 07:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697205701; x=1697810501; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z+CI7CNyKCf2sfXCVGyXf+Xiyom2vjAqTqQsK0XbX6w=;
 b=nowTJDg9NcxmTpuC0/w7EgLvglrQnzph7vT6J/2/slCKQYRdHfJcN9LbR8RevKdkA1
 S+YGrSJ52vrmkfBNHfa7TaQByF1V5YnPgiURJVYrUblg/BfMliSzysbxa75wqgK/WBLp
 DgksGD+QHGqtyrjaPj2FZL//aXdv6NhnbGAY0GQPXP9qyr3+9UE86St4SCUfACRLUpDf
 SMzeBgqNJXAvrBDqvaARKNLFYA5AnAqjzS0D8oo8H3J81xELlm8UxkBJAzaPiuH6Lloy
 EBOw4/b4aq1U6v/GjHZlwwDmubRcd+Bwis18mNPIAqXr/RSKjb1n8Pn8k11qtfg/5XWM
 ZSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697205701; x=1697810501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z+CI7CNyKCf2sfXCVGyXf+Xiyom2vjAqTqQsK0XbX6w=;
 b=UoL4Cw2vDLkbOiSmVU7JCohL45EA+4nYhk/aXrLJQgfSWHoHpSRjaq7dild2BLBwDY
 B/VbFh5axjSvsqGniXbl5sd3Qlv8D2DloudEbRUKCZoo78IV6WDcv0WNxpJ4IxfAGp7n
 1kL5q0cRp301g1WBCeyS0rCP/cL+p2G5sA9sp05XieTSTsV5V29+mVJzVpLRBX5M1Tlo
 sj/Pm8CPNTVldJB7ERbJ0wr1BS35GjZa57Qo6JDoxQm8YPAbwjhqTvIXXoSre/Mx2jGa
 3JvP27hsIpLz4w5svDyyg+LL36MF/BYiGF8hyPtPLef5CB9Qq1+YhtHBQcH3lo9WliQC
 C/Lg==
X-Gm-Message-State: AOJu0Yw6eCp4YUaE47A0u3tgIygNxjNKHz9ihDAT3KkHi2uDqqXHf0EK
 eWT4/lNEnHWxHgnJZXRi6gqp5w==
X-Received: by 2002:a17:907:2d25:b0:9bd:d405:4e7e with SMTP id
 gs37-20020a1709072d2500b009bdd4054e7emr1060527ejc.6.1697205701761; 
 Fri, 13 Oct 2023 07:01:41 -0700 (PDT)
Received: from m1x-phil.lan ([176.172.118.168])
 by smtp.gmail.com with ESMTPSA id
 t24-20020a1709066bd800b009b29668fce7sm12367817ejs.113.2023.10.13.07.01.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Oct 2023 07:01:41 -0700 (PDT)
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
Subject: [PATCH v2 02/16] target: Mention 'cpu-qom.h' is target agnostic
Date: Fri, 13 Oct 2023 16:01:01 +0200
Message-ID: <20231013140116.255-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013140116.255-1-philmd@linaro.org>
References: <20231013140116.255-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
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
X-TUID: rkNj2Ik6SUjY

"target/foo/cpu-qom.h" is supposed to be target agnostic
(include-able by any target). Add such mention in the
header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-qom.h        | 2 +-
 target/hppa/cpu-qom.h       | 2 +-
 target/microblaze/cpu-qom.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 153865d1bb..dfb9d5b827 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * QEMU ARM CPU
+ * QEMU ARM CPU QOM header (target agnostic)
  *
  * Copyright (c) 2012 SUSE LINUX Products GmbH
  *
diff --git a/target/hppa/cpu-qom.h b/target/hppa/cpu-qom.h
index 67f12422c4..4b1d48f7ca 100644
--- a/target/hppa/cpu-qom.h
+++ b/target/hppa/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * QEMU HPPA CPU
+ * QEMU HPPA CPU QOM header (target agnostic)
  *
  * Copyright (c) 2016 Richard Henderson <rth@twiddle.net>
  *
diff --git a/target/microblaze/cpu-qom.h b/target/microblaze/cpu-qom.h
index 2a734e644d..78f549b57d 100644
--- a/target/microblaze/cpu-qom.h
+++ b/target/microblaze/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * QEMU MicroBlaze CPU
+ * QEMU MicroBlaze CPU QOM header (target agnostic)
  *
  * Copyright (c) 2012 SUSE LINUX Products GmbH
  *
-- 
2.41.0

