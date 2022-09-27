Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp571678ocs;
        Tue, 27 Sep 2022 06:43:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7L2Ld3ZKuGozooB/s0SXIwdV9d+XfzzBsvH8QTiF8TCd4h9uSmih0ZepAsQSWUKck65jFh
X-Received: by 2002:a05:620a:750:b0:6ce:3d8e:3a1a with SMTP id i16-20020a05620a075000b006ce3d8e3a1amr17440183qki.590.1664286190084;
        Tue, 27 Sep 2022 06:43:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664286190; cv=none;
        d=google.com; s=arc-20160816;
        b=QnvLX4uHg3fyYVB6iXDshiaJ1Dw97q5P5uJURceemdEY1JlJS3eebcCrDk9dTmnvI1
         M1pgqIsbWq715FdOOHbOoggysuTelZKk8jLpcpyH/EhTCnsI46K6g+Tes8vrlT/cFWNo
         CJ476MGEfq8Vp7SRTIzkD/VepC1GlQ3zAeeeOTU57NPfjrOBUGJAVFObPuRr3WW4id3I
         vn0T73+UKk4TC7KGjRIuhh+Uqw2a9/0gcJBlfKftmPkH/LH+p1ACop4UMV9752zdYdT6
         L+2/RnpohnPT9j0z3EQb85NUqxBzo06yGgH6UULbbYlzCqWS2L65hTdrVZzKzjNXUtfI
         vcUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=fN9CNSSp9QD4DhPtMwCnClQHPB7aKH5qbOBL+jucZP0=;
        b=r7WD/Xhqpyq8Ocn9u2CbhIm09cfqLRljVDLrGO6Xl9XF86e7bMk+VPjzPCz/CzMJtm
         QiQuoHmE51nE8A1pgRDzwraBXQ+wFQ2tugavJaadKQxCe2L3NFdwQyiNb8dPbfcQtdye
         pe5FJ6Psoq2khYzrNl9yR+bMf+FYymniKRmFedUivN53tmf98sNEPtii34mXKIY9cH46
         b/tbe73/0NOjU2yOMseOZ64edpywM6HNZ/OK3d2dviIHzyCOkewuFauu72olkzvcCVQJ
         rmh8AZZ4+o1OhlAPIzjJnpXF3yRWC2FBSRxdny9192PY0ttgdYKVUk0pLUDzKbC/O+7q
         GLww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CLVkfux/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10-20020a0562140aca00b004a7b5720af7si1088612qvi.260.2022.09.27.06.43.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Sep 2022 06:43:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CLVkfux/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odArd-00059I-JY
	for alex.bennee@linaro.org; Tue, 27 Sep 2022 09:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1od9Ct-0003R5-20
 for qemu-arm@nongnu.org; Tue, 27 Sep 2022 07:56:59 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:34474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1od9Cr-00072M-4y
 for qemu-arm@nongnu.org; Tue, 27 Sep 2022 07:56:58 -0400
Received: by mail-ej1-x635.google.com with SMTP id rk17so6958348ejb.1
 for <qemu-arm@nongnu.org>; Tue, 27 Sep 2022 04:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=fN9CNSSp9QD4DhPtMwCnClQHPB7aKH5qbOBL+jucZP0=;
 b=CLVkfux/8C7pJ1rPYedPBO3QIFOOPtrJVljnKjDRWoMYuNOTwi480lQzeJMK5SA8MJ
 f2aYizK0SprUvmnxbNbmLCrDHZK7tfgOrPZtORt0WfNT9lHqbbgjB8O1teXLCeu93yo0
 n4VYAhO6qqvtbqXBiAJz9JGzLITJBm5PO9ttdjbiFk8y8wzLoW5euc5GL9fQ7n7ltAZ4
 7vF53Z/88TZHTT8djapfSXmZoOlcIVccLNR98sNPOjGc+gU69f8Myx/jdzXJxgIArQTz
 +p3KhW+mVYtPrTtDKIFTS0B7I90q5M6dgzCBZM4LjbGAE2VlyJDxilTGv4vGKaqO8xa8
 I5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=fN9CNSSp9QD4DhPtMwCnClQHPB7aKH5qbOBL+jucZP0=;
 b=aLqrhGo3TNCZevWcAW3UEy6703d7OdO90lr6YE/dEcGWzfpm/qefn29wcmzPfFJRor
 ZvjeybAD1IavYwAuju4QLYYGfVyIuSnPWk5V0WNSuW14izxBYMoUOV1vZf9SJV21FaIi
 jXVk0JA+plzXjCGnUfEfR4ckmpZUwBtKoPz9j/JvOBD2CjcJfALyh1SFwNGns8U94JxJ
 CSTzMoa1a9MHT719NlY624hjnKwVz+fNRPLYVHUrgyWxYgqSPQr+0mGcrMYXU6KdT2lQ
 OhMgi6wb104nx84BIHLltJcyhTWjeaGaVEtXJu8ZRrWatlwdXv3HPAuATbxxfAzLqYuC
 wM2A==
X-Gm-Message-State: ACrzQf120t6/ccliNGcdTvFUj+X+BoYySvHLzIR06OtrbLE5tlst3E8u
 wFiMhMCvKmfwM0lSrvQXUxgez0e+TxNARzo5moq4PA==
X-Received: by 2002:a17:906:9c83:b0:779:c14c:55e4 with SMTP id
 fj3-20020a1709069c8300b00779c14c55e4mr21919178ejc.619.1664279811942; Tue, 27
 Sep 2022 04:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-5-jean-philippe@linaro.org>
In-Reply-To: <20220927100347.176606-5-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Sep 2022 12:56:40 +0100
Message-ID: <CAFEAcA-5BDiv6sXJ_kpzCwpu20PJRQzOpS08bAswyJiFMSiT4w@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] hw/arm/virt: Fix devicetree warning about the
 gpio-key node
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RKiO+GKHQcjM

On Tue, 27 Sept 2022 at 11:12, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
> The node name of the gpio-key devicetree node should be "key-poweroff":
>
>   gpio-keys: 'poweroff' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
>   From schema: linux/Documentation/devicetree/bindings/input/gpio-keys.yaml
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

This restriction only went into the DT documentation in July
(kernel commit 5eb5652250).

Please don't retrospectively make perfectly valid working DTs
non-valid. I don't see any reason to change QEMU here.

More generally, the set of things you might want the
validator to warn about for a fresh new human-written DTB
doesn't necessarily correspond to the set of things you want
to enforce for a pre-existing code-generated DTB. For the
former it makes much more sense to impose "coding style"
and "naming convention" type rules.

thanks
-- PMM
