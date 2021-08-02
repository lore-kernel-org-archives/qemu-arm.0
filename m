Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp2061876lff;
        Mon, 2 Aug 2021 16:48:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy03PYCyT5tgvTraNgNMGz4LZdY53XDor2hZ1bWqtztNACFz9/bZqzPvyGICkf3aHL/irqS
X-Received: by 2002:a02:caa1:: with SMTP id e1mr16733059jap.107.1627948084931;
        Mon, 02 Aug 2021 16:48:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627948084; cv=none;
        d=google.com; s=arc-20160816;
        b=RfzCweVKd3fJe0sHLhndMizUK2NwctUpLnK3YaXvoABC4Aiq8o67D68kCkoMW/mXrI
         SCohx6klq0wN5vZuNOTeFXoLRhfo7IlA0epZy5SZKp7K30q0mUgybLxQIjrsg2PJ4VaL
         HDZ6rwDEb0EuzyPqq/OS89thFXdaNi4G2LvNmPXOeGjlXxvFATaQwuhdLL9z1AK+vwq/
         CmIXQKA+de7KCQd5ixEthUsML+XlDmVNr8QNyUc6dPUcbtl5zespd+pVJIR3xpBfac8y
         /mmf7+2VzksSPzTyWqQEu1NTkri3PJjTYMsaLFce6Wds1Km5OObSKOdTGXzJgdbkf2HD
         anwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=2Gnh2BL/YaAev2kp7sWf6wiomBc66Ln111dWfzDoiwQ=;
        b=caUHANtqL534cAv1aZNaBwvYv+248RBoOAMh0QE/Tx2nmndFGqDQgczaQ5O8nFP4b8
         Inv61FSClVEqIe5C3D/UGD6bFwmMuyrTzq2tZ+nfGzNdNqxZkkKrP9NbhOiynVC749b4
         VtXpM4nmtjw8Uoj0wkRnemoeMVeFkv3+u+9pzaoFy9IjdJ6L5lWXDpIfhthsUUM7fHRs
         hDPGX2yBp732YM2YCpFmgHCNzWdxDvDuOlpuqVUc+WB0RsxVw0b7wflHYgvrLIXtHA+d
         w/FAcLbvUtVPn3QyEF1fOhJ7JB+uG4kq3NQ6odW43/s/kaeEqHps/d3G7MXJSEQNscdf
         rEvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=Gc5UkcGO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15si14311837ilv.107.2021.08.02.16.48.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Aug 2021 16:48:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=Gc5UkcGO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:59976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mAhfA-0007LO-5l
	for alex.bennee@linaro.org; Mon, 02 Aug 2021 19:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stmao@google.com>) id 1mAheW-0007L6-PN
 for qemu-arm@nongnu.org; Mon, 02 Aug 2021 19:47:24 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stmao@google.com>) id 1mAheR-0000xD-9V
 for qemu-arm@nongnu.org; Mon, 02 Aug 2021 19:47:24 -0400
Received: by mail-wr1-x436.google.com with SMTP id z4so23327406wrv.11
 for <qemu-arm@nongnu.org>; Mon, 02 Aug 2021 16:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2Gnh2BL/YaAev2kp7sWf6wiomBc66Ln111dWfzDoiwQ=;
 b=Gc5UkcGOU0XGthWRmUSPvH+29F++2GZP/Tcx8Ony8bbLPScdNPlqwusiJsROXScOxj
 a5JMnV56J5ZLvMsY+e+RKPP7J0/87VZupFUABthjsUXqTCicB4h8Wso9tuoYQmhz6Nf2
 RuVj/iNoOAG0J/1B43jesD7OWnRVbwhkPlf0zRPgAkrXXCi22J7riGPOYYJfspXfS/ch
 H4aZ3ZR92LBOu9003lq61zpmiNiShMi8i8PQ4zxV+wXm+pc63nGcvG5XwNc8O2S+xfj9
 zaG5oyBf1bOQ1fKy3dQ39/NvJZDIC3qiv+7p+cSA5oh5eA7Ca3O0CbShJDT4XKzqQfSg
 frlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Gnh2BL/YaAev2kp7sWf6wiomBc66Ln111dWfzDoiwQ=;
 b=SX/KP2+Tsy+ixkJliJvcAhB27UN2EBrBjKVM9J5pqnYqxBKHXMvWQeN6OcoN+3AMDh
 OqnLxfq4RKNHeWWLwQBybQYGsqlxA1usAvrYCG7HBjVCKXDouWXd07YnJZCc3xQJ+uCV
 X+SNE1Fub2pRVWimbNJCHAkL7iYNQ4CWwfMQhE2XnCQzShS+I2M7lcOVAIz0RbM3sGML
 hlX3zqyu/l12iyBUF93DzF/KxY82dzRvhKX8bEJxQTExxNuSGyv83hOxo2HxooDe7yqu
 Hg49FnudNIi+3eyqTbc1o8+DpxUEmm8IPch4nvA+18LZsG8Hht6gP1j3VeGCuszMC3r7
 Eb8A==
X-Gm-Message-State: AOAM530WxQBnAMEyS4Ozj/0hlfvcN+PLP9pmc5FeFu4QzBafmtyJKGi2
 Ae2Gq+MOa/zejmOkvD56zbDoM7UJCAWNP8722yClSQ==
X-Received: by 2002:a5d:6d82:: with SMTP id l2mr18463294wrs.225.1627948035411; 
 Mon, 02 Aug 2021 16:47:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210802230323.1164787-1-stmao@google.com>
In-Reply-To: <20210802230323.1164787-1-stmao@google.com>
From: Shengtan Mao <stmao@google.com>
Date: Mon, 2 Aug 2021 19:47:04 -0400
Message-ID: <CAMiADQ_85zWP+mLKL5JfcWr=xSr3+32mFag6Dd7zL8by4+AAXA@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] Add remote I2C device to support external I2C
 device
To: Corey Minyard <cminyard@mvista.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Chris Rauer <crauer@google.com>, Hao Wu <wuhaotsh@google.com>, 
 Patrick Venture <venture@google.com>, maoshengtan2011@gmail.com
Content-Type: multipart/alternative; boundary="0000000000005dc76d05c89c30bc"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=stmao@google.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 14oPHy1twbqE

--0000000000005dc76d05c89c30bc
Content-Type: text/plain; charset="UTF-8"

This patch set was sent in error (duplicates and bad version names). Please
ignore it.

Sorry for the inconvenience,
Shengtan Mao

On Mon, Aug 2, 2021 at 7:03 PM Shengtan Mao <stmao@google.com> wrote:

> This patch implements the remote I2C device.
> The remote I2C device allows an external I2C device to communicate with
> the I2C controller in QEMU through the remote I2C protocol.
> Users no longer have to directly modify QEMU to add new I2C devices and
> can instead implement the emulated device externally and connect it to the
> remote I2C device.
>
> Previous work by Wolfram Sang (
> https://git.kernel.org/pub/scm/virt/qemu/wsa/qemu.git/commit/?h=i2c-passthrough)
> was referenced.
> It shares the similar idea of redirecting the actual I2C device
> functionalities, but Sang focuses on physical devices, and we focus on
> emulated devices.
> The work by Sang mainly utilizes file descriptors while ours utilizes
> character devices, which offers better support for emulated devices.
> The work by Sang is not meant to offer full I2C device support; it only
> implements the receive functionality.
> Our work implements full support for I2C devices: send, recv, and event
> (match_and_add is not applicable for external devices).
>
> Shengtan Mao (1):
>   hw/i2c: add remote I2C device
>
>  hw/arm/Kconfig                |   1 +
>  hw/i2c/Kconfig                |   4 +
>  hw/i2c/meson.build            |   1 +
>  hw/i2c/remote-i2c.c           | 117 ++++++++++++++++++
>  tests/qtest/meson.build       |   1 +
>  tests/qtest/remote-i2c-test.c | 216 ++++++++++++++++++++++++++++++++++
>  6 files changed, 340 insertions(+)
>  create mode 100644 hw/i2c/remote-i2c.c
>  create mode 100644 tests/qtest/remote-i2c-test.c
>
> --
> 2.32.0.554.ge1b32706d8-goog
>
>

--0000000000005dc76d05c89c30bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This patch set was sent in error (duplicates and bad versi=
on names). Please ignore it.=C2=A0<div><br></div><div>Sorry for the inconve=
nience,</div><div>Shengtan Mao</div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 2, 2021 at 7:03 PM Shengtan=
 Mao &lt;<a href=3D"mailto:stmao@google.com">stmao@google.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This patch imp=
lements the remote I2C device.<br>
The remote I2C device allows an external I2C device to communicate with the=
 I2C controller in QEMU through the remote I2C protocol.<br>
Users no longer have to directly modify QEMU to add new I2C devices and can=
 instead implement the emulated device externally and connect it to the rem=
ote I2C device.<br>
<br>
Previous work by Wolfram Sang (<a href=3D"https://git.kernel.org/pub/scm/vi=
rt/qemu/wsa/qemu.git/commit/?h=3Di2c-passthrough" rel=3D"noreferrer" target=
=3D"_blank">https://git.kernel.org/pub/scm/virt/qemu/wsa/qemu.git/commit/?h=
=3Di2c-passthrough</a>) was referenced.<br>
It shares the similar idea of redirecting the actual I2C device functionali=
ties, but Sang focuses on physical devices, and we focus on emulated device=
s.<br>
The work by Sang mainly utilizes file descriptors while ours utilizes chara=
cter devices, which offers better support for emulated devices.<br>
The work by Sang is not meant to offer full I2C device support; it only imp=
lements the receive functionality.<br>
Our work implements full support for I2C devices: send, recv, and event (ma=
tch_and_add is not applicable for external devices).<br>
<br>
Shengtan Mao (1):<br>
=C2=A0 hw/i2c: add remote I2C device<br>
<br>
=C2=A0hw/arm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A01 +<br>
=C2=A0hw/i2c/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A04 +<br>
=C2=A0hw/i2c/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 +<br>
=C2=A0hw/i2c/remote-i2c.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 117 +++=
+++++++++++++++<br>
=C2=A0tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<b=
r>
=C2=A0tests/qtest/remote-i2c-test.c | 216 +++++++++++++++++++++++++++++++++=
+<br>
=C2=A06 files changed, 340 insertions(+)<br>
=C2=A0create mode 100644 hw/i2c/remote-i2c.c<br>
=C2=A0create mode 100644 tests/qtest/remote-i2c-test.c<br>
<br>
-- <br>
2.32.0.554.ge1b32706d8-goog<br>
<br>
</blockquote></div>

--0000000000005dc76d05c89c30bc--
