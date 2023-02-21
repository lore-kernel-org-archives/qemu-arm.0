Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2812042ejb;
        Mon, 20 Feb 2023 18:21:49 -0800 (PST)
X-Google-Smtp-Source: AK7set93ffpJTdV8fZVDpPYn1InJjdrwHF19keagyT9tIFCe1pBhrw0t4fwKaI4nvOtbbQYQmc1W
X-Received: by 2002:a05:622a:86:b0:3b8:6c68:6109 with SMTP id o6-20020a05622a008600b003b86c686109mr14173916qtw.21.1676946109484;
        Mon, 20 Feb 2023 18:21:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676946109; cv=none;
        d=google.com; s=arc-20160816;
        b=A13cAdNDT9IWEul0+2+keGFQNpv9O1MdW2rawATxQfnCVs42DpFvC2qX+WtMsdYn66
         G5nIOv+SDHP5txTRGA2gJte6Z9GWo8WVV8NpJqYT70rEzV48NH5dghFV0UgeRAkjm+x7
         volBWzPMRCiSI5QfXPwDBG3D/Yar5jMdAFrzuKeYMarFw6egsBiKXD1T/jzActKh/Zz3
         vpJV1kVqBYlD+s4k6W1A3xXB54NSVuj0AVZVIXGy7QddCB0roYfXFNKx3m+7kyXA9PZw
         C2YZr6UZfNlkd+7T01OBLyJEok/Khc8Dzud7RW9+7kEO1VjYpKAoUGyEOCdvnGB7XZiM
         2eWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=nQp8Rn3P5bhugZzgS4E8U0wmbAgETeWvZejtKLGWnCM=;
        b=kiJQpkA0u7Cm0c6P/zgk62zBpHUzwRKFiOj/Ddk66wJpUSkVILAE59UTUOGVEXX9K+
         RgNx+Lv7osU9arJBaF2WZAgFGIFsMzDQeN9D5AGzWuAx6eqafA+UEdbPCmzyTUsNvMg9
         0DmEwZ8NBRUhWZ5SKlRr4kxtq8bkapAeBGx2GPBWXXwKfRemriPIAdTD/Z5UhFPQWONq
         6jG3JBiPxvi/+8wd2iw8xEs+Osz6kQirs47/p+EufcmSWN3oBR39FxVD36PkfdEGYrtA
         G9O0Cam6AHECfqIxGr2mwITgxDR3zirJ6liyXXLwbe+GBBaXBB9r8sq3fwd1fdJsoFaJ
         gcbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=htvpKeQa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r76-20020a37a84f000000b0073ba9cd4798si8505861qke.78.2023.02.20.18.21.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 18:21:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=htvpKeQa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUIG8-0001Xn-3W; Mon, 20 Feb 2023 21:20:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIG7-0001XX-8g
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 21:19:59 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIG5-00080h-K0
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 21:19:59 -0500
Received: by mail-pj1-x102e.google.com with SMTP id o16so3252235pjp.3
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 18:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nQp8Rn3P5bhugZzgS4E8U0wmbAgETeWvZejtKLGWnCM=;
 b=htvpKeQasXaXkUXg0lAlv4LO+L7jJcELxOXQ/9g/PgWzLlAO6uipnpIrxmmkyrWf6C
 qe4TEYF0vc4nyEDaApLLIHtUS58gH8TtKjfIUTNGCxL/98FL164+n5Sb+XouK3t+J2eY
 9j5V71M/kysKEaZD2RvV/dIWQybsOdn3QrBWH0reKK36mb0VTsGwsO2Mit9gxVQbofPS
 xQHAQO/HvWX7K27moNln6hlxAKp9UXLIiUXVomXBckdm9+sOsxZ0KLgoKgo+Vk+/B6C0
 DY+SYuduvcapvXT3HSs3TWqBtlxR8HnawzRC6or5894S2nSCnJQY4/OX59xs2VbLqqD8
 vi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nQp8Rn3P5bhugZzgS4E8U0wmbAgETeWvZejtKLGWnCM=;
 b=PC3pEYo4Ngd17MObIj+ZpbJjCzUMvVOphmz76rYGYTCGepOq6XCx2NLI5wwVvBOHnn
 prmS4UZ3vUBOBENBCyPhDwAf0vB3Rum8f2o1nxflYszKm4O6HZAOiWSNCO7A/AnsJ2Hq
 RXUAi2XO4o0/2gqpugTdypmrLSUZmbRkqkpL446uToUQhVXx/lhQKpOX0v+W81q3hGqC
 Y8Q6S0GIdpceAVmwA37XmXhqZ+t6YyZqnrjsDsz8WRrky0HX8+aARZZw9NteqoaAZSs2
 ICYQ/pm5EtqAi7B+VWnVxhmyIxILnH4gl4lxonRbcHP5I9nGfUm4FehEl3k1wFfDRr6H
 DO5A==
X-Gm-Message-State: AO0yUKVNUeKVqzaRD0n6QlCoq+YZWy57/MvXTzQrYryRkkwGwya0/Hty
 7okOifw4InYTRRc0AuXQL1UmUw==
X-Received: by 2002:a17:902:db0e:b0:19b:c14:9f4d with SMTP id
 m14-20020a170902db0e00b0019b0c149f4dmr4509666plx.38.1676945995355; 
 Mon, 20 Feb 2023 18:19:55 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a170902e98300b0019141c79b1dsm8559328plb.254.2023.02.20.18.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 18:19:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 00/14] target/arm: gdbstub cleanups and additions
Date: Mon, 20 Feb 2023 16:19:37 -1000
Message-Id: <20230221021951.453601-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
X-TUID: /PfEEY2ZHlu1

This is my pauth enhancements from last year, the corresponding gdb
patches for which are nearing merge.  If lore and patchew are to be
believed, I never posted this to the list, only pushed a branch so
that issue #1105 could see it.

Since the cleanups there conflict with the recent m-profile gdbstub
patch set, I set about to resolve those.  In the process, I merged
the secure extension code with the sysregs, since they're simply
presenting different views of the same registers.

Changes for v2:
  * Incorporate feedback for pauth.
  * Rewrite m-profile systemreg and secext xml.
    - Since these are Known to gdb, do not merge the two xml.
    - Upstream gdb only knows about {M,P}SP, but David's extension
      to include the other registers makes sense and Luis confirms
      that it's ok to have extra registers in the two features.
    - Continue to share code between the two xml, but separate
      out the mapping from gdbstub regno to internal enumeration.


r~


David Reiss (2):
  target/arm: Export arm_v7m_mrs_control
  target/arm: Export arm_v7m_get_sp_ptr

Richard Henderson (12):
  target/arm: Normalize aarch64 gdbstub get/set function names
  target/arm: Unexport arm_gen_dynamic_sysreg_xml
  target/arm: Move arm_gen_dynamic_svereg_xml to gdbstub64.c
  target/arm: Split out output_vector_union_type
  target/arm: Simplify register counting in arm_gen_dynamic_svereg_xml
  target/arm: Hoist pred_width in arm_gen_dynamic_svereg_xml
  target/arm: Fix svep width in arm_gen_dynamic_svereg_xml
  target/arm: Add name argument to output_vector_union_type
  target/arm: Simplify iteration over bit widths
  target/arm: Create pauth_ptr_mask
  target/arm: Implement gdbstub pauth extension
  target/arm: Implement gdbstub m-profile systemreg and secext

 configs/targets/aarch64-linux-user.mak    |   2 +-
 configs/targets/aarch64-softmmu.mak       |   2 +-
 configs/targets/aarch64_be-linux-user.mak |   2 +-
 target/arm/cpu.h                          |   9 +-
 target/arm/internals.h                    |  34 ++-
 target/arm/gdbstub.c                      | 294 ++++++++++++++--------
 target/arm/gdbstub64.c                    | 175 ++++++++++++-
 target/arm/m_helper.c                     |  90 ++++---
 target/arm/pauth_helper.c                 |  26 +-
 gdb-xml/aarch64-pauth.xml                 |  15 ++
 10 files changed, 474 insertions(+), 175 deletions(-)
 create mode 100644 gdb-xml/aarch64-pauth.xml

-- 
2.34.1

