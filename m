Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp437912ejb;
        Fri, 8 Sep 2023 06:50:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEm4U+4nnZ8pi4MURTpfDihv/iNjWX3mEQ5jxsPiEtllk02J/vroXzg9E3ud6YctlXeXcx3
X-Received: by 2002:a05:620a:2592:b0:76c:af30:3281 with SMTP id x18-20020a05620a259200b0076caf303281mr2786806qko.10.1694181033612;
        Fri, 08 Sep 2023 06:50:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694181033; cv=none;
        d=google.com; s=arc-20160816;
        b=WQD45monvdanZ9LHmOodOGGuj+NqdGlSvApA8EKyA08iHNovHcEg8XFGPaOOb8w1XP
         eywS1r3mrcawEGKwdErqiCCkdYPlRysWKiIf8/LuNXkRzuHr8aFlKTyB/7LoASwdgZRh
         7Zzy311O658hhFqNuN1cFEVFlSkb0eTOlMwmK5t5FSBbN25ePHdwKlM0uX3YphJupdZU
         IrBUOHS8zh6jjCtncO11RCbEeTpire+s8o3VRd0ss87VF6ct1ZU0FjlDqRogMtuFynIL
         /xUfjgJ9jcfEOtyADBUcuEtnV+xm4DN8DrM8D23YWvocRr1+atpM1we5+uG6iqlIIWId
         2Rng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=YwgVPYivAxOrVX0F/yhRuJSkuNqRznPV2GeIZSOelKU=;
        fh=mQRietVuQWYYDWSB3j2PCXbmQvkrEzlVN/NE47iC9ME=;
        b=xv/NcT2oGV5QHww7i6/kAafPF/qCHFB9x504Y8zfK+y1ysJ6lrqnVJAdU8f13FqoLY
         TcZwspuOr4WCMhJ0c4RGA0pR4+t8gRiZeTgwNX7PYlz7mJLXTgRgHPILkEBl2YYgO7iR
         FlaTjG09RW6YZPId/cXzEd//XyxXF9ejdY5EDtYWaKYmtgXhC2NjFGqm0BAcJIsj/wEj
         RIdSsynAsVZ2cWAQKHPMuDYvu8A6bbApLamiLrefspM4Xf8XqA3rSkCxDbIL7E54Oiyj
         fKlnsnGaDYzsoBl+5JCRpTDNOPpdzDY0/k8AD4/ExSpfaJIfgPpgfsPY6K5DnZF102pL
         u45w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xbPQ/Od0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j22-20020a05620a0a5600b0076daa9708cesi1086903qka.133.2023.09.08.06.50.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 06:50:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xbPQ/Od0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qebs7-0005XD-SB; Fri, 08 Sep 2023 09:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qebs7-0005W8-4v
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 09:50:07 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qebs2-0000Ld-Qb
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 09:50:05 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-31dcf18f9e2so2030059f8f.0
 for <qemu-arm@nongnu.org>; Fri, 08 Sep 2023 06:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694181001; x=1694785801; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YwgVPYivAxOrVX0F/yhRuJSkuNqRznPV2GeIZSOelKU=;
 b=xbPQ/Od0sQ8wfDuCIPwNGpRBOE12ab3/dtculugKwP2PO4wM+l6wJeptvvYlDGYwdR
 Fu6NiSsHcUdDZJ4Un49P8cauuo38DIX5ykAlPxgBnBfppeZSoBxO18pA7w/Sw9bhHyGD
 DG76YdrG/KOdCxP9QWg7s6Djpvd5ODhwX+Wx2+mddmXMfEPOP6Mry7NzxeJqYKDn2XZJ
 Q8qty+ZLOZ/fVJPKaxOL8gtChpEgXXtUlyov2viKWi+etRYz84zfiuRkv3EMXObMXjcp
 habDIRZmngHrQcXZ0aYziqfHQNnxxBCL57D3OAc2C2+x2zSnmz+UiQGH4o5GF8LNhFWr
 GdVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694181001; x=1694785801;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YwgVPYivAxOrVX0F/yhRuJSkuNqRznPV2GeIZSOelKU=;
 b=eBr3ATUBQDt3VPwaoUCZ3W5X9kjBZT8GtbpVQQjsJrFjnhB2onvMlhD2oTMYQFMs+R
 b8i8SvRJ+FRRIV7bOcql8jLQh3s395iOCEL5ER7HwPiRV/CJw7B5RnmM5nRM43nKWv97
 cu9ZSCTD+1ovjOKZ9K7BCRMsaMUqHmGW0lyhNfEsxqVEKy0S/g/bwLkj2ne6+CkPHA/2
 r6IZgIcgVoo2bK3oFOCDzQlrY42mDjQK6Jy7/haFzECjkR9TVC09eCe8tKRw7SthJtZl
 F1zSFYXlRU9mYirf/sHOMaJyio+1SmoTS5QeGHexLEqeBs1A3nYInCucF4P+kizRCP+n
 C+Ag==
X-Gm-Message-State: AOJu0Yzn9ei8Jd3EgNubsaNGGN4ezfOJBEu5Za2PwBrAuDrX4879TIh1
 ngPEHm+GZoWzQC+Xjl8RnthJjd9vt/7wiXpQEzGdvA==
X-Received: by 2002:a5d:6510:0:b0:317:ec04:ee0c with SMTP id
 x16-20020a5d6510000000b00317ec04ee0cmr1971981wru.47.1694181000990; Fri, 08
 Sep 2023 06:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230831171849.3297497-1-tong.ho@amd.com>
 <20230831171849.3297497-2-tong.ho@amd.com>
 <622751d4-8a89-b34e-171f-9e9f7ac99972@linaro.org>
 <BL0PR12MB48829589D59FA02B93549E65E6E4A@BL0PR12MB4882.namprd12.prod.outlook.com>
In-Reply-To: <BL0PR12MB48829589D59FA02B93549E65E6E4A@BL0PR12MB4882.namprd12.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Sep 2023 14:49:50 +0100
Message-ID: <CAFEAcA_KJFnxg-msgwiaFBzPYkj4RPQeYwLzd4RCy3_br11AGQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/misc: Introduce AMD/Xilix Versal TRNG device
To: "Ho, Tong" <tong.ho@amd.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "alistair@alistair23.me" <alistair@alistair23.me>, 
 "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: xGaeCM2JwWX6

On Fri, 1 Sept 2023 at 05:16, Ho, Tong <tong.ho@amd.com> wrote:
>
> Hi Richard,
>
> Thanks for your input.
>
> I have questions regarding using qemu/guest-random.h for QEMU device models.
>
> Using qemu/guest-random.h, how can this TRNG model ensure its independence from
> other uses of the same qemu_guest_getrandom() and qemu_guest_random_seed_*()?
>
> By "other uses", I mean components and/or devices using qemu/guest-random.h but unrelated to this Xilinx Versal TRNG device.
>
> By "independent", I mean the Xilinx Versal TRNG device is:
>
> 1. Not impacted by other uses that may or may not need to set the '-seed' option, and
>
> 2. Not impacting other uses just because a Xilinx Versal machine user decides to use deterministic mode *only" for this TRNG device.
>
> Also, I am at a loss in how unrelated QEMU devices can remain independent when:
>
> 3. qemu/guest-random.h uses '__thread' variable for GRand context, but
>
> 4. QEMU devices run mostly as co-routines and not as separate threads.

You shouldn't need to care about any of this. Just assume you can
get decent quality random numbers from qemu_guest_getrandom() or
qemu_guest_getrandom_nofail(). The -seed option is for the
entire simulation, not specific to individual RNG devices.

> I suppose the Versal TRNG implementation could use g_rand_*() directly,
> having a GRand object in the device state and seeding through g_rand_set_seed_array().

Don't do something non-standard. Write this RNG device the same way
we do all other RNG devices in QEMU.

thanks
-- PMM
