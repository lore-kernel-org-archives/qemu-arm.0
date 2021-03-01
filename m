Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3353020lfg;
        Mon, 1 Mar 2021 00:00:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMI02Ig88jjs+XcyjwJ1gN6y6lW3iHWJ9x8ezhfEcceROFtRnaBzhsHf4zN8qc2irT45lq
X-Received: by 2002:a25:fc02:: with SMTP id v2mr20481634ybd.369.1614585613086;
        Mon, 01 Mar 2021 00:00:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614585613; cv=none;
        d=google.com; s=arc-20160816;
        b=Ze9CdHy/4cN8/sSeeeKLCqsIadW1ZNChBkWYiS3cm5ZZRtglACNlwtnsHvXBXPkfZm
         +9W75qMqXYs6aU8jnFqls3b/kUb1mia5zjCoqYYZNXUGnt+U60GoItwtcCW3Rl7HFmN6
         hGV5dlLa4jsFsf+0BaUBtRfvN1Mf8DuqaJVwFeNiLgQUtN4h5czVUZS6XZVd/rP84Zlv
         MJ8Ro7eOHRbaj6azHxpaPWxe0o2IgyHDzxcS5t8VJk53rkzOGKXnyPIoeQ1oCdjDcAuP
         70YG1on7g0xBdnBLqSDck2EmUYkotaTDPDv7KlQ35V0pufk0Womu/TJm+vlQE5gPBtts
         2sMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=cZAnSAXUjcg5CvUYd7dLiDNh85dzm7vaLx8l6sjitgw=;
        b=sTISTXLUw9DcUCNJ+SW6w9feGRNs64Ayhwwk10sP3OTxK9FtIUZi2zXMpw40I9iF/x
         +Zl7IA4EQUiVwnsF5Gcf41mQAs+pCN+1rvnVIIMy6Uq8+SbEAfyFmoLa73pfVYAegQcp
         H/LyRDU3qM7dhK9V9bp8UzGyKoYCTHIN8PbGkrpKyiWdumby1ijcK3aIL2JzEU6wl+c2
         l+xDJFJGBxn1F77+PAT0pMeoJw8Ig+aIQ4jgotkqsXiXtO+D8sWZR0UENx1Fx1swA9Bw
         DrIQ7vdabnvaVn/a9Tpud7eEl+hfBO91vfL2rzdpno58rFPUbJ0Ndo1PMd2PVLfjJoXL
         C65Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kYavZzFy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k187si15772517yba.204.2021.03.01.00.00.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Mar 2021 00:00:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kYavZzFy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:56682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGdTQ-0007Pj-Bg
	for alex.bennee@linaro.org; Mon, 01 Mar 2021 03:00:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGdSv-0007Nz-Tz; Mon, 01 Mar 2021 02:59:41 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:42939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGdSu-0008Mz-J0; Mon, 01 Mar 2021 02:59:41 -0500
Received: by mail-wr1-x430.google.com with SMTP id j2so2184056wrx.9;
 Sun, 28 Feb 2021 23:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cZAnSAXUjcg5CvUYd7dLiDNh85dzm7vaLx8l6sjitgw=;
 b=kYavZzFy3mdcuZme54WL/vIVxnNwaxay7qetShiM6dqiu2PqJJTVTllnCCSZor3VvP
 XjHaDONDgNPjhGHGh4prgcV38Nhf6bR8Di5O3M23yr3ukz8M0NHJThRHTYbzlOrIxBDM
 kc+IUhGlR7ss8YjDwGwBVlw6YHf0uSxbgdr28h19up4JftsqWlgXvwi8d4Sctf/VbACu
 r0kOolIt4+3ueFazPcHA31fvlkVg2q+zwWFh/ld2KRfYxRQUMNomEnGXMQ0mMpCKnVo5
 2GlWqxur+cjS5BP485h59nqRe8msYV2xJ/1haj31eVenRZqmvhhChVoDs5S8Sx/7QFDH
 KCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cZAnSAXUjcg5CvUYd7dLiDNh85dzm7vaLx8l6sjitgw=;
 b=qs98wO9a0HKH8/RGeGJDtv9pEdLK2UD4O6MI/HwFQHbijfdwWzxRSA4Svtp8pNoSD0
 j0Y8j0ux4N0/SaOCDC6FlYNliW902Q0JCWCp1Lo/AqtFKlKPJkKoQ59lcrUuf+JknXik
 0AFGvbn3KKIEwkLyhFF05zKu4yYmgh5WxifdW5FxXTZ3mAhKV+ILwCzBc8GK84zqf5Gk
 Va2Jhj/yLHKNYyLG1Qua2pSZ8IsDvI5OEEfFm+yixQlqeD5F2Z69YtYBY/MBD/DZAXLS
 AA50r6enfRGpcat5zQcu0l4XH7Nf9Xqd7HgveOarotMZ1nNJPpDpo4s/BLNKk1qn9x0A
 Q/PA==
X-Gm-Message-State: AOAM533ZwI80WSE9BXgtOvcxr2/0oU/CdrW3hmlhjaXQEBBzQDGFsZeH
 loBOmak/JA7sObZ5duKKYAc=
X-Received: by 2002:a5d:6381:: with SMTP id p1mr15812292wru.266.1614585578814; 
 Sun, 28 Feb 2021 23:59:38 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t5sm22204688wma.4.2021.02.28.23.59.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 23:59:38 -0800 (PST)
Subject: Re: [PATCH v2 2/5] hw/arm: ast2600: Set AST2600_MAX_IRQ to value from
 datasheet
To: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
References: <20210301010610.355702-1-andrew@aj.id.au>
 <20210301010610.355702-3-andrew@aj.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <80ac1b39-8c6d-e769-6e0c-fe5ad099b451@amsat.org>
Date: Mon, 1 Mar 2021 08:59:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210301010610.355702-3-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: peter.maydell@linaro.org, ryan_chen@aspeedtech.com, minyard@acm.org,
 qemu-devel@nongnu.org, joel@jms.id.au, clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J26ef0zJNfm+

On 3/1/21 2:06 AM, Andrew Jeffery wrote:
> The datasheet says we have 197 IRQs allocated, and we need more than 128
> to describe IRQs from LPC devices. Raise the value now to allow
> modelling of the LPC devices.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  hw/arm/aspeed_ast2600.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

