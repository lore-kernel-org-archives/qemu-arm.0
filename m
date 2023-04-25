Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3751087ejm;
        Tue, 25 Apr 2023 13:49:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350bw6y5HTSC3Z2V9hHJYnkaqonuHe4+puczWS1luY0N8Pdl2X+YV3OhTpaedVtPWFPJQJzfV
X-Received: by 2002:a05:6214:d61:b0:5f1:683e:9bd6 with SMTP id 1-20020a0562140d6100b005f1683e9bd6mr35787479qvs.9.1682455774977;
        Tue, 25 Apr 2023 13:49:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682455774; cv=none;
        d=google.com; s=arc-20160816;
        b=yCmRgk/yYcFjSus09KNFPPK5G1Bs/MTtgP0jaBPQFa+SvKmkhupqfymtHnFMFEOO0r
         eW/8oTvLaXIx75mvoGL3Sw/grPDPnNsCT/L76Q2KdK8IK5f56uLVSSAf357o0Ko1RhgX
         fa6K8F8R/3mlORcEGp6BX2FZMugXr+bDY9FxzN964O/LEogidusL2FH91Ws8JETjohqs
         vJ0FRGaXXszzTZ3BgmDD0lHlKF4zjrEGKlBPDaoPSkbUNh7Yc0jCra1BE0mFOFFSdD5n
         ssXBL5J7ROf9btUcVqtg7iMQob7d1SruHX5fhaMucVHnmTaUCUsqStVaZZDsz5dJfXV2
         rRvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1GkCe639wVFgBuKcU9lMq8Dhrnoc9RqNORPOb1jtTPw=;
        b=NX1Htt16B2PNecGBpHg8GnShfVY2lsRBd1lD7zo/ycQUOXcZKteC0dDh71iwv1vWWZ
         h9+fZonUg4GKG2XOYFChNC0oJL0HlrlLMfNjTjuYzigybctMNyh+1SB7yum/AY2aafei
         cxfxqkDgs9yK2GcMqxEf2QtsXtizCCGufLyThQFBj5LUyz+KI7bdTKEeDOz2jaXcv/QX
         hwh/bZ45Hq+zfcGmro46z6PeIBh66kEhpjDRxbod9rPfsJlGUBW5WKZ1FqVcUMW5y3Q+
         SyhwuVypp0vOSl46aueKZhxYS2LsQPyXtAIgdhGGNNoCmZeNBN7ajgTkO8kv8prNSwNa
         F7yQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20221208 header.b=jMYheMKm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13-20020a0562140d8d00b0061652154306si1150294qve.525.2023.04.25.13.49.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 13:49:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20221208 header.b=jMYheMKm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prPbG-0004Tc-KI; Tue, 25 Apr 2023 16:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1prPbF-0004M7-BR
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 16:49:21 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1prPbD-0005YM-TD
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 16:49:21 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-4af3773448fso7128a12.0
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 13:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1682455757; x=1685047757;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1GkCe639wVFgBuKcU9lMq8Dhrnoc9RqNORPOb1jtTPw=;
 b=jMYheMKmb+9nE6PPrGwsKE2hGOBBM9OqBwcQ8vBMxVMP3rl6Gq3dxmfEZUc1PuvUXZ
 tVs+U1aOhPc4hlffPebPFwDVwXNjh5C0/4zNHGhArOIVqWuB1Jg+XcIdWX84RHH+di0L
 ld3m/Na3PuZJucf+z1QiHyAVUwC3yHWG1YzTdEOgAYjIeES8N7ujNNeJPfbvFHS4QDn9
 0mwkig3mWSVT2O0IGFUwS9c0wR9UhHM1JZ8ItgoaJTmK/Q5gdkOyxa35B/nu26AEGWa8
 Mk9bhoQDM2DqLmmWgB93vtw4LkSm0AsDa61M1sZXWrj1IYEomw1YYr8HJY9PkK+I2g3p
 jYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682455757; x=1685047757;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1GkCe639wVFgBuKcU9lMq8Dhrnoc9RqNORPOb1jtTPw=;
 b=aVKNFWmg16LFwUtsbiDnkqe+OcCt/MtNH2r9WvLbdT2nFQwOkxjgpJVZph4QgCgTKE
 /QPlN5UM+m0K4suAt9LAzcv5AWBK1CaXTOOELCBARTZsjZfPTsnuA6aGu+12dmpCOl7A
 Z4f4UeaSX66ZmO+OeN9jc6MfsTkaSgfit5CymBC2vK3e5uZuoA1Jnq7HiqdDEwN+j6LM
 /g4nWfc3tMUfnsHuXtfTLKCQE3TDBd2OtKwjzkGoxjyBhW8dmzS4PuQSBX/z0Xv9AINS
 mEq24uf66+0rp3QxlP/+uh1nMHCrqC8ctYqt8aA0s5qZ5XMYzNwwjYRih7+64ThN0rQj
 O+RA==
X-Gm-Message-State: AC+VfDwbbbMlofa/RpCwDQtL+QQZpZsIvNCAlqFACL3aD+bkj/9AuESH
 2wBC/zfQSdO5/O0OyRvuOGrktQXbakRopAB462v9cw==
X-Received: by 2002:a05:6402:524d:b0:506:90c4:b63b with SMTP id
 t13-20020a056402524d00b0050690c4b63bmr21880edd.4.1682455757426; Tue, 25 Apr
 2023 13:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221003173810.1933849-1-venture@google.com>
 <CAFEAcA9x7oC9sQy8XNJ8-WRc3X=qBVL1nMLB==dGM=+O5Z-CAQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9x7oC9sQy8XNJ8-WRc3X=qBVL1nMLB==dGM=+O5Z-CAQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 25 Apr 2023 13:49:06 -0700
Message-ID: <CAO=notw1yJeKPdjU65dAXbDgY0y8u1s5MDCcymLqCiw=pTcRiw@mail.gmail.com>
Subject: Re: [PATCH v2] hw/net: npcm7xx_emc: set MAC in register space
To: Peter Maydell <peter.maydell@linaro.org>
Cc: hskinnemoen@google.com, kfting@nuvoton.com, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, jasowang@redhat.com, Hao Wu <wuhaotsh@google.com>
Content-Type: multipart/alternative; boundary="000000000000c5e8a705fa2f4163"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=venture@google.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: 7SNzdaQgbRAa

--000000000000c5e8a705fa2f4163
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 6, 2022 at 6:18=E2=80=AFAM Peter Maydell <peter.maydell@linaro.=
org>
wrote:

> On Mon, 3 Oct 2022 at 18:38, Patrick Venture <venture@google.com> wrote:
> >
> > The MAC address set from Qemu wasn't being saved into the register spac=
e.
> >
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > Signed-off-by: Patrick Venture <venture@google.com>
> > ---
> > v2: only set the registers from qemu on reset
> >     once registers set, only read and write to them
>
>
>
> Applied to target-arm.next, thanks.
>

I think this was missed.  Please take a look.


>
> -- PMM
>

--000000000000c5e8a705fa2f4163
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 6, 2022 at 6:18=E2=80=AFA=
M Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.mayde=
ll@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Mon, 3 Oct 2022 at 18:38, Patrick Venture &lt;<a href=3D"ma=
ilto:venture@google.com" target=3D"_blank">venture@google.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt; The MAC address set from Qemu wasn&#39;t being saved into the register=
 space.<br>
&gt;<br>
&gt; Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=
=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.co=
m" target=3D"_blank">venture@google.com</a>&gt;<br>
&gt; ---<br>
&gt; v2: only set the registers from qemu on reset<br>
&gt;=C2=A0 =C2=A0 =C2=A0once registers set, only read and write to them<br>
<br>
<br>
<br>
Applied to target-arm.next, thanks.<br></blockquote><div><br></div><div>I t=
hink this was missed.=C2=A0 Please take a look.</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
-- PMM<br>
</blockquote></div></div>

--000000000000c5e8a705fa2f4163--
