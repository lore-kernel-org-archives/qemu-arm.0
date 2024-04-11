Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp865049ejc;
        Thu, 11 Apr 2024 03:44:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXH0tdiUaFHRem2r4XkZMK7epErEWZnc81N122r1LQemFLZU16hTxS4wRMJAE2NLv36njTwi8Ad3bItFuSGn00w3lkySceE
X-Google-Smtp-Source: AGHT+IFtdfx/kJdinPINLmcl28d4weq05o0jh4XKfSJ2CoaZvehJWu8mz8y8rng8JmE3kV7lOoFW
X-Received: by 2002:a05:6214:e8a:b0:69b:115c:fc3d with SMTP id hf10-20020a0562140e8a00b0069b115cfc3dmr5038410qvb.10.1712832253745;
        Thu, 11 Apr 2024 03:44:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712832253; cv=none;
        d=google.com; s=arc-20160816;
        b=AcQ5Rz7acuNXcCQ/jnYQjVtAN4YCTsO1YIX5FH6ovipCah7ka1lgonIBqvIZACgXFF
         F2R225Vyl0JFlahvLI9Z2NsqNmYXjDOPuVIeHQSfwcrTHgTmoSyCKvN4/LSIeDYzjrS9
         DCBKJRxEKaMr+VP/MxBQWGyLYSzzEPcbjyeJbsw7uDUXphXpko5t32p5EYDMHwdIKxTr
         fFR7N02AIOW5NviWTv/5N4DdGGZNvyCGs8t0LeH+w+sdxypgZ5swOR+p7mgODoLEWG48
         AWhsgtTrbo/Fsbk1cMhwDsGXSFyOn7QoKdpe9nHuJ5gn+/vP7OElxi8aToLrsU+eR6rM
         ptkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=u3g1QSRg86bxVtcxnKKn01h0Ac3fWVT80PO+fMEEjTc=;
        fh=j6hcQJLa8A2jxkuqyE/2YM3qjQBsZQ0R3feg9EHZ/Go=;
        b=zqhuNgVbv4tRF0Gg6Yp5rGMqsGz2l9LSOayQZdf5YQtgj+Xk4VYPTc5foTFxkTG5sK
         l2AY7BF7MZHzxn/DsyB8k1SBtrKKwcKCFEMWXdvfodlN9IQBkeUMQ1hNdHFKJy8XA68A
         KxNvi0Xy7qWHCdTK2wehpLemh5prx+vFwY6E2ryPkkcAMU8p13seQsxEth7K9M/mi/j4
         pfcUQiAW7z0298syJrjXOleGtPBGLKkm3XkyxxuzAb0ApsmH/jYmK1PyOaLs9Ez/Iqbx
         AKhVIP3anui9TxwMsJD0XQ+DR4lwf3LNr26CLYcDhw9kTar9p0xBVpJwRmCTITOYHTSE
         Kkdw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ujZpLNuG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p2-20020a0cf682000000b0069b49061859si1163048qvn.554.2024.04.11.03.44.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 03:44:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ujZpLNuG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ruruL-0002l3-Jc; Thu, 11 Apr 2024 06:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruruK-0002kf-57
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:43:52 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruruI-0004Ak-I9
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:43:51 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3442f4e098bso406961f8f.1
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 03:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712832229; x=1713437029; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u3g1QSRg86bxVtcxnKKn01h0Ac3fWVT80PO+fMEEjTc=;
 b=ujZpLNuGHK2mgdbNq1+2c8R/e0NYK1eJuktMVqdvKiJhiB4WtUPEa8yu1DKTX9KJu6
 iH3B8pl8mwtJE3vId/+Xvaz9Eyy53LyIZLniC92hpKueuIJ9gXidZVC+yYgSSS6SzpfR
 HHPINm0UkW+MKIFrPbo+M0FriOEdFfbvIDWpoSAPMiqq8/iOUcrsV8i+tYCvQNX+/8sC
 DQu4PnehSbTywx1gtfTnnqFRQ2T2teeXLgdQ0+1b5C048d8GuPevS1kigPRLqteMFuQB
 +ob8Y0yH/Q8fvaWpcAEKS+ZpHNraGxM6Ns7yTXb5LoNRzsPBIM6W1zEwKo/zQwqNlVA9
 9izQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712832229; x=1713437029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u3g1QSRg86bxVtcxnKKn01h0Ac3fWVT80PO+fMEEjTc=;
 b=qAbG5hUxWmnFh0P3A7+o3xEV9EYGurCfKidlVXrBuz+N9wUbibKjYvXw1kmRw3H9XH
 FrzCpXq31AJVPYl5w5ZSVS/cOuyMVnqccIcCTaWjVaMwRt2Iskh4V3RH3LIXasktpRPX
 a4QVZx0kE4Gw0O+B9kR4ssCXs0Tl9FwTAjxhspk4i8lNv4GOuqcdPsWiftkHehoXeUcb
 YPxjuPgoRrSUOrPdQzxjGWO5Hr1bE0dVtxCDiCTB1iQjqvQE6/89B57XUnt+/TOfwT5u
 u8KSYptEklYXkYH+AIKpPGf9Dr970Kw0lXNDeJMoDLw0/9XPrMI19U3miWACS+gMo0OM
 ZPhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkCd5Eta8Ve/danszWe2XSOHe1MqVP2LBPJT3XMvkfx8H6z1fw+VgObbVenYtZvsF2C9JHrjdEryOPa1aGbzfeDlgy
X-Gm-Message-State: AOJu0YzkZY3AvpYPqVJBk3UIuzOPXLkEbRYP68a+LJnbU2RY9lOy8Vcs
 Dm2ysYaNB+61EiIC7GQ0Pkcf8nHphl/jowxymCh2WCz7iPO7bSEUYQ1RgJN+NBE=
X-Received: by 2002:a5d:456d:0:b0:346:65dd:5580 with SMTP id
 a13-20020a5d456d000000b0034665dd5580mr1693002wrc.3.1712832229124; 
 Thu, 11 Apr 2024 03:43:49 -0700 (PDT)
Received: from localhost.localdomain
 (137.red-88-29-174.dynamicip.rima-tde.net. [88.29.174.137])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a5d6245000000b0034334af2957sm1469250wrv.37.2024.04.11.03.43.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 Apr 2024 03:43:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 1/9] disas/m68k: Replace sprintf() by snprintf()
Date: Thu, 11 Apr 2024 12:43:32 +0200
Message-ID: <20240411104340.6617-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240411104340.6617-1-philmd@linaro.org>
References: <20240411104340.6617-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
X-TUID: 0bnrjPqamYWQ

sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
resulting in painful developper experience. Use snprintf() instead.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/m68k.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/disas/m68k.c b/disas/m68k.c
index 1f16e295ab..800b4145ac 100644
--- a/disas/m68k.c
+++ b/disas/m68k.c
@@ -1000,7 +1000,7 @@ print_indexed (int basereg,
 
   /* Generate the text for the index register.
      Where this will be output is not yet determined.  */
-  sprintf (buf, "%s:%c%s",
+  snprintf(buf, sizeof(buf), "%s:%c%s",
 	   reg_names[(word >> 12) & 0xf],
 	   (word & 0x800) ? 'l' : 'w',
 	   scales[(word >> 9) & 3]);
-- 
2.41.0

