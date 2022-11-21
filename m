Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp2464171ejx;
        Mon, 21 Nov 2022 07:10:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6Qv1VFqMSBeCPpKGNihjrruSZDJ8gXQo6w3CY8yXypF520smggbylTRwnNM2LX54ClWWcp
X-Received: by 2002:a0c:f744:0:b0:4c6:911b:38d8 with SMTP id e4-20020a0cf744000000b004c6911b38d8mr6287150qvo.63.1669043435455;
        Mon, 21 Nov 2022 07:10:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669043435; cv=none;
        d=google.com; s=arc-20160816;
        b=X5YAf8FgL3C4iVmOdrZn1TNjOLpMUKN16IzDUpRcZbZXpPez33R38S3etYIotfxgl3
         8+0ANQQuAfln6KofcoUMI3FxkDlWs5viUznBIfHqI33PqVjkNGE3PiW17aSz2n/HqAw0
         uCdGRUuS2gO3c95trl2ExmQb/LFTjHMJYrM1rmthX8d0/hdZkHw4elGR9UgLSkQG5qWU
         2QtsBp8wUN/FTJYbjylwBuMmFT0gDtKTJlSAGJxm7ywTq1f1xeDuAMIwbafUBdzs0T0L
         +2pfgKnTLfi9St9Yg+FXBQ1roUgjfKY7cfprjSwPEi8DGhu4n5EcXm5gsKnuJowAV1KQ
         zYVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=xFY009GFhT1UuTyDYlXOHAwIOmP6sgsC0FRZfkajRg0=;
        b=YuMIlBOsnTzCW1BW7gIigdMfSB3n8jx9DJUuFx4G0+85idbKwXwo7C+QHOyE3at5Z0
         GDs87KeCyL86K5lhGhQW0przlflDexbvfSbFq29ASUYi898gHS1ZgGgb2HYGQOLfoEv8
         5zHd3RgIIt27i2kYQNNdMxSqx/dENS87ANE7ohA8WKHLugrU5Tve+SXTg3nqlyalalJ6
         zRasHW6Ut8gID6wlKNTB39WI3WQOo9RxYmODkq89NosuKsCRWlTXrqeUgofpAq48Npp4
         NeWqsQWCl5La9gaBnBnSSg2wWy4tA4c/UlAD73rclz8sKUnuRZugPIeIUV2+h8vPWbsj
         iVmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZStvIAxq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6-20020a372d06000000b006fb3078411asi5864052qkh.635.2022.11.21.07.10.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Nov 2022 07:10:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZStvIAxq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ox8QZ-00041j-6F; Mon, 21 Nov 2022 10:09:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1ox8QW-0003y9-Tp
 for qemu-arm@nongnu.org; Mon, 21 Nov 2022 10:09:40 -0500
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1ox8QR-0002cN-K8
 for qemu-arm@nongnu.org; Mon, 21 Nov 2022 10:09:40 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-398cff43344so66476957b3.0
 for <qemu-arm@nongnu.org>; Mon, 21 Nov 2022 07:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xFY009GFhT1UuTyDYlXOHAwIOmP6sgsC0FRZfkajRg0=;
 b=ZStvIAxqAZ2tTIdsnX7o6+lLXp6lWyGBWAuOBOuHWlot/oisbpSj0jNDPRjl5GCWjU
 zbN/VPRatpt7QWHv2OCrYOxfqKBwUVSwUyWaTRANLC/052Nn3o2iUsxwWKBulxMOY6rl
 lY7O7O3krcah8kyZEgej7TKNdV6JP4/J8n9AFj3VT5oaU7C8vH4hZeNbXos9wBekU8CE
 ZcqTdrO5+bk+7aFAG8aoTh0jbWU7zVCh/i4CG2Sw/OWz523xkAPkIqL5x91lzkSeGe0a
 3G9rSZtIFbT0V9/1rdx9igzUv4/GkJUCL4Z/4AchV8dVEr6grDWAyH7U4Nb945KO3XmQ
 HZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xFY009GFhT1UuTyDYlXOHAwIOmP6sgsC0FRZfkajRg0=;
 b=r+61Ld/TDjm0+tNQla9R3fDjorqE53FjFFwgmThcK+O1brGlTuYnXOJoabuNMW6tJ+
 ATg2yU6ROcOxixVpslCLR8QNR7qTguYeqzS+DDWjWBwicwDHVR9+nUI9yDvrwgvkUJFr
 EKTML0ZMOIp2fvkkcmBpUGZ6yzQ8ahSnlBg5rIuzRFn6D/aG2uJedSvMLnezojHB1So4
 ooR3tVj9AGI3AY33+K9402PatMHQyrXKgx9edUdOhw4E7s2+HZ0CYT8CYgFos9MNR5hZ
 9oyDqRrPN2qS8ed4Urn0raX5eJgfQlO5AmdIOflJwf+rg0mEsoEFgJRKYEEN4eAd4tIY
 7dgg==
X-Gm-Message-State: ANoB5pkh4P02QHyKc/ZlwP+GGTmz+okbL67EpY9gDiUIkpXVq6YC2SS7
 mnP/JQh7cvmxpTXhhxbOfsfga1qLlrBBHijK520=
X-Received: by 2002:a0d:e384:0:b0:35c:5c82:4664 with SMTP id
 m126-20020a0de384000000b0035c5c824664mr6094903ywe.306.1669043374403; Mon, 21
 Nov 2022 07:09:34 -0800 (PST)
MIME-Version: 1.0
References: <20221121134605.2762683-1-tkutergin@gmail.com>
 <CAFEAcA8Sqfud80PbJr361kJPSOH8aUw-r2eku0T2idghy0Evqg@mail.gmail.com>
In-Reply-To: <CAFEAcA8Sqfud80PbJr361kJPSOH8aUw-r2eku0T2idghy0Evqg@mail.gmail.com>
From: Timofey Kutergin <tkutergin@gmail.com>
Date: Mon, 21 Nov 2022 18:09:23 +0300
Message-ID: <CACKEeRNmSxFxtaBhFrSFx4ymHvqo2VC76GMmVSVwJiLbtco9oA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: added cortex-a55 CPU support for qemu-virt
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000072350605edfc716a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=tkutergin@gmail.com; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Dh1ihTcSAAWS

--00000000000072350605edfc716a
Content-Type: text/plain; charset="UTF-8"

Hi, I am very sorry - still confused sometimes by the process.
Done
BR
Timofey


On Mon, Nov 21, 2022 at 5:25 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 21 Nov 2022 at 13:46, Timofey Kutergin <tkutergin@gmail.com>
> wrote:
> >
> >   cortex-a55 is one of newer armv8.2+ CPUs supporting native
> >   Privileged Access Never (PAN) feature. Using this CPU
> >   provides access to this feature without using fictitious "max"
> >   CPU.
> >
> > Signed-off-by: Timofey Kutergin <tkutergin@gmail.com>
>
> Hi; it looks like you forgot to cc qemu-devel on this mail.
> All our automated tooling looks at that list to find patches;
> would you mind resending the email cc'ing that list as well,
> please?
>
> thanks
> -- PMM
>

--00000000000072350605edfc716a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, I am very sorry - still confused sometimes by the proc=
ess.<br>Done<div>BR</div><div>Timofey<br><br></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 21, 2022 at =
5:25 PM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter=
.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Mon, 21 Nov 2022 at 13:46, Timofey Kutergin &lt;<a hr=
ef=3D"mailto:tkutergin@gmail.com" target=3D"_blank">tkutergin@gmail.com</a>=
&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0cortex-a55 is one of newer armv8.2+ CPUs supporting native=
<br>
&gt;=C2=A0 =C2=A0Privileged Access Never (PAN) feature. Using this CPU<br>
&gt;=C2=A0 =C2=A0provides access to this feature without using fictitious &=
quot;max&quot;<br>
&gt;=C2=A0 =C2=A0CPU.<br>
&gt;<br>
&gt; Signed-off-by: Timofey Kutergin &lt;<a href=3D"mailto:tkutergin@gmail.=
com" target=3D"_blank">tkutergin@gmail.com</a>&gt;<br>
<br>
Hi; it looks like you forgot to cc qemu-devel on this mail.<br>
All our automated tooling looks at that list to find patches;<br>
would you mind resending the email cc&#39;ing that list as well,<br>
please?<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--00000000000072350605edfc716a--
