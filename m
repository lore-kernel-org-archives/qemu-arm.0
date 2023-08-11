Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1167932ejc;
        Thu, 10 Aug 2023 23:47:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEe5eBp2wFRB0RpJpiAHJFsi1WB0bJ5ntpPIhlmK+YzRudzZKcrdzkCmBvUQTniRfJnoUsu
X-Received: by 2002:a0c:b38a:0:b0:63c:71bf:f5d1 with SMTP id t10-20020a0cb38a000000b0063c71bff5d1mr1367708qve.25.1691736450355;
        Thu, 10 Aug 2023 23:47:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691736450; cv=none;
        d=google.com; s=arc-20160816;
        b=UAFp44Snta8EcgInWJuRXB2vIff00byjG6x4+o4GOxownyppoVFiPZ/4YvQod0nrKg
         +xF3m2pbcLE+m1d6mHoz9hIYJVs6QyB6i4JpztYdmmZd9veKWHhOGDz1TgZk7TwhTzX9
         jak7fnCFpJe8a6swIVKJ1Wlhot3emH+SBTcMRgPE/UGitpTkGyknLhFpLhm7KUW2pS7+
         SjO/NPIh6Q2gSEvfnRH1uvJdFba3Ot3hl51oEb/VXqcOIXmcaKvsruy+vzfANAFcc/bo
         FNDkOjjwf9kAABohbHPtfqbEqRl6E+T8wxYblXF6qgL1RVH4Ddhm9R2OPvTfbr6XKQRv
         R93A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bAVRsGL/nstakXHQHZDJYJdchDf8xqdkflm1jLCCLs4=;
        fh=0XJD9atAusX5yOHpZbeUf70lqiUeCmlDNN7U8po3Y28=;
        b=k319St787EXpnsUGqFHFZ2in2DJburcWHkzC+BjDzU2ddqMM7iuc9EKA2I9LesuaDf
         faYN3P1TJIY3S8rs5lnRL6p0++PrUBZBOHkxLMI38iJO5trX6PMx21/j8f2s2IeR9fpz
         5izaBgq3F5liwqkc8psPvqwL/ykyFtQuc8rD7iPf1aYBwYFaLXc4RUTwjov0UciqquZV
         mnxGoBPrkouTxa7dRLbuOvlDH05RKEO8TzOqu3xfephFOuJ1B7zF0hxlwQv4qPNLME9L
         tfnmrc01y/eeV8bQB03Jeg94uLWcop2Gh1r6A5s6tkhiFgwlBX9o2x2W+vkZnDPkBS3Y
         5OEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=X2t2AJsC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i22-20020a0cab56000000b005e321046288si1749315qvb.5.2023.08.10.23.47.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 23:47:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=X2t2AJsC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qULvL-0006wW-A7; Fri, 11 Aug 2023 02:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1qULvJ-0006vr-Lf
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 02:47:01 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1qULvG-0004eB-Go
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 02:47:01 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fe4f5290daso2533746e87.1
 for <qemu-arm@nongnu.org>; Thu, 10 Aug 2023 23:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1691736415; x=1692341215;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bAVRsGL/nstakXHQHZDJYJdchDf8xqdkflm1jLCCLs4=;
 b=X2t2AJsCM+Nby0oGrr/ZVA15qtRIP/5XUHGmkXMQprhfN/xyAC5KhG8nbGTdHJk7To
 /IUaXi8i2hwV5ONBpwkT3nE1Rs7tnTX/rkwXKDA0o8d7H5VhLY7TG+yZPsYubE9Jr+Yf
 LR/FDVBNOnrgzgkXURKVv0Q83bo1JKvarJk//uPm3egtRrGiZptWDBjrNHXb4EvhUb4H
 G//3iDi7hXKShM329EPUHnH/BvMZTH3b34/mC5RkL082AW3hL0jyOlQCXcp/7wM6j1IC
 NfKby3dFiaWnVLBU0K+5oCAo+fddu85PhLoWdYh5sb2+Ep39QS2XVywjI9wE0uYFZI3i
 IcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691736415; x=1692341215;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bAVRsGL/nstakXHQHZDJYJdchDf8xqdkflm1jLCCLs4=;
 b=H3RZ0iP/SEPBdaV55KybMbSIixUiivSROGl5Hfo9pkG2uc727pYqS8VVjS7LtXPG85
 jVS4hoOaZmx3XxNmasAroNQ0GC5nxZ0S1/BP7ljKW3hzQhbEQWHMRuZKKK/3shDcLkN/
 +NMJm0oPhcc/mPhcTEI9Sj9O4Id7sWM0TrC3+hEpGCvP6/XfkgZvw+ilUCoQPFrG2gbw
 AJ4yObRrAvvv8GKFEwcYQBKphhQ8zcrbS2c4x6pyYZgYfB9oTRjSaww0a3j1nE45uXCR
 lrLOt/ECIcw+DII6s4U+XCNXYPbB+MBypY+bzAI9TBw8eSfavejUg64tvgXoaGmQDZkF
 DvYw==
X-Gm-Message-State: AOJu0Yx1M3r8NyR/pT3ViVU++UVCPlmvXjfFPJLCaL34dKeLIotsWCwU
 1uJizzJKDB+F1TuzEXF/TmPKAQ==
X-Received: by 2002:a19:7b1a:0:b0:4f8:7734:8dd2 with SMTP id
 w26-20020a197b1a000000b004f877348dd2mr593478lfc.53.1691736415586; 
 Thu, 10 Aug 2023 23:46:55 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43]) by smtp.gmail.com with ESMTPSA id
 w25-20020ac254b9000000b004fe48a27fa1sm596887lfk.114.2023.08.10.23.46.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Aug 2023 23:46:54 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-4fe3b86cec1so2511019e87.2; 
 Thu, 10 Aug 2023 23:46:54 -0700 (PDT)
X-Received: by 2002:a19:5049:0:b0:4fb:7592:7e03 with SMTP id
 z9-20020a195049000000b004fb75927e03mr741375lfj.20.1691736414579; Thu, 10 Aug
 2023 23:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230809102257.25121-1-jason.chien@sifive.com>
In-Reply-To: <20230809102257.25121-1-jason.chien@sifive.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Fri, 11 Aug 2023 14:46:43 +0800
X-Gmail-Original-Message-ID: <CANzO1D2fK5_CXEpeJpODxSKmLSqvB4je=9C64HDEDrwQWippaw@mail.gmail.com>
Message-ID: <CANzO1D2fK5_CXEpeJpODxSKmLSqvB4je=9C64HDEDrwQWippaw@mail.gmail.com>
Subject: Re: [PATCH] hw/pci-host: Allow extended config space access for
 Designware PCIe host
To: Jason Chien <jason.chien@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Greg Kurz <groug@kaod.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000000b70820602a014bf"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=frank.chang@sifive.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: D2CZneu28QyR

--0000000000000b70820602a014bf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Frank Chang <frank.chang@sifive.com>

On Wed, Aug 9, 2023 at 6:23=E2=80=AFPM Jason Chien <jason.chien@sifive.com>=
 wrote:

> In pcie_bus_realize(), a root bus is realized as a PCIe bus and a non-roo=
t
> bus is realized as a PCIe bus if its parent bus is a PCIe bus. However,
> the child bus "dw-pcie" is realized before the parent bus "pcie" which is
> the root PCIe bus. Thus, the extended configuration space is not accessib=
le
> on "dw-pcie". The issue can be resolved by adding the
> PCI_BUS_EXTENDED_CONFIG_SPACE flag to "pcie" before "dw-pcie" is realized=
.
>
> Signed-off-by: Jason Chien <jason.chien@sifive.com>
> ---
>  hw/pci-host/designware.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> index 9e183caa48..388d252ee2 100644
> --- a/hw/pci-host/designware.c
> +++ b/hw/pci-host/designware.c
> @@ -694,6 +694,7 @@ static void designware_pcie_host_realize(DeviceState
> *dev, Error **errp)
>                                       &s->pci.io,
>                                       0, 4,
>                                       TYPE_PCIE_BUS);
> +    pci->bus->flags |=3D PCI_BUS_EXTENDED_CONFIG_SPACE;
>
>      memory_region_init(&s->pci.address_space_root,
>                         OBJECT(s),
> --
> 2.17.1
>
>
>

--0000000000000b70820602a014bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang=
@sifive.com">frank.chang@sifive.com</a>&gt;</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 9, 2023 at 6:23=E2=
=80=AFPM Jason Chien &lt;<a href=3D"mailto:jason.chien@sifive.com">jason.ch=
ien@sifive.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">In pcie_bus_realize(), a root bus is realized as a PCIe bus a=
nd a non-root<br>
bus is realized as a PCIe bus if its parent bus is a PCIe bus. However,<br>
the child bus &quot;dw-pcie&quot; is realized before the parent bus &quot;p=
cie&quot; which is<br>
the root PCIe bus. Thus, the extended configuration space is not accessible=
<br>
on &quot;dw-pcie&quot;. The issue can be resolved by adding the<br>
PCI_BUS_EXTENDED_CONFIG_SPACE flag to &quot;pcie&quot; before &quot;dw-pcie=
&quot; is realized.<br>
<br>
Signed-off-by: Jason Chien &lt;<a href=3D"mailto:jason.chien@sifive.com" ta=
rget=3D"_blank">jason.chien@sifive.com</a>&gt;<br>
---<br>
=C2=A0hw/pci-host/designware.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c<br>
index 9e183caa48..388d252ee2 100644<br>
--- a/hw/pci-host/designware.c<br>
+++ b/hw/pci-host/designware.c<br>
@@ -694,6 +694,7 @@ static void designware_pcie_host_realize(DeviceState *d=
ev, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;s-&gt;<a h=
ref=3D"http://pci.io" rel=3D"noreferrer" target=3D"_blank">pci.io</a>,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, 4,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TYPE_PCIE_BUS);=
<br>
+=C2=A0 =C2=A0 pci-&gt;bus-&gt;flags |=3D PCI_BUS_EXTENDED_CONFIG_SPACE;<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0memory_region_init(&amp;s-&gt;pci.address_space_root,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 OBJECT(s),<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div>

--0000000000000b70820602a014bf--
