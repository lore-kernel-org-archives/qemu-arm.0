Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7952C982F0
	for <qemu-arm@archiver.kernel.org>; Fri, 16 Jan 2026 18:59:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vgp25-0001K5-7Y; Fri, 16 Jan 2026 13:58:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vgp22-0001Im-MC
 for qemu-arm@nongnu.org; Fri, 16 Jan 2026 13:58:50 -0500
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vgp1z-0000ik-K9
 for qemu-arm@nongnu.org; Fri, 16 Jan 2026 13:58:50 -0500
Received: by mail-dy1-x132a.google.com with SMTP id
 5a478bee46e88-2b6bb644e8eso1792504eec.1
 for <qemu-arm@nongnu.org>; Fri, 16 Jan 2026 10:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768589925; x=1769194725; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DS0knvNd8W2ZcuFUx5T6BmLlPwXKP70beT+w9coo5GY=;
 b=l4M4m9UJPMwsb/wg8Js6gh9XjMA3799dmdTt+RG5TomBDwU9vJXnUZYo95YbUPFEIx
 tixvK2kiMpC3IA5uU3PyoMwAfkE7SU2B6jhl32WrB5EQGMt8rxiKSmcNWYF7iGmmwGYI
 HBuKHcU4J14Qaqo0iBZKNsOjj1VpCkAhpIa7INqlaHcobKYQbAEOvMTh66fLyFOuoAw7
 Hli2VyknCzojpOjUHumZmsZ5x79tbU3dvv/znC9JVRA5WBtsCP2Ejb6wnIc4AbaNCsP2
 RUtuneaXnzA61ZNxS8fMdYFioI0oiUv5peSqhZd8iUh+0D2sfOeSNGyFZZXXl5zyAmuv
 rLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768589925; x=1769194725;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DS0knvNd8W2ZcuFUx5T6BmLlPwXKP70beT+w9coo5GY=;
 b=uLsOE/9iCYAOBda+l9fKaM8JJdmF50/h+9Oic64PsaQhmkj+gOrUsWJZM+TFRVSWD2
 JqAjYfeAMv42Xq5vRUzB6bL/gXdURWu9ac9fOEft3j/ZcH20Mx3xsOjkvFGi8cudHBQW
 4WxWwRBTrzVJqxUtyAie/jYx/seusq5nltiraDMzTzHvMzoEXYpRSinbBd1+CD878OvR
 W4Ywy8Qpb8j57jrHx9Wsx6wR67ybftaKFcysi4WFq9HVkTmO31EhYlaeTGHv7L92TEd6
 SwrnXZjE1tzplthoQ3X1qDlr7/KR8MVTEP8JVd2Ao8piqWaX2/Z6uIUNaemImYQ08bIu
 hNOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKjXfDUMcSKiecHk8MeKROJE1ZnwquWw1bamtsOQx6BCPFJgPjtZZhbL2CTFjklS4wNRyjSyOY5Q==@nongnu.org
X-Gm-Message-State: AOJu0YwA+xVwiY5yI+nTKz00wTOjYK7/hCKMr821lXpeib6jVlPkS6ms
 h101W5wTJFRzB/CYCBAcc1f2g6+k7Q/9W7LChJT0sK1BWuvsXs0euUAiDxHjP9NYcz8=
X-Gm-Gg: AY/fxX4VWvB42Tso9BchASJCahQNIcqoQjRKNC/dkJcVfvJIJ99PfmzfGZquA4XOJ9X
 1yE5x3gNS+apviP5vhh8sJtJkVJ7T2J7udAjZ7TwXWPKtzYV8FHrVB7F75JFDhynOXQDxkofEa0
 CcRVJzjWb11qP3h4rjQ0l6UKaP0aHHiRNlcXhC3GH2abiKMF24xiC8tm2KHN+jikTJ06DX2aefa
 RxQQ7RyUr6w6U2xC06oAgsBJySdoE8Cgc6sdy0oUVYFftm+vmwRMz6nHnDf0Uv7r+OKETY0Ydfq
 90Y/5VVTEdnxoLDgouCw85xF4T1kFU1F7lsW3EBgswdjoBXMF02E4RjtgYcnHqgZIBYEHf9Oghm
 bbjZ8laNAPZlw0d7LpCnbHCbpn++VEMsQAeSpet/PpcaVv+/VrVTg4WcmHGd3pab+6Ide1z8rxK
 MxiOu3DtjGa9ageg==
X-Received: by 2002:a05:7300:50a:b0:2b0:52ac:92fe with SMTP id
 5a478bee46e88-2b6b410053emr3629915eec.21.1768589923328; 
 Fri, 16 Jan 2026 10:58:43 -0800 (PST)
Received: from gromero0.. ([191.8.214.17]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b6c2de1f29sm1524126eec.15.2026.01.16.10.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 10:58:43 -0800 (PST)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, philmd@linaro.org, peter.maydell@linaro.org
Cc: gustavo.romero@linaro.org
Subject: [PATCH v4 0/4] system/physmem: Enhance the Address Space API
Date: Fri, 16 Jan 2026 15:58:10 -0300
Message-Id: <20260116185814.108560-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132a;
 envelope-from=gustavo.romero@linaro.org; helo=mail-dy1-x132a.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The proposal in v2 was to allocate all defined address spaces
(CPUAddressSpace structs) statically, modifying the Address Space (AS)
API by renaming cpu_address_space_init() to cpu_address_space_add() and
by introducing a new cpu_address_space_init() meant to be used to set
the total number of address spaces in a CPU (instead of setting the
cpu->num_ases invariant directly, as we currently do).

However, Phil said that what he actually had in mind was to set
cpu->num_ases automatically in the CPUClass, hence without the need to
set cpu->num_ases using any AS API function, burying the details of
initializing cpu->num_ases within the CPUClass. This way, the
initialization of the ASes is reduced to the simple and unique use of
cpu_address_space_init().

v3 is essentially based on what Phil proposed in the v2 review, but I
removed the re-setting of cs->num_ases to 1 in x86_cpu_realizefn(),
avoiding changes to num_ases beyond the CPUClass instantiation.

First, because it will become inconsistent as new ASes are added.
Second, it risks causing confusion about the new AS API semantics, which
require using cpu_address_space_init on demand, as ASes are required by
the target, without modifying num_ases elsewhere in the code beyond
CPUClass instantiation.

This version, v4, a) addresses Richard's comments on using CPUClass
'max_as' field instead of CPUState (CPUClass instance) 'num_ases' field
and use enum _MAX definitions, removing the _COUNT definitions; and b)
removes math for setting cs->num_ases in arm_cpu_realizefn(), which
I forgot to remove in v3 and is now moot with the changes.

CI results:
https://gitlab.com/gusbromero/qemu/-/pipelines/2265804059

v1:
https://mail.gnu.org/archive/html/qemu-devel/2025-11/msg04406.html

v2:
https://mail.gnu.org/archive/html/qemu-devel/2025-12/msg02298.html

v3:
https://mail.gnu.org/archive/html/qemu-devel/2025-12/msg02917.html


Cheers,
Gustavo


Gustavo Romero (3):
  target/arm: Initialize AS 0 first
  target/i386: Add a _MAX sentinel to X86ASIdx enum
  target/arm: Add a _MAX sentinel to ARMASIdx enum

Philippe Mathieu-Daudé (1):
  cpus: Allocate maximum number of ASes supported by the arch

 hw/core/cpu-common.c             |  1 -
 hw/core/cpu-system.c             |  2 +-
 include/exec/cpu-common.h        |  4 ----
 include/hw/core/cpu.h            |  7 +++++--
 system/cpus.c                    |  1 -
 system/physmem.c                 |  8 ++++----
 target/arm/cpu.c                 | 13 ++-----------
 target/arm/cpu.h                 |  1 +
 target/i386/cpu.c                |  1 +
 target/i386/cpu.h                |  1 +
 target/i386/kvm/kvm-cpu.c        |  1 -
 target/i386/tcg/system/tcg-cpu.c |  1 -
 12 files changed, 15 insertions(+), 26 deletions(-)

-- 
2.34.1


