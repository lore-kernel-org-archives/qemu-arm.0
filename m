Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1522065ejc;
        Tue, 26 Sep 2023 19:12:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfqZihwXPtomZE+/eCkG0CQRbtqgNsxhD8Tdewi3TDabZTOuQhVlU4kOsfpjISF+5ialnw
X-Received: by 2002:a05:620a:2aeb:b0:772:63b3:1ad2 with SMTP id bn43-20020a05620a2aeb00b0077263b31ad2mr571260qkb.29.1695780763875;
        Tue, 26 Sep 2023 19:12:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695780763; cv=none;
        d=google.com; s=arc-20160816;
        b=mIfEkTK/UPFpIBNN9ma7uc4b+UjczM0JgvSodLAtdZEri6STGGKh4VAkSwbRc/4U+z
         qA7vU2PeeubbAeiWljP3A+vXnIdxqRgBzLr9ZkV0Ml12PjMXx9XXbUJrM0W13f2LG3UV
         cR68mwewb3hs+7pUpLsK4XaypkGdMkUlv1wm4gFnYmW7W5PgCjyw43DaJwXrRkGClh7p
         bxH2pXY6lYPCQJWm1y8n0oAuKi5TNN6wvL/aHCDQGv443Uv1DTjijJrWAULGjGf5v2BC
         3rAi2YmX9n8wrFUdBYHXb3oc1puCsmuWXed8tv2AdZg4mB06NDMHRNXJa5KLFRMzOZsZ
         ABEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=szwqZSt719tNowx58fH54bCVU67vzt0Or7JlcQbVZZ8=;
        fh=1FWBMdsfRIEQMc+11R04WaQvgemgsYbTctteRR5qezI=;
        b=v4yQFwKyUUBWn2m+hP0L22Rv+cj7Pu5ecmAx3QyEt+hQifVTngU6/vRqXVgzaBzhyY
         fH/Gd+pP8xgW+5C6kkKZanZ56Lahht61pz+5/G5bsmKcx2dun2cyH7EtGpVJ1IlekfiW
         PKT072Lw3VN/R35lXjtJ4Kqs3WGP29s8rqR6zRpdOHYe+GUMCGIRSgtzt5rsHFZ1/t05
         8YJ5nrXwSRk+i36Ism+AAzpJ8SQ9WJGLIXyxlGiHw7evpY6vjdIGGNxrn1IpaQmM4bPV
         GryF/1cooeMuN850o/xpPGcIUp1Em6bKpFm/KZQvmsK6MveqG7SUAzHLyxmhOCzIUeuG
         Ol3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=WZUJBM40;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17-20020a05620a441100b007672b5d6f96si6035970qkp.17.2023.09.26.19.12.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Sep 2023 19:12:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=WZUJBM40;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qlK2M-0007Ys-Hz; Tue, 26 Sep 2023 22:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1qlK2K-0007YY-MO; Tue, 26 Sep 2023 22:12:24 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1qlK2I-0003Jq-4v; Tue, 26 Sep 2023 22:12:24 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9a645e54806so1227621666b.0; 
 Tue, 26 Sep 2023 19:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1695780739; x=1696385539; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=szwqZSt719tNowx58fH54bCVU67vzt0Or7JlcQbVZZ8=;
 b=WZUJBM40LaGoqwCmlOJnOJFYcyagusHJKu37BcAdgkMHPXLnkNOegoQMqiNbxhBzHs
 OKNV8KlP61D1KNkG0HH4Tuqx2uYv3MJB+9IE8Be5+3GuL3JzulwXjXT8PIbzoXVIAl/5
 fea5/+3lc5NU04btAKgt8ZsAfgRCq9DuFpF9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695780739; x=1696385539;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=szwqZSt719tNowx58fH54bCVU67vzt0Or7JlcQbVZZ8=;
 b=nriD+LhxEpxUR9wERVHcXKOG5q7TFcX+MtMISKTENoWsBk1diqP4eAe6bD6vQSWIal
 qjSBeFvzs7dRjJOLrvyCzNuuZgXL/iDY37zdbAXLAO5ndJINLE1J1eE/D4Ol6rHt01bs
 46jjZQ4v6ZEASi/1pdVeSNXPazd1RX7qrnT7xkARKUFbWaddqFzC3QYqT4ayDm03Gmd1
 rZWt06DQv3K6ydpyDIN15J97ABNgjNzD6x9OnHz03BJPiq0HGYrloLXtEvHkx8mwzoja
 HAlKLw4IxfkbSDvwgRZNxgPhOUbRveQ4VhIuobZmJ98vljGHXJepQdxOqz/Y8/mCDleu
 hDpw==
X-Gm-Message-State: AOJu0YxO5omn8lp+UHxqjWS/ChExBgEXhCwwWOD05FdpgTezu5CaZoQI
 G4mH4rF6gwtXra5B5aeGewVEmnSVIVCtu8Mf7JE=
X-Received: by 2002:a17:906:32c1:b0:9ae:3d7b:6f46 with SMTP id
 k1-20020a17090632c100b009ae3d7b6f46mr385414ejk.46.1695780739140; Tue, 26 Sep
 2023 19:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190525151241.5017-1-clg@kaod.org>
 <20190525151241.5017-9-clg@kaod.org>
 <a4a62040-0127-4f39-4fc3-a1795e4daad8@kaod.org>
In-Reply-To: <a4a62040-0127-4f39-4fc3-a1795e4daad8@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 27 Sep 2023 02:12:07 +0000
Message-ID: <CACPK8XcCn4hK5Lu-6o7LUyUFVH-dkbjJ-1_fHr4_90_4cZf_+Q@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 08/19] aspeed/timer: Fix behaviour running
 Linux
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: efnBdU7NHQuU

On Fri, 22 Sept 2023 at 13:21, C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> > +    t->start =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +    return calculate_time(t, MAX(MAX(t->match[0], t->match[1]), 0));
>
> This MAX(MAX(x, y), 0) looks strange to me. Would you remember where it c=
omes
> from ? Thanks,

That looks very strange. I think you've sorted it, so I wanted to
bring up the MAX macros themselves. It's unfortunate that they create
a non-unique local variable. Are we allowed to borrow the kernels
macros? They have some infrastructure for creating a unique local
variable name, as well as handling the const and non-const variants
with the one macro.

https://elixir.bootlin.com/linux/v6.5/source/include/linux/minmax.h

Cheers,

Joel
