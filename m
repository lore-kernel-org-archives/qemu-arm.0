Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4082004lfk;
        Mon, 13 Dec 2021 04:58:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykGi4PzpiW6XwmXC2DIO8mw8uRUVTL42Z7tMVfpDgOfjOopdG2vqLmdfWZfc6NpPykJFsq
X-Received: by 2002:a05:622a:198c:: with SMTP id u12mr9118316qtc.416.1639400305157;
        Mon, 13 Dec 2021 04:58:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639400305; cv=none;
        d=google.com; s=arc-20160816;
        b=XJpmNgxU4dpu7/4ijKbDsXB7awzjBGf3Skrx5Iyw9AHWtqhf8J+hxpG20pTnNIsveO
         QOPu30JhTZjK1j7+mXpyj6DY7xoGaoZrCLvH5AWGXdaq5D8HUOBHm42xy4K7EXjhvTpX
         +AkUj29owKMtA8JTHCflJfFRSvw2dVpms0D/+He00eID/GEiyXJfc36AvkCWcAv1pNFO
         UvRjBg6MiJgSl7/yBhzUmCcfsbT8pyF22tXh75C2Ocntf2OYKS0yg24uf0xi3mv2ugRd
         PLXL9ahzfCXHH4HuezcYr8RSKbi9CYdkJYredmztRJUX3h5Ss0H9b0KGp8ntz/Tq3T1R
         hytA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=gZlu6fJ7sJRbzeJva4LsvRktWlMO4B1Q8ZMK1i8QI2U=;
        b=VHRS48Rs/JW9VA5fMryBDj1HSJQ8SJxkf0/1c4Lv/+nO0CNp1WXfCLteoZBFOHm19y
         VQ97kR+rtbB5xSuMViqvRI3GT+YzQvVuBtC7kpWQE4T74aFeSRlktK4JNStFSf3AzDhK
         TItE/b2loXVRb0SxNmO1GE8Fn17DvIMHSq/HFMjuDHXD7AFu/lvSXLSdozcBg5lE7cvN
         qZvHfGzlGF7CK6GB6DQbrDwSXLJzoj9XvubM+En1wL8mS6eY2wHKCUEbd20ynSaYkUfR
         NNHkmczpiGzeOnXyVMJbtL3nUCWyB1Xol255pPFbXpyMEGgUq5JvjduORNkBpSkZuSUG
         yThQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=cuXknEYD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g2si12287728qtg.75.2021.12.13.04.58.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Dec 2021 04:58:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=cuXknEYD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mwkuO-0004VP-Dy
	for alex.bennee@linaro.org; Mon, 13 Dec 2021 07:58:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwkuD-0004Tx-1e; Mon, 13 Dec 2021 07:58:13 -0500
Received: from [2a00:1450:4864:20::42f] (port=39751
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwku9-0001tj-2W; Mon, 13 Dec 2021 07:58:11 -0500
Received: by mail-wr1-x42f.google.com with SMTP id a18so26890283wrn.6;
 Mon, 13 Dec 2021 04:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gZlu6fJ7sJRbzeJva4LsvRktWlMO4B1Q8ZMK1i8QI2U=;
 b=cuXknEYDfTtsihbnikv+d9tgZPW8rPUWlCxryyZXq6FfgcStesiKKeDoALkTqVOcVa
 GJCemmRVV+hzgU0229kSoPLCgqY0p8j+pRWnucbdAeLWs5WotIH2g87MVV3LI7LYGvUu
 H0cAZ57j/hBcOYwiz+greR1Ptdrvfy4OvPOq3stpQAYRCj9AyidubunT/Mld/lkvNlCD
 YIBD89dXDE5YW7wczOLJLoVnrd10rNVrGgxr0LH1r9aa2x4QAJ7AYvJy+SmKM/HXfsl1
 dZhJ1BHU81HWS1BbP0nP3zJ8totHi7ojTZULjFROVbbPv0pt/kaVl592dCU92MHRrIy2
 x8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gZlu6fJ7sJRbzeJva4LsvRktWlMO4B1Q8ZMK1i8QI2U=;
 b=cnuTKw/v1IYI7jElOY4G2engezUQZD0OCX2RWzcTYSlqXBL3bJO+9PWXy2F/c2QvAb
 V17dSC4F5Kq+MaeyThXF9hAPzQe4ugjq4V2r+KxqQa4uXNnzRgDDx5gjI0m7iF/sOpVS
 sWUisl9qrwhmhKvauQ+yV1tkP5RrWCG5mqs6qsXDjJOECda9YivECG4NN3GtgJ9x1BH9
 Y1zSMXrEY4SiyywrZYRz1/aQcFui9Ts3ilOYVJvFV6ad/g8OAmNHN7pKtkdqBdiU/0L/
 U77DzG3veD5d9u8SVtuZRJZ4bnrJHYy1O9tV3snzj/TTkkhAOu1YFxBE1YlBgyNtJyN8
 R8KQ==
X-Gm-Message-State: AOAM531Y3hhKT9QmBKJympwv9+zY0zKQWNcgKsJ1RvZZ9QJvlTkG8Zdl
 md5zr4LFpR34RLkpIvzD4UQ=
X-Received: by 2002:a5d:6d8a:: with SMTP id l10mr11174232wrs.157.1639400286423; 
 Mon, 13 Dec 2021 04:58:06 -0800 (PST)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id f19sm7748115wmq.34.2021.12.13.04.58.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 04:58:05 -0800 (PST)
Message-ID: <cb89940b-f11a-642a-44d4-9f1af2e98f25@amsat.org>
Date: Mon, 13 Dec 2021 13:58:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 15/26] hw/intc/arm_gicv3_its: Rename max_l2_entries to
 num_l2_entries
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-16-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211211191135.1764649-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: evp+R2bQ3Mvj

On 12/11/21 20:11, Peter Maydell wrote:
> In several places we have a local variable max_l2_entries which is
> the number of entries which will fit in a level 2 table.  The
> calculations done on this value are correct; rename it to
> num_l2_entries to fit the convention we're using in this code.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
