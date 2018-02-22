Received: by 10.28.71.27 with SMTP id u27csp2112021wma;
        Thu, 22 Feb 2018 07:54:52 -0800 (PST)
X-Google-Smtp-Source: AH8x227NoAM2K9yu59Iy4Voi/5IgRhXZ6OqFPNtxBKb2LlqBThPNESOpovdOsJzAs6cgUsbiICR/
X-Received: by 2002:a25:808a:: with SMTP id n10-v6mr4998747ybk.230.1519314892422;
        Thu, 22 Feb 2018 07:54:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519314892; cv=none;
        d=google.com; s=arc-20160816;
        b=XGUfrWpnOF1qI/jHaUo/Uf4kmmfjzXOLlW8cpJIsIjziyNYOqxpg1yh4mOHJi2Utx5
         aYWmK7TOj7mWAZa6rizMpwZAnN5gltm8nQ7Zbd1vWRNLVvzWB/DEWaC2Bo6X7MA8hwms
         suZmBH7Z3l3PAgdmxBQHIc9qj0+NYilrp9vhcq9BAOMjhEyy8Kubd4dGEC+VfipLJQJS
         lHcefOmWPRm3zxAU7gI9zXFKNIHBxTdjpiG/cBi1KKfkWZFWBbgBbs8yNTa0KeaVS5SR
         8X6qkUhT8rSYK7gtFc6tmxV0lH9xyMBoT4iiihdjyyEf57DWDVUMxcK6StW7gS81hOjV
         MUlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=gfQD2oEivYEZhs7ebW0NrQNmmRkA5yCjPbt4JEz82ns=;
        b=j9rOA/janI9lCb6m/Vdrej090WDdPb5EpQrvuIDUnqJi8aK+F2+fQ9+4hRThb4svEW
         qmyHiK+rf3vWzRgkCGEZcS87h7NHGgBCScpxD1HeCUu2CIte1ftc5UDvB/K7z8kLNGcD
         qmL9KGfJRsrdVMLrqyhYg6NLstXs66up0NHceXD7Iv5NoCndyxuypPTVN9Z2VKajVSyI
         eEY5YmRA/WP4eOny9PeC1Nag4ZOHCQ22Tpn4kLpPiosOmQHQ59/jmhzWxiSm8hCodP6m
         2gfSWqKVgi/l+BqKVnWH2neNoqN9+sH55h0CWwYVR/QijAPtCG0AI3xvZiVOuc89b2Ca
         ARgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JMjCRmN5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f185si57219ywf.247.2018.02.22.07.54.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 07:54:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JMjCRmN5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39160 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eotCt-0007NU-QD
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 10:54:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eot3I-0007Ud-Vk
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 10:44:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eot3I-0006ZQ-0a
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 10:44:57 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:34453)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eot3H-0006Z1-Qt
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 10:44:55 -0500
Received: by mail-oi0-x243.google.com with SMTP id c83so4011303oib.1
	for <qemu-arm@nongnu.org>; Thu, 22 Feb 2018 07:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gfQD2oEivYEZhs7ebW0NrQNmmRkA5yCjPbt4JEz82ns=;
	b=JMjCRmN51xk5y6ZFNga4IhET0KKD7eG+4cE8sgvtczB+HuinUz5RO9GZ7QU6exps2I
	sokJ+auJBqno+3Jzx2coxj8OZS/WQujARgImyTTMiz1FHHzoZyj13ZNYLpstFkR4dGX1
	spSoOgbAmedpSCE5Id7jGZ90I2Htb3kG1d4ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gfQD2oEivYEZhs7ebW0NrQNmmRkA5yCjPbt4JEz82ns=;
	b=IhnrgNozWAkFkFCCwsu9RKUp1uGOyOQbGftcyAhvNKHL72UCkKg5doOdqUPpnDbbNq
	2pCioMvW+T/gXE07MJdW1nz38sI80XgrUk9LAhfP4Dma7pq2vo9YPRk4+76ckTZuBL96
	Eg3r0lllfadBHGywvoLylnTJBwpXdugFvR3MFENR1UYb/wrkKDOzT5ULhukqnAVfnYU1
	uPco3kjqmQbqWOyl+Sx5h6oAEMQqUvA+IcDLD+d1LJFzrm+A8pxUF7s3XONNpfLj5eWj
	6UpVcJDKzhOTJOidkyeZsQzIEvJIme+2JVhkMsTf2ZtG3jyqm3HxRUnqRj2v/UIuIFOl
	vk/g==
X-Gm-Message-State: APf1xPDXxKfN37lKwh0IpNWk8MXeUlrZdbvr5mkHLXfuFcww5T0pbC6Y
	Ry0KO6abFlPzCAytA43FyTl2vUIYj7oNKLXmSgK/RKQi
X-Received: by 10.202.68.213 with SMTP id r204mr5108400oia.80.1519314295141;
	Thu, 22 Feb 2018 07:44:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 22 Feb 2018 07:44:34 -0800 (PST)
In-Reply-To: <CACRpkdYMTojtHnafK+kMnm1G7j+9Nj=p65WLZGbrN8MJv+4psQ@mail.gmail.com>
References: <CACRpkda9B=frmS0QF429p-q+KoCKG=5NON-kQ0Rt-nba2powRA@mail.gmail.com>
	<1519053606-9817-1-git-send-email-minyard@acm.org>
	<1519053606-9817-3-git-send-email-minyard@acm.org>
	<CAFEAcA-jTZMDNTF2rPn20DjSxu=z7n9M+2xo-pNfAYoha_LuzQ@mail.gmail.com>
	<03f96a6b-3a52-0d72-e634-8b8f167f2992@acm.org>
	<CACRpkdYMTojtHnafK+kMnm1G7j+9Nj=p65WLZGbrN8MJv+4psQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Feb 2018 15:44:34 +0000
Message-ID: <CAFEAcA82fEnt6oGz7O+zPZ2+zoZmhm0J6rAioX6SmJwoSykuGw@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/2] i2c: Move the bus class to
 i2c.h
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Corey Minyard <minyard@acm.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NkZad6uya7en

On 22 February 2018 at 15:39, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Feb 20, 2018 at 2:06 PM, Corey Minyard <minyard@acm.org> wrote:
>> Linus, Philippe, do you want me to submit this, or do you want
>> to take it?  You can pull it from:
>>
>> https://github.com/cminyard/qemu.git tags/i2c-bus-move
>
> I don't have any commit rights, if you can push this to the
> QEMU master I will happily rebase my stuff and resubmit :)

I suggest you take Corey's 2 patches, add them to the front
of your patchset and add your signed-off-by line to them.
That way you don't have to wait for them to go into git master.

thanks
-- PMM
