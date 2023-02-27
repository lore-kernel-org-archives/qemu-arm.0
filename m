Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4716591ejc;
        Mon, 27 Feb 2023 07:07:38 -0800 (PST)
X-Google-Smtp-Source: AK7set8XHf4AQcxctplwcd9FSP1zlYkk44h1lXD8mgO1CwfE7txq7QZraYHMUW0HuUAaZ0T/AYOh
X-Received: by 2002:a05:6214:5299:b0:56f:8ef:690 with SMTP id kj25-20020a056214529900b0056f08ef0690mr40572808qvb.17.1677510458541;
        Mon, 27 Feb 2023 07:07:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1677510458; cv=pass;
        d=google.com; s=arc-20160816;
        b=RNiiunJaqmAMFN/Q1bbsBxZQVsWsBsQmQAwNx+7PlUeuPNHZX5RFVEV0v7hOYIrUEz
         5eGs5cbZbqwwjy4JHK3JE7POQT14tG1dezRYz3dqxq7R0c3cRGAG9u8/8oOyYcHN2pby
         CXUJBmCs+hofZ3vnrGf8ih866BLpqTr9RWniepueUAJ/b5KaviAr2/QMWWieRuoUQVBS
         vXOnR2fgu34GCZCuBVrx5dIvJh2LgkzpbRnAS8cwLfaINWesVWx4bDgBc5MGHvZIr96F
         j+peEUdbUFf8QYl6wTAgFb0lVR6KLfl1v3g9JyanXiRWf6I4o0ksZIBmJNZ2RA9P40cS
         LZSA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:msip_labels
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=PXoyZdnyu4WNmDAuJAqykAa7BfWna7x1eDX7tWJ9Ifc=;
        b=jhoOs0blUBMRRK+8GW+14xdt3unK/AniDUU7PG30dBCfVAR1Js/I6ZLJ183FPLWG/g
         6wZwab0Kad6IhyfI/vBxDJpyqPYB3HDT8QRdfLPA0INdwUGOh5ldZQqAbia8n35ivAh6
         4u7L3ASL3tq2fdaEqKdKrumLnfBifaGIALPGkQvnjXL/4Nq3aZ9MlNrBQRuT8mxd3mOK
         XV39Ed1xpp4zjmbdqtxfxBt5QHzloW5gKGdzHT15ilTfb5JPGrpselBs80Sx9AGcPe3D
         LDoGLt+I0AOvSo1L76IsGTPFSLT+wy5eZcjaBVOc4EFpoRT4wdrL++dCnF/HK8X9y6BB
         ahjw==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@blancfischer.onmicrosoft.com header.s=selector2-blancfischer-onmicrosoft-com header.b=hZiq+eZY;
       arc=pass (i=1 spf=pass spfdomain=egoproducts.com dkim=pass dkdomain=egoproducts.com dmarc=pass fromdomain=egoproducts.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o6-20020a0c8c46000000b00572498b51fasi6588762qvb.527.2023.02.27.07.07.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 07:07:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@blancfischer.onmicrosoft.com header.s=selector2-blancfischer-onmicrosoft-com header.b=hZiq+eZY;
       arc=pass (i=1 spf=pass spfdomain=egoproducts.com dkim=pass dkdomain=egoproducts.com dmarc=pass fromdomain=egoproducts.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWf65-0005Bq-Cq; Mon, 27 Feb 2023 10:07:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ignasi.villagrasa@egoproducts.com>)
 id 1pWdmR-0004mX-UU
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 08:43:03 -0500
Received: from mail-be0deu01on2112.outbound.protection.outlook.com
 ([40.107.127.112] helo=DEU01-BE0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ignasi.villagrasa@egoproducts.com>)
 id 1pWdmO-0002j8-D4
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 08:43:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgWjIHABqmDQu3Nglpo7Bg2UGYlxZmaE8+eJS5D3VkKnJ7A+XTyZIYtfgYTb7nNC40m8L6o2LfOOKGd0iRHeoIMsaEWaYPSa5a0B4wDHLxAezaIy++kvQ7jB3cs3/8yf6henHeM6xkAlJFjOfiUWtvzonmXHMmd3/2VfBYtIiD3vPxlxKX8DHqAPMk6Pk0iUevRQrHLrH7uy2UAlrjfxaPZfB4s+rMDEJVtzFBMpTVdX8Z+NGIZY0tl0ddQKJ9yA0BS9TpSWFqCTU8yCVsHuuEdlKXsPltDgsBj/KZEp9cB7zQtgR4Ubgf5BzYerjDhzMqWwBgYZh6a2wxQb6KkcOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXoyZdnyu4WNmDAuJAqykAa7BfWna7x1eDX7tWJ9Ifc=;
 b=hVZxyyFaA8pIXhwj7EkbgICj5DFLGOFebd79c+X4WhA3p1ZDSfUOdCKK3cEJU/nPtUiTN5U6kcifUUOPG/tdQitjQAWhn7ec39tvoCB1hbb3DWGHd4AFcUITt4zWS4W/PVKsjgdn2BEBKtQ8Z6jHY++mJCl5GYIpIOnP+oIPTLWUGrYJuNPjrLxikhv/fL8F4qSVoNztI9F+dNUSCdoQKgxKO3i4XZhkzV1sisioek0LDWLJDxDR83IPsW/nk/90Kl6xZaEB1515J+JgVcqkbaUYqRQoIzpf2GXyByYo/d6rrmn/8+UACCiM0pas7acn2VE4Df65a3M3WGlJDtxUJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=egoproducts.com; dmarc=pass action=none
 header.from=egoproducts.com; dkim=pass header.d=egoproducts.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blancfischer.onmicrosoft.com; s=selector2-blancfischer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXoyZdnyu4WNmDAuJAqykAa7BfWna7x1eDX7tWJ9Ifc=;
 b=hZiq+eZYMPU+XgP9SeSeuwLCpRLFvcupKhUwVtxZy0zdtH7p6wIO6VY1MQolTNjbgHZy7dP/5SGSOP3OYldI7qMUmBVNcHwE6lLvvnXz+YZ+ESueyWIrlPO5Ft6KnKf/tI/vhzPj6LDyEOMuaaY4ZjkrnTs9UeSxcOTFmXgcEiU=
Received: from BEZP281MB2215.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:56::14)
 by FR3P281MB2541.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:5d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 13:37:55 +0000
Received: from BEZP281MB2215.DEUP281.PROD.OUTLOOK.COM
 ([fe80::5f0:9a44:c2ea:62]) by BEZP281MB2215.DEUP281.PROD.OUTLOOK.COM
 ([fe80::5f0:9a44:c2ea:62%9]) with mapi id 15.20.6134.029; Mon, 27 Feb 2023
 13:37:54 +0000
From: "Villagrasa, Ignasi" <ignasi.villagrasa@egoproducts.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: Cortex-Mx emulation with QEMU 
Thread-Topic: Cortex-Mx emulation with QEMU 
Thread-Index: AQHZSqZ6NRU0jv/OVUKle4vYXEPeNA==
Date: Mon, 27 Feb 2023 13:37:54 +0000
Message-ID: <BEZP281MB22153CA28D961A3F5FDCE979EDAF9@BEZP281MB2215.DEUP281.PROD.OUTLOOK.COM>
Accept-Language: es-ES, es-ES, en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=egoproducts.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BEZP281MB2215:EE_|FR3P281MB2541:EE_
x-ms-office365-filtering-correlation-id: 0d8e8b6b-0c04-4f08-b424-08db18c7d4b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MSz3d4Iz5o9K46WWes1Pai40c6Lp3da6VB7IuocGp0rr5xvLL+aRR2TUqXQevJlY7EVJ0+u6ut2nUrVHQY7+uvqg8vmlnM0OOaZJQPnqEGrcWOTHxlNoLzlbIqz4IHRIAFSscUqhqGqWdYLovV0LwOeXAmJ4QL51XBVdmnHTRBjQJVSTvfpGC7fFy63nRt0cak1mkD05Nxq2gcQI+mLL2oU6AYyZG9QtTmRz9KSlfJokrMf86SeQ6XYcKs0jNH3gZj5pZog1ow8EVenMJooc2PlKW3CkAn+plwPoGWMsGCBbaw2kkTTRijHrJyMaGGsDNk2hfrDGxCE3ZjAK8hRhLTtc2wIc7tYCvGcDaKbG6Q65XZMKd81Iziad3qtu0C1ce9HsMLOHc7yJjRUthSwskb8S1un2r1gE/RMoQmUAMZSZNjvJ7y5rrhgTv5JzpXche3j0WoRm7dkwBcg1SrzL7VSO1EnyFl97aNbGpL8amBIoZkZhKXypVZeumF/5q4mQuDFr1L6DN8VGkppZebBDHNhnfEGdjXFcS59OjN1bhOaWv1II/u7gqDyhXI5c+IH/juxZBNecoy1641igC9nQqbiaFEAVTSNnlVt+1/Of8vzpQNo12mL3IQT30WGZnmJSyrgNMH9tcEGbzpXg4cAduQk3DEJxbH6YJ6Glmo/aBIxgX9U3AMIiM+QZoZ7L0yY4JiCcO2wUh0n8ViODiUd0qaw0sPwe2xqFDC4qi6gAGgDcZY3frBpAajpAgBFuub5X
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BEZP281MB2215.DEUP281.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(39860400002)(396003)(136003)(366004)(1690799011)(451199018)(19627405001)(33656002)(966005)(316002)(86362001)(9686003)(4743002)(186003)(5660300002)(8676002)(76116006)(66446008)(66476007)(6916009)(8936002)(3480700007)(2906002)(66946007)(41300700001)(64756008)(6506007)(478600001)(66574015)(26005)(71200400001)(55016003)(7696005)(66556008)(38100700002)(91956017)(52536014)(166002)(122000001)(83380400001)(38070700005)(460985005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?0tLtjaArVAX6jxaFvdomh6nFIR7YvX5fmffmymFmNFiDe/tQFlJfI/stmn?=
 =?iso-8859-1?Q?Fl2poMUE5Lr471GbKZ98u4HvXoZ34Qd16dOuweCtb+nyEdMo5Hy6P24hK0?=
 =?iso-8859-1?Q?RNxTn2lzTtxwXOn5/wFMRa5be5D/KtIZ2xJJ47fMXjPfxS3jxsULFO+W0L?=
 =?iso-8859-1?Q?n9k1Bf2XR/m3eIu8vv35YU8pd+BWu2qRmo1o9FjHONoawEGWc1c+ELH8so?=
 =?iso-8859-1?Q?yQC4UEMh9Stam9rOkiFM7wcAIH4eRy0vthIlQc+NUDTVNLAl9mdYFXaE5B?=
 =?iso-8859-1?Q?94Up8YFhcXowWSyz1KfaUCJX8BKueCRq4dNAKJ3DjhWMXWppYM+rKTFV92?=
 =?iso-8859-1?Q?eqyj0t6RiquqxOcTJ/O+kbpbgm5E3quK1S/NzQ+OoT47trgeO4Qdz4JyCb?=
 =?iso-8859-1?Q?ET5eER81qnFWnUrr1lnLAn6Mkm5dQ04gkzwf7laL3jysF510I3/TgdOoMK?=
 =?iso-8859-1?Q?J0COsj5ajtEzVsJq9MerCONY9maru8nDcFtDeufrq4T0udnUFvFdvnJFNZ?=
 =?iso-8859-1?Q?fxi4p5EoA3/7ZaVSXpwHtswX5hwmrNRTR8Iy1rfUS2QTMraBE3X5vRby+c?=
 =?iso-8859-1?Q?Zt86SJ9ScMdoh+NnbM9powRCx2KRy0BiNLz3nzD2ebDvpedP8qESdeobJK?=
 =?iso-8859-1?Q?XdnvKOtw5EImpNhM1IR3w0GxJwzyX5oYAtZfS3yE52A+qx6N0Ch2MJa9ac?=
 =?iso-8859-1?Q?X954JbKNXZN/+ptokP1jfCwvkFG5vj0CSLa/sMAKrEZci4WU/1sgGuPYQ0?=
 =?iso-8859-1?Q?dI8StyFSGJx+JCLLsHIB8z4QRUYxEgyjnYw/H5v1FSud1Td3RAQGJzSiN1?=
 =?iso-8859-1?Q?PRzjluCXa9MOngPefU9nVyEbHv79sLFNQ/uumI+EbPiYVdphvJ5S+7F9N9?=
 =?iso-8859-1?Q?4HW6+0Cy7Qt/zdfrUsNDuC2JsFhTkwz7Uz0AAR1FsdMxe8L6zsCgZ642jB?=
 =?iso-8859-1?Q?y6HRyAMiniY6UNuKxViMgQzJW9S5VId1FVG64kVxysSKTN3x4eRTOBJeBp?=
 =?iso-8859-1?Q?ULmJLu7aJXyVQwhnVVomjj6d4dk8l/4bJXh2TEKi6+QOGJQjMtndmhVAHM?=
 =?iso-8859-1?Q?SB0BPZQyJ1QeO56yqu8gbpGXtnWLGhHIb0cKGNoOIYJY30+ZGWtQqeAP6r?=
 =?iso-8859-1?Q?kmvLYDxNY4d0W5XBzIyl3u1/z3QNygYf9jUQYJHfUSh2qfTzxJtK5dxhEP?=
 =?iso-8859-1?Q?spNmGWaYOvzTXi0Q++qM0CP1V4++iv+PW3AOLi9ZphUnhXfmKIX5NaeyKW?=
 =?iso-8859-1?Q?nfJxvCA0QPFz6eSfNHWr7zNOx6bzKbI66zUKfATULhpVm5iRoPBZRt68yZ?=
 =?iso-8859-1?Q?cHWcGf9UdvQCqT5GkCyOCdcgQUtcBEciMchFDnSRgJCE8mXTl4FgsT6095?=
 =?iso-8859-1?Q?v0hC5ZAr3RozI+GaBATPxq6oiYF+abSrnFpPgI2D0JyKkOoXRhRml4wJGU?=
 =?iso-8859-1?Q?ofCQHXioLj+aSnHFiL5b45ilxlZ9x2utmVvYHW1bpzLti1dfX2yG7MlCCc?=
 =?iso-8859-1?Q?5irkEmCQMYDWFFn2xagenEVABg6f3eFUCrpjxRMkIJEzmpp4nEmueKKT/P?=
 =?iso-8859-1?Q?8+ahwAiF0x4i5pDCG4p477tuAacPoL1VMPLmOtXNrW58K5NudXQygZv3Zn?=
 =?iso-8859-1?Q?pEtsm+QH/c6gtO5W7NsZq6jtVNIpAvFX34JebdQb4mZAq1F50gi9TH+Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BEZP281MB22153CA28D961A3F5FDCE979EDAF9BEZP281MB2215DEUP_"
MIME-Version: 1.0
X-OriginatorOrg: egoproducts.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2215.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8e8b6b-0c04-4f08-b424-08db18c7d4b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2023 13:37:54.9046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b0b4c5f2-64de-44ef-8904-65741bca5702
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vWmeYm0aVAJThENB8s02B4rKLi5+cSa9vH/51Lfc+qsRZp1p/AKO/l6NTT1g/iQzjLycJLLTDA5U12n/dVJhVas5QGfZsnQUzJghEVUFeOPbNvWRxzoZ+k4ZS/l/TFg/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR3P281MB2541
Received-SPF: pass client-ip=40.107.127.112;
 envelope-from=ignasi.villagrasa@egoproducts.com;
 helo=DEU01-BE0-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_REMOTE_IMAGE=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 27 Feb 2023 10:07:02 -0500
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
X-TUID: bztHsmRPEk94

--_000_BEZP281MB22153CA28D961A3F5FDCE979EDAF9BEZP281MB2215DEUP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello All,

Our company is evaluating using QEMU for automating tests for embedded syst=
ems using ARM Cortex Mx microcontrollers.

At the moment we're able to run our binaries using qemu-system-gnuarmeclips=
e.exe. It's documented, however, that qemu-system-gnuarmeclipse.exe is depr=
ecated and it's not evolved since time ago. Accordingly, it's recommended t=
o use qemu-system-arm.exe instead. We're not able to get it work the same w=
ay we do with qemu-system-gnuarmeclipse.exe.

Using following parameters in qemu-system-gnuarmeclipse.exe:

-board generic
-machine STM32F411RE

the emulation works as expected.

Checking qemu-system-arm.exe documentation, we see -machine and -cpu parame=
ters. Testing different combinations of -machine and -cpu that seems to mat=
ch or be close to those for qemu-system-gnuarmeclipse above, we're not able=
 to get it work. We're alwyas getting some kind of addressing errors.

Before further investigate, and understanding that qemu-system-arm.exe is r=
ecommended as a replacement, and so there should be a kind of backward comp=
atibility, I'd like to know what's the equivalent parameterization for qemu=
-system-arm.exe we should use for getting the same results we're getting us=
ing qemu-system-gnuarmeclipse.

Thanks in advance,

Saludos cordiales, Mit freundlichen Gr=FCssen, Best Regards, Saygilarimla

Ignasi Villagrasa

E.G.O. Appliance Controls, S.L.U.
EEONDA - Software Engineer
Calle Maresme, n=BA 1
08185 Llica de Vall, Barcelona
Mobile: +34 664034332

E-Mail: ignasi.villagrasa@egoproducts.com<mailto:ignasi.villagrasa@egoprodu=
cts.com>
Internet: http://www.egoproducts.com

Informaci=F3n LOPD Y LSSICE/ Informaci=F3 LOPD i LSSICE/ LOPD and LSSICE in=
formation.<https://portal.egoappliancecontrols.com/lopd/>
P Antes de imprimir, por favor piensa en el medio ambiente.
P Before printing, please think about the environment.

[to LinkedIn]<https://www.linkedin.com/company/68125994>       [to Xing] <h=
ttps://www.xing.com/companies/e.g.o.-gruppe>        [to Facebook] <https://=
www.facebook.com/egogruppe>        [to Instagram] <https://www.instagram.co=
m/egogruppe/>        [to Youtube] <https://www.youtube.com/egoproducts>
      [https://www.blanc-fischer.com/signature/Sig_EGO_EAC_2.png]

--_000_BEZP281MB22153CA28D961A3F5FDCE979EDAF9BEZP281MB2215DEUP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb=
(255, 255, 255);">
Hello All,</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb=
(255, 255, 255);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb=
(255, 255, 255);">
Our company is evaluating using QEMU for automating tests for embedded syst=
ems using ARM Cortex Mx microcontrollers.&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb=
(255, 255, 255);">
<br>
</div>
<div class=3D"elementToProof ContentPasted0 ContentPasted1" style=3D"font-f=
amily: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0=
, 0, 0); background-color: rgb(255, 255, 255);">
At the moment we're able to run our binaries using&nbsp;qemu-system-gnuarme=
clipse.exe. It's documented, however, that&nbsp;qemu-system-gnuarmeclipse.e=
xe is deprecated and it's not evolved since time ago. Accordingly, it's rec=
ommended to use
<span class=3D"ContentPasted2" style=3D"color: rgb(0, 0, 0); background-col=
or: rgb(255, 255, 255); display: inline !important;">
qemu-system-arm.exe instead. We're not able to get it work the same way we =
do with&nbsp;<span class=3D"ContentPasted3" style=3D"color: rgb(0, 0, 0); b=
ackground-color: rgb(255, 255, 255); display: inline !important;">qemu-syst=
em-gnuarmeclipse.exe.</span></span></div>
<div class=3D"elementToProof ContentPasted0 ContentPasted1" style=3D"font-f=
amily: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0=
, 0, 0); background-color: rgb(255, 255, 255);">
<span class=3D"ContentPasted2" style=3D"color: rgb(0, 0, 0); background-col=
or: rgb(255, 255, 255); display: inline !important;"><span class=3D"Content=
Pasted3" style=3D"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255)=
; display: inline !important;"><br>
</span></span></div>
<div class=3D"elementToProof ContentPasted0 ContentPasted1" style=3D"font-f=
amily: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0=
, 0, 0); background-color: rgb(255, 255, 255);">
<span class=3D"ContentPasted2" style=3D"color: rgb(0, 0, 0); background-col=
or: rgb(255, 255, 255); display: inline !important;"><span class=3D"Content=
Pasted3" style=3D"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255)=
; display: inline !important;"></span></span></div>
<div class=3D"elementToProof ContentPasted0 ContentPasted1" style=3D"font-f=
amily: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0=
, 0, 0); background-color: rgb(255, 255, 255);">
<span style=3D"">Using following parameters in&nbsp;</span><span class=3D"C=
ontentPasted4" style=3D"color: rgb(0, 0, 0); display: inline !important; ba=
ckground-color: rgb(255, 255, 255);">qemu-system-gnuarmeclipse.exe:</span><=
br>
</div>
<div class=3D"elementToProof ContentPasted0 ContentPasted1" style=3D"font-f=
amily: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0=
, 0, 0); background-color: rgb(255, 255, 255);">
<span class=3D"ContentPasted2" style=3D"color: rgb(0, 0, 0); background-col=
or: rgb(255, 255, 255); display: inline !important;"><span class=3D"Content=
Pasted3" style=3D"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255)=
; display: inline !important;"><span class=3D"ContentPasted4" style=3D"colo=
r: rgb(0, 0, 0); background-color: rgb(255, 255, 255); display: inline !imp=
ortant;"><br>
</span></span></span></div>
<div class=3D"elementToProof ContentPasted0 ContentPasted1" style=3D"font-f=
amily: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0=
, 0, 0); background-color: rgb(255, 255, 255);">
-board generic</div>
<div class=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted5" =
style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
-machine STM32F411RE</div>
<div class=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted5" =
style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div class=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted5" =
style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
the emulation works as expected.</div>
<div class=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted5" =
style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div class=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted5" =
style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<span class=3D"ContentPasted0 ContentPasted7" style=3D"font-size: 12pt; mar=
gin: 0px; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">Check=
ing
<span style=3D"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); d=
isplay: inline !important;" class=3D"ContentPasted8">
qemu-system-arm.exe&nbsp;</span>documentation, we see -machine and -cpu par=
ameters. Testing different combinations of -machine and -cpu that seems to =
match or be close to those for&nbsp;<span style=3D"color: rgb(0, 0, 0); bac=
kground-color: rgb(255, 255, 255); display: inline !important;" class=3D"Co=
ntentPasted9">qemu-system-gnuarmeclipse
 above, we're not able to get it work. We're alwyas getting some kind of ad=
dressing errors.</span></span></div>
<div class=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted5" =
style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<span class=3D"ContentPasted0 ContentPasted7" style=3D"font-size: 12pt; mar=
gin: 0px; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);"><br>
</span></div>
<div class=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted5" =
style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<span class=3D"ContentPasted6" style=3D"font-family: Calibri, Arial, Helvet=
ica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); display: inline !imp=
ortant; background-color: rgb(255, 255, 255);">Before further investigate, =
and understanding that&nbsp;<span style=3D"color: rgb(0, 0, 0); background-=
color: rgb(255, 255, 255); display: inline !important;" class=3D"ContentPas=
ted10">qemu-system-arm.exe
 is recommended as a replacement, and so there should be a kind of backward=
 compatibility,&nbsp;</span></span><span class=3D"ContentPasted6" style=3D"=
font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color:=
 rgb(0, 0, 0); display: inline !important; background-color: rgb(255, 255, =
255);">I'd
 like to know what's the equivalent parameterization for&nbsp;</span><span =
class=3D"ContentPasted6" style=3D"font-family: Calibri, Arial, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(0, 0, 0); display: inline !important=
; background-color: rgb(255, 255, 255);">qemu-system-arm.exe
 we should use for getting the same results we're getting using&nbsp;<span =
style=3D"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); display=
: inline !important;" class=3D"ContentPasted11">qemu-system-gnuarmeclipse.<=
/span></span></div>
<div class=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted5" =
style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<span class=3D"ContentPasted6" style=3D"font-family: Calibri, Arial, Helvet=
ica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); display: inline !imp=
ortant; background-color: rgb(255, 255, 255);"><br>
</span></div>
<div class=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted5" =
style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<span class=3D"ContentPasted6" style=3D"font-family: Calibri, Arial, Helvet=
ica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); display: inline !imp=
ortant; background-color: rgb(255, 255, 255);">Thanks in advance,</span></d=
iv>
<div class=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted5" =
style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<span class=3D"ContentPasted6" style=3D"font-family: Calibri, Arial, Helvet=
ica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); display: inline !imp=
ortant; background-color: rgb(255, 255, 255);"><br>
</span></div>
<div class=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted5" =
style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<span style=3D"font-family: arial, sans-serif; font-size: 11pt;">Saludos co=
rdiales, Mit freundlichen Gr=FCssen, Best Regards, Saygilarimla</span><br>
</div>
<div>
<div id=3D"Signature">
<div>
<div><span style=3D"font-size:11pt; font-family:arial,sans-serif"><br>
<strong>Ignasi Villagrasa</strong><br>
<br>
<strong>E.G.O. Appliance Controls, S.L.U.</strong><br>
EEONDA - Software Engineer<br>
Calle Maresme, n=BA 1<br>
08185 Llica de Vall, Barcelona<br>
Mobile: +34 664034332<br>
<br>
E-Mail: <a href=3D"mailto:ignasi.villagrasa@egoproducts.com" data-auth=3D"N=
otApplicable" data-loopstyle=3D"link">
ignasi.villagrasa@egoproducts.com</a><br>
Internet: <a href=3D"http://www.egoproducts.com" data-auth=3D"NotApplicable=
" data-loopstyle=3D"link">
http://www.egoproducts.com</a><br>
<br>
</span></div>
<div><span style=3D"font-size:11pt; font-family:arial,sans-serif"><a href=
=3D"https://portal.egoappliancecontrols.com/lopd/" data-auth=3D"NotApplicab=
le" style=3D"font-weight:bold" data-loopstyle=3D"link">Informaci=F3n LOPD Y=
 LSSICE/ Informaci=F3 LOPD i LSSICE/ LOPD and LSSICE
 information.</a> <br>
</span></div>
<div><span style=3D"font-size:11pt; font-family:arial,sans-serif"><font siz=
e=3D"4" color=3D"#008080" face=3D"Webdings" style=3D""><b>P</b></font><b>&n=
bsp;</b><font size=3D"2" color=3D"#008080" face=3D"Arial" style=3D""><b>Ant=
es de imprimir, por favor piensa en el medio ambiente.
</b></font><br>
</span></div>
<div><span style=3D"font-size:11pt; font-family:arial,sans-serif"><font siz=
e=3D"4" color=3D"#008080" face=3D"Webdings" style=3D""><b>P</b></font><b>&n=
bsp;</b><font size=3D"2" color=3D"#008080" face=3D"Arial" style=3D""><b>Bef=
ore printing, please think about the environment.
</b></font><br>
</span></div>
<div><span style=3D"font-size:11pt; font-family:arial,sans-serif"><br>
<a href=3D"https://www.linkedin.com/company/68125994" data-auth=3D"NotAppli=
cable"><img alt=3D"to LinkedIn" src=3D"https://www.blanc-fischer.com/signat=
ure/EGO_LinkedIn.png"></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=3D"h=
ttps://www.xing.com/companies/e.g.o.-gruppe" data-auth=3D"NotApplicable"><i=
mg alt=3D"to Xing" src=3D"https://www.blanc-fischer.com/signature/EGO_Xing.=
png"></a>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=3D"https://www.facebook.com/eg=
ogruppe" data-auth=3D"NotApplicable"><img alt=3D"to Facebook" src=3D"https:=
//www.blanc-fischer.com/signature/EGO_Facebook.png"></a> &nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;<a href=3D"https://www.instagram.com/egogruppe/" data-aut=
h=3D"NotApplicable"><img alt=3D"to Instagram" src=3D"https://www.blanc-fisc=
her.com/signature/EGO_Instagram.png"></a>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=3D"https://www.youtube.com/ego=
products" data-auth=3D"NotApplicable"><img alt=3D"to Youtube" src=3D"https:=
//www.blanc-fischer.com/signature/EGO_Youtube.png"></a> &nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;<br>
&nbsp; &nbsp; &nbsp; <img src=3D"https://www.blanc-fischer.com/signature/Si=
g_EGO_EAC_2.png"></span></div>
</div>
</div>
</div>
</body>
</html>

--_000_BEZP281MB22153CA28D961A3F5FDCE979EDAF9BEZP281MB2215DEUP_--
