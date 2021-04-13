Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp4993208lfr;
        Tue, 13 Apr 2021 08:48:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLSbypQugiWqxfAePHR/hQvuILxQJKE+n/25ygv+7WCm2SzeeKZnPTieSi6XG42/vxs7dL
X-Received: by 2002:a05:6638:34a0:: with SMTP id t32mr10570259jal.10.1618328885059;
        Tue, 13 Apr 2021 08:48:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618328885; cv=none;
        d=google.com; s=arc-20160816;
        b=k/mTbmkUUc8JvYhk6YOUcl4rBUhpOHoh8A1qlNHElw2aKHld3/ke3FoEZVlWfDZhJr
         5LKlxTpGqqBAR9qvW+rHpWMF4ka3iu6zUN/x2TOCDvNef2NDMH+/Wb60eKaLxrTZ50/V
         HzIN7agz/PwoR6+FB6szPdn62jsKsoRYHVuAUB14xl6SZ7g+jU56TgVAVeKvtZ+GslIw
         bpLmJOBGQ36mT4Z6aavSUudc6yDD0MgrhAHaGVwxQ4S2T9xu67uzrJUIiJtQak+KFgLd
         //BH60Qpehmucc8KGGjja7pFd0p+tXD8Wgr9WS9suQPuG+HncOZ+tcK5gDxZGbVryq7X
         MAJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:mime-version:dkim-signature;
        bh=y7J/fBirApy78iLSgXTfuV1e6gzXBUyIlvX5q0pbZ1E=;
        b=MUtaqSVLWIvGR1IKjbTVkEm+qEenOQXrmFYvxQolM8vB0tKdv/nVXJ37/sdbUpPEE8
         0kYuH8sGu/jyqmFWEjC5Crzvm87be5dpdCNrRd1sWi6uwo6a2cVU/8E6hmW5Cu/GJO3i
         86Fr3BbDTGqlbDbHMjDRFRgV4xI+hfabep3hpuyUGRus9u7Wg+zssdPmLPopq/Yq74er
         14JsV3Ol8cHTp+1su5NA0br1XxLGAW2iAPn+0+dqcqkNtiZWSYs3EhoD1jjQNAdafDDt
         aJH+PE91KPntOKTX1DYAweXEGWMgNwQGUz3EIC5t80Lh6l9yvsMg2NPtBYQQ3ZXZnybn
         kuwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=O2rw5KqL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5si14255178ilv.25.2021.04.13.08.48.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Apr 2021 08:48:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=O2rw5KqL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:60122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWLGm-00067t-83
	for alex.bennee@linaro.org; Tue, 13 Apr 2021 11:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lWLGd-00066o-8G
 for qemu-arm@nongnu.org; Tue, 13 Apr 2021 11:47:55 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:46980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lWLGb-00048J-NH
 for qemu-arm@nongnu.org; Tue, 13 Apr 2021 11:47:54 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id h3so7506936qve.13
 for <qemu-arm@nongnu.org>; Tue, 13 Apr 2021 08:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=y7J/fBirApy78iLSgXTfuV1e6gzXBUyIlvX5q0pbZ1E=;
 b=O2rw5KqLRFWHUGy8vZELNtbKhvdX3uZFaDFiBMZUjvQvrp4Z4aLp6Kqv9C0IVTKwpd
 GXHOSxkQ+O7GxxTLiStzQ6iPY05vCO2bYOZRG5q+U0qM6FX53MMKR0Hau1UXhq6cClXX
 2xMQinSM8E8VPRHxVULfvyUug/YJ9ORXTk8S9e1weWs/Cmy2zCXZsB3SgmYcUkD0M7eR
 tcndWSU58/qdpL3rgedSj/8r69YOrr1Al7mAuMWRIJkA76Us65NRFZQSZuPV65FytZee
 EKqiFQ3y8el7nO6+YoJQsaDiUitPQljvQTcWanp1hjv7yNAtA/UiQiHRxihB87DMxFPh
 qZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=y7J/fBirApy78iLSgXTfuV1e6gzXBUyIlvX5q0pbZ1E=;
 b=ZoNrEUkH1OuuiUZduJDtcXcpBGj0RWrlybAMe0piSk9/boYk+4Mz+LRTGXJaGS/27A
 oZvXdgOXy1qsLN3Eipr5KY5qlKBNKp1eC7kBx7V8FzRu1ZSuNB8w7X/QffZM9zlaVpfe
 IgB985UonOVLhmxazwBl1v/1EbVtiALgiyUxT05jZmCAHvqX+P/1rxycFKYJPS+dnlCR
 OF/MuQnWbLPPSzuFJYgK5NM4Mezte6KhLgL+CGocXuONH4qaLMGV5zmD2GPI0deAym85
 CM07dH+YNTWmDgvuSi9nzpVSd0kS/cUYp5iYa/RNMz9Znp/2fLy9o4sRL16G/AS3k2f5
 jteg==
X-Gm-Message-State: AOAM530N+anGitc5JWgYajjUsT5XGQhI/LwHKZADBO7Y1707FlpP/9Rb
 9ocWjEnhFa1Znwr3iHHdcUvihScaHs2U1/WXzfjgpQ==
X-Received: by 2002:a0c:8148:: with SMTP id 66mr33766485qvc.55.1618328871536; 
 Tue, 13 Apr 2021 08:47:51 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 13 Apr 2021 08:47:40 -0700
Message-ID: <CAO=notxyM2Xu5e-iYKGHXEhgwWOb+CFmES8XjaBrx7JZcs+4sQ@mail.gmail.com>
Subject: RFC: Adding new system, quanta-q71l
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, peter.maydell@linaro.org,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=venture@google.com; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
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
X-TUID: /nC2afr3Itvr

HI;

My team is actively engaged now in producing Qemu support for new
devices and boards, and I previously worked on the quanta-q71l board
for OpenBmc.  I'm currently fixing up the configuration to build
again, and I'd like to introduce a board for it in Aspeed.  The
palmetto doesn't really represent it, there's only 128MiB of RAM for
it, for instance, and it has its own idiosyncrasies.

To introduce a new board to the Aspeed Qemu, do I also need to send
over a firmware for acceptance testing?

Thanks,
Patrick
