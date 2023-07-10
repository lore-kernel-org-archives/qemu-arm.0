Received: by 2002:a05:7022:629e:b0:68:46be:293d with SMTP id e30csp536604dle;
        Mon, 10 Jul 2023 00:30:01 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHIhRRJ/JRYEnHCIv2v9h9hNUen3LUiLxpi/pUTzBVGsSErSnoCumTAkuHs1QO0wzyZFe2E
X-Received: by 2002:a0c:f054:0:b0:635:b4e7:185d with SMTP id b20-20020a0cf054000000b00635b4e7185dmr10521595qvl.33.1688974200856;
        Mon, 10 Jul 2023 00:30:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688974200; cv=none;
        d=google.com; s=arc-20160816;
        b=vb789K6qU5zdaPd3oQWQS/3nvmYksG1y3srzUnhqeQhIoViJ24nOJ/tMS9i/r6RR7V
         pH1re8gYvTssQ8aHwZJv5Vz5aUyRGXbkUKflgQS/9RbigJNfrgYJXvcshCU7VkaSi+vA
         hg5vG92LgBlkbQPHqu10D9DYUJM+Z3R83yyHZXzyZNLlotKNqb9T7zw6Qmp9kgV24zKM
         BMN7EgYop7tBiXhKD51it6Oc1cpLfb0/3Leso4e4waXtgSfE2bO7fbuoSIJIcFLIET+x
         t6wvJEKsguIrNYPG7kDRsaqD5pRwpGhQwe8Cx/gZ+1Hh1EC0dXAg6QTEU1Xk7H/pOGR6
         jRcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=dmsLO5VsOWxV/K7czIhaIYpx/HLDgPQANrakXLKl9Os=;
        fh=V2u+xsRDh3AX19OAb9lXfJ+04o0qRMo2zTLhPB1t0Fw=;
        b=q1p7Bgo2lMrP34ZCXCncDYYZn7+HcHk66KkqKJFFfuNqWhgyXkmDWltmT2d7t7kFKX
         2kgdaAWKaeLfLBvzfGY3mvLPnxcrpMq9GihDMItdQT6briZ/WZY/lh53MdxSFBukzjeK
         BnqKYepJVsh0URN1Ml18nzI2rM583Y3y4biaXEiRBolKqrKbLijwYvnYE0PxzozOqycX
         BW+PdA3tDZbd4g/jSj4BbTOAYCV5e4CS6fYOy6EzY4KA3mo2yDyc5fTJFpVha66y7rk9
         MTmzcH1bcuTR1kLrJ7geIAWyl2oXnjD6r+y8PdPTx7ZUmEoJa8GAecN7ynX+3wl7EUb4
         eckg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eeM3IV2d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10-20020a0ca78a000000b0063011c2b210si5146453qva.212.2023.07.10.00.30.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jul 2023 00:30:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eeM3IV2d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qIlL1-0005LY-Ms; Mon, 10 Jul 2023 03:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qIlJr-0004E9-UC
 for qemu-arm@nongnu.org; Mon, 10 Jul 2023 03:28:30 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qIlJq-0005LG-6B
 for qemu-arm@nongnu.org; Mon, 10 Jul 2023 03:28:27 -0400
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b69f958ef3so64489601fa.1
 for <qemu-arm@nongnu.org>; Mon, 10 Jul 2023 00:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688974099; x=1691566099;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dmsLO5VsOWxV/K7czIhaIYpx/HLDgPQANrakXLKl9Os=;
 b=eeM3IV2d4boMzQ4lZcS0NEKBqoErCJgdMRSb+CufZF+zqoICm52g/yY2ecV15HBIkD
 VhfLKFRh2MimKfvcyu4KsWYbquHo83ONSY3Hz6GCxCMjRQzNdsiP/DEjyZ0NRO6Rejas
 ao1EL9ux1zLSMoX84fR+sM76agvhy5KOLEOqkks10bQPH4Qo2INYDWn34j55m4OKX08d
 6N5XZPoX+NUl0wcmwER2rBJ1+4MWOrGMpfoMoX7I8V82aPUtu2Uu22rYhrpzMbJ639yw
 XEBS39y7F/KxzyEYMuWNAsuyWJGuSyRxahiS7znC7+o4kTtVCu6izINWf8typQ2Uq4lp
 xCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688974099; x=1691566099;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dmsLO5VsOWxV/K7czIhaIYpx/HLDgPQANrakXLKl9Os=;
 b=Am9eo9YlDm9xSwcM5RSbB4/ToHpTKWvvN+DHCDtLTkvzaO3FlCNmMze3FiLK/dYOio
 PY1P3Q5uscnKwfQLpUT0huiwQupEFDOPw6W3wnamDgZO7ENH4jbS10Q7WKE+9+1oqEdn
 yOwFUL0EOKc94JQ8xCdWFqEXfPX4CtR1BCynygvva+UsIlKMi1uF9deIEZlqJDVWZ0cH
 YR6irt+CUDTMB+3emH/zyMD/PizDXelv4BK9RNXBsxxMWS+uC+zcHCFeZ9BZUJogEPUe
 dEZVXmSvuS7z7xJs/PFeZO80j8j5Zi2t4kS7Lv7HxKu1yY8Y0+hMXbLsrzynVxak+yOE
 uDaQ==
X-Gm-Message-State: ABy/qLZZyNDcuKYVR8GnT65dI+tsBmz6uGpx54v7ukwf3sziigtp4wFg
 LNGbBVzHLgYbSAYvel5+me3FTg==
X-Received: by 2002:a2e:9dcb:0:b0:2b4:6195:bb26 with SMTP id
 x11-20020a2e9dcb000000b002b46195bb26mr9283407ljj.25.1688974099096; 
 Mon, 10 Jul 2023 00:28:19 -0700 (PDT)
Received: from [192.168.8.133] ([148.252.133.210])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a7bc8cb000000b003fbb618f7adsm9441390wml.15.2023.07.10.00.28.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 00:28:18 -0700 (PDT)
Message-ID: <6f7e7eb1-0837-58d4-1b6b-4f408150579e@linaro.org>
Date: Mon, 10 Jul 2023 08:28:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/1] hw/arm/sbsa-ref: set 'slots' property of xhci
Content-Language: en-US
To: Yuquan Wang <wangyuquan1236@phytium.com.cn>, rad@semihalf.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 chenbaozi@phytium.com.cn
References: <20230710063750.473510-1-wangyuquan1236@phytium.com.cn>
 <20230710063750.473510-2-wangyuquan1236@phytium.com.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230710063750.473510-2-wangyuquan1236@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x22f.google.com
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
X-TUID: GG7KzvgCxBlY

On 7/10/23 07:37, Yuquan Wang wrote:
> This extends the slots of xhci to 64, since the default xhci_sysbus
> just supports one slot.
> 
> Signed-off-by: Wang Yuquan <wangyuquan1236@phytium.com.cn>
> Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
> ---
>   hw/arm/sbsa-ref.c | 1 +
>   1 file changed, 1 insertion(+)


hw/usb/hcd-xhci-nec.c:    DEFINE_PROP_UINT32("slots", XHCINecState, slots, XHCI_MAXSLOTS),
hw/usb/hcd-xhci-sysbus.c:    DEFINE_PROP_UINT32("slots", XHCISysbusState, xhci.numslots, 
XHCI_MAXSLOTS),

The default is XCHI_MAXSLOTS, not 1.  So I can't see why you'd need this.

r~

> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 64e1cbce17..bc89eb4806 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -611,6 +611,7 @@ static void create_xhci(const SBSAMachineState *sms)
>       hwaddr base = sbsa_ref_memmap[SBSA_XHCI].base;
>       int irq = sbsa_ref_irqmap[SBSA_XHCI];
>       DeviceState *dev = qdev_new(TYPE_XHCI_SYSBUS);
> +    qdev_prop_set_uint32(dev, "slots", XHCI_MAXSLOTS);
>   
>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>       sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);

