Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2427650ejb;
        Tue, 30 May 2023 13:33:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5upmu1MliQwihN1LqUcf0SJRedPSezpxgXww4O0NFJ45xhHHDQZrr1N0yhsqp7TMygiwQh
X-Received: by 2002:a05:620a:2415:b0:75b:23a1:833f with SMTP id d21-20020a05620a241500b0075b23a1833fmr4303934qkn.58.1685478823219;
        Tue, 30 May 2023 13:33:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685478823; cv=none;
        d=google.com; s=arc-20160816;
        b=Pf3Oyvxv66Ze2o5++ay6YhM7gx4LK4BEBKAq0NuGt/khebxjSgc4tK3Jv7uFpaDm/9
         RwqMKRX+3Jobcc7O7mg9W2m7DEkbBs4CSuTKTbaDomjRuXNuNYmlEy53NxaZOTqHRat9
         j50+BaNb6jSxsnZbiZAGd6tJL1FhEHkrafKb/ZrnIMo0Ma0SfLQHeHr/QzPG7sgVe6rs
         CLGcioFXx6zjs3ttj8w1OCiG87r0Pv49cgmtH/crDs+/yaSxWLO1k61IdZTpFrx0Ako8
         fQzHJ8t3JJAzculi5JXVWLOzMNcUFzZkMJBB+XMsLnrpbKNTfXn+mrY5EonlyH31oN98
         XRdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=28kMARIyfwZxuvAkzPZT14SvXNSySkYf1ablxOFuT0U=;
        b=IsccukgrBDOIdCsEl2lfcvkrtBotCA//CNnjR+iYsOoYuEu/usW+TDluV2gLmNrtbm
         OE3zT96nyKL2pVlH5sjW8XZ1Ypkl09lL/zK9B/fZMudfFwGRGfT/saHoct0+ii/C+K2T
         BwXLZDxVXpcfaHmMByiQzmekzurn8WUB7424t4wYUKp2SyghxPQ/qzOajwR38NEUIuF/
         0pNPVBYQLwdbXJqYBbnBImdSFoyOo+DWOjfJA/KhZMJi/Iz1bKfunOyJG9riyfC3Y8hw
         0f+qlPI7q+faoVDapnZaW7MehnnSKQpz/Tc2fAgMWVDinOQ/8OIFgJ4RG39NBCyi6ecR
         Haqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="avI/cfmJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l1-20020ae9f001000000b0075cf1f0d9aasi2488564qkg.42.2023.05.30.13.33.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 13:33:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="avI/cfmJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4624-0005bf-Mb; Tue, 30 May 2023 16:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4623-0005bJ-6j
 for qemu-arm@nongnu.org; Tue, 30 May 2023 16:33:27 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4621-00049F-LZ
 for qemu-arm@nongnu.org; Tue, 30 May 2023 16:33:26 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-30ae901a9ffso2843609f8f.2
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 13:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685478804; x=1688070804;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=28kMARIyfwZxuvAkzPZT14SvXNSySkYf1ablxOFuT0U=;
 b=avI/cfmJKGOieqnA+Lp32fp88ZnTtJ+PqbrGqeMvFwK1EHFKxJaCZtP4lcV6QBNOS2
 IlIxhHCb5tGhpQtXRtjvxw2PirkbKXXiHU+g34YzdIsxzlmjXTw9VLByN02G4OBekvFu
 VYjCQRKRv2kWZwDO9b9E1M9p5p/yM6+FnxMoHO27nTN3VuD2MSEYjeMxwQKFO7P2Iken
 IK3ygxV5b1p0/11PrrHnIKn0ySmQpMg/LAd6ehN795ftp6Rw47i5t+OMboANa6rwP7ZH
 4J62UKIs3WuMCe0haQ5XMz1HiIWXmkE24Aw8lBcHfMM+aApgbn4KlG5FrOAEiwsT64Hf
 kGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685478804; x=1688070804;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=28kMARIyfwZxuvAkzPZT14SvXNSySkYf1ablxOFuT0U=;
 b=a64e0CTWJ5XWHO4A3e7E4U0rXaBda3DAnphSlIxphNfugX7n4O3POC8vYBUNUUm4RT
 TBr4aueXgoA6lq2fM/1WMQ1UQQodrb2cxLER7SLW8urlFR49itV/NME2aCL5vICu7rNj
 ERLa+xMLcqBogTg8bnFeL9PwccMxur3gt1r0g8g91oNZNJ1pn8ZFaeYZt1wgyVZZF2O8
 JPVaE0AEE7rV6HRASQ3XkKpxVMcp8XLH3I2CUh4i8EqjCB0ns0GZC63J132t9bWCp6xZ
 omVClNztJoMI0/USbSIQWClD/O5cZRtzsS+aZ69CZDJ+Q+Wey/vSHiIv0v4ILpohEQYc
 r5dA==
X-Gm-Message-State: AC+VfDxZp7kbdxwP3yfGKsUObh+13q4/M1n2mUB8z4rBppgfSuHJyP3q
 FObWtf4bsyuUBAEGYSYAWr0bsQ==
X-Received: by 2002:a5d:590e:0:b0:30a:ebe2:5e4f with SMTP id
 v14-20020a5d590e000000b0030aebe25e4fmr3358919wrd.36.1685478803832; 
 Tue, 30 May 2023 13:33:23 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.180.1])
 by smtp.gmail.com with ESMTPSA id
 x15-20020adfdd8f000000b0030ae3a6be4asm4332223wrl.72.2023.05.30.13.33.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 13:33:23 -0700 (PDT)
Message-ID: <dc9883f1-0d36-d86b-caf0-a54f18861913@linaro.org>
Date: Tue, 30 May 2023 22:33:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 04/12] hw/ssi: Add an "addr" property to SSIPeripheral
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>
References: <20230508075859.3326566-1-clg@kaod.org>
 <20230508075859.3326566-5-clg@kaod.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230508075859.3326566-5-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: EFkzMzFXPuw3

On 8/5/23 09:58, Cédric Le Goater wrote:
> Boards will use this new property to identify the device CS line and
> wire the SPI controllers accordingly.
> 
> Cc: Alistair Francis <alistair@alistair23.me>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   include/hw/ssi/ssi.h | 3 +++
>   hw/ssi/ssi.c         | 7 +++++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
> index 6950f86810..ffd3a34ba4 100644
> --- a/include/hw/ssi/ssi.h
> +++ b/include/hw/ssi/ssi.h
> @@ -64,6 +64,9 @@ struct SSIPeripheral {
>   
>       /* Chip select state */
>       bool cs;
> +
> +    /* Chip select address/index */
> +    uint32_t addr;

uint8_t is probably enough.

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   };

