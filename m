Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp2524039lfb;
        Sat, 24 Apr 2021 15:46:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw47FOlLnE/LEst4NZ0WqLjq+OyfWANbSZhz+fc2GDj9c/T5SVW8UrMAlEAjoSmd+SmIID/
X-Received: by 2002:a37:27d8:: with SMTP id n207mr10524730qkn.252.1619304366069;
        Sat, 24 Apr 2021 15:46:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619304366; cv=none;
        d=google.com; s=arc-20160816;
        b=nIhZkfGtjxOC8PI73RpHw0sA9MgJiMCYUB9heak3QnR51ykGPQo8LJQmpoIgNYNVVX
         tW3ltpIok233VALSj1csAo9x0khg2ckYSvDs+qapRyxTwxB8KJMQ+7aNjm0PNP9BLFpW
         k2NzW1TYSFUCwmz2B7lfh3G4Y2iz6Y9WhcTDfmzqgoCqAburq16bYh2VWC5snvq5gDBS
         y+LLzkkFBbow6bciTsqRgpy/NI5DS0ZktgewwUEfgL87FcetW2HjwylIj+znc3WhPIX/
         PafLLo04gKLi0pza7YrxOciRLxuASiV2PDKGjM9CXTbQgFPmD6zrf79OziOGnheICacP
         4rgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U5cNZbB+ER3qv7WswsRcjI+rSC/1DqR3eFpI95g9OAE=;
        b=Kh/PnPvcCGQyFexiUiImzCD0ur5OFx/Ul3DD7yVKviyU5C5ANRd0fUMdeH30Hn8cF3
         bUATFWCEfeWMAH5wc3p/LNqG+y/UfotkXDCtLUK68DsL711EBjhuYSxchkmQAmWHmX5j
         BHWzrRvEVMI5eCDVJsPtilqs25Ov03bSqVE2ThMS40N9fPDUWXm/YyC6EdRso2rIHcsO
         OcX46Dd1K33OZh4foV/A6L57yvvdMG3Ja8CM1hjyWai1nO3KwSKv5Px3vhle3poP5aug
         f2V53ahspYM0npnbuZCTWPlqkTVnaJ2/K2v3QjRNxaLxrg5LKR2mQ+rnHHQ7BSt2XnUt
         1ZVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b=FBN5U9Ja;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5si7379834qvq.144.2021.04.24.15.46.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Apr 2021 15:46:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b=FBN5U9Ja;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1laR2L-0006iQ-D0
	for alex.bennee@linaro.org; Sat, 24 Apr 2021 18:46:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1laR2A-0006h2-89
 for qemu-arm@nongnu.org; Sat, 24 Apr 2021 18:45:54 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:38584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1laR28-00041w-B4
 for qemu-arm@nongnu.org; Sat, 24 Apr 2021 18:45:54 -0400
Received: by mail-qt1-x836.google.com with SMTP id q4so10665059qtn.5
 for <qemu-arm@nongnu.org>; Sat, 24 Apr 2021 15:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U5cNZbB+ER3qv7WswsRcjI+rSC/1DqR3eFpI95g9OAE=;
 b=FBN5U9Ja/zBTcY/XpVrDTmG5u+/1in4AlrhJFPML9LePS+ctEJDzaz2aVa68WivUIR
 EBEEumAvBenciTdBvOf1HGmziOangh/f7ez5DS+TT5WRwCCTAeEOzArK145yR7/iDWcZ
 YUeF5+fJv10cddXL7D8isR8QRw4VI8g6KB6ddwCbZXyMURQ2RlLCaRd/uDbnqQHTWA/W
 yn7eNC8FQjz+k1gICe9UOls0WtP4raHYGOXDWufMMv+Y+JZHLPs029azigtTNq+zmXwu
 dL77xzeeBXPZS7lmFXJcCAo9hnQuMZ6ZFYeRtSKydmZ3c0zWL4/xxXef7DGGFz3ho2Yu
 2SRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U5cNZbB+ER3qv7WswsRcjI+rSC/1DqR3eFpI95g9OAE=;
 b=IV0NB+KlhLINO0L79SdHkN33b6ylT0aTDrF7k+V6phLdZ5kB7fJOdi4bScCEa4rpm5
 9Cwvyj8/EcqVp0nTdZGTIBPiPG57BxYY2OmQkiKpPBzty7R75VCBr3IXcyOXsatva4Fw
 1uX+ZvNOJJ5LN9GOTcJAUZDLxGzolv1VzeLZ4epYHXLqW67U/31UTgNQadoNpHkku7cz
 0Trd4J9Si1Bvfdjs5rJ9yq27/BXnl3QNQUEPAUv0CL9rBbPsvlsv7s291T7e54FoTtU3
 6le3xbvMrVXgig+YNQKHo51pFV2HbM1VZ1hHdZ6rrbszuo+RmJzjhBpHJsBTNU/5pjOd
 X8MA==
X-Gm-Message-State: AOAM531LrM/Td93OTzyjfOhf7borhih3kfcqDUq4+JVdxKVXhLQ5NeZZ
 gc1lTsQMctW/4AYEBaEoHvmaUP2QCJ68oACvmGn8Iw==
X-Received: by 2002:a05:622a:3c8:: with SMTP id
 k8mr9805643qtx.101.1619304351178; 
 Sat, 24 Apr 2021 15:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210424222057.3434459-1-f4bug@amsat.org>
 <20210424222057.3434459-3-f4bug@amsat.org>
In-Reply-To: <20210424222057.3434459-3-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sat, 24 Apr 2021 16:45:40 -0600
Message-ID: <CANCZdfrjnOj=sLe9ivMAcqonQVKTacyct3C9ffazJsWAYBx_NQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/ide: Add Kconfig dependency MICRODRIVE -> PCMCIA
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000a2b19505c0bfacd3"
Received-SPF: none client-ip=2607:f8b0:4864:20::836;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
 Miroslav Rezanina <mrezanin@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: afDjRzmNDvLl

--000000000000a2b19505c0bfacd3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 24, 2021 at 4:24 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> The Microdrive Compact Flash can be plugged on a PCMCIA bus.
> Express the dependency using the 'depends on' Kconfig expression.
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/ide/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
> index 5d9106b1ac2..8e2c8934549 100644
> --- a/hw/ide/Kconfig
> +++ b/hw/ide/Kconfig
> @@ -41,6 +41,7 @@ config IDE_VIA
>  config MICRODRIVE
>      bool
>      select IDE_QDEV
> +    depends on PCMCIA
>
>  config AHCI
>      bool
> --
> 2.26.3
>
>
>

--000000000000a2b19505c0bfacd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Apr 24, 2021 at 4:24 PM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">The Microdrive Compact Flash can be plugged on a PCMCIA bus.<br>
Express the dependency using the &#39;depends on&#39; Kconfig expression.<b=
r></blockquote><div><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"=
mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt;</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0hw/ide/Kconfig | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig<br>
index 5d9106b1ac2..8e2c8934549 100644<br>
--- a/hw/ide/Kconfig<br>
+++ b/hw/ide/Kconfig<br>
@@ -41,6 +41,7 @@ config IDE_VIA<br>
=C2=A0config MICRODRIVE<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0select IDE_QDEV<br>
+=C2=A0 =C2=A0 depends on PCMCIA<br>
<br>
=C2=A0config AHCI<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
-- <br>
2.26.3<br>
<br>
<br>
</blockquote></div></div>

--000000000000a2b19505c0bfacd3--
