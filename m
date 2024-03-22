Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp1273043ejv;
        Fri, 22 Mar 2024 08:58:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXlPkI/qs6CwBfmwaE+PsVRJt3cONHX7R3f/Yavw77qPD2/SA6nTPRVDzrhmyxGE5qqQTr1Pl5Dm1S+xn71iN+ciCdoqjqb
X-Google-Smtp-Source: AGHT+IH9mE3tGvMLDOZ6uZ0L7ASGLqdAgwP9bDOpWos/LSK6MUSVpZuuJXRUftCT3VQYaqnRJzpD
X-Received: by 2002:a05:6808:3cd:b0:3c3:7721:bd0f with SMTP id o13-20020a05680803cd00b003c37721bd0fmr102268oie.27.1711123111518;
        Fri, 22 Mar 2024 08:58:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711123111; cv=none;
        d=google.com; s=arc-20160816;
        b=N7Rzb/OoTDD11vCzUTpLtHcXRamj7LlQiHKQTvOzgVz8F5A3aT3lVSU/njmefgJeea
         M0TvASb3I3yB6oYiLOfY3R9yWKe1lze2IFfb6fWK+2X58XLGyKZwrx89gKwfe3quLgbt
         Xo+9rmRq92Khpfv41Bakv7xbviwCUqswQpuHZXqkSoU58+OMaJmf8DIh//ZBjVccsHV7
         iDCds8XjFhcRjLxHbOv+xFgxueZek8pinFc7x1KwZAPbI6t5ae+YymwPybRyYE6lqAcf
         iS2S0wDcoUGjdWYGK5V2Ect504iu50T3ECec4fiNAQcpjmtkCwRCinwA0eUcrm8kzjU1
         fVTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=+fOM1vzhhoXwFohG+Qy5/7EBij4qwGl2aH9+HP9YMpY=;
        fh=RSjDZf0NqHus22mgjAXg9IL1YCdRql2eKSnlNs06FnE=;
        b=D8TirU582ubaBf6auZDBUT6NQbDzvPL4V2YfLOkufo9y0G0WApCg+3/j7u7vw0FsZw
         OSJWLH+aFjKkzdoUlkJyY9cV09pDlHUP2UwsDkI93eMzj8Lr1q2+ClVyAdQI/bPp1+fj
         Zsi0j6ghKMhS1ZW9NQCxjTa6Ozu0nFIwmUDN6f7HtHHjtB4MagtIVWKBUM//sZ8C8Ufz
         yyBSIRI0FVm6SavlmbJrhd7x79CTKS2PJ/dr5g1CWwma2D+KWO9Ch2oXpQi3DCu9hP6S
         GjEEJ9gGqEtHTMaT+5TJP8gSdG76AxY4cVhpvWjUqxzXKv8lJT4ODiWaabFdbCQckokV
         gc2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tTOAULZM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f36-20020a05622a1a2400b0043139be7363si411846qtb.597.2024.03.22.08.58.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Mar 2024 08:58:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tTOAULZM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rnhHi-00017V-EV; Fri, 22 Mar 2024 11:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rnhHe-00015p-Vb
 for qemu-arm@nongnu.org; Fri, 22 Mar 2024 11:58:20 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rnhHc-0005Zp-4C
 for qemu-arm@nongnu.org; Fri, 22 Mar 2024 11:58:18 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33ed7ba1a42so1241328f8f.2
 for <qemu-arm@nongnu.org>; Fri, 22 Mar 2024 08:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711123093; x=1711727893; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+fOM1vzhhoXwFohG+Qy5/7EBij4qwGl2aH9+HP9YMpY=;
 b=tTOAULZMWZu8CC8X8JNGyLWLOvl6BnStOgFzUfgfutUobxFuTeEtC0cLMJOChQlxJp
 5HjIzxAhxKNOtt9ZRjBvkGGtSFEjtxFMz21jJPUT4bWGKvm2Fglnp02nG4jKcVwvCaOh
 T0AM3mHxg9F4nYnKvRO6hQzvOtdtGIeek1bh8IwvpsWCjqWz6PG9Ku1iBbV/vw1p05fV
 LIA5C1hXAVvMRCz917BYt8DKKUwBhErzNF671p3ByGxQqPlQ1MG5fq+hBdfY5gGzsuQC
 3wfWHBr8jJE/vD4Ydu+/q1yeHws1jrmK2DtiMJ7IdS7mndu3exmjHFIBlZfCDN6Y8+2n
 jQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711123093; x=1711727893;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+fOM1vzhhoXwFohG+Qy5/7EBij4qwGl2aH9+HP9YMpY=;
 b=O1cG4NDLvKNdgSeWoPa3/C5UZUs/HMCNS2r6sL7rs0xKDuvj9oT3/8PPe3PtRjMfpT
 jzVdcb7iAAqz+I3UrNBK8e6OLfq3vRH5IjIecHezdhZJYczLg29QH6njguYWgmKsT0G0
 Ebzoh23irGMOiOhU4hzjTOWnEdwoGEH4VlAKzdY51FZCaAd3dO2KPSAHxWYh/6PfLLW8
 aOyPqpnjJ9nlK4Z6wo2lyGKzsTgCSm1OGQVKDCaaPv74N1xZh4VLnNj/PXL4sNc/vA2j
 +5why8EIKJk8ubupoqTmObB5wuQW8tAtpI7/j5ehLtoQaVRu/od4JKDLRnRqdOH1G9yj
 ERJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFGMLHhMkBxasrcqzwu9SKjiV9+Z+qapIZNxb85sdX1T2oufwZBYWPyKZi3iTzV1fyivGjLU/oyV+dOZwT0iUjIn7w
X-Gm-Message-State: AOJu0Yy3k2UH3y/PBz54R9ZN7uLenfoH+l1mgLipJi+0+Gg7HWLtPuiu
 r85pJz3hLWDHqnDyqdWYYYFFYlaEag1xs0x060oxc/YPnrrEAdc5QJDrMLC5HDM=
X-Received: by 2002:adf:e54f:0:b0:33e:d8f:3466 with SMTP id
 z15-20020adfe54f000000b0033e0d8f3466mr2098172wrm.33.1711123093568; 
 Fri, 22 Mar 2024 08:58:13 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.178.251])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a5d6107000000b0033e9e26a2d0sm2333672wrt.37.2024.03.22.08.58.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 22 Mar 2024 08:58:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <luc@lmichel.fr>, Luc Michel <luc.michel@amd.com>,
 Damien Hedde <damien.hedde@dahe.fr>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 0/2] hw/clock: Propagate clock changes when STM32L4X5
 MUX is updated
Date: Fri, 22 Mar 2024 16:58:08 +0100
Message-ID: <20240322155810.5733-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: 4BewpUkC9K0k

Per https://www.qemu.org/docs/master/devel/clocks.html#clock-multiplier-and-divider-settings:

  Note that clock_set_mul_div() does not automatically call
  clock_propagate(). If you make a runtime change to the
  multiplier or divider you must call clock_propagate() yourself.

Fix what we forgot to do that in recent commit ec7d83acbd
("hw/misc/stm32l4x5_rcc: Add an internal clock multiplexer object")

Arnaud Minier (1):
  hw/misc/stm32l4x5_rcc: Propagate period when enabling a clock

Philippe Mathieu-Daudé (1):
  hw/clock: Let clock_set_mul_div() return boolean value

 include/hw/clock.h      | 4 +++-
 hw/core/clock.c         | 8 +++++++-
 hw/misc/stm32l4x5_rcc.c | 5 ++++-
 3 files changed, 14 insertions(+), 3 deletions(-)

-- 
2.41.0

