Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85B8C61DB9
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 21:30:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyyif-0002QB-SJ; Tue, 25 Aug 2026 17:30:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wyyib-0002MH-Vl
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 17:30:06 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wyyiZ-0003Kc-Fc
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 17:30:05 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-38e347638adso422854a91.0
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 14:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787693401; x=1788298201; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=rVDi7mhUq/yDrXgJJOw/OpfyGAuucS2TTqfrK9JSIbc=;
 b=f1SaUMfd/gHnrKcDLejT9u+8qCuSVABGDxbt7L98Z4OXTByggbCulzyN6kjJBOkr8L
 bfBY12J/xvK98MI+16UMjsBehuoe0SDUY7asd6nQV0a/KH8kSAelnmsO5oXLmCgFNrm4
 QNYGQ2ax782lYQUmMuyspcD47mSNlun1CPsshzUhpTnVxmipoRbkZK0ivDAUfc9OULLm
 A1J6DTpR2QwA2gLBO5XhhFB9qt1861tfqjtWjMRA8lcZrbqnMalfWMpYbK5aeIIrTchS
 y11dDERp9q9/SA93dU+nH3IrVPGaUcY2PW8D0oB7wyNiFKexwG/nUgVm3ffFHwtpSof7
 TGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787693401; x=1788298201;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=rVDi7mhUq/yDrXgJJOw/OpfyGAuucS2TTqfrK9JSIbc=;
 b=EnZ9E65ERlGVczHYtPJdqdQxNxFRhFCSHS2SvVybp+hxbFOraIXVs2G/7MSlEgiYSz
 suWU7vSkylwqXxYqNYm+ABaMUQARuUGneIMjEGbZD96z64nU2hBDjQnciUWo602F4qnL
 x+vqcZUv8vgaLwBmksmcAvZrwZ1BrNPJxTvmxb20qvB4t1wszuahLXUJT91w22N0zFjb
 Vm8F1dbTds1Y9lcwv/nLVEhyoGKj5UYvTE38IQdZufi9vPCxbblVS+osPyYnFldEceiv
 exxWCf65+OZS1lv3wPbP9kp0jBKV/hYTd4aWMfSfrSzeip3UknqAkFdU6uNExJ25MOMh
 9lMQ==
X-Gm-Message-State: AFuF++n/GzcDFYXmndl/LWDCRa8xjn4plQCr6PQfhuvdOQawh02TGWDe
 Kl3l+xhTMWI2vEEaFW066UdwZsrUAqANqIzi7hTGYJBfurW/Ndpg44YM8fIvdM0i280=
X-Gm-Gg: AR+sD13CJu9icwsqcq9vBY+GeIQABgRT/cKkhWWphd6Jq51IuM+tyWCywyxR9Q6asuv
 NciHhH+dimrJA345fTTMXId68RnpUlL2wLUXdVK+nRtu53tK0I6cxpV3jKO7vXcYyi17UIT9FNY
 ffBcR/8i7lZwpu+ZNflGwK8yxsadGsEehi50XsXn0tCCEA633OrBC0EOdqDgDmai8KTyqzplN5w
 fWw0RMBMgegL+YgkG8jCcFSc54Bo5yH83+oQo2KlyGd/m95qBtk39JUN70VX8h+sTbTjoegg1ZE
 3S8e1kVu14hz2nJqONknsUM+2A9MLF7KN4y7t9kcf5KXQCAm1KL7o6MQPeNZOULGJAnIXeeUfcl
 AdeUYYeRuWKB5hGUXCnHSiYuqz+fysT/mMrq0gcZoZOP74yMIZ8eq4FZMJZg7D6379Md13eJPWY
 x3YkI6H8ZQOtOt6LaoOkPcZ+06qoApsCPdYpEe4Eu31E9uzaDVh04VNoXF98KccK19hRRLDnyKa
 2pMQKSbB4SiKc27vA==
X-Received: by 2002:a17:90b:4e8f:b0:38e:2517:5d1f with SMTP id
 98e67ed59e1d1-3966d4032e5mr4382127a91.9.1787693401252; 
 Tue, 25 Aug 2026 14:30:01 -0700 (PDT)
Received: from stoup (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-396689fa52csm1207163a91.12.2026.08.25.14.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 14:30:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 0/4] target/arm: Introduce cpu types max-v8 and max-v9
Date: Tue, 25 Aug 2026 14:29:56 -0700
Message-ID: <20260825213000.221822-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

This is something that we've talked about for quite some time,
having separate "max" cpu types for Armv{8,9}, because Armv9
prohibits some deprecated Armv8 features.  Retaining all features
simultaneously has the potential to cause confusion.

Changes for v3:
  - Several patches merged.
  - max-v8 is also present for qemu-{system-}arm.

I realize the registration of -cpu max-v8 will need adjustment
for single-binary, but in the short term I've used an ifdef.


r~


Richard Henderson (4):
  target/arm: Rename and adjust aarch32_max_v8_tcg_initfn
  target/arm: Introduce cpu types max-v8 and max-v9
  target/arm: Use -cpu max-v8 with aarch64=off
  target/arm: Separate cpu types max-v8 and max-v9

 target/arm/internals.h                        |   4 +-
 hw/arm/sbsa-ref.c                             |   2 +
 hw/arm/virt.c                                 |   2 +
 target/arm/cpu-max.c                          |   4 +-
 target/arm/tcg/cpu32.c                        |   8 +-
 target/arm/tcg/cpu64.c                        | 160 ++++++++++++------
 target/arm/tcg/stubs32.c                      |   2 +-
 tests/qtest/arm-cpu-features.c                |   4 +-
 docs/system/arm/emulation.rst                 |  13 +-
 .../aarch64/test_virt_aarch64_off.py          |   4 +-
 10 files changed, 139 insertions(+), 64 deletions(-)

-- 
2.53.0


