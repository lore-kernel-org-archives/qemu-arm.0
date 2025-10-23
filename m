Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1127CCCD1BE
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 13:07:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBv1d-0001Ni-Tr; Thu, 23 Oct 2025 09:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBv1b-0001MS-D0
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 09:06:39 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBv1X-0006Go-Ix
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 09:06:39 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3f0ae439b56so411058f8f.3
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 06:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761224793; x=1761829593; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lt1tGyvXAe3pncZc7T8tBRzYECxTVkwBPwQzr5iNL9s=;
 b=I4JmDjmTSp41sDFVobrdSriiz7mN39yH2C4Uza2xqBdn9uhce0SiJOM4DcSa38mJd2
 QG0HmWWue3uJIlED5AAf93AZ3FgSO8S6uQIdS/CbBdOn5MTobtmXgcDlPWGhVjfwRb1K
 z3SMHqQCTLpE9M+I1ZLQkaicXn1qkA3iz9+cliu8Z7t8cIcLTZYJP4Us4Z7QExdbYk+j
 4pyuuP4wg1sXcrocXdD4vjALlbdd0yuDsGUoyms13bH+XgUlGC1NvvvCi/IjQ0JeRzB7
 bSxisShTJ1bBOE+w60cJjwo17tg9tJ5kphObHCzyiRHslvuKxuMgW7ogcl3KxeMtzqTj
 oP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761224793; x=1761829593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lt1tGyvXAe3pncZc7T8tBRzYECxTVkwBPwQzr5iNL9s=;
 b=nWL3uCQnUPPWqLgi38ZJKe/qdS64L5BoNKQSSrzqgFNS0EBlODP0sYv4yltjVmUA+T
 GhOMVmi3Hw7Y2bGWI+nUkOH/ufWBCyBZ9c+qnsxWEgd9NCxObI0aRIZTdZHirLe5NVn0
 9LDCxYKRNCKmiw1F8pz8Lsa8qpqzI8VRvQo5VcKGXMLbK0hQcHlYV1ZUwjBD0x9374Dw
 U95UqLBuVV/kwHE3wmASJp9Rl4gZRVRil1sdeNCtkfP44yX7kF8eigbXrbFO5oH2evST
 QdzHoWjS3Q919DYJ9e5NANUpQ7h+qBmqKNde9MyNOQmS6bu70XqKYRTExlJzbZoSgAsH
 Fu0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiJ2rN7oTU94FPk2lOT/h+6xblVUeEV/bj6ex/yHrc6+5xL488qlVPcm4B2heTJuw0dqrZpCNO8A==@nongnu.org
X-Gm-Message-State: AOJu0Yx1dJjf4XCb8sLY1ztifDYlgJFwmgYZ/OqsDCnV0eGddc1JYPM0
 R3oMUpXxuxrcado1F1ElODAGYFPHJ7NPj8a0NBqr8vC1vV/Fy7J03z8CvHEAQOwF67w=
X-Gm-Gg: ASbGncvIHPMucqcIsIydzqfk3yUuMj0mFW8KlCjOCYjbOWIUP6+DeH1QNuAd8dDTilr
 MQjXDCLYhvsAu2nQu9XOfeUTI0P9h35LUBoMTULyaZvxkBAJfSgtchJTq9zejuscirb5mMgA/x4
 LpLukPWLYcclvjUNYtIPq8D8NZTIQH7x9QhMrd4eHSMqerRENW4hZ47OcUdLZw7umvy9EaXqK0n
 E8MYBsscwyQTqd0yckXurKEd+DPd/PuYhAAcNOkNXalZB0raPEVfC7/4mLdWlEd5wb7BCxRL91g
 DkZuq1A/rXP5TbQKReAYaMsR6fTzxWDMtlOFPAkmwDEGkM1bIeJ/nwNumwtV4G37Qp2upUR4Vsa
 KYaoiOZK1W+7IANhge5rCwsLOGe0BfVYUYp8GXu5VmFVP/qUjP9lyuJjYWqLxzLBK4GxAFDeutn
 tpGrqn0N7vQ+2NjRkVIfn79F9l2k3BVXRqWaRryRsdyzNWyjkBbQ==
X-Google-Smtp-Source: AGHT+IG3SGLmBIRYdpStkHWWKWGd0dlDvTjaELIhLgLfqXb7SQvfHuwh7YKKUfOy8oJupSVu5zl+ow==
X-Received: by 2002:a5d:5c89:0:b0:3ed:a43d:8eba with SMTP id
 ffacd0b85a97d-42704dab119mr16849419f8f.52.1761224792922; 
 Thu, 23 Oct 2025 06:06:32 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429897f5696sm4158517f8f.14.2025.10.23.06.06.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 06:06:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Stefan Hajnoczi <stefanha@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Collingbourne <pcc@google.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Mads Ynddal <mads@ynddal.dk>, Phil Dennis-Jordan <phil@philjordan.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>
Subject: [PATCH v2 43/58] accel/hvf: Enforce host alignment when calling
 hv_vm_protect()
Date: Thu, 23 Oct 2025 15:06:19 +0200
Message-ID: <20251023130625.9157-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/hvf/hvf-all.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
index c767e13c212..7e54cf202f0 100644
--- a/accel/hvf/hvf-all.c
+++ b/accel/hvf/hvf-all.c
@@ -54,6 +54,8 @@ static void do_hv_vm_protect(hwaddr start, size_t size,
 {
     hv_return_t ret;
 
+    start &= qemu_real_host_page_mask();
+    size = REAL_HOST_PAGE_ALIGN(size);
     trace_hvf_vm_protect(start, size, flags,
                          flags & HV_MEMORY_READ  ? 'R' : '-',
                          flags & HV_MEMORY_WRITE ? 'W' : '-',
-- 
2.51.0


