Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp598307lfm;
        Wed, 8 Jul 2020 09:59:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJws6JB0DSdqI4y3cGNPDSsnaQ6vhEN54QgfQLw0/myrIWsatxJnKt8hzRrFqbGLTeJiuZUh
X-Received: by 2002:a05:6902:102e:: with SMTP id x14mr43817926ybt.461.1594227547669;
        Wed, 08 Jul 2020 09:59:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594227547; cv=none;
        d=google.com; s=arc-20160816;
        b=pwGUc2VyZQwUiaJPuo8ri6w3Cb63yBf3Wn0VOEi4vny+oU8nDdnCaXhLZkVkjvtV6R
         AqUtSqR16YIkBzoLa0cul4nA87h+3vwufsjyxfvSYKJeWNl7VxxeU/2F2uW4rMZGPl+s
         OmzE5BaoRMrKe1DMxbAfW7LwbsMRBwQh+dzMKLEkjfVtTLiApwgCSwLOnzy28iqCyTEt
         t6qdHxlXvstHmFqhzTaU9UKdl10KqbT9bEdJX5PyEwT197M17uac0pQd7hCAGE8i1v9y
         AupZY2rtTMetIIvbW8ZGdPZ6uVSQQOsSBO0FNXVcfUKf2jzFFUvjIrNtcg79u8oE/qUO
         UaEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=KHjhQ90X9ZZ9sieM2RIg9LZWiZLzKRSkK8gH6rPV1Hk=;
        b=PChot8NPOr2P/KpiapjBMPOLz1dl8iRD8RHG7y2OBJrJXU6vZbS2vjfLpOTYLjQ4Pw
         jc/D9Urbyf5aRGow81TyeJLByZU6je1kGnuax8SED+E6gPCAzxdHl7Wq13pCwL02k0vC
         C8WhWx3RUOrui4Nvz7jlweFv6kGWP6GlZS10bJaISFCzmLQXswyBQyYr9k6o4yuPk3/C
         9pRQj5ugqWEkCpg2AuSjEtVHydO4gVzo1C9iApxVRp/mYm1cLZmkORXDLonQidYu4F7c
         L+53wHFIEhOSSYknPZ9gpF3UdqU+OLEfUPiT96O++c0N+rFpEydoalObcy8S6+1C4+Ts
         EaDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=pxpXw8mM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l130si297899ybc.0.2020.07.08.09.59.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jul 2020 09:59:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=pxpXw8mM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:40580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtDPX-0002cX-22
	for alex.bennee@linaro.org; Wed, 08 Jul 2020 12:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jtDPQ-0002cP-4c
 for qemu-arm@nongnu.org; Wed, 08 Jul 2020 12:59:00 -0400
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44]:37039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jtDPO-0001mR-MF
 for qemu-arm@nongnu.org; Wed, 08 Jul 2020 12:58:59 -0400
Received: by mail-vs1-xe44.google.com with SMTP id p25so17059858vsg.4
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2020 09:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KHjhQ90X9ZZ9sieM2RIg9LZWiZLzKRSkK8gH6rPV1Hk=;
 b=pxpXw8mMxWEsL4aHJUxaN+8qxt1xc6rfJh0z9xz8dGAi5iku2zbFG1shnSUR73693H
 jFAaqu5OJzj2By0G7dHbHXKx/7xBo2DolSKRCPi6qwonyEM8Yir7kW6dAzEfiXTj5CH0
 l0lVCkhEqt19aSxPy6ooUHlcsPS6MbQAhKyXtmy2qOlDaq9VvroxDsXfZ/WSWMNs1MzX
 Jw5SLSzRFZikrUJPL7OJBH0uxmUUguwbkN3g6376eM+l6b+kINDORFQxhSk+DnA+l+iI
 buxxgBdW/hZrucyQnD81eCdc1sXMECKwPV1IsyHFj3dSgYgRHTZAk/pzXe3BWvVVd63S
 WnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KHjhQ90X9ZZ9sieM2RIg9LZWiZLzKRSkK8gH6rPV1Hk=;
 b=Ica6SueFl4aTurhgVublANmonUK7uRHzDo+ig5CAlsgW9osz43+vN32pAZxPbq6wGp
 oJa38CtyUwWTaN0iF3L/DCG0reYUakk4fPWSadWcnC/akGO+ZfrVOy9jSsMqyVv2Gx4Q
 VHL0b2ZUmGnHqE+iPcUWdy2sxvT25AmSBC85UEPjL9WuhL9JwFwPhS/kUzbLOBpPF+z6
 aFWeAlRt9bVDdFVaHEjOMiwEoL+mdWeYwmjY10x5AeBp72kCR3KjstFRI+grjH4zYVVI
 NhQXVTww38wlOcIW+RZuOtkQ8RVRY0MU/ku+Zh9WPFvYqhki1+dS9Gduq02W9LVXUepy
 uvlA==
X-Gm-Message-State: AOAM531LSF7IXTIEvY2KQJ6YjbvXuMwMm3+K+Kb5uINvoWkp9irT0pB6
 B/jbxn6IZWrnuBNjrm4Fcb4elAX1FTXszdJQ8Xi5zw==
X-Received: by 2002:a67:2f55:: with SMTP id v82mr45814448vsv.207.1594227536275; 
 Wed, 08 Jul 2020 09:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200707184730.3047754-1-hskinnemoen@google.com>
 <20200707184730.3047754-2-hskinnemoen@google.com>
 <9b824a33-13d4-445d-4986-0c5a135c4bb8@amsat.org>
In-Reply-To: <9b824a33-13d4-445d-4986-0c5a135c4bb8@amsat.org>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Wed, 8 Jul 2020 09:58:44 -0700
Message-ID: <CAFQmdRbbDf9bSpO9djfOhXhFUjr4HwxAm=q-n44D1ATb4V=iDg@mail.gmail.com>
Subject: Re: [PATCH v4 01/12] npcm7xx: Add config symbol
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>, 
 CS20 KFTing <kfting@nuvoton.com>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e44;
 envelope-from=hskinnemoen@google.com; helo=mail-vs1-xe44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -185
X-Spam_score: -18.6
X-Spam_bar: ------------------
X-Spam_report: (-18.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: dEKMloZLTSLy

On Wed, Jul 8, 2020 at 9:56 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> > +config NPCM7XX
> > +    bool
> > +    select A9MPCORE
> > +    select ARM_GIC
> > +    select PL310  # cache controller
> > +    select SERIAL
> > +    select UNIMP
>
> And this in patch 5: "Add NPCM730 and NPCM750 SoC models"

Is it still OK for earlier patches to use $(CONFIG_NPCM7XX) in Makefiles?
