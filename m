Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2768561njk;
        Mon, 27 Jan 2025 15:11:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU5F1tqE80VioPQ4QmIXvH6E4ZEV4pZ/qjs6Dm07Gb+l0NN5LcfnpQvYliPD9e3g3oGjD9DkjNhdaVmXA==@linaro.org
X-Google-Smtp-Source: AGHT+IFA+v5O4Sts9VLlHLmwqWk4PWxTF2ZWZRny+R1mS5Cu+/4e3Ngh/+DNHKWRH/fU41S5/+bU
X-Received: by 2002:a05:620a:1790:b0:7b6:d089:274c with SMTP id af79cd13be357-7be6320bb6dmr6447397285a.34.1738019496980;
        Mon, 27 Jan 2025 15:11:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738019496; cv=none;
        d=google.com; s=arc-20240605;
        b=I5vIfr+naZEr4j6RTHiNxGCCTMXr7kXV/cAa1e85AHuHYooh5/YTD8pz0wnxTcGM/W
         ZGaNIdKar10TsjnGrwZV4SHXRLN+M78qgqnsLnV3E8GYdLGYzUpgZWkKbuIpHWHlNjev
         J0wMJa2hNMFFwtZI5o7crXqCODns0c/3gkh+R8LtSnx1qrEiNOJuhyJj9r5ZXW69PZHk
         Ae5ZICUw9I36gt+8oswSLdZn4hC7QLXSHf+ajBT4aSuKWdNDEOzKAz23rTPJ8CT45GlD
         LcA/FMohuHoxsHn+kTsMj++ewgz0bRT8NP4Uie6ktWOoii+lPWeieg6BOnhj+GYkJhUt
         DShw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:references:in-reply-to:subject:cc:to:from
         :date:dkim-signature;
        bh=5OAcb13yKxdtvwr2trvtvKYqKmZygughFPR3uezWb2o=;
        fh=akSPYYc8WOW9oUtIRkjL8jn5ixumBg4OEAlVpDeko5c=;
        b=kD7COQyemtHsXQNfZYCsPDBa/xU10OLitpLVvO4fZA/xuhaMqCb91gFSMxMNkHlRMA
         YWFZ+010AppDy8Fbtm4fmOopF7VcNxMeesBoF5L9YGRGFJDGj4XmZzA2EAYG20Ze2Fen
         OXwRHxv7t8TXnmghyNmvFhz3uUDBlJMoem7yBoSoGmYOlzf/04aVzffoHU2me3L6Q/oI
         1JmFSJYr/ufy5+AmfSpKA3CLujjILTKsR6GkSUZ73m5Iowx2siK7tTx8NSSxjJHZhfJX
         yQV/a8S9BUtgeoFhteX/6cLoAunxU5Aysk3+osRrmJuz2/Zxcr1EpGCpAL881x34HGTl
         oO5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=AHJTqJgd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9af1146csi1054121885a.475.2025.01.27.15.11.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 15:11:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=AHJTqJgd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcYGE-0003sb-56; Mon, 27 Jan 2025 18:11:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tcYGA-0003rx-KP; Mon, 27 Jan 2025 18:11:14 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tcYG8-0002up-SG; Mon, 27 Jan 2025 18:11:14 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5d0d32cd31aso7327960a12.0; 
 Mon, 27 Jan 2025 15:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738019470; x=1738624270; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5OAcb13yKxdtvwr2trvtvKYqKmZygughFPR3uezWb2o=;
 b=AHJTqJgdnfBILRSFFY//YvBFPV9V+8QUrdb8ZXyfvxlKKEjX/kqU3z8JGlMerqsizP
 hrUP7aZJDHFKFPlbp5OjkCPt2IKvthzTEOKShqEJxMEkwXuoaj2fABu5yytTlXW7PZGH
 P1K3evZpEwV18Oi5VD7LJF+2uesBiXZkcrQ+a9hS22RWllmZlcHdSVbY2QHIZMlZ9XN0
 oAjUFN5JTiyzfO2oao1mUPCzS930M0MzCQIDmvtLWyRlrPe65JoNMPEtPDOVSrRj0D5r
 KT41LN1Xo2AlWwwXK9Ho2KKV1IB4D9LIb+b72XXppt5LZTooceK89waDfS/PEoGGU0xa
 GrsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738019470; x=1738624270;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5OAcb13yKxdtvwr2trvtvKYqKmZygughFPR3uezWb2o=;
 b=UnRJPNgztAVfDPuavU+yPJ1z3re8iAgqKmVsHvWGFPaPSOCUTnQvenZo4LVlghAbpv
 9BCbYvhm+vzWWymy4OpnJ5oPjy0Lpao8x1kQ/xzpxk4U8HXc7LYnduUZn+bciVGRJoVZ
 JBDpfB86AwYSFXYWnGFQTGU6Affr8eXw4/hpwSH86Cmgt1TIC0namEu9CFRpTOhI0iC4
 IDDnuyGuY8OzMfDwC7pXbCzSugj3N0/km1Et+E7AFebf6dkunJ+3gzXYj1+mliReeTvo
 FXQ6xaFpNKaeRbXWJPpPsFVlV1BqXqziKbZm67oaTkwp9fPCKtmPYPvoay0qhvUXUl/7
 OrpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIsK8srcFyjTdvmABLbMn0NNkAwP/R+cHZVQZEVNYtjtegEl6shTOJ6hW+kGJR8mpqZD1pBRtHjoU5lQ==@nongnu.org,
 AJvYcCXYbQpk/pDlqatL+cvAgWEZiscoKpaT28O5XzuVIJMQUPtrfc1CB3hb6uainQXA2LQA4xc3Hr8xlg==@nongnu.org
X-Gm-Message-State: AOJu0YyDezOe8VwHWeZLxgSauuXZXkBrt9QR//BL2Mw63FCgCrWDv/Jz
 CeS3w57pGOAj+D0ZjsHdcoSd40CqQprNs01w3nF6ezVmlyfgVyha
X-Gm-Gg: ASbGncsGvIy4sz66KmUQY8ECHDwtpr/CPwru04LlK2fgW/BU4glqNDFxkHTsCRMdrWW
 /SyTJzogiA3F+OAsiMztTG7LeUx4OHYBfb4WsnvpxjAkYvtVOtO+UFjbIU5ilyHWHmbPNxjJixV
 hGah+EhGeH/ydTJNMDT7gd6eFRV3i8HYf7atrVYt9hUmY2SI2YzAmqW3KL1m2oyNDHIG+kTHs/F
 MUphw1ySz6N7AmOcQAUdH/jgyhs4Lmze9rPp47xqG/oZESGRKkFqyv4L/TH4Ogi+SpkTXKnTUID
 JsbMNbmgUMabexC+1BFTTARNfUKcO1uFRf0lA7kMMp8dD6wRP1RmUbVw
X-Received: by 2002:a05:6402:1e8e:b0:5dc:1059:6b2 with SMTP id
 4fb4d7f45d1cf-5dc105a5ec1mr41869335a12.7.1738019469307; 
 Mon, 27 Jan 2025 15:11:09 -0800 (PST)
Received: from [127.0.0.1] (dynamic-093-128-047-181.93.128.pool.telefonica.de.
 [93.128.47.181]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc1863ae37sm6246803a12.41.2025.01.27.15.11.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 15:11:08 -0800 (PST)
Date: Mon, 27 Jan 2025 23:11:07 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Laurent Vivier <lvivier@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-block@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_06/13=5D_hw/sd/sd=3A_Remove?=
 =?US-ASCII?Q?_legacy_sd=5Fset=5Fcb=28=29_in_favor_of_GPIOs?=
In-Reply-To: <CAFEAcA_m29rWYQPtz=xSBsS_FXb5_L6+DGBA2o_TrLcFy6YC3g@mail.gmail.com>
References: <20250111183711.2338-1-shentey@gmail.com>
 <20250111183711.2338-7-shentey@gmail.com>
 <CAFEAcA_m29rWYQPtz=xSBsS_FXb5_L6+DGBA2o_TrLcFy6YC3g@mail.gmail.com>
Message-ID: <BB80F4B5-02D5-411A-95DF-9EEE91237EDB@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: SundPGBZeiVl



Am 27=2E Januar 2025 13:24:46 UTC schrieb Peter Maydell <peter=2Emaydell@l=
inaro=2Eorg>:
>On Sat, 11 Jan 2025 at 18:37, Bernhard Beschow <shentey@gmail=2Ecom> wrot=
e:
>>
>> Commit ce5dd27534b0 "hw/sd: Remove omap2_mmc device" removed the last u=
ser of
>> sd_set_cb()=2E Rework this functionality into GPIOs=2E
>>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>
>What is this for? We have a non-legacy API for "the SD controller
>needs to know when the SD card is inserted or the readonly
>status changes", which is that the controller implements the
>SDBasClass set_inserted and set_readonly methods=2E (See the pl011
>for an example=2E)
>
>I would prefer it if we used that consistently, rather than having
>two mechanisms, one using GPIO lines and one using class methods=2E
>I think we should delete the sd_set_cb() API and handling code
>entirely=2E

According to the Linux MMC controller DT schema, there are actually two wa=
ys to implement cd and wp lines [1]=2E When implementing the imx8mp-evk boa=
rd, I thought I would need to model the GPIO style [2], hence I implemented=
 it plus the active low part on the SD card=2E Later I noticed that the car=
d gets detected anyway without the GPIO wiring, so I'm fine if the code get=
s removed instead=2E

Best regards,
Bernhard

[1] <https://github=2Ecom/torvalds/linux/blob/v6=2E13/Documentation/device=
tree/bindings/mmc/mmc-controller=2Eyaml#L60>
[2] <https://github=2Ecom/torvalds/linux/blob/v6=2E13/arch/arm64/boot/dts/=
freescale/imx8mp-evk=2Edts#L776>

>
>thanks
>-- PMM
