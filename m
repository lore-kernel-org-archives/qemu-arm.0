Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp1217169ejg;
        Fri, 19 Jan 2024 13:51:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjI3WQeQzzPg8ZRPT9UOrHdn5wrFrg9X/byCuJkIEpfI7nzPBAIv6rSoCa88kzwGqL0DQ5
X-Received: by 2002:ac8:570b:0:b0:429:b57f:6de4 with SMTP id 11-20020ac8570b000000b00429b57f6de4mr614655qtw.37.1705701086803;
        Fri, 19 Jan 2024 13:51:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705701086; cv=none;
        d=google.com; s=arc-20160816;
        b=JsBE5+XmoCZw1TNfKU7mr76NbTR7iSL06qiHMQYdOKoO6vF714W+za4UiXhdP5Ux4C
         OH7vBLIZRIzLaJ9c2kz+f38Km0LKsEZGiHr3mNJFoejQI4Sr7BGYpnvdQyHpGr0Ewg13
         5Nw4FS/3fcjDG97/W9p7fA2VwSNE/o7A4iri/bb1jvTQmi45Cc/sjy0KajwqXorJCh1g
         3eVnvjQNOA/gBEip/Th1bWtupP1iLX6s+/OnyuCWxpUe2469mbRsMKpDOC44QyCoyTyw
         AvvSu+5McAYVPbskP58UhUt00qj+tofvWTqTRLOGGkXRgzQbf9G6gCpLRo5pQQvXICWt
         pP8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=O1PQjWgpBW2NJ+Bq1GU0NZb12Y8zCOGxZ2+frvV8uYQ=;
        fh=YgJ9cQ4aL7HaYd+8R0MIBXgkJmL8Yh6LbzLNatL7VKg=;
        b=evbiXR0VAPIiq5SGTGZXVNfHACyvF4iqwsZhwqgQAfR1Me9XHp5XS3Fumj10sjRI7N
         rfXVXxg6Uw86T2//hu8AAhJT2sRSuB0WQYPnAk30gmuyBAzaK0emdGyiLtHpjAH8NwB/
         PionRXAswqKdBbjrCe2Xs/IKPM3theLPwDno+KndKqoElGX7gUxLTb9MjnF1upaz+/hT
         /AaQ9ONdtLMotQ+SIUE13fEp0LnU98nlihaSAW07SF1FwfTaDNAUBFJpwd+FTKYgMrEM
         jMs+tz8QuNc4D5mydYfoCbdkK3irkhqX4x+sspDBmNEUtppEieHPX7d838LrJVMYbVe0
         RbTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L+avwftc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x8-20020ac85f08000000b00429b9386269si152757qta.441.2024.01.19.13.51.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 13:51:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L+avwftc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQwlg-0003sy-C8; Fri, 19 Jan 2024 16:51:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQwld-0003sQ-2g
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 16:51:13 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQwla-0005P7-Sr
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 16:51:12 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-337c5bcf79fso1142510f8f.2
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 13:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705701069; x=1706305869; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O1PQjWgpBW2NJ+Bq1GU0NZb12Y8zCOGxZ2+frvV8uYQ=;
 b=L+avwftcYxBOcwsV4pzlK4Ln5EFY9PWoEXGK9UpgacInvlAtiUKKP5+7pELtSxBTzy
 Kbc9oi8qPpCNXMclri4af8MxMT7LZs1HCnCkXU+CNQjTMHqO53Id0+Gz/Fs5jy1noMNt
 zJbEKR/tULQshC3FFWt8HnHlwsicvZhvRjKPaKS2Y1pGDbVHPbQ0tMWXr0WgtOqahmgp
 MqeseyigGiisdWGZ+4b45sg071cA0iMpUmF/eI+dWaou0lW0ANqdlb4AAJc9hm8Wvlv/
 F4sqoqQDgxgahEUixKMjmicgUtbEQuXLSM+i33Bof3OKS7VdG5WzRfj2ncrHAC+3skoK
 Zfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705701069; x=1706305869;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O1PQjWgpBW2NJ+Bq1GU0NZb12Y8zCOGxZ2+frvV8uYQ=;
 b=STNdppxCbWog/FLzDdCYEtOjP49ZiT5CjXyeZDShDMzos73Lkwkh3LOEEYUMsOhV98
 0kI8PGLHeZ9RJm5UUJ/v61/37cXcHREbFGueisl+qOGv4SedToaDV/TttwcBPYXC/VwQ
 clWdrrKFtCdsSPH6cQnmFTHue6bQAu9W1CN9bCNKBbrXf16GeoGkmtCi5tfGRI81jnF9
 XWyESANpBqceUGi/rg89uGLorCjjHkOpduQtjVh6dPvigPTs6bfn4e+rC8xHb3+GWvpY
 nOB0Rz+XP1Ok0jMl6Eujr/z0t6USHKEdt+/VkiPS6oTuHeEHLIWKu8R0WDpEch+P9ZqO
 2JCw==
X-Gm-Message-State: AOJu0Yw+evO72FzjMKXaA84HxWtW7GtccW9WW/c8YA7EhzJ5g5ZSMMuT
 jfsluzEkT6uXnMGTz2AChQLvp3xMQbOZR2+rUTQiggoT2I5LhGGtfAcaF9Szxqg=
X-Received: by 2002:a5d:4208:0:b0:337:4219:3e8d with SMTP id
 n8-20020a5d4208000000b0033742193e8dmr235290wrq.15.1705701068819; 
 Fri, 19 Jan 2024 13:51:08 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 a16-20020a056000101000b00337cd6b1890sm4886383wrx.80.2024.01.19.13.51.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 13:51:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/2] hw/arm: Unconditionally map MMIO-based USB host
 controllers
Date: Fri, 19 Jan 2024 22:51:04 +0100
Message-ID: <20240119215106.45776-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: FZKMdcYTgoPD

When a chipset contain a USB controller, we can not simply
remove it. We could disable it, but that requires more changes
this series isn't aiming for. For more context:
https://lore.kernel.org/qemu-devel/56fde49f-7dc6-4f8e-9bbf-0336a20a9ebf@roeck-us.net/

Since v1:
- Mention migration compat break (Peter)

Philippe Mathieu-Daudé (2):
  hw/arm/allwinner-a10: Unconditionally map the USB Host controllers
  hw/arm/nseries: Unconditionally map the TUSB6010 USB Host controller

 hw/arm/allwinner-a10.c | 49 +++++++++++++++++-------------------------
 hw/arm/nseries.c       |  4 +---
 2 files changed, 21 insertions(+), 32 deletions(-)

-- 
2.41.0

