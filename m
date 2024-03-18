Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp532373ejb;
        Mon, 18 Mar 2024 03:06:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWFK1LMSxRI+H2MCgA8EQWIE6A++6IXCQz5rh1qtdooK6gmzgeszYAnJpSCS4zqgD1E50Ompj7VaiqtUGME1x+oRIs7iNUK
X-Google-Smtp-Source: AGHT+IFO/R8g47wLrinK8g/rNi7vb5lmRPXRzSNHQzcqqQ2w5cqkAd9N9ryQ8npsN6b352tX6T+5
X-Received: by 2002:ac8:5753:0:b0:42e:f3a6:7fb3 with SMTP id 19-20020ac85753000000b0042ef3a67fb3mr13477634qtx.6.1710756364300;
        Mon, 18 Mar 2024 03:06:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710756364; cv=none;
        d=google.com; s=arc-20160816;
        b=QpECFjkq/X+lDDZqwQY4HStmMOEDrtl5vWub65ppSbjnawhQ0dPwR8UTZsyqI4FKKG
         2gktVRjvXmzFFtoD6wpr2Jsdek6ElWI1zmKOQQC3dHFw0C4Z1lQ/2e7bXhWkfcxbi4Wo
         yyR2vzhEewgRl4csVVTQGja2foiAygJGb/v7oatkjfuKyWz5d9VCD2Wqeq2/ALbl1JiH
         tuNQuThaDGnGc60OQR2c1Ljb1JFJbSUn3mkpV/rjCY6LVTulCS+hEAFbNtaoQXhTeKpV
         LKyTkWNL6B5FkyfV1/QqpYffRHlJLtfFWkZdgFYxpllOfp6kp5BXfWGv5iKQk54+6Uub
         kqVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=XRdZ7V52KGINFgH2MKciuqDB0KCcONfxHqjyag63VzI=;
        fh=GYN/5ok+2sOo8s8doEi02r4ioA938213MkdP9oJpy0g=;
        b=aXtYdGClruS3kqipXzWHflcANn80EjlcnAzAHZRYyAUhR4Z0CnI+sFPRHue+45rc4H
         UhHHV3bZBnpOnYIARDl9aSX4QgUvNfcCUqphHv3iG9xOZzi/Xqm8Q9fUshQCy5jyWatH
         but5jQ45CSFbOBOcGg/9Uyw8k3gPWFJ9olpFNPkBgMan1epHps+50Y55cK+rdV0fb8cC
         ZawGMEeGWvRFwvNAyqolwEdGv/jcuMLHfGJM7AsQVTbUD56gxKojlY3lp/JSTIl4v5hv
         C9+0vYlXt4L+ncxkC6Y86gNNZWqajaS9y7B+Q9tFxoXjOHSoAiNw2jXmcjuIXX2FEui1
         GOUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dynqvVM4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b13-20020a05622a020d00b00430a20d021csi8584653qtx.601.2024.03.18.03.06.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2024 03:06:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dynqvVM4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rm9sQ-0001EO-Tj; Mon, 18 Mar 2024 06:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rm9sM-0001E4-3k
 for qemu-arm@nongnu.org; Mon, 18 Mar 2024 06:05:50 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rm9sK-0005vy-8n
 for qemu-arm@nongnu.org; Mon, 18 Mar 2024 06:05:49 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4141a52a98dso1635305e9.0
 for <qemu-arm@nongnu.org>; Mon, 18 Mar 2024 03:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710756346; x=1711361146; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XRdZ7V52KGINFgH2MKciuqDB0KCcONfxHqjyag63VzI=;
 b=dynqvVM4uDC6FtuWGa7JlBcdSRUo82Ok0Av4h99SrPVRaPO6ZK9bSXajIPiPWmWsDW
 BUPjqHLYPs9A07+FALh7qw7GttNlrd26L/f8RTN945y85wOhUOHDszXeufviEUrSBY/r
 5mFOaZQ3Ww+ncGEVS7gu6/Qc9/qHnJ6PlfIM5eWx0SEozDnTn7pxtFKquRfZolGlhZO6
 LAxK9d2T0FmDTiKLwZYAPY00SGo2VoXn++ZbDxsznJmz4azBq26JORR99WWu4zNbPPBG
 Dn2adah/gxoKrP8ndPeoScE3F+ouw5ukRxRmxGRMyeOMeSp5iz7Scr1vgKDd+VkxfL2t
 dMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710756346; x=1711361146;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XRdZ7V52KGINFgH2MKciuqDB0KCcONfxHqjyag63VzI=;
 b=IlTyrM+P29jFgEDiLQeAuSKYcCq+sesn0W5JjzLZaxjglzeAPwOsyTvJOfEX2gK/pA
 F4u93SPGRh1+EyRulq1Ygg8nMsyOAIeHfbQh+Sz8PmkGTH3IfF1I7fzXbpFJUPsNn9ZM
 le+kb6QTZn0E9csX71olLvGz1brt9XMLqYJXLHkg6Kwr0jjDMRp1GaQABR0Rcn6rq+0k
 jsu1uHhmRAZZ6V4TEHn2lYkSs9LeBFK079FOnKF1Um2ayXXOO+42cVHr4DXuDvVVPGJs
 WW5wD6uyI23M7Ayhno2Zli77nxEzYoabDxTAsyQgXaJq0CZOiBe7w4xvdKit77G4Ukaq
 pYlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNi2QeQkfbSx6oxmEp4Vhe7ByCHEhDSC3dpxbxLI0JjMqO1Wd7hD4p4LoY8DyB3KLKP3Qei4y1FwCUooZWFTN4NQhe
X-Gm-Message-State: AOJu0Yy3DynCT4y3a7lSCg2bi821Bfvj2+uy5fmiGW88cLAjA8yXaCiX
 GoMucMyaD6X0Orjk6IovPAWm+TPdgCUrqy2BCl5qon3Q5h0tj7IQ+o1RQjKEfo0=
X-Received: by 2002:a05:600c:a45:b0:414:a25:9970 with SMTP id
 c5-20020a05600c0a4500b004140a259970mr3759902wmq.39.1710756345850; 
 Mon, 18 Mar 2024 03:05:45 -0700 (PDT)
Received: from m1x-phil.lan (vit94-h02-176-184-29-165.dsl.sta.abo.bbox.fr.
 [176.184.29.165]) by smtp.gmail.com with ESMTPSA id
 hg13-20020a05600c538d00b004140b6625dcsm4984940wmb.13.2024.03.18.03.05.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 18 Mar 2024 03:05:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.1 0/3] ui/display: Introduce API to change console
 orientation
Date: Mon, 18 Mar 2024 11:05:39 +0100
Message-ID: <20240318100543.78846-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: no5SIYCKKTxt

Hi,

The idea behind this series is to reduce the use of the
'graphic_rotate' global. It is only used by the Spitz
machine, so we could convert the '-rotate' argument to
a sugar property on the PXA2XX_LCD_TYPE model, but since
the Spitz machine has been deprecated recently (commit
a2531bb855 "Deprecate various old Arm machine types") it
doesn't seem worthwhile. So just extract the API to change
console orientation.

Regards,

Phil.

Philippe Mathieu-Daudé (3):
  ui/console: Introduce API to change console orientation
  hw/display/pxa2xx_lcd: Set rotation angle using
    qemu_console_set_rotate
  ui/console: Add 'rotate_arcdegree' field to allow per-console rotation

 include/ui/console.h    |  3 +++
 ui/console-priv.h       |  1 +
 hw/display/pxa2xx_lcd.c |  1 +
 ui/console.c            | 15 +++++++++++++++
 ui/input.c              |  9 ++++-----
 5 files changed, 24 insertions(+), 5 deletions(-)

-- 
2.41.0

