Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9766DE748FC
	for <qemu-arm@archiver.kernel.org>; Tue, 23 Dec 2025 22:27:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vYAqU-0005WK-FK; Tue, 23 Dec 2025 17:27:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vYAqT-0005W2-Ld
 for qemu-arm@nongnu.org; Tue, 23 Dec 2025 17:27:09 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vYAqR-0007NK-Te
 for qemu-arm@nongnu.org; Tue, 23 Dec 2025 17:27:09 -0500
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-7d26a7e5639so6202293b3a.1
 for <qemu-arm@nongnu.org>; Tue, 23 Dec 2025 14:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766528826; x=1767133626; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jBQO1Wn5o0tb2+FAZqnUEHdgyZgxt4AJ1DumNER1BHI=;
 b=XfBW9rQ80cu1PgBIFx54dCg/Mp55rnUJF992xqypCTbVtcvKL/rySSOanQXo7+MIeL
 O5VkU72xq/Aep6mlu5aZ7+JHCCLixcEkdXS7q6uw/16b559tov6jTKqZifkjmXN9YPda
 /lwVTboNNMdZ399PH14ZQimH+6W7cwjb/vNGkTw5opsoSyuAAEvokc0BL3koAdg/4kzM
 HVSgtXx8SxM/ih5fg/oZorC+Ctz0NPqrQvppEixXGaP7JRV0dWq/u3OTIr8ISGeami0H
 a0C7kJWR3MA75vhvfQlLLwlzYXfp0nua2nKYGaagh80sZ/iv2/mRxhUGqUIaTAGn5p72
 mbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766528826; x=1767133626;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jBQO1Wn5o0tb2+FAZqnUEHdgyZgxt4AJ1DumNER1BHI=;
 b=YieVovWEzSuw9Ncen+cQ19v87noSaiOlnmtDsbDO2DvXVKHuRlbAkQkTtpQA7K93vj
 +SQl9bm7OzUGXREMk9K1/618mSCkkPWS6YEqs+HnWB5KJBa5UTXvGEhkUHJOZ8o9PWz7
 h/BWqgv90N5qhTaMx85knJ6tP6np2yobtCmaIEEQZ6LNuBReKhrgCacRT9FUE4HZ+S//
 f6MCP9CLC61ocO19N6MCx3YZutWgJm5Rs9YP+qd0ePveFIYPHRqQSP4moDi3zbwdTErL
 BwxDxk9owem/WYdIWx4bdeoeFy6ud9Wtfz2PLz4h9P7JM/kKwlkaU8uu9wmIJT1enCbl
 hBSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQLFoooqo0chaJNNgNS65eHXMteMIfoq+aScwpANVShSPwTGzdqoEFSWK3ihQqjUNUGS6MukwuyA==@nongnu.org
X-Gm-Message-State: AOJu0YzH9WcSKpbr9Buhe23fxNT002DSJ2hxLVJNcAj3c6Wnl9hUD1wb
 IaPK6iHdviZWyhQfdcn2wmOBKelKAn6pYYqCuQHiDvJF8G/Y8uICmzLSp1vkDXyLjw0=
X-Gm-Gg: AY/fxX51x+9UpDONauMZ3cJR6Iis7uGXjFz1zWBbbOfJfYxbecn/+RcCAEMYmUNsjub
 uG8aNp1zu2UZjnOSzI2EX9MXjyPMZaonviPtWyAXYRPWJKl1V2f9N2x6mU8rJmpctBpA2bVlHZ8
 AxTt5/+VKa6fwKZyqLu5+6IgbT0yjdr5KYh0yDsdFM/KfTGvoH4jM8gfQqRog9iFT/GLBKrRj/w
 NO2N5dCDxd8484GEX3BrqGBF/PdMHWGWS60YiPQ6kyubkYGcYvT++pyt7IzEb+c9pcj190lE/qH
 G44i+nIE1OQR3nzULuzK1t9sRivDnmIMGZhduOV4fvabiWr2Lm0hJRIq87heg0ASbWx7E+Dg+Ga
 ceRpox5hf3OXElWubGFTApKND173QEwrdXgOZt+OPns+mSjByIPadNFWW+Hr4VJTx/HN1nSpPlv
 fPPvjPnJIIVSIVhzX0
X-Google-Smtp-Source: AGHT+IGj+3kVenhyap2+XdBLRVNS+MWPW2IBBdZyQ+O3opeZ98oNucyuOtn+CPPoWUy3BpMch4YpqA==
X-Received: by 2002:a05:7023:903:b0:119:e569:fbb2 with SMTP id
 a92af1059eb24-12172300472mr19012141c88.33.1766528825740; 
 Tue, 23 Dec 2025 14:27:05 -0800 (PST)
Received: from gromero0.. ([179.93.129.179]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1217243bbe3sm62803123c88.0.2025.12.23.14.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 14:27:05 -0800 (PST)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, philmd@linaro.org, peter.maydell@linaro.org
Cc: gustavo.romero@linaro.org
Subject: [PATCH v3 0/4] system/physmem: Enhance the Address Space API
Date: Tue, 23 Dec 2025 19:26:45 -0300
Message-Id: <20251223222649.187935-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pf1-x42c.google.com
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

This version (v3) is essentially based on what Phil proposed in the v2
review, but I removed the re-setting of cs->num_ases to 1 in
x86_cpu_realizefn(), avoiding changes to num_ases beyond the CPUClass
instantiation.

First, it will become inconsistent as new ASes are added. Second, it
risks causing confusion about the new AS API semantics, which require
using cpu_address_space_init on demand, as ASes are required by the
target, without modifying num_ases elsewhere in the code beyond CPUClass
instantiation.

I hope that now we have a strong candidate to be merged that enhances
the current situation, allowing adding new address spaces in the target
quite easily.

CI results:
https://gitlab.com/gusbromero/qemu/-/pipelines/2228868887

v1:
https://mail.gnu.org/archive/html/qemu-devel/2025-11/msg04406.html

v2:
https://mail.gnu.org/archive/html/qemu-devel/2025-12/msg02298.html


Cheers,
Gustavo

Gustavo Romero (3):
  target/arm: Initialize AS 0 first
  target/i386: Add a _MAX sentinel to X86ASIdx enum
  target/arm: Add a _MAX sentinel to ARMASIdx enum

Philippe Mathieu-Daudé (1):
  cpus: Define total number of address spaces in CPUClass

 hw/core/cpu-common.c      |  2 +-
 hw/core/cpu-system.c      |  6 ------
 include/hw/core/cpu.h     |  3 +++
 system/cpus.c             |  7 ++++---
 system/physmem.c          | 22 ++++++++++++++++------
 target/arm/cpu.c          |  5 +++--
 target/arm/cpu.h          |  2 ++
 target/i386/cpu.c         |  1 +
 target/i386/cpu.h         |  2 ++
 target/i386/kvm/kvm-cpu.c |  1 -
 10 files changed, 32 insertions(+), 19 deletions(-)

-- 
2.34.1


