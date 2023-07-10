Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1073462eje;
        Mon, 10 Jul 2023 03:17:30 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEkeBkuwz9cfyR1rkLzakzr2nb9+q+SeTBoWiYjEFv0y4+y71FmuKqi/b3qgAO40xq+ERPy
X-Received: by 2002:a0c:e393:0:b0:632:30e:319 with SMTP id a19-20020a0ce393000000b00632030e0319mr11537859qvl.59.1688984249859;
        Mon, 10 Jul 2023 03:17:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688984249; cv=none;
        d=google.com; s=arc-20160816;
        b=ixZuxBb3nSPkIGNEqrLnKvDsXFKei7UYZvjJsg+8MQM6KlnTJYwbp+pD0NTHsKTHry
         TKAp7EyytgypCX2yy82rXhsXjwnl5qq60Spedh7FYzUszrz7EhCU53wjklyE7V4XJAC4
         xSDZ9mmIxrVIk2JI2l3ABOJDNu13Otn/7YqjNu4JFugBOc32113brm1NC9EjGn9U9unj
         UiuoJnGWrbcb8fg8gr9wV5G/6SAOFY0cJ95847PjuMvCtLkUKHryinY5xfnIj0ltdLnn
         7EJLywu1wvFxMdRq7y3AXVdwamh7peks06SGs4cng1/dzT0oasSY40EN7jqD0qOcl+bx
         LDjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=rGG7ZFKOrxvzabeWYoHjFp0+YYTEVGszXC9pHjkz7No=;
        fh=/tKP9pWupcqhlwTBQtAjuBQ7BZuGiprXtkQk63Jay8A=;
        b=Kh0RPMJ4zcS0i4sVlPLcb/ns7BtaluwXDkWTOHIda+9risms3VZuK4RFDC315cknBP
         pvZXOVmrR2Fpj+NqA6AsbK9IN+j6/y2aBIk3N1HAZI75lpnjVEcEC5av5WjtsZr4ZWVQ
         3/izrZ8eFLcqc4FaqT8HTezF6fREb4X8tQ4j8qhOEBe4/W0vMxukS5WDsLlYnIYDA7cJ
         hjXy7OY+f09nOY5ZEygeYxJdpL6p1EYRjILhWq+HbC1sXXe5RLQcxHp/8E7V/eZ46Pmo
         FwIYG/DekfAngXzdmHFjtkqP+mSYIW/0JeihLx1068OvyEHzSjKr2hD0h3Z9LWIMjQXV
         g7dA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aJ9VcNJW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11-20020a0cb38b000000b00635f8c656f8si5378027qve.134.2023.07.10.03.17.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jul 2023 03:17:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aJ9VcNJW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qInxL-0003St-QM; Mon, 10 Jul 2023 06:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qInxL-0003SN-3k
 for qemu-arm@nongnu.org; Mon, 10 Jul 2023 06:17:23 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qInxJ-0006hI-K8
 for qemu-arm@nongnu.org; Mon, 10 Jul 2023 06:17:22 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fbc12181b6so47968875e9.2
 for <qemu-arm@nongnu.org>; Mon, 10 Jul 2023 03:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688984240; x=1691576240;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rGG7ZFKOrxvzabeWYoHjFp0+YYTEVGszXC9pHjkz7No=;
 b=aJ9VcNJWLgRRyoXRPp+xT+6PHm5/T6os94ZjDnagVpgU/HAUviox3bg8Knq+EKe/eC
 FP5EIUAhmzFEbvmn5IK+9ATL4NtQqv7DHe0cLO4wrkujdXxdgaTgRtbCzrwhDCnDkIdR
 8cV/8RiOPh36UJem7dFKLxi5aTheFIk3K0UxICA8rsnkQi6GDVySogcqDD9zA0gGJPH+
 XkYBuVZTrMi/9I19KlhOI8w5wGERR8I1/4XJL0AacO/wbQjnCYkpbAdwPzBICKW+vvT2
 n1Wj9RWCdsijwSzeOfzyf5Y6KOV/UrranO04LTkFPfsztcrG4E86x1GLNjjQSVdqGbFf
 cfdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688984240; x=1691576240;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rGG7ZFKOrxvzabeWYoHjFp0+YYTEVGszXC9pHjkz7No=;
 b=DZXYZf2LysnqBuWAYZCxykAVvV8xmWhPCKfAJFdARbW/SWkmJHrc/Ko7rEQjTXSUcd
 uMJBAxD+vTUh7eIZnfnSgHJYS0FBxrNcUof1SrLQA7DMg3RhY25BX+y7VixKH/mI9XtL
 puqFJAomdD7+t81c5AmJfiWf23m6Q91E/Qc8C54BLsZGABgFcFXfG6cGtwsdo5l1NaRT
 0WIw0nzQKE6fS1L5wXXir2olKenFDKGbkkLGnG39pNWgfCPqN0MknAWcHPOMreU1bMZP
 SaWq90/V1cACqz5R3x4zwMvTG6PU59d4rgmquhjrmF8XYUkLUQb+UfKmsti5dTQ8PpvW
 UsOw==
X-Gm-Message-State: ABy/qLa2Go2QnaImxNuBbnBTf92OOnCK4b0uURzucH/MbKjGzvTAS7cn
 GRXICr+xzVNe9kqHQfg4JYYhuw==
X-Received: by 2002:a7b:ce87:0:b0:3fc:2d2:caa8 with SMTP id
 q7-20020a7bce87000000b003fc02d2caa8mr7907012wmj.29.1688984240014; 
 Mon, 10 Jul 2023 03:17:20 -0700 (PDT)
Received: from [192.168.229.175] (70.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.70]) by smtp.gmail.com with ESMTPSA id
 y15-20020a1c4b0f000000b003fbc9b9699dsm9822488wma.45.2023.07.10.03.17.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 03:17:19 -0700 (PDT)
Message-ID: <55c6b0b8-5223-fc16-4687-c2c0f99c3c19@linaro.org>
Date: Mon, 10 Jul 2023 12:17:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 1/1] hw/arm/sbsa-ref: set 'slots' property of xhci
Content-Language: en-US
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yuquan Wang <wangyuquan1236@phytium.com.cn>, rad@semihalf.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: quic_llindhol@quicinc.com, chenbaozi@phytium.com.cn
References: <20230710063750.473510-1-wangyuquan1236@phytium.com.cn>
 <20230710063750.473510-2-wangyuquan1236@phytium.com.cn>
 <6f7e7eb1-0837-58d4-1b6b-4f408150579e@linaro.org>
 <e3050d63-844e-31f7-511d-48d31279be44@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <e3050d63-844e-31f7-511d-48d31279be44@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: NmePP2vhwYxf

On 10/7/23 09:33, Marcin Juszkiewicz wrote:
> W dniu 10.07.2023 o 09:28, Richard Henderson pisze:
>>
>> hw/usb/hcd-xhci-nec.c:    DEFINE_PROP_UINT32("slots", XHCINecState, 
>> slots, XHCI_MAXSLOTS),
>> hw/usb/hcd-xhci-sysbus.c:    DEFINE_PROP_UINT32("slots", 
>> XHCISysbusState, xhci.numslots, XHCI_MAXSLOTS),
>>
>> The default is XCHI_MAXSLOTS, not 1.  So I can't see why you'd need this.
> 
> There are two systems using XHCI: i386/microvm and arm/sbsa. First
> one sets amount of slots already.
> 
> Without this patch Linux complains that there is only one port and
> refuses to connect second usb device:
> 
> xhci-hcd PNP0D10:00: Error while assigning device slot ID: No Slots 
> Available Error
> xhci-hcd PNP0D10:00: Max number of devices this xHCI host supports is 1.
> usb usb1-port2: couldn't allocate usb_device
> 
> So it looks like default being XHCI_MAXSLOTS is not applied somewhere.

Or something sets it to 1 elsewhere.

At a glance xhci_sysbus_class_init() doesn't call
device_class_set_parent_FOO().
