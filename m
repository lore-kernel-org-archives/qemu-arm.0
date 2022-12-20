Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4238456ejb;
        Tue, 20 Dec 2022 03:24:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsRzXIk8aaU/8iQ7YGfEv6Z0bY7RSVtaJqLBnQnO/Vavpy4LM5M730CNWDDtqsLy6+HTNh/
X-Received: by 2002:a05:622a:4a18:b0:3a9:8c90:dcd6 with SMTP id fv24-20020a05622a4a1800b003a98c90dcd6mr8272168qtb.51.1671535458311;
        Tue, 20 Dec 2022 03:24:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671535458; cv=none;
        d=google.com; s=arc-20160816;
        b=b2JzHS6kyKALYkndGxoXKOkZrn8q3beBFlFMYNRgNlQUUbMtltCha61bcozQ7AczI5
         Xtpt8KhJ3dj0vtJ0mkRt2+e7E2EmsUga38wejo8vbPr3Ro//AbcHF7cXkvJluKOubKog
         pCTeqWKYYXFTSWMTZJVrVDPb2TYlJEqMxtNgxrcTS2/IXQj3YDIPmsZQ4ZQhV2c33aVb
         9SjFormK37bOfh3NVEvPXXM3UGXCp+Xo3WErKBJdJ4CJZr3I5AGqI/X//2HIyVqYk5y+
         fmosEEaImoElohGKGCBrRy2D6+Lx3n8EukiuZo8brQ/53Cxkf7/HPotyz7T4ew/L5n9Q
         QsUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=fVJHGwvdSALlI3TSuKGt0wEEThjZylR1RqmQ6XBl8QI=;
        b=Z2BHdNPJZfDLcLlHc51+emeutrj2M9Nw+8Y8MjGCA3j0Cr4sGvnP3c+LwDWXMzIHvP
         MWNbT/EknfKYY5HqbFT/FChnQ9KOkG6XxH2Su2TjP/JZringVDHE2jUS7SwwTWcA2hdQ
         WeHv5uVp9k6IwKbh8k+CwmSIedaPX+EmMahsiWKfzc1JKic1WwlIencuYBkK5ksTNO7o
         FNQeXOAPQkQ0Vh6lKXUeyFdHiJm2spNRj4ymwaWRgETXJrYODK1z0YFGJyhz9WJPbTbu
         4Sg8YuCClc1BXRM50UsNTicfQXZBgo0F4szr2rfwj3CrVZOywDu7BTywA/OSJ9GSEmmP
         BGwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QRd0bIQs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b13-20020a05620a118d00b006fbb4b06738si3569145qkk.760.2022.12.20.03.24.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 03:24:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QRd0bIQs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7aX3-0003xU-BP; Tue, 20 Dec 2022 06:11:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aWv-0003oo-Be
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 06:11:29 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aWt-0003g6-Kn
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 06:11:29 -0500
Received: by mail-wr1-x430.google.com with SMTP id co23so11398259wrb.4
 for <qemu-arm@nongnu.org>; Tue, 20 Dec 2022 03:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fVJHGwvdSALlI3TSuKGt0wEEThjZylR1RqmQ6XBl8QI=;
 b=QRd0bIQsshJiwdydBoAtg+xh3geYKkb91kF00NdB8y6P7Z2HneixJTSE6vl9fSsiFV
 AvAH/U+XB2ryKu/gWz3h0AdqkKudYJujis+25/6l9J8O4nREMwllfOlt3lCjE/Y8BPAS
 J7GXUF/TRo4q+IxMtPVYyntK9HRtuyUW/MDh5R8IW+OGeQBU2ai5s3G0zeSru1ZKuONi
 YSrHG4O4WpAAaYlR8gNcl1tl3ZZ33+tXZgHCZQTaMQJzU+jczC4Sns0n/Wltq/+aIkuZ
 vQLQ4aZhF1Pev3hO/d7XafSy7mNCu9/w3NRZS2bYReMS7qy4GN9hNN7hXjlETS7KlUOm
 qnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fVJHGwvdSALlI3TSuKGt0wEEThjZylR1RqmQ6XBl8QI=;
 b=hr1rxjGABNIonOaMeE0wOcLdTx7af41ViBGJ043pc5sBlZepswxFi2ovj6u9b3+Ur0
 3YTfZMofK98N9O28xm5Ssd1KtzvuqI8zDjbWqnPmEzDueXx5hC+1dtJ8qDYbfyEpNLyi
 1+FqBYkBu1qzBq5UpPk2lpT7qkmXu4s2lK66QarVjvujjRp2sbH5NhSl9CPRXfKyzu6n
 YUfHE90ZhC8KquoCen8rnItWk2fNd4E4iQ3/z7PLLmx6wK6lPruO6WOgpsywhgsYo93m
 0Np+YN0J1illgykti/8a8RHLJZvVm6P3pDNXEPVBtmXr7VXu19C4KdUgEjlN0DUyOW9N
 9Tvw==
X-Gm-Message-State: ANoB5pneIEpBIoh9yyBxjsdoHUOuTXKItu5dYWsBijSkHWmiKJTyDbtQ
 ywgv/cVdc7NsY8xQHEdV9E0bnQ==
X-Received: by 2002:a5d:4a8f:0:b0:242:4c11:c062 with SMTP id
 o15-20020a5d4a8f000000b002424c11c062mr36029826wrq.28.1671534685749; 
 Tue, 20 Dec 2022 03:11:25 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a5d6ac1000000b00241cfe6e286sm12417498wrw.98.2022.12.20.03.11.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 03:11:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Aurelien Jarno <aurelien@aurel32.net>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>
Subject: [PATCH RESEND v2 0/5] target: Restrict 'qapi-commands-machine.h' to
 system emulation
Date: Tue, 20 Dec 2022 12:11:17 +0100
Message-Id: <20221220111122.8966-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: gR/9vIryyhtJ

[resend fixing my last name typography...]

All series reviewed, can patches be picked by corresponding
maintainers?

The "qapi-commands-machine.h" header is not generated in user-only
emulation. This series removes its use in user-emu code by moving
the QMP code depending on this header into a separate sysemu unit.

Since v1:
- renamed cpu-monitor.c -> monitor.c on loongarch

Philippe Mathieu-Daudé (5):
  target/arm: Restrict 'qapi-commands-machine.h' to system emulation
  target/i386: Restrict 'qapi-commands-machine.h' to system emulation
  target/loongarch: Restrict 'qapi-commands-machine.h' to system
    emulation
  target/mips: Restrict 'qapi-commands-machine.h' to system emulation
  target/ppc: Restrict 'qapi-commands-machine.h' to system emulation

 target/arm/helper.c            | 29 -------------
 target/arm/m_helper.c          |  1 -
 target/arm/monitor.c           | 28 +++++++++++++
 target/i386/cpu.c              | 74 ++++++++++++++++++----------------
 target/loongarch/cpu.c         | 27 -------------
 target/loongarch/meson.build   |  1 +
 target/loongarch/monitor.c     | 37 +++++++++++++++++
 target/mips/cpu.c              | 29 -------------
 target/mips/sysemu/meson.build |  1 +
 target/mips/sysemu/monitor.c   | 39 ++++++++++++++++++
 target/ppc/cpu-qom.h           |  2 +
 target/ppc/cpu_init.c          | 48 +---------------------
 target/ppc/monitor.c           | 50 ++++++++++++++++++++++-
 13 files changed, 197 insertions(+), 169 deletions(-)
 create mode 100644 target/loongarch/monitor.c
 create mode 100644 target/mips/sysemu/monitor.c

-- 
2.38.1

