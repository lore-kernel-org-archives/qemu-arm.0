Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp572635ejb;
        Mon, 18 Mar 2024 04:32:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVvNp5Tii1FcPXMWcrqU/y47C7TqGzro7ZJdc+k8HFdVRjrZklldS3pgltEBwAccrFuUMJgnV9CUC4tg1/7xN5/7+NgDZks
X-Google-Smtp-Source: AGHT+IENYVVFF/FsKmHvorm0Cwxg1YH4/WfJyawC8MLKkbz1swKvIcX/VJVmqF6jH5/zRHblwLrF
X-Received: by 2002:a05:622a:58e:b0:42e:f101:952 with SMTP id c14-20020a05622a058e00b0042ef1010952mr15090295qtb.11.1710761536030;
        Mon, 18 Mar 2024 04:32:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710761536; cv=none;
        d=google.com; s=arc-20160816;
        b=IqYpKgEbMPNwxhpAf5A/HTbhKdiaZK+vKBQ46T0vXlNE8p2Hj247m8gTeR51ZgI3a1
         cL1sGfHifzXXBNgbjt4hks9PBi7oYdLthhmoz9uGcEH5vVAqCHFZkDg3YaV5nXKRRjBK
         gyQNqXf2Y8N1pXJD87uLET6icFLFpfUFzpnNeetIusL9cvdJp4u3Yr3niwL24Nbs8amQ
         VHwyzae6iaxukG+rdeAIRwKxQEm4HVwQPwrb/hxDah8MDjvP3pWJRARfUhbA/HXaLUQU
         2ODLKziUfnodE2IGYnL6hkUqsEd1AMlhlmRPrJc8G2cRtWF2PIt800y236Z+cWQnHi64
         nibQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=6qFVEtjnBNyYIKhYM/YbU7sKs/Pl5l+VfwM1ydNA6OE=;
        fh=e7INOrQuD8FenhdNEXvqDMt1H8MUnL1ympSQJBHBEyQ=;
        b=ytF0rnHlRgCy/a1a6d0e8GwPtesarrdzvcJerGCSKopmuinr19iSF4G0oRhf8a0GYk
         W5NxkuhOppfWSOr2VkxaysoZQMM1NSvmJgdLExwWD14kZDye7SD6nSzuOXUoxB61Lo2Y
         96uiA5vZsWTx/x+9oDMcdS9OkMx1YxjsPUQOdr4QuBOq0KYJaHl3eNmVdQBQU8FRNVVd
         JLXHnrT1wgqOlrITdu1eCHAwXz65QP1mrx4VJ4jtLXL7kyC6ZfMUb393LUD+h+Urpkcn
         EmwCPQpR770lPCcujXvWmROFrv3Jv6lBF5GmGwhOIFZVSmL8CxFceqJVPWr/jSldImIL
         9SAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CZ2jhm/g";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f12-20020ac85d0c000000b0042efcc4f67bsi9338329qtx.785.2024.03.18.04.32.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2024 04:32:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CZ2jhm/g";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmBDY-00084I-HL; Mon, 18 Mar 2024 07:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmBDX-00083k-6p
 for qemu-arm@nongnu.org; Mon, 18 Mar 2024 07:31:47 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmBDV-0006zT-J3
 for qemu-arm@nongnu.org; Mon, 18 Mar 2024 07:31:46 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-513dc9d6938so3093654e87.2
 for <qemu-arm@nongnu.org>; Mon, 18 Mar 2024 04:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710761504; x=1711366304; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6qFVEtjnBNyYIKhYM/YbU7sKs/Pl5l+VfwM1ydNA6OE=;
 b=CZ2jhm/gKFTGxQxDdO5cFcxRw487Z4RfgODQsRa1XOW0JUQn8LJPEAKCuge0HTsmiV
 n3rY5tYtYees9eHMN8vpX4uM3jwOLCa8dCmOtlxMl1XjzBCRgB3nSX7otnnyDYOWUnNH
 y4BDx30ybXMZgFQqFuEq8wM6De7u1OjCI3bIEYz/SnDxVndvRNseoJ7805FH2Iacg0jp
 LZKjtb+Tlossxe+gy2h5kz5Y66rcptG8/dZymS0BbN5y+PctWUyAgx4IUd4dZLy9jPdI
 h5UKOqTrthXecx/Ir1KdC2V5U/uAX1BBhIRXj0vQMMNb30d2klIIXhKXnVHy7QDwubfy
 J3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710761504; x=1711366304;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6qFVEtjnBNyYIKhYM/YbU7sKs/Pl5l+VfwM1ydNA6OE=;
 b=L12uD1z0WCb3q0POcxLsewSVYKeLy/48QPqlELHQdjTLYZ3z9fM4amDTUC82IrBLvc
 HptispAv56GbeflaFXLAgDQSWPGLLOvJoTU4kyfqH19RsqWpr3es4/bMj48quv5+jLBQ
 xjMcl9zHuTck4AnTQBtk3XITfDqrmR3/RjNM0Gc5/eLb0vl8uQN7ITQgos3/alv2V0tC
 wOWVJLZQ4I8vlsdUYqgG05EXy5hScmWbx3lPGrt+CWXbFeWNlG7v4F+09mr5sNEt26A3
 N4p1uOMjSBdLrSJFyHz3/ZY948uwFxpPWinuHAAX5kUWf3mCMUJx0A4YlIl3xbCHIMuX
 CEIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWY201Zkez1W8oSzH3BOEy24ghuH3x1DgRGmO8Y0oN1Rhh9clGDFwaJos2HLBo88LyltXGsw1nFsfhiD50d3jVPNSTD
X-Gm-Message-State: AOJu0Yy4wMOSUBDMF5k0DBHrLZbVRwGNlw4iJONsDhtXMlfRBUi4Cla4
 Gacrb6n6sHblBLevHa9AozG8QlFDKUuC1TPtxrO6SKNnoTIAKm5sZE/Gzas5ci0=
X-Received: by 2002:a05:6512:201:b0:512:fc00:7c6 with SMTP id
 a1-20020a056512020100b00512fc0007c6mr7886810lfo.51.1710761503668; 
 Mon, 18 Mar 2024 04:31:43 -0700 (PDT)
Received: from m1x-phil.lan (vit94-h02-176-184-29-165.dsl.sta.abo.bbox.fr.
 [176.184.29.165]) by smtp.gmail.com with ESMTPSA id
 h4-20020a05600c350400b00414128462c2sm2046822wmq.33.2024.03.18.04.31.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 18 Mar 2024 04:31:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.1 v2 0/3] ui/display: Introduce API to change console
 orientation
Date: Mon, 18 Mar 2024 12:31:37 +0100
Message-ID: <20240318113140.88151-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: za9ivXQD1rx2

Since v1:
- Move rotate_arcdegree to QemuGraphicConsole (Akihiko)

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
 hw/display/pxa2xx_lcd.c |  1 +
 ui/console.c            | 23 +++++++++++++++++++++++
 ui/input.c              |  9 ++++-----
 4 files changed, 31 insertions(+), 5 deletions(-)

-- 
2.41.0

