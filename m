Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp200702ejv;
        Tue, 7 Nov 2023 01:56:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGM2me9+dM4js3AMsCJnBL29ttofEC2OuRx9pjqT/diNVxB3D6SgYDBn036nuwZdHE86NvZ
X-Received: by 2002:a5d:59ab:0:b0:32f:8a7f:f00f with SMTP id p11-20020a5d59ab000000b0032f8a7ff00fmr20560911wrr.60.1699350970133;
        Tue, 07 Nov 2023 01:56:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1699350970; cv=pass;
        d=google.com; s=arc-20160816;
        b=i4YR8JQX1mxIkjbYnATpz8JV2Av+1Ogj9fzjYjF8H1NX9c9+xnm3DxauvZTFeDnAxs
         JALULPJb7xbGzLO0AqGBLG9kHlBiCRHt8Kv5M2CfH3QolnwaFllR+ZRkkjwA/v/GYno3
         7b6pY78NPxQ5xuEBaLp9QRYzIfDZA6o6estMyqNDIE4+tYUKHlOTcON37y5iEshkl/+M
         SkME767Z9z1fliLdfqFje8zKpcTh2OaviWNo+jTPwWXY1pHpgUNlq8k45Cw/ysoy7IVI
         aotij+6db0YcHEi/iqRFrzT9UMj5TnGWivwekJ0pa5D6EfQ92tq4G8y9cUG2Mq7NH9dV
         S4Xg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:msip_labels:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=f8FdRNp8xeBUgkfvKVFrnmHNhu2kvH/RqquG7An44yQ=;
        fh=ExFJIXAIasRZ29XK3PqZo5iFP/zjkC6zYyBhPqdPvUk=;
        b=X1Aw94VB4gyd/YS9c48XdpGuGfgi/yqtDLX1hlPgybfjIFsLmPXtvaRj/C8OiRR5RK
         ECIpMULzHBvCxWvJnbGB/JnY2U3sPsbxSM9gNoHnJ0LoVbKoCPLvHEO2doqhLaQXPDH8
         BlVhO1haqGRmSfoi05mOelB9on+7FYqcOyHfHHQ4xPdhWwTkOb6shSAT3FRft1G9EMul
         C7/s2vFHlYcifawTZcfOT9I3le2JNfmabzdAdMk8fOwNxTijS6uU6Xv0YPoiyzjKuBk4
         +bYgmTQ9DPpwZ9WwUHRk7g0BLYL0+PeeGFrBqPk32JuX+fr4YYAqoSSDHCQRdfz/5eSW
         kD1A==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@rapitasystems.com header.s=selector2 header.b=RzH59u7U;
       arc=pass (i=1 spf=pass spfdomain=rapitasystems.com dkim=pass dkdomain=rapitasystems.com dmarc=pass fromdomain=rapitasystems.com);
       spf=pass (google.com: domain of gmanning@rapitasystems.com designates 2a01:111:f403:261a::700 as permitted sender) smtp.mailfrom=gmanning@rapitasystems.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=rapitasystems.com
Return-Path: <gmanning@rapitasystems.com>
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (mail-lo4gbr01on20700.outbound.protection.outlook.com. [2a01:111:f403:261a::700])
        by mx.google.com with ESMTPS id n3-20020a5d4203000000b003196dba12f9si1438453wrq.864.2023.11.07.01.56.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Nov 2023 01:56:10 -0800 (PST)
Received-SPF: pass (google.com: domain of gmanning@rapitasystems.com designates 2a01:111:f403:261a::700 as permitted sender) client-ip=2a01:111:f403:261a::700;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rapitasystems.com header.s=selector2 header.b=RzH59u7U;
       arc=pass (i=1 spf=pass spfdomain=rapitasystems.com dkim=pass dkdomain=rapitasystems.com dmarc=pass fromdomain=rapitasystems.com);
       spf=pass (google.com: domain of gmanning@rapitasystems.com designates 2a01:111:f403:261a::700 as permitted sender) smtp.mailfrom=gmanning@rapitasystems.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=rapitasystems.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eSrOVaVuGqs30qSgqCPPLPfiw7GiN6Xvh5y7N6kHafhCBJSyDK8i0Lsl85StCy85VroPKzGYB6rh4KFEPOLeS/Vre8rSH5tyre3QZKBfXTv9B4hgwDRuSRJUEOv6h73Z8Iy1SYdf/ywASGqK1DOJJreafyj6zFd8XYcPDuxM6RKeJGq3fF9ii1My5fzgcgPgxfJ1zNDHyA/sH6tP5zVlOE4oBDax3saCbvvrwqmD3w5g5/h8JNQ0vKBQosP1Bf6d6YnjMpOkeIOuFpRp0LEW8j2pSUZy0UQiKzhRPCzZEFnmHjxW0a7HCZG7cg9Qh9CDHulj6udAqFYfkBowzbyupg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8FdRNp8xeBUgkfvKVFrnmHNhu2kvH/RqquG7An44yQ=;
 b=HLN1lFXlu83q6od8oujEUknVNgM1AgnOkkRCNB/KhJfPJgnmKjr7CsUdKP7esr6LxIxK70i8Rv7QSK3IXBYIDydCF5aDcTubtI9oTIYcYF/2lvvBS6P/FlzPca4DtpXu/zShUtzbfy2heqt1n6VDsfgd5uny0QKJ8o4QCTR4yjSS4KIPCsQCBXDdhmyi52R1d1anaTeVjmtCchhvyWBr2jZPC+Fbtr6spcV3k3as6tB233ZKTyki7xXbqZrYNd+Vgw73IXGeGlSSoyK13H8Ume+EDS6iqvQvFnRoV2j1n8D1Giuw+uyhEC0DzUbTk5YFGJVNYwf8AdjBYE/VsLV/EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=rapitasystems.com; dmarc=pass action=none
 header.from=rapitasystems.com; dkim=pass header.d=rapitasystems.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rapitasystems.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8FdRNp8xeBUgkfvKVFrnmHNhu2kvH/RqquG7An44yQ=;
 b=RzH59u7UXJwLcgs54LogIH51GxZJRHdRbB5svnaom9wIm3CRJh4v1GJCHVjgjydogiERqxEbc5Xzuhh/UxtI4VKqnw75UfgWSly2TJlko3aZZzs6bjWmJXI0jk90uTia0cuxiTtK1aCsLAtL4Vq0rCXCFhqKdcaLKXAyFo02iXc=
Received: from CWXP123MB4341.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:d8::10)
 by LO6P123MB7064.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:342::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 09:56:08 +0000
Received: from CWXP123MB4341.GBRP123.PROD.OUTLOOK.COM
 ([fe80::ce49:22a9:ed78:7f39]) by CWXP123MB4341.GBRP123.PROD.OUTLOOK.COM
 ([fe80::ce49:22a9:ed78:7f39%3]) with mapi id 15.20.6954.029; Tue, 7 Nov 2023
 09:55:28 +0000
From: Greg Manning <gmanning@rapitasystems.com>
To: Paolo Bonzini <pbonzini@redhat.com>, =?iso-8859-1?Q?Alex_Benn=E9e?=
	<alex.bennee@linaro.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	=?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, Peter Maydell
	<peter.maydell@linaro.org>, =?iso-8859-1?Q?Marc-Andr=E9_Lureau?=
	<marcandre.lureau@redhat.com>, Laurent Vivier <laurent@vivier.eu>, Mahmoud
 Mandour <ma.mandourr@gmail.com>, Cleber Rosa <crosa@redhat.com>, Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>, John
 Snow <jsnow@redhat.com>, =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?=
	<berrange@redhat.com>, Chris Wulff <crwulff@gmail.com>, Marek Vasut
	<marex@denx.de>, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 14/22] plugins: make test/example plugins work on windows
Thread-Topic: [PATCH 14/22] plugins: make test/example plugins work on windows
Thread-Index: AQHaEOI/He2Vr1tjpkGxX3DlH73njbBunB2AgAAAbBA=
Date: Tue, 7 Nov 2023 09:55:24 +0000
Message-ID:
 <CWXP123MB4341A5286537C5060BA71FB8D7A9A@CWXP123MB4341.GBRP123.PROD.OUTLOOK.COM>
References: <20231106185112.2755262-1-alex.bennee@linaro.org>
 <20231106185112.2755262-15-alex.bennee@linaro.org>
 <ea92d71f-35a3-4a5f-bece-01436a33e1e8@redhat.com>
In-Reply-To: <ea92d71f-35a3-4a5f-bece-01436a33e1e8@redhat.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=rapitasystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP123MB4341:EE_|LO6P123MB7064:EE_
x-ms-office365-filtering-correlation-id: 2aba8c77-fa2e-454a-bbf0-08dbdf77aa01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 gcUlK6yIqHRSyQw6nruO1uKNy1z/IixPLLJb9CoKrIKs8e9cvbzY0AQ3NYX4HShlxirJltYtHPPkbZj/oxFvfjTUUqpz6/JDa7JY5veEu4Hywih35kqHtqSvJqIxdGiDNaEoYGtlWGCyuonE5F+28UxVcLlojTDSSc5KS2YKmEu/eZhoLhGcr3rwnXjYwcJMTKKrfV1SW/1RQTvW6jXVyz05nEX2JtZgv2DUkQSuU/Lo0GGmJbuTLYAb9uUphCUBXhw5c0VSRxQb6YtMfRvur2UbUtfYTG+Q+QBRTKJCilVuxcbS6Vkpu7uPkIXQ0Dv8zANsZfCdVlNJ+wPSb8BJ/tCru3FgzQc/VJL26gakHAxEyRKswRtcIytSjAW9bOiekN4NKN29bNiI0yvlcRRVVnnvgVC6f9ZSSz+imW6MH6ZB7TTxqfNW0hpLSvoNQquq4RnTXCbCr3GeRf++M+h1gEMGLKegckNGaO2SyR2HcdzX/QENIm/DmAu29h6/ECwWLCAo7dQWl6Q5QvjsbdVDCmE0Zel2+fun8EiMFolhpinyeLRD9Z3mHYgj7W2uFFhDTizWuOvC+v9tte3aLMSGF6oA051FtBQKSrUPmUPp9wqh+YAhWymUcaTKDkPhtVRw10q4TgQeBfAOMbr157GIHw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWXP123MB4341.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39840400004)(136003)(396003)(346002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(26005)(6666004)(9686003)(7696005)(71200400001)(83380400001)(41300700001)(8676002)(4326008)(5660300002)(8936002)(52536014)(7416002)(2906002)(45080400002)(478600001)(316002)(64756008)(91956017)(54906003)(66946007)(110136005)(66476007)(66556008)(76116006)(66446008)(33656002)(86362001)(38100700002)(122000001)(6506007)(38070700009)(55016003)(460985005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?aPxwcMug9uGI86Th3B9PWMF79l08eG/B5S7196/HSOYm4UhwSEsTvFQjz5?=
 =?iso-8859-1?Q?tbjsBKqVBR6vuWJVnMv2OqSn5eD/PWoTZBNREjTpKp28lUqiilhYpS1DcY?=
 =?iso-8859-1?Q?Y/Mmge+UiTfZurt2Ncd2XKiU+r763L1l1Y+RdDE9yE79N198wfblaIwRrq?=
 =?iso-8859-1?Q?slebtHElQUJ/75YnaDrSJ1qoFrswRz4e/nHy/kXaHB5ufMnDe54g6vneGq?=
 =?iso-8859-1?Q?psMkp1U93O16hn8CcBINigCyd8h5j/ZAHXo7Pn3p+ligOMaLsYOJaZxdBo?=
 =?iso-8859-1?Q?X2j1wKqTXYXsatI/WtT3yFbbj8+rYtegqP/UhBWMdAXVvf0s1NFDhR4oEq?=
 =?iso-8859-1?Q?w++9/dHxOqOtnXFVXzEllnSH2YWM8F/jr1dYbArTmqlFBwQAxkysNPexOb?=
 =?iso-8859-1?Q?CtFd6gBcTuuQ0rNkZ3HFl5dRDP+j7Ccs5jN7TcHkiCtZeUh1HWxdJANnMw?=
 =?iso-8859-1?Q?WOhoXWDjxmBdzHaykJuKWdoW/DO1Vq2i/oEGPyDsWZJPg0kEKWN1ncZZtO?=
 =?iso-8859-1?Q?sPpF9hDl6B8K1X98+17cyzyiazVIpMqw5EmHnrtrMekAX8m3BmsjJGxMUJ?=
 =?iso-8859-1?Q?2bEG/JdSCgiIoidsiBU0ZmbxRDMrrxPRMcXkT0GtGlhlXER1bt6cvVk7JK?=
 =?iso-8859-1?Q?XYl9HBQMkNVuQlmFi6PEfVKvCUR3lYrCup1GjkmHV7y5MlRyMGGw9+YoqC?=
 =?iso-8859-1?Q?o67Yela91J6Jj5bQZkGAKV5n2be/VlZF90MNj+AXKkEk9shY2xFugBwHgm?=
 =?iso-8859-1?Q?rspw7/SsZQX1m+hDUrwrkawB7k9WriOaD7idrmxv04DaH5frKMlb321lzU?=
 =?iso-8859-1?Q?S/szs/PMJsgb7Fl7N44efujBek7Nee7NeEBG7gVWEh+RwEj7xAQugGX1ri?=
 =?iso-8859-1?Q?y5wh3IPhVwPQusN2Y7IwszgiRU6ciulrwANGWovyU6wbd0eM99eN5izEOI?=
 =?iso-8859-1?Q?EJQ1oY+abPBA2LY2Aiz9mfeCSQNMI9e9GRegLGE9D4JKmMcQSHwfZZ58S6?=
 =?iso-8859-1?Q?sFfMV9nODxVMaBSmuHvRSveOqKa1/c4duavuDlkY5cg2ucEZnvuLnKtExF?=
 =?iso-8859-1?Q?uBNvTadaLI6j5gg04FLUQPRZ+ALKwpMBI1leKXqXNJwr+TVw0kgwQ/k61S?=
 =?iso-8859-1?Q?aRJpQv8j+KrVBy7x9P9LaNBSWjTUX0WDTrC+AXyH+6lltkjixlvh1bXgpX?=
 =?iso-8859-1?Q?25nlnXgzRn6wd5qApNUB/8s6Suh3yZRPldvIZ4vr+nipJwrlSc7AS3LXHw?=
 =?iso-8859-1?Q?kefuyAarQw3vjLb+Leo7MuAkTqwobC6o5LqERlOD1QFFcgzBTwCXDwzOih?=
 =?iso-8859-1?Q?M6AWbhM169BXERi1x+VWMhiYg6rwgGJlRYpIATx7YhEhM2h7fOLMAou97l?=
 =?iso-8859-1?Q?89LjqZIqr0wbcyGfh7mVGVZBOt+RbTWrpeKM3XOTFYpvm7eHgvAn27h20h?=
 =?iso-8859-1?Q?ZDZlYY65cDXBDx5+c820WL14UxORgHo+IJu3i/Hwyn5P9nfswYQ38tniGB?=
 =?iso-8859-1?Q?lvDoCdorsf3F1LgNE6L2FCmnZVgYonkOi+bBJnsfo9c2U/jtxVe8EVTYcz?=
 =?iso-8859-1?Q?TceaD5fILPJnhmFL8bTc4f+aIALNFu8JwytHfoBYT8IMJNZ3iRGxBk1ft0?=
 =?iso-8859-1?Q?VzHdjKhVfzfk8mFUdvtPK7I9DLMscWMcgq?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: rapitasystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP123MB4341.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aba8c77-fa2e-454a-bbf0-08dbdf77aa01
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2023 09:55:24.8840
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63a1ab10-c4bd-4b99-881c-0040cec74971
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UVqoQ5Sldvpu0TCr+N7chNxdfcj/sUJC5OYp6Fep5AEOeVtQOWx9z4I2WR1majuShE3LvDC4IfirJEIdWUr6mdIgkIIkEfa1WrugY2BQZTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P123MB7064
X-TUID: s9rLkitwBl1n

From: Paolo Bonzini <pbonzini@redhat.com>

One important remark below that Greg can answer; the others are nits.
> ...
> I think this could also use the notification hook and
dliNotePreLoadLibrary.  That's a little more tidy but it's okay either way.

I don't really mind. I had in mind that there might someday be a
single executable and when that happens the hook would silently
get out of the way.

On the other hand, doing it this way means if the user /happens/
to have a qemu.exe in an unfortunate place then things will fail
with very unhelpful error messages, because the linker would
sucessfully load the qemu.exe, then (presumably) fail when
looking up symbols.

> A bit more important: would it make sense to include the hook *in the
> QEMU executable itself*, rather than in the DLL?  If it works, it would
> be much preferrable.  You still would have to add the .lib file to the
> compilation, but win32_linker.c could simply be placed in os-win32.c
> with fewer changes to meson.build and the makefiles.

My initial trials of this didn't work. But having read the docs again, I'm
going to have another go at it now...

Greg.
--

Follow Rapita Systems on LinkedIn<https://www.linkedin.com/company/rapita-s=
ystems?utm_source=3Drs_email_sig>
