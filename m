Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp4091669njn;
        Thu, 16 Jan 2025 15:22:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVAHih+NII7T+FJWOjKrEGW0FkyDsso7QaIxpO0Llyfmqs+3Kc9YEf7bak6+Qn4TFMS75Mx2Gd6QzhXwg==@linaro.org
X-Google-Smtp-Source: AGHT+IGbFOH9aet5SaE+PF7i/9hjIffG5Zv10UUXh5qXBu9pNXt2vlkeQWWHphrTeJFL8Z3mukmv
X-Received: by 2002:a05:6214:2b09:b0:6e1:a45a:f8d4 with SMTP id 6a1803df08f44-6e1b21693c0mr11366256d6.7.1737069721174;
        Thu, 16 Jan 2025 15:22:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737069721; cv=none;
        d=google.com; s=arc-20240605;
        b=IfT8al9bD67uhyAD+oYynVlvto1cePMPTocBjY7pIfQ2DE8RsNyd+TRoPogAHrd+YD
         eo+gtS0D510/WWMnQHcsygNffwhA4DxUoHw3P2LT/FgEw/zrK7DC5cco+zCD5u5aq4ks
         HkXUxZwmXxF/sXhtKmCdYMM9x5rgwDptJmxXVtmHJ+s6FFGl5xl4o6UV1/qFswa5h1qN
         HoEZ2QBBSUz6Jh5uFXBjNHRe5auOF/ybUZQ3tyLpFMG4c7u5GFWi00pDYf3+CU349/9W
         AFdW0BNdFFFtZn1HoKfhdv6ZCQh8eKMFlFbV4G+WenIk0MkDGvy/pLj3fOdEGD2vY55u
         aZjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:references:in-reply-to:subject:cc:to:from
         :date:dkim-signature;
        bh=fYe+XSjSei7dwlYLiMPvIvsafese8IALlVr/aMTToto=;
        fh=Lg2OpC5lIOrbU/ip5q2MKC4kI5coDv+QfkIyUmE3iI0=;
        b=SSil1Uq4ZFw/lhRTwrzvD88URAdYBCbgsMFwznfAtWmdSmZ5Z41am3tOFPo9PIPVBc
         r8G1nHIg9YHYwx+XSZ5KETZayyjnVlSCtQ9v7uupv+8MMIL6qAQNfkhV0yawnE/ktZP3
         cJKOa8ZuJgAS1sA1tVqj0lkJ4djyJ2S/BSduOqHguB5uLpDDjp/NStlj9Pj4ryA906Fw
         iT44nfbvGE5Rwxim2jRRZqjTzIqxKkVX8/Sg6upzDZe/mZgZq1/js6buKx1zfqGcuh9+
         j89zRYi5I/5ooC9MOj1noPyF6KF9yq5IsvVIIC7s5Ni6OLkJUno4HQHayjAL6LEgdwza
         i1Tg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=UTsoXrSg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e102f2f29si9917721cf.73.2025.01.16.15.22.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2025 15:22:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=UTsoXrSg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tYZAn-0000jO-Tw; Thu, 16 Jan 2025 18:21:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tYZAY-0000iX-NH; Thu, 16 Jan 2025 18:21:00 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tYZAW-0007aP-Sf; Thu, 16 Jan 2025 18:20:58 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5d3ecae02beso2112882a12.0; 
 Thu, 16 Jan 2025 15:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737069653; x=1737674453; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fYe+XSjSei7dwlYLiMPvIvsafese8IALlVr/aMTToto=;
 b=UTsoXrSgJY12EpIWYsjFs05o68vNbRfytkp+r1QMIOtVFM5ucdFIqne66PVIPjz1j+
 EeJIjD75djI1tPntrQJ/gLQDsKs1RBpwDxtpY3ffC2Oj1r55old0tgmJhDgmbl6tb+pU
 NmlM97cEg/HjSGEM17soS4i27D6gm14pbOz7pg7MiIxWSwrIWPlZXRYzyUTLDdDIc21v
 X5oLsmv8RNVZNL3GRWEp7BMDIne5SQ0mowkaGJw/wme4QfrNPVW/Mq09J6N6DEmG6C9G
 Xh0GbftcD7lfHNlGpOnn1KQD9Rb/BC1nDxkU3GDH1rw4lZ3/6Xt12u91ovywRvjLSiIl
 dwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737069653; x=1737674453;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fYe+XSjSei7dwlYLiMPvIvsafese8IALlVr/aMTToto=;
 b=Xmdhf2ZmTjgcLNT8mdnzedJ0YaXxqQvndoKVXgpdYpTUSZNCsGSR4lsIzsBziTqikP
 lDS7jF0P/iZhaqWYthyTQNYysFFvvYL/Rrot8B0FLToIJfFHRQEJrHjx7MspBxEe3rIf
 w0id/JqPgKbRbjx6HGanqBjrx5dN/lPmI2PxcqHWW3QN91iVJTBOMFHNXcFhfIqwFYxK
 JG2vkvharO9yrIWv+TKZmJuQzXPJ3RlHVKCmgH6bUmAzAAsfeQir/UsXswV2IYW3t3A1
 6jR4kI/XQW9P8GQYghJny0xhyxx4rhpYypckBz6Q/mrxQQEq/9ADtmir8Smz4ZxMfO8/
 Yhfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhNjCrtA6HJeT7C4l0kzQA+6AXDW3Ht5bBXl1gI1axWfurvsvFo8+QW6g/IdkDTm2f4kLFnmUkfg==@nongnu.org,
 AJvYcCWJMmuYUFT9gugXEWmEYaOt89FK7QlVZh4aqupHOXOZ3akUw1fIiVMjilw0PQ3RgYmTmn8gMak4fp0Ajg==@nongnu.org,
 AJvYcCXx/kd0NqAOvTTFKBVIBTm3x/NmFr0dNpTyF8Do1zpgYU7EX9zrT3YOeqk20hxWf1wH4g89nY5ZLoW0dw==@nongnu.org
X-Gm-Message-State: AOJu0Yza4c457skApsfFC3N/6X2J4nkNlIcYNLhvdf5lDFbBt2Brdzt0
 xZvL5gxeN1dcKvz11vyHt9XlPdSscD15Ghw0DbTiLqIxpus4SprK
X-Gm-Gg: ASbGncvSigcDKE/Lw09A1S2jZgvd9GBW+u0vpIKAb3ryuldb8wyZ19G6FW5h/zDbEbH
 xqktSPb/QwCE517XFPk0yRWfW3nkwPTDjeKS/a+5eHBbXx96ktbVNd6EZsMOVQGH6CX/0cgCFN2
 k/Zi6jv5VAJFuTH0dgFqmO+ZQJ1GF81mYQc3q4sQS8xl8Qew/E/9hNiLkBglMGDsrPnfj052i9u
 f0Qe0ICWn9ceD6sv53uXIosn6OOnMbOWrNpUnpQbCfmSuKLstH6tS+PHz6l/uZw2K5vBWdmU1WR
 SQwMb80btC/cFSE1Ik0IaMHp9VY=
X-Received: by 2002:a05:6402:3550:b0:5d0:b925:a8a with SMTP id
 4fb4d7f45d1cf-5db7d300e84mr437549a12.16.1737069652522; 
 Thu, 16 Jan 2025 15:20:52 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-055-006-027.78.55.pool.telefonica.de.
 [78.55.6.27]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5db73eb5966sm556158a12.56.2025.01.16.15.20.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2025 15:20:51 -0800 (PST)
Date: Thu, 16 Jan 2025 23:20:50 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Bin Meng <bmeng.cn@gmail.com>, Fabiano Rosas <farosas@suse.de>,
 Guenter Roeck <linux@roeck-us.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_08/14=5D_hw/sd/sd=3A_Allow_for_inverting?=
 =?US-ASCII?Q?_polarities_of_presence_and_write-protect_GPIOs?=
In-Reply-To: <e202623e-eac7-4ed3-87fb-002491ddf745@linaro.org>
References: <20250108092538.11474-1-shentey@gmail.com>
 <20250108092538.11474-9-shentey@gmail.com>
 <342ca371-3e14-4108-9c45-e15cda51b9ca@linaro.org>
 <FBA535B4-8191-4CEB-905F-FA4C3416048C@gmail.com>
 <e202623e-eac7-4ed3-87fb-002491ddf745@linaro.org>
Message-ID: <6AF83F55-5BFF-438D-AB05-5403D619B403@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UlOI2uzyKkdk



Am 12=2E Januar 2025 18:06:04 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <p=
hilmd@linaro=2Eorg>:
>On 9/1/25 17:20, Bernhard Beschow wrote:
>>=20
>>=20
>> Am 9=2E Januar 2025 11:40:10 UTC schrieb "Philippe Mathieu-Daud=C3=A9" =
<philmd@linaro=2Eorg>:
>>> Hi Bernhard,
>>>=20
>>> On 8/1/25 10:25, Bernhard Beschow wrote:
>>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>>> ---
>>>>    hw/sd/sd=2Ec | 12 ++++++++----
>>>>    1 file changed, 8 insertions(+), 4 deletions(-)
>>>=20
>>>=20
>>>> @@ -876,8 +878,8 @@ static void sd_reset(DeviceState *dev)
>>>>        sd->cmd_line =3D true;
>>>>        sd->multi_blk_cnt =3D 0;
>>>>    -    qemu_set_irq(sd->readonly_cb, sd_get_readonly(sd));
>>>> -    qemu_set_irq(sd->inserted_cb, sd_get_inserted(sd));
>>>> +    qemu_set_irq(sd->readonly_cb, sd_get_readonly(sd) ^ sd->readonly=
_active_low);
>>>=20
>>> Please embed in sd_get_readonly(),
>>>=20
>>>> +    qemu_set_irq(sd->inserted_cb, sd_get_inserted(sd) ^ sd->inserted=
_active_low);
>>>=20
>>> and sd_get_inserted()=2E
>>=20
>> Are you sure? I deliberately implemented it as is because embedding wou=
ld change the internal logic of the device as well as SDCardClass::{get_ins=
erted, get_readonly}=2E
>
>Yes, this is why I requested that change=2E Why don't you think it is cor=
rect?

I'm asking because I think that moving the xor inside the methods would br=
eak the device model=2E

The goal of the active_low attributes is to invert the polarity of the GPI=
Os only which allows to model boards where these are inverted=2E IOW they a=
re intended to influence the wiring=2E That is in contrast to the two metho=
ds which determine the internal logic of the device model=2E They are also =
used as virtual method implementations of SDCardClass::{get_inserted, get_r=
eadonly} which determine the logic of the sd bus=2E Moving the xor inside i=
nverts their return values if s->*_active_low are true, effectively flippin=
g every if statement, which seems wrong to me=2E What do I miss?

Best regards,
Bernhard

>
>>=20
>> Best regards,
>> Bernhard
>
>>> With the requested changes:
>>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>>>=20
>
