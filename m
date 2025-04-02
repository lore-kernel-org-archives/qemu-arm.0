Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3752180njd;
        Wed, 2 Apr 2025 15:25:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXdoKGaCZC9DtU7PAmdiKJMdEJyxn45h3JUMYSsGZehchfeVJk24oBGH6tas2yJ/Dv8TpXVqkKdf7CpCw==@linaro.org
X-Google-Smtp-Source: AGHT+IESO9TlfqXwydjA4JuP15uRiqrX80/l1LUFP+iqGgvJT599+YtAytJGnvMjgkVZVJRFC5+N
X-Received: by 2002:a05:600c:3d0d:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-43db61e0584mr184565305e9.2.1743632710311;
        Wed, 02 Apr 2025 15:25:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743632710; cv=none;
        d=google.com; s=arc-20240605;
        b=GNyfTUigUgIJSoekAFD3mbmPqgx5u+wDwtwthacO4eGfsEJEDDwR/HdgP0S/XHyFis
         YzhOnPCqzSXKA1DCbx89Po8LafPgseuo6ZT//QDkfMeVrpUhfQ5Zkmmhcaw7tbZQkdfr
         rQ7gh4lyf53ym94l6mnGbfzZ9Wswalm/hekgaYlPS+3i+cMsi2wNvyBwEf3QUYAAVbOJ
         gL5EyX2+Pl3w9iR0v2NP61fUByXgJJUEJdfGUnSrRR5Jj9TuRzM0p8By6wVPFHKCa1jc
         HBXci07WZe/JtrkBBi0RF5WArfabNlYiO1QzTIjcpq68/OdRkS27YkpWXs7NlHQMa2T9
         j6rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IF+jDmIMfBmIbllVlD3DN4Sv3rGc5cOgP9Etawn2VWg=;
        fh=ILu9n9UJYyGKJ+F9rVBU1LrxK5aJ3ihMVgUEh7OR7WA=;
        b=I1fyLwzjJB98juVThJx0chBdEvQ7R+aEYaZ4TA8NdQL/C2zgyFHQ0FGerGdCiOWGzC
         ONHTvUZJ8vt3H0/Fca1paotVD7Ua0VGAI8YJt0LSaoX52NOD608o81ma0LPl6k+lhLKj
         AlLl9RRR7iIzhOOsYNrOkhA4OUtIU+TIFvy4vKnZVT5haJns/eaTRji8uWCfCohzr5UV
         /rk4N3maf/+tm4VRARnz9ASyvORN7YiJdxQEHZ5AtQ0lgFT4+xHYgDaqS3daUKztofrp
         d+9nUFrYZ5i/kBtZEf79M5qRohXtagqMXPc+Fww7Ebzej33xKHu0HInHSc//zDBS53kl
         nQnA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=loar4jw5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-43ec36acf9fsi71155e9.107.2025.04.02.15.25.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Apr 2025 15:25:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=loar4jw5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u06V4-0004ee-Gq; Wed, 02 Apr 2025 18:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u06V2-0004eO-R9
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 18:23:57 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u06V0-0002OG-1Q
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 18:23:56 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so2236405e9.2
 for <qemu-arm@nongnu.org>; Wed, 02 Apr 2025 15:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743632631; x=1744237431; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IF+jDmIMfBmIbllVlD3DN4Sv3rGc5cOgP9Etawn2VWg=;
 b=loar4jw58EKWTBXcGk6UVTnz3EzihPh2jO70PJG1zjSKDFmqcWA0072iPYnKE8/u1w
 se+CTPWwS5vDuIeah3DrxgE4OFQTFLSmEd0lz8B98rA9KUxrBhWP+z+ZPqNMBUrmGsuC
 DJOj20dt44N7PLMVxAIoR7kRcmCUCzSUtl0MgntpLRzevVq5hNouC1o64xtm4hb3i1UU
 a5PpYXJ6auf5nFXybb37l83VZrwa/wY/MI5gClZST7oFLExMLHMlW1lSZJ1Ipnf1RiCg
 HpMUltzOOEvHeou7QZMaM+DKcF/OeD3KMS8a3/gYNEG2z4TV8wymUrfAvMyvEpGEjAfx
 dxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743632631; x=1744237431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IF+jDmIMfBmIbllVlD3DN4Sv3rGc5cOgP9Etawn2VWg=;
 b=nLfNXqpkQpGj4nsCJeKfnH5rUyGnbt4/XQz0q2XWUAMDDvat+hj2GoMAZ0feJgsDzr
 LisfWYAKivHBbiV7wE0C89ST0G9YHgn8j9N0/OaIFpfCGs4A8fvywowZiKrPo9QFSJae
 RDtS15PHW0cqogO30ZovCph7Bkdyfq8HrQbq1ynB6sZjDYMP1qmLPX79qZzU2i2a1SkA
 xIrubPrRxNKzEFnOXI0jWMqrJe/b0wUHlmaCM3tTcn1XIzCZuWdzJgfQ1q9f5eCThxS9
 uBlsr75KYIL/xrP/HEomeLKu2V5OXNyDrALL772BjnMRJjuMKaVfdwYNsBXYDHT5F1xU
 wyyQ==
X-Gm-Message-State: AOJu0YyJhvLH1DhthEzJa2NLrIRXiV8F/BVqG0wZvEhWPysKvjTdwoSY
 EScPhUe+Q9Y5AbKc7R5WjTw5paPc7vlQel3puUfx3QFM3mA96seA4LcIEP1b+UY=
X-Gm-Gg: ASbGncsp9k63DcipX/k125YQ2AwD1G+NGYPm7vOzG7CrhBVKeRaugkvBHbXJP5l4iXm
 Oe4NXoEZc7rXV9DIIRDMEgBt85rXWqUn9JkaP3E19AEN8REGIqPTvB6VuI0NPO9HVIpB0I4Q0tq
 iZGxtAF8cM8DTHOcsfwbbM+Qbboo/sZECiKzcqVRB230Z99YVJpV04Zxq9udqab7++MhmOeK+a2
 TMRMugxMcB11dqIijbX93rn6Fm+BiAuguvdBqaxIm1cHeU5f/o3PrqiBbVqUx5HKxVGleZ3l89S
 2ieNGJUJZv4UAJvNfYWS6WRZB2ByOnjCsfOTVghjQQGue9+gOWuAOE8RoUgWnx4zoPPML1qgKvj
 CmYbEne8ifscVFx4Xwzk=
X-Received: by 2002:a05:6000:2706:b0:39c:1257:ccae with SMTP id
 ffacd0b85a97d-39c1257ccccmr10250004f8f.57.1743632631213; 
 Wed, 02 Apr 2025 15:23:51 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec34a895fsm407675e9.13.2025.04.02.15.23.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Apr 2025 15:23:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 03/13] target/arm/kvm: Include missing 'cpu-qom.h'
 header
Date: Thu,  3 Apr 2025 00:23:23 +0200
Message-ID: <20250402222334.66511-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250402222334.66511-1-philmd@linaro.org>
References: <20250402222334.66511-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: M2HRYnGQj6yz

ARMCPU typedef is declared in "cpu-qom.h". Include it in
order to avoid when refactoring unrelated headers:

  target/arm/kvm_arm.h:54:29: error: unknown type name 'ARMCPU'
     54 | bool write_list_to_kvmstate(ARMCPU *cpu, int level);
        |                             ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/kvm_arm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 05c3de8cd46..2db2f060e6a 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -12,6 +12,7 @@
 #define QEMU_KVM_ARM_H
 
 #include "system/kvm.h"
+#include "target/arm/cpu-qom.h"
 
 #define KVM_ARM_VGIC_V2   (1 << 0)
 #define KVM_ARM_VGIC_V3   (1 << 1)
-- 
2.47.1

