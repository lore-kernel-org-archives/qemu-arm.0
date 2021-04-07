Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp716755lfr;
        Wed, 7 Apr 2021 11:41:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7A1fuVkxwAExrW0KHRzua0656CQ2FoGspCvrrwJS/dt9vPABtwqyLYAY8rkMdli7nn6bU
X-Received: by 2002:a02:c899:: with SMTP id m25mr4863665jao.113.1617820869402;
        Wed, 07 Apr 2021 11:41:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617820869; cv=none;
        d=google.com; s=arc-20160816;
        b=CHGqa4Cr4nS+e0J5xV6aJ74tHKjI91w5HFJj2SFMla+Kz9Yu1dsfswQiCCXRvuRPts
         K1WpG1jEkTHJglaDacHxSCyt0oWD7VwFdw1ZekrSRa+9FEAYe4Q40Mfj9m05cAdfJJ/m
         eEvGEOhkLiQgwI6tSWuCGeiSTwu9R0PmNyMSsA76TUO8ledeRxAzRoqjN3oZkYGbBpn2
         igwLDpgWJF9Yytbkg6LTT/lK0Q1nL7p9ObsoLngGqwXEFYZ1wLs5bZJArJFrolXwkj+z
         qjwRBsL0sRzqxtHAMhz7+c1Onec+tWDBJynJSwOfMORkb8BqDsF/YH/GvO7spY2lw51U
         hG8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=lwY3H4fJwDhb6b713eNOsvQ/tD8rzv8BNHLSTOmlFw8=;
        b=U8csJCCStn1AaGuCKoGxN92l1jezOK5TPpsQbHYllgC4WYQYDkhVeHtwdFrkKmJSyV
         C1WDNdgr3znKTagp4vaTdI5DakwB1ZvtCrXXg5sWzqmog/2H9TFIb13wwnlCXlpI1R6R
         xFZmAdYfb77ERcjnr7THak+H/gJz7DXvIJIAF3ydvUIj0GHG/K/Cn7duW23UyRXjggK3
         lYg75LPfosejEKUWIJ5cyokPgrLI3x/GiHb7qbUzWDsXAgEzeP9+ukR/kTSGQC19O7G+
         K+DI0Hf0RjM05OwcDuDF3c3qKly51wNo2CUcE7i348IbLvQJTosGb2DhOLLcOK/JPx+K
         cZ6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N65h2XZe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8si20177950jat.80.2021.04.07.11.41.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Apr 2021 11:41:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N65h2XZe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUD6y-0000ij-AY
	for alex.bennee@linaro.org; Wed, 07 Apr 2021 14:41:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lUD6j-0000he-2T
 for qemu-arm@nongnu.org; Wed, 07 Apr 2021 14:40:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lUD6h-0001Bj-9r
 for qemu-arm@nongnu.org; Wed, 07 Apr 2021 14:40:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617820850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lwY3H4fJwDhb6b713eNOsvQ/tD8rzv8BNHLSTOmlFw8=;
 b=N65h2XZeCr0n+LNQQryGfy7On0cYJKnRHjFSekQz/+fPgRCPA49QrQuRQf0Kn+C7LArV2o
 Q1jEzSuk7DTzV9B3StEzxmjz3P/nEkMKt2HVO7/qDHy0DCNgUqcvoMvFC4usBkGAgRtU56
 dA7JXgMxXZSvzi4eT/LYc1nD0dpDIas=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-f1NhqscENm2769qdJNsotQ-1; Wed, 07 Apr 2021 14:40:46 -0400
X-MC-Unique: f1NhqscENm2769qdJNsotQ-1
Received: by mail-vk1-f198.google.com with SMTP id k198so6224715vke.12
 for <qemu-arm@nongnu.org>; Wed, 07 Apr 2021 11:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lwY3H4fJwDhb6b713eNOsvQ/tD8rzv8BNHLSTOmlFw8=;
 b=ex8jpkxg0q09skdjcqIF344ptrjNjtNjGtfNd+1Vr/zYJ1LFEdMJCqSCIASfNkCAwp
 oZiYfp77TGmoTLPsWSWhBBWHFHPmsEY4yWhf8v6nDp5QKxjiy3mhLjz/iyC5/+1kmlgY
 +Kt6hWAyJq8zstZOLgoVnSsV7c3FDPnYTC+psdXAbbyBd7HZr/HmNAXQT0+a+aU1OLOB
 PiwIMxm4jYdkCVNPQnFYZ++Wzha9OYD2ubBiENFTR0hVLEYyS3Xa2Orj0jis1kekW6U3
 fhrNXILAq2uo4XYRvxYgtxUuWQmauJAXOWSSKqxg7WHXZQJ9XAwqZlgiIVuF4lUpIzR6
 s/JA==
X-Gm-Message-State: AOAM532bGzNjsoKeynK3nm3/6LpdN8jTdoowI9c++m5xKcaokyC93viy
 qiHfInBuJKzRzNVQK2h/qEo6wrNd6Lt+DSv8gS5TZclFR1PKq+M2G4akuk8jPHN59eOhzbey+G1
 7Yh2Z0G1g6YwQCU1kX0ehyfCW8ZPx
X-Received: by 2002:a1f:2cd:: with SMTP id 196mr3147129vkc.19.1617820846336;
 Wed, 07 Apr 2021 11:40:46 -0700 (PDT)
X-Received: by 2002:a1f:2cd:: with SMTP id 196mr3147121vkc.19.1617820846165;
 Wed, 07 Apr 2021 11:40:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210407171637.777743-1-clg@kaod.org>
 <20210407171637.777743-12-clg@kaod.org>
In-Reply-To: <20210407171637.777743-12-clg@kaod.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 7 Apr 2021 15:40:20 -0300
Message-ID: <CAKJDGDYf5_4EA2viA=o1qvWmMJvOxoJMP60yiGX+11dVDd9HHA@mail.gmail.com>
Subject: Re: [PATCH 11/24] tests/acceptance: Test ast2400 and ast2500 machines
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rJ9ajS6+9FKg

On Wed, Apr 7, 2021 at 2:33 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> From: Joel Stanley <joel@jms.id.au>
>
> Test MTD images from the OpenBMC project on AST2400 and AST2500 SoCs
> from ASPEED, by booting Palmetto and Romulus BMC machines.
>
> The images are fetched from OpenBMC's release directory on github.
>
> Cc: Cleber Rosa <crosa@redhat.com>
> Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Co-developed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Tested-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> Tested-by: Cleber Rosa <crosa@redhat.com>
> [ clg : - removed comment
>         - removed ending self.vm.shutdown() ]
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Message-Id: <20210304123951.163411-2-joel@jms.id.au>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  tests/acceptance/boot_linux_console.py | 43 ++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>

