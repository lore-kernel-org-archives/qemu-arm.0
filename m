Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1183985ejh;
        Mon, 8 Apr 2024 03:52:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV+28N9AgzRJ4N8YsGvx2EQLs5K4B9YIPCf/MWpsbwk3oSSl+YHnP4U1ZaDwcSz3JhoHQj+7aFhze5Z8Br+khID9d0FjAlj
X-Google-Smtp-Source: AGHT+IEckGoezB8b9dcD3V7bTrMUQT3SUlLlyf6gahGO7pneKsFnsmT7XhY4O9QOLPfVXFQJRq67
X-Received: by 2002:ad4:5f87:0:b0:69b:1859:a871 with SMTP id jp7-20020ad45f87000000b0069b1859a871mr2399220qvb.6.1712573544378;
        Mon, 08 Apr 2024 03:52:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712573544; cv=none;
        d=google.com; s=arc-20160816;
        b=KduO2K0p6vxk58fviNCEqk3yiRNh5i2yy4VWwDZ5GSqGG+koJRzebxN4okfZPpehAz
         GaYD7jvGJ5USLhxqqS9pWPSeMBtFczCHaL1pK0PbWrj8p+uszq0yVyVunBJ52phQ1ZZS
         wqKoKwlpxYMWIvt5ruKfqQubePKd2SpDd4smzMyaQNiEfAoMw+2hFtDdp+mrh3uNDzjZ
         0/G6+OGYyGYjT/zHPlHj/T2FZs4a6grVb31hnBwpBwXMDMfrs5DTEc+/xJ++PXVxyAqz
         SJs15MkNjeymb5igPtmw7UgWKnLeWf2ZyQ8B+gV2mSQqWXKuot5qjuRflYP08BqFg/iY
         kO+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=q6iDyrflcxwblwLi3mNQ+oLA1gIyXdTAF2mwb6QdSME=;
        fh=Yh9Z0AZr+VT6lUWuU3OS7LL087agt8llkF37e9Tq+Xs=;
        b=vGlpG+Bhv13GAFvVxh2r7a0JUS7uXQaxMKJE3hAdEHODnAY0rJr93I8mrJt+tBgMnC
         AcUixC56XA4hWIuX2/r/XmBSqBZiYqEoLj3LHCJMgfhOwdI5qY7Nb82l4wuOBAE5X9gK
         epSU2rHRPCYKaslAtsnz/bGww/U/x3LREBsJZbJzx3VEpHyLBWoamX5Gv+uLBlOhZSuk
         oW9ArBZWjrZM1NgOkXIIBlvu0pBnjIwOc82LD1xM5Ys412Dy6By6MOhyH0sLKk+ydzZx
         ZxJAVbuugwKpbWrP78XL+JOYeV5vP389RiWxNJtTZiLNqwD0nB+hU+YSp1azwKOtIJ4z
         mK1A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D0u2tDub;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r4-20020a0cf804000000b0069614edd5a4si7875600qvn.535.2024.04.08.03.52.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Apr 2024 03:52:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D0u2tDub;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rtmbf-0002re-AU; Mon, 08 Apr 2024 06:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rtmbU-0002pw-6r
 for qemu-arm@nongnu.org; Mon, 08 Apr 2024 06:51:56 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rtmbS-0007qd-Dv
 for qemu-arm@nongnu.org; Mon, 08 Apr 2024 06:51:55 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-345e4097cb9so203306f8f.3
 for <qemu-arm@nongnu.org>; Mon, 08 Apr 2024 03:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712573512; x=1713178312; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q6iDyrflcxwblwLi3mNQ+oLA1gIyXdTAF2mwb6QdSME=;
 b=D0u2tDubPSvq/qOvu2pEOJpXxLWxwXEcAZ9K6YJAIP+XoUNN32AvqlW5eSp5O8xn/x
 HC9UIhLZF1uxX3xl/WrloFYS1nPuzX77vmXB/aWfc9UWZTXp8xdsc5YiNRPLGAPdSQIl
 Fy2bezi+t1+Du9ZsJPfth4KFlHyTTjdNghBdn4Bm5zUA54e3eMbu9SLLRBhYL5wgP7TT
 WCaCzwK2KBV5cN/huC9JDxE/BLwius81H4mBxfNox3spessYV/HQJWKCGl0bJaqgfHh3
 2uWnIaIWypHPNNprzH016lYoF72/xMBr4DNPwOr3kjOSnBtDOzlR7WxeF4TdPG+wD1HL
 H2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712573512; x=1713178312;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q6iDyrflcxwblwLi3mNQ+oLA1gIyXdTAF2mwb6QdSME=;
 b=T8vU5VVwUD83fdV9z9sHA1uFh/XKcAtLy+tZ7lAitN4o3ksa+hsgOl/R/Q6amM7r0a
 Br0ETE1Vc3mfJHUTTRHSCQtWFX2fC0XGOOcfeCh7HY8pkQYg52haVlXcj7y3RHMSGx1H
 7489KHMKXrcQ9ueZi+hYyF/JvM8HnuDddifTmYEY1uL0qTIQd6Ru5ws4WYWjqZo4BYmS
 PaPli3ehGbkeAQWmDlz6FdMCy6b+zQxOwB4jGV+n1XoEzfxDG91hB4WOGRtwTc7znEhu
 lVdi5rNQ4duFMkWpaqFlg3jFU7Kg1ZFnl92Pcq/I1xJBCV44/uh2GmbHLQfhjC5OYD3b
 QGKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdVW2sz37fHc6xbzLrSaWrCDTDiEIxPOuRTs9NDE+IYVqfL5YT/iG9TYoLqQnr3z+RtyWiO46WlVvGsAdlLfeHxWJD
X-Gm-Message-State: AOJu0YzOoc3l6wm4wr+pouv7Vg6hlfykfSGzAAnNYmloFEO0npYhWjnT
 elVjp6owRyGz9IKnWsTrBDzHY+lvU5VztJy1PGVqPaYi2RCrYwFNCVvBWwFIfJU=
X-Received: by 2002:adf:f202:0:b0:343:b686:89a0 with SMTP id
 p2-20020adff202000000b00343b68689a0mr5964213wro.13.1712573512591; 
 Mon, 08 Apr 2024 03:51:52 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.144.67])
 by smtp.gmail.com with ESMTPSA id
 k2-20020adff282000000b0033e9d9f891csm8665568wro.58.2024.04.08.03.51.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 08 Apr 2024 03:51:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Chuhong Yuan <hslester96@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0? 0/2] hw/net/lan9118: Fix overflow in TX FIFO
Date: Mon,  8 Apr 2024 12:51:47 +0200
Message-ID: <20240408105149.59258-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
X-TUID: /qT+D8KY+ZG6

Fix for https://gitlab.com/qemu-project/qemu/-/issues/2267

Philippe Mathieu-Daudé (2):
  hw/net/lan9118: Replace magic '2048' value by 'PKT_SIZE' definition
  hw/net/lan9118: Fix overflow in TX FIFO

 hw/net/lan9118.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

-- 
2.41.0

