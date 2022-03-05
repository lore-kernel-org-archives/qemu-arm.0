Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp129191lfo;
        Fri, 4 Mar 2022 16:02:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+TUbq67kK0lXHUFGeoih358zymrYfRp4ZNbISnaaR9dwYrZIYkCKzCA+XXyHt4hKYeBLM
X-Received: by 2002:a17:907:96a5:b0:6d5:848a:8dcd with SMTP id hd37-20020a17090796a500b006d5848a8dcdmr988302ejc.87.1646438545570;
        Fri, 04 Mar 2022 16:02:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646438545; cv=none;
        d=google.com; s=arc-20160816;
        b=PbhpbmKE4N8y96KG0MNyCHft9k+1rP9BgCbEzZSCnvKZ5EkWmtVpxSfhf2P7ZKfiiF
         D6XnIgr2vDIFyW98yXN7Xf5KKX1KWy5tlhQslIpQ7X6D6cm/g5zgDpamQgGOVnx4+87O
         e55n5q0Rp8ASowLVAY4314RdrCPZWfOrpQS/XM/JhV6Ko8DFmmYO8LCcGSgDbLH66iUD
         5fqzkHJiGXO3UL0OXY1MUCn5ykHnJiyjxHBRI8i3p0xgqaFgoF+MCo+thsCTdVx+PuUm
         yK0pUmtQIWhJVp5Q5bQtf0a7BC0SqC1hC0tQYOweH9ufdg0zKN+EtoIPF8hzd/w6l6+B
         61iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=4eug6ZV0a8xFtTAESl8ba5YVPY38NOPIHD+YkHug7TU=;
        b=ZtNLHDGSjK89GFtvjANshXVi4tHDIsv2IIvzOMcCvjZieE6rCGvp3BcrttCbrdN4hw
         IM0FwZ8cEXClwVfTyNyiCT72th5ivsVcLV6Eq2SBhnCBI6U6fuPSSZyYp6aYENK672Jb
         jx10pamgxhyuSjRULeLsiwdr5trs0a9vOD4YRnJM48zxWGf5qfEVLCx0H66/b29J1qoX
         iAKToCgHvL6fTfiM9et5OgI21HcVZ89g/TaPSxKE6yO0VUZIwbVmBmSPgLD9qjO5ipzX
         rtK0emw7XR9Di/soUUWScb5XeVi2kIJ71hahi5lqmLs229xymQGQ4R974dNuYXPPuU3T
         hr6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=n3kLj5X9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id sa13-20020a1709076d0d00b006d0aae3cb48si4326185ejc.270.2022.03.04.16.02.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Mar 2022 16:02:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=n3kLj5X9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nQHsO-000851-DW
	for alex.bennee@linaro.org; Fri, 04 Mar 2022 19:02:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQHs7-00082R-8s; Fri, 04 Mar 2022 19:02:07 -0500
Received: from [2607:f8b0:4864:20::42a] (port=43929
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQHs5-00041X-NX; Fri, 04 Mar 2022 19:02:06 -0500
Received: by mail-pf1-x42a.google.com with SMTP id d187so8895546pfa.10;
 Fri, 04 Mar 2022 16:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4eug6ZV0a8xFtTAESl8ba5YVPY38NOPIHD+YkHug7TU=;
 b=n3kLj5X9tsWdXnuXkMPbl2Arq13ijHd9Avc9MJoECuMYey+EugS5krfzjeSiPY7/5S
 Vvug83Qu/fHUO6VuN8z8JvXgpL2pbMEcZG8lvLBitw/kmHUsYHo287b+5uWG5TWjXzi3
 b3ukb10WTk/VNMTM+sSjxqoPdDsVR4GzmnJvuUsG0lywBd/SSig49A/csIx11V5rcJLh
 fTxDp2cWa2k4QJPXZmBggHdQ7FnIB5ZQ10Zo134+XAWUDXh/rSH5DqWBQ8Ejl5KCGc++
 ypqnEV6Lbt8MuTwg+OrOUyxBpZPnIdibPbuGns05c/Z0cgAaLV333TkT+/pmBZp3aT8S
 mQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4eug6ZV0a8xFtTAESl8ba5YVPY38NOPIHD+YkHug7TU=;
 b=t1ZIJLNDwoNQz5ZBPSIUntyIJR59HrN71GF2JSeHdPZNY5yt4YDtTCSGGHi83UuiEW
 lO05kmm88rS2/k0HqpqH8zElpy6Kom9nuC/g5CfYvv9YoNYJRyqOHFMRaHd68Qnu4hSr
 U7Rlf7XNVMle3T5Qqg/fipDXviiylc7HTiB/0M6X4obDan+BTZka+CP/J0Oc1Fi3Zz9x
 qvF+GBAn4uwQS4o4ccYNMET+cUJDZ4xn2L2FUwN/YDTUq7BL+iygHcw7jarTwXcRBUAW
 K6E5x+SPG3FNUllgd1BAg6Q2ily/dCpCHsglYF4xASV1C8RFh1s4eVwziOIjzTRDDfuG
 eYhg==
X-Gm-Message-State: AOAM531Bu8BCffL2nRuvj7gZC9FjsbOghmpX199brYcsbOKTYc64770c
 8YOmHJbnRgqJ7gqNMdeVacRICLbHrfw=
X-Received: by 2002:a05:6a00:10c1:b0:4f6:cf36:4ac2 with SMTP id
 d1-20020a056a0010c100b004f6cf364ac2mr1135417pfu.46.1646438523724; 
 Fri, 04 Mar 2022 16:02:03 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n42-20020a056a000d6a00b004d221c3e021sm6928556pfv.55.2022.03.04.16.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 16:02:03 -0800 (PST)
Message-ID: <96a31b84-3479-ef79-1d1d-b7515dc3f0f6@gmail.com>
Date: Sat, 5 Mar 2022 01:01:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v3 3/9] hw/i2c: pmbus: add PEC unsupported warning
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>, Corey Minyard <minyard@acm.org>
References: <20220302015053.1984165-1-titusr@google.com>
 <20220302015053.1984165-4-titusr@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220302015053.1984165-4-titusr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, venture@google.com, qemu-devel@nongnu.org,
 f4bug@amsat.org, wuhaotsh@google.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: osnwg77+fJ76

On 2/3/22 02:50, Titus Rwantare wrote:
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>   hw/i2c/pmbus_device.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
> index 93c746bab3..6eeb0731d7 100644
> --- a/hw/i2c/pmbus_device.c
> +++ b/hw/i2c/pmbus_device.c
> @@ -307,6 +307,11 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
>   
>       case PMBUS_CAPABILITY:
>           pmbus_send8(pmdev, pmdev->capability);
> +        if (pmdev->capability & BIT(7)) {
> +            qemu_log_mask(LOG_GUEST_ERROR,

That would be LOG_UNIMP?

> +                          "%s: PEC is enabled but not yet supported.\n",
> +                          __func__);
> +        }
>           break;
>   
>       case PMBUS_VOUT_MODE:                 /* R/W byte */

