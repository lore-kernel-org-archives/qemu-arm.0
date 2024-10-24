Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp116930njx;
        Wed, 23 Oct 2024 23:13:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXH715QsPPfMcPecRH9D90m5WYL0G5z+AtODeBN/RSu+oHQEvOArk0VG68U+LIbAtTqGiiswxpwaQL/Vg==@linaro.org
X-Google-Smtp-Source: AGHT+IGz/Cc8bmK1jDiDaFAYvXZDVluWR0yZpxHcdJ/0wJjTcS3gRNWdyByfSDmGup9IkDsDS106
X-Received: by 2002:a05:622a:191a:b0:460:eb65:be26 with SMTP id d75a77b69052e-46114727e10mr65378981cf.48.1729750405865;
        Wed, 23 Oct 2024 23:13:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729750405; cv=none;
        d=google.com; s=arc-20240605;
        b=AfQCVnVlFyWofcL9hkFkh+5s4vmpQtfeck9ffE7basqrG9UHm4+ZeY3Oi0d65ZIdNF
         a3OxSwbi5OW/Y90LNNDief6vlM6iwazmQ4MdmJ03d2K0OcpslReXIosaT2B1EqBOSaR/
         WkkaUes8wm3Hksyuw9aV5P0OEJHtpWRym6FvuJyTPxc/PD5uS1X8S6HBvXeytcFeoOa2
         O0htadnq6pYM7XTdyfILasyp1u8n+7/UbMu4Wto/57YPz6f9a0JbpU1neAtiO90vcllB
         By1qhISooLR4YkHcLGklIIjWqs9/UEIknbUwzyiPGTH7fBhEdcwQuhFq0vDwkoFqWfam
         jPXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=to3e+PXIQXL9wJQfNWZ73LJGNbjUe49yDY2L1mJkmzk=;
        fh=+GqoWB/UiE7QGbBUivuJ2Ndypv953u6WRDmjLhaX870=;
        b=d8zYl7mwPH2MfVHRJCyIhRizUEaLOupAcz+kgLMcf9XwexwDHMsU5vsVcabE6LCmaV
         iaTD23ikUcVG8gp5d5pRzxn+CSO6KJ9vgwFSdffrLgIZ4rpfjhi3NVm4OA/dQBEJMQNl
         9bkUhxA7nrpVED7G4xJ1TuUeG+MC5Fm466RJqyI0menSEzDBxc/bohGK2ThXMn8XfcQI
         tBEs285Ir5CnM4l9VCeDmqGjHEMUbo8rQLIam2qI6dPg1Nb8+tsGnZ0Y5ZYSib4k+0sG
         nGDecX9B+BJOYwMl2tyeJub6E0Ev+wHGkSV/GbJKOxebXP9u3SQSTkDNmIQ8JknhQuil
         /WvA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460d3ce658fsi103713851cf.357.2024.10.23.23.13.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2024 23:13:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t3r5z-00059d-Pq; Thu, 24 Oct 2024 02:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=9NnO=RU=kaod.org=clg@ozlabs.org>)
 id 1t3r5y-00058r-B3; Thu, 24 Oct 2024 02:13:18 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=9NnO=RU=kaod.org=clg@ozlabs.org>)
 id 1t3r5t-0000TG-Tl; Thu, 24 Oct 2024 02:13:15 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XYwZX2vmtz4wb1;
 Thu, 24 Oct 2024 17:13:08 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XYwZQ6d9Mz4w2F;
 Thu, 24 Oct 2024 17:13:02 +1100 (AEDT)
Message-ID: <2213d24e-b77c-43ed-87be-a00c70f001e0@kaod.org>
Date: Thu, 24 Oct 2024 08:13:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/18] aspeed/smc: Fix write incorrect data into flash
 in user mode
To: Jamin Lin <jamin_lin@aspeedtech.com>, Kevin Wolf <kwolf@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Hanna Reitz <hreitz@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Troy Lee <troy_lee@aspeedtech.com>, Yunlin Tang <yunlin.tang@aspeedtech.com>
References: <20241022094110.1574011-1-jamin_lin@aspeedtech.com>
 <20241022094110.1574011-2-jamin_lin@aspeedtech.com>
 <ZxeDVTBwLZsOEDvE@redhat.com> <b682dc55-f5e8-4fec-82f7-333dbaba240e@kaod.org>
 <SI2PR06MB50417FE5ACE6C21AFA0E31D8FC4D2@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <SI2PR06MB50417FE5ACE6C21AFA0E31D8FC4D2@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=9NnO=RU=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.17, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: SR1Cnmn1ZKpE

On 10/23/24 03:41, Jamin Lin wrote:
> Hi Cedric,
> 
>> Subject: Re: [PATCH v2 01/18] aspeed/smc: Fix write incorrect data into flash in
>> user mode
>>
>>>>
>>>>    static const VMStateDescription vmstate_aspeed_smc = {
>>>>        .name = "aspeed.smc",
>>>> -    .version_id = 2,
>>>> +    .version_id = 3,
>>>>        .minimum_version_id = 2,
>>>>        .fields = (const VMStateField[]) {
>>>>            VMSTATE_UINT32_ARRAY(regs, AspeedSMCState,
>> ASPEED_SMC_R_MAX),
>>>>            VMSTATE_UINT8(snoop_index, AspeedSMCState),
>>>>            VMSTATE_UINT8(snoop_dummies, AspeedSMCState),
>>>> +        VMSTATE_BOOL(unselect, AspeedSMCState),
>>>>            VMSTATE_END_OF_LIST()
>>>>        }
>>>>    };
>>>
>>> I think this will break migration compatibility. In order to enable at
>>> least forward migration, it should be:
>>>
>>>       VMSTATE_BOOL_V(unselect, AspeedSMCState, 3),
>>
>> This is correct. I will fix the patch.
>>
> If I need to re-send v3 patch, I will fix it.

I took care of it. No need to resend.

Thanks

C.


