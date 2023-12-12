Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1034731ejo;
        Tue, 12 Dec 2023 08:45:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9spF/sWCLP6lDEe7Ba5FEvmjt4cw+WRNgPqzvzuCPqYsBJLuRoki9fHfc49HjltoqIeed
X-Received: by 2002:a05:6214:91:b0:67e:aabf:2c8a with SMTP id n17-20020a056214009100b0067eaabf2c8amr6249614qvr.75.1702399502148;
        Tue, 12 Dec 2023 08:45:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702399502; cv=none;
        d=google.com; s=arc-20160816;
        b=xlyBBeRDcvWwWr0qR8X/JYfa7iKxpBA62Gh7RdFIMREaOE624mLvUuNBLBLm4FGulr
         QfNbnyB3PLqwlIJi7kpGmKZaGvF+E/2E5HlZ0jLkiPO7DA6lTphivdebbdya4wqL1WfF
         zgJpKb4rb/s/bqKKuDQyyf7VDtSgcx3gDkp1jBjzVz+HnTC8D5c6x8YYUBHt/cRrlz0J
         ZTAVgppa9qDABy+8PmSitip3objxfZmtIQyZ/IeQJxbaQfvg02CLcfDX0U3VfH1MTecW
         35wRnM+FCSkmyu0obK8+umed8kDVG3NBpuqiTqAtU0AgL3yU8bHLJKaEeq3jRuVJ51sA
         ztaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=hOeQ83EtJ3ms2HhHMlNaTSs4RpfIIzAok2S/UMoUDjE=;
        fh=oSak0SfGtiLsfNmzdEAK2zLhe/BB9IXTK0i2wATuAS4=;
        b=xxVdnLKW66a/f4kGp6e0nZp8kynStV1FTwnY6jasZCDa2VMnbAz8hbmSXfa1y5sYqU
         v5JcJ64JQt2tXKt5yEiLCkh2qJz2k7vAX8B3Rhiw7Ifomajh5RPX5aiuKDal+D/qRswX
         mcng+QwWjm4Sfmj3DfccfSeFYoLiqNrsbOuXwOjqEI1LhrzSBouCfkge3OXfToYdOwyJ
         +Kif73pni0imJqr+rtosZdFQwqSpp2e4LEL/vEAIpQG67pr+uaBiJVOvbf2bizqtROwL
         V/ac+aHqffu9Rvc0sNSA+1mYq8wZagwmiObOM3lG6TwJZNn2WR/nNVAJfuK1ShMyiW1Q
         3ONA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hh0CDesy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8-20020a0cef88000000b0067a261b50fesi10471534qvr.320.2023.12.12.08.45.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Dec 2023 08:45:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hh0CDesy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rD5sN-0004Ec-Fn; Tue, 12 Dec 2023 11:44:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rD5sJ-0004BI-D0
 for qemu-arm@nongnu.org; Tue, 12 Dec 2023 11:44:51 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rD5sH-0004n6-KZ
 for qemu-arm@nongnu.org; Tue, 12 Dec 2023 11:44:51 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-54c67b0da54so7657873a12.0
 for <qemu-arm@nongnu.org>; Tue, 12 Dec 2023 08:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702399488; x=1703004288; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hOeQ83EtJ3ms2HhHMlNaTSs4RpfIIzAok2S/UMoUDjE=;
 b=hh0CDesy+1vNoXsmS6Uaq02kd+JeqY23T7CDSWWBMteIqhFtp4JeNzXOJJKRHJySFf
 /kTeibyTv1EflNfiNjQ6deU/XL6tcPJ+QKIpuaiwADtqUQQMyDWcgICRklTQMoMfTwWr
 L2Os1QfoKp/T5yGhRo0H7032S8mefvGm+EwGzON0bD6Pxj2aGSo2C+GJh6nTcqq1rN7B
 qwOjLViQrH00GyGgjq/wZWpjAqUVp6RntHz7XAYnjva8d8UIseRLFk+ENd//XXn5fL9H
 qeGuHNf6oo7Aj5a8WINR1TmVtphOubJhhYS1VuB2tg+rwk5cPGZK0IOPXdUrK8NIjzds
 4BrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702399488; x=1703004288;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hOeQ83EtJ3ms2HhHMlNaTSs4RpfIIzAok2S/UMoUDjE=;
 b=vVCPfu1AGf1KNWAsYOicGiUBSxRA7RK0U0XT9rOmF7N1+8jRU4oA3ozci0ZflYesvR
 wLtBXlkCA1JsHbRAEo/6t4JWD4P8unjJ2tZZpY274v1x5OAKJtgyUT0UsP7C9QBIR6Y1
 IEdTsO7NoMzUVrcip967/mO+X6d477kJB/z9NzJp2kx5/p0NI+ir67dK04tWc5dQlwrA
 Ph7pIXor/4R06Usyt1cNW/F+SBQpVZlPc14xwy2F5beW2UVxLulZIpXy0+UTTIpjCRAM
 jXfQ/XzFq3FeG8tmRbwnC/CWeWhz6xCooanzQg1+sgYZIPjn3vIPXCR/QHuPkwJ+OPhK
 XC3Q==
X-Gm-Message-State: AOJu0YyVv8zbpgPOqgKTVETRE7aljCnxgHjtPQJ/W7pIrYocjenAEkz7
 wecpMHk2/BuqS1zVmv03oKF5qOhPxstvzrVs3zjSLA==
X-Received: by 2002:a05:6402:2227:b0:547:9f26:e581 with SMTP id
 cr7-20020a056402222700b005479f26e581mr3153838edb.37.1702399487970; Tue, 12
 Dec 2023 08:44:47 -0800 (PST)
MIME-Version: 1.0
References: <20231123143813.42632-1-philmd@linaro.org>
 <20231123143813.42632-4-philmd@linaro.org>
In-Reply-To: <20231123143813.42632-4-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Dec 2023 16:44:37 +0000
Message-ID: <CAFEAcA_wxzio-UDPLzEgMoZoBvQBqjUnHNsF+kYHiBSY-m3jOA@mail.gmail.com>
Subject: Re: [PATCH-for-9.0 v2 3/8] hw/arm/bcm2836: Use ARM_CPU 'mp-affinity'
 property
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>, 
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Ani Sinha <anisinha@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, Tyrone Ting <kfting@nuvoton.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 qemu-ppc@nongnu.org, 
 Hao Wu <wuhaotsh@google.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Beniamino Galvani <b.galvani@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: GObjBnZdygBB

On Thu, 23 Nov 2023 at 14:38, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> The 'mp-affinity' property is present since commit 15a21fe028
> ("target-arm: Add mp-affinity property for ARM CPU class").
> Use it and remove a /* TODO */ comment. Since all ARM CPUs
> have this property, use &error_abort, because this call can
> not fail.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
