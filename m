Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2818140njc;
        Tue, 15 Apr 2025 10:23:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCURtXQSrcq9fbL68kLTgb3XiYah8GnNhM4yA4XBJ+8KKJCgW4D/KMm9/qp6r5Zw42xk6QnmyXCcaHOQKQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFZyJFAY3N6Vg+S0736VXxntPXfT9ox1fXmAGmw4ZSIyQAY7BT1ZZGcmZosS0uKyspRFjgO
X-Received: by 2002:ac8:570f:0:b0:471:fc73:b656 with SMTP id d75a77b69052e-479ff1d7115mr60603191cf.12.1744737838474;
        Tue, 15 Apr 2025 10:23:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744737838; cv=none;
        d=google.com; s=arc-20240605;
        b=QznnGZSdFpHRkoxE3EwRw/SJfAEed0epjrzE4u/Qy5GVnXcNBRdq5pq5RcowZrP7en
         QJ3w16U5QcZy3e+heGfM/prHvrYHvlVNH+ksaISW71yNc2OLmCyHDFtSoK6fLGhelw+n
         /lJ3AszxBwh6CQTNhp3xdLzkG5PqF1TgBNK1Q/phHf6OVL5ESwIW7I/STXN0dvDA7OK3
         97BPwS5U3MewAtLjUlzujkhfyxbQuMOUqy0BgPW4REDLVScGMqjEjlgaVqShIBrNtpHb
         Z7ntFVldajuS25pGArSDpe4xOa7f+N5MuQTTZlRFaBEpFRxgk0o7l3X074MYtr/9yRej
         +fNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=hS+7/17IBPmUQ+Gu0uNPn+nwDnXuvADVLBeVN8JzcoE=;
        fh=5dDhRaRbX3tP9Vsj4H76VAlPUgnYVMxhznpdbMeD+Rc=;
        b=Injop+luAKWoFE1/acxMOJEzxFotkWfBo4eZnyy6V0Pg9loTUh3teMeR+85IqRqchb
         fOSLI7ax7QYSBEtZ9bnQTyo5poUfLCNIHKHrkc/uSTnJsyBi9yOzgGV3XTmdTueaKNmu
         nGoxlfYyJQzobAnBjJCju5j2B5U1xZnun+EfAqt7Y10pZwDorDQUDvzbNZsjBjAXa2Ot
         huoyNlySQSSl/7dcYIdG1pRNOqQD4vp1IPloyCYSkwYr1Q5dj/9lxiAsdAqUYpUUp1Yq
         bP8ywwkWtL1eTmnv6AfKg1ruyh9FiPf0wb59YJetce7Eqm4J52rr8eN4sHdRIr5QwKdt
         45gg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D23g3F4B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4796edbdb67si115388001cf.207.2025.04.15.10.23.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Apr 2025 10:23:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D23g3F4B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u4jzp-00009h-QH; Tue, 15 Apr 2025 13:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u4jzn-00009K-Mg
 for qemu-arm@nongnu.org; Tue, 15 Apr 2025 13:22:51 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u4jzm-0006tJ-2H
 for qemu-arm@nongnu.org; Tue, 15 Apr 2025 13:22:51 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so37791485e9.1
 for <qemu-arm@nongnu.org>; Tue, 15 Apr 2025 10:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744737768; x=1745342568; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hS+7/17IBPmUQ+Gu0uNPn+nwDnXuvADVLBeVN8JzcoE=;
 b=D23g3F4BeDRbyttiUCCEpHleFxkG6SYbTW5Me7L6a/V+Bedv+ZQq4E2nPEY1KnLFr4
 GUlL4aYafEDGUB9SYbGp/7XmyMVxjA/i3AZTsIGdLQP1dxX5XDtKnrVy3fa2mglZVzqj
 /wMoyHenwMezSQHA9DoMTlrL+11lob0ItnLTQWFDIBDLG4ES4AJ/+u4aPS7bPHfw7l3J
 Vrf3LCmoSKX2gba9WAefEr88wMnJif2bqRiNcQXGF1kv41Z4bvtjIy7UyJB4zHZGkvcI
 0+8u39qB/RJfylirlnzNbkN2qi6hRt+W9/VreiLSbGu8FsoI9Wbu7h1SoXpbSyjHPNif
 UUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744737768; x=1745342568;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hS+7/17IBPmUQ+Gu0uNPn+nwDnXuvADVLBeVN8JzcoE=;
 b=TlPJOCnfkMtr04P7RL2V7/cNXjzhLTHbnZ4xCkosprKBqEvGxsasrkgxHpb5EDN8g/
 XFTtMgbKWb9uJT8kigCmx6NjRhISkAUVXZWAC2mMjofTTlHNzcwZABz0Gx9IxC8aFHAb
 vd695hbH+0WHrZsU0wCD21kJz3ypz2Qs4D1pfRboHWf3SREgt0YeIaJM38bEajikCmKM
 lM1A8aT5zvfSmcXBja8ySvhZfodQcIQBC1+gx96ekCL+eYnXUbvPwe4y9SeXYluCGc2u
 WwVIHpU567uQm3DhbEcDNDgx4GcXmNzgaF5TUn3qrFrdusyo9V49hm/M8MfYSTKdOKRO
 /SmA==
X-Gm-Message-State: AOJu0YyHm56PAlam2u/SYi6EfgWvrDpCdHmlpVEpWRKA8JcGwA+DdCxq
 XHtrN1hJCUKeMJNq1MiAOhkhnbVo7zAAeGj0voaJZyFTEemj0iRmweDU0uV6HHI=
X-Gm-Gg: ASbGncs97YLy+04Ifu0mWMebN4FQB0N23bURxUTxWvhwStGu09BabSwHtXmXB5I+yCH
 2nP3H03AJ18B8Rg69ogJ2o/nEUxszWK+6KFvzdsQ/10NIQvUmKdBxLRFf3NcwCCyD2uDTqjXoo/
 Dg/v6tm6lYsPekZEia+m6sgN9lrndu/GxtxX5En/UGRX2AIBT4+QOPworYVmSJ67pLTXsn7ZOOm
 ECeyZfTmsnF5d9zKxUffkxjQMhaWipvausJMuAkI28o/nlG6rHP1WNphRtWgXuGUoQZ8KC62xzS
 fglNlWk1adeZfNyD282OWMh3AwZAgE5i0e8h7SWR4+yMdyu82ye8VF4usp8UqACvwoXPMIqkgmL
 rkgzvS3cYngwlgcuPZ2CY
X-Received: by 2002:a05:600c:3b23:b0:43b:c857:e9d7 with SMTP id
 5b1f17b1804b1-440597a14f3mr2394725e9.5.1744737767962; 
 Tue, 15 Apr 2025 10:22:47 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf43ce3bsm15185340f8f.66.2025.04.15.10.22.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Apr 2025 10:22:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 0/3] target/arm/internals: Replace some target_ulong uses
Date: Tue, 15 Apr 2025 19:22:43 +0200
Message-ID: <20250415172246.79470-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
X-TUID: 3rdGfISxU5NN

Hi

This series replace some target_ulong types in ARMMMUFaultInfo
and some methods by appropriate target agnostic type.

Regards,

Phil.

Philippe Mathieu-Daudé (3):
  target/arm: Replace target_ulong -> hwaddr in ARMMMUFaultInfo
  target/arm: Replace target_ulong -> uint64_t for HWBreakpoint
  target/arm: Replace target_ulong -> vaddr for CPUWatchpoint

 target/arm/internals.h   | 20 +++++++++++---------
 target/arm/hyp_gdbstub.c | 14 +++++++-------
 2 files changed, 18 insertions(+), 16 deletions(-)

-- 
2.47.1

