Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0617CCCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 06:28:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDd7o-0007eB-Nx; Tue, 28 Oct 2025 02:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDd7k-0007QB-Dg
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:24:04 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDd7i-0000bM-5i
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:24:04 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47118259fd8so41913585e9.3
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 23:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761632639; x=1762237439; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9r9PbSxEc5vkW3NMHjI0QVQXtgDxRcrfGpveD6M8q14=;
 b=xViHHJuJmL4FiQDEtOC+NFAOzgtulS49F21wQq5CNP9tUbOmnH64QOsjWe5IJUoTR/
 cPww4maCperenJcN7CB6+ksKavq1E747re28lXDF3b4/PJK6m/XqjyGdtmJ/PKT0LlVM
 LsR83tdkVYX3ARu3Ua/Y1aj7iUX+gDY1eQLcO3BXFGoQU1s4szgSvD36Jvqs5corFN1+
 /yBF6t7v84HmgrR4OGKxBjl6oE3Hfoh0V2bie+oZ4uqvYrxNQ+oLhTw/6A00b/Mwg/bh
 bG8/UbOW+1ptkr+cUI4oMOk7hDEQX9RBnALmpUdyWZIa3sduUKaUB2z0IeXgYvcwEfbt
 RvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761632639; x=1762237439;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9r9PbSxEc5vkW3NMHjI0QVQXtgDxRcrfGpveD6M8q14=;
 b=h2VHsjAc4+iqCw/7FT6gNRrh8erVbNbe72c1E+tdB135KdjV8inJVOdKa7hGhASHUy
 n4DDEuffgphzxS2cc6iElNStAT2ZkURFrMM+qx0K24xtWt8AIU6+kcykLWgROqpDG5gB
 zMBe3wJiPKnuWnJ9Re9HPNkkcl8WS6i/cr0VPTDcnaDJMFjpUfDE+D1c+G4OSDZHrcfo
 HLBqstQdxWFuQHBXYdf27yNHC5bzWc82DePdR5s+mOE6+4LtvHc9nZ9rqREx3hX3ncJ6
 4L4XsCydGRKhvX4srbbEBAlco/MN47CLNrQOZJAOIIQI4gXK4pa/bCe5gcrRxaJo3V10
 k6Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSQJSQwRHhzMhN2tV8LVYqPbqQ0NdQ2gzln9WezIFGSBIKOE5rPt7Klczym9o5IDIvCy8VaVLDIA==@nongnu.org
X-Gm-Message-State: AOJu0Yxm5D3/MydS1cQe767fPnMfEyvRvLT2yf30QfxJmiUKGYB9KK2Y
 WF9pFeFu/VJZ+MK7MVY49tBoab50lvj/KQemQ/Q+7MUp8TNNoVrpw7m1SYMyRJOa5Rs=
X-Gm-Gg: ASbGnct7/Ym6Wj5TXQJOJues9lGsZDtVnN0Dqdsz268a7wfQijx5Q7GAMenqrcT0AVt
 rilZkUIJahSD/nFrYI1UF9hbKHBR7F8VeZyyVfYhsipclrutnTr2a7exrzRMD8OHVPR1me+ahXu
 +2rlnahHwlMjFPlnWTYtbYL6Mf2gcZggbpW5gjiZk3hxOiiVdAn9rUu8GcN6QJWIo6/Jz2y+O4r
 X0j92q9DkonXaNC0LU/rX9yqJpwqjxiXkRbNueGsW2EG5u+RgbW2cbHEh4akMhWg7d9Vr8DLLFI
 HxuqSw/kAAWq7qT2qbpauaJcwiuEXyFWS/iHIW2w2nQh1Vd+9OeUps1naZUDC9ZDi1bt7Y8q2E+
 PT0iqmAdO5DmoZ+UNCCE8b2wWaclcm8ipzpKqSxnK9KH41AdTIJ3UNOPFC61IsJo4Dw7sn8cX5b
 RcP9yEV9E3u86VTuU1J/mhYmgOIed7nTdST4gfL5gvciOLQKYmYpeIelk=
X-Google-Smtp-Source: AGHT+IHVpoikpIYvHguAxwl+ojwpfr84RrZQqfwvBbRZQ/v9FUNcKjrLABeFbnw+hXNPR4eozlW99A==
X-Received: by 2002:a05:600c:540d:b0:46f:b42e:e366 with SMTP id
 5b1f17b1804b1-47717e6ae77mr18617665e9.40.1761632639025; 
 Mon, 27 Oct 2025 23:23:59 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd478202sm175898915e9.14.2025.10.27.23.23.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 23:23:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 58/59] target/arm/hvf: Emulate Monitor Debug registers
Date: Tue, 28 Oct 2025 06:42:34 +0100
Message-ID: <20251028054238.14949-59-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
TODO: audit it is safe
---
 target/arm/hvf/hvf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 639eef3b800..113f1415011 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1616,6 +1616,9 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
         }
         break;
     case SYSREG_MDSCR_EL1:
+        if (hvf_sysreg_write_cp(cpu, "Monitor Debug", reg, val)) {
+            return 0;
+        }
         env->cp15.mdscr_el1 = val;
         return 0;
     case SYSREG_DBGBVR0_EL1:
-- 
2.51.0


