Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp3942582lfq;
        Tue, 22 Feb 2022 17:28:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXYPcjfsP9vxWuArny8DDjEun5TpFsWUxQKX8476jkCE2VPlS+aycK70rkjdWAT7qP+kif
X-Received: by 2002:a05:620a:13a9:b0:47c:cf9:b4c2 with SMTP id m9-20020a05620a13a900b0047c0cf9b4c2mr16428981qki.580.1645579727688;
        Tue, 22 Feb 2022 17:28:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645579727; cv=none;
        d=google.com; s=arc-20160816;
        b=aMi3gqC2FKVIgBrAvpjoPD77L5gkVvNontm7wxX7hKYnncJ2Lvc6FhCkAro13efXJL
         FaIzbx06fH1dMpBHPlCKJf4+kNhs0iILVyr1btQBx45dcK4LItajfHlFGjRucOSK17He
         v6mHGQf2TH+NcDrsgXOLNJwcbToNyuVwvL6NQ7BbyurnOWG/l49nSkP5DC0QFfVWMRTa
         6IBqIG2sqNz5v1G2Z6tVgnKNFXvtL68f5syzlKVjKfX2z8aTvYddvc8r77WYNS6kHxb4
         hmG/0xvxeWHaF/teiru6wfIKO9dm+CTds4ocq5iFZCJN40u94RqsRuPCyi2ZkMHT6TFZ
         OWeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=W5ezsdS0pLZ4SGO0Mgn7JeEjqq51cR5iAp6s1yIj4cA=;
        b=o/Ozoc0j9chSnr5PpNl/LrKOOCqJ4r5aMoVvcZRoUCQLo7VD/512exnMoUMQAP0KUv
         3DOoHrySbaUe/E+tGNHLRoK32FOvCrAd3ALkRye5DsnGjpbxI96GFw2bTo2fTm7HWL2V
         MfI18HBhmD9hC45+EfByf6dZ6XSgC7RWEtRgua6SIeWly4xF7P2jBsUTxvZAnkYbIGel
         A+Spa6F3yTf2Q9qMKZqFJBH3drXFJEJuuT49ADIgfX8H6QWMBC7BOZ2351xIxpqw2QQp
         u17KbpOsz6I5juYI7f9Wshqzhsk8m3TH0YvN8wXtm9eg3dFkzoKqIxwGypfYJZF4WHi7
         05ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=hX0s90jT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9si712168qkg.291.2022.02.22.17.28.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Feb 2022 17:28:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=hX0s90jT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:33282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nMgSV-0003LJ-50
	for alex.bennee@linaro.org; Tue, 22 Feb 2022 20:28:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nMgSI-0003K6-Ow
 for qemu-arm@nongnu.org; Tue, 22 Feb 2022 20:28:34 -0500
Received: from [2607:f8b0:4864:20::933] (port=35547
 helo=mail-ua1-x933.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nMgSF-0004hq-9v
 for qemu-arm@nongnu.org; Tue, 22 Feb 2022 20:28:34 -0500
Received: by mail-ua1-x933.google.com with SMTP id k5so696524uao.2
 for <qemu-arm@nongnu.org>; Tue, 22 Feb 2022 17:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W5ezsdS0pLZ4SGO0Mgn7JeEjqq51cR5iAp6s1yIj4cA=;
 b=hX0s90jTMm/9d9MQkQUOm2R8cUz/1ZU8v71CNlfBSIwz7XZ4J63dGhie1cMAkJzYJz
 OpoDTJxHxkDBP4tBdQ7G9NaqD0ajCYxVh1Ct5um5YYpIm5DUULe/S7fq3VzX4YJR7+ie
 mrELEXkqCSOfznYf0X18cYBYcqvv6ylkLbFneOfSxkw/68C/t0G2QfuDHKkJvFkagTns
 3R8Le/lOJsIDUK4FO4RXj5SF1ikbAgSp3xPv5f9yCtUSeoElh0rSxAvrfKBzpzdEQ8LQ
 LUgOadhnS+IRn3wuDe5tlQxvMrsZzTfj2W7942G5SA+IaYICbmkVHTCXPqUe2hhVHirn
 PzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W5ezsdS0pLZ4SGO0Mgn7JeEjqq51cR5iAp6s1yIj4cA=;
 b=EvLyqZnyGHGsx7A9d6uqIZupfNP4Fp2vIyOlk3N8cnCc9vfzT82mGCChvOlJs+42gD
 TG43HYerv7Iitjo0sPMPyziJ6t0+LtN2r2AnIoRz4WjHG+LKPxqjkAlQVBRRkTmD2Rkk
 ixSp6yNVzmBp18CT0LuoAIfEdEc+cBfaVwZEaWDpOibKDSnmj3S+iV2Z473uXeMGKKEw
 6R9UbL+hGXqpibtWVogp2AfjizKOVrNdwyD5Eyqa63WuoFRmbdIAb4nDduMaTfsQQ20y
 XLWRHctC9buzhdzRmBQK7icBEwZK+u07R47vxco4j+qk7jpxciCvLpnx2VtP8KxSZ0BN
 w1Qg==
X-Gm-Message-State: AOAM531wF4MyR5F7AUr5ONJ7LZTrFIs854zBy9rK4kmOjRhl8GGT2uLN
 JZTDrJ2VYAIL7ZPW/s7LV/Ql1UgzESyn9sJufXR7+Q==
X-Received: by 2002:ab0:3343:0:b0:33c:defc:82b0 with SMTP id
 h3-20020ab03343000000b0033cdefc82b0mr10520560uap.46.1645579708948; Tue, 22
 Feb 2022 17:28:28 -0800 (PST)
MIME-Version: 1.0
References: <20220208181843.4003568-1-venture@google.com>
 <CAFEAcA8m2yhtih_+XCOJPUzAwtLuF2exF+vaa1woC7bYoryVXA@mail.gmail.com>
 <CAFEAcA_zfd=5bSMKwVbSk0LStcWcYxFosazhiGz0nb2z=upSHQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_zfd=5bSMKwVbSk0LStcWcYxFosazhiGz0nb2z=upSHQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 22 Feb 2022 17:28:18 -0800
Message-ID: <CAO=notx69LpfY2uHUaPeFSrRyNkoiATZ6-JQQrATT8jXGEfQWw@mail.gmail.com>
Subject: Re: [PATCH v3] tests/qtest: add qtests for npcm7xx sdhci
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 qemu-arm <qemu-arm@nongnu.org>, Shengtan Mao <stmao@google.com>,
 Hao Wu <wuhaotsh@google.com>, Chris Rauer <crauer@google.com>
Content-Type: multipart/alternative; boundary="00000000000000d10f05d8a562e8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::933
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=venture@google.com; helo=mail-ua1-x933.google.com
X-Spam_score_int: -161
X-Spam_score: -16.2
X-Spam_bar: ----------------
X-Spam_report: (-16.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
X-TUID: lbKrwaycA+Rf

--00000000000000d10f05d8a562e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gTW9uLCBGZWIgMjEsIDIwMjIgYXQgNTozMCBBTSBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlk
ZWxsQGxpbmFyby5vcmc+DQp3cm90ZToNCg0KPiBPbiBXZWQsIDE2IEZlYiAyMDIyIGF0IDE3OjMw
LCBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+DQo+IHdyb3RlOg0KPiA+
DQo+ID4gT24gVHVlLCA4IEZlYiAyMDIyIGF0IDE4OjE4LCBQYXRyaWNrIFZlbnR1cmUgPHZlbnR1
cmVAZ29vZ2xlLmNvbT4gd3JvdGU6DQo+ID4gPg0KPiA+ID4gRnJvbTogU2hlbmd0YW4gTWFvIDxz
dG1hb0Bnb29nbGUuY29tPg0KPiA+ID4NCj4gPiA+IFJldmlld2VkLWJ5OiBIYW8gV3UgPHd1aGFv
dHNoQGdvb2dsZS5jb20+DQo+ID4gPiBSZXZpZXdlZC1ieTogQ2hyaXMgUmF1ZXIgPGNyYXVlckBn
b29nbGUuY29tPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogU2hlbmd0YW4gTWFvIDxzdG1hb0Bnb29n
bGUuY29tPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogUGF0cmljayBWZW50dXJlIDx2ZW50dXJlQGdv
b2dsZS5jb20+DQo+ID4gPiAtLS0NCj4gPg0KPiA+DQo+ID4NCj4gPiBBcHBsaWVkIHRvIHRhcmdl
dC1hcm0ubmV4dCwgdGhhbmtzLg0KPg0KPiBUaGlzIGhpdHMgYXNzZXJ0aW9ucyBpbiBzb21lIG9m
IHRoZSBDSSBqb2JzLCBlZzoNCj4gaHR0cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11
Ly0vam9icy8yMTE2OTMyNzY5DQo+DQo+IDI1OC83MTcgcWVtdTpxdGVzdCtxdGVzdC1hcm0gLyBx
dGVzdC1hcm0vbnBjbTd4eF9zZGhjaS10ZXN0IElOVEVSUlVQVA0KPiA2NDMuMTZzIGtpbGxlZCBi
eSBzaWduYWwgNiBTSUdBQlJUDQo+IOKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAlSDinIANCj4g4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCV
4oCV4oCV4oCV4oCV4oCV4oCV4oCV4oCVDQo+IHN0ZGVycjoNCj4gKiogTWVzc2FnZTogMDY6MDY6
NTAuMjA1OiAvdG1wL3NkaGNpX0Y3RVRIMQ0KPiAqKg0KPiBFUlJPUjouLi90ZXN0cy9xdGVzdC9u
cGNtN3h4X3NkaGNpLXRlc3QuYzoxMDE6c2R3cml0ZV9yZWFkOiBhc3NlcnRpb24NCj4gZmFpbGVk
OiAoIXN0cmNtcChybXNnLCBtc2cpKQ0KPg0KPiDigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJUNCj4gLi4udGVybWluYXRlZC4NCj4N
Cj4gc28gSSd2ZSBkcm9wcGVkIGl0IGFnYWluLg0KPg0KDQpJJ20gc29ycnkgdG8gaGVhciB0aGF0
LCBJJ2xsIGhhdmUgdG8gcGljayB1cCBzb21lIGN5Y2xlcyBpbiBhIHdlZWsgb3Igc28NCmFuZCBz
ZWUgaWYgSSBjYW4gcmVwcm9kdWNlIHRoZSBpc3N1ZS4NCg0KDQo+DQo+IHRoYW5rcw0KPiAtLSBQ
TU0NCj4NCg==
--00000000000000d10f05d8a562e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 21, 2022 at 5:30 AM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Wed, 16 Feb 2022 at 17:30, Peter Maydell &lt;<a href=3D"mailto:pet=
er.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; w=
rote:<br>
&gt;<br>
&gt; On Tue, 8 Feb 2022 at 18:18, Patrick Venture &lt;<a href=3D"mailto:ven=
ture@google.com" target=3D"_blank">venture@google.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; From: Shengtan Mao &lt;<a href=3D"mailto:stmao@google.com" target=
=3D"_blank">stmao@google.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" ta=
rget=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; &gt; Reviewed-by: Chris Rauer &lt;<a href=3D"mailto:crauer@google.com"=
 target=3D"_blank">crauer@google.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Shengtan Mao &lt;<a href=3D"mailto:stmao@google.co=
m" target=3D"_blank">stmao@google.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@goog=
le.com" target=3D"_blank">venture@google.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Applied to target-arm.next, thanks.<br>
<br>
This hits assertions in some of the CI jobs, eg:<br>
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/2116932769" rel=3D"n=
oreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/jobs/21=
16932769</a><br>
<br>
258/717 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_sdhci-test INTERRUPT<br>
643.16s killed by signal 6 SIGABRT<br>
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80 =E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95<br>
stderr:<br>
** Message: 06:06:50.205: /tmp/sdhci_F7ETH1<br>
**<br>
ERROR:../tests/qtest/npcm7xx_sdhci-test.c:101:sdwrite_read: assertion<br>
failed: (!strcmp(rmsg, msg))<br>
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95<br>
...terminated.<br>
<br>
so I&#39;ve dropped it again.<br></blockquote><div><br></div><div>I&#39;m s=
orry to hear that, I&#39;ll have to pick up some cycles in a week or so and=
 see if I can reproduce the issue.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--00000000000000d10f05d8a562e8--
