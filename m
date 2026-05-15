Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D6ACD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:27:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtU6-0005fu-RT; Fri, 15 May 2026 10:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNtU2-0005d4-5Q
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:25:46 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNtU0-0000ts-JK
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:25:45 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so152984405e9.2
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778855143; x=1779459943; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=q4fgK36sSo3TBVry93HVuy8ilXSmIn8bEO/5kIWJOSo=;
 b=EJ6F1QcW7MeuisgOqsUkgDKNzjVnK9HsvPxIMc0sVtkfqO6LeirQlYekLld7S+MPSy
 f9Z7UaFDfNIOJt9DvdOdBGWY+/nsTQ6nFYbWE4ozkpRRkczao7H2it46BjECCkUob59K
 6Sc6UjGeld6JOXdsLKuRy33JYD6Mt40vjTqJ3q9quqT7RVDGClakbhtpCm9oQ5Kp46/A
 i1CXhkjVV7rs5pDNUgr3OOK7CIjjqNoxo4ndpI1qbzw4b+GF8tLljFJKiiomvYbB2qoT
 dhoN1yIo/JItt/Rm/aZb+ZhiEmPX/b1F/DaqV2fLM/EHGduQ7Pvt0JVulj22aPG2uzxJ
 h86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778855143; x=1779459943;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q4fgK36sSo3TBVry93HVuy8ilXSmIn8bEO/5kIWJOSo=;
 b=GWzJmUyhvCK3YUtukDAmA9szF5MHb8AxNvARAda+qTGgIh83gk1ex98iL2gKWQ7vl7
 6f6cFtijTTdo9YaQRxkYxToZYJ3gJW9pQb9bSekGXaA+ipORVVZ+9VpUssFMM6zt5obG
 HfhrOCsarR3dDYIC0S6jsPxNtNnoxajSCfpERYWhSZIAROEpFKZkVZJco+5OZa/MXriG
 eBfECNvTwbw82GsjbH1rRP3cCWNaSCyXgeaXAGQRRXtoK4znRtepqoqAKuuJVtEmLRob
 Jw+BRkec2fy52eU01JHUJjPeN7IFTTnDVKJAquyu+qpIaUPTZXQHU6NigWZKiiQb9/lh
 bsww==
X-Gm-Message-State: AOJu0YwFyQJAS8vqzm+nEhcxpttJ2201W5WyPrlyvtkyvqRWeldzvHVM
 SEUAfs2GO229fip0od5t5J4g6ZqX61WWUeGctFg/maMp2LRXDV6m2uKwgSrD5U+1IcnTveiwiAT
 cn0Tp
X-Gm-Gg: Acq92OFztKUBFIpbPRbW5GA/N6D7k8dQvx/YA+DfACN+s18mY1vVzu2W9vMSPoIpkhc
 hdDUN5wdDXt4DIgtjMCrlPBfZ2b6DhtpCkxYce9gV5T5+mPRP8fY/2EAOtZplFDROee0m2/gqx1
 cp+5UCG5o9gKGqptb+S25MBIq4z0MWVRZd1EBjhHbGQJrCQxW2Bk0zTITuhIbuxQYWEpJLqbKQ/
 AbWbq9Zx93EdVSd2OsTIzUbAnn89Ek+cuT7zYXqhYcNDWont1GQH/mTL7AjLeBDvrjvTSb09C+x
 rWJf23dA8IFcxSSECJ31AnNMAR9lVkR5dntxyScjDEtuI2BHiKAuJ63f/NWe+jO7dA4rnE1HhbB
 brNuwY6HVE+2l6whot0oC3e1kvWyBWPNSPQR5/Ye2ayh1ZeVJv4x6g4yT9vPcrj0qKu1Aia3E6W
 Eqa/9dy131GGPrdeu/IsXkSE8zgcWlNqxtX6OjS5bAjUqk9FvlLXEZXdvFv8fNEzoHbB7sdrJW/
 UN9XNkZczVSIM8AFequv0Z9rl+4MipugAcODKWvUQ==
X-Received: by 2002:a05:600c:8b18:b0:485:3b9e:caa7 with SMTP id
 5b1f17b1804b1-48fe6515983mr64148455e9.23.1778855143144; 
 Fri, 15 May 2026 07:25:43 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da15a666fsm13560603f8f.36.2026.05.15.07.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 07:25:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 00/14] target/arm/ptw: Flip sense of get_phys_addr*
 function return values
Date: Fri, 15 May 2026 15:25:27 +0100
Message-ID: <20260515142541.571911-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This patchset changes all the get_phys_addr* functions in the arm
page-table-walk code so that instead of "return true on translation
failure, false on success" they are "return true on success, false on
failure". This convention seems more intuitive and it matches the
sense we use for the translate_for_debug and tlb_fill_align methods.

I've marked it RFC for two reasons:
(1) I'm on the fence about whether the upheaval is worth it; I
think on balance yes, especially now I've done the work, but
you could argue the other way
(2) I'm open to suggestions of whether the patchset could
be better structured for review

On point 2: I opted to convert one function at a time, on the theory
that you can then review each patch by checking (a) are all the
function's callsites updated to invert the sense of the return value
(b) do all the "return" statements in the function change.  It does
mean that the patchset has a lot of places where we add a "!" logical
NOT and then remove it again at a later point in the patchset.

thanks
-- PMM

Peter Maydell (14):
  target/arm/ptw: Flip sense of get_phys_addr_disabled return value
  target/arm/ptw: Flip sense of get_phys_addr_lpae return value
  target/arm/ptw: Flip sense of get_phys_addr_v6 return value
  target/arm/ptw: Flip sense of get_phys_addr_v5 return value
  target/arm/ptw: Flip sense of get_phys_addr_psmav5 return value
  target/arm/ptw: Flip sense of get_phys_addr_pmsav7 return value
  target/arm/ptw: Flip sense of get_phys_addr_pmsav8 return value
  target/arm/ptw: Flip sense of pmsav8_mpu_lookup return value
  target/arm/ptw: Flip sense of get_phys_addr_twostage return value
  target/arm/ptw: Flip sense of get_phys_addr_nogpc return value
  target/arm/ptw: Flip sense of get_phys_addr_gpc return value
  target/arm/ptw: Flip sense of arm_cpu_get_phys_addr return value
  target/arm/ptw: Flip sense of get_phys_addr_for_at return value
  target/arm/ptw: Flip sense of get_phys_addr return value

 target/arm/internals.h      |  4 +-
 target/arm/ptw.c            | 82 ++++++++++++++++++-------------------
 target/arm/tcg/cpregs-at.c  | 12 +++---
 target/arm/tcg/m_helper.c   |  8 ++--
 target/arm/tcg/tlb_helper.c |  6 +--
 5 files changed, 55 insertions(+), 57 deletions(-)

-- 
2.43.0


