Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1666339lfc;
        Wed, 10 Feb 2021 13:27:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJ9hEfGjTA2coDKFV3+UDID3IzMco36evWQ8MqO3Q5O172cA2HM46WzIAvs4XAjXBzn/K+
X-Received: by 2002:a25:d54:: with SMTP id 81mr7000387ybn.401.1612992439091;
        Wed, 10 Feb 2021 13:27:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612992439; cv=none;
        d=google.com; s=arc-20160816;
        b=0PZBK+CkRni7Aj0Irb0ldGxHk+7et7eGlN2BLLL49+9VzR5/Au8eVbNxks1BTwCcb2
         +zSCAz+YkC+R9B+ARMWdJhwU+ojm7wXIJCMQNcuQmVgXFDYcJmp+0ZadgV0weY1BX5xe
         tClMVWVXpcRRnWGXQ4Pld1taQnb3vTmaAIO2O/YTMM+vC07Q3/q/8DcIwxINXvXyQ+Qf
         z1TMOgnt8K5TMQrt0gBhCi4uzvf6VFLEMsyjUhoG91B246EIBTN06dxXoskALF/8Ee02
         aPYdXItzNMbKiGV5UywGHZgVpIhylhKVLANpGajt9KYeaWnrbBiyIkYYTPEBWp/T0rIY
         xINw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Sh50T1QuedbGY4H8ZOzSyzN00UpGyabuAQfLOyx8PYM=;
        b=Xvh4/XlhReMj4odz6PtOcZutm8LcSdfPc1S4FW6mrnCZVgD7yCjstbp94WnvptG3ZJ
         yEfLfbsgRzZ4VesJtKwK7QRNi7qmSkuCqUTZFTw1kxNvBzI8v/7kGmv/AkF7CII2qOWa
         LfXAVHB/yV+FJVROwvEpDLF2/XooSoX+hWND+ROLUV5IuEbMOK0+Y/8i76ATXb1+88YB
         OfHJLIXtKx4urQNuCbS9bsCVLdcsjeO4gSz25Zj+GIUaA+kHiiIKIP+bOyEnVobn2kNW
         gMWVhrmjw9YrQoLjGmxum21WZ7vfNmx89ssG8rJsCxjqfGNKpqeu70HslEvQcoQFpebZ
         gH0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=nPKD+OV2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si2889531ybp.64.2021.02.10.13.27.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Feb 2021 13:27:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=nPKD+OV2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:37666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9x14-0002xJ-Cw
	for alex.bennee@linaro.org; Wed, 10 Feb 2021 16:27:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1l9x0m-0002wt-6a
 for qemu-arm@nongnu.org; Wed, 10 Feb 2021 16:27:00 -0500
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:38990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1l9x0W-0002Q4-T2
 for qemu-arm@nongnu.org; Wed, 10 Feb 2021 16:26:58 -0500
Received: by mail-lj1-x232.google.com with SMTP id u4so4817876ljh.6
 for <qemu-arm@nongnu.org>; Wed, 10 Feb 2021 13:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sh50T1QuedbGY4H8ZOzSyzN00UpGyabuAQfLOyx8PYM=;
 b=nPKD+OV253uEPNUAN13t6FPcHHEDKvgu0IWEAw3S0xQUOKOAm2F6l+tNoC9btIE6iO
 3gTNgRMpZFfcHI684c9S9vyo30LXR78MJGwG0YL40WgyR733UP4eCmLtQh24l/EmK5Gd
 jjyaqPY5yJH1EFtbZ+IOl89EiXBMys1RJ6GcpeYMdS+VO+waFQMvIoDj7uPrZw650v/E
 LKB2+C5d5+gMJc291tpa18FbcIBaEIyaTYkfvdtN3r8esRnW1nF0bWutVKtVGhGP41t5
 JF7CfgkFbyfvm5GjTe2PWIku/COLdp63MDd9nV74Gx7/di4WpycXseJVhPgf5C5oWzvc
 fmXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sh50T1QuedbGY4H8ZOzSyzN00UpGyabuAQfLOyx8PYM=;
 b=RTBkx6scQgKEQjKDduiUqqI500/Ys30opRWG95uSeEBOS5uBHb84392y0LgXXqPhKf
 yST1ZQQMFQTOvQHAIdDD4b2A43t+mIy+3XURupvxtpzct8h4bNvKqp0ppREc8NSlPQcc
 fqfGgiOcQOd2EjzoTL99Tj/YygJ3EayWa1mHGXDNIUs95naVr9f+Jxfq4kwQ/v2WYFBF
 c9ZyuQULGS5RPPRnW5toPMjyNceaMhXrZwbARS8Kj8+4S7SssCa6Z4hlfL5R4MwAiWTs
 l7AnAb2b5N5f/HYEDq2CHzNRQm2hB1rBCw9+XJnm8Wg8CTnZW4X/T1/8veqpnrRUUEjO
 /s2g==
X-Gm-Message-State: AOAM53277FL7xoJrD1gDsfL3iqqh+P3a01ydrkNh7yapER2m2BHr7Kfw
 ZKTQBnhdM+2t8am2Ka92SvOeCMDaE32ybmzoyrZ/nw==
X-Received: by 2002:a2e:5805:: with SMTP id m5mr117060ljb.77.1612992402709;
 Wed, 10 Feb 2021 13:26:42 -0800 (PST)
MIME-Version: 1.0
References: <20210129005845.416272-1-wuhaotsh@google.com>
 <CAFEAcA-nx02EKVZLRxDYyY6uY4jyZ5ag3uk_Cak8zZqTuF32tg@mail.gmail.com>
In-Reply-To: <CAFEAcA-nx02EKVZLRxDYyY6uY4jyZ5ag3uk_Cak8zZqTuF32tg@mail.gmail.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Wed, 10 Feb 2021 13:26:30 -0800
Message-ID: <CAGcCb101mQGaGw3h2e8t=+uYfb8fw+gUezSi55nnr1-8886=eg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] hw/i2c: Add NPCM7XX SMBus Device
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 CS20 KFTing <kfting@nuvoton.com>, 
 Havard Skinnemoen <hskinnemoen@google.com>,
 Patrick Venture <venture@google.com>, Doug Evans <dje@google.com>, 
 Corey Minyard <cminyard@mvista.com>
Content-Type: multipart/alternative; boundary="00000000000030bf9005bb020f63"
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=wuhaotsh@google.com; helo=mail-lj1-x232.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01, USER_IN_DEF_DKIM_WL=-7.5,
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
X-TUID: SFZWGa4nXnz4

--00000000000030bf9005bb020f63
Content-Type: text/plain; charset="UTF-8"

Thanks. I'll take patch 1 out of the next version.

On Mon, Feb 8, 2021 at 9:01 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Fri, 29 Jan 2021 at 01:04, Hao Wu <wuhaotsh@google.com> wrote:
> >
> > This patch set implements the System manager bus (SMBus) module in
> NPCM7XX
> > SoC. Basically, it emulates the data transactions of the module, not the
> > SDA/SCL levels. We have also added a QTest which contains read and write
> > operations for both single-byte and FIFO mode, and added basic I2C
> devices
> > for npcm750-evb and quanta-gsj boards.
> >
> > We also cleaned up the unimplemented GPIO devices in npcm7xx.c since they
> > are already implemented.
> >
> > Changes since v1:
> > - Fix errors for i2c device addresses for temperature sensors in GSJ
> machine
> > - Use at24c device to emulate GSJ EEPROM. It supports more than 256
> bytes.
> > - Fill in VMState in npcm7xx_smbus.c
> > - Change commit message in patch 3 and 4
> > - Fix order in npcm7xx.c IRQ list
> > - Add a few extra comments to make things clearer
> >
> > Hao Wu (6):
> >   hw/arm: Remove GPIO from unimplemented NPCM7XX
> >   hw/i2c: Implement NPCM7XX SMBus Module Single Mode
> >   hw/arm: Add I2C sensors for NPCM750 eval board
> >   hw/arm: Add I2C sensors and EEPROM for GSJ machine
> >   hw/i2c: Add a QTest for NPCM7XX SMBus Device
> >   hw/i2c: Implement NPCM7XX SMBus Module FIFO Mode
>
> Hi; I'm going to apply patch 1 to target-arm.next because it's not
> really related to the others in the series. For the rest, I left
> a couple of review comments but they're pretty minor.
>
> thanks
> -- PMM
>

--00000000000030bf9005bb020f63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks. I&#39;ll take patch 1 out of the next version.</di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On M=
on, Feb 8, 2021 at 9:01 AM Peter Maydell &lt;<a href=3D"mailto:peter.maydel=
l@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Fri, 29 Jan 2021 at 01:04, Hao Wu =
&lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"_blank">wuhaotsh@googl=
e.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This patch set implements the System manager bus (SMBus) module in NPC=
M7XX<br>
&gt; SoC. Basically, it emulates the data transactions of the module, not t=
he<br>
&gt; SDA/SCL levels. We have also added a QTest which contains read and wri=
te<br>
&gt; operations for both single-byte and FIFO mode, and added basic I2C dev=
ices<br>
&gt; for npcm750-evb and quanta-gsj boards.<br>
&gt;<br>
&gt; We also cleaned up the unimplemented GPIO devices in npcm7xx.c since t=
hey<br>
&gt; are already implemented.<br>
&gt;<br>
&gt; Changes since v1:<br>
&gt; - Fix errors for i2c device addresses for temperature sensors in GSJ m=
achine<br>
&gt; - Use at24c device to emulate GSJ EEPROM. It supports more than 256 by=
tes.<br>
&gt; - Fill in VMState in npcm7xx_smbus.c<br>
&gt; - Change commit message in patch 3 and 4<br>
&gt; - Fix order in npcm7xx.c IRQ list<br>
&gt; - Add a few extra comments to make things clearer<br>
&gt;<br>
&gt; Hao Wu (6):<br>
&gt;=C2=A0 =C2=A0hw/arm: Remove GPIO from unimplemented NPCM7XX<br>
&gt;=C2=A0 =C2=A0hw/i2c: Implement NPCM7XX SMBus Module Single Mode<br>
&gt;=C2=A0 =C2=A0hw/arm: Add I2C sensors for NPCM750 eval board<br>
&gt;=C2=A0 =C2=A0hw/arm: Add I2C sensors and EEPROM for GSJ machine<br>
&gt;=C2=A0 =C2=A0hw/i2c: Add a QTest for NPCM7XX SMBus Device<br>
&gt;=C2=A0 =C2=A0hw/i2c: Implement NPCM7XX SMBus Module FIFO Mode<br>
<br>
Hi; I&#39;m going to apply patch 1 to target-arm.next because it&#39;s not<=
br>
really related to the others in the series. For the rest, I left<br>
a couple of review comments but they&#39;re pretty minor.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--00000000000030bf9005bb020f63--
