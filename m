Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp1870350ejb;
        Thu, 20 Jun 2024 03:20:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWVQg90VDJu3JgNgHK9Wnf/yMQ6V4VAAehfXecuyfhvsvAS3GtUDW6Xt/X0yzIG9dQ/VxYmfTu8GdqKdOar3+NPyhDCzmcg
X-Google-Smtp-Source: AGHT+IG/8pOFbyBMEKadZNENJa17JP/bewqBpXVk6eb/1MezDxgp/rpHuaghQp7LoqAbf8o5G8KC
X-Received: by 2002:a05:622a:309:b0:440:480a:8b69 with SMTP id d75a77b69052e-444a79d934fmr55121531cf.28.1718878850119;
        Thu, 20 Jun 2024 03:20:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718878850; cv=none;
        d=google.com; s=arc-20160816;
        b=rlrqYU8JMW6GlxZYBzQCe9G7Fy7Bu4JnwkRU5scge8ckAL+wEbpvfr5xWcIS2rWrtO
         BL042JvViHzJMn+24rfWxEqVQqBXIj8r34DYswd2GAp35UX2gbh/D514gW9+G9upJDO8
         k3hOviWm/QuN0jdU1wJbS6W+4UJTomYV4LejLEPu3ukqtK+TYBl0A2O3k3qacV3y3Yeq
         LlGyb4d82eMDf2kvuvjiQfFdyT0GnbHgf+06AA35laTnInOg+G/4bnBo1sJV4NfdbOP5
         Lc0grO2Y9zDU6u1JW38E3kEKi/yZJZ0Wn3uTElhjRakpSmEkZs3ScxaIyobJhuJdqbWL
         37XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:content-transfer-encoding
         :mime-version:message-id:date:subject:from;
        bh=+ddQLvIWwsn9rA4bFFu3/C26Y4Gem37ETtivOqIttts=;
        fh=V5vxXQ+IqdfQGwyC5zGLWXOc0z8EtcFzLjSj1F25uQo=;
        b=xaAKjiFPNFnqRF12gBbHA/viASx+u0mjmfJmLEFLbg7J4CH7X8nA9NQBwZ1hw39XtP
         HLm9oz6vNl2GsEUNwec8ADpMWEqopu+K8HNuEyFeNIYoXUlpMzZHUp0ibL5nUNR2X45j
         r2tyoS+BhDJ2FTJDv0BsZKbfrG0MIJ7bWJ2hgLikJAFNvZTWoAQkf15CG8vVatVzvD6t
         1kyrnzoEM4mhNzerTarqwJ1MxwR5RjadT5xDJmPVURtKY7f02t9hpOsQnrYBPLg8206O
         cnPn0LXLaZxvOKupvSGm5UWxWF0ry/PS/ee3bySlSVQxv30TyFO0HzJGSxvRKtNsVxHJ
         gzlQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-441ef3ba1aasi158716561cf.134.2024.06.20.03.20.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2024 03:20:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sKEti-00020m-4C; Thu, 20 Jun 2024 06:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sKEtf-0001zW-PO; Thu, 20 Jun 2024 06:20:03 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sKEtd-0001Sz-P2; Thu, 20 Jun 2024 06:20:03 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 8121D260836;
 Thu, 20 Jun 2024 12:19:58 +0200 (CEST)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id aqoDiIFGFzgX; Thu, 20 Jun 2024 12:19:56 +0200 (CEST)
Received: from applejack.lan (83.11.22.244.ipv4.supernova.orange.pl
 [83.11.22.244])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 49F2C2606D1;
 Thu, 20 Jun 2024 12:19:55 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v3 0/2] tests/avocado: make sbsa-ref working with >1 core
Date: Thu, 20 Jun 2024 12:19:47 +0200
Message-Id: <20240620-b4-new-firmware-v3-0-29a3a2f1be1e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEMCdGYC/x3MQQqAIBBA0avErBswC6WuEi1Mx5pFFiNUEN09a
 fkW/z+QSZgyDNUDQidn3lNBW1fgV5cWQg7FoJXulNEK5w4TXRhZtssJYWNtcN77PlgDpTqEIt/
 /cZze9wNwdyYLYQAAAA==
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Leif Lindholm <quic_llindhol@quicinc.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, Cleber Rosa <crosa@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, Ard Biesheuvel <ardb+tianocore@kernel.org>, 
 Rebecca Cran <rebecca@bsdio.com>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3vLIYjOOwGng

Recent changes made sbsa-ref crash when more than 1 cpu core was used.
We handle it in firmware now so one patch updates it to the working
snapshot (TF-A 2.11 + EDK2 snapshot + EDK2-platforms snapshot).

Other change drops "-smp 1" from CI to make sure we test default setup
of sbsa-ref.

Previous firmware worked with 1 cpu by pure luck probably.

To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
Cc: Peter Maydell <peter.maydell@linaro.org>,
Cc: Leif Lindholm <quic_llindhol@quicinc.com>,
Cc: Radoslaw Biernacki <rad@semihalf.com>,
Cc: Cleber Rosa <crosa@redhat.com>,
Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
Cc: Beraldo Leal <bleal@redhat.com>,
Cc: Ard Biesheuvel <ardb+tianocore@kernel.org>
Cc: Rebecca Cran <rebecca@bsdio.com>

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
Changes in v3:
- first update firmware, then use all cores (for bisecting)
- changed commit message in 'use all cores' patch

---
Marcin Juszkiewicz (2):
      tests/avocado: update firmware for sbsa-ref
      tests/avocado: use default amount of cores on sbsa-ref

 tests/avocado/machine_aarch64_sbsaref.py | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)
---
base-commit: 02d9c38236cf8c9826e5c5be61780c4444cb4ae0
change-id: 20240620-b4-new-firmware-177daccc9d76

Best regards,
-- 
Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

