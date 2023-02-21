Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2861524ejb;
        Mon, 20 Feb 2023 19:41:50 -0800 (PST)
X-Google-Smtp-Source: AK7set8yMqqxQzpLAeTApte9SY0aopzY8kJT8HXb7vuSdQ4zUB8VC7BtmkX8NX060d0tDvy4vpPH
X-Received: by 2002:a05:622a:100d:b0:3bd:d2d:bc7b with SMTP id d13-20020a05622a100d00b003bd0d2dbc7bmr5259129qte.48.1676950910117;
        Mon, 20 Feb 2023 19:41:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676950910; cv=none;
        d=google.com; s=arc-20160816;
        b=JBP4Ae7ZuP/L4RTn8hdc/VviJ6ckfDss3OPdfFWg9msNJz+1mIGnEbG6bkEyKE8xAb
         yLc64XYCcBNdrF29aa4PRYSaXVu21v4hnnOSChL9NfPsvt9BvM1jQIAtZKMI8IwP5PU7
         0H9lyrGeD42bQ5qbi1pDP0Rx+6/F4cAUh6xD+iBT3XOHc5nfXdjmT660eGtX8oj3wbGX
         plePzNPVwHkEaXDI0Lo/AJJbO+Mlh73Ujrk378bSt8ETtQqWNQ0K1PXQQePPt0REm76Z
         Zn9hgkmEADBLu9XWN/n1Ga1iRfGiMg5iRxoL6FOEWwUjit1StfFKJNfm0F9YGPA+w2qd
         YsYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ew+CHHLXjvHcG2LrKoAORoLrhiuOCeSu8V53CSlLFcw=;
        b=sdP+Wh2J4yytF8T8srUenbRPajJzhHGPbzd4sN2gk4MSJyFxE92JC1FZzNrlUGSvZi
         QRPrRe9lLBu6nkWmyobzQ5+Tik57amlvH9DdurXYMh58hpI+m3wK28jvgqqjBkCJLTYw
         zAe9j3UhxPAcGJVApQy29ETPvhhrF/d3j8BPsJJYMCUM7mGzZu31Qh6JO0cAdWiNMxyl
         4uKAWBacjYenzs/+JXID4YEeFQtz+jEhwHr71cHavHcQsBuUJuEXAhHNHh3sCsJUs0v/
         XSwmPYTih21844MmWRIR2+vPQqFg791Gm8NBqhNZhpncwS0J+KkszZPnEOOa+T3KJw82
         psag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wZ3Qr2Im;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2-20020a05620a448200b00733d4b9532csi1564646qkp.471.2023.02.20.19.41.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 19:41:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wZ3Qr2Im;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUJX8-0005rB-2O; Mon, 20 Feb 2023 22:41:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUJX5-0005pP-Dj
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 22:41:35 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUJX3-0005nZ-Ij
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 22:41:35 -0500
Received: by mail-pl1-x62f.google.com with SMTP id e5so4656847plg.8
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 19:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ew+CHHLXjvHcG2LrKoAORoLrhiuOCeSu8V53CSlLFcw=;
 b=wZ3Qr2ImMOSEdXM2ChIKcUTsDvPavvQwSfSxwcNlrLUYuXe6YxUhPPYyB7eJuNwpwr
 rqdGB48ZcHbLU6PmwBx+UW40JXVn6XybYvUfQuet7SGUoJXDGrJH7NUhzVxThxTV81ik
 rQlb5KUwJHNxIQkLwdNVF9034lzq5if36GDN/exDhMFF+E9pMzZ9J3sJOiJduU19Mv7c
 E8qG/KTumej0hyUAyhjBZB1JRP7S+2HxKxLDVZPDHuIT4MHIPstSZa/L09dMGeyedamC
 mlBcYsNydgxXCOVUq/6Qk7193jQ8fR2TH4BWgkUkLOC7Be8y0c54VHnWKOc2OYxVmTSo
 u6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ew+CHHLXjvHcG2LrKoAORoLrhiuOCeSu8V53CSlLFcw=;
 b=XeEBro1Ho/mD8iG6yMYGXP7Rn9qj8hoLc+mTixxdtH8YJlkhjSFX15LfS0FZO2V06q
 Xsb9Nc3xhCWcS8JxMn/YjW44r0eyLKufbgcsnKNqRBeR8MqE4YK0fs2Jp0fCK+8ecJ13
 0LVzNHGARJpMbNrZ/TQ5gWEmcfPt20VmpWOMF/pmTKNbIcaaL7LoyopUvyTf39D07T7b
 /348oV4gpsJ/yLe1I0wlYuu2eYdBIRkIDUU/T8p83r6QyCXwJ5nsD4rRbOqcWCx6FEsX
 3UZvN1GAOK6P2DB+zp3taaSFDVlxV/8ej4nZlvQOTwLftTD3HUwobZ3PePrUApdH3FXI
 +tCg==
X-Gm-Message-State: AO0yUKW14QhOm7YoKnGLWVxD6CbnIgfYVJ6To1rdOuDAe+XG+k3jk2A3
 msVrwSvg399MJ24FyIgKLtZ01rm3NA8wMvWgnGg=
X-Received: by 2002:a17:902:f283:b0:19c:94ad:cbe8 with SMTP id
 k3-20020a170902f28300b0019c94adcbe8mr157128plc.36.1676950885850; 
 Mon, 20 Feb 2023 19:41:25 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a170902c1c400b0019a88c1cf63sm69851plc.180.2023.02.20.19.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 19:41:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 0/2] target/arm: Fix gdbstub for m-profile (#1421)
Date: Mon, 20 Feb 2023 17:41:20 -1000
Message-Id: <20230221034122.471707-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
X-TUID: PoHhavYZ91T6

This will conflict with FEAT_RME patches; I'll fix that up later.


r~


Richard Henderson (2):
  Revert "target/arm: Merge regime_is_secure into get_phys_addr"
  target/arm: Fix arm_cpu_get_phys_page_attrs_debug for m-profile

 target/arm/ptw.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

-- 
2.34.1

