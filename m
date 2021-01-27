Received: by 2002:a19:87d7:0:0:0:0:0 with SMTP id j206csp233803lfd;
        Wed, 27 Jan 2021 12:38:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0//wcFWYVbejC3g0kgXoXvVZE/lTvqo/rolTFYTwsG3sOKQ24rRG3UH8he/Te3wlEr8Av
X-Received: by 2002:a25:8882:: with SMTP id d2mr18336486ybl.7.1611779913894;
        Wed, 27 Jan 2021 12:38:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611779913; cv=none;
        d=google.com; s=arc-20160816;
        b=dm2P8/3nrUSX8h7L/W7bCcSyso0o1J7qIxfMULSf6TdOEHyBoNHRvwfX7QcrOtEW4h
         E+aCHPXNScrLXxrdB0a5ybu7QinoUECFTsdN4X05JBFaJhNVTlK3MN4sb9u0VuuExFYH
         VksFzxZilPz6bp45Dp3C4Snn0KSYsPagPRtGIC7h1lH5xnZ7hIXMwzFNLSK8PzllVukt
         wdphKyXa2Ktih9M+5o0Ix73lHJABH88V1tRh/2oLna2lo/JSqzxKcWvRIbod/UJetJ8O
         TXHu0xiFXBJjZpe+fF12lgI5H4+Esgw5ge/m7maH6c6RiXPi2NWITMt5DHkJ66cei6Yj
         JboA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:cc:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:to
         :subject:message-id:date:in-reply-to:references:mime-version
         :dkim-signature;
        bh=vtUiY4nMDeP6TOSXa2wuZ0uc6XilJPya8B0WM38Ne8I=;
        b=TxM348clbvMAUU9zA8ouVLhpU9+zN4JAgLdAmCVbESw8bCraQdmHRaMAE6YyENpftq
         2tgSUWGtsgZSGAM2c6ITs0E8wc6yelO5iMELMBVpMS6/wSFx9IDp8TCPvFmm9BT7yrqF
         wRtoc/pFVSsEox7yePgLBHugX5VgAln9us5gQU7mF5ycBdYWiYsmDj6gCEWX/XkFql+2
         wJcfsIi/HtBWBZVcqE1WzHpUSO8DOx5TusQ16xZQJpXi2g5gAYP1SaThsnL0AW4+Fih6
         XlcInOAdU73/7BSxh9ETg0HJEM4IiROJ57uAiil90npCjg2SmD4iX+q6ueMsh/HuMUZ/
         laYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=iX0M0Lj+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n76si3161329yba.386.2021.01.27.12.38.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Jan 2021 12:38:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=iX0M0Lj+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:44528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l4raD-0007IF-6m
	for alex.bennee@linaro.org; Wed, 27 Jan 2021 15:38:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1l4rZl-0007CX-GK
 for qemu-arm@nongnu.org; Wed, 27 Jan 2021 15:38:05 -0500
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:36279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1l4rZi-0003s3-H6
 for qemu-arm@nongnu.org; Wed, 27 Jan 2021 15:38:05 -0500
Received: by mail-lf1-x12e.google.com with SMTP id f1so4570766lfu.3
 for <qemu-arm@nongnu.org>; Wed, 27 Jan 2021 12:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vtUiY4nMDeP6TOSXa2wuZ0uc6XilJPya8B0WM38Ne8I=;
 b=iX0M0Lj+IhTysQfKtSlr9fJCCb4TT0aZlKBPInF/xRWQBpvJBjtCVAGOtdaJdxl2PR
 Tm9gV3s0ZiraMzIZsum30Fs+ryyRjsGjt5gmQcoyEf49AIw0K6X7XVf8MObzvvv9eOA9
 Hd70ED+jGsp9i5+rBMhiB+b1eII0IH63DFzD4b8ZQOrjBUL/bcyA3wiQ3mpvUOv8V16B
 aua820db9p/hpLS/nnJdzPdyKfbDAoQV1SQdb98pfCkwCCklEtJ6QnR8eqoEaNTq/nxU
 I6m7luDjBpg9j9qrAxcmpfSCyXw7ImuY4KuE2/iRzEKe4sAyc+OS7D1luBzsmJEpTblM
 X8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vtUiY4nMDeP6TOSXa2wuZ0uc6XilJPya8B0WM38Ne8I=;
 b=UsP/cQIl/TmGuk6Rf/1oL6nXAUVSSVWwkoFdwAe8RYyE8tEx1JFKecPgy0IT5UJnLB
 wv494o8U6hivHOn4ywpbnZyVT4y/jIkrVDIK8MrUzyD6rRRYMGqUpj32YWjy4z4iFPHp
 QBZUTMQYs23aT2qdoMPc8YB3Ai3wtuy7/zy4G5ubmP0QcTe0+2guJFJw3K2c7lf72R1/
 pocnOcJnLqVPY8eLj3koRfFYUHAESMMbLLfCdbL0ZB4Edut20aW4uKG9NNoTAJ11GKza
 11kB7U7nA7PtxrZE1QfEviwI9BVkMaZgvjRUqNxQ0twYezcljf4UOgyvgNJFIJxvz/jy
 0D8Q==
X-Gm-Message-State: AOAM533qh21rUR4pgvHSu307D70db84PZAwgNGOlAhd/QlsVRvJNv/ge
 QylUoe8t0CanHcziQjlNV0rn7QvN9vseQUQu07zsVA==
X-Received: by 2002:a05:6512:2141:: with SMTP id
 s1mr5663393lfr.337.1611779879183; 
 Wed, 27 Jan 2021 12:37:59 -0800 (PST)
MIME-Version: 1.0
References: <20210126193237.1534208-1-wuhaotsh@google.com>
 <20210126193237.1534208-7-wuhaotsh@google.com>
 <20210126234724.GC2057975@minyard.net>
In-Reply-To: <20210126234724.GC2057975@minyard.net>
Date: Wed, 27 Jan 2021 12:37:46 -0800
Message-ID: <CAGcCb12nJAMnZ+eaWC6n08hAFAVueCknSWzbEYFPp+GUApoRdg@mail.gmail.com>
Subject: Re: [PATCH 6/6] hw/i2c: Implement NPCM7XX SMBus Module FIFO Mode
To: Corey Minyard <minyard@acm.org>
Content-Type: multipart/alternative; boundary="000000000000281d0d05b9e7bfa6"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Patrick Venture <venture@google.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Hao Wu <wuhaotsh@google.com>
From: wuhaotsh--- via <qemu-arm@nongnu.org>
X-TUID: EjOzAAWdGWGO

--000000000000281d0d05b9e7bfa6
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 26, 2021 at 3:47 PM Corey Minyard <minyard@acm.org> wrote:

> On Tue, Jan 26, 2021 at 11:32:37AM -0800, wuhaotsh--- via wrote:
> > +
> > +static void npcm7xx_smbus_read_byte_fifo(NPCM7xxSMBusState *s)
> > +{
> > +    uint8_t received_bytes = NPCM7XX_SMBRXF_STS_RX_BYTES(s->rxf_sts);
> > +
> > +    if (received_bytes == 0) {
> > +        npcm7xx_smbus_recv_fifo(s);
> > +        return;
> > +    }
> > +
> > +    s->sda = s->rx_fifo[s->rx_cur];
> > +    s->rx_cur = (s->rx_cur + 1u) % NPCM7XX_SMBUS_FIFO_SIZE;
> > +    --s->rxf_sts;
>
> This open-coded decrement seems a little risky.  Are you sure in every
> case that s->rxf_sts > 0?  There's no way what's running in the VM can
> game this and cause a buffer overrun?  One caller to this function seems
> to protect against this, and another does not.
>
s->rxf_sts is uint8_t so it's guaranteed to be >=0.
In the case s->rxf_sts == 0,  NPCM7XX_SMBRXF_STS_RX_BYTES(s->rxf_sts) is
also 0, so it'll take the if-branch and return without running --s->rxf_sts.
I'll probably add "g_assert(s->rxf_sts > 0)" to clarify.

>
> Other than this, I didn't see any issues with this patch.
>
> -corey
>

--000000000000281d0d05b9e7bfa6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Tue, Jan 26, 2021 at 3:47 PM Corey Minyard &lt;<a href=3D"mailto:minyard@ac=
m.org">minyard@acm.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On Tue, Jan 26, 2021 at 11:32:37AM -0800, wuhaotsh---=
 via wrote:<br>
&gt; +<br>
&gt; +static void npcm7xx_smbus_read_byte_fifo(NPCM7xxSMBusState *s)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint8_t received_bytes =3D NPCM7XX_SMBRXF_STS_RX_BYTES(=
s-&gt;rxf_sts);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (received_bytes =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_smbus_recv_fifo(s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 s-&gt;sda =3D s-&gt;rx_fifo[s-&gt;rx_cur];<br>
&gt; +=C2=A0 =C2=A0 s-&gt;rx_cur =3D (s-&gt;rx_cur + 1u) % NPCM7XX_SMBUS_FI=
FO_SIZE;<br>
&gt; +=C2=A0 =C2=A0 --s-&gt;rxf_sts;<br>
<br>
This open-coded decrement seems a little risky.=C2=A0 Are you sure in every=
<br>
case that s-&gt;rxf_sts &gt; 0?=C2=A0 There&#39;s no way what&#39;s running=
 in the VM can<br>
game this and cause a buffer overrun?=C2=A0 One caller to this function see=
ms<br>
to protect against this, and another does not.<br></blockquote><div>s-&gt;r=
xf_sts is uint8_t so it&#39;s guaranteed to be &gt;=3D0.</div><div>In the c=
ase s-&gt;rxf_sts =3D=3D 0,=C2=A0 NPCM7XX_SMBRXF_STS_RX_BYTES(s-&gt;rxf_sts=
) is also 0, so it&#39;ll take the if-branch and return without running --s=
-&gt;rxf_sts.</div><div>I&#39;ll probably add &quot;g_assert(s-&gt;rxf_sts =
&gt; 0)&quot; to clarify.</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
Other than this, I didn&#39;t see any issues with this patch.<br>
<br>
-corey<br>
</blockquote></div></div></div></div>

--000000000000281d0d05b9e7bfa6--
