Received: by 2002:a17:907:270b:b0:a66:557b:2f6e with SMTP id w11csp131844ejk;
        Thu, 30 May 2024 03:26:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW3iJf77VRlC6ib7omwvQ6+W3YEQ4uk1xZCRznTts4k6a61GH9x5omds/1hWpd2xvViNPVxd5KK6n3vQLg7gh9kjKpX/9JF
X-Google-Smtp-Source: AGHT+IFm91M5X5YfbnV0SkcBH6Fhxq9w7kU0PyfEdQdwcjpK0/CNQMv2o8GBnAEp7d5e6snjYzX8
X-Received: by 2002:a05:622a:143:b0:43a:e77c:352a with SMTP id d75a77b69052e-43fe92bb467mr21813521cf.17.1717064775324;
        Thu, 30 May 2024 03:26:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717064775; cv=none;
        d=google.com; s=arc-20160816;
        b=VWRB5daew0S4LpYNipwTTzeBYw2LvfflFlio9thua89hNrYhhIfqQX0R8t/1yW/pde
         BLrbMlzaMZ41u2VsEOfFRJrFYIqPrL1/+/TIiIeC8pKzCRf6+2zQxSnddkK11ALQATx+
         XrcmfFO3COcPJY6EfKXUkNCCM10gXUyueZ8p73SV9V66oXvucz53Iv7m0VnWNd1+5KIy
         NnJ4LTftZUr8b0LKzEa0MVA7QG56TtYj6py1kn76m+yVHQtZHuU77Ahd0JvoDdG4erd1
         GNaA+aUIXggN5xzoeyoOcya9Oynpzgcv7mNEnctuPofNZH7hlzLGTc5/Qr+m7t362Pdc
         0NGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=kf8UksB7LMwHhAz/qinaPP1Tx0GU5PV9yAGZoWBeMhg=;
        fh=kobSv0ETnwhsKv7z6PvxWWC1yH00CFw3zmklBF4uEQI=;
        b=u8obOORQzoG7eDseoGJkqAPtIJ8CTm4rXLdX7W/ndBo3gP2YNeVCP8H3ghYRsUBpXo
         ktU8INHfSXadvs8hkkFLhg2zvM4lcN2ZO5fLaC57AlTR1JbvmfQKSxnFkD6IzzeNkehv
         AIM/7vM4WLEyyf9d0BBXYvx8U0kWkfAjOc7FLAbuIrIZIha4GEsN8LuyPKFKyxCG2pdp
         W+OcrQMEipdt5UTh696D+hIml9Jtz35LcqrqXPwYHb5xZBIJrYe2meMA/HlV/SXgnYV/
         jwKxdXO0tkt6g8uT73kjcw+mhYSraa3KN4VcG5ZrYa22cPrSfqMpi3lHAcB4ieiD58Da
         dZLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hV3Pwpum;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb5c5d52dsi11992181cf.291.2024.05.30.03.26.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 May 2024 03:26:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hV3Pwpum;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sCcyr-0007M6-4g; Thu, 30 May 2024 06:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCcyn-0007LG-Mt
 for qemu-arm@nongnu.org; Thu, 30 May 2024 06:25:54 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCcym-0000Bh-3Z
 for qemu-arm@nongnu.org; Thu, 30 May 2024 06:25:53 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-57a20ccafc6so477722a12.2
 for <qemu-arm@nongnu.org>; Thu, 30 May 2024 03:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717064750; x=1717669550; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kf8UksB7LMwHhAz/qinaPP1Tx0GU5PV9yAGZoWBeMhg=;
 b=hV3PwpumJOm2nv936sChgu1dJ8hZTBJz6GTFzzK9AcOIB6VNHOKBNlXCxhKGXGBTM7
 fxF7BEMgrVKl4z0SEoq/+jJGulw3oBPNYnn67q7hD7cVgPNu6PgfB2QRB9E3xM4hJgJ4
 BDE8lnT3qdYzQJysfT5XauPKRSscLm6SDsplj/6I9VvkyYCZAfbp5hQs5bs1bR04AJhn
 vbgrVTCro8dJUv91AQ6qIlLtq0Sp36BIjABPX8ANGhvhc51924gYJEdRmzDi/fut9bQQ
 WoSXQB26MrKfI5GQ7rxMs1+vU/9MS8BmQIdOP8x/d0cy/56SmvQq35mB/XsYWQyUawT9
 GonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717064750; x=1717669550;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kf8UksB7LMwHhAz/qinaPP1Tx0GU5PV9yAGZoWBeMhg=;
 b=sSp2xugWI1IattUvpOHjW3Bq3EZ4HUPVEd9RKQb5ir/hEeFgibqiLgYfJmSOeb7vYa
 xX/vhAZWoNdXzxxAH2EOqxUpO9Ds8jTPp+JVHbjAHbmevV5Y+iM9P5QfK7+Ipvj4tfTM
 BcfsmOynMNqJ0+l/KSzYSuKCWJr2SEar1YLom/ZnEgTZkdh/0lnz2hy95l3X3YorGW1Z
 mKaUe8QuSfVafwBcHiaLBiEXyyhcJLvY7o9KRiGqfWI1AXeIiT2A1QJvOTdPjtcZav5K
 FXu3q+0pCS5YhC4LbKG3pzgFf7DmZNOmYxD9SSvdoNVpY6J+x992tAoZpPoUb6efeVV9
 Ee6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLt2/tXj9c24/aF8ucLDwcINairp37I7xcj9IL/CrZbWt+MGVbIyBEW5TztEPfVFX/4Q2YEzcdjq1tffj2EdMXN0UT
X-Gm-Message-State: AOJu0YyuAVcAN/WVfkAIlbcVcrorZmF4V7Bi7OSMn7C7Ee8FX/U3g97g
 Y3WkFMPhmHbf5c3R6eOQgJyDRhv0fEkk9i9KaX/qke5PXPJ32l8jFPyYRPicuv3Txs8gppIYM7m
 Fc/2/ywiOfL3jH26lOWCk6OXOje7LMhGTa6Apxgtl3YNxjhqR
X-Received: by 2002:a50:9fa1:0:b0:579:c1c3:c155 with SMTP id
 4fb4d7f45d1cf-57a178e9cd1mr1040160a12.31.1717064750211; Thu, 30 May 2024
 03:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240524113256.8102-1-sebastian.huber@embedded-brains.de>
In-Reply-To: <20240524113256.8102-1-sebastian.huber@embedded-brains.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 May 2024 11:25:39 +0100
Message-ID: <CAFEAcA88Tb9sKR3eMDdh4SRvoU7pF0=jmzP2CFNXO2QuS96Zbw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Fix GICv2 handling of pending interrupts
To: Sebastian Huber <sebastian.huber@embedded-brains.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Luc Michel <luc@lmichel.fr>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
X-TUID: FlQ8Ocd9Ven1

On Fri, 24 May 2024 at 12:33, Sebastian Huber
<sebastian.huber@embedded-brains.de> wrote:
>
> v2:
>
> * Fix handling of SPIs.
>
> * Remove pending state if not in new target list.
>
> Sebastian Huber (2):
>   hw/intc/arm_gic: Fix set pending of PPIs
>   hw/intc/arm_gic: Fix writes to GICD_ITARGETSRn



Applied to target-arm.next, thanks.

-- PMM
