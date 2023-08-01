Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2667499ejb;
        Mon, 31 Jul 2023 23:34:07 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGyaEDPSlN+bD177j0jcFWXrP7B1cP6ehNN2i7HMXCS+WTKRSTnROy7jZzNFJ038B9wXzdB
X-Received: by 2002:ac8:5c82:0:b0:403:ed26:4083 with SMTP id r2-20020ac85c82000000b00403ed264083mr14211094qta.61.1690871647502;
        Mon, 31 Jul 2023 23:34:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1690871647; cv=pass;
        d=google.com; s=arc-20160816;
        b=GwHp3FyCTILjN9UfuO9ZqjYm1yyFIaoCP5kUzclpSjW6EaG+wyXqAWB65Ha0R+V/Q8
         km/4D3DqNpqS6cAdA1HcnxvuJDwDnYlHTXbYz8Cb6OGMIvBPX5GMTlurpk/Cm8Y3b+kP
         LZAfzP57lbAzT4dccQScKxE4c02JxSzRlW9x9WcjRNcaoUV5jpCVAHd6rx4Tm/Q4BVw3
         KJiqfQNFTRHhTftC2fetSRa/j8L90rD+MpToluDmqt9tDKqGBpW8uzTjcvuJnOriWt2H
         iCPKVJHJZyMs4ifFl8grpzY0PN5FijsQtgKONvFw6Irr4/m35HhJ2BhxA4RnaqTbxlDr
         ftIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from;
        bh=34kdK6UpX14kPMyFu+iv7mTsM9aT9LYuaV/X75DKi24=;
        fh=ee7yagLBekD5i0z7f3lt/FVeoXWyYkFxjhYfWRCsrC0=;
        b=l28OlvwI2TZLAgpGqI8/PBg5m5/mOGfNc9Z0Ib1jJQoS700Dz0uF8q2gbKAHWmAYaL
         elBmqoVxhLO+oqwBOIGINE1zPYYyi+Qo/SN2n5SGmUcVTjnAbK7gcHjbFZhUwnWTMU8G
         b4rB0+Ee188Pssfr2TQ2fViBmSfqHOi93UZ9XB7wzmpxpJanBvvRK5a+ESUe0WJlo1S2
         ZiA95EVv/g0aisK+D24pjLtVub6IM8JgapPjbEofywyjmmj5ZBTuNgBVpqxzhAOEw71Q
         ob4crj+SGZRZjFrr60qV/VTFVY4xEwge8Y3mVqFtw/Nj5Xp1sBNGUqCvhmcALJV3fTcZ
         zf7g==
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=indra.es dkim=pass dkdomain=indra.es dmarc=pass fromdomain=indra.es);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=indra.es
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2-20020ac87fc2000000b0040fcb5032fdsi1282889qtk.350.2023.07.31.23.34.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Jul 2023 23:34:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=indra.es dkim=pass dkdomain=indra.es dmarc=pass fromdomain=indra.es);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=indra.es
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qQixA-0004Bv-9T; Tue, 01 Aug 2023 02:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ariom@indra.es>) id 1qQix8-0004A2-77
 for qemu-arm@nongnu.org; Tue, 01 Aug 2023 02:33:54 -0400
Received: from mail-vi1eur05on2101.outbound.protection.outlook.com
 ([40.107.21.101] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ariom@indra.es>) id 1qQix6-000403-1T
 for qemu-arm@nongnu.org; Tue, 01 Aug 2023 02:33:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mdCACjmFdILhH61dmTma9cqlWWwB121tKx4O8gjvNee/253PqmlnQdEqKK9DFnwiJUqj641HOxrC5iJiHp0diHQtl5FfwMWpMdtiY23sUinpsFdMSezfWfvzxMPTyoChzovjyW3VuM8dWZEmPqUm3J4FUmeEO8+BC4WRIQUE5eMxMORWn+HI2DlGquohg8P0hkHvFpMbDak7gwIrolJBTbyxYlwqZ8q0i3lL0/0HGXjqV6I62ixAxmq5jsV6GUrQPqqOg321wj59GRSwGIs98edpwuA+ZkdnnrX9yWUsydSdoy864gOafFIMwUk9KAQVAjDJ3hJyOvjAPVuxL4XIRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34kdK6UpX14kPMyFu+iv7mTsM9aT9LYuaV/X75DKi24=;
 b=GbelFvfmF1BJz8/tmNg3U8zlJYD7CwkzX6XNHFiK592dsMeLxrv2PK1JiVW1FseMVCkt48uMLFPDM6Ef7mq0F7snrLh8aUg/p0hyGANbF0r7jO1mxqKl9qqF7/VzeeVJStSkT6ySwvmXpS4OLqq6XooI7sgtfceGfrQyHvkZpuNJvjZT7zvSE2qc/qcU3JgUHDPGMOayFzDuINH1AaFy609imeJPrl0xzHOllmywvngSFf1s6cB1xCFQAy5TgFWmCIKGYWW320GELE+5WErhPFDs8+QHmsX2oNMzXkozDsOfELZKcrjTeMUJPp8Qz7cfAQ6sueUVGyv1BTgL25zH/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=indra.es; dmarc=pass action=none header.from=indra.es;
 dkim=pass header.d=indra.es; arc=none
Received: from DBAP193MB0939.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:1c6::7) by
 AS8P193MB2271.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:446::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.44; Tue, 1 Aug 2023 06:28:43 +0000
Received: from DBAP193MB0939.EURP193.PROD.OUTLOOK.COM
 ([fe80::2d80:4a12:f663:ee31]) by DBAP193MB0939.EURP193.PROD.OUTLOOK.COM
 ([fe80::2d80:4a12:f663:ee31%6]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 06:28:43 +0000
From: =?iso-8859-1?Q?R=EDo_Mart=EDnez=2C_Alberto?= <ariom@indra.es>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: Device remote-port from xlnx-zcu102 machine
Thread-Topic: Device remote-port from xlnx-zcu102 machine
Thread-Index: AdnEQWqGYOSU4eq6SrWboWZMt2FX2A==
Date: Tue, 1 Aug 2023 06:28:43 +0000
Message-ID: <DBAP193MB09397867852FAF63722DA7C4CA0AA@DBAP193MB0939.EURP193.PROD.OUTLOOK.COM>
Accept-Language: es-ES, en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=indra.es;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBAP193MB0939:EE_|AS8P193MB2271:EE_
x-ms-office365-filtering-correlation-id: dbc25f8f-ccbe-4334-a54f-08db92588da2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MDaZ4YYPht884o5tiWo9bMGGHTNf8JWJIgHesYHVoVIVnKrUxKrD7WMNni2D6ENP8D9QdbVlg5yu3BIt7Fr0Tek4bUd/Zfb67pcLKJXEpXjrWk6mSVN26OPHPZuKw7ovzfexH2sJ6r3dKAAldrXbqmU9c/KXBgv50vmQRN+vuQhm6ExW3DUOjx/fP2JZgpLe1YlUJGKYzFDdXuD/th1SV6yyWwvhDhXa0PkvYYL7AkJc5JwxRPOL/DsGaacres/lQUym7uX8IIjSeq3Kezv+Yjy2S0mrLI+Z+pzJqJYX1EAmIDSbEXbn2QxFzrvJt24nXsKjaWaWt9KRiCMZuAxO4LhUc9SuoAQ4wQtuGhj8LzUK0i+bbBUNgjCTBJnTY4mHt953vS7UspIdhOiqg9zu2OHNXQ5FcvsspKkPvvOXsZuDk1IESTc72RZfnZmD5tFtBKDG7d6ACudr7YddohXPYAi3IoM0+Qs2oJh3HInNimMzpsdjZ8DqtylCeX7I8ln3+CBChPRUsCf1ul1QnOsijATNNhBwJrUaBg7Gy2jH17W90E7yw8rj+CZrvytz4Q1e1JCthmtabPHwbjTSIzs16g9y0HyacIfcoUd+xsiSviUZzfV9KfbsIgyaPAmHzAYq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBAP193MB0939.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(396003)(39860400002)(136003)(346002)(451199021)(38070700005)(6916009)(83380400001)(2906002)(186003)(316002)(38100700002)(478600001)(41300700001)(86362001)(122000001)(9686003)(52536014)(55016003)(5660300002)(66556008)(66446008)(71200400001)(64756008)(66946007)(66476007)(76116006)(33656002)(6506007)(26005)(8676002)(8936002)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?f43Ruluw0HJz+CNNZzFU8T9gketRiJascxRc+dPsm3kr+GTKsmT+YjLB5W?=
 =?iso-8859-1?Q?4bGS7zLd0UbLlI3kimG12i7ckhaBYYvRQ3G4T2xxllGe0rNWktgKhbHkBx?=
 =?iso-8859-1?Q?6GZPPBZote4yU4Vs6O4GhoVKJ5cfzn47v9B9xSUKo9KmOGLWbZr2PsJqbA?=
 =?iso-8859-1?Q?lMvTdUGABhiCbxr/bNShKrQ4rmiM8+3RtcFqPFptB3fB+rpTuqJcjp9SYE?=
 =?iso-8859-1?Q?6vMqJ1H/qy6lXn87syUPEWd7olH55OqdJBu7cOxDx1zttecVcB1O+B0g2Q?=
 =?iso-8859-1?Q?yVTNkCEJx7a9uVDZObzPS9Sxe2h0sWTMRTfPByAg9hqltY93y9OtzRsAB8?=
 =?iso-8859-1?Q?WuYtWsnJU1Jxo+f5cbWnznrcTPLAGZvPsHH0Mts4lGjecfx/tM4jZnx2Lf?=
 =?iso-8859-1?Q?3EIlBB0Nij0agGyKwLZRP9C6xDlubQxSRyWukSFnAi7RXOv9pxv7I4vmhm?=
 =?iso-8859-1?Q?9MBrIfcl4GE4148p3CnhQKRMbcdAEZzYmN66jitYUctsgHBwIdVGgYvPIV?=
 =?iso-8859-1?Q?x3Jwx1qqQug/VrDTA/h/cwE29o3Sy7lzI7mImGRI6fK3mTgUDGC1+/ybqZ?=
 =?iso-8859-1?Q?jls6bLxB8hI6Zg0D5J8hOMWcPc1JD0jGnp+8zndzLvUTH0UXSmLrjG9Por?=
 =?iso-8859-1?Q?W2lC8vUfWbRmvuOrQmAEIaKGJGdDuu57g98QPkbrms6w1CYHAcli95hw0N?=
 =?iso-8859-1?Q?xSV2PS64RhElbzpZYxJTHdjnuvt8Uhop12HFD7lY9RtnM5UIAYQCZN0/gM?=
 =?iso-8859-1?Q?eatwaxalE1o30wT7GAdhZjsm4oL9r74Vjs9U51HDlHspDZVMEUMX5/asrf?=
 =?iso-8859-1?Q?7f3LhV7b7ZqkkrPsAWFzSUPkcNqhlNaFBVEOzjZgv6XVWOfoDg7Jyy/4/h?=
 =?iso-8859-1?Q?f/zsJUBaNcLpYPluIEfcVvkE0CTZZt400XCBklK/9VYp2r/uoupju2lCWa?=
 =?iso-8859-1?Q?fNmhTZcPrf7UFcymdWohTcCBdgDV4bs6RJBjbBkn5wbqlveo/VvB0CA2GB?=
 =?iso-8859-1?Q?Gydoa5p+6P3f/Sd2+3LiqhJfkJmEJUJvP0XsKqZZ7IA2HZvuBdDZ8uBl8Y?=
 =?iso-8859-1?Q?zzvxeUHWfIw5NjnbBvQ2en6tVvzGFwM/UK9KfoaMG0+f1cPB9SMpsR6hpN?=
 =?iso-8859-1?Q?rWXaxMF2SmTa42z8Gi0SLaTekkOQqOutcPYy6nfmWu3ucyFvti29S+SVP8?=
 =?iso-8859-1?Q?C+A1+JgukhD5JX2h0e5AW55OnK65iGZtOR9JVocOoCwuJuKRiCgY/k6iwb?=
 =?iso-8859-1?Q?taAYgYu0Yta0NCega/hi/Vt4a3PY2bHP85cACd026deyRIgblCXzdJ9sxB?=
 =?iso-8859-1?Q?DA3FKgFkZaZf5VD2idka2/Bls8Olx42l8iCcDX19cBnpnxvjmy28JAru1M?=
 =?iso-8859-1?Q?6ZNJ9et8W+Zrs0tr7chfsehuXmcmfsni1KJFhWDxyi9UWNazjPPQauY7kH?=
 =?iso-8859-1?Q?fs/VFEKiTGfK1Ss87fcG9GgYQ0lCXOi73Ee/sOFQcA4gcsq+rSaR0RCZZB?=
 =?iso-8859-1?Q?XdHGhhaOUVljLmIgQ9lOCqev6JPu/DHvda1Z4k9xjtc8ybnxNyME1I41bF?=
 =?iso-8859-1?Q?B8ioVjhA9L4eMcieeTiRs2qmM+w37V7unK/ETQQagxcIPjJIlzZCZvdRen?=
 =?iso-8859-1?Q?klhqV0ZukzMEY=3D?=
Content-Type: multipart/alternative;
 boundary="_000_DBAP193MB09397867852FAF63722DA7C4CA0AADBAP193MB0939EURP_"
MIME-Version: 1.0
X-OriginatorOrg: indra.es
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBAP193MB0939.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc25f8f-ccbe-4334-a54f-08db92588da2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 06:28:43.3718 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7808e005-1489-4374-954b-d3b08f193920
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OUA1MzULzkfIiW2+Jjz/Gj4iynArFPoOS8lTBZi7h+ZBvJc0vS5oBJ6xzWKBq5br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P193MB2271
Received-SPF: pass client-ip=40.107.21.101; envelope-from=ariom@indra.es;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 4TR+NuCZBcbh

--_000_DBAP193MB09397867852FAF63722DA7C4CA0AADBAP193MB0939EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Good evening,

My question is related with the use of device remote-port from xlnx-zcu102 =
machine (aarch64 architecture). I don=B4t know how to add this device to th=
e execution command and connect it to the emulated machine. Thanks for your=
 attention.

Sincerely,

Alberto R=EDo - Firmware Engineer in Indra

________________________________

Este correo electr=F3nico y, en su caso, cualquier fichero anexo al mismo, =
contiene informaci=F3n de car=E1cter confidencial exclusivamente dirigida a=
 su destinatario o destinatarios. Si no es vd. el destinatario indicado, qu=
eda notificado que la lectura, utilizaci=F3n, divulgaci=F3n y/o copia sin a=
utorizaci=F3n est=E1 prohibida en virtud de la legislaci=F3n vigente. En el=
 caso de haber recibido este correo electr=F3nico por error, se ruega notif=
icar inmediatamente esta circunstancia mediante reenv=EDo a la direcci=F3n =
electr=F3nica del remitente.
Evite imprimir este mensaje si no es estrictamente necesario.

This email and any file attached to it (when applicable) contain(s) confide=
ntial information that is exclusively addressed to its recipient(s). If you=
 are not the indicated recipient, you are informed that reading, using, dis=
seminating and/or copying it without authorisation is forbidden in accordan=
ce with the legislation in effect. If you have received this email by mista=
ke, please immediately notify the sender of the situation by resending it t=
o their email address.
Avoid printing this message if it is not absolutely necessary.

--_000_DBAP193MB09397867852FAF63722DA7C4CA0AADBAP193MB0939EURP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 3.0cm 70.85pt 3.0cm;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ES" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Good evening,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">My question is related with the use of device remote=
-port from xlnx-zcu102 machine (aarch64 architecture). I don=B4t know how t=
o add this device to the execution command and connect it to the emulated m=
achine. Thanks for your attention.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Sincerely,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Alberto R=EDo &#8211; Firmware Engineer in Indra<o:p=
></o:p></p>
</div>
<br>
<hr>
<font face=3D"Arial" color=3D"Gray" size=3D"1"><br>
Este correo electr=F3nico y, en su caso, cualquier fichero anexo al mismo, =
contiene informaci=F3n de car=E1cter confidencial exclusivamente dirigida a=
 su destinatario o destinatarios. Si no es vd. el destinatario indicado, qu=
eda notificado que la lectura, utilizaci=F3n,
 divulgaci=F3n y/o copia sin autorizaci=F3n est=E1 prohibida en virtud de l=
a legislaci=F3n vigente. En el caso de haber recibido este correo electr=F3=
nico por error, se ruega notificar inmediatamente esta circunstancia median=
te reenv=EDo a la direcci=F3n electr=F3nica del
 remitente.<br>
Evite imprimir este mensaje si no es estrictamente necesario.<br>
<br>
This email and any file attached to it (when applicable) contain(s) confide=
ntial information that is exclusively addressed to its recipient(s). If you=
 are not the indicated recipient, you are informed that reading, using, dis=
seminating and/or copying it without
 authorisation is forbidden in accordance with the legislation in effect. I=
f you have received this email by mistake, please immediately notify the se=
nder of the situation by resending it to their email address.<br>
Avoid printing this message if it is not absolutely necessary.<br>
</font>
</body>
</html>

--_000_DBAP193MB09397867852FAF63722DA7C4CA0AADBAP193MB0939EURP_--
