Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp1172759lfq;
        Thu, 24 Feb 2022 11:22:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzA11Mo/dohbljPvaH7ICVktOD8rL5PCAJA4Bmbqz0QsLW2UM6e3tKppyvMTZwqn4scgn+
X-Received: by 2002:a05:620a:1350:b0:507:ccf0:60f3 with SMTP id c16-20020a05620a135000b00507ccf060f3mr2522495qkl.529.1645730543327;
        Thu, 24 Feb 2022 11:22:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645730543; cv=none;
        d=google.com; s=arc-20160816;
        b=pGDgaz/sXmJN+z18/73tEv34iKuo+6GuATbJ2oijn+UsgNHXNOG7BItx9ZjWwp5lb2
         8F1jqxhnembMrzoihGfPg5Ul+HJvDLY44iZjZPMHDtAJyG+CiVs6y+Gj4m+c/xaLpjCc
         TPbU2bwzOZmOEt8okaeurf1sr9TwZVWMLp2UThZKe5j205rsupJpHJjW4QFEu9F+kQfH
         s5tsnxYmq641fUFFc4Ojlf96rhndSYKgL8bZwZdhngrOUBb30AYMqAN2JOHuQKXDFgR7
         0n95FJIq6K8zMBoWxcZGae/YdRgLy1gLmFJTzrDzYAy+fJxfHch+CWegM2hymqNxtWDk
         lScw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=wDSBMYcb6tkoi0hrlkLAMkcZIEKb67DacdYnNK1Yf40=;
        b=ZRfLWqtflxyHLc6ofo9Vp8aEgRU0kx/8f7mrHqxQQ5IzqpALD6vYsqbXE23Anuu2rZ
         D/YqOsWzGFLi3XhLHiRt6Tra62p8wC4edisOdhyMzf/TgLW+ZcMAIz4fRGSfFK+YiEdd
         6W7RkCfvglSsahBfNGGtGfSxZFQ2oLQ/Ysn0DxO0mCz91ivbqaOKyRe6/1mGhwmQMzJv
         QZlguogTwDJiuqxPrJrL2225IelsauVISEiASnCcR0rfq3MBi9X/h6zApBr6HpjoYZpn
         9PD4wqRKQOWjDxecr/flq2InkPDhdtzTh2JtUpyAAaQSrPPYoM5K/aNyjnWM2wXi7EYS
         jg5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Nf9UcntK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9-20020ac87d49000000b002dda3c71bb6si101604qtb.613.2022.02.24.11.22.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Feb 2022 11:22:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Nf9UcntK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:56614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nNJh0-0002xB-Lf
	for alex.bennee@linaro.org; Thu, 24 Feb 2022 14:22:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nNJKU-0006PZ-Jv
 for qemu-arm@nongnu.org; Thu, 24 Feb 2022 13:59:06 -0500
Received: from [2607:f8b0:4864:20::e35] (port=40483
 helo=mail-vs1-xe35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nNJKS-0006TH-Gq
 for qemu-arm@nongnu.org; Thu, 24 Feb 2022 13:59:06 -0500
Received: by mail-vs1-xe35.google.com with SMTP id j3so3171675vsi.7
 for <qemu-arm@nongnu.org>; Thu, 24 Feb 2022 10:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wDSBMYcb6tkoi0hrlkLAMkcZIEKb67DacdYnNK1Yf40=;
 b=Nf9UcntKzaAaAODI5RM0dZGM9wvf1d+J9RcPWePEfxGVDqQO9dTSuKBZPz9Ix5dPU8
 TgbNLXsn4GRQVWD64h/O9n/+r7AxDb/fswbpK8OuUGMZAULmRWaumBnQxRc81ujXHmoc
 FcgpFKx6BC062x8YCskQqi2PpWVwlD0vfFoD87CIQibEdCpPFFME5aDiUR95GptCuyoo
 MHxFKHQ2c+6FYpFBx3k2/8qYHbTtDHs9uUaNkn65fm+incWOyvcC6P4iW+mTjqIpQyrO
 rO9V9bJC0MpqO3kKsiwgMoSTPcY/e0mcTUEJPORCjEctvU2gS0T8I9vUI+mEnLVMQbe8
 Uf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wDSBMYcb6tkoi0hrlkLAMkcZIEKb67DacdYnNK1Yf40=;
 b=MkVCs6dH9ETohPjUBwL//rHo+/KPTwxn8pj8lycJyzf8oP1ch3wenKCMqYs5BLFKor
 +1NAToK0bc7I/fE7Fk7o8U/rpC3DpMcZ62pjk2ai29QdshE82+CpSPXBc7QV44fqiTDJ
 hF8CMey1zefGX9Cb7QoLNw05T00VkQ6gZ2yYRV0cKm2bBPycc/fyLWHkiXxbMpZHpitM
 3LZk3Vo0q/rJRPl/KOSdCKe4mMJJGi8CwzIl1Cntq3I1xSleAXofPkjUmcPs+3mhbQtf
 KK0dm5pP7ilxehZ5FDgbA5jWNWZuV7I5o2yAiDqqjcfX9dc+swMva4fTcah4b1Y17192
 PR+g==
X-Gm-Message-State: AOAM532sJ6bkOsmo/MZmIF1IbbBwHa+2KvHaJqIaL5aebkQ4SVvBcunS
 KTNX+7YBQbkTJFZ2EMLtCpsR6Q6p5vKDpnURK2D3gw==
X-Received: by 2002:a05:6102:356c:b0:31a:fb45:b81c with SMTP id
 bh12-20020a056102356c00b0031afb45b81cmr1700255vsb.35.1645729143422; Thu, 24
 Feb 2022 10:59:03 -0800 (PST)
MIME-Version: 1.0
References: <20220106230936.417020-1-titusr@google.com>
In-Reply-To: <20220106230936.417020-1-titusr@google.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 24 Feb 2022 10:58:52 -0800
Message-ID: <CAO=notwF3TYULgZn_w_1g-4Tq=7Fros8-jvwvm4XKaODu30ZEw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Fixups for PMBus and new sensors
To: Titus Rwantare <titusr@google.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Corey Minyard <minyard@acm.org>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000fe0f3f05d8c82c56"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::e35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=venture@google.com; helo=mail-vs1-xe35.google.com
X-Spam_score_int: -161
X-Spam_score: -16.2
X-Spam_bar: ----------------
X-Spam_report: (-16.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j/rGcZBsVFeK

--000000000000fe0f3f05d8c82c56
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 6, 2022 at 3:09 PM Titus Rwantare <titusr@google.com> wrote:

> This patch series contains updates to PMBus in QEMU along with some PMBus
> device models for Renesas regulators.
> I have also added myself to MAINTAINERS as this code is in use daily,
> where I am responsible for it.
>
> Shengtan Mao (1):
>   hw/i2c: Added linear mode translation for pmbus devices
>
> Titus Rwantare (4):
>   hw/i2c: pmbus updates
>   hw/sensor: add Intersil ISL69260 device model
>   hw/sensor: add Renesas raa229004 PMBus device
>   hw/misc: add Renesas raa228000 device
>
>  MAINTAINERS                   |  15 +-
>  hw/arm/Kconfig                |   1 +
>  hw/i2c/pmbus_device.c         | 106 +++++++-
>  hw/sensor/Kconfig             |   5 +
>  hw/sensor/isl_pmbus.c         | 278 ++++++++++++++++++++
>  hw/sensor/meson.build         |   1 +
>  include/hw/i2c/pmbus_device.h |  23 +-
>  include/hw/sensor/isl_pmbus.h |  52 ++++
>  tests/qtest/isl_pmbus-test.c  | 460 ++++++++++++++++++++++++++++++++++
>  tests/qtest/meson.build       |   1 +
>  10 files changed, 930 insertions(+), 12 deletions(-)
>  create mode 100644 hw/sensor/isl_pmbus.c
>  create mode 100644 include/hw/sensor/isl_pmbus.h
>  create mode 100644 tests/qtest/isl_pmbus-test.c
>
>
Friendly ping - I believe I saw some of these have picked up Reviewer tags,
but ideally this will get into 7.0 before next month's soft-freeze.


> --
> 2.34.1.448.ga2b2bfdf31-goog
>
>

--000000000000fe0f3f05d8c82c56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 6, 2022 at 3:09 PM Titus =
Rwantare &lt;<a href=3D"mailto:titusr@google.com" target=3D"_blank">titusr@=
google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">This patch series contains updates to PMBus in QEMU along with s=
ome PMBus<br>
device models for Renesas regulators.<br>
I have also added myself to MAINTAINERS as this code is in use daily,<br>
where I am responsible for it.<br>
<br>
Shengtan Mao (1):<br>
=C2=A0 hw/i2c: Added linear mode translation for pmbus devices<br>
<br>
Titus Rwantare (4):<br>
=C2=A0 hw/i2c: pmbus updates<br>
=C2=A0 hw/sensor: add Intersil ISL69260 device model<br>
=C2=A0 hw/sensor: add Renesas raa229004 PMBus device<br>
=C2=A0 hw/misc: add Renesas raa228000 device<br>
<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 15 +-<br>
=C2=A0hw/arm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A01 +<br>
=C2=A0hw/i2c/pmbus_device.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 106 +++++++-=
<br>
=C2=A0hw/sensor/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A05 +<br>
=C2=A0hw/sensor/isl_pmbus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 278 ++++++++=
++++++++++++<br>
=C2=A0hw/sensor/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0=
1 +<br>
=C2=A0include/hw/i2c/pmbus_device.h |=C2=A0 23 +-<br>
=C2=A0include/hw/sensor/isl_pmbus.h |=C2=A0 52 ++++<br>
=C2=A0tests/qtest/isl_pmbus-test.c=C2=A0 | 460 ++++++++++++++++++++++++++++=
++++++<br>
=C2=A0tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<b=
r>
=C2=A010 files changed, 930 insertions(+), 12 deletions(-)<br>
=C2=A0create mode 100644 hw/sensor/isl_pmbus.c<br>
=C2=A0create mode 100644 include/hw/sensor/isl_pmbus.h<br>
=C2=A0create mode 100644 tests/qtest/isl_pmbus-test.c<br>
<br></blockquote><div><br></div><div>Friendly ping - I believe I saw some o=
f these have picked up Reviewer tags, but ideally this will get into 7.0 be=
fore next month&#39;s soft-freeze.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
-- <br>
2.34.1.448.ga2b2bfdf31-goog<br>
<br>
</blockquote></div></div>

--000000000000fe0f3f05d8c82c56--
