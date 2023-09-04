Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1452359ejb;
        Mon, 4 Sep 2023 09:28:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQkGTG8Mrv3vf3VSC2n/N0Q9pfsGmDGgkXCHA3g6k5IT7yMQRuzrctpMpdJ2fvUfDgFzQl
X-Received: by 2002:a05:622a:1f87:b0:413:3384:d43f with SMTP id cb7-20020a05622a1f8700b004133384d43fmr12714023qtb.11.1693844918599;
        Mon, 04 Sep 2023 09:28:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693844918; cv=none;
        d=google.com; s=arc-20160816;
        b=dOcZxuoDdcGI4VFTV56gJ0g9mq0wnkQaMoTZCuSAxU9Pda2g7J/y3d2ROw1kgv1Q1R
         rA9Y6fPjPPzGd5Xw4cYA83BXhIfv4BJMsAUTSaKroSFhX5XWF3uZEoit+fw9cPSoVDwO
         eCbe4pwq/O825ivXnObynto8vXCEb8emIPQu3Dv4+yWswcptqH9IY+WjT4Lntd7GiK+/
         cvhajFJeO38JLUA+n4q6KghYwtl1N4LvqD3sLjsE76NNixGwGFJ6Zl9KmnHtqP1RiJay
         zxFbPP8tjI36TY37sMcZVBjMUa5OEjWtm7Wwmchro1IleWjX6CV07aOUxZjTYksrlH+u
         SQoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=3IKuhws/bAum6TTbwOlIp5IuJegkUw+g88cYhxcpc0k=;
        fh=A7Ia7tX9RZuNaScQIb+u8dYQIqnop/JsEnAVIUNgUWk=;
        b=0+ZZPjxNV9aIf7BRRGdzV9anedGVT+99NHH+oVjO4gm2ObBx7NDzsT5B15b0NbL5q+
         RFHTcrjmYLADIoMZbw5sSQA50oJa6fxnb7zsns+gqL09qM/BjdnvZpE/oHajAUwp+crZ
         ozyX+1QUoAp25zPBd4fpaS48vu37vCTjhycuL9UsnkW3J/HjJiDuEW1l45diAF1Jg0Kx
         YBWhl5We7RRW+ZDQfD1M3gDthdM9U7gIpktg99bLlMo3ztA5aGN44IapnzdXTk+amn9y
         Fzi8Kqzg1yFr8p4vaHa2QjVcL4bACmtNCGweKy5b7so/hmqVd5bulq9AnszWPCntwqyX
         FkPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YO0Ubzrg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9-20020ac85ac9000000b004109f0847b5si6699232qtd.682.2023.09.04.09.28.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 09:28:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YO0Ubzrg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdCRH-0001s7-Sk; Mon, 04 Sep 2023 12:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCRD-0001qd-SX
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:28:31 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCRB-0002Ho-Ed
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:28:31 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-99bdcade7fbso236002266b.1
 for <qemu-arm@nongnu.org>; Mon, 04 Sep 2023 09:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693844906; x=1694449706; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3IKuhws/bAum6TTbwOlIp5IuJegkUw+g88cYhxcpc0k=;
 b=YO0UbzrgdjgB42DprpS3yLYl241AkLfjeNs+vqYR7CdsHqLyHi7zNr49lAHp/QDX9D
 Oia6OlzdUL1Jtrp3tvdnbzrQh0a8XZuvR8IG/TmC8DKaP0/6dZX8WrEcwoQ/vxyf1T5R
 9zANgDP5LytbMJlTfNDgfkYrslqh/T1hUtRjb7t1fRFYiEuHDyp7RGX9CSf2WA/P8rgF
 YJonyzEsM7/NkwRYYJZlnat3BgzA30t4D9zpsrs1vyQgRMA8bQi2f+vHoDNP2ZFY+RJ6
 VQOoVP1YZ8vKKOjzAhlTG0arq7FSsvDWUnxCSB6+k/rl6a1MN1zg+06uSeS/82KTLJXp
 rIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693844906; x=1694449706;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3IKuhws/bAum6TTbwOlIp5IuJegkUw+g88cYhxcpc0k=;
 b=h95RUQN6ybPYm0lXAtn++AOonLssuBNCncH0wjpEJ+KuA514xSva6Dlb6YE6hlvbh0
 O0V34eT8/WYmFk43gx3FtJ9UIJkgjBvf18j5CCri+JbMTeBoNyQc9buMHwX4m+wtNDEN
 yJAHDLoyq9d2Kpcv2TUFzBiwuuqAlK+bFZYdGN+EKbO6BdU884AYfgjYP11jpQuUr9+z
 +AS2xCWToElM7Aq88XD8DEBTMcJXdtB9zTpvlPhX0s5DzQlqvuxsUZVS+YpaBEupe47w
 e722zCOQIZiZFbqbMJv7A6p/CjN1WO+WytgmPMd8I0lzgbyG65Q8lYAiK65N452oX0AK
 r7OQ==
X-Gm-Message-State: AOJu0Yw+ddcweZZLHPV32Ejj+P+804z+kuwJjyeqzLt3xdGlC6/mKnC1
 Fc0Anaq+RtVUqaLEmnlldhcRscQ3gv50UhUHqqI=
X-Received: by 2002:a17:907:a076:b0:9a2:292d:ea60 with SMTP id
 ia22-20020a170907a07600b009a2292dea60mr7555853ejc.40.1693844906698; 
 Mon, 04 Sep 2023 09:28:26 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.209.227])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a170906248700b00982cfe1fe5dsm6384747ejb.65.2023.09.04.09.28.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Sep 2023 09:28:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/3] (few more) Steps towards enabling -Wshadow [3 more]
Date: Mon,  4 Sep 2023 18:28:21 +0200
Message-ID: <20230904162824.85385-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
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
X-TUID: Hl98Hbvo/DfZ

Just missed while posting v2 eh :/
(https://lore.kernel.org/qemu-devel/20230904161235.84651-1-philmd@linaro.org/)

Philippe Mathieu-Daudé (3):
  hw/core/machine: Clean up local variable shadowing
  hw/intc/openpic: Clean up local variable shadowing
  tests/qtest/pflash: Clean up local variable shadowing

 hw/core/machine.c               | 2 --
 hw/intc/openpic.c               | 7 ++-----
 tests/qtest/pflash-cfi02-test.c | 2 +-
 3 files changed, 3 insertions(+), 8 deletions(-)

-- 
2.41.0

