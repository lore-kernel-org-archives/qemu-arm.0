Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp558167njb;
        Wed, 10 Jul 2024 12:22:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU58CbbeZA2NV94qqyknrnuk6HnfNhD1027s1CGMYdkswJ/+PXQLYQ/ZAeBPaT3PFZVE1jr8d5ZBRhpqltuXyK+wmy8FyGV
X-Google-Smtp-Source: AGHT+IFkysuawdlntNtnueuXwihWj7wJfWFHXvWsXsv+zP3g/UDmE+pTg4bkVTzf4G737xPpiIaa
X-Received: by 2002:ac8:7e92:0:b0:447:f12f:38dd with SMTP id d75a77b69052e-447faacbf83mr69666061cf.59.1720639319899;
        Wed, 10 Jul 2024 12:21:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720639319; cv=none;
        d=google.com; s=arc-20160816;
        b=myOqYvz66BMrSIDtquLkN15zUKziUj3Xw6eliuRIP7WAXLRA1BxHbDU1OZCFpgZgAk
         sBLUzn4IRcEhxA0D9wqn3zCRMv7urucVZIPCwYWVcRPHEuSYrtrEWD7RYtOmqkzgPRhW
         Z3TE/vUEqLOtInDKM49CMCuQdRsm0zpQZsWF6fV3A89O9H41LqT2HypLeLBmh/yppfjQ
         TCEDQKoyIXqnaWNRaYO3KcD8ewdei5yk4ZaN/Y7ji32xg5woQ3+Ng0Ys+zfgZv+sHUpW
         SlSqOnZd/DSBNifmLbTX/+FSsDJvAHu6v5yVeN90KFWevudi4bJrLesTDsStR6ci0YS+
         Yr4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=uHTZJFCIujV74qEeCwTA4LODSqaxHo/ZwS7E9T12o8M=;
        fh=Y/vtxBUwx74sGQALfFIc0ra2Z4KKrqmp+Wm8rbOkX40=;
        b=n412hV5f5EbMp6I0IcNLbWEmu9IfxmOL+24hkjrZ9KyW4nkvQpMbH7j43vTJ3fr82r
         nWNW/N0abLb1/drydwxogE3P5+AUr6TGqT6LlfBceB4WYcB/DuHWPuSymj8nI/9S4mGV
         1LN2RTq/bPEcp/PXiocGWyHB3IPjr+wSKhKogUpou5OYqIvFKKj6uyyGol0oPGNC3p3A
         rNsJ6B22SCbjLR7yU/scrM0Nt+ArN4IL6hLNmZWbf4MhnidgacacxVITLzV70rFmWwFv
         N7obOEbV8CtFFfM9cUr1ZOA2M83X15FfSD0Rs9YwtP9B+IYrxkeWdJx/30DnrYuk01VN
         gvNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9bfee6fsi51455941cf.652.2024.07.10.12.21.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2024 12:21:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRcsY-0000JH-Nj; Wed, 10 Jul 2024 15:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=VgH8=OK=kaod.org=clg@ozlabs.org>)
 id 1sRcsV-0000HG-GP; Wed, 10 Jul 2024 15:21:23 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=VgH8=OK=kaod.org=clg@ozlabs.org>)
 id 1sRcsS-0000mI-NO; Wed, 10 Jul 2024 15:21:22 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WK74n6LGpz4wx5;
 Thu, 11 Jul 2024 05:21:13 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WK74J5Kvdz4wnx;
 Thu, 11 Jul 2024 05:20:48 +1000 (AEST)
Message-ID: <ad434021-8e16-4222-ad91-8026150bacb6@kaod.org>
Date: Wed, 10 Jul 2024 21:20:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v48 00/12] hw/sd/sdcard: Add eMMC support
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>, Luc Michel <luc.michel@amd.com>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>
References: <20240710141408.69275-1-philmd@linaro.org>
 <09a1a960-5a79-4aa9-a57f-1c1efd809901@kaod.org>
 <a8af41ee-f4e5-4720-9365-9a7493a5e84f@linaro.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <a8af41ee-f4e5-4720-9365-9a7493a5e84f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=VgH8=OK=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
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
X-TUID: rHQSfnCbirmQ

On 7/10/24 6:57 PM, Philippe Mathieu-Daudé wrote:
> On 10/7/24 17:35, Cédric Le Goater wrote:
>> On 7/10/24 4:13 PM, Philippe Mathieu-Daudé wrote:
>>> Tag to test Aspeed tree:
>>>    https://gitlab.com/philmd/qemu/-/tags/aspeed_emmc-v8
>>>
>>> Since v43:
>>> - Reordered and squashed commits (Cédric)
> 
> 
>>> Cédric Le Goater (2):
>>>    hw/sd/sdcard: Add emmc_cmd_SET_RELATIVE_ADDR handler (CMD3)
>>>    hw/sd/sdcard: Fix SET_BLOCK_COUNT command argument on eMMC (CMD23)
>>>
>>> Joel Stanley (1):
>>>    hw/sd/sdcard: Support boot area in emmc image
>>>
>>> Luc Michel (1):
>>>    hw/sd/sdcard: Implement eMMC sleep state (CMD5)
>>>
>>> Philippe Mathieu-Daudé (6):
>>>    hw/sd/sdcard: Basis for eMMC support
>>>    hw/sd/sdcard: Register generic command handlers
>>>    hw/sd/sdcard: Register unimplemented command handlers
>>>    hw/sd/sdcard: Add mmc_cmd_PROGRAM_CID handler (CMD26)
>>>    hw/sd/sdcard: Add eMMC 'boot-size' property
>>>    hw/sd/sdcard: Implement eMMC 'boot-mode'
>>>
>>> Sai Pavan Boddu (1):
>>>    hw/sd/sdcard: Add mmc SWITCH function support (CMD6)
>>>
>>> Vincent Palatin (1):
>>>    hw/sd/sdcard: Add emmc_cmd_SEND_EXT_CSD handler (CMD8)
>>>
>>>   include/hw/sd/sd.h |   3 +
>>>   hw/sd/sd.c         | 418 ++++++++++++++++++++++++++++++++++++++++++++-
>>>   hw/sd/trace-events |   3 +
>>>   3 files changed, 418 insertions(+), 6 deletions(-)
>>
>>
>> Shall we merge now ?
> 
> Are you OK with this patchset?
> 

Sure. let's move forward. I'll adapt the 6/7 patches for aspeed and
resend, possibly this week.


Thanks,

C.


