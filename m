Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp833548dye;
        Fri, 27 Jun 2025 04:32:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUtEtotosVpMB+0SmXsiAxMUmAyLXNWDPeHigoSrSNt6yIMx8shny50qEnHA7ATjLINIaKcMbbP5fJqnQ==@linaro.org
X-Google-Smtp-Source: AGHT+IElss6pPwYQA5FpVzn8x7NTfuncWGKCEc30SK1nPlsOltG1Np5bybSo3C2kNTrA02Bh4sFE
X-Received: by 2002:ad4:5ba2:0:b0:6fb:43d:65b7 with SMTP id 6a1803df08f44-7001413539amr51135216d6.36.1751023972196;
        Fri, 27 Jun 2025 04:32:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751023972; cv=none;
        d=google.com; s=arc-20240605;
        b=EbUoKAHv9Yjm1w0Spcxb7WGTDPeQnDmzgRI4O9eArWx/okI/enKbScLNBBPLOsUNIH
         U+XDs/DRyq/Wn7V8OCE8YYSSUnMkzApcAsqpTI1DZSqKLrF3hKoWTdqoxJZufObu0UWn
         M4+vNPEwJybVdnci5TDshOtXpM527bR0km7kcoaN7dmcwv9owaZQTonFX4wZOUtJhS93
         a4bmyhSZArqmAZhbZWo3pDSFp984GvFCTrmBt2EENVSsqHd5J4xBJCAX8wz40tQJRuLt
         yIKdWAZWTO7LJOa91M1TUD6jm0XYM+IvmjGoWMHamAqzdFc3Fdg3khECW5vmV6Oeg5XB
         b9aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=fN8B64CHHGRr2kCk9MAnbXFLJojoHBCb0Y3lD0TW66s=;
        fh=7AHVBTYdyaSSHmU/dd0viTs+z20B+jp4dKnpQRCLTic=;
        b=gVKigBHU5MfbDp2puxHSfjlYAILFvn/hf3QXg6T7TqwF1b7dR8jP4Cc+VB1jAqb6+3
         YPh8fLNMDoLo+/TB+o1MNUxidItQrNfewwxCRjvzDpb0H5jceduqimAElw+bg2LVxGoQ
         3vz+X4s6e9HE+e/YIqi24IvHJXsjUVZHU9sxBQ2n8poU29+/Cfr0xkTymj075EznXvy0
         VbY3bHVUFjL+ijly5ltCMxGS8DtmgDbyzx8mt4nmnQzNonVKtddBJH/gR3yzKkMXPStc
         qcW4FUmqp4z5Vm0657Zajsmae0/i0XmZZIFr6K84ivG1hudEgbX+XY0HMkzs0VDrO+8B
         HZdw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77387056si41387726d6.423.2025.06.27.04.32.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jun 2025 04:32:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uV7Jv-00081j-JG; Fri, 27 Jun 2025 07:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5m2v=ZK=kaod.org=clg@ozlabs.org>)
 id 1uV7Jk-0007u8-9Z; Fri, 27 Jun 2025 07:32:30 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5m2v=ZK=kaod.org=clg@ozlabs.org>)
 id 1uV7Jg-0000ZU-Om; Fri, 27 Jun 2025 07:32:28 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4bTD1F2yCxz4x8R;
 Fri, 27 Jun 2025 21:32:17 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bTD1B0Qf8z4x7s;
 Fri, 27 Jun 2025 21:32:13 +1000 (AEST)
Message-ID: <65a22a3c-1227-47b7-a001-dd98dac1191c@kaod.org>
Date: Fri, 27 Jun 2025 13:32:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] hw/misc/aspeed_scu: Handle AST2600 protection key
 registers correctly
To: Tan Siewert <tan@siewert.io>, Jamin Lin <jamin_lin@aspeedtech.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
References: <20250619085329.42125-1-tan@siewert.io>
 <c58bf387-a484-4cc3-a4b6-76cb955c6b0e@kaod.org>
 <SI2PR06MB5041A8B6109499DDAAF298E5FC7CA@SI2PR06MB5041.apcprd06.prod.outlook.com>
 <8d21f5e6-9188-4abf-8f97-5da3b585a892@siewert.io>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <8d21f5e6-9188-4abf-8f97-5da3b585a892@siewert.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=5m2v=ZK=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: g4RZtC2ofS1v

On 6/27/25 12:16, Tan Siewert wrote:
> On 20.06.25 03:23, Jamin Lin wrote:
>>
>>> Subject: Re: [PATCH v4] hw/misc/aspeed_scu: Handle AST2600 protection key
>>> registers correctly
>>>
>>> Jamin,
>>>
>>> On 6/19/25 10:53, Tan Siewert wrote:
>>>> The AST2600 SCU has two protection key registers (0x00 and 0x10) that
>>>> both need to be unlocked. (Un-)locking 0x00 modifies both protection
>>>> key registers, while modifying 0x10 only modifies itself.
>>>>
>>>> This commit updates the SCU write logic to reject writes unless both
>>>> protection key registers are unlocked, matching the behaviour of real
>>>> hardware.
>>>>
>>>> Signed-off-by: Tan Siewert <tan@siewert.io>
>>>
>>> Could you please resend your R-b ?
>>>
>>> Thanks,
>>>
>>> C.
>>>
>>>
>>
>> Reviewed-by: Jamin Lin <jamin_lin@aspeedtech.com>
>>
>> Thanks-Jamin
> 
> Cédric,
> 
> Do you think this patch could be applied to aspeed-next?

I did a week ago.

https://github.com/legoater/qemu/commit/7b27524a27a3e835b2e6b725e1778950015cbb63

Thanks,

C.


