Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1768594ejc;
        Mon, 30 Oct 2023 03:39:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvh6Uua9wGoh4QopNAdejDeSHRkjRnu/jkrVNwpfFGXn6ExJE7BTPhsB7t8GhAaG0dL01f
X-Received: by 2002:a05:620a:4305:b0:777:74dd:621d with SMTP id u5-20020a05620a430500b0077774dd621dmr9934551qko.15.1698662397108;
        Mon, 30 Oct 2023 03:39:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698662397; cv=none;
        d=google.com; s=arc-20160816;
        b=ea4w/dj8oS/ovIYFi3CeaD0HB622DLxEP2fDAWX6uql7ucW2465FgMle48ai+nxPVh
         0T4eHB5dqg7DkBn/0gjgrZBn+LgyAFl6uIUasVYeuNnOVj/93T7ZoFjiDr0gY08n1a37
         y0G1cSuUsubRGy/9Gt4hT7jXFLvS7/6Z/OkPKrnphY+gWW1VJl/iCmA0ieJSX0Be1JXF
         Dtprxp5hnTgpAquwS2dzpjLSyJRLUxCrIJVUpin2pSDsEEkgJA7SKZ3zmwofBu0+Hie5
         /43wh5fUzpT2BIj8PFV6nMoKIslsaww5uDSCK29ib2jqc8hVMypDZwkiPdFHwZSdq+vb
         qZwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=e+TwgWDLl4AnJbMcoL85lD0Wr2asiN+tI27UKxrQI5c=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=ckFcvhoql24ot5iBf7XgF66sdwk5Cx1XUY0g5ltvvLHuZyn8a/K0STmHaXFj+JOxn5
         qaPnuwSmkfAdIZtuN3ygNLskPymtvvuMqzKPfsFxFCUQiMTZBYTZlQB0Av8YEdcHS64r
         7q/tyXSLKI5oOrypP8WIzBmjFvqS3EJfrSPrjGV2Tm7biVs3kx/LZNw6TGue85BvGlG0
         T/R0lkupu52H8PX0MJgNB+/LoEhgWN/jAoj5JAA8K/kR0tqLDXaZAskuCMkJVjTw6Hhc
         musutnyx+hvt6+7WLFAKcIozVHurRXPvBxQPm/tGgsYVdNwlcw9zQkxM/OCSRRuh9Yba
         7UuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SK6wkuUk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q10-20020a05620a0d8a00b00778b2ed7e06si5420911qkl.84.2023.10.30.03.39.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 03:39:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SK6wkuUk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxPgJ-0007uD-8d; Mon, 30 Oct 2023 06:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxPgH-0007tD-BA
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 06:39:37 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxPgF-0000tE-Lu
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 06:39:37 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-32d81864e3fso2709789f8f.2
 for <qemu-arm@nongnu.org>; Mon, 30 Oct 2023 03:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698662372; x=1699267172; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e+TwgWDLl4AnJbMcoL85lD0Wr2asiN+tI27UKxrQI5c=;
 b=SK6wkuUkqYo9ox6MKXU5j9rEv5UbIZUOTpjAZ2HFOZOTl/r1eW8ODY18b3XBP4KO+d
 Y3VLsZEElerJg6dOIK2twik1+j2nL75L22SW+zFo2QANRqmCm5r7Gg46FpHlYXA1ixhX
 F3yFon5eulGR8N/goOlrdXkplGRkPCACQ0kaXi0bsXAjL8AvR5KQEvRJu4s+u/9C4Pbu
 5L5kM49Mhe0q5y6AqKZ0ok2DgNQEikbCJKgupn5o88GI8nJ5+fyKF/iXnrfpBR+HZKin
 Utvsa39s+yr93thYYBYCsVyxsgsxIrFCGL67IosPRpgFF1yujgIVGvjNitQdM/L5lEdh
 eWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698662372; x=1699267172;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e+TwgWDLl4AnJbMcoL85lD0Wr2asiN+tI27UKxrQI5c=;
 b=BuwAnRVA/yWsmQPEpiLe6mWm3OfragT2f2Orcm48v7+XJ15w09GuqiDnxbFBi3Uq8c
 PcWtkyW/PY2U5/Oda3lcOij8I7KwXSrddv5Ba08All8pVSN2Ml92qR3Kb4Yn0zKG0EyZ
 11dRrBKfsvFdVo/wMDdJbTvWU8J1qe0kGyT3eJjPI+bFkK8+diYv8sHpd7c8QUNJwfiQ
 t28JBZaY9VdDwY/YaK56cvJmzvNQG2PImziU7hb4VYo/aowhCwRJIxoQbNWABo1tc5cI
 fMKdhZf/4weB3T1wlYyqc5DuTed6Ahn5Q9TzHDpeHKHH9JCst7C9hLppbFsN5D/bmgFj
 LlnQ==
X-Gm-Message-State: AOJu0Ywx+9taZ5dcSk2FGUOuwkaTxgWrDeEjOk/RmjywT6GWgbWc5ydf
 0k1mISTfJEvUmsEcpmH+7uwXBw==
X-Received: by 2002:a05:6000:1205:b0:313:f463:9d40 with SMTP id
 e5-20020a056000120500b00313f4639d40mr5274739wrx.65.1698662371742; 
 Mon, 30 Oct 2023 03:39:31 -0700 (PDT)
Received: from [192.168.69.115] ([176.170.212.50])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a5d6445000000b0032da4f70756sm7950613wrw.5.2023.10.30.03.39.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Oct 2023 03:39:31 -0700 (PDT)
Message-ID: <f9bdd29e-208c-3df1-d377-ce2619655d68@linaro.org>
Date: Mon, 30 Oct 2023 11:39:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 0/6] arm/stellaris: convert gamepad input device to qdev
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231017122302.1692902-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231017122302.1692902-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.972,
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
X-TUID: dFJUAsEkUumC

On 17/10/23 14:22, Peter Maydell wrote:
> (I had this all ready to go before I went off on holiday two
> weeks ago, except I forgot to actually *send* the emails...)
> 
> This patchseries converts the stellaris board's gamepad input device
> to qdev. This isn't a very important bit of conversion (I was just
> looking for a small tail-end-of-the-week task), but it does reduce by
> one the number of users of a couple of legacy APIs: vmstate_register()
> and qemu_add_kbd_event_handler().
> 
> I've included Kevin's qdev_prop_set_array() patch here, because I
> wanted an array property and it doesn't seem sensible to write it the
> old way and have another thing that needs converting. I'm assuming
> that by the time this patchset gets reviewed and committed that
> one will already be upstream.
> 
> thanks
> -- PMM
> 
> Kevin Wolf (1):
>    qdev: Add qdev_prop_set_array()
> 
> Peter Maydell (5):
>    hw/input/stellaris_input: Rename to stellaris_gamepad
>    hw/input/stellaris_gamepad: Rename structs to our usual convention
>    hw/input/stellaris_gamepad: Remove StellarisGamepadButton struct
>    hw/input/stellaris_input: Convert to qdev
>    hw/input/stellaris_gamepad: Convert to qemu_input_handler_register()

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

