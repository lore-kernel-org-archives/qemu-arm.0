Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp63544njd;
        Fri, 18 Apr 2025 00:31:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUuVCFmYhnSW3bX5WQmi1hPiVlnuDIAIAaIacCjhWNe8Zv/G3cgG9m6QNDhIwQdkixq/nvMAxl5vuvhyg==@linaro.org
X-Google-Smtp-Source: AGHT+IHyJeAUDcip6tkDdZYktDR5HcukyPB8QWcR8LFY1Kg7zFZffRhw+Bxa/hhG4kkQDDZjZ8zA
X-Received: by 2002:a05:6214:410e:b0:6d8:8a8f:75b0 with SMTP id 6a1803df08f44-6f2c4540815mr28191486d6.14.1744961511280;
        Fri, 18 Apr 2025 00:31:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f2c2aff385si15865296d6.80.2025.04.18.00.31.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Apr 2025 00:31:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@MindaLtd.onmicrosoft.com header.s=selector2-MindaLtd-onmicrosoft-com header.b=gs+5O5GR;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u5gCN-0008Oz-Nc; Fri, 18 Apr 2025 03:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchaudhari@unominda.com>)
 id 1u5gC9-0008IX-PO
 for qemu-arm@nongnu.org; Fri, 18 Apr 2025 03:31:32 -0400
Received: from mail-centralindiaazon11021128.outbound.protection.outlook.com
 ([40.107.51.128] helo=PNZPR01CU001.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchaudhari@unominda.com>)
 id 1u5gC4-0002J6-U2
 for qemu-arm@nongnu.org; Fri, 18 Apr 2025 03:31:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qyZ9QQbcn5vB8XDHw1rQAnZx7srpSIxiVZGwR3cnUmuCIygzdZ3oXSdsNYb41n/CiFrYlUNorR8kUH5g8KW6dl4mKmlCzINgT4FrhxQRyNPyqXcZ2VJqeAyZQdsIGqV7iUIRNB9GDWkTHX3HWQpXrwW9LxithfigR35J8O3QLEPeDOuHnTHCbVA7goAr+RkUKWkVFlPHRkoChqImwHgjeoX6xn1yLXAhyMis1K3O8Syqa/bMa2TdAKbezz4cToGFCz2XE29cu9PPnsYd+Ud9t4suwnVHYb8vDOEQzk03EJ/mNRqxPUDSC4+A/n8UThMQsbEoDHuNVtydJsOiBdBJvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYJG1kHix3L+TU3hZBdqdxavwiLGFbzhDJjuRPlNC4w=;
 b=bs9Jb1TuzOSvZuYpvobqrZjh0gB4Z5OkKGCyxdcnUCkqTZQj/tIxzoBcF11wl51DJ8d6mqeieU1ALVpjji405N28EznmRo0BrQ6mtncQOLrxON/29B3GWcCLdobkelDEkMbDlw+5Z7kKQQHs+6M3DNiTD74dVVgz7m7pGN6LBa3kNWPvsVW/mmY6QmGpqXkun9D9MnRqIAXQGhx6OwKTtmcr+GRo/Lpr4thq7QGm4xiYJJXntyI6X2lFvzFxwlisRF77Uv/USleFbFd9Pbc2UOIT5VwgS/Wje1YTnCPU1cdlrdLex6J0ipC4vuBpIxiL/RWHP2ktWFbv2LCPZ7DKRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=unominda.com; dmarc=pass action=none header.from=unominda.com;
 dkim=pass header.d=unominda.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=MindaLtd.onmicrosoft.com; s=selector2-MindaLtd-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYJG1kHix3L+TU3hZBdqdxavwiLGFbzhDJjuRPlNC4w=;
 b=gs+5O5GR89zD+FAu8LgF7UyH8iNNhgSspBCDsw2ApG6J50/EY9dYILIrfyTjXs136iCougatRd3bRv9cJ7HzevO0LzTWJ+/G0P/XL9vB7YEWeTURkQAobiLas5ZjZDXvcXS4tEthpnsCCTpXkv6z3PNhZN+d+Q1gYAa15+QsSbo=
Received: from PN0P287MB1239.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:18d::13)
 by MAZP287MB0559.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:112::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 07:26:12 +0000
Received: from PN0P287MB1239.INDP287.PROD.OUTLOOK.COM
 ([fe80::d611:1938:6be0:41ee]) by PN0P287MB1239.INDP287.PROD.OUTLOOK.COM
 ([fe80::d611:1938:6be0:41ee%6]) with mapi id 15.20.8655.029; Fri, 18 Apr 2025
 07:26:12 +0000
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
CC: Milind Shitole/CREAT/E&T/PUNE <mshitole@unominda.com>
Subject: Emulator support for not listed Cortex M series microcontrollers 
Thread-Topic: Emulator support for not listed Cortex M series microcontrollers
Thread-Index: AduwMsDHlL2E5KkjRjmYseMmkxkqGQ==
Date: Fri, 18 Apr 2025 07:26:11 +0000
Message-ID: <PN0P287MB1239BE57167C9D425AE3D353ACBF2@PN0P287MB1239.INDP287.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlpscanned: success
x-classification: PEdUQkNsYXNzaWZpY2F0aW9uIHhtbDpzcGFjZT0icHJlc2VydmUiPjxtbG4+Q2xhc3NpZmljYXRpb248L21sbj48bWx2PlB1YmxpYzwvbWx2PjwvR1RCQ2xhc3NpZmljYXRpb24+
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=unominda.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB1239:EE_|MAZP287MB0559:EE_
x-ms-office365-filtering-correlation-id: cc7f5095-91b5-428f-e0d8-08dd7e4a4bc0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?rnWo1bLkEjifMaq5XjUK9oLeR4ezlCdDOSUUptrvzaPS+1NF6rUYeU7eRKiI?=
 =?us-ascii?Q?V7QUAD6Yj7LB1QyfbaGctjwqY2OTLXwhrFz3AtGLShUEtuULuo2cIMh/sccV?=
 =?us-ascii?Q?sELB663lmrNw29Kut1PfTAxK5g3aLRDAwxvidxMAycbxVp4H5SSu5x3ZxvcP?=
 =?us-ascii?Q?VRnk5r+jv7FE7hFE68eaVfAkzhDEqd+C1IQxRuFGlcjHT1C5zCngb4WB4OWX?=
 =?us-ascii?Q?Rmcb9YF6InEiwykahZ7/t0WCW/33D/Y5CuucxGv+EJZgti6fFe4pX5OHufEW?=
 =?us-ascii?Q?hFRgX9n6WDnPPpewriReLPw58jcklWDmE2qEi9hOTFevhQ4m3ck1lHRpTN7C?=
 =?us-ascii?Q?oAiqTFDfg/Xwo3aCgGPcDYCXpAnR/dfwBw3c4N4IlBo5rGgdUK98KjwLIZQr?=
 =?us-ascii?Q?kiAUazxU+xIML5jmcplyP6rzlxHuidEFNbVekAu5G8+qosK+JfrhhthnUIlF?=
 =?us-ascii?Q?yCpCnS9zGYtO2QehSHkpvbIrrGqfq60vgX1NHWSG8ivGUejbMK5SDbfg866q?=
 =?us-ascii?Q?mp4ht8xD+yKC2lP8KdDKA6oXfQ9o1Jnc/B6fTaJG2QoSyxm/l2qSpwzREgoL?=
 =?us-ascii?Q?TkOc72uSmmVvLAPvqzl4Xg+C/6FTENfVfHfCOS8+Yi9yWSIizEAGxIDqvjjn?=
 =?us-ascii?Q?wlbs0iXZ66/xYy+moQVHGdMGZeqoU7JZueUR7JCeNKLedeEKbm89zQkyKEKm?=
 =?us-ascii?Q?nxUJi086LidxugL9BMrwfFGj0kFzdJdAinmk0V35vYkZ3J3WsIZJSzSUK6z0?=
 =?us-ascii?Q?rW9rkYE1GuUN4txn+3IoGbSb7WuWeoPfCVOF7o56f+20m4q4bLbHk5G8mD/i?=
 =?us-ascii?Q?wa+h0SFuWD2IyBNfttaApUaEVpoLOmK696g2keRM2Zrr2rrWoCiwMEs6kIDj?=
 =?us-ascii?Q?fh5DsIdTd+5ZBoOOKSjkmmoNpCzcTKqvI6lM2GgtQ4vLpnSYtjYY64MMdti1?=
 =?us-ascii?Q?PBHEt2WDF4ksfIaRw+CdgB3gwUrphLj6su+dcN8Dm3ggk4Tt+iPKam/esZ4/?=
 =?us-ascii?Q?2o95GVbSz6DMqIcR//dsiwKrLMsHkQ5cttR7JO6WYjgAx32qwHaNX1LygkbH?=
 =?us-ascii?Q?f5qGV97cVrmQSZ9r7lyFzHXS4vAA6H0yo4ahmipf48PEDldz+yqMshRiOz+s?=
 =?us-ascii?Q?3WileQ2ra+qUu2lcEs0eaFtLaOyRG1BUo+zAYdDFODwLKrgPgXF6NmEfHr96?=
 =?us-ascii?Q?UOUr8VufOj02/Ry3VKdu4aV81tpyWGzsPGYpBkG8jDeyKTx4jLs/rsXT/Kqj?=
 =?us-ascii?Q?zlgv5ySN9lMVOIk0c8r0kAdJU1h0VCr04lBgLYpEJpBH2qKZyhJG5y99g31D?=
 =?us-ascii?Q?ojbjKtAXNtMqIGI+djm7ri+VTMF1snmpzlingxQPJqMiJ7tuYez3w1VbRFmo?=
 =?us-ascii?Q?QxyrCsdG/sAORku1ZTQdVUJT9ySubHu6SlFm6tjsR9EfY88pzaYmr0+80rhS?=
 =?us-ascii?Q?IAY6//GSIwIJxXsIAxQknQodgD7SQ32NIgizAxrsWggUH45+LLvHI3eWY7po?=
 =?us-ascii?Q?o39DZpKhCgUNKCo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PN0P287MB1239.INDP287.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+mSZabeGas9vvP5LVAKewBGz9Q4FpkD9pcaOVK9r6f/SofeEcPB62vIVSsx4?=
 =?us-ascii?Q?zyqCmpnIYupEByd1uOuW5nolR5oCVnOCgVrR/eRHk8y8XvmxljBwgG0u1WRz?=
 =?us-ascii?Q?qHEP/d4yrsRh70xwJNtehif7A2o2nGyOFaD5J0SXlegb4HDmGY9lHgukAokc?=
 =?us-ascii?Q?+xhrklHmKRr8L304UWJ1NY2qv7dCQtO1UPmTRutvhW0A26nZpVV8qOjlXO4j?=
 =?us-ascii?Q?JMXwwo7cVeJLYYsBz8JK49jkmxcVdr3MLJfNQf/X9XtUBXEyPKUxsNExvsgB?=
 =?us-ascii?Q?D3zmSocN6gIq+OroMBhGjpbgl+ghF0esIfGG1RxTzF9r9Yn6sy3eSjvlkTQE?=
 =?us-ascii?Q?lYISm2FJKfYzKJd1CXnM+aj5M05F7h6c2lshpYjCEdKbwawtOXTQXJQPSjkf?=
 =?us-ascii?Q?Xwm1RC1ajQPnM1BcvGt53YUoq6vOUB/m13YfMOM1iLqrgLHpi6KftaxPgds9?=
 =?us-ascii?Q?F8uFlN7W4Jy0PGDAQcnlWKNKf48/h3hGOkTiUU+xzj/u5eCu9bWrShjCyqNN?=
 =?us-ascii?Q?ZTTCCHBbhcZw2HTZiGKHQvCrxOBXWcfNyFSaG4mdlZD1Ajtl6a0P0J9vVQ66?=
 =?us-ascii?Q?FYpAKfK9iU7lpw01SD48LbZgXfUAh6TnGejYkR2irF0xjMzss05z7WO8KDK+?=
 =?us-ascii?Q?rgyIA2JqjJVq9o07uG2joDF5mVcj/KN0aWzH8dEc02vz8MELs0w3BNrEmnNB?=
 =?us-ascii?Q?u9SQX0A0iliMYnqpuY8nXUr7b9GgukUxIusx9MP8dH3etfmcwPSmQilaHMxo?=
 =?us-ascii?Q?UdvHcVMLgWrmC5/mYFC3gIGqheQdMZxeK7Ymkt1rhfKvP490g2P+gpuXAYkE?=
 =?us-ascii?Q?p7pV62woBpl+brybM+7GWKDVHN6SPy1qvwIfri4k+sdLPOtmJSB0Xnm1jnx5?=
 =?us-ascii?Q?cZPmw7mc2qXF7NcRDroF1CevKAEIAmMVluW4NVNoM+IG40SqKTPzX0KIAVp+?=
 =?us-ascii?Q?nTl60Csc+VhU48sFfe+L4X6mq+wDGkCfzCvHrTuiXt9OAkSuR8BdZnQ2ozUl?=
 =?us-ascii?Q?Q8UWt1UD7+xYDyWo9YUmaUipBQswiLn8WSCpYtqeYPo2BClkQ92qh9NDf2go?=
 =?us-ascii?Q?OJPLN7SahBrmSHRKMZnuYN+PbnKOESHzMJa6lw91EpsJyCuCwB24kcJnRbAk?=
 =?us-ascii?Q?8TnodVxkYi9qE5tA6HqmxpR9F2P6aec9y2Il/Fo9EqkpACAsdA+b+MJDS5U4?=
 =?us-ascii?Q?SXHaaAt2XgcfCzvne8rynNp/hThR1Z7TGIMAoRW0+fjuVEUZH8eSvOX9hA/S?=
 =?us-ascii?Q?FiT2DVudAhhmCE3CgulJ8ce4xs5i45zCIe//nwtPeWUySMfGdClH28HMAtiq?=
 =?us-ascii?Q?zB4Dx9NzWxO2M0VRsnMXy3ptyYavgoacyJob663DoKIERkBccnWx2f9uoPA2?=
 =?us-ascii?Q?MwrD/1S/nFPkT3z1WUtCaCfvqmdMrlm6Hh4XVvr4AwjtIMIFPTS8M4Wf7T+u?=
 =?us-ascii?Q?4vVeiW9DqTRC0Ylw76eH4cHPEdURSlqvyhy7XVOX7Uv7P47lsrMRW9JkV8W4?=
 =?us-ascii?Q?gz0sl6R1mzvy5NgUvRriKZYQCXn8HLXPJPaI/rm/ZH/1bcU0cLiknR6fbFaI?=
 =?us-ascii?Q?umhWnWcVK2wP1KPZCbm29tJf0Qq7T/t01gNdHapm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: unominda.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB1239.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7f5095-91b5-428f-e0d8-08dd7e4a4bc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2025 07:26:11.9934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 17bf7467-a77b-4bf2-8e51-a857cb18f125
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0fU76QVcO8sTGRXUQqNCan37aYNFsl98BxPoui/8ntZ5dlqOiVU26p4Kp2WlmnI4JewRxPynTFKYtHEftGBE9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZP287MB0559
Received-SPF: pass client-ip=40.107.51.128;
 envelope-from=kchaudhari@unominda.com;
 helo=PNZPR01CU001.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Khagesh Chaudhari/CREAT/E&T/PUNE <kchaudhari@unominda.com>
From:  Khagesh Chaudhari/CREAT/E&T/PUNE via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PShtIKpm95wh

Classification: Public

Hello Team,
Please let me know the process for  creating Emulator for our custom ARM Co=
rtex M series controller board. Configuration required  to  emulate the our=
 customized board.

Regards
Khagesh
________________________________

Disclaimer:
The information contained in this e-mail and any attachment(s) to this mess=
age are intended for the exclusive use of the addressee(s) and may contain =
proprietary, confidential or privileged information of UNO MINDA Group. If =
you are not the intended recipient, you are notified that any review, use, =
any form of reproduction, dissemination, printing, copying, disclosure, mod=
ification, distribution and/or publication of this e-mail message, contents=
 or its attachment(s) is strictly prohibited and may be unlawful. If you re=
ceived this in error, please contact to the sender and delete the material =
from your device(s). Although this e-mail and any attachments are believed =
to be free of any virus or other defect that may affect any computer system=
 into which it is received and opened, it is the responsibility of the reci=
pient to ensure that it is virus free. UNO MINDA is not liable for any loss=
 or damage arising in any way due to use of this e-mail or its attachments.

________________________________
