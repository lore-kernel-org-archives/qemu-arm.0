Received: by 2002:a19:87d7:0:0:0:0:0 with SMTP id j206csp294796lfd;
        Wed, 27 Jan 2021 14:11:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKxu+OOxXTcwZZNGCcTwGQz9TzRqsCQHJJvpYC1/zyHkWf+b3uMY1t5iwX/ku8wuvZC6t0
X-Received: by 2002:a25:f54:: with SMTP id 81mr18144754ybp.76.1611785473341;
        Wed, 27 Jan 2021 14:11:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611785473; cv=none;
        d=google.com; s=arc-20160816;
        b=qVBkHfB/f+P2FVG4z0KRBURiDJrMs6NYznVF+TNjoxt9AkzSiY8R8EQN0P9ocfvjaj
         lLQtIVHFL5EM9iMSCaOokdC0Ph6xhJfUCBo5q3vWczSymiAzY/znDZWMjjn231+xgNM7
         /m1PaW4IMKP1xAL9yZrxYcb9wElmtODkV+/sLZCjak2uvdDYa6arm1hF7NwrEJOvc0B2
         O/pxTiA5JA2Yx5pcpd3DzqPN0afT3bbOOmo7SZ6bHFqr0YcElY9naCOh9BcbFCIy3Vrp
         jHZjtWi5/b3xsbbTlXh6AFQsIM02oylLU/uoRMQPvZmHVYQ9dH3yN6W8ICrkYuYAJPB/
         zIcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=qd/PUZyZLreEzQbUiisMF4yo6oOEpNQQcPsYP3MH6ec=;
        b=Q/3sbJoMZ4jloFDgVyB27h6VKtWP8qjcPdGIcOr/zBHkT69QPHIAAM4B03nvrplERD
         1fg0n4KJSYKlLY9tFGRRcWKV06XWWPLevU5z6eV0DVgl14ycLbSB4Azo0HUQWAg6jG0f
         pPp1BNdTv17wEe3yWastDwx2XL7TJVriCZvMQ2k23HkZF8AWrO3ngcZNglo3Y7gyPkxu
         eCWO6GwF+NXSmwFlt4Xg72G3x7o76XxtDw4TQXFywDq0AmIaDekW8UYpLLWw7wBnHtub
         YFOOGBhughUhubKNsaxyPl7NtykytklcYMr+BmgdXvTfW0mrMO64GGNylL6refnCJxZe
         ajMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DLVRBTIW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2si3259574yba.28.2021.01.27.14.11.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Jan 2021 14:11:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DLVRBTIW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:60902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l4t1s-0003zf-N3
	for alex.bennee@linaro.org; Wed, 27 Jan 2021 17:11:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4t1h-0003xa-Of; Wed, 27 Jan 2021 17:11:02 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4t1f-0006SQ-Rv; Wed, 27 Jan 2021 17:11:01 -0500
Received: by mail-wr1-x42e.google.com with SMTP id 7so3512941wrz.0;
 Wed, 27 Jan 2021 14:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qd/PUZyZLreEzQbUiisMF4yo6oOEpNQQcPsYP3MH6ec=;
 b=DLVRBTIWjKuK+xvNrzpNicEgNfU5RcZIw4s8aLjkJ5LZN7PP59c3Y/Eu0lPEa1/U0P
 Sf0N0+xVZoW1TH/6JM7m5ZQZSJ4z6MYCPytRM1/nR5sdZLPyY4SHVKVhMlCLFCC4+2rg
 iZvuwYVsKBJsOeeFGvPQBsMoAuBCWdg2Znl+kj17A/MCgaEDaiEwfAUp9k+gstegvjnd
 FTlam8zmMv4MDXpRXEXrqOo3rAgphOBe6EjPZ5Te694i923Wkj1r4/KykRNR5HJ0Q2bY
 Wqcux5KRsJ3CTO18Vv99uow24L5/kY4xdGj1h4z3MOnsi6Rmlj4hhDNt3TJkOq6dzOyy
 siCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qd/PUZyZLreEzQbUiisMF4yo6oOEpNQQcPsYP3MH6ec=;
 b=sSX+Bsnys0YSDrt7Hry2tL5LXarREThYed+Wt6gLQIlwQbkcVWeFq6h0Y/NaZmzSJb
 taRnD/tcgEIjkMQ0mb/+4HmH8PZyLD1OPOG6MEBkOp0C6rgP1P2s5utLtz8q35angGzK
 slGmn3So/UyXvySlgTJ/25ufHUH6cmea5qXnVpS7XfcKNnJUbOBboYtLB35zmjA4d/6u
 LL8MXDfdU0xHMx46+hh1Qo2tfju8i65XeP7THbNI54fDNdGuoHF8bvwBMdQS5FkJ/L7S
 VKxYV35b0dwqPfCK8tUMjboaMZYXxUzzgSvJ61LNatx9vIglhp96bYmTZXMKBpSgb9TV
 wZnQ==
X-Gm-Message-State: AOAM532gQ0LI2PI8qi0h2cDmCBC73TZ6R6J7onP55Y1AyvY37kp3noBM
 hkPBPwfZWdtu1vfZT6OlrnScqB2SXj0=
X-Received: by 2002:a05:6000:1788:: with SMTP id
 e8mr13224883wrg.171.1611785458260; 
 Wed, 27 Jan 2021 14:10:58 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id c11sm4334396wrs.28.2021.01.27.14.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 14:10:57 -0800 (PST)
Subject: Re: [PATCH 25/25] hw/arm/stellaris: Remove board-creation reset of
 STELLARIS_SYS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-26-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <53675a31-3af0-e4d9-62a8-bd1e4636b8cf@amsat.org>
Date: Wed, 27 Jan 2021 23:10:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121190622.22000-26-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EwC9CjRF6mm7

On 1/21/21 8:06 PM, Peter Maydell wrote:
> Now that the watchdog device uses its Clock input rather than being
> passed the value of system_clock_scale at creation time, we can
> remove the hack where we reset the STELLARIS_SYS at board creation
> time to force it to set system_clock_scale.  Instead it will be reset
> at the usual point in startup and will inform the watchdog of the
> clock frequency at that point.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/stellaris.c | 10 ----------
>  1 file changed, 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
