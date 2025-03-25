Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2955821njc;
        Tue, 25 Mar 2025 15:45:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX3uoUSDk6819Z4pQQyZTSShelbSnqE2H1LCXsrI0Xn8pS6s3EXIeO2EjezA5rm3vUJi420mkzNrFeDAw==@linaro.org
X-Google-Smtp-Source: AGHT+IEgwjkSPj1hN6MYDH+Bx4MSY0EiByNzl0rTwcMOjKvIVZLhtc2SDrERWkeNwyJ0IsnSKb87
X-Received: by 2002:a05:622a:4c0d:b0:476:739a:5cf3 with SMTP id d75a77b69052e-4771dd607edmr359202721cf.1.1742942714722;
        Tue, 25 Mar 2025 15:45:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742942714; cv=none;
        d=google.com; s=arc-20240605;
        b=IYHCqoLN7Na8geRT1IvGGhyEUl1ClVcl5zFLEY+pZNvUoF/KGd0f6/J1Ks7Iy4AxbQ
         xzbUFfHt3/gIeVpTCvXYQj68RRFg3wykbhbLNNC70+ovOxqYSNbv98+IwbvpnoRHINRr
         /54kGS6/qlz/lYyKauGxudqQIFCbP9DQg5Z04fV/dPeiTisZvJVX+09VaPd6B8N4Vduq
         1eQnhk1wDq9x1WIr8heZdeQtxnyWiQJNem2aCu3mkHh0B9uoqkbPHKU3rUPJwD0Xm7DK
         B6OmPemtnYiw89NsMzxW12RUQGuaqsq35vwqOxde4j925pjeAwBur2pdnDtdRH6neKj+
         XpAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dgIm8zLPaxk+AUkAm/dvi7OwWVyJ7xQvb+Sh8UY2ml4=;
        fh=7g8KtZrL1FnsfW6IMByVkomJN+MjPEXt9reZVeRqnrk=;
        b=fd7IwQHOe1GbtKL92Zq4MfrZlCmYvt9goZ/Dt8NBy+wXHJlVPZJkbUjLz+kdnXA+7D
         lisJDv4o+vSaBW4T4weyGDTZeaO62avY46E7JpBI4BuYofSFRbmmv/NoTS5cPmpOSda9
         YYEjK77a3EIUOgLX7mV9c3WyaV4MBz3nhY7FbhgLjO4RU9i1mI8+0lq4g/QmJFe5RYVT
         xDrjjulaD7FnVz3e0HknJVho35doG086DZu1kYtE4FdkpLWrfTPmEPAsJzVvP+cR3x7U
         RmxFnegGYHkW9rX05YbcQPDCFV/Ek9pGHwbSpEyBQ8ylCxwPLq/xHxGpEJe46cL4KrCx
         vRBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hg+xxvkB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4771d63adcesi98914101cf.537.2025.03.25.15.45.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Mar 2025 15:45:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hg+xxvkB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1txCzT-0000Z2-6W; Tue, 25 Mar 2025 18:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1txCzR-0000YN-H8
 for qemu-devel@nongnu.org; Tue, 25 Mar 2025 18:43:21 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1txCzP-0006u1-RK
 for qemu-devel@nongnu.org; Tue, 25 Mar 2025 18:43:21 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so5216921f8f.2
 for <qemu-devel@nongnu.org>; Tue, 25 Mar 2025 15:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742942598; x=1743547398; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dgIm8zLPaxk+AUkAm/dvi7OwWVyJ7xQvb+Sh8UY2ml4=;
 b=Hg+xxvkBQPBwbTf2H3pGN5EH0rR0SfOeB4MaaQP8FVB8o8K6sYcTIhwK6vHP4j2r1J
 70nJJf5DoqfbPU+s4nsgS0jENWpOax4qcmYPAVbgSNIVQoDeB0r1opQ78z5eAj/DFYZP
 gbqpuk25gsq6nJJZ0KWHoFJfyeREOEAqXLtJKWBU2qgVGWnaQavhSKDBwlkjuKiN68li
 HvD6hFawK/uzaOdMDMaq2eQhxxnKCpF/CaweAqO3xqH0BAE5YfaCLzeqrz10n2v2iyME
 gQ86X7Pqb9UbPkzQCFYtmLPm92oR358NgLeBoZH7WtSTeiuOcuGepGhN/NJGDaBjjkvW
 WN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742942598; x=1743547398;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dgIm8zLPaxk+AUkAm/dvi7OwWVyJ7xQvb+Sh8UY2ml4=;
 b=qYzgp8ZmozYreCQbmXelOBiW1WFl1s1GFR/ixrbWowngAykOGU6/3fjKFMGsF/bZbK
 UgLVS/RP9j+4jyAZ0rYTrkhW0X69VjXpBOfqN1kzNu6aN79z4bn31InVjP2auAQ2lVX7
 /4uSbVNviRRh0a+6JfFU6qoUDK0E/5ZxBoH4UXvf07rLgf8h29RSIghGRgz8AroskBkR
 4mCowllMXvvrk6/9s/Mu+/283itGvsitDirMZUaVwUyUXu7BLVPwZxKnlilceGWN/Eds
 +i9tQx5RnsWa7RFNw4uqCx8guj3AUleuYsuUP0a1YRzqjNkCYxi5FV7gKzwf1Q+qkGRL
 k3uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMFDk4ZS+vIXmS/I0YIgPsSloZByAWz1K8mPn2HK8KS+ejndrNPzUpo0gcF4YMqvec3WZYj/0aYuVp@nongnu.org
X-Gm-Message-State: AOJu0Yz3OOm3gATi+CFRP9kaAbqax8zlFUp7fgrHv3TtEY1WGZvYhkOk
 XSEe/Qy7dQVTiod/b4i+1yirkhohfzPNnQKcP8b+M0B/d15JzELE4mJELO//Nr8=
X-Gm-Gg: ASbGnctDxj7mlwpczU2diMDd61HuI6d4n9ByD89BvcjiAMaLtJArexoT6DLdmgtFId5
 HUUWGGKOw6dadngaOsdc/1HDWREIcqTEVY8hXRisSHMJ7oo0SaOJHpsolVuHjdxYvN4cd+m5VIC
 yz4jq8CSH/kmj+hoCjJTurP5pcnFdfg36guYZM7OJ/Bdj4OaGndURf/nHjavCbUxTJ+v7wlsB/M
 DtA55CSMcPODXMWj75rShwrpQtj9HEtRfhj3oIYEPdddJ0IBWn1r9Nhs3BEZiqNXU9MLl0DqBVF
 rAhTicHnYE9ioV3KWetgKbwd3ndQFV9OhaJx5/IFoPUT4GGeZd0ltmp5wAuUsD8JvMOkG0YOIlF
 GzlhPO+M8VbqVGKc34bc=
X-Received: by 2002:a5d:59ad:0:b0:391:3cb0:3d8d with SMTP id
 ffacd0b85a97d-3997f9017fbmr16486964f8f.19.1742942598154; 
 Tue, 25 Mar 2025 15:43:18 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9b2654sm14733494f8f.41.2025.03.25.15.43.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 25 Mar 2025 15:43:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Glenn Miles <milesg@linux.ibm.com>, Samuel Tardieu <sam@rfc1149.net>,
 qemu-block@nongnu.org, Patrick Leis <venture@google.com>,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Bernhard Beschow <shentey@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Hao Wu <wuhaotsh@google.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH-for-10.0 01/12] hw/audio/wm8750: Categorize and add description
Date: Tue, 25 Mar 2025 23:42:59 +0100
Message-ID: <20250325224310.8785-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250325224310.8785-1-philmd@linaro.org>
References: <20250325224310.8785-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
X-TUID: wnzhrOKNakb0

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/audio/wm8750.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/audio/wm8750.c b/hw/audio/wm8750.c
index 8d381dbc658..6c1bb20fb75 100644
--- a/hw/audio/wm8750.c
+++ b/hw/audio/wm8750.c
@@ -721,6 +721,8 @@ static void wm8750_class_init(ObjectClass *klass, void *data)
     sc->send = wm8750_tx;
     dc->vmsd = &vmstate_wm8750;
     device_class_set_props(dc, wm8750_properties);
+    set_bit(DEVICE_CATEGORY_SOUND, dc->categories);
+    dc->desc = "WM8750 Stereo CODEC";
 }
 
 static const TypeInfo wm8750_info = {
-- 
2.47.1

