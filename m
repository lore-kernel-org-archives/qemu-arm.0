Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3071778lfm;
        Mon, 13 Jul 2020 01:31:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz55hN763XJXOciX+XzfIbgiQE7tNiO7ed/+VetIoVkMwt9XdS21HQJpd9xtpTa91T5TNfx
X-Received: by 2002:a25:6912:: with SMTP id e18mr70941336ybc.121.1594629066750;
        Mon, 13 Jul 2020 01:31:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594629066; cv=none;
        d=google.com; s=arc-20160816;
        b=iq5p3mMWlsbjRYclX3D9NwZOrfO4hJXjwNgdA2beUf25vZjzRpcB5mFo25b7ZSY4+8
         Yk2Ufz8h3ttnEE2ZNdw/8yp1DpTV4R0xoNpJo6lGGOIEM2ivaIIpJET4UGu0/83ujipa
         2K6FLKnWnyBSWfGMttk/D3vNGkqrQx/HoMts4lZrfgrXkvn0GUoVpklcWwaiqzfqEo6Z
         C3YwZlz0M+tpKHqU22x7I8z9uWyj7hwXmRKDxceBnqiAx8McQ7AuX0Use4NkHMuSEKSw
         sB9CJowg089mY5bmDC0+POXeb4nLbl/0Mw43NCo7K1uizq4cePxXy75WjH9Cvav5+fvZ
         VXQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=AdRCZyV4A0XbB87bUYhILTzVzYYo/O7Upm1y5jzAz/U=;
        b=UkR7AwexHqakNweH2n1TThRik3zv8B02ZQEOwDIuNZwp3Zr6fx1NAJiot2OZepXrvt
         zLrbZH3rs3qEMk5zWkOPuu3vGA0spp2PlQGjVSJPGBmY+RbaAS92PxjmEFrC7nE1XG9A
         fYG26HmGkGZ+kOv2xLetkqnvKXgKOOu/gbLOanCL+WKg0PSxo8a8r7p5uAqJ6KwBT4yE
         emFoBVXxSi7jjpke5oXVDpk+FHr2WU70mjzwdVj67kZNbPJ/15xLvkRSk3zYcBvR9Zvi
         8FPpaP61hMOrCZgUSWsdb2E0SXGlc7D2/cZJeAtgE2zfIYLb2Idmo6oGptbwA2wK6VRi
         Kgyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eAIBGyhS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10si14847407ybh.24.2020.07.13.01.31.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jul 2020 01:31:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eAIBGyhS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:48358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jutre-0002hC-38
	for alex.bennee@linaro.org; Mon, 13 Jul 2020 04:31:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jutrU-0002eA-3n; Mon, 13 Jul 2020 04:30:56 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:42088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jutrS-0007Rm-J0; Mon, 13 Jul 2020 04:30:55 -0400
Received: by mail-wr1-x444.google.com with SMTP id o11so14957011wrv.9;
 Mon, 13 Jul 2020 01:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AdRCZyV4A0XbB87bUYhILTzVzYYo/O7Upm1y5jzAz/U=;
 b=eAIBGyhSxu7j71iedtmaByYStpM2ehAwaa8VhVA47zpdbPXbU8DN7GbOQ2e4sOMGHo
 yJfyl6n08rwKTjGIST3kN3iILffTyeDrNaOHYs2L0Dy+aLc2EZeooMV5EUjJiSp+VdKY
 uDHigv2P6YL3MiepPVOZ0wWr0/QP7+YpKhGowwDx9UQ2xEGkkYcW5ctBPr2rZVVj1Hh2
 mLLjwJ+W30gFZdbX1lj6g3SljpLxmqnp37Jfabs5nmNGtEwR4cgSYtDowg483XXDBKUd
 w/XfgQJc+ybisMR1S3/DXuXoEm0i9xn0XzD1NMLP6HWV0jEcNjj7oOXcS14N0Al29q/+
 Rm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AdRCZyV4A0XbB87bUYhILTzVzYYo/O7Upm1y5jzAz/U=;
 b=Zf11pnO4TARKX0lfVs3N+wx3avkrHImM4ox2Wk2L53mnWSixuhVutmtr9Mdf0hvxPU
 8shwsxZ8BTrOpWGaf+yiyj5NTke9IbjGgnO7UaK6ymCatqoMd9gJdUxM1xH3PWMe2q4x
 fdo1h3lxDMoFJKH8wrg0v/HZULhWTyP2ZtchEob0fNH7XdmU5MJsuvXuY8IgkKbIHcRz
 jzgDKp+cjS9j8PZvbXrq3nuwiw+iX849qXJhH2xB3xsE5U/30dD/7loKbbH9ejdlndGm
 9FoAF6sRlfFK423UCh7OS4M3Q9rCh1nJJiO8M03jKL2IxsrZSrd2ObXYPwIo4fcoT2Yv
 NhIw==
X-Gm-Message-State: AOAM531rxt9KpuJUbVxMNkCV45J6dpAKqALhCNnKvIwBEXDptQKjeM+j
 a1qsGMWPfIJ88A3Dt+pp+U6mtFRk0zI=
X-Received: by 2002:a5d:68c7:: with SMTP id p7mr82779063wrw.16.1594629052485; 
 Mon, 13 Jul 2020 01:30:52 -0700 (PDT)
Received: from [192.168.1.37] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id e23sm20719280wme.35.2020.07.13.01.30.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 01:30:51 -0700 (PDT)
Subject: Re: hw/misc/aspeed_scu: 5d971f9e breaks Supermicro AST2400
To: Erik Smit <erik.lucas.smit@gmail.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
References: <CA+MHfoubt1g2FzcjTw3a0vNr7X2T8Jb+nYoc4_x=Z2TP51afKg@mail.gmail.com>
 <a7acba46-5a9a-5dd2-71c6-7e4586485823@amsat.org>
 <CA+MHfot6FdS2yT0mEsCW36bCfwy-WY-1KPQ-KDfYBKzTy=Gd7w@mail.gmail.com>
 <CACPK8Xdqr+EufMgooCY=D+Vt98qu11YTHE5Fzi5+xqX=wKReeQ@mail.gmail.com>
 <CA+MHfouin6Zmz+GrjWRCc_WzPF=ff-z_5V7BLv0HkL+SW9bRoQ@mail.gmail.com>
 <8879bfee-752b-c4e2-7646-c42dec84a440@kaod.org>
 <CA+MHfou6ijtwjzWye6CKaqTa4sKxF1WmgH9juaSdO344uP2UZA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ff328764-870b-7074-ac24-43421f3c95cc@amsat.org>
Date: Mon, 13 Jul 2020 10:30:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CA+MHfou6ijtwjzWye6CKaqTa4sKxF1WmgH9juaSdO344uP2UZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zHDk+L5VNwiG

On 7/13/20 10:06 AM, Erik Smit wrote:
> Hi Cédric,
> 
> On Mon, 13 Jul 2020 at 09:52, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> With this patch, the supermicro firmware boots further but there is still
>> an issue. It might be the flash definition I used. The machine is detected
>> as an AST2300 SoC which is weird.
> 
>> BMC flash ID:0x19ba20
>> Unable to handle kernel NULL pointer dereference at virtual address 00000000
> 
> The firmware is expecting the flash ID to repeat.

At what address?

> The following makes it boot.
> Not sure if this is the right way to go.
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 8227088441..5000930800 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -1041,7 +1041,7 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>              s->data[i] = s->pi->id[i];
>          }
>          for (; i < SPI_NOR_MAX_ID_LEN; i++) {
> -            s->data[i] = 0;
> +            s->data[i] = s->pi->id[i % s->pi->id_len];

Interesting. It makes sense to read the ID repeated (not sure
your patch is the safest way to do it).

I can't find the time to add a generic NOR flash device :/

>          }
> 
>          s->len = SPI_NOR_MAX_ID_LEN;
> 

