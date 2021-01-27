Received: by 2002:a19:87d7:0:0:0:0:0 with SMTP id j206csp287289lfd;
        Wed, 27 Jan 2021 13:59:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxiVLZjXhjwovuewHsnBnWr4R+w5AiuHNJkH/IKOJlD5OCGp/Q/VK9TlNvfrrkedi+FAq3o
X-Received: by 2002:a25:c50a:: with SMTP id v10mr19481708ybe.276.1611784789613;
        Wed, 27 Jan 2021 13:59:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611784789; cv=none;
        d=google.com; s=arc-20160816;
        b=hujSZm90xX+Fo/xM7Oj5Xbm4IVfXL5BH8nt+IJVpt8UmdSiv8dwZk/TTQ0XU7yEGTL
         z5d76LEBq/N6QiLtfhbf0m5+Of/7QJ9cTQgOqTYy7yyewcwjnUoq2fiDTT1Ozcjka6nP
         dAt/PXCss9ZRjHvABXkbT2WxQjsxsIg9j7vfzbqDSlwx40bmY4G1V9hpDCunB0Rz/gGN
         nw8wzq56cq4dP2+P3hneVaofa+6OxnQ2cG2MHUpe4inY8FBqpMbVSk/oiAnOpIfvG9h0
         vYazXPpgnxgaxr4bg+ymqbnrQOJztvu3pxVWmTVTdgL1Ar0xtnS7Pzm1bafR6EPO86Ea
         JuPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:cc:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:to
         :subject:message-id:date:in-reply-to:references:mime-version
         :dkim-signature;
        bh=c/AUicp4Jps+a+9iFuaHW/434K31+hit+WIM8bi5iNg=;
        b=0bVcAe7v2NSLEOii/3DENKg46ri0UbOWRRf7qPQAj0tobjSUxgmf12+8WdY42nka4G
         Kr+He4aYhylutaQ4xM3jfTcyW+puEX4uA/h7g4VIIfx/E+3EunJAlCzZUfXP4oplfpCX
         gqbOiRQiXpjpzFSznpUunzglasK3RaLon3AgluY1d9BSwYVYT6k1QwFNRf9RLu2mP7Rv
         rTXWXGFi8fxWNmB0jbY2Izx3DGv0dOpuF8dcTItXVqNKhewucn1qn144ATjfA01uNIyK
         +Y04cXThPIb5nix9WIRmtF9x5oizxaSj7A2GTQ7YKDDqcgLmmTbc/bozacZaJX4AxdPf
         5IjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=hOYn4ET9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j205si3337219ybj.470.2021.01.27.13.59.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Jan 2021 13:59:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=hOYn4ET9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:50336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l4sqq-0007Qz-Vc
	for alex.bennee@linaro.org; Wed, 27 Jan 2021 16:59:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1l4sqR-0006yw-5V
 for qemu-arm@nongnu.org; Wed, 27 Jan 2021 16:59:23 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:35440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1l4sqP-0004wY-7m
 for qemu-arm@nongnu.org; Wed, 27 Jan 2021 16:59:22 -0500
Received: by mail-lf1-x136.google.com with SMTP id u25so4853603lfc.2
 for <qemu-arm@nongnu.org>; Wed, 27 Jan 2021 13:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c/AUicp4Jps+a+9iFuaHW/434K31+hit+WIM8bi5iNg=;
 b=hOYn4ET9Rtc0sKJnhX2FLqJ58EIfMUG7GMWemfuBVsazwkUMJupcqAOuz9aZig+sn1
 Vn5JUHjL+QNtz8vizcDMrjq3afuoNzACp3n/2aTWRZgYBhulWlxRkHkcCsN/wVm7JnBl
 hRDAd7Ge8JEDr9vrrW2P7UCv3TvQCB3AWMrIAHKJwvDTxLjUf3lT1BYHd6KU3glc808C
 OXEUdSy/4kmQIf8ywwr7QDFhgCeAhbsmlEmr4faUhnMAZfT12pwOyzTQg1JGJswGn66P
 OAI9nz+YEp3+ZkZZta+Of14YnbaturaX3I/2vtv068lDj+pYk4ujzrAB98aFAdb8/uwJ
 BEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c/AUicp4Jps+a+9iFuaHW/434K31+hit+WIM8bi5iNg=;
 b=rcMPfycdvDg6CveKS7Gn3T+mini2UoE2tqXKMx+gWnVIjQQLp0vJVEfBgPZdE2YJ03
 YP7VTDcaJqToEDGmjdb6RIz4b6yD3hsfZe7kGgbgBtED+4qdrAgkNldrOGtZgXNoozZr
 fIk6kpCY4q5Ua8uiSCPeq1XodV/W/O89zD6b6B5ZIzO2cflbtdi94OAmZuxbG6jnwO8K
 qdSFPT2ilWIF0btZdOjHQaePjMyBCAB+6het2uGBdxOzTguw9RvI3McdLrlejnjgeqeH
 ReYGaRj+/LnLfjwPjbRIkvMX+lTHy56+6tdgvF12a1l/b59tb2bTsu7fR9PA9Yn56h0V
 QvRA==
X-Gm-Message-State: AOAM532WfxEeUnvK0LCCEXQ+68u8qnSwmNYUgAHnP3cbDL7yaotXKRUo
 blWYEIN9bQv19A5mwi4xb/+zRGuxj39ANhELrUw7Ag==
X-Received: by 2002:a19:5052:: with SMTP id z18mr6101504lfj.554.1611784759112; 
 Wed, 27 Jan 2021 13:59:19 -0800 (PST)
MIME-Version: 1.0
References: <20210126193237.1534208-1-wuhaotsh@google.com>
 <20210126193237.1534208-7-wuhaotsh@google.com>
 <20210126234724.GC2057975@minyard.net>
 <CAGcCb12nJAMnZ+eaWC6n08hAFAVueCknSWzbEYFPp+GUApoRdg@mail.gmail.com>
 <20210127214251.GE2057975@minyard.net>
In-Reply-To: <20210127214251.GE2057975@minyard.net>
Date: Wed, 27 Jan 2021 13:59:07 -0800
Message-ID: <CAGcCb13N+0wtmkH4Q4rZowrpPBn_KkOae3GgZokC4B1bGi-emg@mail.gmail.com>
Subject: Re: [PATCH 6/6] hw/i2c: Implement NPCM7XX SMBus Module FIFO Mode
To: Corey Minyard <minyard@acm.org>
Content-Type: multipart/alternative; boundary="00000000000005e1db05b9e8e2b7"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x136.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Hao Wu <wuhaotsh@google.com>
From: wuhaotsh--- via <qemu-arm@nongnu.org>
X-TUID: usE63JEv3kcP

--00000000000005e1db05b9e8e2b7
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 27, 2021 at 1:42 PM Corey Minyard <minyard@acm.org> wrote:

> On Wed, Jan 27, 2021 at 12:37:46PM -0800, wuhaotsh--- via wrote:
> > On Tue, Jan 26, 2021 at 3:47 PM Corey Minyard <minyard@acm.org> wrote:
> >
> > > On Tue, Jan 26, 2021 at 11:32:37AM -0800, wuhaotsh--- via wrote:
> > > > +
> > > > +static void npcm7xx_smbus_read_byte_fifo(NPCM7xxSMBusState *s)
> > > > +{
> > > > +    uint8_t received_bytes =
> NPCM7XX_SMBRXF_STS_RX_BYTES(s->rxf_sts);
> > > > +
> > > > +    if (received_bytes == 0) {
> > > > +        npcm7xx_smbus_recv_fifo(s);
> > > > +        return;
> > > > +    }
> > > > +
> > > > +    s->sda = s->rx_fifo[s->rx_cur];
> > > > +    s->rx_cur = (s->rx_cur + 1u) % NPCM7XX_SMBUS_FIFO_SIZE;
> > > > +    --s->rxf_sts;
> > >
> > > This open-coded decrement seems a little risky.  Are you sure in every
> > > case that s->rxf_sts > 0?  There's no way what's running in the VM can
> > > game this and cause a buffer overrun?  One caller to this function
> seems
> > > to protect against this, and another does not.
> > >
> > s->rxf_sts is uint8_t so it's guaranteed to be >=0.
> > In the case s->rxf_sts == 0,  NPCM7XX_SMBRXF_STS_RX_BYTES(s->rxf_sts) is
> > also 0, so it'll take the if-branch and return without running
> --s->rxf_sts.
>
> That is true if called from the
> NPCM7XX_SMBUS_STATUS_STOPPING_LAST_RECEIVE case.  There is no such check
> in the NPCM7XX_SMBUS_STATUS_RECEIVING case.
>
I don't understand the reasoning here. The caller doesn't matter.
Previous code has:
 #define NPCM7XX_SMBRXF_STS_RX_BYTES(rv)     extract8((rv), 0, 5)
So
 uint8_t received_bytes = NPCM7XX_SMBRXF_STS_RX_BYTES(s->rxf_sts);
is guaranteed to be 0 if s->rxf_sts == 0.
As a result the code will take the following branch and returns:
 if (received_bytes == 0) {
    npcm7xx_smbus_recv_fifo(s);
    return;
 }
And will not execute the --s->rxf_sts sentence.
Please let me know if I missed anything here.

>
> > I'll probably add "g_assert(s->rxf_sts > 0)" to clarify.
>
> You never want to do an assert if the hosted system can do something to
> cause it.  If you add the check to the NPCM7XX_SMBUS_STATUS_RECEIVING
> case, it would be ok, but really unnecessary.
>
> If it's fine if s->rxf_sts wraps to 0xff, then this all doesn't matter,
> but you want to add a comment to that effect if so.  These sorts of
> things look dangerous.
>
> There is also the question about who takes these patches in.  I'm the
> I2C maintainer, but there's other code in this series.  Once everything
> is ready, I can ack them if we take it through the ARM tree.  Or I can
> take it through my tree with the proper acks.
>
I think either  way is fine. Previous NPCM7XX patch series were taken in
the ARM tree. But as i2c code taking into your tree is also fine.

>
> -corey
>
> >
> > >
> > > Other than this, I didn't see any issues with this patch.
> > >
> > > -corey
> > >
>

--00000000000005e1db05b9e8e2b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 27, 2021 at 1:42 PM Corey=
 Minyard &lt;<a href=3D"mailto:minyard@acm.org" target=3D"_blank">minyard@a=
cm.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Wed, Jan 27, 2021 at 12:37:46PM -0800, wuhaotsh--- via wrote:<br>
&gt; On Tue, Jan 26, 2021 at 3:47 PM Corey Minyard &lt;<a href=3D"mailto:mi=
nyard@acm.org" target=3D"_blank">minyard@acm.org</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Tue, Jan 26, 2021 at 11:32:37AM -0800, wuhaotsh--- via wrote:<=
br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static void npcm7xx_smbus_read_byte_fifo(NPCM7xxSMBusState =
*s)<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 uint8_t received_bytes =3D NPCM7XX_SMBRXF_STS=
_RX_BYTES(s-&gt;rxf_sts);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 if (received_bytes =3D=3D 0) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_smbus_recv_fifo(s);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 s-&gt;sda =3D s-&gt;rx_fifo[s-&gt;rx_cur];<br=
>
&gt; &gt; &gt; +=C2=A0 =C2=A0 s-&gt;rx_cur =3D (s-&gt;rx_cur + 1u) % NPCM7X=
X_SMBUS_FIFO_SIZE;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 --s-&gt;rxf_sts;<br>
&gt; &gt;<br>
&gt; &gt; This open-coded decrement seems a little risky.=C2=A0 Are you sur=
e in every<br>
&gt; &gt; case that s-&gt;rxf_sts &gt; 0?=C2=A0 There&#39;s no way what&#39=
;s running in the VM can<br>
&gt; &gt; game this and cause a buffer overrun?=C2=A0 One caller to this fu=
nction seems<br>
&gt; &gt; to protect against this, and another does not.<br>
&gt; &gt;<br>
&gt; s-&gt;rxf_sts is uint8_t so it&#39;s guaranteed to be &gt;=3D0.<br>
&gt; In the case s-&gt;rxf_sts =3D=3D 0,=C2=A0 NPCM7XX_SMBRXF_STS_RX_BYTES(=
s-&gt;rxf_sts) is<br>
&gt; also 0, so it&#39;ll take the if-branch and return without running --s=
-&gt;rxf_sts.<br>
<br>
That is true if called from the<br>
NPCM7XX_SMBUS_STATUS_STOPPING_LAST_RECEIVE case.=C2=A0 There is no such che=
ck<br>
in the NPCM7XX_SMBUS_STATUS_RECEIVING case.<br></blockquote><div>I don&#39;=
t understand the reasoning here. The caller doesn&#39;t matter.</div><div>P=
revious code has:</div><div>=C2=A0#define NPCM7XX_SMBRXF_STS_RX_BYTES(rv) =
=C2=A0 =C2=A0 extract8((rv), 0, 5)=C2=A0</div><div>So=C2=A0</div><div>=C2=
=A0uint8_t received_bytes =3D NPCM7XX_SMBRXF_STS_RX_BYTES(s-&gt;rxf_sts);<b=
r></div><div>is guaranteed to be 0 if s-&gt;rxf_sts =3D=3D 0.</div><div>As =
a result the code will take the following branch and returns:</div><div>=C2=
=A0if (received_bytes =3D=3D 0) {<br>=C2=A0 =C2=A0 npcm7xx_smbus_recv_fifo(=
s);<br>=C2=A0 =C2=A0 return;<br>=C2=A0}</div><div>And will not execute the =
--s-&gt;rxf_sts sentence.</div><div>Please let me know if I missed anything=
 here.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; I&#39;ll probably add &quot;g_assert(s-&gt;rxf_sts &gt; 0)&quot; to cl=
arify.<br>
<br>
You never want to do an assert if the hosted system can do something to<br>
cause it.=C2=A0 If you add the check to the NPCM7XX_SMBUS_STATUS_RECEIVING<=
br>
case, it would be ok, but really unnecessary.<br>
<br>
If it&#39;s fine if s-&gt;rxf_sts wraps to 0xff, then this all doesn&#39;t =
matter,<br>
but you want to add a comment to that effect if so.=C2=A0 These sorts of<br=
>
things look dangerous.<br>
<br>
There is also the question about who takes these patches in.=C2=A0 I&#39;m =
the<br>
I2C maintainer, but there&#39;s other code in this series.=C2=A0 Once every=
thing<br>
is ready, I can ack them if we take it through the ARM tree.=C2=A0 Or I can=
<br>
take it through my tree with the proper acks.<br></blockquote><div>I think =
either=C2=A0 way is fine. Previous NPCM7XX patch series were taken in the A=
RM tree. But as i2c code taking into your tree is also fine.</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
-corey<br>
<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; Other than this, I didn&#39;t see any issues with this patch.<br>
&gt; &gt;<br>
&gt; &gt; -corey<br>
&gt; &gt;<br>
</blockquote></div></div>

--00000000000005e1db05b9e8e2b7--
