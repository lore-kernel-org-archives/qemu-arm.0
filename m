Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp300995ocb;
        Tue, 4 Oct 2022 09:29:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6ioZoPyT0/0LSHSd46NA1bb+Bluz1kzEPd95levd2Ln7fiGYjueOXOYuDEoG0sGcvRwcUh
X-Received: by 2002:ad4:5944:0:b0:4ad:7802:c35a with SMTP id eo4-20020ad45944000000b004ad7802c35amr20531774qvb.84.1664900993622;
        Tue, 04 Oct 2022 09:29:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664900993; cv=none;
        d=google.com; s=arc-20160816;
        b=Nn42aQmULn6p4axvJB+CQclTCXQiJPnnHrUJ3I/jmGLlioGx440yFliQZRF9y1tgxa
         8rKy8lm9v5HEAXYBOXgne8cZtzcgAVWsoHEyDpKuNu+u2V2du0qNFWQs1LUs9zBEYV3U
         2SDonKGPEagy52/YcRV37XQmk0ijkc45pySMk90SHLtHkgroPuiYGvoYoQ8Ho+TegG+u
         RnQj0pO/NBoYNsZbqWAX03MpTI/UOJY4LlAMruKMhUhB2UNIGmUX4vTD35nNGXBNkG3e
         l24T7JLmvZsb14AkKPDfzpySMPGsrNA/C7tXVtHtRo91PmaflLIpdI62+u288gIh0bPI
         1kXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=iKvtRFlETc8cK06yBbpkgkrxukcKxfCgAL5rhfNg2JU=;
        b=pULQDZ9VIZkzpYNlesMfMthYooZoWaG0v8SE1bWW6qm5/a1/hF/cj7DFoB4+Qk2hn1
         OVnX65FPC46EGQWCRy2M1DXcA9thwGZ6vbnn/jHzJ1Wpd1o/gEJrLHVTYku7UA6/nwL4
         eywjMO2A+LT0Jh/kcsqn0nBiqDTQxVj550YX3hr3mbdcNrsPN3JvQqvHoYviSwyhSCMw
         vSwI1QR2DGjrHVyi4sHG6RcC9f+Lfyc4iKAZ9k9TxmpxmfbAIkg9z+Cb4OSsbt0j6JWs
         +mCd8dLGcep25adCStowenGpHPSjhc7FxS5lVCKA+hvgMJnJBLRIe+VNMZ0x53gh7C6r
         a8qA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=A9T00Jly;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jv10-20020a05621429ea00b004ad26106504si1105659qvb.334.2022.10.04.09.29.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Oct 2022 09:29:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=A9T00Jly;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:47780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ofknj-0003eH-Up
	for alex.bennee@linaro.org; Tue, 04 Oct 2022 12:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1ofkEp-0007YD-MN
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 11:53:47 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:55108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1ofkEn-00042l-PS
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 11:53:43 -0400
Received: by mail-wm1-x32a.google.com with SMTP id iv17so9190599wmb.4
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 08:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=iKvtRFlETc8cK06yBbpkgkrxukcKxfCgAL5rhfNg2JU=;
 b=A9T00JlyrzQDW5Ww4wDx8cQLSRouDbVnuAtaAEEfTvsUNsfXam1en5gd5+GhW2ZKLW
 8Pcy08TrNhcv42UQcRjLheNJSDhP9qNeb1xXlsoQJ/v26ZH9A0Br9S8NM8QyHdjm3/HO
 icN1fZGHDMKC2PTcVpLd0Ra+6PIA7bJSlAFC2Z7glZd4Ak9KxzwX+H9HmHZQyVE0VNVp
 Z+OMURWHVmfW36SEJQjNZ+o2D2XOHWaSmMh4Jk5stgQnmUPbj061NdrTa5bSRgDs69eI
 vgZAzUK97PMoBO7tsbCUC2f4XCmqtGSx25VtJeUJXR34mSYQKEMJXQl2NXuTQLAuJ919
 Yzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=iKvtRFlETc8cK06yBbpkgkrxukcKxfCgAL5rhfNg2JU=;
 b=7EZB6ZF02+OfxzDZiJtqi+Ktc26WHnlMzdsYARerlMFa+QQQlS6jClcLaLWYTPg4J3
 V6iy8JEP/qef6AiogXBM8yNLd+gMeirtBDngONIHajJ/qniN/Mp5dgv+YfN7QQEX2wjl
 qWKQVGX32otTBlw3WH1gs3hc27aMVqMXHVZv+O/ilwVloGiNIBUNpAtNQrG5KaXNuUW4
 oxrxtEgd94fSHwAFfl9PnZtr9XOHPmbFJ2EogriXbUlq+yWmSJMuqQJrHmEJLaBewBZr
 hUeyzK5DdRJvmqy3eRruFra+kMzTb3nDMojBDy+OGl97HJ6fY1Rt0Zm+QpDn6ldCsxoE
 lk/A==
X-Gm-Message-State: ACrzQf0pg+LqjJu0jMMLMXmxn2zM4jsHck7kFOEN88+FitlTKdRZmZ3h
 /P0niM7MpkBPvJGCx9O1iOOjLuu0GnFdlau0jE2o3g==
X-Received: by 2002:a05:600c:1989:b0:3b4:b6b6:737 with SMTP id
 t9-20020a05600c198900b003b4b6b60737mr297487wmq.79.1664898818683; Tue, 04 Oct
 2022 08:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221004050042.22681-1-joel@jms.id.au>
In-Reply-To: <20221004050042.22681-1-joel@jms.id.au>
From: Hao Wu <wuhaotsh@google.com>
Date: Tue, 4 Oct 2022 08:53:26 -0700
Message-ID: <CAGcCb12BJpO+xeFwuvZjswFGgvS-_hzqb8EWeiK68uLMCH12cQ@mail.gmail.com>
Subject: Re: [PATCH] docs/nuvoton: Update URL for images
To: Joel Stanley <joel@jms.id.au>
Cc: Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>, 
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000ad0d1505ea377683"
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=wuhaotsh@google.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_PDS_OTHER_BAD_TLD=0.01,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z/F7Z7LYXYEG

--000000000000ad0d1505ea377683
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 3, 2022 at 10:01 PM Joel Stanley <joel@jms.id.au> wrote:

> openpower.xyz was retired some time ago. The OpenBMC Jenkins is where
> images can be found these days.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
>
Reviewed-by: Hao Wu <wuhaotsh@google.com>

> ---
>  docs/system/arm/nuvoton.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
> index ef2792076aa8..c38df32bde07 100644
> --- a/docs/system/arm/nuvoton.rst
> +++ b/docs/system/arm/nuvoton.rst
> @@ -82,9 +82,9 @@ Boot options
>
>  The Nuvoton machines can boot from an OpenBMC firmware image, or directly
> into
>  a kernel using the ``-kernel`` option. OpenBMC images for ``quanta-gsj``
> and
> -possibly others can be downloaded from the OpenPOWER jenkins :
> +possibly others can be downloaded from the OpenBMC jenkins :
>
> -   https://openpower.xyz/
> +   https://jenkins.openbmc.org/
>
>  The firmware image should be attached as an MTD drive. Example :
>
> --
> 2.35.1
>
>
>

--000000000000ad0d1505ea377683
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 3, 2022 at 10:01 PM Joel =
Stanley &lt;<a href=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><a href=3D"http=
://openpower.xyz" rel=3D"noreferrer" target=3D"_blank">openpower.xyz</a> wa=
s retired some time ago. The OpenBMC Jenkins is where<br>
images can be found these days.<br>
<br>
Signed-off-by: Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au" target=3D=
"_blank">joel@jms.id.au</a>&gt;<br></blockquote><div>Reviewed-by: Hao Wu &l=
t;<a href=3D"mailto:wuhaotsh@google.com">wuhaotsh@google.com</a>&gt;=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0docs/system/arm/nuvoton.rst | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst<br>
index ef2792076aa8..c38df32bde07 100644<br>
--- a/docs/system/arm/nuvoton.rst<br>
+++ b/docs/system/arm/nuvoton.rst<br>
@@ -82,9 +82,9 @@ Boot options<br>
<br>
=C2=A0The Nuvoton machines can boot from an OpenBMC firmware image, or dire=
ctly into<br>
=C2=A0a kernel using the ``-kernel`` option. OpenBMC images for ``quanta-gs=
j`` and<br>
-possibly others can be downloaded from the OpenPOWER jenkins :<br>
+possibly others can be downloaded from the OpenBMC jenkins :<br>
<br>
-=C2=A0 =C2=A0<a href=3D"https://openpower.xyz/" rel=3D"noreferrer" target=
=3D"_blank">https://openpower.xyz/</a><br>
+=C2=A0 =C2=A0<a href=3D"https://jenkins.openbmc.org/" rel=3D"noreferrer" t=
arget=3D"_blank">https://jenkins.openbmc.org/</a><br>
<br>
=C2=A0The firmware image should be attached as an MTD drive. Example :<br>
<br>
-- <br>
2.35.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000ad0d1505ea377683--
