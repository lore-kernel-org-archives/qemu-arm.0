Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp1423042ocs;
        Thu, 29 Sep 2022 19:05:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6s0YuiRhuQmALvYtjQCJtVwvaZq3tbh1Cwk7w33R0dVI2GbRAVN5mH/Gd+Zxotf8qpKpyv
X-Received: by 2002:a05:620a:4402:b0:6ce:a1e0:955c with SMTP id v2-20020a05620a440200b006cea1e0955cmr4814792qkp.656.1664503558024;
        Thu, 29 Sep 2022 19:05:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664503558; cv=none;
        d=google.com; s=arc-20160816;
        b=qnsiY5EndlAjr3H451Y2G9GbAmWkg8kZpxmqpGkw/DbiKgyNguAYvRSTEVwyJpc/vp
         hq0+8Boi11Ue85JaT6nnLhgLryHEBXtFoWd2jA8Yn7In7PNoNeKhxQqP1XtbSdR5vf9+
         6xNWwJmaFoSaXSZAVP3oRWfEPxjVX/OoEZqQEm2nbhZmXMNwDG08E/zDlcUaVjkDaE+Z
         kuux9yf6qOeJGlZXmq1gYlAPYe42uPXJfIhnWNs/3rf7rnPgVa0hCPqeeLMqHYkLCUQR
         UpJ6bVbCLLmyFxhN1van+gPqZZ3Pf9AN5in/qAC9Gi8fY14SXp4nVXyQvX2gUtFINGFu
         rGVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Uej2jeiBA29GttESJFxtbQamkMVoYJjgiYi9kukk0EY=;
        b=WJn+uGfTfyoY2Hq5IOqhUHPiHfhbkg5OGZMWRrgmD+j62ik5FSRj1sYjCY4CxfDkTe
         +l2jOVi0nP+QJu93ql9XTUcMTlMokLgu59W3DmItpNtZQxTSzY71Z1CVY9YjpcNGTdW/
         Ojn5keEbPVs+ApGytzvBK08Nu3YEIg5KAXZ23yi6OBD2Ha1JgnW+Plt3E//w5yatJVUh
         KNPMLtOq21S5SHuO6tKhIs0XqD1iZS4INoISj2NK9jRmnNVrK/BbITlCQDDWvtHOPtwL
         W5sYe5PXTfc3qW7mCQcNB5QjTnTACwrqlokleeXuzu3tCr8xwcPgxiKnwmmtbfGvoJr3
         b/gA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=RUy5HC4s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e20-20020a05622a111400b0031ee8fa5b22si486009qty.542.2022.09.29.19.05.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Sep 2022 19:05:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=RUy5HC4s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:37422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oe5PZ-0002Mc-KM
	for alex.bennee@linaro.org; Thu, 29 Sep 2022 22:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1oe5PM-0002MJ-M3
 for qemu-arm@nongnu.org; Thu, 29 Sep 2022 22:05:44 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e]:45666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1oe5PJ-0005Mm-CU
 for qemu-arm@nongnu.org; Thu, 29 Sep 2022 22:05:44 -0400
Received: by mail-ua1-x92e.google.com with SMTP id p89so1216358uap.12
 for <qemu-arm@nongnu.org>; Thu, 29 Sep 2022 19:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Uej2jeiBA29GttESJFxtbQamkMVoYJjgiYi9kukk0EY=;
 b=RUy5HC4sWMg33CyKg9jbBIBf7ItFmCfOZ0QlsC8/p0eibbjxQ3SQ19UsiP6bZF9uMq
 x7P+n4TC2IBKOEbGcK8q+WC5I4CWEnj04xDaWVdQTojFrzCy79cTvzF/t3m17CdLVleP
 70Ah1GO4mONFlNqQ2KdfaX3JFfL7zRCKh3u5f92Ihu+SI2aAo48fzy9p2Xlr2u+cDI9Z
 ykzIZXOylp/xM0k13dOTY9c7kN4/xdCuGZh4yhK92EFe/crneoe9Qx3DMpcKn1zFMEA2
 9YKaPTdSHtz/XFLssqebkHRjyeilSGqpMnHk+3ql4U9W++StbS3Q7UcRYIupVBcCikZ2
 GDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Uej2jeiBA29GttESJFxtbQamkMVoYJjgiYi9kukk0EY=;
 b=M4r0qH1aEeaUVLCtpYsKz9i0WTtTt7C2vDArpqWUjr8v+99QQ3ZUdY6Ne7L8WExwHR
 D/J2M3TSbrrXX2y4EHBeuDBqFCePBhTrJWCsQ0eEmkeiDKRgQQIH7HQ0iY3HYSwkfrEK
 VvVlvHfKWvcJAo4b8J4Y9McnXgf5nVcUcjGyxawmkBQ9IWnQY+QkZRCSP/AZD6aI9m+Z
 JTZmYdqrZggo6D131Q5ntFISrunu1NczdvGbxW8XxoNxRbR2yf6haWbDTgh6eGkf6igA
 OKGDxUZ3qsNZp3SSHjLABrqrEs31ZO07Cu4FG3Zc35cNJ6lCxLmMQr8bucYmmlLEL+e/
 AgeA==
X-Gm-Message-State: ACrzQf04dYaekYSqUkziHITxw6B8dwcn83OpKUtRgZSLaSrXtwPaoJU0
 QausKbCkwREfLXJDip/DcbdcL73j96Zqdjc7tTtTqQ==
X-Received: by 2002:ab0:725a:0:b0:3cf:b399:773f with SMTP id
 d26-20020ab0725a000000b003cfb399773fmr3485078uap.110.1664503540201; Thu, 29
 Sep 2022 19:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220921234646.949273-1-venture@google.com>
 <CAFEAcA8f+JA4WKMwGFNxg7tRxTwL=RzDLgdJLrP8Dw_jB4XoRA@mail.gmail.com>
 <CACGkMEvMtAjGQVzwUgjD20Hb=Za8KmRanmp-FWrUQD8xS+7Pkw@mail.gmail.com>
 <CAO=notwnOKMd=n2qQC=iFX-cofeKP=ZUKX2VNXobMgXO64Y+sw@mail.gmail.com>
 <CAFEAcA97oHsQdk2fSq=umiUv8nNue0xCLtboRR2yPt_Gxh_zEg@mail.gmail.com>
 <CAO=notwsgvtZBLyWGu+PSnmHTrm6anakwFwoq3oBEJ-8nqPFaQ@mail.gmail.com>
 <CAO=notzN3E_OA-_jBvXsB8_LGbTXpE=G50RX8APbHHFN6eHE3A@mail.gmail.com>
 <CAFEAcA8_WM_-w7HDc+cRvvxZVEdatczsj18D3beN3+MUg7P3cA@mail.gmail.com>
In-Reply-To: <CAFEAcA8_WM_-w7HDc+cRvvxZVEdatczsj18D3beN3+MUg7P3cA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 29 Sep 2022 19:05:29 -0700
Message-ID: <CAO=notyLkM1ZDL0QCCvv_hNZr74EEYO-PrBPZRP=3YLOvOj6uQ@mail.gmail.com>
Subject: Re: [PATCH] hw/net: npcm7xx_emc: set MAC in register space
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, 
 CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>
Content-Type: multipart/alternative; boundary="0000000000003e17e305e9db6e79"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=venture@google.com; helo=mail-ua1-x92e.google.com
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
X-TUID: 4xstoMsGf5JQ

--0000000000003e17e305e9db6e79
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 29, 2022 at 8:54 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 29 Sept 2022 at 16:28, Patrick Venture <venture@google.com> wrote:
> > On Mon, Sep 26, 2022 at 8:45 AM Patrick Venture <venture@google.com>
> wrote:
> >>> I think what Jason is suggesting is that that should depend on what
> >>> the real hardware does. On a physical board, if the guest sets the
> >>> MAC address, and then you power-cycle the hardware, does the MAC
> >>> that it set still persist after powercycle ? Does the guest writing
> >>> to these MAC registers correspond to writing to an EEPROM ?
> >>
> >>
> >> Thanks, Peter - we've reached out to the vendor off-list to seek out
> some details, I'll update this with a v2 when I get an answer.
>
> > "No, The EMC driver reset the MAC address registers during boot
> cycle/reset."
>
> OK, I guess that's clear enough. In a real full-software-stack
> setup is the MAC address setup usually done by a BIOS/firmware,
> or is it done by Linux ?
>

The MAC address is usually set up in u-boot or by linux.  The openbmc stack
currently doesn't actually read what the device thinks its mac address is,
but it could :)  It just sets it blindly.  We found this register issue
because we were debugging why the MAC address we were setting in the qemu
command line had no effect.  Turns out, per this patch, we weren't using
that value anywhere.  But even with that fixed, the firmware didn't care. :)


>
> > So in that case, we should disregard the value the user sets in
> > reset and use the value provided through Qemu.  Or, should we just
> > not allow Qemu to set the MAC address at all?
>
> I think that the behaviour for QEMU's model should be that
> on reset we should reset the MAC address registers to the
> user-provided value. That is, if the guest writes to the
> MAC address registers then that does have an effect, but
> only until the next reset.
>
> That gives you reasonably plausible behaviour for both:
> (1) you're emulating some guest that always sets up its
> own MAC address when it starts up (eg if it's done by
> some BIOS-level code that you're running in the guest)
> (2) you're booting a guest kernel directly that expects
> that the firmware/BIOS/whatever has already set up
> a MAC address -- then the MAC address provided by QEMU/the
> user fills that role
>
> More concretely:
>  * on reset, set the emc->regs[] fields from emc->conf.macaddr
>  * when using the MAC address, always use emc->regs[], never
>    emc->conf.macaddr
>  * to handle the guest writes to the MAC registers, set
>    emc->regs[], but not emc->conf.macaddr
>
> Thanks! That actually made it much easier to parse what you wanted to
match the behavior :)


> Assuming that doesn't break your existing booting workloads,
> of course :-)
>
> thanks
> -- PMM
>

--0000000000003e17e305e9db6e79
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 29, 2022 at 8:54 AM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Thu, 29 Sept 2022 at 16:28, Patrick Venture &lt;<a href=3D"mailto:=
venture@google.com" target=3D"_blank">venture@google.com</a>&gt; wrote:<br>
&gt; On Mon, Sep 26, 2022 at 8:45 AM Patrick Venture &lt;<a href=3D"mailto:=
venture@google.com" target=3D"_blank">venture@google.com</a>&gt; wrote:<br>
&gt;&gt;&gt; I think what Jason is suggesting is that that should depend on=
 what<br>
&gt;&gt;&gt; the real hardware does. On a physical board, if the guest sets=
 the<br>
&gt;&gt;&gt; MAC address, and then you power-cycle the hardware, does the M=
AC<br>
&gt;&gt;&gt; that it set still persist after powercycle ? Does the guest wr=
iting<br>
&gt;&gt;&gt; to these MAC registers correspond to writing to an EEPROM ?<br=
>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Thanks, Peter - we&#39;ve reached out to the vendor off-list to se=
ek out some details, I&#39;ll update this with a v2 when I get an answer.<b=
r>
<br>
&gt; &quot;No, The EMC driver reset the MAC address registers during boot c=
ycle/reset.&quot;<br>
<br>
OK, I guess that&#39;s clear enough. In a real full-software-stack<br>
setup is the MAC address setup usually done by a BIOS/firmware,<br>
or is it done by Linux ?<br></blockquote><div><br></div><div>The MAC addres=
s is usually set up in u-boot or by linux.=C2=A0 The openbmc stack currentl=
y doesn&#39;t actually read what the device thinks its mac address is, but =
it could :)=C2=A0 It just sets it blindly.=C2=A0 We found this register iss=
ue because we were debugging why the MAC address we were setting in the qem=
u command line had no effect.=C2=A0 Turns out, per this patch, we weren&#39=
;t using that value anywhere.=C2=A0 But even with that fixed, the firmware =
didn&#39;t care. :)</div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
&gt; So in that case, we should disregard the value the user sets in<br>
&gt; reset and use the value provided through Qemu.=C2=A0 Or, should we jus=
t<br>
&gt; not allow Qemu to set the MAC address at all?<br>
<br>
I think that the behaviour for QEMU&#39;s model should be that<br>
on reset we should reset the MAC address registers to the<br>
user-provided value. That is, if the guest writes to the<br>
MAC address registers then that does have an effect, but<br>
only until the next reset.<br>
<br>
That gives you reasonably plausible behaviour for both:<br>
(1) you&#39;re emulating some guest that always sets up its<br>
own MAC address when it starts up (eg if it&#39;s done by<br>
some BIOS-level code that you&#39;re running in the guest)<br>
(2) you&#39;re booting a guest kernel directly that expects<br>
that the firmware/BIOS/whatever has already set up<br>
a MAC address -- then the MAC address provided by QEMU/the<br>
user fills that role<br>
<br>
More concretely:<br>
=C2=A0* on reset, set the emc-&gt;regs[] fields from emc-&gt;conf.macaddr<b=
r>
=C2=A0* when using the MAC address, always use emc-&gt;regs[], never<br>
=C2=A0 =C2=A0emc-&gt;conf.macaddr<br>
=C2=A0* to handle the guest writes to the MAC registers, set<br>
=C2=A0 =C2=A0emc-&gt;regs[], but not emc-&gt;conf.macaddr<br>
<br></blockquote><div>Thanks! That actually made it much easier to parse wh=
at you wanted to match the behavior :)</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
Assuming that doesn&#39;t break your existing booting workloads,<br>
of course :-)<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--0000000000003e17e305e9db6e79--
