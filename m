Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1414712lfb;
        Fri, 20 Nov 2020 07:46:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUmoWW8oaFJepPyF2PQISLJlaWQhevmt622o3+hMbhEq/Bf40tPx88tGjpeloefl0FPhjP
X-Received: by 2002:a25:3c83:: with SMTP id j125mr3346957yba.307.1605887178867;
        Fri, 20 Nov 2020 07:46:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605887178; cv=none;
        d=google.com; s=arc-20160816;
        b=jbkMip5rp65t/6XNscu4kag5K6zX7SGMf22tIi5tgtcWy4BaQKwQF58qjNIRF0zjpJ
         +DhT5TxYN3Y13ScKhSH327NjNprUkNKbUAtPA8bl4gabsTV/Ay89pWUB7bJd17qY3AMg
         ro44Gb/fqVRuTX2bZZJ5rhzfcZfQSsbwWWwDhEW2WqOfTKXi5JPW7Dr0DmM3sfEotQI0
         xD8bk8BAf0plIM7wVVKqK9BysUWQzpNEwthkcvAbquq/BTNjsxy7nrY7o5cB2xuwSASm
         uZBIo5ESCGd8OtNfcJ8q/oVLWpYy9QSbTcpUF5wLotxQd6FxCMvkTyjlrQofrQCOMM7t
         SOcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Q7NKblbu0UiP841GONJz4Xht9mnqSHQ7rVBHewoP0u0=;
        b=aS15fRJFP7srRZrLmSdNOXDHoE94TLEcAUKtpsUPPwjg8uzcIuTOJy8bQC2EoTE8jV
         4JjrWbUcljPUWz+p3RN4pGB/IbVET7ulIBtIqcQ8mLV8/fdPBeZB5npjBpMNSA/JNE4M
         SIi/hYDZX19rr0oDUAdXfrLkfF/3rZlikDi2R/BRb0KwYnDGp/usb5VnITOULBSlcxxj
         pCRHghyOtcB4VaPUwFqmfFrUrgb83qJqRgzPHBcvFGqTxKIuYo53OJ6paEOGhL978ykR
         ywV1DKa2M4XaCrXwC5Hi12DrWCFdS8FvQIybQ3YVDTMZQmYEuIvb3W2WlXQ5z8+EZjkT
         3fUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LPNCHWrJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k198si2881501ybf.159.2020.11.20.07.46.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2020 07:46:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LPNCHWrJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kg8c6-0006PL-81
	for alex.bennee@linaro.org; Fri, 20 Nov 2020 10:46:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8bq-0006Mc-92; Fri, 20 Nov 2020 10:46:03 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8bf-0002iT-Gw; Fri, 20 Nov 2020 10:46:00 -0500
Received: by mail-wr1-x432.google.com with SMTP id u12so10542947wrt.0;
 Fri, 20 Nov 2020 07:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q7NKblbu0UiP841GONJz4Xht9mnqSHQ7rVBHewoP0u0=;
 b=LPNCHWrJosgVyobhk/Q8prGZcpIodUW0vpWdSO4DqoedRcVifKeVgQ6sIAG+aQjqvb
 xVSD9K5Cu/CINaho9+nU0DcwW7NNUR8nH3VFeM0Oj8+c/yrFAkElHOf5HuXlhcv8K00z
 wLLSjZCnV4l2KA+YSWhlhEixKj+bl5ZcIXZDPuybN4MLGROOTTqZLJ1YD5Pwe5kbBHrH
 lCJsJhAkimnBPeLOPQE6KSKx2og8Axpq0819CIINlP5Vw56aKo5dmFI9vGzduzPOn3Lo
 2YuxxN4/YfBb9x1mYDxuXAauYf1uqv9Bp7QRQukMSUrwY+DgfCYkEf3tF/1jPYNJsZGy
 XP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Q7NKblbu0UiP841GONJz4Xht9mnqSHQ7rVBHewoP0u0=;
 b=WW5CwU18kzG5WiiH9Y5owremMHvxxpkFquEvkeVafgBFYAV34lfmoOxyHxrPsDrxwH
 gEICupK2UWZbqGTkQpTeaXDvjpAUlAKDCQCj8ryT1VZK/EMPTj5D/QEg3IkIwLjX/5sw
 wZuw+6ni8afk+QXCI2T2Vfrr8ujQv82G2dAdKdx0/wXuYBMvAB+uYV6xW/IDGaooyE9D
 TTLG3djw0fUuiAti+tR8xvDMMhSleBX7Q6erRc7YUr0gSyg7UzCBg/DNDm5/ALJbHovB
 wgbAu1xuvVmYfFTBF3hGdq18BCJJVf3eIdf7773vBjkJtXAhR4ICt1kl+t+PTygrPFlM
 RivA==
X-Gm-Message-State: AOAM533T24notixBRRXHwhpcDbDmowxk3Xa/YlLJtZIp1j5xNp3n3/d0
 sbeodadBUxkBx8gZSSSdgNALfdE5Grw=
X-Received: by 2002:a5d:4a07:: with SMTP id m7mr16502417wrq.316.1605887147680; 
 Fri, 20 Nov 2020 07:45:47 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id y203sm5456551wmg.9.2020.11.20.07.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 07:45:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 0/6] MAINTAINERS: Fix docs/system/arm/ entries
Date: Fri, 20 Nov 2020 16:45:39 +0100
Message-Id: <20201120154545.2504625-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KjYBFXKOIsvp

Correctly docs/system/arm/ rst files in MAINTAINERS.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  MAINTAINERS: Cover system/arm/cpu-features.rst with ARM TCG CPUs=0D
  MAINTAINERS: Cover system/arm/aspeed.rst with ASPEED BMC machines=0D
  MAINTAINERS: Cover system/arm/nuvoton.rst with Nuvoton NPCM7xx=0D
  MAINTAINERS: Fix system/arm/orangepi.rst path=0D
  MAINTAINERS: Cover system/arm/sbsa.rst with SBSA-REF machine=0D
  MAINTAINERS: Cover system/arm/sx1.rst with OMAP machines=0D
=0D
 MAINTAINERS | 7 ++++++-=0D
 1 file changed, 6 insertions(+), 1 deletion(-)=0D
=0D
-- =0D
2.26.2=0D
=0D
