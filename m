Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp1471672njb;
        Fri, 5 Jul 2024 14:52:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXYTD7EHBSJB/wQoI681CK1/E4AxaFG1u0M5HDKq8W1tWzvq7FeaMUIAv0iyH8gnhF7cDIu1B2GD2+kgMfuXl6n+msxg5GE
X-Google-Smtp-Source: AGHT+IEuFNLEsVzSgmiO2lXaWRmpo8Wo/9JlzQSnTc207mYl8utzhF5Fr5DLAWD0BxUy7gcMhI4n
X-Received: by 2002:ac8:5a0a:0:b0:444:fa36:3959 with SMTP id d75a77b69052e-447cbf5e498mr84149311cf.41.1720216347490;
        Fri, 05 Jul 2024 14:52:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720216347; cv=none;
        d=google.com; s=arc-20160816;
        b=G5abfCADoFGOHpEN6YmbUEhRYsFyUM9Al3oFUJECoIpwuQjFyZ+73+TbWyTt6efAVe
         9635oMT4W2a5O3aL10VjdRFoBBSm34J1RTeSuR/XOsohLSYgevs/Jic+KWDJZTu58oF8
         sVEvjUiL4lxLFaUAvaAl09nNYfloWNGb4grUHMrTXg5fJzKYxLjl8lkCv4AX4HCfvBHq
         KFetwk0HqrGSW2N0j2ICaXr4ejepYnjYw5x6pQ42Zd/l/vD2kviZA+TedTX0kA1aj7xk
         SclkgREhyNvYaUUpXMgI/8BSlxsks3pa1EdxcBqvy9s3eRwzsRx6sGZ8JmGcmGG+HRoM
         lyaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Famnk2FKpTDwuEsdryBV8iJ8lwuFDU9utG5CZue62t4=;
        fh=KlluoIJ0yFECQpJLkP3igQEVnQ34QCC9l2hurcc0aYY=;
        b=bNXFKf2EKuQErKIk33ekJomFviWqKxQAyA+ngKUN7mH51+g4QnFS+Cu+V3TL9qVpAM
         kwnXaiAD8XaNJpQVxCT69azca7gCQBW32vZQPHQmTbu1c6HEqps4dsvAbO6YOcumAQP6
         e1LFcnk3Yhk62Qub/QIzNufW537tLFgc4+Yr2nIJMqVePTmuhtiEYWM04dwEVSW4b/cV
         LAaP1J9c4NLMFBWsX8q02r2sfyRA7dnU33GgQ/JlLmrit7AZoZCLwR/n/9euOJ2SZlKI
         J2wgiDUJxKMFjmzY8QsWH0IAHd/JGNb3GGtsgMlL98d/Q3jQRHESeq2d+8DSV4MdyiRb
         d6rg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BzUS34m+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447dd20d4cesi10028851cf.259.2024.07.05.14.52.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jul 2024 14:52:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BzUS34m+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPqqi-0000SA-97; Fri, 05 Jul 2024 17:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sPqqh-0000RM-0J
 for qemu-arm@nongnu.org; Fri, 05 Jul 2024 17:52:11 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sPqqe-000326-5i
 for qemu-arm@nongnu.org; Fri, 05 Jul 2024 17:52:10 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-367940c57ddso1239490f8f.3
 for <qemu-arm@nongnu.org>; Fri, 05 Jul 2024 14:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720216326; x=1720821126; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Famnk2FKpTDwuEsdryBV8iJ8lwuFDU9utG5CZue62t4=;
 b=BzUS34m+NdqmHvcTdkyfGD+sBybaSyVDdJ7E5UOxoUDpOdHST3BiSXxpRY1TsHRBDG
 isf3FsfXLORLaTkrpeOBWvydra5KrXXRDqyKgp6qVBJA/HST8sB98GMcsay9hZ3lJREN
 C7I8F2mwCZZNJDlfz0+HPt3oGcjmgEtvOf7qqF4eSqa5QAhgDpbkygX23ih/s4dLFlA2
 D/Pb53Pabyqqv3Jm6K1qY2CRmfQSWgg6nZw/SPKqlglo+DR/o/n1Yzm14tVIpX0gPS0v
 +1gTWutjA61GDbtsiURi4olG+o5r6zdUOertbC0fUI3vB1m8pblEPBTv2rPUVNV3Upf+
 VIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720216326; x=1720821126;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Famnk2FKpTDwuEsdryBV8iJ8lwuFDU9utG5CZue62t4=;
 b=WNWBpTXngtAkG7CyqXlho/J2AbbrWXDIAZAw9SW2RZAer5yJLiyWwhgBVkC8XcDYih
 CIAuySQ5rhSeqq9c46oXNg3vjBZ9sAp34dzQduktXdx3/xodDAQSLE7a3fptFXVenpuk
 /wLX2tOYqpS9mQkEBO/mKT82wJ6SRSj4YRlQMR+QFF1wKk3c++0GOHj68Kgkty2m8G/e
 FNFCWk0EQ0AQCG7/7jtR8/6/opndRHT90Yz4MYi2F4S7A+wPXMkslajNoI0Vw6lPZENa
 kB2HHA66yb6JJgXZ7JUu11z+yYMpbtiy8Wr4pk5tNAuAghG9xPXWu1wJ8tkjGcphbaiO
 Ii/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8n879U3CDMGVW7TaE/LmgBm6hWCrYZJasc2ijJR2wkZeqK5zS9CiLUXinDmJDu91MJQzWZxzgHaWTKiFik23WxJpW
X-Gm-Message-State: AOJu0Yy5AmXDp+f1sePJDWKfhEx3sOBYSwvm8fuQhG2h58WBUcyF0qJZ
 1cB/LiuTy534GH57kNT1MarXjlHJfVl9OGJTAepQ8x7p2+yXnHb0hUq+t8A/RAU=
X-Received: by 2002:a5d:420e:0:b0:366:ec2c:8646 with SMTP id
 ffacd0b85a97d-3679dd63b25mr3802612f8f.43.1720216326406; 
 Fri, 05 Jul 2024 14:52:06 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.163.129])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3679ac6d60dsm5250708f8f.39.2024.07.05.14.52.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jul 2024 14:52:05 -0700 (PDT)
Message-ID: <186b3369-3bd6-41ff-9288-5be8d295706b@linaro.org>
Date: Fri, 5 Jul 2024 23:52:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] qtest/npcm7xx_sdhci: Use card-provided address (RCA)
To: qemu-devel@nongnu.org
Cc: Tyrone Ting <kfting@nuvoton.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hao Wu <wuhaotsh@google.com>, Thomas Huth <thuth@redhat.com>,
 Shengtan Mao <stmao@google.com>, Chris Rauer <crauer@google.com>,
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Laurent Vivier <lvivier@redhat.com>, Luc Michel <luc.michel@amd.com>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Patrick Venture <venture@google.com>
References: <20240702140842.54242-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240702140842.54242-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: UzbIuxPd9X92

On 2/7/24 16:08, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (4):
>    hw/sd/npcm7xx_sdhci: Use TYPE_SYSBUS_SDHCI definition
>    hw/sd/sdhci: Log non-sequencial access as GUEST_ERROR
>    tests/qtest/npcm7xx_sdhci: Access the card using its published address
>    hw/sd/sdcard: Generate random RCA value

Series queued, thanks.

