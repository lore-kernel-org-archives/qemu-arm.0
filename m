Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp7926595ejc;
        Wed, 1 Mar 2023 23:48:23 -0800 (PST)
X-Google-Smtp-Source: AK7set8Zr+HloUxJmnAsYkwWkOKbplvldq9Sgk8ZE6o56zZcRxZHIR4udS1GAcpOwpIjYH0u5pZ7
X-Received: by 2002:ac8:7f42:0:b0:3b3:7707:9b92 with SMTP id g2-20020ac87f42000000b003b377079b92mr15813482qtk.15.1677743303429;
        Wed, 01 Mar 2023 23:48:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677743303; cv=none;
        d=google.com; s=arc-20160816;
        b=ZmFhuUn56RgPIdCVGNVnLEcH4qdXubFNwSBu5BHMqvty72+v/A7bSz6vPQ8tM1MJoq
         78bLfr+V5Rr4J9l5tpGHwaw/UWg/002MPGxMi9qlSqjrsKko5mUFi9v4FwHaf/3juzPQ
         O6kjsXT2zgul2XyTTG50n0FdC/sfOICsvFtjB1l3O8TXUjZ/vCoMcCoh2m5CjzJDAXFw
         Z2QQ970FdoukS5eyRhcbylNv47NNODfD0QM4jVVlry2c+WGT7ajE1jiWCm0MM4QewV0m
         tbRepzg8D/dzAmet1OWEpucve+dQn98ba/pzOrVrC3iXCZ4hbm8U8SZaARLQK+I3uhbH
         mZiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=0mhFrgAnHgTByDFhrfFTEJJB193JYzsbRj3b9MX9wOw=;
        b=CxoBk39jsRaDvHaC3DFn1tlwe1bKzoiWdivHShlj23qn7u3qJKrxfqiJnwwyT3sH8e
         syiPKuYrf3SJFk41pf61q5d2JzQdPgpXML4NqasX16DAAJ8xBe/c07lB4Oi+wJlmS2Ou
         AEuQKM+ikD5Bzh7k5Lq7ejj0ddufXDD8PdtIH510FjMHYK5+VHM3vTIyQhEBPHdVQjKW
         Np/KCnkdHn1ta5K4dR642uv1fR3o6r59qWmBgexZmxLKgFFh8lmQWbrwr5teaFG1zrry
         0OcLcawULIJM2LSHJCEpVdqLdMiPdeh/qVeyEKY7/434ryIXrjppIesnqGNWRoRakI1i
         tIqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11-20020ac87d4b000000b003b634217ff8si12861285qtb.774.2023.03.01.23.48.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Mar 2023 23:48:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pXdff-0003OF-Eh; Thu, 02 Mar 2023 02:48:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.dupaquis@trusted-objects.com>)
 id 1pXdfI-0003K9-Ik
 for qemu-arm@nongnu.org; Thu, 02 Mar 2023 02:47:49 -0500
Received: from mailex.trusted-objects.com ([2001:41d0:117:e400::877d:2338])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.dupaquis@trusted-objects.com>)
 id 1pXdfF-0007ev-Hi
 for qemu-arm@nongnu.org; Thu, 02 Mar 2023 02:47:47 -0500
Received: from [192.170.0.200] (88.127.245.42) by S1056330.EX76918.lan
 (2001:41d0:117:e400::877d:2338) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Thu, 2 Mar
 2023 08:43:54 +0100
Message-ID: <0c5d3e51-9924-6b01-fce0-46d02a5b31d9@trusted-objects.com>
Date: Thu, 2 Mar 2023 08:42:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Cortex-Mx emulation with QEMU
Content-Language: fr-FR
To: <qemu-arm@nongnu.org>
References: <BEZP281MB22153CA28D961A3F5FDCE979EDAF9@BEZP281MB2215.DEUP281.PROD.OUTLOOK.COM>
From: vincent Dupaquis <v.dupaquis@trusted-objects.com>
In-Reply-To: <BEZP281MB22153CA28D961A3F5FDCE979EDAF9@BEZP281MB2215.DEUP281.PROD.OUTLOOK.COM>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PyCJ5akPD4VZFWcq0m39m37S"
X-Originating-IP: [88.127.245.42]
X-ClientProxiedBy: S1056330.EX76918.lan (2001:41d0:117:e400::877d:2338) To
 S1056330.EX76918.lan (2001:41d0:117:e400::877d:2338)
Received-SPF: none client-ip=2001:41d0:117:e400::877d:2338;
 envelope-from=v.dupaquis@trusted-objects.com; helo=mailex.trusted-objects.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.09, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_REMOTE_IMAGE=0.01 autolearn=ham autolearn_force=no
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
X-TUID: eItcyBW53WZb

--------------PyCJ5akPD4VZFWcq0m39m37S
Content-Type: multipart/mixed; boundary="------------BxDsn9O0qnZyDkMVz2fszBqv";
 protected-headers="v1"
From: vincent Dupaquis <v.dupaquis@trusted-objects.com>
To: qemu-arm@nongnu.org
Message-ID: <0c5d3e51-9924-6b01-fce0-46d02a5b31d9@trusted-objects.com>
Subject: Re: Cortex-Mx emulation with QEMU
References: <BEZP281MB22153CA28D961A3F5FDCE979EDAF9@BEZP281MB2215.DEUP281.PROD.OUTLOOK.COM>
In-Reply-To: <BEZP281MB22153CA28D961A3F5FDCE979EDAF9@BEZP281MB2215.DEUP281.PROD.OUTLOOK.COM>

--------------BxDsn9O0qnZyDkMVz2fszBqv
Content-Type: multipart/alternative;
 boundary="------------c4b00Yt0ZpsK7wGv5XHuSrDo"

--------------c4b00Yt0ZpsK7wGv5XHuSrDo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCg0KSSBoYXZlIHRoZSBmZWVsaW5nIHRoYXQgcWVtdS1zeXN0ZW0tZ251YXJt
ZWNsaXBzZSBpcyBhIGZvcmssIHNvIHdoeSANCndvdWxkIHlvdSBleHBlY3QgdGhlIHFlbXUg
Z3V5cyB0byB0YWtlIHRoaXMgcmVzcG9uc2FiaWxpdHksIGNoZWNrIA0KdGhyb3VnaCB0aGUg
Zm9yayBhdXRob3JzIGluc3RlYWQgPT4gDQpodHRwczovL2dpdGh1Yi5jb20vSnVtcGVyci1s
YWJzL2dudWFybWVjbGlwc2UtcWVtdQ0KDQoNClJlZ2FyZHMsDQoNCiDCoMKgwqAgVmluY2Vu
dC4NCg0KDQpMZSAyNy8wMi8yMDIzIMOgIDE0OjM3LCBWaWxsYWdyYXNhLCBJZ25hc2kgYSDD
qWNyaXTCoDoNCj4gSGVsbG8gQWxsLA0KPg0KPiBPdXIgY29tcGFueSBpcyBldmFsdWF0aW5n
IHVzaW5nIFFFTVUgZm9yIGF1dG9tYXRpbmcgdGVzdHMgZm9yIGVtYmVkZGVkIA0KPiBzeXN0
ZW1zIHVzaW5nIEFSTSBDb3J0ZXggTXggbWljcm9jb250cm9sbGVycy4NCj4NCj4gQXQgdGhl
IG1vbWVudCB3ZSdyZSBhYmxlIHRvIHJ1biBvdXIgYmluYXJpZXMgDQo+IHVzaW5nwqBxZW11
LXN5c3RlbS1nbnVhcm1lY2xpcHNlLmV4ZS4gSXQncyBkb2N1bWVudGVkLCBob3dldmVyLCAN
Cj4gdGhhdMKgcWVtdS1zeXN0ZW0tZ251YXJtZWNsaXBzZS5leGUgaXMgZGVwcmVjYXRlZCBh
bmQgaXQncyBub3QgZXZvbHZlZCANCj4gc2luY2UgdGltZSBhZ28uIEFjY29yZGluZ2x5LCBp
dCdzIHJlY29tbWVuZGVkIHRvIHVzZSANCj4gcWVtdS1zeXN0ZW0tYXJtLmV4ZSBpbnN0ZWFk
LiBXZSdyZSBub3QgYWJsZSB0byBnZXQgaXQgd29yayB0aGUgc2FtZSANCj4gd2F5IHdlIGRv
IHdpdGggcWVtdS1zeXN0ZW0tZ251YXJtZWNsaXBzZS5leGUuDQo+DQo+IFVzaW5nIGZvbGxv
d2luZyBwYXJhbWV0ZXJzIGluIHFlbXUtc3lzdGVtLWdudWFybWVjbGlwc2UuZXhlOg0KPg0K
PiAtYm9hcmQgZ2VuZXJpYw0KPiAtbWFjaGluZSBTVE0zMkY0MTFSRQ0KPg0KPiB0aGUgZW11
bGF0aW9uIHdvcmtzIGFzIGV4cGVjdGVkLg0KPg0KPiBDaGVja2luZyBxZW11LXN5c3RlbS1h
cm0uZXhlIGRvY3VtZW50YXRpb24sIHdlIHNlZSAtbWFjaGluZSBhbmQgLWNwdSANCj4gcGFy
YW1ldGVycy4gVGVzdGluZyBkaWZmZXJlbnQgY29tYmluYXRpb25zIG9mIC1tYWNoaW5lIGFu
ZCAtY3B1IHRoYXQgDQo+IHNlZW1zIHRvIG1hdGNoIG9yIGJlIGNsb3NlIHRvIHRob3NlIGZv
ciBxZW11LXN5c3RlbS1nbnVhcm1lY2xpcHNlIA0KPiBhYm92ZSwgd2UncmUgbm90IGFibGUg
dG8gZ2V0IGl0IHdvcmsuIFdlJ3JlIGFsd3lhcyBnZXR0aW5nIHNvbWUga2luZCANCj4gb2Yg
YWRkcmVzc2luZyBlcnJvcnMuDQo+DQo+IEJlZm9yZSBmdXJ0aGVyIGludmVzdGlnYXRlLCBh
bmQgdW5kZXJzdGFuZGluZyB0aGF0IHFlbXUtc3lzdGVtLWFybS5leGUgDQo+IGlzIHJlY29t
bWVuZGVkIGFzIGEgcmVwbGFjZW1lbnQsIGFuZCBzbyB0aGVyZSBzaG91bGQgYmUgYSBraW5k
IG9mIA0KPiBiYWNrd2FyZCBjb21wYXRpYmlsaXR5LCBJJ2QgbGlrZSB0byBrbm93IHdoYXQn
cyB0aGUgZXF1aXZhbGVudCANCj4gcGFyYW1ldGVyaXphdGlvbiBmb3IgcWVtdS1zeXN0ZW0t
YXJtLmV4ZSB3ZSBzaG91bGQgdXNlIGZvciBnZXR0aW5nIHRoZSANCj4gc2FtZSByZXN1bHRz
IHdlJ3JlIGdldHRpbmcgdXNpbmcgcWVtdS1zeXN0ZW0tZ251YXJtZWNsaXBzZS4NCj4NCj4g
VGhhbmtzIGluIGFkdmFuY2UsDQo+DQo+IFNhbHVkb3MgY29yZGlhbGVzLCBNaXQgZnJldW5k
bGljaGVuIEdyw7xzc2VuLCBCZXN0IFJlZ2FyZHMsIFNheWdpbGFyaW1sYQ0KPg0KPiAqSWdu
YXNpIFZpbGxhZ3Jhc2EqDQo+DQo+ICpFLkcuTy4gQXBwbGlhbmNlIENvbnRyb2xzLCBTLkwu
VS4qDQo+IEVFT05EQSAtIFNvZnR3YXJlIEVuZ2luZWVyDQo+IENhbGxlIE1hcmVzbWUsIG7C
uiAxDQo+IDA4MTg1IExsaWNhIGRlIFZhbGwsIEJhcmNlbG9uYQ0KPiBNb2JpbGU6ICszNCA2
NjQwMzQzMzINCj4NCj4gRS1NYWlsOiBpZ25hc2kudmlsbGFncmFzYUBlZ29wcm9kdWN0cy5j
b20NCj4gSW50ZXJuZXQ6IGh0dHA6Ly93d3cuZWdvcHJvZHVjdHMuY29tDQo+DQo+IEluZm9y
bWFjacOzbiBMT1BEIFkgTFNTSUNFLyBJbmZvcm1hY2nDsyBMT1BEIGkgTFNTSUNFLyBMT1BE
IGFuZCBMU1NJQ0UgDQo+IGluZm9ybWF0aW9uLiA8aHR0cHM6Ly9wb3J0YWwuZWdvYXBwbGlh
bmNlY29udHJvbHMuY29tL2xvcGQvPg0KPiAqUCoqKipBbnRlcyBkZSBpbXByaW1pciwgcG9y
IGZhdm9yIHBpZW5zYSBlbiBlbCBtZWRpbyBhbWJpZW50ZS4gKg0KPiAqUCoqKipCZWZvcmUg
cHJpbnRpbmcsIHBsZWFzZSB0aGluayBhYm91dCB0aGUgZW52aXJvbm1lbnQuICoNCj4NCj4g
dG8gTGlua2VkSW4gPGh0dHBzOi8vd3d3LmxpbmtlZGluLmNvbS9jb21wYW55LzY4MTI1OTk0
PiB0byBYaW5nIA0KPiA8aHR0cHM6Ly93d3cueGluZy5jb20vY29tcGFuaWVzL2UuZy5vLi1n
cnVwcGU+IHRvIEZhY2Vib29rIA0KPiA8aHR0cHM6Ly93d3cuZmFjZWJvb2suY29tL2Vnb2dy
dXBwZT4gdG8gSW5zdGFncmFtIA0KPiA8aHR0cHM6Ly93d3cuaW5zdGFncmFtLmNvbS9lZ29n
cnVwcGUvPiB0byBZb3V0dWJlIA0KPiA8aHR0cHM6Ly93d3cueW91dHViZS5jb20vZWdvcHJv
ZHVjdHM+DQotLSANCg0KKlZpbmNlbnQgRHVwYXF1aXMqDQpTb2Z0d2FyZSBzZWN1cml0eSAm
IENyeXB0b2dyYXBoeSBleHBlcnQNCjA2IDI0IDU4IDE3IDA1DQovRXVyb3BhcmMgZGUgUGlj
aGF1cnkgQsOidGltZW50IEI4IDEzMzAgcnVlIEd1aWxsaWJlcnQgR2F1dGllciBkZSBsYSAN
CkxhdXppw6hyZSAxMzI5MCBBaXgtZW4tUHJvdmVuY2UvDQoNCnd3dy50cnVzdGVkLW9iamVj
dHMuY29tIDxodHRwOi8vd3d3LnRydXN0ZWQtb2JqZWN0cy5jb20+DQo=
--------------c4b00Yt0ZpsK7wGv5XHuSrDo
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Hello,</p>
    <p><br>
    </p>
    <p>I have the feeling that qemu-system-gnuarmeclipse is a fork, so
      why would you expect the qemu guys to take this responsability,
      check through the fork authors instead =3D&gt;
      <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/Jumpe=
rr-labs/gnuarmeclipse-qemu">https://github.com/Jumperr-labs/gnuarmeclipse=
-qemu</a></p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>=C2=A0=C2=A0=C2=A0 Vincent.<br>
    </p>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">Le 27/02/2023 =C3=A0 14:37, Villagrasa=
,
      Ignasi a =C3=A9crit=C2=A0:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:BEZP281MB22153CA28D961A3F5FDCE979EDAF9@BEZP281MB2215.DEUP281.=
PROD.OUTLOOK.COM">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DU=
TF-8">
      <style type=3D"text/css" style=3D"display:none;">P {margin-top:0;ma=
rgin-bottom:0;}</style>
      <div class=3D"elementToProof" style=3D"font-family: Calibri, Arial,=

        Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
        background-color: rgb(255, 255, 255);">
        Hello All,</div>
      <div class=3D"elementToProof" style=3D"font-family: Calibri, Arial,=

        Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
        background-color: rgb(255, 255, 255);">
        <br>
      </div>
      <div class=3D"elementToProof" style=3D"font-family: Calibri, Arial,=

        Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
        background-color: rgb(255, 255, 255);">
        Our company is evaluating using QEMU for automating tests for
        embedded systems using ARM Cortex Mx microcontrollers.=C2=A0</div=
>
      <div class=3D"elementToProof" style=3D"font-family: Calibri, Arial,=

        Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
        background-color: rgb(255, 255, 255);">
        <br>
      </div>
      <div class=3D"elementToProof ContentPasted0 ContentPasted1"
        style=3D"font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,
        255, 255);">
        At the moment we're able to run our binaries
        using=C2=A0qemu-system-gnuarmeclipse.exe. It's documented, howeve=
r,
        that=C2=A0qemu-system-gnuarmeclipse.exe is deprecated and it's no=
t
        evolved since time ago. Accordingly, it's recommended to use
        <span class=3D"ContentPasted2" style=3D"color: rgb(0, 0, 0);
          background-color: rgb(255, 255, 255); display: inline
          !important;">
          qemu-system-arm.exe instead. We're not able to get it work the
          same way we do with=C2=A0<span class=3D"ContentPasted3" style=3D=
"color:
            rgb(0, 0, 0); background-color: rgb(255, 255, 255); display:
            inline !important;">qemu-system-gnuarmeclipse.exe.</span></sp=
an></div>
      <div class=3D"elementToProof ContentPasted0 ContentPasted1"
        style=3D"font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,
        255, 255);">
        <span class=3D"ContentPasted2" style=3D"color: rgb(0, 0, 0);
          background-color: rgb(255, 255, 255); display: inline
          !important;"><span class=3D"ContentPasted3" style=3D"color: rgb=
(0,
            0, 0); background-color: rgb(255, 255, 255); display: inline
            !important;"><br>
          </span></span></div>
      <div class=3D"elementToProof ContentPasted0 ContentPasted1"
        style=3D"font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,
        255, 255);">
        <span class=3D"ContentPasted2" style=3D"color: rgb(0, 0, 0);
          background-color: rgb(255, 255, 255); display: inline
          !important;"><span class=3D"ContentPasted3" style=3D"color: rgb=
(0,
            0, 0); background-color: rgb(255, 255, 255); display: inline
            !important;"></span></span></div>
      <div class=3D"elementToProof ContentPasted0 ContentPasted1"
        style=3D"font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,
        255, 255);">
        <span style=3D"">Using following parameters in=C2=A0</span><span
          class=3D"ContentPasted4" style=3D"color: rgb(0, 0, 0); display:=

          inline !important; background-color: rgb(255, 255, 255);">qemu-=
system-gnuarmeclipse.exe:</span><br>
      </div>
      <div class=3D"elementToProof ContentPasted0 ContentPasted1"
        style=3D"font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,
        255, 255);">
        <span class=3D"ContentPasted2" style=3D"color: rgb(0, 0, 0);
          background-color: rgb(255, 255, 255); display: inline
          !important;"><span class=3D"ContentPasted3" style=3D"color: rgb=
(0,
            0, 0); background-color: rgb(255, 255, 255); display: inline
            !important;"><span class=3D"ContentPasted4" style=3D"color:
              rgb(0, 0, 0); background-color: rgb(255, 255, 255);
              display: inline !important;"><br>
            </span></span></span></div>
      <div class=3D"elementToProof ContentPasted0 ContentPasted1"
        style=3D"font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,
        255, 255);">
        -board generic</div>
      <div class=3D"elementToProof ContentPasted0 ContentPasted1
        ContentPasted5" style=3D"font-family: Calibri, Arial, Helvetica,
        sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
        background-color: rgb(255, 255, 255);">
        -machine STM32F411RE</div>
      <div class=3D"elementToProof ContentPasted0 ContentPasted1
        ContentPasted5" style=3D"font-family: Calibri, Arial, Helvetica,
        sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
        background-color: rgb(255, 255, 255);">
        <br>
      </div>
      <div class=3D"elementToProof ContentPasted0 ContentPasted1
        ContentPasted5" style=3D"font-family: Calibri, Arial, Helvetica,
        sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
        background-color: rgb(255, 255, 255);">
        the emulation works as expected.</div>
      <div class=3D"elementToProof ContentPasted0 ContentPasted1
        ContentPasted5" style=3D"font-family: Calibri, Arial, Helvetica,
        sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
        background-color: rgb(255, 255, 255);">
        <br>
      </div>
      <div class=3D"elementToProof ContentPasted0 ContentPasted1
        ContentPasted5" style=3D"font-family: Calibri, Arial, Helvetica,
        sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
        background-color: rgb(255, 255, 255);">
        <span class=3D"ContentPasted0 ContentPasted7" style=3D"font-size:=

          12pt; margin: 0px; color: rgb(0, 0, 0); background-color:
          rgb(255, 255, 255);">Checking
          <span style=3D"color: rgb(0, 0, 0); background-color: rgb(255,
            255, 255); display: inline !important;"
            class=3D"ContentPasted8">
            qemu-system-arm.exe=C2=A0</span>documentation, we see -machin=
e
          and -cpu parameters. Testing different combinations of
          -machine and -cpu that seems to match or be close to those
          for=C2=A0<span style=3D"color: rgb(0, 0, 0); background-color:
            rgb(255, 255, 255); display: inline !important;"
            class=3D"ContentPasted9">qemu-system-gnuarmeclipse above,
            we're not able to get it work. We're alwyas getting some
            kind of addressing errors.</span></span></div>
      <div class=3D"elementToProof ContentPasted0 ContentPasted1
        ContentPasted5" style=3D"font-family: Calibri, Arial, Helvetica,
        sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
        background-color: rgb(255, 255, 255);">
        <span class=3D"ContentPasted0 ContentPasted7" style=3D"font-size:=

          12pt; margin: 0px; color: rgb(0, 0, 0); background-color:
          rgb(255, 255, 255);"><br>
        </span></div>
      <div class=3D"elementToProof ContentPasted0 ContentPasted1
        ContentPasted5" style=3D"font-family: Calibri, Arial, Helvetica,
        sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
        background-color: rgb(255, 255, 255);">
        <span class=3D"ContentPasted6" style=3D"font-family: Calibri, Ari=
al,
          Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
          display: inline !important; background-color: rgb(255, 255,
          255);">Before further investigate, and understanding that=C2=A0=
<span
            style=3D"color: rgb(0, 0, 0); background-color: rgb(255, 255,=

            255); display: inline !important;" class=3D"ContentPasted10">=
qemu-system-arm.exe
            is recommended as a replacement, and so there should be a
            kind of backward compatibility,=C2=A0</span></span><span
          class=3D"ContentPasted6" style=3D"font-family: Calibri, Arial,
          Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
          display: inline !important; background-color: rgb(255, 255,
          255);">I'd like to know what's the equivalent parameterization
          for=C2=A0</span><span class=3D"ContentPasted6" style=3D"font-fa=
mily:
          Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color:
          rgb(0, 0, 0); display: inline !important; background-color:
          rgb(255, 255, 255);">qemu-system-arm.exe we should use for
          getting the same results we're getting using=C2=A0<span
            style=3D"color: rgb(0, 0, 0); background-color: rgb(255, 255,=

            255); display: inline !important;" class=3D"ContentPasted11">=
qemu-system-gnuarmeclipse.</span></span></div>
      <div class=3D"elementToProof ContentPasted0 ContentPasted1
        ContentPasted5" style=3D"font-family: Calibri, Arial, Helvetica,
        sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
        background-color: rgb(255, 255, 255);">
        <span class=3D"ContentPasted6" style=3D"font-family: Calibri, Ari=
al,
          Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
          display: inline !important; background-color: rgb(255, 255,
          255);"><br>
        </span></div>
      <div class=3D"elementToProof ContentPasted0 ContentPasted1
        ContentPasted5" style=3D"font-family: Calibri, Arial, Helvetica,
        sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
        background-color: rgb(255, 255, 255);">
        <span class=3D"ContentPasted6" style=3D"font-family: Calibri, Ari=
al,
          Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
          display: inline !important; background-color: rgb(255, 255,
          255);">Thanks in advance,</span></div>
      <div class=3D"elementToProof ContentPasted0 ContentPasted1
        ContentPasted5" style=3D"font-family: Calibri, Arial, Helvetica,
        sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
        background-color: rgb(255, 255, 255);">
        <span class=3D"ContentPasted6" style=3D"font-family: Calibri, Ari=
al,
          Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
          display: inline !important; background-color: rgb(255, 255,
          255);"><br>
        </span></div>
      <div class=3D"elementToProof ContentPasted0 ContentPasted1
        ContentPasted5" style=3D"font-family: Calibri, Arial, Helvetica,
        sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
        background-color: rgb(255, 255, 255);">
        <span style=3D"font-family: arial, sans-serif; font-size: 11pt;">=
Saludos
          cordiales, Mit freundlichen Gr=C3=BCssen, Best Regards,
          Saygilarimla</span><br>
      </div>
      <div>
        <div id=3D"Signature">
          <div>
            <div><span style=3D"font-size:11pt;
                font-family:arial,sans-serif"><br>
                <strong>Ignasi Villagrasa</strong><br>
                <br>
                <strong>E.G.O. Appliance Controls, S.L.U.</strong><br>
                EEONDA - Software Engineer<br>
                Calle Maresme, n=C2=BA 1<br>
                08185 Llica de Vall, Barcelona<br>
                Mobile: +34 664034332<br>
                <br>
                E-Mail: <a
                  href=3D"mailto:ignasi.villagrasa@egoproducts.com"
                  data-auth=3D"NotApplicable" data-loopstyle=3D"link"
                  moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext=
">
                  ignasi.villagrasa@egoproducts.com</a><br>
                Internet: <a href=3D"http://www.egoproducts.com"
                  data-auth=3D"NotApplicable" data-loopstyle=3D"link"
                  moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext=
">
                  http://www.egoproducts.com</a><br>
                <br>
              </span></div>
            <div><span style=3D"font-size:11pt;
                font-family:arial,sans-serif"><a
                  href=3D"https://portal.egoappliancecontrols.com/lopd/"
                  data-auth=3D"NotApplicable" style=3D"font-weight:bold"
                  data-loopstyle=3D"link" moz-do-not-send=3D"true">Inform=
aci=C3=B3n
                  LOPD Y LSSICE/ Informaci=C3=B3 LOPD i LSSICE/ LOPD and
                  LSSICE information.</a> <br>
              </span></div>
            <div><span style=3D"font-size:11pt;
                font-family:arial,sans-serif"><font style=3D"" size=3D"4"=

                  face=3D"Webdings" color=3D"#008080"><b>P</b></font><b>=C2=
=A0</b><font
                  style=3D"" size=3D"2" face=3D"Arial" color=3D"#008080">=
<b>Antes
                    de imprimir, por favor piensa en el medio ambiente.
                  </b></font><br>
              </span></div>
            <div><span style=3D"font-size:11pt;
                font-family:arial,sans-serif"><font style=3D"" size=3D"4"=

                  face=3D"Webdings" color=3D"#008080"><b>P</b></font><b>=C2=
=A0</b><font
                  style=3D"" size=3D"2" face=3D"Arial" color=3D"#008080">=
<b>Before
                    printing, please think about the environment.
                  </b></font><br>
              </span></div>
            <div><span style=3D"font-size:11pt;
                font-family:arial,sans-serif"><br>
                <a href=3D"https://www.linkedin.com/company/68125994"
                  data-auth=3D"NotApplicable" moz-do-not-send=3D"true"><i=
mg
                    alt=3D"to LinkedIn"
                    src=3D"https://www.blanc-fischer.com/signature/EGO_Li=
nkedIn.png"
                    moz-do-not-send=3D"true"></a> =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0<a
                  href=3D"https://www.xing.com/companies/e.g.o.-gruppe"
                  data-auth=3D"NotApplicable" moz-do-not-send=3D"true"><i=
mg
                    alt=3D"to Xing"
                    src=3D"https://www.blanc-fischer.com/signature/EGO_Xi=
ng.png"
                    moz-do-not-send=3D"true"></a> =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0<a
                  href=3D"https://www.facebook.com/egogruppe"
                  data-auth=3D"NotApplicable" moz-do-not-send=3D"true"><i=
mg
                    alt=3D"to Facebook"
                    src=3D"https://www.blanc-fischer.com/signature/EGO_Fa=
cebook.png"
                    moz-do-not-send=3D"true"></a> =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0<a
                  href=3D"https://www.instagram.com/egogruppe/"
                  data-auth=3D"NotApplicable" moz-do-not-send=3D"true"><i=
mg
                    alt=3D"to Instagram"
                    src=3D"https://www.blanc-fischer.com/signature/EGO_In=
stagram.png"
                    moz-do-not-send=3D"true"></a> =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0<a
                  href=3D"https://www.youtube.com/egoproducts"
                  data-auth=3D"NotApplicable" moz-do-not-send=3D"true"><i=
mg
                    alt=3D"to Youtube"
                    src=3D"https://www.blanc-fischer.com/signature/EGO_Yo=
utube.png"
                    moz-do-not-send=3D"true"></a> =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0<br>
                =C2=A0 =C2=A0 =C2=A0 <img
                  src=3D"https://www.blanc-fischer.com/signature/Sig_EGO_=
EAC_2.png"
                  moz-do-not-send=3D"true"></span></div>
          </div>
        </div>
      </div>
    </blockquote>
    <div class=3D"moz-signature">-- <br>
      <pre><big><b>Vincent Dupaquis</b></big>
Software security &amp; Cryptography expert
06 24 58 17 05
<i>Europarc de Pichaury
B=C3=A2timent B8
1330 rue Guillibert Gautier de la Lauzi=C3=A8re
13290 Aix-en-Provence</i>
</pre>
      <a href=3D"http://www.trusted-objects.com"> <img
          alt=3D"www.trusted-objects.com"
          src=3D"https://www.trusted-objects.com/uploads/tpl-buddy-012/im=
g/logo.png"
          width=3D"300" height=3D"117" border=3D"0"> </a></div>
  </body>
</html>

--------------c4b00Yt0ZpsK7wGv5XHuSrDo--

--------------BxDsn9O0qnZyDkMVz2fszBqv--

--------------PyCJ5akPD4VZFWcq0m39m37S
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEJpYkOsZemdq4v9TTIvVZ6MpT9wkFAmQAU2QFAwAAAAAACgkQIvVZ6MpT9wkX
fA/+IRKZTXvtrUpbEkEDO91tv2TBlM+9cI7aogU3+3rb2NzQ4KyOlCu17NSUh7mtFTE8UEAXnn87
CS1lamAYLoANf/5O/Nz7xkJEumP0mKWCsvkB9SlSKDf/DLmgEkIj4aB6KDhclho4WGXgz9V43NV9
W4ZqH2Kp739fBA+dukzJLgvSKFo69of8U+bpu1M+9hV0W+R/vN39Lc03Zob3hyKU/LQVyE1HEaWU
7rmLr5CCb46I0YN0pt+xiTyBTrQbYi2IgtNF4FKX77V4nUJ31inFCIIX+Q/oTK8swoVNKM9mlQcL
eUWcIEjWyfQt+7fg6LqY7GsT7u5q90E8F3HuKsqrQa5CZjvsaUdCzPH8aRr1r1U28OtXSPHx2fIl
pxm2V8U/Uo28Pr5S2VS+XcPAcdbiwqRRN7BmcsO7V3LN2oZ3kc9juf8izk6onCw56dr645afe/OF
aR76fMuD4KKnFZFtpxoq5FDi4mOvyIlZu1Ba6o7wRZEhqOwzYKZRdLpCPl0R4v24JDaV6LQc/q9v
gl96ZeHHrm2CKQf2M0CIXcz7Os45Jfv4i41y4Bz3j1WtkYp8sM/wrT+cZXMp5WZrLGm9RM/UXUaM
IeOH1+Zop350MhjecVlknPeylX9DD/AjCxqM0urT8/xdD9G3icNNMnVxRa4+fZ0tVa8LJdzNQO00
FJ8=
=0vbf
-----END PGP SIGNATURE-----

--------------PyCJ5akPD4VZFWcq0m39m37S--
