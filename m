Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3835161njb;
        Tue, 10 Dec 2024 22:05:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXwu+fl9TFjGA/jPqSO1VSJSVr5RURxc91OuAnEoeDvbsXOgeQoSw/nlhOglrTMQTegDcFwkIIvSCHCPg==@linaro.org
X-Google-Smtp-Source: AGHT+IFw3Wus0mp9mhKed/k+/lBs2Hoz/R4g0UKD0bTPU0kQe1fb+lQYMt937wNeNTRkFfihJxMV
X-Received: by 2002:a05:622a:8c10:b0:467:6e45:218d with SMTP id d75a77b69052e-4678929e62amr36508061cf.3.1733897105318;
        Tue, 10 Dec 2024 22:05:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733897105; cv=none;
        d=google.com; s=arc-20240605;
        b=Ss07EqO3KqClJcxeo1bQdemzfVFJY1DI356k1lP5glNY3aZgHr5zRi3mqksZHcOVPq
         E3/LknQTho3in0fF8IQTuqM4Op4iK+utz6QKhNBIZA8EpbQVGsdqiXt/dUvyTaZrhJD4
         3699FyVhOx5FHArSyCmKWB3/FE74LzwR5UJ9VFA7Bfioh7z5HU6v5dA9ALvrbQux/Un6
         qvP9GqirmQTgaZ/GZZVYAsvHYYdjYqJL4cFHlY9ISJn6rjkEgvyT1IHi3Zxz28Kg4EM6
         N0p3xfnYbN+4Sq2q4DyMo5tmhmaRCGRg6zb1DTSQ6oj+W5Sjcu42cC8dHaxwnLdSK86r
         AfYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=too7R5d5Rjrj3yG4d82pn3b74IR7gm0FJCZ2xM/7jGo=;
        fh=iR8w2YO43hp220rBP0n8lc3F+8hoOalLc58sBN4iyCk=;
        b=OfpnHQCt+0Tii9DZBEW6Ww2jCl4RlTGzV2vhGRXKsL0kgegNoxoYsCh/0vBgVV4Kg2
         Uq7BX9oKGVCC1PkNN4zkUmxABp+YAZQkY0By8jG7ZSirVHR4xfnMqunM3lHQFvD4HGR+
         f5tOdXmRyG3U4p2VXPh8RwKZnMGFe6l8vCfUpo8lbjAooDLZ2upk9CIkJfKlueKfZ2X/
         7wM+7mKAqLSV/9QD/T5YB4JFlf3Ochb65uhcnbS4Vm7RfiNR5tniItEOOYXaDHLSqQVE
         aJwPoXp2cqJkYuh+8/QSJlPKTdGDDLvLWCQPHtUp0uBdlxEZHomufR2TZKGlGIGv5fUd
         XD1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=kDq0DUwB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4678d51387bsi3667201cf.176.2024.12.10.22.05.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 22:05:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=kDq0DUwB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLFpY-0006us-A0; Wed, 11 Dec 2024 01:04:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1tLFpX-0006ud-Bc
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 01:04:15 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1tLFpV-00057k-He
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 01:04:15 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2ee9a780de4so4743033a91.3
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 22:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1733897051; x=1734501851; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=too7R5d5Rjrj3yG4d82pn3b74IR7gm0FJCZ2xM/7jGo=;
 b=kDq0DUwBCe91B6V9X+YWmqsjslEbU9ok9hcbervDbdAk+W5edm4AMy512ZGpisxzJx
 cBxaXOfDEGNrbEaK89p0GFnk3NPZ4m/8QlkdRNBCk+GC4+wQL60F9gabC08ef1iQHtUE
 IKpmA/zopo4kaGmLSeZALLlb9bKAX+u12DDS8rLo+ZIZpNjxh0SPTye+3ezFFsnTCRIH
 cCDf4MK+J12zwmexcmGcaK+wKeOipLBJmFoaKPna7e080/jthqtPvx6y1weoflWpR+/7
 yh7sXhCe8xhoSQrYaUhNxdaxkVi411BukUcnSBHKdDeNi/ArFTQOYBae9m22fV7H3wob
 B/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733897051; x=1734501851;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=too7R5d5Rjrj3yG4d82pn3b74IR7gm0FJCZ2xM/7jGo=;
 b=HGRVmLFCwLkT6LRMHBVwjHmPcJU0R+wCNWS3eHj9zKGf1b9tdkkYGvjbz6L1LlrHD/
 mLQYj5hMcUDuEpaCfGTtXF1pqIhiN7Xjpwd93jHV3PGYZMjr1QUYY1fh4xq3+mY41Drf
 X/393IhRY2FXO6JR62imvXrwsgSj4E2pDV16QqExituoADOgmwzNAWTIaQI6+CnpSpCM
 /PbYtGITIhNJcXMxLTAiOu4FSw/FXhEhli3H9NwAzBxfJ6AZzya1fMoJkoU851H7N2JQ
 2XOpbwucuNWkSAVl9eaWnmjS2lmt7pT+bFxanrcfyXz31WZonR6r1GXrMuRwFRb0VcNS
 Y4Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDaVTjXj286TVjBOZmnctAbQ5purt3vHUhOg8SJrbZFOKT+/kRUflsqFyaXFCDg5cXLXQb7RQF8w==@nongnu.org
X-Gm-Message-State: AOJu0YzFZVi/urjS5PTyXW+DseGjqnPCVMFA9GhZ+iyoC8kH5UD47pwv
 rFjpQFhlEXPrD2oF1MyOBytYVVzh5BcIi1JxEOzbAHUCqlm4CNWzEHunEQTSZsVU7LhebUZ5EVV
 oCsqA5QHzFsy8MXVnHB/w9AMSi/d5kXP5lUyoRA==
X-Gm-Gg: ASbGncvwG17Qb/MTynrPCfDvJguDn1LKL6ubBVSuix32++JbUaBZaizM804nmj3Q0RY
 LSZz59NzY5vqxZdAGFLNFHNyqoG/yrfxtk2Y=
X-Received: by 2002:a17:90b:5110:b0:2ee:ab29:1a63 with SMTP id
 98e67ed59e1d1-2f127f8e7afmr2695817a91.3.1733897050986; Tue, 10 Dec 2024
 22:04:10 -0800 (PST)
MIME-Version: 1.0
References: <20241115014702.1663274-1-fea.wang@sifive.com>
In-Reply-To: <20241115014702.1663274-1-fea.wang@sifive.com>
From: Fea Wang <fea.wang@sifive.com>
Date: Wed, 11 Dec 2024 14:03:59 +0800
Message-ID: <CAKhCfscy_dq_d0+RqzdLvX5wcb56T8d7qnOLO1LeCr_33BOAfg@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/net: Support Marvell 88E1111 phy driver
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>, 
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000cd3f0c0628f85d92"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=fea.wang@sifive.com; helo=mail-pj1-x102b.google.com
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
X-TUID: 2lbrZiFiDpBi

--000000000000cd3f0c0628f85d92
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping

On Fri, Nov 15, 2024 at 9:44=E2=80=AFAM Fea.Wang <fea.wang@sifive.com> wrot=
e:

> When the ethernet PHY's compatible string is 'ethernet-phy-id0141.0cc2',
> it will be matched with the Marvell driver in Linux instead of the
> generic driver. They differ from reading the PHY register17.11 bit which
> is for 'Speed and Duplex Resolved' and the value 0 will clear
> phydev->link and stop the flow. To avoid getting stuck, change the
> constant return value in QEMU for the bit to 1 to keep the driver going.
>
> Signed-off-by: Fea.Wang <fea.wang@sifive.com>
> ---
>  hw/net/xilinx_axienet.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index faf27947b0..ee4b3afe9c 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -102,7 +102,7 @@ static unsigned int tdk_read(struct PHY *phy, unsigne=
d
> int req)
>              break;
>          case 17:
>              /* Marvell PHY on many xilinx boards.  */
> -            r =3D 0x8000; /* 1000Mb  */
> +            r =3D 0x8800; /* 1000Mb  */
>              break;
>          case 18:
>              {
> --
> 2.34.1
>
>

--000000000000cd3f0c0628f85d92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(0,0,0);font-family:&quot;Times Ne=
w Roman&quot;;font-size:medium">Ping</span></div><br><div class=3D"gmail_qu=
ote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, No=
v 15, 2024 at 9:44=E2=80=AFAM Fea.Wang &lt;<a href=3D"mailto:fea.wang@sifiv=
e.com">fea.wang@sifive.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">When the ethernet PHY&#39;s compatible string is =
&#39;ethernet-phy-id0141.0cc2&#39;,<br>
it will be matched with the Marvell driver in Linux instead of the<br>
generic driver. They differ from reading the PHY register17.11 bit which<br=
>
is for &#39;Speed and Duplex Resolved&#39; and the value 0 will clear<br>
phydev-&gt;link and stop the flow. To avoid getting stuck, change the<br>
constant return value in QEMU for the bit to 1 to keep the driver going.<br=
>
<br>
Signed-off-by: Fea.Wang &lt;<a href=3D"mailto:fea.wang@sifive.com" target=
=3D"_blank">fea.wang@sifive.com</a>&gt;<br>
---<br>
=C2=A0hw/net/xilinx_axienet.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c<br>
index faf27947b0..ee4b3afe9c 100644<br>
--- a/hw/net/xilinx_axienet.c<br>
+++ b/hw/net/xilinx_axienet.c<br>
@@ -102,7 +102,7 @@ static unsigned int tdk_read(struct PHY *phy, unsigned =
int req)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 17:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Marvell PHY on many xili=
nx boards.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D 0x8000; /* 1000Mb=C2=A0 */=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D 0x8800; /* 1000Mb=C2=A0 */=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 18:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--000000000000cd3f0c0628f85d92--
