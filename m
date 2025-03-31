Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp2433182njd;
        Mon, 31 Mar 2025 16:05:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXgwvfmtcNxHVeMVFQe/lESEticmpLJcUFwInLnxDicokYBdKIh0SQCqkiEeFLxJm/vV+WrF5wW4vo/7A==@linaro.org
X-Google-Smtp-Source: AGHT+IH2ErXgfhotGea+RkaYCstSbIy3fHUoWEU3EArZiEHICvNPKqoIc4kdzGnhmeFzpQx/P2bK
X-Received: by 2002:a05:620a:1a91:b0:7c5:5d4b:e63c with SMTP id af79cd13be357-7c690890f6emr1422320485a.47.1743462342864;
        Mon, 31 Mar 2025 16:05:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743462342; cv=none;
        d=google.com; s=arc-20240605;
        b=gQWyGQteEoRvqnwCKtrH3I3RlfCuyZc117MDlgHuDtT0a1rP+RniW4PlNI29yDGDcz
         IRcXL8TBz0Yvt/5FvLDUvWClBiIbk9ClG9dy9zY5SwOAqoBf3h+yYfMG+YkY2WqcVRad
         iXnGs2/tBuxWN+EJoUajWh8WFot12J+vbCoy/ZMV8PTiAyjisZ2Z7ivy90mrNxhzmPtw
         nWwkjIh5GGUTN3jmh/NFbeHo7ZHHP1w1q7b/g6YwNSWAIocz03iiivBT0yVEFXUf/CdM
         bI1hJ6qpuCuoljukEn6pu1vSZ2Npeew6KfYOIrWKG9UsLVOO3HHHUvFagDsp5IiWRcwP
         r0Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YlaEyhXAp6ocXg8HeW9O6/zASqUSt0dLhdV4fK8vO5o=;
        fh=yBV9+s4OYN0dJuOIkciB2ST6Mr2tlwvWTAPzr1Oeqlo=;
        b=LQpjAyfCLnNBogiIzHLt7uxPDLUUjPgaOu+wNbObA7rwXKEXXLOApElGGVTPOg+FrV
         7bSXZ7Qm6ySf2ghe+cpPZRpf5/UdOl7fz95qgv5w+L0qqYKCKryzFhwuSywGED2xwppc
         x4aUT+zY/i96aAh2QNM86OEBwa+cFR2/VQxkf30kv+xtLXBs9DUFPYFvE+XrHcxjP6un
         8F75ZdxZwdQAUXdPAl+85CyggsaDASSfwEh9oM5V0BERd+eJNhtgZfFLhcOExWMeUV11
         SDVkNA80BouMZ/k8QFFreXj0uLnEqXep31JJP1ZeGYQrubrdf1ZjHqWtmAS+aOoBip+o
         JNlw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C8pT92wb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5f7681e5fsi772849385a.81.2025.03.31.16.05.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Mar 2025 16:05:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C8pT92wb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzOBi-0006qS-VH; Mon, 31 Mar 2025 19:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzOBh-0006pG-D2
 for qemu-arm@nongnu.org; Mon, 31 Mar 2025 19:05:01 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzOBf-0005m1-J3
 for qemu-arm@nongnu.org; Mon, 31 Mar 2025 19:05:01 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-39c0dfba946so1906029f8f.3
 for <qemu-arm@nongnu.org>; Mon, 31 Mar 2025 16:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743462298; x=1744067098; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YlaEyhXAp6ocXg8HeW9O6/zASqUSt0dLhdV4fK8vO5o=;
 b=C8pT92wb0FbRLoZD05rAyMUuPZU+OvOpWqBa7MhNug4tr2LFb56MmepYb17293eUOg
 7UG45qPUPNKufVBMgTFneG+8n1mJQmFiD9brduhTjtyZWMvxYPfZrjaA46Lc/+YOfmFF
 GDPfpdYdl1jzpokQfaS9PQHuwMPWcrZ5Y1W8GAPTixZVqDrPWyjBLIQXDpefg7VFoDdx
 qK49geabIZiA2FuPzWNsNRUuSaiJYcHx9NjyRVLDcS0dpLnhQ03XF5xWdiNXmYiKnKT9
 3tPACA76V9vwflyIKsykY5ZyxYJo/qnroDwvuy3SdBamb8EOVicWPjHs5sStWSGSSNq3
 3eqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743462298; x=1744067098;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YlaEyhXAp6ocXg8HeW9O6/zASqUSt0dLhdV4fK8vO5o=;
 b=ne8RSZ3d823pTHBtBuoz05KL8BnXew4y82sPiSOXOA01ob3qZGqGnJpjNsd0xAAumX
 b0sL/XO7Ipb2eAZn6I2NNfISgVQo/VerlwjD3WE6CVAukJFShw8/WydS8rN+Zy5VI+GI
 gQR3pOCbRWo9KC0VvZttTbIMXlii+n2UvD7/rr3ljjYskSTM5rbzOd4oVXBlugY+PePo
 jaCxokTOb+KKd4UhsTszaGww9Uoa2pMoK1BP/8lwojnyPZW2QT4hZ/8AdAme214GSZ9Q
 M0oIztqvIX4MSZOuiZEUfovexdr0c/vRVAmJ42EM4nba90HAG3VDaPEJH8Zx3wmhuwx+
 P6Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq2Ws55RisiP2jsswkQZLRrgwuu1OqfszM02GU8hQYSfxbfk2mp5AvB2b9+Vtk3bPWvq/oipTwGA==@nongnu.org
X-Gm-Message-State: AOJu0YzwmsCLIlYVRTduuXCTj9aatM8CXqal1HqHVo9cDZbQKixMhjit
 kdmj7d9rfVF5GXuH2M6aCFxoScpPA9VB2BoSoH8sMJabrc5BuxDkx/UK99bShBo=
X-Gm-Gg: ASbGncsiEXDuFFcYG18VCzsAJfN3dSpImV4q1YFxWmBT46gd6i5vKfDxVbi4L9HjcgN
 wvlJLlpzr1uN/pgyn19JLiPM4py/xTOA1a7ZIdG2Ad2UOecYwoekYOIbR75ScvOewm/WyVdGJSY
 gn9KvN3r3QrpsBeyUELq9a4xb8UozcUWq09/BS6wpqLH8UuGRwlvgVAlF59mXqmf4xb0ww7UsuA
 W1ksBqXAdAsj9iW1TAHh7SJB0PH/K15r7BvQ1ZCnsXzPjrZn0qAradWIcOnPIYGJFcPJGPlvrva
 vxjGLQaW6Er1zqceeOlZp/ZS7vsyybbSpZXEHYZeLZQBjlLuajOlYNumx6OVDIOBPzxC58wUWim
 VFWi8Z5OdDHdZiul5xQxw+R0PIdh0Eg==
X-Received: by 2002:a5d:6d8d:0:b0:39a:ca04:3dff with SMTP id
 ffacd0b85a97d-39c1211805dmr7884916f8f.40.1743462297814; 
 Mon, 31 Mar 2025 16:04:57 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e0afsm12611613f8f.65.2025.03.31.16.04.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 31 Mar 2025 16:04:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 2/2] hw/misc/aspeed_scu: Correct minimum access size
 for AST2500 / AST2600
Date: Tue,  1 Apr 2025 01:04:44 +0200
Message-ID: <20250331230444.88295-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250331230444.88295-1-philmd@linaro.org>
References: <20250331230444.88295-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: nsbCQJh/OvMs

From: Joel Stanley <joel@jms.id.au>

Guest code was performing a byte load to the SCU MMIO region, leading
to the guest code crashing (it should be using proper accessors, but
that is not Qemu's bug). Hardware and the documentation[1] both agree
that byte loads are okay, so change all of the aspeed SCU devices to
accept a minimum access size of 1.

[1] See the 'ARM Address Space Mapping' table in the ASPEED docs. This
is section 6.1 in the ast2400 and ast2700, and 7.1 in the ast2500 and
ast2600 datasheets.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2636
Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Troy Lee <leetroy@gmail.com>
Message-ID: <20241118021820.4928-1-joel@jms.id.au>
[PMD: Rebased, only including SCU changes]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/misc/aspeed_scu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 6703f3f9691..1af1a35a081 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -443,7 +443,7 @@ static const MemoryRegionOps aspeed_ast2500_scu_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
     .impl.min_access_size = 4,
     .impl.max_access_size = 4,
-    .valid.min_access_size = 4,
+    .valid.min_access_size = 1,
     .valid.max_access_size = 4,
     .valid.unaligned = false,
 };
@@ -787,7 +787,7 @@ static const MemoryRegionOps aspeed_ast2600_scu_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
     .impl.min_access_size = 4,
     .impl.max_access_size = 4,
-    .valid.min_access_size = 4,
+    .valid.min_access_size = 1,
     .valid.max_access_size = 4,
     .valid.unaligned = false,
 };
-- 
2.47.1

