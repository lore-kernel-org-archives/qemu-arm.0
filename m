Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3001946njk;
        Tue, 28 Jan 2025 02:35:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV+1FPkfI1BDiNMffwWyGytVga7bQUwctRDLfX8TCHrRlnOWbYntYXTcz1RV8xfqidDKL3ceavefDNVIA==@linaro.org
X-Google-Smtp-Source: AGHT+IFMCteO+JtInDDmwIpR9c3ib9NuDKyhkCRt32XmKWkC++mOkVEcvkduYQG7u1m8XcieWfAC
X-Received: by 2002:a05:6214:242b:b0:6d4:3b7a:313a with SMTP id 6a1803df08f44-6e1b21c4a7amr792176216d6.32.1738060503068;
        Tue, 28 Jan 2025 02:35:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738060503; cv=none;
        d=google.com; s=arc-20240605;
        b=euIc0SWuiNda+r2LdrQWSinda1HwHBn6JqxiglyruCwspKdZfeCCyLZWgGyOX27RW3
         cEbwz94dS0D2jgiAxqJQSlOB4zDnu0ak34D9jMsbZZKi58RchasdxSmtzW40JCfFoDbP
         qaamSENQY2c4xDNuRzdYcUo7bu2RusTzdOFlVSCaEc+7sN3M9tbBtrDfiSenk045nRZX
         n/dDgPYApQpKT3Ix+j/bKZtmJukoZh3ZO1vEq046DZL0Lqkwe6zofEWQWmTf9n08EhlK
         xA/xKv2cjhknQqh6c+fwFAQlhhItVqFtPN8Jml6s9FXgI0G+qu1JseU07zi/QY2/czXJ
         0xIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Y0OHA9rm33lGie9sv0JBjn3ZpI8DI9Dz60NLKtMDdSo=;
        fh=yvmxBhcNWFI/QXSYOZ5eSUYFe79ASvsiKiOs2ymY6XE=;
        b=M462ZzPqu6H2duf3FuwE/LdghFGV4GTM2CaIdslelOrLKxbYreEWBPLSzdiRDemsw7
         O4KDItAQWX8t7W4GR3fmnwALP8OpQrDHKXVlwKehEfkm0dDo7OfhVjvRdhMO5HkeipTP
         RtZeTl33bBvk7dLSQUC7pv4nz5KEx5NJUlQhObC4GISxDa3F71WtN7an4QvbUae9p21q
         SDQITemkDZBil5D/rSnFS1+FdeblGkfNCMOQlVWyGm+oaOok4BUD/Aux4shfI/0fFukG
         KNRZdOxQdGnHAYcb1W/Y3pu+JzJsUfTrpO2Farys2XtjcsltpO5ofolQ3rzc97iWkWGv
         NvKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="c8hSf/yL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e205df6112si134450436d6.240.2025.01.28.02.35.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2025 02:35:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="c8hSf/yL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcive-0006E4-Tj; Tue, 28 Jan 2025 05:34:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcivY-0006Cr-22
 for qemu-arm@nongnu.org; Tue, 28 Jan 2025 05:34:40 -0500
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcivW-0000sE-Gg
 for qemu-arm@nongnu.org; Tue, 28 Jan 2025 05:34:39 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-e46ac799015so7105776276.0
 for <qemu-arm@nongnu.org>; Tue, 28 Jan 2025 02:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738060474; x=1738665274; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y0OHA9rm33lGie9sv0JBjn3ZpI8DI9Dz60NLKtMDdSo=;
 b=c8hSf/yLjpLoWXo7RuqG41nZe5fQ1fGqs+3IWi//TbcZ1rsc42QoUKNaapafSmM+Mm
 SbEMiDZ/dYCSrnGOsIhsBOoUy/CnweaymoyhbyD5yK9zbhglAjylmgEvscEzrLKxWnTC
 7nKzlZeMdl7sGD8lwET3wvI48ItUQXUuK7AwUA46+OIFfdiEvG6UZwc6nediOXgnjP0S
 gd5qrpskOPIS4QUQO+BH9cqrWNmlAtnfHEz/YKBH+Htndyu3Gti4G9t7HO7hjMKz4T+E
 OFwTBCUnn1KFWRA5qswwkeb6n2/96C6TxfgYHcOCyh/OJbB2hMAhE+VzVgS4HZdOkXNh
 tPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738060474; x=1738665274;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y0OHA9rm33lGie9sv0JBjn3ZpI8DI9Dz60NLKtMDdSo=;
 b=lb7+cT2Rqs/2H+QndQN3zNzTVBtpXDeEWnYR9Hu8gdJoanlf1RUwrGkq0unykMmYyB
 mBOSiNgy7OITAkTMBoKTrR9H/eM5Tj/W5phLA+kYmvNSC+6XzeIiKhOFUkMyU9Xj4QfI
 qBQua7yzDXiq2r5+QsBRzu82OBGsTnYJIOHptuH+lV2TyIGBC+BP8l7ZtOLA6r0KqJxZ
 aExkCK5IAkaCS0faWJNXxke4tbylLWHpvHeCYgBi1QoMhFvIDRZJbGjFa5V/86Nbrz7G
 tp+z9n0KEpQAWk3SLjYRwSD8+WpvhlDAkEeN2exWJ9bN6YIk/2TlwPa4TBte5GFQ4tBx
 /vkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+x0nt3tDfnmC/ERkiYKU/TXIcw40XaQ5+t3hfjGpd4sxB9LjQPnwW3bMz5PcI3+2X+1Ev+GmdSw==@nongnu.org
X-Gm-Message-State: AOJu0Yx6p4ZC/9ePJTgRdQSe845KILUvqfI0N5CjkJOx8EkCsag7ijBM
 yjwTo4b3LAffhf5st32EDGX1rkr2A//rE16DdfztXCUEpcn+l8edywhYmguXNEO803Wd+lEmULh
 PJKAJQMwTLrdx9mKN9lAIoXZg700kbxNtx7o9Iw==
X-Gm-Gg: ASbGnctOym8MZ46j02OvbO0coxK/ZI/rISwQ/rdNcoU/pNMQHDR5kk2j45yww/dgVFu
 rw4jQYfwypMnz0aLloO9hEKAgH0bMWgpDk/Sj63Zq9TLr+v76CFpzVO5gbu6UUr0jz8pJiG3VGQ
 ==
X-Received: by 2002:a05:6902:841:b0:e30:ebdf:9643 with SMTP id
 3f1490d57ef6-e57b1039cc5mr33290277276.8.1738060474550; Tue, 28 Jan 2025
 02:34:34 -0800 (PST)
MIME-Version: 1.0
References: <20250111183711.2338-1-shentey@gmail.com>
 <20250111183711.2338-7-shentey@gmail.com>
 <CAFEAcA_m29rWYQPtz=xSBsS_FXb5_L6+DGBA2o_TrLcFy6YC3g@mail.gmail.com>
 <BB80F4B5-02D5-411A-95DF-9EEE91237EDB@gmail.com>
In-Reply-To: <BB80F4B5-02D5-411A-95DF-9EEE91237EDB@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jan 2025 10:34:23 +0000
X-Gm-Features: AWEUYZnFdLOz3esAFPsdw6ALQspsJMycIuoQyLwQr78QvRL3XQ3yHF1OvF1VCtU
Message-ID: <CAFEAcA-V1fuGeSRvEusMg-03rwBwLq4rKoVPcrW95ByzeQ3kZA@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] hw/sd/sd: Remove legacy sd_set_cb() in favor of
 GPIOs
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Paolo Bonzini <pbonzini@redhat.com>, Guenter Roeck <linux@roeck-us.net>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Laurent Vivier <lvivier@redhat.com>, Bin Meng <bmeng.cn@gmail.com>, 
 qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: cj52nbP5pN+y

On Mon, 27 Jan 2025 at 23:11, Bernhard Beschow <shentey@gmail.com> wrote:
>
>
>
> Am 27. Januar 2025 13:24:46 UTC schrieb Peter Maydell <peter.maydell@lina=
ro.org>:
> >On Sat, 11 Jan 2025 at 18:37, Bernhard Beschow <shentey@gmail.com> wrote=
:
> >>
> >> Commit ce5dd27534b0 "hw/sd: Remove omap2_mmc device" removed the last =
user of
> >> sd_set_cb(). Rework this functionality into GPIOs.
> >>
> >> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> >
> >What is this for? We have a non-legacy API for "the SD controller
> >needs to know when the SD card is inserted or the readonly
> >status changes", which is that the controller implements the
> >SDBasClass set_inserted and set_readonly methods. (See the pl011
> >for an example.)
> >
> >I would prefer it if we used that consistently, rather than having
> >two mechanisms, one using GPIO lines and one using class methods.
> >I think we should delete the sd_set_cb() API and handling code
> >entirely.
>
> According to the Linux MMC controller DT schema, there are actually two w=
ays to implement cd and wp lines [1]. When implementing the imx8mp-evk boar=
d, I thought I would need to model the GPIO style [2], hence I implemented =
it plus the active low part on the SD card. Later I noticed that the card g=
ets detected anyway without the GPIO wiring, so I'm fine if the code gets r=
emoved instead.

Even if you did need to implement that GPIO wiring, I think the
right way to do it is for the SD controller to implement a
subclass of SDBusClass so it can have its own implementations
of the set_inserted and set_readonly methods, and then it
is the SD controller object that has the GPIO lines, not
the SD card itself.

(I have a series almost ready to send out which QOMifies
the omap_mmc device and then deletes the "legacy" SD API,
including sd_set_cb().)

thanks
-- PMM
