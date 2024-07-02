Received: by 2002:a05:7022:ef0e:b0:81:d0c2:543b with SMTP id qy14csp2372487dlb;
        Tue, 2 Jul 2024 07:09:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUlmFyjvrFOQ9aO1lSRTCeud0JLZSwFvstwsnrdcKHPF+pGCbDKjKlHHH3TrDM0hAmmB9XNEHRcPM6o8bKOWJHM1XECMLwC
X-Google-Smtp-Source: AGHT+IEhow4YLSGnmheXMWTFF/1EhTCmv7O51X5TFfYtEHQTy8J8xBUBW7W9sM14KDAGd1Slrltk
X-Received: by 2002:a05:622a:10e:b0:444:ed2c:7ad with SMTP id d75a77b69052e-44662dc9f45mr119690041cf.28.1719929385146;
        Tue, 02 Jul 2024 07:09:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719929385; cv=none;
        d=google.com; s=arc-20160816;
        b=PNgtEPyDGytx7hU7XZJk91MD7+ktU+xXjfCCQgoYJoWwjQ4r1N+xltCjglOgpNR+Gh
         YD4q2y5I2kp8AGBhJF+sDabQaUts/XsK+ojDA7qS2yGuFKRMT7eB3oC/rgQ1PLmK5cb9
         Go3f6yw+U9qA9UI72IF8au3b/RB48I2lOkYtP4agMXr1fDmRoLKdY0P3V91u/hEe7iEc
         sQDQSIplBvvqkXNSFP0Y/jg1jCJo1wIYcwEZMoB1fdFOTWoRVsuMCCUM2FfvgFb9TCe+
         Nc6geavztmXxWT8iG245RO5ViPC82VEf/4FJfz1Zwqap0JqhQPUXptw03sphEMQl50pL
         4Zyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=uvjGohX9jpqU4S0vaNGN/OLaq0Blh/PgFGJDO8c8dTs=;
        fh=zitQEwJJWEJuUD9eaWhmfHlCkffqVj0+D1PsWRlDQM4=;
        b=LIfCpPYWGqTY9g8hF+t+AjCUCoIqZVP98Avnc8dXTGgERZtwtm3B649MmpOACKhW2I
         HlwPORvFeIF3fC5s1LxxJ6BjxS0e1AKyrz6vhre5KXFy4QuySzMsl+w0hiyfrPs0ZVN1
         SDdEMC8xisaPEwSZ5QURwP9ICrryuX4V1fIa9cR/+BBKlJ2GIqhRUpIx5Rm7D1r0ACCz
         BFygLUqKvNVDkifl6+JD1hT8gyDCW+G6PUbtAozVlQ8jZY6oA28EC3g1tms9fTE2ZcDa
         RMlIlcdXZM4XVMWnqTjPs09F6yU2heiPoDlvaYqTUWA9EvPEGTQBDRUphKmtpfeEraTu
         UXGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QSz5sBDG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4465148a7d9si104344181cf.325.2024.07.02.07.09.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2024 07:09:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QSz5sBDG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOeBq-0005M8-1R; Tue, 02 Jul 2024 10:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOeBi-0005Ao-Rb
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 10:08:56 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOeBd-0008EN-2s
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 10:08:54 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-42562a984d3so29883135e9.3
 for <qemu-arm@nongnu.org>; Tue, 02 Jul 2024 07:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719929327; x=1720534127; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uvjGohX9jpqU4S0vaNGN/OLaq0Blh/PgFGJDO8c8dTs=;
 b=QSz5sBDGjTzLMQhDBf7pxGa0X0wmLFkpobBO0ac9ko0Bml/gWdmobFQa4IhO1G1lvM
 yM6j8Ayy+g4Kiskc3NODIJ9Mj0ieQAlcOk2gUmuKbyYsTt7+0W/USb8i9ZvXABfRRzZ7
 MwdtF1HgszTAUDhYZxgPppqfHCOcMgraaZUKFohvPi9d0yuzuNfxX98I/jy58fdiwa5i
 CVKISAo+ghDRunov+Tez/eOsNi9srsREGhLBZZ6HNMjHoGmARewD96JIcXLdm0rI6DgR
 /ooCybvO9BRJwH1yfMG0UakUj8z6vsHrrow1SiqIuZ7FNi/WtruaK5Vn4Xw86lKa0MkY
 mIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719929327; x=1720534127;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uvjGohX9jpqU4S0vaNGN/OLaq0Blh/PgFGJDO8c8dTs=;
 b=C0M4LKiWegCILSDoPxD8Sqlp8EGNtGPWYAwaLEk27MzN96fXF0n43bjW/xKlFW7R1R
 3CflH9jZSVjIP9jEyyqvAzq+2JfWcUVxb8KAO9Ylw8O/YuOTMfWC9EUUrHAiMfh2tUJv
 HXcVRohhDIlEgA3gJIyGPLS7PpWIqYZ/3YeRvYzp4EPIOY+mXfc8V4v6w6ff6GuSCi0O
 2cUaBjbNeLarTWBUJbyrVTcHTcevAxDqB5cacNvmvLExWyqzeIFrl4Oo2trorq2CLxAO
 Gz2fKE8AqDwdmpc7nFjtK4fOOEbC5p1h3puEqvaaE4Uj5YfbhcRQCu/dKiH12wuX42vL
 BIIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWYKOSDnwYSLlLqUPOPuTOJca3inLYR3K+KUqqm9z8/MXHekxonCvbdyJ20sYq13a/02UCm/tU4LJ144+wh7zvMWF6
X-Gm-Message-State: AOJu0Yx6/b8gBpZquoYw91pmaH5Fv6Cc/GmOwSjmT02DCfNq17aUHSgr
 SExo24G12y5B/VAO+mmpy3jgJzIVMvsLytPqVb9N8ABbw3LrT2vzBImk/YBWYls=
X-Received: by 2002:a05:600c:35c3:b0:425:65c5:79b4 with SMTP id
 5b1f17b1804b1-4257a02b6c5mr65427185e9.26.1719929326704; 
 Tue, 02 Jul 2024 07:08:46 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.209.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4257fb4fabdsm106739375e9.46.2024.07.02.07.08.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 02 Jul 2024 07:08:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Tyrone Ting <kfting@nuvoton.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hao Wu <wuhaotsh@google.com>, Thomas Huth <thuth@redhat.com>,
 Shengtan Mao <stmao@google.com>, Chris Rauer <crauer@google.com>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Laurent Vivier <lvivier@redhat.com>, Luc Michel <luc.michel@amd.com>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Patrick Venture <venture@google.com>
Subject: [PATCH 0/4] qtest/npcm7xx_sdhci: Use card-provided address (RCA)
Date: Tue,  2 Jul 2024 16:08:38 +0200
Message-ID: <20240702140842.54242-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: H2gjViEQen7u

Avoid to use the SDCard hardcoded 0x4567 RCA in npcm7xx
SDHCI qtest, so we can generate one in the card model.

Philippe Mathieu-Daudé (4):
  hw/sd/npcm7xx_sdhci: Use TYPE_SYSBUS_SDHCI definition
  hw/sd/sdhci: Log non-sequencial access as GUEST_ERROR
  tests/qtest/npcm7xx_sdhci: Access the card using its published address
  hw/sd/sdcard: Generate random RCA value

 tests/qtest/libqos/sdhci-cmd.h   |  2 ++
 hw/sd/npcm7xx_sdhci.c            |  3 ++-
 hw/sd/sd.c                       | 11 ++++++++---
 hw/sd/sdhci.c                    |  5 +++--
 tests/qtest/npcm7xx_sdhci-test.c |  8 ++++++--
 hw/sd/trace-events               |  1 +
 6 files changed, 22 insertions(+), 8 deletions(-)

-- 
2.41.0

