Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2034906ejs;
        Mon, 3 Jun 2024 00:10:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUiISDu3RELqG6cVozDOL12y10k4o9WMVdnMKLJs9UItY11ho1qDfoKgsFIs91vcUM9rXYYOZIiw4r++sb1sS6snArgp17J
X-Google-Smtp-Source: AGHT+IEdvj+8/r9dVmrC3lmBZqm2NTJvegvhsWxx67xR+Ok9Rp7zOKkvmRE0Qss/HzK35GZOtCwn
X-Received: by 2002:ac8:5d12:0:b0:43e:e6e:21d7 with SMTP id d75a77b69052e-43ff52851e2mr84409751cf.26.1717398599754;
        Mon, 03 Jun 2024 00:09:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717398599; cv=none;
        d=google.com; s=arc-20160816;
        b=iu6f5tlYQRrPkPKyZo6sdZNth4GRqV1fuhV4TEB/EwY3DKQP8bmdystRPwSoTWUCF2
         w5Hd8kevjpLhq6M+X5cD4Ug3o8edcikrZ6UNm8vEBaokotC4B6f2+6qWhaPSVefGrmhQ
         DXkGQW8zE3wDmUakYnvvJoyNERyBKdB61K1xcOXlnAiCSmSwcCIXJuiHjnW+j871xOCn
         piIXshsfvMbY7QsdP2E60MX8dhuvx2ve2E9/5gXSx0zTwmzss/xy9gnkNw+ubClbhtZ4
         rOAj6IHOB7A2R8lQP5HgoMxIJPHuXQJrGDjJcwZ4YvvRp9hW+ZHfefRBryTCDWbKUHL3
         fdYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=nv56nKfHcxAu+TXO5V0o2WCdTpYIT2vTzrX7efhS4Dg=;
        fh=wBNV7UiSATYaVKmE7Xme8a9dwVo8oS3HDnEeSM4b3WE=;
        b=E7gSfiPuFnyBOzx34iMiZDgz+4e2H1Rk1FW7tn/3F52ET9vkv5YHfA/hV7ahoVjfNw
         ZrFDTtMuEDYmq5aQ69KH4Yx64eHHkbBxFP9BtiE0k85VpabnIZfbfPkZgOka/LAM1gp3
         qoBltYOQYmo88phNdmJ6mXSsSENvHI2FSU5+amjlImV0Cn7pw2VF1UmlmEXwRXST0hRk
         htBnt0AZInsCfGxKrdvDpiAI1C6hGDNgIgz8fL6IhRahfj2leA1RIqreP6tLCUqouX3y
         YmgLBzNogOiKHm43WMfddZ3NLLsiJEJidI8+Q5+M+P3JL0QnO+zbDvg+S9BdlwaoXdyg
         rLKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43ff259c87bsi77094411cf.593.2024.06.03.00.09.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jun 2024 00:09:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sE1p2-0002N2-LI; Mon, 03 Jun 2024 03:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=jUUh=NF=kaod.org=clg@ozlabs.org>)
 id 1sE1p1-0002Mn-Vv; Mon, 03 Jun 2024 03:09:35 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=jUUh=NF=kaod.org=clg@ozlabs.org>)
 id 1sE1oz-0001tp-MQ; Mon, 03 Jun 2024 03:09:35 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Vt4bS2HDsz4x1d;
 Mon,  3 Jun 2024 17:09:24 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vt4bL6kx8z4wny;
 Mon,  3 Jun 2024 17:09:15 +1000 (AEST)
Message-ID: <d3d97491-fdf6-4fb1-a657-4eb00864ac9f@kaod.org>
Date: Mon, 3 Jun 2024 09:09:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/16] aspeed/intc: Add AST2700 support
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>,
 Yunlin Tang <yunlin.tang@aspeedtech.com>
References: <20240527080231.1576609-1-jamin_lin@aspeedtech.com>
 <20240527080231.1576609-12-jamin_lin@aspeedtech.com>
 <d013e728-246c-4bef-9a24-b0f0f48d172b@kaod.org>
 <SI2PR06MB5041E687500B2CBFE850B96CFCFF2@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <SI2PR06MB5041E687500B2CBFE850B96CFCFF2@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=jUUh=NF=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
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
X-TUID: HJ1XJNzi5hOu

>>> +static void aspeed_2700_intc_class_init(ObjectClass *klass, void
>>> +*data) {
>>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>>> +    AspeedINTCClass *aic = ASPEED_INTC_CLASS(klass);
>>> +
>>> +    dc->desc = "ASPEED 2700 INTC Controller";
>>> +    aic->num_lines = 32;
>>> +    aic->num_ints = 9;
>>
>> Use ASPEED_INTC_NR_INTS ?
>>
> I am considering to support INTC model for future BMC SOCs.
> For example, if the num_ints has been changed to "18" in the future BMC Socs, users only need to update ASPEED_INTC_NR_INTS and
> Create a aspeed_XXXX_intc_class_init to set its "aic->num_ints 18".
> That was why I set aic->num_ints 9 in aspeed_2700_intc_class_init.

OK. This is minor.


Thanks,

C.



