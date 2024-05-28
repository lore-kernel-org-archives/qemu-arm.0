Received: by 2002:a17:906:ca8a:b0:a63:3083:985b with SMTP id js10csp376845ejb;
        Tue, 28 May 2024 02:52:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWzbntRAL0IMjYHVJcfwls4PvQj/9jJ3LU+CZGkDtd2C50853ids0IQvkFmQRd4t0+s09rRTY08icO2qP7yVWrXY3qUrNj+
X-Google-Smtp-Source: AGHT+IFLjrin/WjI38jcYzUYkstyp2mFPjMk5cljY+EBJNfuL65hewqC7pSDu/VXV6aw7P3aE+Z+
X-Received: by 2002:aca:1801:0:b0:3c7:a4d:d54d with SMTP id 5614622812f47-3d1a5483704mr11924330b6e.15.1716889970648;
        Tue, 28 May 2024 02:52:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716889970; cv=none;
        d=google.com; s=arc-20160816;
        b=sNGAi1Ayz03FSh8dnmQIHOMbECHFZI/F0jDSCrOuuDsRCNzSYQ7m5FVUuSUdt1RQvI
         l18vJeubRbfDGXhRKEWlmcwRMoJki5RnW/LwdyHB58F2ERZFMkEYw4UtRQvh9DmJkGnp
         oJXm0NiiJuKE9dkEFvLy/HAIQn+7VUjO8zd+yXhnryQj+yQDRlOYKf1nnkp7HrrqEjDz
         r7rGxPotizOZfojzWTOqd4Oxt3kWDHZqYaoSaUIDwTo7qDbAUl6frnV7jzR8nDfa4RjW
         zx2IGujSzFJcRUMTG4i2lQ0FHOYPZy+6A3VceJ5JvZo1mjB/H/PqXJOfJYT6kMDyCsQ/
         1jdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=FJw2C9pSXoE6Z1SVE38SPznu5lFfevjpeHcHyvXAO44=;
        fh=kRicVupqyko4DJ1sS1OnU1mZPavTh9JtdM62mnuOdpE=;
        b=Dvfascn4S+gssh1Bz+Ej5prcEfMqawJKWkWbqgvBeWPn/26f+NQuvnCtARGjVH4oKF
         8I1oyCw5nkJ1A7h9nPRJRjbTIcbUWO3l56FjwlVWwzQavc50bSTJen3Jsn8YRav/fLUk
         qGporPu4Rq9vo3E+A1gY8PlPQ/+oc+kwIAP5AYZDUFK0fD+RhVezxLNPNW+bK6dFhVXU
         SfoR0TyvSTlVsJTEKsqK/Y8wznDV/5zg0Qh7OXIgv2g3ha6KNsJEMTyKwzpHOyyhZznp
         6g6PkqI93prT5ZzKAOUjDulGcpWyWkdJvo8YUzh1x70GqMbvdyTnjlt4w2Qo0YUWLdio
         sXUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fca89db2bsi54591141cf.302.2024.05.28.02.52.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 02:52:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBtVc-000773-EA; Tue, 28 May 2024 05:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=HxTW=M7=kaod.org=clg@ozlabs.org>)
 id 1sBtVb-00076g-1T; Tue, 28 May 2024 05:52:43 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=HxTW=M7=kaod.org=clg@ozlabs.org>)
 id 1sBtVZ-00013w-7c; Tue, 28 May 2024 05:52:42 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4VpSVW54HQz4x2k;
 Tue, 28 May 2024 19:52:35 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VpSVP736Bz4wyw;
 Tue, 28 May 2024 19:52:29 +1000 (AEST)
Message-ID: <1d927a59-8bd5-4407-b3bc-b50bfa0fe93d@kaod.org>
Date: Tue, 28 May 2024 11:52:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/16] aspeed/sdmc: Add AST2700 support
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>,
 Yunlin Tang <yunlin.tang@aspeedtech.com>
References: <20240527080231.1576609-1-jamin_lin@aspeedtech.com>
 <20240527080231.1576609-6-jamin_lin@aspeedtech.com>
 <9476cfcc-5a7c-4b76-a684-1361463bd161@linaro.org>
 <b01604af-5fa7-469f-98e9-c23b3a668a2e@kaod.org>
 <933822dc-de0e-4180-90f9-d951aed30aec@linaro.org>
 <SI2PR06MB5041CD54D31762371A757C48FCF12@SI2PR06MB5041.apcprd06.prod.outlook.com>
 <9dfa5ca2-56a9-49c4-a651-044dc952f67b@kaod.org>
 <SI2PR06MB5041A8BD40F5BEC60A4A3A76FCF12@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <SI2PR06MB5041A8BD40F5BEC60A4A3A76FCF12@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=HxTW=M7=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-TUID: 1p/2+AJAGoLq

[ ... ]

>> I don't think this is necessary to do so now. Possibly, increase the version
>> number in the vmstate when resending a v5.
>>
> If I understand your request, do you mean to change as following in this patch?
> 
> static const VMStateDescription vmstate_aspeed_sdmc = {
>      .name = "aspeed.sdmc",
>      .version_id = 1,  ---> Change 2
>      .minimum_version_id = 1, ---> Change 2
> };

yes.


>> Also, all Aspeed models should be addressed and that's beyond the scope of
>> this series.
>>
> 
> And create a new patch series to update all vmstate version for all ASPEED models?

That would be to remove migration support for Aspeed machines. For later.
Let's address AST2700 first.

Thanks,

C.
