Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5071745ejc;
        Thu, 31 Aug 2023 05:58:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyDfxmhp4EahXLJWZs9L6MP6B+0xuCEfaFWEQYpO2jXLCuwzgN0VL37D5AT6TuSmI8ZVrk
X-Received: by 2002:a0c:f444:0:b0:626:b17:3b97 with SMTP id h4-20020a0cf444000000b006260b173b97mr2392016qvm.65.1693486738141;
        Thu, 31 Aug 2023 05:58:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693486738; cv=none;
        d=google.com; s=arc-20160816;
        b=IXkjHIx+EDqmzLK/xjRISS2Nk4BF87q6qK4C4o3hfIcQpa3XR/94KThvW/tJJHPFpn
         JTeBAMuCnNJBQcwQh0DfsvvtkcKw1+2thQviRX5tvxAS4s3hO5BPoME/cVv4O87hLf/c
         5R6qmXNzDySW67IqetbgALIOjgD5+iNa2pksriFpzNh9muDpGGVPjLy1b4yQmEF8ZEAs
         EYPrj+IsBj9CO6rPX+2CZVlQGBklIIHpMwrmQPuj95J0wA5ux+yuKC7YeAfWTx0gnw7y
         +i7KCnwNqm4muY2Je21xyK7ejROANdWds25jcLgZTca/4jpbTpwRaG4DJiUJoyx031Fd
         S2Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XdOtrub1S9PyK3Of9msYB/6KGqYXgpPYDD/KQybr13o=;
        fh=UEYgv4rifacS13S/IeLIl7IT/RAP0upDkvEvPrlMReE=;
        b=Hx4gxFQophqLF/aFCEiyjEJV/yWagqOY7Ozf3V6vKSnD4frbsygYR795HUcMtgUJGu
         EZEbI5tGNjhDXNUHVMgabqLBCuCvrbbVI+AGwnrhSA+JXMaDpTP0BgEelIMcR3xmPtiN
         gckAZyyUGNhN8juIWPJFnCl3p/7dyknDYy3OUJxqlWD+lQLW+cU2wMm14XyarbzQ4/Bg
         hEuq1npNSy1hT7U8NPbRRWdWhIr4RixOr3zbddIEiTeKwJOv4gJHRkJ0hZYFq278LLr2
         OCBm2Z+Re6ZBj5bHJ2w+12464kqH+OoLZ7BQmBWUZ4RgObQdDnf2IkWigWaGNKqdEcCi
         Jkhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aMhBDJp2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv10-20020a05620a1b8a00b0076d81c911a3si861699qkb.226.2023.08.31.05.58.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 05:58:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aMhBDJp2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qbhF8-0002tI-UR; Thu, 31 Aug 2023 08:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhEo-0002ef-1s
 for qemu-devel@nongnu.org; Thu, 31 Aug 2023 08:57:30 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhEg-0005CE-PT
 for qemu-devel@nongnu.org; Thu, 31 Aug 2023 08:57:29 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fbd33a57b6so6960775e9.2
 for <qemu-devel@nongnu.org>; Thu, 31 Aug 2023 05:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486639; x=1694091439; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XdOtrub1S9PyK3Of9msYB/6KGqYXgpPYDD/KQybr13o=;
 b=aMhBDJp2m1IsfWWNidkZRakyhpS0YH5OC36yEBaEA+F7V8+YPTe0YaDey/LKO+n/Sp
 1PuX4AG++droWT+ElFFWh8S4EiZuCjNFHxkf10KWLxjqYFtvkdWvUxCy/TxFF672loaU
 AD9kCUZy+uQlv+YlE0uvp70ZgEXmcjNiu+nqcJT9EhAGA2jq9YUGrTsMTqvcOlmm+Ne5
 Fz9/tgH3exrDUGc6038YRDpwAy+YC4KJRiXjUFBBCMXmjjiVonsC6GG8Z9eB2JTY3HaG
 utHmGsOm7JZWX0cmTo0CoT/9BT4C+xae7Q7ngxzSJNJM6bKt0WMIb/up912jz4J/5SDW
 ng1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486639; x=1694091439;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XdOtrub1S9PyK3Of9msYB/6KGqYXgpPYDD/KQybr13o=;
 b=RD2hu2g/JU/HPWdlMONSuEBYH6oBvMe7Chv/Xgjs1YXkn8Dr4A0pNJAvUZ6zgiEuy4
 /joGvsJirztDDkVid+ue32jhbz0/UzMsWylBhJnx/nXJwQfS5NxDzvuuuCviRzdqjR5Q
 +s2gYmtg8veT5gr6IwsxA5uweJWTflVLXYGChvcfaxtO3nieAFgVwH0qqo1nHDDYd2jA
 3ekd0qw4POdKyaJFjy/PdBVfvpR2UQRsgI7adgvBYQTrtkslPGpdgztdMyLkQinCIr/w
 rDA5PnRe0sE4FZPUsvNneeccfCiFmx9FZpRsOVz4C1PXFKVW/1xdin0iRMcRCnc+uN51
 avIw==
X-Gm-Message-State: AOJu0YwwzXgOM8Qy8cTk7JqE210YLuHn9tJLEbJZa1z/zi64VNl6XmtN
 I8QX1jMod2UXc8xqGymg6fQwwq7NJin8qfimmjg=
X-Received: by 2002:adf:dc8b:0:b0:31a:dd55:e69c with SMTP id
 r11-20020adfdc8b000000b0031add55e69cmr4260280wrj.60.1693486638982; 
 Thu, 31 Aug 2023 05:57:18 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a5d5945000000b003197a4b0f68sm2186305wri.7.2023.08.31.05.57.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:57:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 05/41] hw/net/i82596: Include missing 'exec/address-spaces.h'
 header
Date: Thu, 31 Aug 2023 14:56:07 +0200
Message-ID: <20230831125646.67855-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
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
X-TUID: aPxy97lgKQJS

hw/net/i82596.c access the global 'address_space_memory'
calling the ld/st_phys() API. address_space_memory is
declared in "exec/address-spaces.h". Currently this header
is indirectly pulled in via another header. Explicitly include
it to avoid when refactoring unrelated headers:

  hw/net/i82596.c:91:23: error: use of undeclared identifier 'address_space_memory'; did you mean 'address_space_destroy'?
    return ldub_phys(&address_space_memory, addr);
                      ^~~~~~~~~~~~~~~~~~~~
                      address_space_destroy

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230619074153.44268-2-philmd@linaro.org>
---
 hw/net/i82596.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/net/i82596.c b/hw/net/i82596.c
index ab26f8bea1..6defa9d3a1 100644
--- a/hw/net/i82596.c
+++ b/hw/net/i82596.c
@@ -15,6 +15,7 @@
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
+#include "exec/address-spaces.h"
 #include "qemu/module.h"
 #include "trace.h"
 #include "i82596.h"
-- 
2.41.0

