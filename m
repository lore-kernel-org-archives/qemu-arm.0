Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2203242ejf;
        Mon, 26 Feb 2024 09:38:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVNlFUB4Tjlt4LnvQMfHGNlTIYCXoZnFUQndNk9Qe5AGRbVJXXbC0p9npUZfkKxNxUjYQNjaGobGuCkyHIIUbIGbfTlwRQ4
X-Google-Smtp-Source: AGHT+IG6WITGMd50FP1HBnRoke2gfakYa+zETCLpYsf3+mp5sGjoI4mS3HrNuRzSi+Q8iZ1tdV8i
X-Received: by 2002:a05:6830:1388:b0:6e4:7451:e7ba with SMTP id d8-20020a056830138800b006e47451e7bamr8285359otq.8.1708969107831;
        Mon, 26 Feb 2024 09:38:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708969107; cv=none;
        d=google.com; s=arc-20160816;
        b=w4V0LNDDXuXNbi41RIh3Bcnk2+ANTBu6H27e9VJekcZlNAsKEKNJ0uGcnYCr5xK2ZU
         sB5Wndv6Mm3Jy6SfRF85y7GTGOuf05hGEGeF9Ggdv8EbiDXpXqer3XtBRfNnwVMafp0K
         R+1dOgIBDcHXPHYvZs9lSMsOiIfiJWpMT4/NhiS63GBgKCwS200pgMy+46F/H+I0VHvN
         fORWNucXvwIkmlen2deKYRkxU4OFZhGPhi3sWtb4dsUM3uRma0ZJAAaKEfLvmEgn2Fa2
         kUyTlaygxLE1ZGcM3MEMacm2h7W/N8xF7FtiW7NSOZ2dJdxr8KcbZJtXqEZsXk6HGebq
         aaLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=8mgFB9QFF5PJ603vJYftBh86z1nFKmxYR5yaSbjagl0=;
        fh=OZQBfL75rC14cCDy3q+1fYHCs9KjWAQ7ZJ3hTfS+5lQ=;
        b=JdFUOlsr0QxCSZnv821C/Kxnxsrt25Y0iTWTGQMnxQ7iJEdhSagxc377g07yVKUqh9
         SB995wah1GNi/3QwwpYLqqmMMGZsAvKIMylwNkWwx3CccBuo7oxClYzZDbxM8ZL30HVg
         TR4UBMZFZHmCSjmppVMc1uZm/6oPOlLsuI6iCOcvBwREpQbzEthHuH/l7ZqbqN7c94CQ
         m04pCrdOrhK6oLnmKzIi8D44MCuYmIvvzj/OEFIDrcKv5dOGxczgrPmikQ73hIcm6i9Z
         /d5EXpa0pMOGIdU3JaVpYkxMEDtFBHuSWHeXirStEfqycW4Wq79A7QNopq1yi6/zeH0L
         zJSA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nEVBO3hw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x22-20020ac84a16000000b0042e87608fb2si2123208qtq.359.2024.02.26.09.38.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 09:38:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nEVBO3hw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1reevh-0003wX-Gb; Mon, 26 Feb 2024 12:38:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reevb-0003oU-Jq
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 12:38:11 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reevZ-00074m-2N
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 12:38:11 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40fb3b5893eso26318985e9.0
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 09:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708969087; x=1709573887; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8mgFB9QFF5PJ603vJYftBh86z1nFKmxYR5yaSbjagl0=;
 b=nEVBO3hw767+JvcwHRKc4CyIVLkq4IFIylqPRhUxJO1Tqm+9x8LJn44wEhy6r5Eumc
 6TNmSNAxZfXAVBKXoVsk1g72N+eOxOZqkoRin+LsT8RUWD+E2SZju5LCZ2ox8IWSJYvM
 tkHmtS9IwcHBd2vh5n1TVf3lv2BRFJbx/D2TWmKyhFNzfd4cIht2ONr/RhWTWEvuCtHk
 hFS9CSlNiLEpiFwd16E98xS64NaJsaAXGb6BhsLUMznXZMqCzo9AMY+59T7w2/32eb8D
 1wDQiVho2O3Y+bhdRLAFoGm/cOXODZnI0eYhrQ7vQ3fHiX3ScniEQSlddxRvHFFdwsAA
 BUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708969087; x=1709573887;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8mgFB9QFF5PJ603vJYftBh86z1nFKmxYR5yaSbjagl0=;
 b=SVxurXjQnKc9E2TgGpEpg3Xl69C03kMCJYgUD+v9tRcOYYQvEAqSpbQhDW1kn6TRkh
 Cdwxn5eUTHV0U5C2wFfNuWg+ePJu2peIT0CbB3psQkF/jo+++eQ/5kfbpLrC2rfL9Tlb
 2djAUkXvuRA/Gt62x9TNJUznx2t0GCMQ69ucJIM5PVKA2H78Nsg8+HgkoFCiHmm+mS28
 GVPkrakGGmebCBN7MqIbtVsVHviwRG/QNhIgmXhLLTZCkisjzW7GBhgacBLzRRKxYSxc
 I8XMQaECyJUfXmh9trB4SB7C4/8MRm5oOvVUklQh6w36Il6LC+D7JH7nUYMme7yGpOYg
 BB3Q==
X-Gm-Message-State: AOJu0YyAbvZFcarz/YjlkimZXXk348eVEf4ZeShwDlStONwTE0QU3bK/
 C76cn2BD+ZQlMhbPX5dwxsYfdRimcrRJvBgN60t5nA8MXCMWiy0hP+9Jrq5NIKc=
X-Received: by 2002:a05:600c:34c7:b0:412:989a:f6f5 with SMTP id
 d7-20020a05600c34c700b00412989af6f5mr5761837wmq.38.1708969087571; 
 Mon, 26 Feb 2024 09:38:07 -0800 (PST)
Received: from m1x-phil.lan ([176.187.223.153])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a05600c3b9000b0041298c75ae8sm2493367wms.1.2024.02.26.09.38.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 26 Feb 2024 09:38:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/6] hw: Remove sysbus_address_space()
Date: Mon, 26 Feb 2024 18:37:58 +0100
Message-ID: <20240226173805.289-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: suZspfSCyWFI

(all series reviewed)

Since v1:
- Rebased

Pass address space as link property for devices where
it seems to matter, otherwise just use get_system_memory().

Philippe Mathieu-Daudé (6):
  hw/arm: Inline sysbus_create_simple(PL110 / PL111)
  hw/display/pl110: Pass frame buffer memory region as link property
  hw/arm/exynos4210: Inline sysbus_create_varargs(EXYNOS4210_FIMD)
  hw/display/exynos4210_fimd: Pass frame buffer memory region as link
  hw/i386/kvmvapic: Inline sysbus_address_space()
  hw/sysbus: Remove now unused sysbus_address_space()

 include/hw/sysbus.h          |  1 -
 hw/arm/exynos4210.c          | 14 +++++++++-----
 hw/arm/integratorcp.c        |  7 ++++++-
 hw/arm/realview.c            |  7 ++++++-
 hw/arm/versatilepb.c         |  8 +++++++-
 hw/arm/vexpress.c            | 15 +++++++++++++--
 hw/core/sysbus.c             |  5 -----
 hw/display/exynos4210_fimd.c | 19 ++++++++++++++++---
 hw/display/pl110.c           | 20 ++++++++++++++++----
 hw/i386/kvmvapic.c           | 11 +++++------
 10 files changed, 78 insertions(+), 29 deletions(-)

-- 
2.41.0

