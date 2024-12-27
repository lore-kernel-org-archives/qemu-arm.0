Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp6561094njk;
        Fri, 27 Dec 2024 12:25:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX5cQAfAIWGp7c2gUiN7uyxwatloKDcFNzQRQncpeFkxw0+hKg4RQk9hvO/Z6d5eSCpcH3LMCuw0fNEVQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGFELth8lDxihDlTNOEqRV9T0c8Q6yCI3a9dpMQEDMFPOkOFrhTRJvb0LtZ0XVPvmbQ350a
X-Received: by 2002:a05:6214:d89:b0:6d4:1ea3:981d with SMTP id 6a1803df08f44-6dd233a2bccmr397044116d6.43.1735331131776;
        Fri, 27 Dec 2024 12:25:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735331131; cv=none;
        d=google.com; s=arc-20240605;
        b=QiqJ/5nTMDevhNKBDK8aYFkTlk3QDTFRPmvrXdMIK5AssBWJg8Zc0LBLDtkerH/yKo
         dPunGvV2kaHPUht/glsSIAUqMkgt1oZpJs0reXEjqZPJpHir1EWQLJNa5eU1pq/TnYOt
         bH5wYcFDeuQA77CiStc7g7MjHgYSFW4eeyb7YcPzcWvrwwOyHXHPJDzgFeptp9ff3reK
         E6MCg4bpuBUFviWRogbL57JG68WDehNiG/cQRJMXS9tVaPvwiEfs1RIePZfx8IZa6/qQ
         X/OQpP1+SPoYstu2hpxtL/B9suCiZRJDbYkYOQenqeAkmktUycxkjbgPDzd+eoZgVBgC
         SFGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=9MrOGxf4wy56MqIqYLeWo/x8/KYygjnPnkZEDiH+gag=;
        fh=OiGQlZpNc8yx+GmmQ2uk9UV2OjXLLXwzNyxZauxOOe4=;
        b=kcIq/tR4jXjgqBcAoLGb9ua8BiLuyUv1siiAOfp6RUbYSSvG0amfOlbqk+zOqPM4xk
         TU5EPw+QjeR+LpDr7q+jgk0+Vk7ZrnbkmvGht2sNsmcoKY22v0D+IWcReaGXO84t5N4/
         EMm+miK2+uye4frSmdGqdRMter36aL2Unb0UQgJ7GW8BkxWC1VARwISxUP9fGFo3WqU2
         jyZHexq2Iyw8rpHcZhoMGfFJfFHGdTSsxwf51PXX/GZ2A1YCQDx4O4QfrkX2T5G6K3l2
         p1bcOz4uQSXFhXR4rLf25NnU7PsBfK2B5tXPrsj+Cbydo5Bx0X6PYLfavcZWA4BW8V/a
         MSgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=moZbsCY8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dd18101b8esi211401546d6.25.2024.12.27.12.25.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Dec 2024 12:25:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=moZbsCY8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tRGt1-0004FI-Mf; Fri, 27 Dec 2024 15:24:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tRGsz-0004ET-Ex
 for qemu-arm@nongnu.org; Fri, 27 Dec 2024 15:24:41 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tRGsy-0004yz-0i
 for qemu-arm@nongnu.org; Fri, 27 Dec 2024 15:24:41 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3862d161947so3522550f8f.3
 for <qemu-arm@nongnu.org>; Fri, 27 Dec 2024 12:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735331077; x=1735935877; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9MrOGxf4wy56MqIqYLeWo/x8/KYygjnPnkZEDiH+gag=;
 b=moZbsCY8XiubuG1ZLjGwHfW3boPkwYj8GLN6OjV4RBIIurFakaw9k2o1F/YgXMy4pV
 6+UfjxDdfeQ1m9ihqrs0HiC//T0m4aV+QiLhYHZFZGfyPg7by8RU+0kuqdOEe2EU2UD3
 K/6cxR8lcXjpuHwyg9m6dwrPspfj3CMRcBiasOQ/2iRtrcw+klfgOT3Mz4HP+oDX2xRY
 0NzToIJFT21hy4qKlzLPA+piiMjaX+oC6erqzzSEkBwPDRNTNDVuMVNOWVrh81UEM596
 zg+h/N9oHmgXv3seIbGo9gT9bZLfeWMLJtD0q3RP3RBw/CAJVQ9GHPX9u8fBKaePcKmL
 hjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735331077; x=1735935877;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9MrOGxf4wy56MqIqYLeWo/x8/KYygjnPnkZEDiH+gag=;
 b=Tz/j38NwDlZWQOrpIM/z/rUteQ0jqG49uYNBMbP8If8ln2t1zJVecdoLVljr5S/3vt
 r3kOjwucQeVy+4YT/sIpiziqUqyhu/9u16Wkpeoox6pX5Gv/WvkPZF2JUmYs2+jbQwaX
 T+eOjPBqJXqb6vpfy9zv0Ce6M7Sjpw9cAX1EeFlzWg1zqd5V8Vy9+vuhYfEljjYv9dVX
 7FoHnfB9uSUcUEmGG0nZrpZBd8uUf3n956hVdUrliftBwv5KikwXy9kigVhgqbiMhtXI
 iXWWJohZ+BQ1J0TKy5wi27Oxg8CjPIWDNdj43olIeuxWqyL6kzGoPv+0KidGRvFC1M1w
 Yb6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXF7hQQNzvdZC6ucHgPHxCYHVi5ZHLCrcm51rNYFq+O8WWQoThwSYlJpJscSy93MUgjSXUFLQyYlg==@nongnu.org
X-Gm-Message-State: AOJu0YwA3BYK0GgQ6c2cq+FmEAMGobD/+8SbAKvN3ATjn9tGDLH0Ldtp
 6Zz4fZIAn2b2d7AHycMH0iB2uxZzRAfEEei1mCaIk01fMOuFilvUFWvdhGoT7Fc=
X-Gm-Gg: ASbGnctzBL9DkcImpoE1NKyGgnlryWMDnc8mxRLlxuNSQ9MT3hGHVqYaFz4rfs3a1MD
 qYaVHt1VBOF5ayzvrZUABii3R4Uhef0Ls3tQe5zAm1N3V2B0z10jBjyOKdVQ6la3rAomhoWKbqS
 txqET+hBwXMqMg0lJxpZpk5Qh9j+jOFqRH82WGs5z36jO6VuzStFSfyYatmmT3/n/KKwrk6svwy
 OjbWRVUcoJuqf/2fZed/nF6CI8wmBGBgcOOvF/N/tGpSl5x9wl7bCzHZx56ixXCk/djzhOUTRgo
 1HUHzLx68qGqqWquwKJGmJIS7AURVNM=
X-Received: by 2002:a5d:5e09:0:b0:385:faec:d94d with SMTP id
 ffacd0b85a97d-38a223fd75amr25716130f8f.51.1735331077451; 
 Fri, 27 Dec 2024 12:24:37 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e2b0sm23419435f8f.82.2024.12.27.12.24.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 27 Dec 2024 12:24:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/2] hw/intc: Select generic ARM_GICV3 when KVM is not
 available
Date: Fri, 27 Dec 2024 21:24:33 +0100
Message-ID: <20241227202435.48055-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
X-TUID: j/M1ydrO3b4m

ARM_GICV3 is not restricted to TCG and can be used on HVF.

Philippe Mathieu-Daudé (2):
  hw/intc: Remove TCG dependency on ARM_GICV3
  hw/intc: Have ARM_GIC select ARM_GICV3 when KVM is not available

 hw/intc/Kconfig     | 6 +++---
 hw/intc/meson.build | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.47.1

