Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5910652lfk;
        Mon, 15 Nov 2021 06:06:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwAVkJrwjJoOB7UP+o2qDnDEa0ga/PCF32ZK7J8dXVacAtebKKp1kqHXmx01uo+W6iEO+M8
X-Received: by 2002:adf:f08d:: with SMTP id n13mr49189809wro.395.1636985198397;
        Mon, 15 Nov 2021 06:06:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636985198; cv=none;
        d=google.com; s=arc-20160816;
        b=t3E2zAaNQnuTpQLCtFtkhr5aGfvui41cz/r03EouvIPqUkj9R05l3bJ0DstdbfFgLK
         EsWIbZ/scULtqiedeVDujOf1huwmyIF6rMc6icphExxPcMp4D3RwfvYT1N+oyD+vYTmM
         3In9DhJY5tYDBuUomlcSI0TdvkTaHPKlZbARbfb2AHSZcj0ARFPsRjlpmUf/z/4t0XMd
         ZGDhn2OHA56L+lT4M5PoaGn4JfOpsL0F2Cr2q2oo3ZL4NwLQ5PNGzwXV53eZbJqei/p2
         VYoOQielVSjVBCsEirM75yg9bcCFGLhMSJeHEoGyygmbz9qRLFm0NgekWHKwKLZ80Sl4
         twCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RY2hRT48gdZJuYsWLkZG9JkbwGwmtcjgFQte940q5f8=;
        b=m9FMPMiaNpN2CNsG26BeHREjM2Vt1CVatg04wcwlLf8/qMvDBaPM9ta9m71Qvp288/
         gYANsGHzVWkbCuUpIcGlJjA/AC22V6XM/y6/GBVRgo5kUl+W40w50J+AWEOG/ugRjZ/i
         TupPW15fXf/raAVbDAiDfZDPVSIpXhOslyuQMxBozEJuBzCqCtYuJrRVhYjITnR89k3/
         9+nVS49gXiVmhFWDwZv+NzbE76BVnihMN0lKyjNXGy78BHV2wP16jUf8SYJclJbM+iFw
         yhtpIp30u2JFivxj3BwS5unJyZI8hz3KoqlsegC2UbeIwR4sUUbdbd3rZU2Ui2hiXGKx
         byBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VNjBZgU7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r12si11550244wmh.69.2021.11.15.06.06.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Nov 2021 06:06:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VNjBZgU7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mmcd3-0004W7-HQ
	for alex.bennee@linaro.org; Mon, 15 Nov 2021 09:06:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmccY-0004VK-HD
 for qemu-arm@nongnu.org; Mon, 15 Nov 2021 09:06:06 -0500
Received: from [2a00:1450:4864:20::32a] (port=43988
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmccV-0000Kf-1j
 for qemu-arm@nongnu.org; Mon, 15 Nov 2021 09:06:06 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so12556671wmz.2
 for <qemu-arm@nongnu.org>; Mon, 15 Nov 2021 06:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RY2hRT48gdZJuYsWLkZG9JkbwGwmtcjgFQte940q5f8=;
 b=VNjBZgU7EsObm+wER0S9dsO7xHS90Ov9HOVnkMtAlQO+HKEMZNUxrXvtVytz58f0bp
 YMaBTWe12XsEAlFBy3Y2jXxONJk70Xa9d1gCnoo7rs3pX1ctzWVdxHl4byL933FtjSRg
 zL8e5PNqXlpWVnYKlgLywQgmiLHWv9sEmIPgjGDb62+gHpKRJYsEiON8URzwB/94EukW
 fR01RFouBgrxvl8J//Cj04lOehafTEZfLjSAB1mxk5MB6tF1wzkTx0jY7Sb06hSjAv0g
 zo0TnnZZQUm79At/6aW68hgASL6VbCT20XhGzCtDm6Hv52QqmhgAQusfNKcETL3F2QlS
 HpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RY2hRT48gdZJuYsWLkZG9JkbwGwmtcjgFQte940q5f8=;
 b=GocCzJRccU38u/UDFLNJhegfh2YJ3JgkelKA55XUI/UD566kKy2WIpJxQKrj/MW/Sl
 dkKbMIwLGu7qQiMszcK6D6p1iOB9HVMcXB9MFngKDH8sR55T9q0aN2yjOb7vnUVlGbEo
 XLbYd8okGfMYuITwS5gIkZBey1jO0gTVHVGJT6q1sd/ZHVg9us77F+Kr1jOY9roYvPYM
 ywiEVwiXPmXhuwF8T/ojF0E0+mjVA+EOnbTRSOFUc5ycLLdWhY8rmcuUuI+vnCHOsKS5
 Aoi5gr3xaAdblYB3hitG+FGu25LPkvKxke240dSYq+uhPJXLwqyVq+KLXxuVr+meBj+t
 95eQ==
X-Gm-Message-State: AOAM531gExHwgs0eo68Su09h7k3pNYn0RR1S2SqMxLK8I4VtnUGAS04t
 jRwpQu5Zmrqn5+velQZ+HVHNQyFNDTi6VrRWBYXFsg==
X-Received: by 2002:a05:600c:1993:: with SMTP id
 t19mr60223753wmq.21.1636985161288; 
 Mon, 15 Nov 2021 06:06:01 -0800 (PST)
MIME-Version: 1.0
References: <20211115125536.3341681-1-armbru@redhat.com>
In-Reply-To: <20211115125536.3341681-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Nov 2021 14:05:50 +0000
Message-ID: <CAFEAcA9gQCQv7XENgT-ap+2qhiggZTt-yEHQ1WJ6__5hHRRU1A@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] Eliminate drive_get_next()
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, sundeep.lkml@gmail.com, qemu-block@nongnu.org,
 andrew.smirnov@gmail.com, hskinnemoen@google.com, joel@jms.id.au,
 atar4qemu@gmail.com, alistair@alistair23.me, b.galvani@gmail.com,
 nieklinnenbank@gmail.com, qemu-arm@nongnu.org, clg@kaod.org, kwolf@redhat.com,
 qemu-riscv@nongnu.org, andrew@aj.id.au, f4bug@amsat.org,
 Andrew.Baumann@microsoft.com, jcd@tribudubois.net, kfting@nuvoton.com,
 hreitz@redhat.com, palmer@dabbelt.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ygI1eY2unhZk

On Mon, 15 Nov 2021 at 12:55, Markus Armbruster <armbru@redhat.com> wrote:
>
> This is RFC because I'm unsure about the removal of
>
>     /* Reason: init() method uses drive_get_next() */
>     dc->user_creatable = false;
>
> in PATCH 1.  Both users appear to wire up some GPIO.  If that's
> necessary for the thing to work, we should just replace the comment.

Looking at the code, it sort of is and sort of isn't. The GPIO line
is the chip-select line. If you don't connect it then (because the
ssi-sd device configures cs_polarity to SSI_CS_LOW, requesting an
active-low chip-select) the device will always be selected. If
the machine created an SSI bus with no SSI device attached to it
then in theory the user could create an ssi-sd device and connect
it there and have it work. But in practice it's really unlikely:
machines create SSI buses with specific wired-in devices on them,
and the guest OS knows what it has to do to enable the chip select
for the device it wants to talk to (often some known GPIO pin on
a GPIO controller).

So I would keep the user_creatable = false, with a reason of
"user should wire up GPIO chip-select line". But see below for
a pile of contrary precedent.

(The chip-select GPIO is created in the parent class, incidentally.)

> Aside: there may be devices that need manual wiring to work, yet don't
> have user_creatable unset.  Bugs if you ask me.  I don't have smart
> ideas on how to track them down.

Me neither. I notice that the TYPE_M25P80 is also an SSI peripheral
with an active-low chipselect but that one doesn't set user_creatable
to false. TYPE_SSD0323 also is user-creatable and that one has an
active-high chipselect, which means the user can create a device but
it will then never be usable because it will ignore all transactions.
(More generally, looks like most subclasses of TYPE_SSI_PERIPHERAL
don't set user_creatable = false.)

-- PMM
