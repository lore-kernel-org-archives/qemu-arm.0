Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1911712ejh;
        Tue, 9 Apr 2024 06:39:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWetlPqsNko6OwszUKh4bG/g6M6CCcs0UQsQyip+wQgOnm6HG7ddP40ONbSGlKJV2FN7JMtcOoo/1kSlcJoSNM2M7BMq/GU
X-Google-Smtp-Source: AGHT+IHpjL3fkVtRckwtvXyZ+39ixva2XGMj7sasJVN+cR+Jcnnfw9VjJ2qYNeEese8zvYPEKLS5
X-Received: by 2002:a05:622a:4ca:b0:434:8bd6:2c2f with SMTP id q10-20020a05622a04ca00b004348bd62c2fmr4357130qtx.16.1712669947202;
        Tue, 09 Apr 2024 06:39:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712669947; cv=none;
        d=google.com; s=arc-20160816;
        b=AvNATLkQa/d8SNTnhJJsH5ceUHCBL5iYR8z2nR0d8INYf++Z5beZXHcGWqEGIJuutL
         cfK93IYM59zz8QSH3V60oBTVbLfj6HCek0rKyYy4WiAF7E6wkPkfjt3rLaKiX1oB4c3d
         IWUkpEqM3AXzealtnJ5bMcAxPw7ZdKEaXAMpYXxY33GKSOaTNs16O0IbXUai4R3ME15K
         sc7PQQcvr8KLSmiuNACBDG2SEPnXwsIDiANkTQp3BemE1VikXi3FUA0JBC8HJT9lUPnq
         VvCXYUmWYW6hie/u8ZSa0WMt6ThLYZRYyG9pucGpzQ/BR80s5XfLBlug4sDQgoR0Tb4P
         TeqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=vC3gmGFS//wOnrZqSqcK6FVhjByf7WW2EZPOHgM5S+0=;
        fh=QOl9Xi9nQ721K4qxGgLCqy+fNk/yfBHdpOYFmb4mu2g=;
        b=yec6MvUaIY1WLZtw6dRkC70i0SLxwxzW0yR3TJwfpWCxtX04n37UAMWAd+iECWL5T8
         V2KsjCV95bxeLjKLMvU20omZ5aaq78V2K96nX0zmNIIuzyNhwo7pHc+Yxi/IAwlRAoO/
         YIj9koEfofE5fWlp5EI3eF4g3PofDJk21oB+kujayAfDIgFSQV4hM6kFQyRn6FTabmVL
         9hQSF35Uw9WPvtKwVX28okShBs21vsFfdfCVdYUjFxCADKKlelI+WDarev/tmBVEtLOK
         LHKfsWRQiNYw4IMFlGxJe5OPPO9hA7UJjVBn3ho9Dvl7DzAI02d19NN2X1wWNqAorjop
         E0bA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ns31C5AE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q20-20020a05622a04d400b00431819c0570si10455874qtx.721.2024.04.09.06.39.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Apr 2024 06:39:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ns31C5AE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ruBfs-0005mH-Op; Tue, 09 Apr 2024 09:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruBfr-0005lw-Bg
 for qemu-devel@nongnu.org; Tue, 09 Apr 2024 09:38:07 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruBfp-0008AA-N6
 for qemu-devel@nongnu.org; Tue, 09 Apr 2024 09:38:07 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-343bccc0b2cso4086314f8f.1
 for <qemu-devel@nongnu.org>; Tue, 09 Apr 2024 06:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712669884; x=1713274684; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vC3gmGFS//wOnrZqSqcK6FVhjByf7WW2EZPOHgM5S+0=;
 b=Ns31C5AE2r0CgJit01MP77FDt3WX9hYin4EO+OrHAVNoUORdE2elo+Ywt7p4XWljQO
 ImMz9LpekzwcOkydDu0dDFLcxTHTaFZOUbZIwrmq0voZ5lJsjGtTsiinKP1okDPdNS7M
 icUYO//FeAhphweoCha9RXEc8LHsAHgzThLwjLV9f6NSothG4IyVfPKUeny7wY41EMhf
 PCcZqlMY63YNJY66qJN5u/JlTihHHFzXAZGP87dUIOqCspwCAR9vTa0FJxI6YGXSe2Eg
 vwbkYVUSidqx4GJDZd9RMmKwcFCEGNpgEQueaWDyi00uZ2/l/L41Bo8XJ9HKzClnGsRA
 rf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712669884; x=1713274684;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vC3gmGFS//wOnrZqSqcK6FVhjByf7WW2EZPOHgM5S+0=;
 b=uZrtPecDoCns2Bopq6rQ1Na2y0oYiiMlpSpucFqKD+R911cLFzm1RRKzLrR5YaaMaz
 VY+4wrhzBK6Uoc8f28W5m2rEVB9lbP6RawvnDPBygeJTs5Shlbhy/wKYL+XdEfFrFJIi
 AVz2gFVH4qtwlkQH8a0J8tzjNzmIYNCv4HTumGNwAEtvQ2rHj0/DUTQrj99QNiqzTKBy
 XMRJao6pDwoxvF9TuiCOB0gu3CoLaNueCJsPwkL+GpVPxMEXjh9QGMemNhdTGHc4DI5u
 0592Ufvm6IF1cZzdfAYsghCPo2SBqio5jfSG5KQsT7VzU8zYCF66pwJa0nVuH0bY+DIL
 jBBg==
X-Gm-Message-State: AOJu0YyE6NPzV+CrKM+FZmbWNTRoRQZYcS9LG+5+eky9iDqm1O/7Zdo5
 bwMP7XVszAxyPsIrrDgZNstEI6ub6lJIQSYi8gkqeHqM6gALsSMVFuUsx7E+l3naTmayzQpodoa
 Q
X-Received: by 2002:a05:6000:544:b0:346:311c:32f1 with SMTP id
 b4-20020a056000054400b00346311c32f1mr1308231wrf.50.1712669883810; 
 Tue, 09 Apr 2024 06:38:03 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.160.134])
 by smtp.gmail.com with ESMTPSA id
 p9-20020adff209000000b003432d61d6b7sm11468603wro.51.2024.04.09.06.38.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 09 Apr 2024 06:38:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Chuhong Yuan <hslester96@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 v2 00/11] hw/net/lan9118: Fix overflow in TX FIFO
Date: Tue,  9 Apr 2024 15:37:49 +0200
Message-ID: <20240409133801.23503-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
X-TUID: pitL4yKbfne3

Fix for https://gitlab.com/qemu-project/qemu/-/issues/2267

Since v1:
- Renamed definition as MIL_TXFIFO_SIZE
- Addressed Peter review comments in patches 1 & 2
  (add comment, return TXE INT)
- Trivial patches while digesting Peter's analysis [*]

More work expected during 9.1.

[*] https://lore.kernel.org/qemu-devel/CAFEAcA8vvURMn2FaDP9tXtP5eCMs6-XFOCR9ypo=WBH+6g5prw@mail.gmail.com/

Philippe Mathieu-Daudé (11):
  hw/net/lan9118: Replace magic '2048' value by MIL_TXFIFO_SIZE
    definition
  hw/net/lan9118: Fix overflow in MIL TX FIFO
  hw/net/lan9118: Remove duplicated assignment
  hw/net/lan9118: Replace magic '5' value by TX_FIF_SZ_RESET definition
  hw/net/lan9118: Add definitions for FIFO allocated sizes
  hw/net/lan9118: Use TX_DATA_FIFO_BYTES definition
  hw/net/lan9118: Rename tx_fifo_size -> tx_fifo_bytes
  hw/net/lan9118: Use RX_STATUS_FIFO_BYTES definition
  hw/net/lan9118: Rename rx_status_fifo_size -> rx_status_fifo_wordcount
  hw/net/lan9118: Use RX_DATA_FIFO_BYTES definition
  hw/net/lan9118: Rename rx_fifo_size -> rx_fifo_wordcount

 hw/net/lan9118.c | 104 +++++++++++++++++++++++++++++++----------------
 1 file changed, 70 insertions(+), 34 deletions(-)

-- 
2.41.0

