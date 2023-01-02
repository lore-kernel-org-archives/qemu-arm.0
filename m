Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp6598923ejb;
        Mon, 2 Jan 2023 02:06:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu4bMolbc3Su3FpiIrAMmr0xIuf5tT1VwSovL7BNjj8HdBJHPO8oG9L1OyI4W0rH/6oaIx6
X-Received: by 2002:a05:622a:1b1e:b0:3a9:928c:4c78 with SMTP id bb30-20020a05622a1b1e00b003a9928c4c78mr54138811qtb.29.1672653978847;
        Mon, 02 Jan 2023 02:06:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672653978; cv=none;
        d=google.com; s=arc-20160816;
        b=JV/0h3mMF5W/d9u4INzmehkxuovYvPXpj/82XLTkzLD592vwdovvv7ygXzpJgY/g7g
         6bu14TCvUjrIKL2m/7ejOxMdsoUmwoDVbCiI3IAYH6Aa6P8OFA4mzRbuKWCR2lJVksoF
         W6IdrwmyFskBb9e72Pfe8Oy4pDTK9r8qDPIuwMYm4RLbqvEFRjuf4Zt14Oq7d9UG+8sw
         n+mbYucXsEfBchszAAVIWgvcBjEjVXuGcLVKpI2JJEhOnaVkDPqAuiWKsV/TYk1ZCvY2
         hQ/FfuB/Y5bWQ4KR3s7EXrOguR4JUiHKdWvFrHW9w4f6YpMcIW8w6U+k82wmPQDkPfYC
         icmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=eTuX/eLsGOfMUJy6VEIVmgDOtSGqbNNLV32PjZJDIe0=;
        b=qYzxwqzRCH5L6qX8v/PE2JLmVv1+xcrE9b1yKnzCtu4BpHiu+2B5Q3VqqEvyiSuYth
         txLexJGCVQkjPxCA+cymjOwJApNIyZJNJeFNiMujcseRAI/rnDfU2pP2HyuNAZl81NHt
         073URpjgwpmsyGKymPjFB7yG9BcWv+bWfLZfKYmlpL5KOsleG5dWW+Z0RQhXRXr5FM12
         1K1lxGKw8rspG50BAqYVXgyNGrpZgF/hPlmat+ZlIt29/b68bk0e4KZl2tH+O+PiKbRi
         arazITY7WSOykAjGN7O3UeRLXnTg5nKYM7gBpIWs+s77l1coQeJyKxHgvsZgB3Vw/LvP
         C8dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ubSMTuH2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bm14-20020a05620a198e00b006e366c7db36si15183879qkb.427.2023.01.02.02.06.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Jan 2023 02:06:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ubSMTuH2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCHhr-0003s9-J3; Mon, 02 Jan 2023 05:06:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pCHhp-0003rC-1P
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 05:06:09 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pCHhX-0004B2-L6
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 05:05:53 -0500
Received: by mail-wr1-x431.google.com with SMTP id j17so20521538wrr.7
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 02:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eTuX/eLsGOfMUJy6VEIVmgDOtSGqbNNLV32PjZJDIe0=;
 b=ubSMTuH2YMbNRHukJkDX789b4pxQ+ORzMrNxz/AMoiMXwlCBqcyg0c4mRfx/VkPXD7
 IwysXe4XlLPSVmXoOcpc1qqLn7kZ6gmhfqP5H8AlxWyj8BhWh2VIPCx9CXGhf/KfBSwv
 3egXjV9vmwhTA1YFUUJPVEo5VVkwlshiBymXSscRvX6YKEEij06NAXNWjgP4M2E9Z7+o
 Ym4AUhV4+Rupc5JH5byFgcBiM/OyKsVNqrIDIaANwlQFp579CcRTVg83qUWYz197bbBZ
 VGc/OkOoMIMnXdXRIJUULndlkV4d0aXOQXML18boUuNxJSceZw4hAYItV3FMmgLarV0+
 vMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eTuX/eLsGOfMUJy6VEIVmgDOtSGqbNNLV32PjZJDIe0=;
 b=m2AnC2Gzn8cDmDCExW+lWVCHM6iafoIslKyXFNZ2NvslatO7KyDPKSaKY7A/irFe3J
 X1mc1ckJJQO2k27X2OHu0rDjRBbXdvDSQUjfJtX1oZaG7euw6pSbIEaj+sN5BNT0s12w
 +WdZn9SsP8wOO6VzC6BFfn14oD7EdnlNws7V2upvx0mtmT/UsIJHoQJ1t7+cwG4WVycj
 6Mq77Bwi08fOj7O5blFppJRbghD8KpVpiYjGrPsNoC3c35n3Sibbm4am0bHZCQkcvAEK
 0B19gmjzwmJO3Jd33yRck6leQVBVaFliX21b9iDErwAh2cjgCmuWZFYsf0cpviirls1X
 xpHg==
X-Gm-Message-State: AFqh2kqily9vLpP7krx7PkGLO7eQ0zpDGgwaTqXAPCQpDGV6bkvkuThz
 AzkJTd4pYH69IpEfKK/ot77M2g==
X-Received: by 2002:adf:e19d:0:b0:28f:29b3:1a7f with SMTP id
 az29-20020adfe19d000000b0028f29b31a7fmr7605175wrb.36.1672653949706; 
 Mon, 02 Jan 2023 02:05:49 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q1-20020adffec1000000b00281b594c725sm18596513wrs.38.2023.01.02.02.05.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jan 2023 02:05:49 -0800 (PST)
Message-ID: <ab5533bc-c140-f975-95c3-974551306956@linaro.org>
Date: Mon, 2 Jan 2023 11:05:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 02/11] hw/watchdog/wdt_aspeed: Extend MMIO range to
 cover more registers
To: "Dong, Eddie" <eddie.dong@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Peter Delevoryas <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>,
 Peter Delevoryas <pdel@meta.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>
References: <20221230113504.37032-1-philmd@linaro.org>
 <20221230113504.37032-3-philmd@linaro.org>
 <BL0PR11MB30427F00C5A2058197E9B6488AF19@BL0PR11MB3042.namprd11.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <BL0PR11MB30427F00C5A2058197E9B6488AF19@BL0PR11MB3042.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.802,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: zqmIkQ+pVBET

On 31/12/22 23:52, Dong, Eddie wrote:

>>    #define WDT_RELOAD_VAL_REG          0x0004
>>    #define WDT_RESTART_REG             0x0008
>>    #define WDT_CTRL_REG                0x000C
>>    #define WDT_TIMEOUT_STATUS_REG      0x0010
>>    #define WDT_TIMEOUT_STATUS_CLR_REG  0x0014
>>    #define WDT_RESET_MASK1_REG         0x001C
>>    #define WDT_RESET_MASK2_REG         0x0020
>>    #define WDT_SW_RESET_MASK1_REG      0x0028   <------
>>    #define WDT_SW_RESET_MASK2_REG      0x002C
>>    #define WDT_SW_RESET_CTRL_REG       0x0024
>>
>> Currently QEMU only cover a MMIO region of size 0x20:
>>
>>    #define ASPEED_WDT_REGS_MAX        (0x20 / 4)
>>
>> Change to map the whole 'iosize' which might be bigger, covering the other
> 
> The root cause is that ASPEED_WDT_REGS_MAX is too small, right?
> Probably the Qemu is emulating an old version of the hardware.
> 
> Given the meaning of ASPEED_WDT_REGS_MAX, it should be larger than iosize, not?
> Probably ASPEED_WDT_REGS_MAX should be per device type (aspeed_2400/2500),
> while iosize is for all devices, and its initial value comes from the per device type REGS_MAX.

You are correct. I don't have access to the specifications neither,
but I suspect you are right, the current watchdog is modelling an
older version that what the AST1030 has.

I started these WDT patches to understand the unimplemented accesses
done by Zephyr, but eventually they resulted irrelevant to the fixes
(see following patches) so I'll simply drop them.

Thanks,

Phil.
