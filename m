Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2793317lfm;
        Fri, 3 Jul 2020 13:41:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLrNLA6JMIaPqcGPgFioVjRxsQQ0AYh09nq17mAgqtBWyHuUFRLvduPCgHvUOy7FamwEjg
X-Received: by 2002:a25:cf43:: with SMTP id f64mr61098326ybg.456.1593808903213;
        Fri, 03 Jul 2020 13:41:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593808903; cv=none;
        d=google.com; s=arc-20160816;
        b=I83IXbSoRRMKE544btihdd2aGhcqXLniSWXqOH80lXuQHdpx1mUetxQB7yjNk1utgs
         MpGCFSge1DZGYsiGL6gi9evQ+omvb+Ch2kEmMO1Ln3Q8y/WLij4iFBI5mwM3JDwj8q6X
         VniFaOinJ1yZkzqlT/iod6ljO2d+eTWyxOJvct0ZPmFpFVj+BX3ba3U2HAS00rWRm/+2
         Bwr6WDJdspRDDAsTCajSKYWGIwzSZYysTR/fBdyfsjKG1LgW2EhTVd984zMT0BQWZViF
         qL8Oal5cODvx3m1UnMfhzekeFO0u20pqM9r2bXNMAma2hLdqSNODJiftAQDja6LQaW6J
         qQoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=cKBz1OF/qMRx6//rmFlziZ4XnepphOoCK4gWS2boX0U=;
        b=PxqNWYYE+W5LspVxK+CIUWfSW6XP1K8J1+fqYYugWg904kU0k0BnHxNLxiY65j/j3u
         B/LHcpZInF7Wokq7cVSltBvbhaT7RjW5Lhty5kNLBDEBxUxBTLmreq/0LTFhXpB1KccY
         K761StQeA2+mTMolpnA3TLlpuyK1jrYMXVioz8SeoR015D+iRwQSK03cQANU+u9+BQn7
         ORsO/5R6btXruKpBks2gLCxJjkehn+8R2KMNxhoCEPpjbLbVis5Jg9GqeGW3ZeHpKIzr
         oBBylH8Z5a6begbs9khG6jgOBoIJhtN84z+dTCuJvImzkFAfJJxwndYcQQ35l0ggwRO9
         ZlOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=HwP+Dtzi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n8si4386697ybb.6.2020.07.03.13.41.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jul 2020 13:41:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=HwP+Dtzi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:36702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrSVC-0000Mb-In
	for alex.bennee@linaro.org; Fri, 03 Jul 2020 16:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jrSV3-0000Ly-QJ
 for qemu-arm@nongnu.org; Fri, 03 Jul 2020 16:41:33 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d]:36051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jrSV1-0007O3-V6
 for qemu-arm@nongnu.org; Fri, 03 Jul 2020 16:41:33 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id 64so11454575vsl.3
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2020 13:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cKBz1OF/qMRx6//rmFlziZ4XnepphOoCK4gWS2boX0U=;
 b=HwP+DtziY9gB7I68z/qr3u8GCqrksK3eZqV6gpQ7tgdxpSAjNkCOfcIbMXwVE2x4yy
 u/wXLW0o1fqQ8qXNErsxw6XEmS/+7c6Xk459k5AIxVtHJdig8PEZN3PDOQiOfIAA3hpT
 w3XmBaueZzx/w5Z2zLOGm2cQCFakX7w7W1WkemU0hr5u7lU8YU0B+VzErfUDeXXH8tFX
 Il66o5hPh+QX9UpOzGDiD2kvP84niQUcetDJJzGqdWxG6T890rgOXmGdA0I84Ega+ADQ
 QGI2MPuDNpKmzrhjn93ZZeTeQeYrfKvuxqnSqsGdtQ9NHSdBmftO8JT12tyrIK94u03m
 R0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cKBz1OF/qMRx6//rmFlziZ4XnepphOoCK4gWS2boX0U=;
 b=aQyRB3xLnwJDYFaR0aGEt6UtrBwPGSbWl2puzCZkqONqlsqqqxo+j2Jg6aSGHq24t7
 u53T3787zDT2iIjiDfRdEF9D/c+3TwPQcsW2eB43JZpTnKnOtHIUXsCQWLfV9Unu4jWt
 TdcII+cjPimuRrhmT0fv/yTGI/5MwikBy6p2aGL6Ia8aHOvesKOndJ+oh/JA9yDSBtJC
 KVzSNvg5yflRXLX/ARxzUN6qRjEOlYw4cW6VOldeNw0QU1V50C1ZTNbKNU0OgdUFEEj2
 oyJwfJrFyQo0DOVN2uRW6qvv3aN4gX/b/k4O4RfkFhMOIa6U9gApGWEI0igAblcLMZK3
 oUMA==
X-Gm-Message-State: AOAM5311Q5YHRT1WMpLkopn8fnzK/o3xAzAo7/XoP6X9qTzffO5Irvbk
 VvmWWg5KYT4zU8oVKCbYA4IXutjvWhFbWPCXKAXPWQ==
X-Received: by 2002:a67:d88c:: with SMTP id f12mr26472087vsj.92.1593808889304; 
 Fri, 03 Jul 2020 13:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200626235519.591734-1-hskinnemoen@google.com>
 <CAFEAcA_3y3XoF6BsYUt19f2CvyseahSEZWfY0iQxByJKaMA29w@mail.gmail.com>
In-Reply-To: <CAFEAcA_3y3XoF6BsYUt19f2CvyseahSEZWfY0iQxByJKaMA29w@mail.gmail.com>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Fri, 3 Jul 2020 13:41:17 -0700
Message-ID: <CAFQmdRa2isDEFDWiQcKut63RkOjsoa8Fxw-Z0bB19kEd41euaQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] Add Nuvoton NPCM730/NPCM750 SoCs and two BMC
 machines
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>, 
 CS20 KFTing <kfting@nuvoton.com>
Content-Type: multipart/alternative; boundary="000000000000b0436b05a98f8c4c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=hskinnemoen@google.com; helo=mail-vs1-xe2d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -185
X-Spam_score: -18.6
X-Spam_bar: ------------------
X-Spam_report: (-18.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=_AUTOLEARN
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
X-TUID: es/rnAlXY3jo

--000000000000b0436b05a98f8c4c
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 3, 2020 at 5:27 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Sat, 27 Jun 2020 at 00:55, Havard Skinnemoen <hskinnemoen@google.com>
> wrote:
> >
> > Time for another refresh of this patchset. Sorry it took so long -- I've
> been
> > trying to figure out why the Winbond flash model isn't working with
> > npcm750-evb, and I'm fairly convinced the number of dummy cycles in DIO
> mode
> > should be 4, not 1. Unfortunately, I don't see any other machines using
> Winbond
> > flash in DIO mode, so it's hard to prove that it's correct. I'm planning
> to
> > post a libqos-based test suite separately.
> >
> > I'm also planning to add the vbootrom to qemu as a submodule, similar to
> the
> > other roms, but not in this pathset (let me know if you do want me to
> include
> > this in the series).
>
> Hi; it looks like codewise this patchset is ready to go in
> and it's all been reviewed. I see however that all the
> new files are GPL-v2-only. We usually prefer GPL-v2-or-later
> for new code: is it possible to use that license instead ?
>

I sent an e-mail to our licensing team to see if there are any issues with
doing that. I don't expect a response until next week though, since this is
a long weekend.

I'll send out a v4 with updated headers if they approve.

Thanks,
Havard

--000000000000b0436b05a98f8c4c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Jul 3, 2020 at 5:27 AM Peter Mayd=
ell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.or=
g</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Sat, 27 Jun 2020 at 00:55, Havard Skinnemoen=
 &lt;<a href=3D"mailto:hskinnemoen@google.com" target=3D"_blank" class=3D"c=
remed">hskinnemoen@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Time for another refresh of this patchset. Sorry it took so long -- I&=
#39;ve been<br>
&gt; trying to figure out why the Winbond flash model isn&#39;t working wit=
h<br>
&gt; npcm750-evb, and I&#39;m fairly convinced the number of dummy cycles i=
n DIO mode<br>
&gt; should be 4, not 1. Unfortunately, I don&#39;t see any other machines =
using Winbond<br>
&gt; flash in DIO mode, so it&#39;s hard to prove that it&#39;s correct. I&=
#39;m planning to<br>
&gt; post a libqos-based test suite separately.<br>
&gt;<br>
&gt; I&#39;m also planning to add the vbootrom to qemu as a submodule, simi=
lar to the<br>
&gt; other roms, but not in this pathset (let me know if you do want me to =
include<br>
&gt; this in the series).<br>
<br>
Hi; it looks like codewise this patchset is ready to go in<br>
and it&#39;s all been reviewed. I see however that all the<br>
new files are GPL-v2-only. We usually prefer GPL-v2-or-later<br>
for new code: is it possible to use that license instead ?<br></blockquote>=
<div><br></div><div>I sent an e-mail=C2=A0to our licensing team to see if t=
here are any issues with doing that. I don&#39;t expect a response until ne=
xt week though, since this is a long weekend.</div><div><br></div><div>I&#3=
9;ll send out a v4 with updated headers if they approve.</div><div><br></di=
v><div>Thanks,</div><div>Havard=C2=A0</div></div></div>

--000000000000b0436b05a98f8c4c--
