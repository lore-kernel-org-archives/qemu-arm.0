Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3589748ejm;
        Tue, 25 Apr 2023 08:48:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350a7kFyAtUnQVjMWUEOLtWBRfpXBdlZdWJml89vYxlZ+mj132LS2nkKyD+vucxe2lEGVdcwQ
X-Received: by 2002:a05:6214:19cb:b0:5f9:ba55:395f with SMTP id j11-20020a05621419cb00b005f9ba55395fmr33492716qvc.52.1682437719730;
        Tue, 25 Apr 2023 08:48:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682437719; cv=none;
        d=google.com; s=arc-20160816;
        b=vmgUXdMqLSPJwb0c1OaTcnNgaWubZVFti/8TWVB8oY1IFcjAhkdr0FEY7IE6nBjnfF
         q2Z/hyq5o3SNSI1M8vgRpLktEFJsa71pU5imX3Ttud5c8cnWODfNN6o/8lWBnYL5EfhX
         Kf6JVaiuzvbbEB7dh1SYbXtAaYMz+GrhbW8iT0ZS+8A4OaOsyfdE8J5M8DuG5p7ncDQw
         opuerRTaVybwmNDoUsq9Fyf6Jm3HxzCVbWf6KZkBNt0x7nblKoaO1X8x12iKlaHrF2D8
         H+xwVjM/xRr8aftfOO95t9rwT0hPSQ2QEKgOogKl5xGqscLW5mQs+VjXNZ/yKn8p5uFl
         sfbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=mFXUeqmf7J7ZmdEqZ/F9UYdDBPhcEtftBoUmvdXGTbQ=;
        b=Rugfjnq4ukasoaVwyWi8CNfmM5YfyZ7pl9mRMFaeuTdIG3roLKdSf4iZtRH4JncQpz
         uo6rDjz2Nxd8LB1acolKzIIldzX8zNGgBlKhVxySmqfwMC2G4rHM9Rb7/PDDhA7NgwGW
         mDtmESbosWgHo40GHT8OwEatzQARIjuCNZzq/1vMlerKbH0rr27NciF9LXQhBwajGgwj
         tKPGdNfcsGbFN1ALL0x+FWtovOlIL+dsUs5bSl4BfiZ8Cwm+M0D3wKKzVMNbIprsqmWD
         ooFGORS8IdAbwHQYKB4gd/l0TwJAXT7YuNt0Eorg31Tj0GPPcjDzZENdgVaN3MVYu6iO
         D3Lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Rm/oHBKm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pn3-20020a056214130300b005ef8161cb7fsi8801089qvb.70.2023.04.25.08.48.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 08:48:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Rm/oHBKm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prKto-00062y-HG; Tue, 25 Apr 2023 11:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prKth-0005uA-Le
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 11:48:07 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prKtf-0006d8-Nc
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 11:48:05 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f173af665fso39143105e9.3
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 08:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682437680; x=1685029680;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mFXUeqmf7J7ZmdEqZ/F9UYdDBPhcEtftBoUmvdXGTbQ=;
 b=Rm/oHBKmuQwVPHcCxcJLLFSijeEkMvYyFZ+3XQMStb5p3IDxE+Tw0gReJqb8vu152N
 OAHP2JPHRLDFM5BjDLf3lsvvGKBwlzyCz0b6hadMH5KU87GwbaBWBiSTD7lpwkcXuB5n
 o/q2Iw8q6fG64aQaUdCf9PugJFgmYt8HqPgJ0kq3cOIH+ycrZW2J4z2Iw5i5yEyzBHAt
 i2pZbuqGpWOc3FNh2Fy5dUDRbhGqn5RBcXjcuSra70bbygBKF3qnOQahM8X9ZaQf1F0U
 tBiR9wKgFPYjK3GLUASkC5L9e1C5nxBM61zrRSeuh/HywDsWc2oszTxu4MFoUtc4YOhz
 keDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682437680; x=1685029680;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mFXUeqmf7J7ZmdEqZ/F9UYdDBPhcEtftBoUmvdXGTbQ=;
 b=T0/N90eh313OGh7JXHVfcKHf1tx335cCTOCZDyfFILcgrFOA1EUXaZ4x4yXVxyfMCk
 wCLYGGygdEWrx6Z5rRk2nWM9mu7/BjlrC94/LjUThiNgOBeuPMB9uNa4XkLQ1w8TKueC
 anLBoqToVo1da1Sk5QOVORPPAU9PYArAXY8LGhnnGauwdCcqZPj/EyqsIt4yjpovV7RJ
 8MKZv/mXHc3ZXAsJcdCu6ObKS3S+iBRf5tBEx2quQtp2nYOevmJdF7NFv0pmnt5WuaI/
 7Y3YKwL6Jymif2yOHH0vTzAa+M9y5/Wa6DGuAsX4IzH0qlJ9Gvke/di2L6rGwZTZj+MP
 5l5w==
X-Gm-Message-State: AAQBX9fxrskSX9JeGqoMwU88IiSmN0uvjb9kAcqWojGfJ+A0f9hlxiiB
 /W/Dw3Uk/FiKJjYE8SvsIQX+Iw==
X-Received: by 2002:a5d:5181:0:b0:2d5:2c7b:bc5f with SMTP id
 k1-20020a5d5181000000b002d52c7bbc5fmr12444379wrv.58.1682437679885; 
 Tue, 25 Apr 2023 08:47:59 -0700 (PDT)
Received: from [172.27.248.56] ([212.187.182.164])
 by smtp.gmail.com with ESMTPSA id
 v12-20020adfe28c000000b0030497b3224bsm209356wri.64.2023.04.25.08.47.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 08:47:59 -0700 (PDT)
Message-ID: <de9e4f6d-e985-b1f9-5a59-0127c54a7323@linaro.org>
Date: Tue, 25 Apr 2023 16:47:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] hw/intc/allwinner-a10-pic: Don't use set_bit()/clear_bit()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
References: <20230424152833.1334136-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424152833.1334136-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: +9Xruk7V/Dw1

On 24/4/23 17:28, Peter Maydell wrote:
> The Allwinner PIC model uses set_bit() and clear_bit() to update the
> values in its irq_pending[] array when an interrupt arrives.  However
> it is using these functions wrongly: they work on an array of type
> 'long', and it is passing an array of type 'uint32_t'.  Because the
> code manually figures out the right array element, this works on
> little-endian hosts and on 32-bit big-endian hosts, where bits 0..31
> in a 'long' are in the same place as they are in a 'uint32_t'.
> However it breaks on 64-bit big-endian hosts.
> 
> Remove the use of set_bit() and clear_bit() in favour of using
> deposit32() on the array element.  This fixes a bug where on
> big-endian 64-bit hosts the guest kernel would hang early on in
> bootup.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/allwinner-a10-pic.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

