Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp3086985njb;
        Tue, 22 Oct 2024 06:41:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVurwfsBSMQz5yn3sBNSk7ZCdQBfj4IFS7ksnW4vCJ4Zp2zbUeQwpwd12lA3hpOUVga77FCVanl00jb4g==@linaro.org
X-Google-Smtp-Source: AGHT+IHhSFBaWGQXY+QekUTt/GAykibTH+QCLPg+NJ1nnSG1oEBBkJPSVj8jTzcQ7Bt2lobjQJct
X-Received: by 2002:a05:6214:4698:b0:6cb:7f2d:b0fe with SMTP id 6a1803df08f44-6cde150b662mr196994536d6.19.1729604479124;
        Tue, 22 Oct 2024 06:41:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729604479; cv=none;
        d=google.com; s=arc-20240605;
        b=hsYDrqRfOafDGYBQmUtMHCLA/IYO15J4KSkiRUY0hfiAqjoRPHrPrlqy2Sjn7LeIo1
         AgdgiJh33JkfGGm4BTKVNU4HP+qDFuwAOsRFYhzvgNobHcKciXPkM9ZNFxga05Lluvi1
         mzs5w/1uioyRq8eYhiPujIYKYnleuCOjSUkJArI4Djpnmr2Y7rsWsmiAJEiX+APHqOil
         Yd6ZVcUGR6NncptiWGwLhha3B2Hg1rbo56snZs0a3Gn6ApDmcInY0XvkM1Y3KAOkMAEn
         e7+MH5PrFz4gHeAUPKZKXvJymD9MD2wY287ppIvkGFaPAbxB1cAEQoXAy1M9nED8R7XY
         8t+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=qmUiHp+Ih/GtY/JiwJQs+IXu+AKXzrq2RrmmQ2tVMbQ=;
        fh=4tbV4zDCr3qoT3lo+LZpSMQdr3/n1yyEfEW7j+pILl8=;
        b=jR0UCfH0f+blFOGNNyJ4kZ/wLv4SJU6a/xRm2msBwkIH+tLIEcwMKfsrHHDHpTgNqN
         3bMtuQE9SSJwFc3u8STwqhroAvTCkaaKRQ/HysERbA3r56DGzbhJtKLIgoO4NOyTnJzr
         uEl6MdlcniEoCfonedn1e8skp4eCjo0wa5Q6Msewvx4WOBi8cxUpVK4MGwgKFwBViIJn
         87rvBrQZU8bL2q0kXLucgxqMf0F27aldByHrEJJAFFFteZyEF4TgY67otTEMvMMuPdJI
         +OzYstGhBCoS9kwMEhHmQLvD4OLOMw3oOvFu+UWn0gAkSh4A5+zfoAYDkTm7RZYLLpkF
         iFFw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ce0098c5edsi65184306d6.298.2024.10.22.06.41.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2024 06:41:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t3F8M-0005mZ-Cw; Tue, 22 Oct 2024 09:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=pGrG=RS=kaod.org=clg@ozlabs.org>)
 id 1t3F8H-0005jG-FC; Tue, 22 Oct 2024 09:41:09 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=pGrG=RS=kaod.org=clg@ozlabs.org>)
 id 1t3F8E-00014d-7X; Tue, 22 Oct 2024 09:41:09 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XXtcD48JMz4w2N;
 Wed, 23 Oct 2024 00:41:00 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XXtbl5JXxz4wbr;
 Wed, 23 Oct 2024 00:40:34 +1100 (AEDT)
Message-ID: <b682dc55-f5e8-4fec-82f7-333dbaba240e@kaod.org>
Date: Tue, 22 Oct 2024 15:40:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/18] aspeed/smc: Fix write incorrect data into flash
 in user mode
To: Kevin Wolf <kwolf@redhat.com>, Jamin Lin <jamin_lin@aspeedtech.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Hanna Reitz <hreitz@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20241022094110.1574011-1-jamin_lin@aspeedtech.com>
 <20241022094110.1574011-2-jamin_lin@aspeedtech.com>
 <ZxeDVTBwLZsOEDvE@redhat.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <ZxeDVTBwLZsOEDvE@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=pGrG=RS=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.169, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: hIimAh1K1LV8

>>   
>>   static const VMStateDescription vmstate_aspeed_smc = {
>>       .name = "aspeed.smc",
>> -    .version_id = 2,
>> +    .version_id = 3,
>>       .minimum_version_id = 2,
>>       .fields = (const VMStateField[]) {
>>           VMSTATE_UINT32_ARRAY(regs, AspeedSMCState, ASPEED_SMC_R_MAX),
>>           VMSTATE_UINT8(snoop_index, AspeedSMCState),
>>           VMSTATE_UINT8(snoop_dummies, AspeedSMCState),
>> +        VMSTATE_BOOL(unselect, AspeedSMCState),
>>           VMSTATE_END_OF_LIST()
>>       }
>>   };
> 
> I think this will break migration compatibility. In order to enable
> at least forward migration, it should be:
> 
>      VMSTATE_BOOL_V(unselect, AspeedSMCState, 3),

This is correct. I will fix the patch.

Some background,

The aspeed machines are fully emulated and the Aspeed SoC models are not
part of any virt* machines (yet). So migration support is a bit of a
theory. We have done our best to maintain some support, compatibility
not being a priority. IOW, it's not perfectly tuned as on virt machines.

Also, on ARM, migration of the CPU secure mode (I think this is the reason,
Peter please correct me !) is not supported and if migration is initiated
after Linux has started, the machine will hang.

However, if one day, an aspeed model becomes part of a virt machine, we
should be more careful. I would start by resetting all vmstate versions
to 1!

Thanks,

C.



> 
> For allowing backwards migration, too, we should consider making it a
> subsection instead that allows migration in the default case of an idle
> device.
> 
> Kevin
> 

