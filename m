Received: by 2002:ad4:4a74:0:0:0:0:0 with SMTP id cn20csp27359qvb;
        Wed, 13 Jan 2021 05:47:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVQL0ZxK46Im+ubFLLAsCssiTVHBISxAIwenUJMeDoBTwoesoB35eNxLDbcRpZd8IaW6qq
X-Received: by 2002:a25:30c1:: with SMTP id w184mr3389706ybw.302.1610545625369;
        Wed, 13 Jan 2021 05:47:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610545625; cv=none;
        d=google.com; s=arc-20160816;
        b=tQAhxGZ5ZDRp8EGelbqnWKvbxWivbG2LQahsfMufG64WhDL5XeauJtJZeI4lu1EtmE
         IE5W6Sx8aFtXYO1U8YyyzWqd9eYrSa/oIPgNqNwq86vMHzkJSmYupQIvVzSDUC//3s7F
         dA22+/SnRbiZiIJWD1v6tA5DNIeEyMq0XYLj0trpjoyb4fqPxi2hI/aKFpIqHLx0cQkJ
         4juSItBPGS1OzVgIp66NqaIis6eAME6KXKTi7M+y73CAZDk36NVsCoqnn9qHQfTgTSIa
         gG4rqpDXVAtgGNh4b4WNOvGArE7bt15CIRbNgOwIlk4xKRGD1W7my7ngB4gD/IgFKlHM
         ujTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=z4xSfq28ilhdS/dEKCCRIC+4nFcHCGo8hIdFUOMrRzE=;
        b=HmKALBs+l/0T1D1sb1aA0F+o03Fn+In8z+BtAhqVhbSuEG0AnHle/Ju8B5+FH9KDOM
         Qq9AN43dGrxGSovFaASdcHcYJfpwQxPqN2mSuFtlNtPf7GR+zfq4VEzRJBwuqzhaWedS
         7mnahT4WdqIw/2I9bUcB/k2HsNn4xSlMNV+PyQp1xRdC4PQvgn4oSrVvcbiUs4ukYTax
         jHjUMKMY7jgyA+rulpgT71+G7M/zQuD270gkxD5akQFR2o2RT5KDjsXm/adGuF8bJEyf
         pK6rTxArCiMufyuGtSOKqIV9db0rTjKcKj+ueSQYuO2+KVpyD3uY4RUfb8qD+c9exSQH
         Heew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hPXh0lqg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m184si2389743ybm.191.2021.01.13.05.47.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jan 2021 05:47:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hPXh0lqg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzgUK-0003UT-Nb
	for alex.bennee@linaro.org; Wed, 13 Jan 2021 08:47:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kzgU4-0003Sy-LW
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 08:46:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kzgU2-0003SJ-TS
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 08:46:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610545606;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z4xSfq28ilhdS/dEKCCRIC+4nFcHCGo8hIdFUOMrRzE=;
 b=hPXh0lqg+jVOLaeN3SowmtxLIVaQwjPCSUvzhFcH+I40eIVajJKrk43f/BgnYkoBVbRN3w
 IHWLrRQufD6wJvYQh99dxL+0+4iUqiQxgLFS9HrzxTox4OSLjf2RVTWMzq/ux5sGrSM6vf
 40p0r8Jipxs6LhyJZ1Id9Pro9iv/mT4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-LmWhCuclPtCdL3QvWmllfA-1; Wed, 13 Jan 2021 08:46:43 -0500
X-MC-Unique: LmWhCuclPtCdL3QvWmllfA-1
Received: by mail-wm1-f71.google.com with SMTP id r1so844204wmn.8
 for <qemu-arm@nongnu.org>; Wed, 13 Jan 2021 05:46:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z4xSfq28ilhdS/dEKCCRIC+4nFcHCGo8hIdFUOMrRzE=;
 b=Pbt6ZO8QDDhQnTCwLwQMDWflIWbzkhb6DIVaUddMG9gPxjot30mvEFkkG5+6PZ/yPc
 0Ldcy+jG2reJyzx81mibCYg5+nYZ8l+OiftJ71K0sjAY4jiG7NihWutOsc7Efcf89zT7
 ylKfjr5eTRqkefo7FhYh/rSsp+JK2zVjWWYXAbtownnu0XGVGlvucGr1bru/H/7gnu7H
 AHorMq8Etb1p11JHe36nkSlq+LaJnt9Sm0zgzJFVjXwrX7q3ZNubGcBpB0rg19aGRIyj
 tL5y5Xr+uifYInmkXPqVSksSo0ecpLbj6GjQS/5TX0PTNYUw5DAVOIdb4WNUmJIxV08m
 0edA==
X-Gm-Message-State: AOAM532R60kBNwcroiehocHoN1okf2XVdzNRB7iSTDUn2Nf9whUEQstU
 DiTJXz2PZ+GB7+nDAfS6SA/KNLtAXDbv8faSUwwVifCktx58saqQU9o4WsrNuFRqCOGDN8kD/HU
 3C+wSJd0t0Paa
X-Received: by 2002:a1c:6a02:: with SMTP id f2mr2359707wmc.36.1610545602483;
 Wed, 13 Jan 2021 05:46:42 -0800 (PST)
X-Received: by 2002:a1c:6a02:: with SMTP id f2mr2359688wmc.36.1610545602321;
 Wed, 13 Jan 2021 05:46:42 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id c11sm2620625wmd.36.2021.01.13.05.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 05:46:41 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH v6 06/11] hw/ssi: imx_spi: Rework imx_spi_read() to
 handle block disabled
In-Reply-To: <20210112183529.2011863-7-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 12 Jan 2021 19:35:24
 +0100")
References: <20210112183529.2011863-1-f4bug@amsat.org>
 <20210112183529.2011863-7-f4bug@amsat.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Wed, 13 Jan 2021 14:46:40 +0100
Message-ID: <87a6tdgda7.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 98dhCk5k1R4/

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> When the block is disabled, it stay it is 'internal reset logic'
> (internal clocks are gated off). Reading any register returns
> its reset value. Only update this value if the device is enabled.
>
> Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
>      chapter 21.7.3: Control Register (ECSPIx_CONREG)
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

