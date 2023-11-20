Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp65425ejy;
        Mon, 20 Nov 2023 13:35:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzTe9++P1fwm5RoKunxpoLpZX3BmR3Zkm9a20Ozqw9XRvjHgNApWRIEjXywhgcStMAcHaZ
X-Received: by 2002:a05:622a:34b:b0:41c:e76e:87f8 with SMTP id r11-20020a05622a034b00b0041ce76e87f8mr10514079qtw.34.1700516140999;
        Mon, 20 Nov 2023 13:35:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700516140; cv=none;
        d=google.com; s=arc-20160816;
        b=KgJWO82+ZNIXOTHpVClpIPamhGYvy2fyOwZy2EXcuzKcoB8IWkX8zDgdm12NA51vD5
         pwNLtUxRdMrazXhBtZu4DuEwCqaRHltEppvhSW3EzzLhU95sL8JfeLGuhpnkVALuMnuM
         UaXX5dJf8BJOcP+kDpQ89DWJ6vmCj0OaHgS0n6yXJ5n7GxCflgFCfy6L78jPM5H6jsEY
         OSvdzIymm8UP8O7HY/NRsjj6zKeWDTo0FiiYSHYVEVU5vLIFgvVinulfP/I4B9+6Ssmg
         AjKCdp95Pf9hHXnjFWee8IQQ77I2FxmGshZPbkQ+UUXj2hHJQBGhOF0++b0y7s5EznsJ
         muCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Q5q8QrKQWuc5ZJauQIVd7Hh9PAH4SP4rAcWXs3pwmqE=;
        fh=toXMQ9nuJ3L4CLQ8EKaTQ8L/ltDlD3GauRZSJpgYVzU=;
        b=R7OqL/cvD9whP+KuT/tUeS+7la/lCUBYqhRp6yvQGbD71vUmysEWAqdZqBi3rHr7is
         5OHO/40ZOerAduGk0lpahoTG+UVDfERN3+c//6c1fZVD/uBqsvp6un+8CSXnO0DKmRFY
         qmJLhf87dKr+R/KL6TX/uob5nEngZ8nsfFYb5LycXhNaBeovowSnjYEUJX8+8Oy+Ztz8
         k9T5qbnC1aTTdM2utGETxv6FfZ5e+MHuC6UT8+YgSLeRjg5IWAp65F8kMqa5vEWarVi4
         PoyKGKLLTGiLX5NKfQ7RG1silLmei4S1ylaeSVa6JueiHTI3lzBFqmddYYn1FZND5Ryu
         DACQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jCWV1wbk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w16-20020a05622a191000b004181244b348si7761174qtc.432.2023.11.20.13.35.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 13:35:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jCWV1wbk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5Bu3-0001JI-W7; Mon, 20 Nov 2023 16:34:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5Bu2-0001IY-Gd
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 16:33:58 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5Bu0-0003Iu-Dk
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 16:33:58 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40b23aeb9d9so10470375e9.3
 for <qemu-arm@nongnu.org>; Mon, 20 Nov 2023 13:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700516035; x=1701120835; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q5q8QrKQWuc5ZJauQIVd7Hh9PAH4SP4rAcWXs3pwmqE=;
 b=jCWV1wbkyERg6hF35VqiCyW8CUpdsYYaWQBOV9YfJziIQCJ3CPACMs4bhVDav5Lp7b
 wFXvwevdIgCfNyG+ok/+nk4vdfXfPfDHOixuqlDuAw4MsfTGxshHhMSg+xR7f3QpSCF1
 uEVK95K4NOiRw+TSfx7wJP5Ut6lZm5duCixsDu8c6FEuEDts84a+na6qbT4X4wU3DSUJ
 3hcoMjzt8yqlLSEeva2+kOsa3tJVXbMC8XG7UymB2xcx0hpW7aDldYSYdjMY2INq9UmZ
 UDI3fvrRb1O+FK+zDMrZpVroo7b+6Dy0x2s0UM+wL4G23JuMRasssW6MEpNrchorOFwK
 OYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700516035; x=1701120835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q5q8QrKQWuc5ZJauQIVd7Hh9PAH4SP4rAcWXs3pwmqE=;
 b=gBodUgZtpSbVhc+jeV9bByyfoaaOs2SpAoWsKImZ4+iFHsf1OXhTZBlzXhUKdlbWYO
 dIkrIRt1Nl3SuF01/4ztBKFNVugneurq37+8m/ggoL+P03crSHHrN2Br36fxX1xl/ibF
 muyydizVZa7CCiKrplNrNFEtCVbgbSxwyesb55+undbuEzKkqK2EE4Ob6OsLNO1bObVD
 u6tOWpyQ0XWAbvEocPvOcs5VNEG7RuzEWJ3nOlJ+mV8pEh+rGEEwsSCUK5CG3uRXIbJ4
 CeADTF70mpMM2HZ2A71MwqEk5CjmVVBjjBblZ+P1w8kouFAphS6CqkSpq8TKz4adETTM
 JHMw==
X-Gm-Message-State: AOJu0YwAr+vWH1v8RTr5jQvUVyJuJw+0kx4Kf1m0WCd149p+2lvISF8v
 jaxVN90pMoSgQleH5oghmPay0A==
X-Received: by 2002:a7b:cd14:0:b0:408:3804:2a20 with SMTP id
 f20-20020a7bcd14000000b0040838042a20mr6807648wmj.22.1700516035088; 
 Mon, 20 Nov 2023 13:33:55 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.190])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a05600c348300b0040a5e69482esm19351694wmq.11.2023.11.20.13.33.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Nov 2023 13:33:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH-for-9.0 05/25] memory: Simplify
 memory_region_init_ram_from_fd() calls
Date: Mon, 20 Nov 2023 22:32:39 +0100
Message-ID: <20231120213301.24349-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231120213301.24349-1-philmd@linaro.org>
References: <20231120213301.24349-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: 8NE+HEX8LXP6

Mechanical change using the following coccinelle script:

@@
expression mr, owner, arg3, arg4, arg5, arg6, arg7, errp;
@@
-   memory_region_init_ram_from_fd(mr, owner, arg3, arg4, arg5, arg6, arg7, &errp);
    if (
-       errp
+       !memory_region_init_ram_from_fd(mr, owner, arg3, arg4, arg5, arg6, arg7, &errp)
    ) {
        ...
        return;
    }

and removing the local Error variable.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 system/memory.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/system/memory.c b/system/memory.c
index 2fe4c3861b..ca05c4defa 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -3604,11 +3604,8 @@ void memory_region_init_ram(MemoryRegion *mr,
                             Error **errp)
 {
     DeviceState *owner_dev;
-    Error *err = NULL;
 
-    memory_region_init_ram_nomigrate(mr, owner, name, size, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!memory_region_init_ram_nomigrate(mr, owner, name, size, errp)) {
         return;
     }
     /* This will assert if owner is neither NULL nor a DeviceState.
-- 
2.41.0

