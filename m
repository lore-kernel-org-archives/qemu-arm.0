Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp244436eja;
        Thu, 29 Feb 2024 00:32:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV+MO9cu7jdzTopNjKEBqsCj3BeN1+M1v9Gb3qM6PAZCZVR5ZFzuuo+pV+HPyga/oSRPC3MgnaRV3Mu2zGlTe1mhP6b78nb
X-Google-Smtp-Source: AGHT+IFGnX9hvRT21SqfnZVcVYR3dUFPk09wQF6A+O5qByF9a44RfViCKcLTfAuCA8MNa2AoKoBr
X-Received: by 2002:a05:6358:7f0f:b0:17b:b595:ab27 with SMTP id p15-20020a0563587f0f00b0017bb595ab27mr1891479rwn.3.1709195556536;
        Thu, 29 Feb 2024 00:32:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709195556; cv=none;
        d=google.com; s=arc-20160816;
        b=geOhuRqoM55gJ1e/Vn7BD9UX78YkyoxVp5y7QZ+clL8SH+2ublKSgjjfBfNPAikebU
         13uZP2duhhdE7vqzS5hYwGIFS4oT28wU1xb9/75r0KXTqZRK/AOnN1idZ7PUWrav+cWo
         gknW/LuGo7/V2E1VaXQvgbWH16qi0T0Fpfj2kfVPyn6fKV2k8dfEC4wl06AfV4irrfLW
         +Sw47eA45RgUZN2/Ha7JGVX3CK3o78jdFGMPRlVeo4bNA2pJtjzL9asfgHsOklzlMfEL
         KuyRJJu3uEq30StMPaGajHg6fG2kzKCYmsFR4JiM/bMTxdh0imjWjDpbXSs6zwAHNNAR
         Cnrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=b+S+6OwDI1SJk7hxHoSYrbApH6CiJMxCEib9EO3qF5Q=;
        fh=m25XKufb7ldC8Yj3G913LUnjBU6nI9safOoEQ3M2CRQ=;
        b=PuqAhqXAHSrdnAryfgfZq490YnAei/WBDuFAxAQ+DvAdoImhnW1lfOikLvl3cgfDvx
         /VyFh3hsdzjW/KTACIcU5BrzD29hqZpx4XmfM0uiiUOC0ibge9IFN6RkuashGEh4ptvC
         9AAFIQfqN4SkG5+X2VfwJfNW0XevD0hVMmN+pPW0NKOuWbBS0yNyJhh3z/uraJL293sL
         0ACGv75OdZ66dmgx2WKhf1uctyBDXNHHSDnVnMpQ1LqISmakvc+JQE/0gBJdgJtFK3hu
         ozoBAJJk5tlbeuxjptxy/PDV54CEMTDk5z4Z5oS7oVsm3mLArmPdo46xruHAyz8eKhJk
         heyw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jm10-20020ad45eca000000b0068ff18d7766si922376qvb.47.2024.02.29.00.32.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 00:32:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfbq6-0000t6-J2; Thu, 29 Feb 2024 03:32:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=c5Gn=KG=kaod.org=clg@ozlabs.org>)
 id 1rfbq5-0000sm-R6; Thu, 29 Feb 2024 03:32:25 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=c5Gn=KG=kaod.org=clg@ozlabs.org>)
 id 1rfbq2-00030C-EH; Thu, 29 Feb 2024 03:32:25 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Tlkwn55Vkz4wyj;
 Thu, 29 Feb 2024 19:32:09 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tlkwk4JZfz4wxs;
 Thu, 29 Feb 2024 19:32:05 +1100 (AEDT)
Message-ID: <d6e7d67f-7498-4817-8586-8af216f9d739@kaod.org>
Date: Thu, 29 Feb 2024 09:32:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 8/8] aspeed: Add an AST2700 eval board
Content-Language: en-US, fr
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
 "joel@jms.id.au" <joel@jms.id.au>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>,
 Yunlin Tang <yunlin.tang@aspeedtech.com>
References: <20240229074234.976164-1-jamin_lin@aspeedtech.com>
 <20240229074234.976164-9-jamin_lin@aspeedtech.com>
 <SI2PR06MB5041B1EA856220BB77B8809DFC5F2@SI2PR06MB5041.apcprd06.prod.outlook.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <SI2PR06MB5041B1EA856220BB77B8809DFC5F2@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=c5Gn=KG=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: 6hLvWsiz7rbB

Hello Jamin,

> I tried to send the patch series to support AST2700 but I encountered some patches
> were rejected by server IP 211.20.114.70.
> 
> Error Log:
> qemu-devel@nongnu.org
> eggs.gnu.org
> Remote Server returned '550-[SPF] 211.20.114.70 is not allowed to send mail from aspeedtech.com. 550 Please see http://www.openspf.org/Why?scope=mfrom;identity=jamin_lin@aspeedtech.com;ip=211.20.114.70'
> qemu-arm@nongnu.org
> eggs.gnu.org
> Remote Server returned '550-[SPF] 211.20.114.70 is not allowed to send mail from aspeedtech.com. 550 Please see http://www.openspf.org/Why?scope=mfrom;identity=jamin_lin@aspeedtech.com;ip=211.20.114.70

$ host -t txt aspeedtech.com
aspeedtech.com descriptive text "google-site-verification=77FsedIzGqFvs3bFfy5L2lT_AGEWVecyoJwZN7KDVnM"
aspeedtech.com descriptive text "v=spf1 ip4:211.20.114.72 include:spf.protection.outlook.com -all"
aspeedtech.com descriptive text "google-site-verification=sBPPFeYyix6oWeC3GRJ64zQNFLJpN6SFBMT8RX8ZuME"

May be try using 211.20.114.72 (mail.aspeedtech.com) as an SMTP server ?

> Did you encounter the same errors before?

I received the full series 4 times.

But the mailing lists only have 4 :

   https://lore.kernel.org/qemu-devel/20240229080014.1235018-1-jamin_lin@aspeedtech.com/
   https://lore.kernel.org/qemu-devel/20240229072315.743963-1-jamin_lin@aspeedtech.com/

or

   https://patchew.org/QEMU/20240229080014.1235018-1-jamin._5Flin@aspeedtech.com/
   https://patchew.org/QEMU/20240229072315.743963-1-jamin._5Flin@aspeedtech.com/


> My send email command as following.
> git send-email
> --cc troy_lee@aspeedtech.com
> --cc jamin_lin@aspeedtech.com
> --cc yunlin.tang@aspeedtech.com
> --to-cmd "./scripts/get_maintainer.pl ../v1-patch/*.patch" ../v1-patch/*.patch

The command line above is sending twice the same series, you should remove
one of the  "../v1-patch/*.patch" command arguments. the rest looks correct.

Thanks,

C.


