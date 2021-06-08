Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4770708lfa;
        Tue, 8 Jun 2021 13:25:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfkcOZ5kDPCfKLlSNSmxGUtks5gMyxoHSIfAUTob23hQXF/fvElJYzAKN59hRaDek58W2O
X-Received: by 2002:a67:2ed8:: with SMTP id u207mr2279032vsu.60.1623183944944;
        Tue, 08 Jun 2021 13:25:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623183944; cv=none;
        d=google.com; s=arc-20160816;
        b=O9f3dZyU3oGMNcTi3SCLZJvxRjtTnW7AEd844EI2eGiwZWRy0fy1gqXj18Q3AI0d8x
         ftYnx7gfySkZAN9KorK7hy2IeMYjpb8ytISXXJSmE5HIhkNX5VLBp0NoXSgs0KlTqnfE
         7PyR3k2bOK3ypdzD6/EZOMCah3VoG/x21fKrp9MOfyu6isqbofc2YgzxUp1XuAQ2sjca
         b5D5mfVNnG/Y/TLjYdAPrtVjezJeLn7NRVNlCvX4iDUztFhTe5q9EhdIfupmFaLqnnKH
         D4w0fYltzgqon89dkeYHZJqczPuRN7cJyCArgVZAjMzLdRnwMysAefBYPi544Xl553Yo
         4G+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=xhiM5LH9tk8kUEoTgO7t+5DVMEAyK/fb1QRXKuhYQPY=;
        b=w4EYt9wlxxuHb2SyMLY4ehWqMkhHk9CSJRt6B3nxs3TZVaYRszpYPayEqXvLosnHMN
         y7I7lJQrY32OJ3b5LkjODY1RS6pESTmjnwXnxiw4/mdh1ZmRetLsGhlfk+Aan7bGYI3H
         n/lU5IZGgI1YwVYu7ak9PqR1HZyPNVxeY8zSnqVsRXTa5tZnF9UOS4rfk2SQI6vODjqm
         msXvUQb4G3wGNTs9PRgK5bAvrvAIu39ME/5hh/sUDppTmKHSEU+tY6wrQUpDRHLoKsN5
         kMx6X81Gvd9etNnPbSFT2p/NDO8T+iontkTkshV7+UraAHxjHNnC9wagOCUboVBJZGXn
         nE1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=fMUpTWBX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a24si2317331uaq.120.2021.06.08.13.25.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 13:25:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=fMUpTWBX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:49988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqiIC-0008SZ-0b
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 16:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3OdK_YAcKCOgfOXdebOQYYQVO.MYWaOWe-KbWXYXQXe.YbQ@flex--venture.bounces.google.com>)
 id 1lqiI0-0008PH-UL
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 16:25:32 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:38541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3OdK_YAcKCOgfOXdebOQYYQVO.MYWaOWe-KbWXYXQXe.YbQ@flex--venture.bounces.google.com>)
 id 1lqiHz-0001Kt-3z
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 16:25:32 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 s8-20020a5b04480000b029049fb35700b9so28763155ybp.5
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 13:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=xhiM5LH9tk8kUEoTgO7t+5DVMEAyK/fb1QRXKuhYQPY=;
 b=fMUpTWBXBYThyj5f1b0CQo7R2n+9XHsKppAfXVk+WoLF+dP8Jn7P+4l9LnsNjf6uwY
 ZlycxhQ0GYapvYsxvZXhWdIHHNHxm4E8EbatVp1d5sNKV5qEI9/3O/2L5S7lf9d709Wy
 z+MsOpORQPWVv4q9GHkpsv4bbAv16OAjZX1YVcppzrIVuyRm1fZQnUtKfA4985gN4ZxP
 lFKgrfz8RHV/InjU+AHDlG2NyrxMu3KPAlDb48mAnUb+jAvJxBpVtxe6VwHdtbatNLXZ
 IUjGW1kAO4Qbrk+XlI1bqlxLqrz+evUXGLGw9WGA1N9oqScCbCU+8t/ReEtGMqBU42zF
 hLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=xhiM5LH9tk8kUEoTgO7t+5DVMEAyK/fb1QRXKuhYQPY=;
 b=dxz/I9E3OogUM8cEx/ivuSwBx2WIobl5nObTApFIlG4VULEJu3PXzfi9Q7BdElcMda
 NISObclpOOUc4MK/725BTXKgguZFV+/76nQ5lTZGuX+bKRd80P8tgadvj/Taq82nu7pG
 3wM5rbe0NnsCY00n7bONCbRebLrNVaYiz1SwGznOv2ThSljegBYIK+WoVVGN05evAB4s
 khqXy6rBSSFDwgEePA44tMCgYOzKrIF09azM/wl0JK/euQRg3A7gBn7E0Mxy3d50yXBg
 YuWNOUI34kZeJImyRqhoOzKTornsimCYnbHDrqkSaf9/p+e/4akmB9I2L4NcMU6fSqvl
 Z7ow==
X-Gm-Message-State: AOAM533oTOJU3VJT31bHL8SxWP9vTaobyIWeAouPUx+NIQI1CbxMgSXB
 D7UkpJUDjh+XToaR83EYlfPvmi9c+J+i
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:f886:41e8:7e16:711b])
 (user=venture job=sendgmr) by 2002:a25:e803:: with SMTP id
 k3mr32687281ybd.268.1623183929261; Tue, 08 Jun 2021 13:25:29 -0700 (PDT)
Date: Tue,  8 Jun 2021 13:25:19 -0700
Message-Id: <20210608202522.2677850-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
Subject: [PATCH v2 0/3] With the pca954x i2c mux available, enable it on
 aspeed and nuvoton BMC boards.
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, clg@kaod.org, 
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3OdK_YAcKCOgfOXdebOQYYQVO.MYWaOWe-KbWXYXQXe.YbQ@flex--venture.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zZ4DLdoFAzd+

v2:
- Dropped sonorapass patch.

Patrick Venture (3):
  hw/arm: gsj add i2c comments
  hw/arm: gsj add pca9548
  hw/arm: quanta-q71l add pca954x muxes

 hw/arm/Kconfig          |  2 ++
 hw/arm/aspeed.c         | 11 ++++++++---
 hw/arm/npcm7xx_boards.c | 14 +++++++++++++-
 3 files changed, 23 insertions(+), 4 deletions(-)

-- 
2.32.0.rc1.229.g3e70b5a671-goog

