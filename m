Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp343329lfy;
        Fri, 21 Aug 2020 07:35:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyM9uYKbSbvUiJynRjiYq6OvMzVju8KX/rOj78b+hpUBcJzTHEi7mG61MgiRWbvTvet46qE
X-Received: by 2002:a25:da0e:: with SMTP id n14mr3787538ybf.307.1598020526480;
        Fri, 21 Aug 2020 07:35:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598020526; cv=none;
        d=google.com; s=arc-20160816;
        b=viM3Q2KppzqIfYYvsBnuPbq3JJkyMYcVm4aJkg9SYIQ57feh5qXh0PyxmxWvYGiMfA
         n+pt/l+kuVVgMoZXMULMIxkzT67485+CEbSJCPHx/vPLA/8Vgz8xsisKCk+sdPBu2tFF
         EG+6RpEWLq7cEWnrdrx98NsBKIuJI4ilWkOHbflX0XnSWY2q/u+9LxSyeeNWvVQMZVU8
         Yugl5kJM87zNMqfoQwqDmF54uE5ncAUSiXa6h7z43pPTKkDMZwODcI6x6y+7NxQ68E0j
         SukCj43lefrND78V+aqtohnjRmuWND7P5wHF0VDSrSVT/fni/Ioe6ae0IBkatyJ9zFgQ
         eOpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=7ivrD5dccZpFd14GQ0mNAaQz9e0GEvyBOBtCZK5vH9Q=;
        b=dUr712djA5wUlCO68m9ly6uz86xiuN9kiUNHyxr4XmKenOhRK2eb+juwEB7h46/Yps
         uqOLaigqlXiudTJktryGloW+4t8i+Rx6w62HPWvUSfiMiJ4sJ42OBHkYQ8L2awdahIrn
         YbQT9Dn1HUFCUflDaZ9MtpgTr60NsBDOf1juV/p4thbuwoYbeWOeTAxyLBGCOYu24Czr
         QUqIS3OWg8SbgR8x29n9qOg6HM7Co6l5TM4Wm5l5KN6/q1oiA20y2WRp3rcm3rfCXQuO
         EI/CLMUhUK5CJ+AIiqBIW6/AaLT6kwCFlRfVV0sOqf+zXYAjcD5B4xH+FMgNG/EqAfb1
         dMuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UM7ah9cO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13si2332671ybd.405.2020.08.21.07.35.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Aug 2020 07:35:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UM7ah9cO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:52394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k988b-0005Xw-RX
	for alex.bennee@linaro.org; Fri, 21 Aug 2020 10:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k988L-0005WU-PN; Fri, 21 Aug 2020 10:35:09 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:45822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k988K-00086Q-1y; Fri, 21 Aug 2020 10:35:09 -0400
Received: by mail-wr1-x443.google.com with SMTP id z18so2123221wrm.12;
 Fri, 21 Aug 2020 07:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7ivrD5dccZpFd14GQ0mNAaQz9e0GEvyBOBtCZK5vH9Q=;
 b=UM7ah9cOvqnz6hTfE/tL/bkd235LYgtsVYkM7lgHpOlC4uVTxwhc0BMPx6+/D9kQZY
 D1P6QiJ8q+ywmccjohNFn8BoBWJ6NwRDJ4a0hSF1kQfF0ANlmCuKGoswkEGPwFLDw+T4
 Jd5srRKL06aVvBZ/hVHq2DZczcm5V0oNVBUAoUeg/LxPQYRcjTUryFAI6hfcNeYDp2/w
 yTvVnt/XcIQ4kOJiAYzncQUHflu+/2n3DtT1VH/ZivEPLo4jCl9M50qGyvnWUAdk1BwH
 Woj/HqSuNw/n4OXN1TeAIlMED4ADe5jD4djd1lDfOKWL+2IW1biuDPCtYhVjAQFoOcJy
 E7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7ivrD5dccZpFd14GQ0mNAaQz9e0GEvyBOBtCZK5vH9Q=;
 b=QhOsIoUAP95DYVg/iv84YCtuYV+SD5KWsugdbTDFWDOkSrxCUUegky0U1d8/2qb//3
 85hxhoFY0o3o3EzFrVQ7F5AS3QdoSL7PFoDTruszx4P0GPeCe6W+q75PlS9ImAyz7Oa+
 2Sv7yJUYX6Jrk/VNZTMhy6Yki538mwIzlaxg5XyFhUUdSq+KGLsDIlZwNHrFIDb2HVDe
 hYHG2teHxSPXjjC5dJXq5xEtwslQVLDJ0JdVlWdfD6INls/8Bh9+0woKKvkfdaid0UnM
 YypYm/1wWKKATan2fFZSHhJ5mmfdN2wRWYFG7Ahn7VQ3LmZ0QYzc0sBicOT86BaslPQY
 jcBg==
X-Gm-Message-State: AOAM5318K3xwPSJiM7IiqQ/Mi5u6XRCyrqwPtLTnh7HwcQ5D4DFBd8uS
 J0SfGhsQAv93x6UPd2JFDPH55Yz1/JU=
X-Received: by 2002:a5d:54ca:: with SMTP id x10mr2947010wrv.36.1598020502339; 
 Fri, 21 Aug 2020 07:35:02 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id q6sm3936849wmq.19.2020.08.21.07.35.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2020 07:35:01 -0700 (PDT)
Subject: Re: [PATCH 0/7] hw/sd: Use sdbus_read_data/sdbus_write_data for
 multiple bytes access
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200814092346.21825-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <45ff8bd8-2e28-6cce-2890-b59872a1f3c2@amsat.org>
Date: Fri, 21 Aug 2020 16:35:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200814092346.21825-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pmbHW8h66a46

On 8/14/20 11:23 AM, Philippe Mathieu-Daudé wrote:
> Introduce sdbus_read_data() and sdbus_write_data() methods to
> access multiple bytes on the data line of a SD bus.
> 
> I haven't named then sdbus_access_block() because I expect a
> block to be a power of 2, while there is no such restriction
> on the SD bus (think of SPI).
> 
> We can also simplify the bcm2835_sdhost and pl181 models, but
> it is simpler to first let them use the Fifo32 API.
> 
> Based-on: <20200705204630.4133-1-f4bug@amsat.org>
> "hw/sd: convert legacy SDHCI devices to the SDBus API"
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg720136.html
> 
> Philippe Mathieu-Daudé (7):
>   hw/sd: Rename read/write_data() as read/write_byte()
>   hw/sd: Rename sdbus_write_data() as sdbus_write_byte()
>   hw/sd: Rename sdbus_read_data() as sdbus_read_byte()
>   hw/sd: Add sdbus_write_data() to write multiples bytes on the data
>     line
>   hw/sd: Use sdbus_write_data() instead of sdbus_write_byte when
>     possible
>   hw/sd: Add sdbus_read_data() to read multiples bytes on the data line
>   hw/sd: Use sdbus_read_data() instead of sdbus_read_byte() when
>     possible

Thanks, series applied to the sd-next tree.
