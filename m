Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1771644lfo;
        Mon, 7 Mar 2022 12:19:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyF68UDbg9z/MDO2gpYH/93M7mh68a6I12g43BZzWmZTaWWhfZvWUKAfk/Rb3AL1RcxnXt5
X-Received: by 2002:a81:4b47:0:b0:2dc:1441:be29 with SMTP id y68-20020a814b47000000b002dc1441be29mr10103894ywa.341.1646684369569;
        Mon, 07 Mar 2022 12:19:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646684369; cv=none;
        d=google.com; s=arc-20160816;
        b=Ft/H7Txpj4Vdz+Ot79YRUU9tVQoTYXwso4seXM20UcflV8mGLxOLWB9DFje6GbI2bj
         2vdyGUPAlMAvtNeq6wEO/jSVVaRHUsnEYRs+Ewg8Xneyz//fW4QlNU3VD2AnkNK9PPzK
         artzU89bOr2FzC9QB8vEyVm/vjJ1LPlwK75pw30lXJJgWk9BjgnIxntDPwLQ6XnqTEKT
         H0SvH9VSayGtHgqMICJ8vJolW45FWjayWrqDBllbdh8boTdbsGyiKYuvcVEK2vUvAKEB
         BtrvWNuk+qNEiqZQ0F6f9qgeJLgZqV+AaJWKoKwUWhzJ55zJNm3QM5FETeFvu01/FV7Q
         2LDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=S5e4NIMPuDjjEsNf5G9G6wKlkNj2irvtivE0fghr8Gc=;
        b=yfYsbWH0dW7nuYoNqj1bTEP0xjgE09N/3+Mgy/gWdKaYbS81R8NQBha6PdmWgbxbri
         4s2UDYuknTNV331lWkf0ET63pUPIOOlxJCLSTXn5IPEvcwNCWyIye8o6oSwUNtNT7qAD
         F9DNKCXH5pFiBYslYZSTvO4GIFFa4sILfEMHYaCButdN97xpI2mg+MLUe+aAI3m0MRVg
         UMA30bdg0kg/J7neUtkG200GkHxwq/ZXdGxB/YNGxWIfBtyxs59bVsm1awee/zsLZJ5n
         tDqO6Dynml7qksYeuWMs43Z1aGlxW/dDn54q/3+UORX16G1/ZkWsGmG1qqhfPJCIBDXw
         Lcwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Bg8G0xqo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j201-20020a8155d2000000b002dc064258f2si11242438ywb.151.2022.03.07.12.19.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Mar 2022 12:19:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Bg8G0xqo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRJpI-0007wY-VP
	for alex.bennee@linaro.org; Mon, 07 Mar 2022 15:19:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRJpE-0007tp-F0; Mon, 07 Mar 2022 15:19:24 -0500
Received: from [2607:f8b0:4864:20::102c] (port=46016
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRJpD-0007rA-1e; Mon, 07 Mar 2022 15:19:24 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so263047pjl.4; 
 Mon, 07 Mar 2022 12:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=S5e4NIMPuDjjEsNf5G9G6wKlkNj2irvtivE0fghr8Gc=;
 b=Bg8G0xqoE861PmjF4+VaszbdtSMTJJunqr9IwmX2xiOEp+224r/K+kJGha80iM9g8O
 axy4clvwrwX/b9jekpaQS0lDEELtvhOjPuPZTgd/kNjCMf8KGvae1FvUydPFMUuDX+Vl
 B+E1T9Vj/7gV+ywTx/CGQ9o+NliaZWGQ+DcUpurVTXX4ryLEg9PZRNS1PVaqdvhOB41z
 iVeSWotYyv/oURI2Ie6Clu9H6PsSirnwt4c4zeQgmlgWqpFzlgpScJ4b0DER1j2B0w1g
 u/eIS8spJK2DS+dGyb67x+TJyRZUM2LI27QNaOiqY3WymKE0q2Bj8V2IsmHWE3Umcxhg
 3c2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=S5e4NIMPuDjjEsNf5G9G6wKlkNj2irvtivE0fghr8Gc=;
 b=56iIpSrkN102mWDOLa6T8hSe1d4VzZDxbqRpqyausNEKnFeHFeCII9dh/6d8nHOi99
 tgy27HttSML5w414XafxyDqK5mplZmLInpP8gVbH/5N1UKnRlKSSh57CqpqztFnOvvL+
 r9K1MxPrKftYusDUDG6G6jS609aqE21sU8jeS40Qufp21xyFoyRrSfqJCkiLDPpwS23Y
 +281N7G3hL7oUW8lATvGm+eVJOzrLlNxHN69EEGjCoOcLuW3AHIfUs7RtCnuTOYD0bMc
 lp84W1LpcRi4AKXQ3hz/xYie/Ge0HcCFkwcKagdIpaz9oXJPEKdcjxnQ19A5Cnkd5gsX
 GG1g==
X-Gm-Message-State: AOAM532mP1ZAd2mH43C03kxmdO3TpjGVmT+cmzBC4VUI8Ub1/c1mrj5x
 nqvsYdvxhEcxOCrLFD+O9XM=
X-Received: by 2002:a17:902:a713:b0:151:efb5:76f with SMTP id
 w19-20020a170902a71300b00151efb5076fmr4934301plq.117.1646684361206; 
 Mon, 07 Mar 2022 12:19:21 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a637a07000000b0037c9268a310sm10350743pgc.3.2022.03.07.12.19.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 12:19:20 -0800 (PST)
Message-ID: <cf546a48-6dd4-bbfc-0293-94f84def9c45@gmail.com>
Date: Mon, 7 Mar 2022 21:19:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v4 3/9] hw/i2c: pmbus: add PEC unsupported warning
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>, Corey Minyard <minyard@acm.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220307200605.4001451-1-titusr@google.com>
 <20220307200605.4001451-4-titusr@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220307200605.4001451-4-titusr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: wuhaotsh@google.com, venture@google.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d8PK67NchPnv

On 7/3/22 21:05, Titus Rwantare wrote:
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>   hw/i2c/pmbus_device.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
> index c7ec8e5499..ff644c1d4a 100644
> --- a/hw/i2c/pmbus_device.c
> +++ b/hw/i2c/pmbus_device.c
> @@ -307,6 +307,11 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
>   
>       case PMBUS_CAPABILITY:
>           pmbus_send8(pmdev, pmdev->capability);
> +        if (pmdev->capability & BIT(7)) {
> +            qemu_log_mask(LOG_UNIMP,
> +                          "%s: PEC is enabled but not yet supported.\n",
> +                          __func__);
> +        }
>           break;
>   
>       case PMBUS_VOUT_MODE:                 /* R/W byte */

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
