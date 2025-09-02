Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF16CA0FFE
	for <qemu-arm@archiver.kernel.org>; Tue,  2 Sep 2025 13:05:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utQhU-0003uG-O6; Tue, 02 Sep 2025 09:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Adarsh.Mishra@kpit.com>)
 id 1utN2K-0006vS-K5
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 05:10:44 -0400
Received: from mail-southindiaazon11011071.outbound.protection.outlook.com
 ([40.107.57.71] helo=MA0PR01CU012.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Adarsh.Mishra@kpit.com>)
 id 1utN2H-0004ie-V8
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 05:10:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AIZMq8X91rVneMFJAwlYY5yICRGU1cr3573UiPuQtUulBxBvgWJqN7Y7P0bebzI/gyiA+KDp8LXETEkokCJx47+W12FBWxOBNBN2zBusXvYhEzu+vjzWs6X1mB+i4ILISuaICRYY7+Se3ZwD6vuESKSzSd8nc+kpLL6XfA4A9BKpvdI3pGyEqvEImCa141x7c9rTdjpoMHfFaoH8IFQFgvx+GeJSBeyfDwuwl3Or37YrKRmKVzYZmM8p6tB2SLh0M1iDm6L4jDXvJiUIGmQFQVXZf9n4Yn0oUv/DXtrY09xbOZStQmayV7UvmCpaz756Xuk7EryCCZFrl3FnNssQPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FMthflfoN1L07RHLXiI0FuxC3Jg+9pDogmiRBYzvhk=;
 b=LD+g89DL/CHSMRcbHXdR0PH1ZdASeBc7h4v3hspeSfiaAF8p6cvVTAPPLG2c/iYgt8Dg3YXLWaZoklqA3KyZahVyx0peNNYmi6v3IeRt9ILwMrg98oCDEwXRRhld5KRF+jIqVHiR/ESArEHWLkEAvCv+jyW+j86BBdFY94GmWM4HJgyJ6OvoU9qbmNljcAGXXrDbY+rLc7wwrak1FthFw7f3WwLI1uXqi7rYRoPBu3tcE+JaA8NnE8mD7XVFp12ZhyCW50dxoDSC4aXcpPUXVPJttB5vlVFJ98fjgvhLlSFjhOJwAG/iqNhJQGBFxSohp5vxRX4Y1YpytJj0w0MFfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FMthflfoN1L07RHLXiI0FuxC3Jg+9pDogmiRBYzvhk=;
 b=luFp2WtsIACSEKlObLp522ujw5RRc0lUpf3VyZ1qGudXwXMKRkcMCmW4lc7bN1fHIMcnu1C9X5IDrrPq4cwDWeLBplhJwnUsROSrTFvza9a4zdwATls2nQ+0i++iQYLWZMKEsSTGprsBYx97lMvGcQeliDv6nI5sQNDHzZLUy6Q=
Received: from PN2PR01MB9277.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:117::8)
 by MAZPR01MB9050.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:111::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Tue, 2 Sep
 2025 09:05:30 +0000
Received: from PN2PR01MB9277.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::1847:e813:6502:fb32]) by PN2PR01MB9277.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::1847:e813:6502:fb32%3]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 09:05:30 +0000
From: Adarsh Mishra <Adarsh.Mishra@kpit.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: Tech support request : Adding Additional Network Interfaces in QNX VM
 on QEMU
Thread-Topic: Tech support request : Adding Additional Network Interfaces in
 QNX VM on QEMU
Thread-Index: AQHcG+f3U60i2aAQt0a85l2Vs8s3aA==
Date: Tue, 2 Sep 2025 09:05:30 +0000
Message-ID: <PN2PR01MB92773B4CD541D6B9868369C69C06A@PN2PR01MB9277.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN2PR01MB9277:EE_|MAZPR01MB9050:EE_
x-ms-office365-filtering-correlation-id: dc371449-e9f5-4a9c-8d36-08dde9ffde06
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|39142699007|1800799024|31052699007|376014|38070700018|8096899003;
x-microsoft-antispam-message-info: =?Windows-1252?Q?NhaQ4lvpD4kzY1uqJlt3UPnDRalBscM0H+jvh9lsV3a/ayAuNeeuUZXM?=
 =?Windows-1252?Q?S74TarmQ5IoX15DzgJWT6lhROLh4gBrOPd/8LUKgNq4DIaglzeiFn0KU?=
 =?Windows-1252?Q?SbFb/HfdKPD/XFXuiyrM1GldHA80pSaXLKqHsKG1aLKamBGHofA+VQAp?=
 =?Windows-1252?Q?2KFk7EUmbJiuwMx/HUo4NVQ1bwihq+JIjotqmKbNuTSwMl+J7cZkrPh7?=
 =?Windows-1252?Q?X5x7YoDGCNQ8/8yn6XmY6rneuW4IYYVMgLCjQ+bQ1w/ddNj9VCXkGdrr?=
 =?Windows-1252?Q?o7UG/yM+nBJfUyzIcLfgLdM1I+SOvKfoLV2mbN7BgGx+hqSLl3jIODA9?=
 =?Windows-1252?Q?Y5eMwD2bkamGl4BnshWFc/x8kgPf0zEMWDFiuHibhEc5+Vh9QawupYyL?=
 =?Windows-1252?Q?4BZMjWoBDIO4fFFl25gS1Fb6VlA9haFihAhkmL3V4kvGtbAsOz2+MB4I?=
 =?Windows-1252?Q?jsDlU21QRBWV6FcBg7RfNEXFbRgxgWxzvzmRE1rIcS/BalWuqE8Mh5yv?=
 =?Windows-1252?Q?RD7W9r5SWCrY7sPuI0BbmJppKDcrH9R89HQzyrfjPXIfTNl51FOOtaFJ?=
 =?Windows-1252?Q?7V0tQliifFdiuwiKrZ6gYhJXjCEIgnH4HgiwHwxJ4FAnOppqCpEOFGm8?=
 =?Windows-1252?Q?yCoVClJpWRaP7swAywpAN3t2tHh4pXiWIRjmjDIGzCeSBVCokEgafpqp?=
 =?Windows-1252?Q?YZga4wwFq/T5p4ed4b1TtRBb75N71kEUIiJL+n5M82p29mayfEhgnTWE?=
 =?Windows-1252?Q?Uh8bocO/ty3a40sOlKalp/V6TuUsvqAUIqHuKrhFpkH+2clfEMckritt?=
 =?Windows-1252?Q?vXiVYsTxJPAotuJALaRcdOCKNnTnZYC08zNXYtTTsCxJHHAoda3GrGnK?=
 =?Windows-1252?Q?nZnfBszHOeSn2hvXduE6WpriTZ1Ou1gGdGZZ3StmSX7yIr7nt9Sx/7tj?=
 =?Windows-1252?Q?VxWwKdKbgdLk7+foarCPqc7E8G+z3NN3p0xKFMCMAroifqb4Sr98GEmo?=
 =?Windows-1252?Q?p+q47EDOENtsxXW0hKOqOak8pMAkUW5KGJxBLHmcCO+xO+ur7CUvpcQ9?=
 =?Windows-1252?Q?P30Bvj6ohR7R5pr78AW8NYptKUjAMCMnQVkehohe6mhlCrl7vqXr3nYy?=
 =?Windows-1252?Q?VF+OXqtPnT54WlrWrxlABRjDBd90rFJG0+xf51NXYKp+Ona+0SPVnOFc?=
 =?Windows-1252?Q?VCjd2Rbn/ryZgx0bEOJWHqVFhFbuJa5nJ9owKYrXLdjegVdWfNGrYCWb?=
 =?Windows-1252?Q?VuJc0Sw/bcfdJHsjJ3qRVHWHNBbyZapa9SqZMzwCpTI1yeQtmBeBS/TR?=
 =?Windows-1252?Q?DAx7ERUlTIHTh8TMC7z/6fy7yYVU5b+Jauv1QGWdDpUsUwM0Fl9aAq0W?=
 =?Windows-1252?Q?Cjg/4a+pjXe7qmkv+hTAYhvdRsZbplmSfqW1Cun5QNjtSZqN9jPrDwQQ?=
 =?Windows-1252?Q?wBREJGmsfhiBZPWcVgR6pbqwMF8eRQ/KIlnVlSN6bIMtDI5ONnR3Za1n?=
 =?Windows-1252?Q?kdO7o1vGtLSl30lHhn4WqbzlBdyFF3LUiuMTENyNo93rIdtGwiQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PN2PR01MB9277.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(39142699007)(1800799024)(31052699007)(376014)(38070700018)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?MAUQBEGIKgAkF4q3rx6Epp9oLblGunU7xaDuwSnzhPbxHk7SihzFTvB3?=
 =?Windows-1252?Q?RluEvS7GloqDeM1fQ+SYP8h5/LRGXgHIyP3TeH4eWtZf8a8tqexzdTko?=
 =?Windows-1252?Q?/sMwU9LMA/8VqNbStujWZdeuZxyLuDV+H6r9QWXrKhn+mNB/VsPIybeP?=
 =?Windows-1252?Q?LPHn7gAsMutMf2wzlc2VLmigUxK5jULbSwN+/kGqOIrLYjRAfU464VPY?=
 =?Windows-1252?Q?WmK162v2iUxRRjT+DTaV7YPv58xbrmupBLiKORZzNZnwplySGnw+zcOI?=
 =?Windows-1252?Q?avzRyCQ9Tc7n98E5+cNWkDlQwkPUGBP2NiTRSFRZFl/iyxKBvZFyg29O?=
 =?Windows-1252?Q?TGAGHmWJWx38VWGEgblNlg/CSariJLo/GbYE0eggV8YnpLOSP6Tayyu0?=
 =?Windows-1252?Q?miHTMyscY7UABbGhe8luTMMxdOK+Q5KyhlHWJCRLIFpd5QBGC0SdK62c?=
 =?Windows-1252?Q?IweMCpEsHDeKpWitQnNouqjUTvWcZ0QjJuFKS7KxF3Ib352aCB6nqKWN?=
 =?Windows-1252?Q?L7rTSJ5lfLuIzOSsrRJYveUUW+OfriN4tNU6p9yMkrg1VJA6cLb7hyEw?=
 =?Windows-1252?Q?GUQYTN4q+T3Kyxjg/WDHtawYkdiwGzkEih2qnlANcTDSPMH77cOJdxPy?=
 =?Windows-1252?Q?sDQfS5AK32udcitSqd3BNEtbsV6swWvYPmh0IZBV64+cAybePWXyWD56?=
 =?Windows-1252?Q?qJJdfLbUReQ/83slztTVYcI+3s5dpLGy/cyNa/w6TwLUqBk8kc+dDzNm?=
 =?Windows-1252?Q?F5szKQsi1Gyv+Pc5WgwnsMux7T2csRgbzX9zZNBWhirZzpAePy9+o29i?=
 =?Windows-1252?Q?UnXCF+pij/7dq1gRBiDkN3mtyBLG3deZjrgzLAepbDFYDafNu+rBwmOK?=
 =?Windows-1252?Q?XJO58Ok0Stsm86rpoMFiEZZYqCLaoun0FZkqprwoinD0t8yxYJmSm+Ge?=
 =?Windows-1252?Q?ZDVOumGKU1u8cd/hKU/07Gw5MMyHZRA3U9DsMLvHRUlq5p6L2XxR4Szy?=
 =?Windows-1252?Q?MF5whQY100EppcktGgPbLLHqkJ0BENqXg7ZM+NC5sbaxc0LxK6RwPgOj?=
 =?Windows-1252?Q?TUrj40ac9YTG+np6FiGxUaIMOcPyuA60MAlfymtfxWdPw5dTUSMvc8eq?=
 =?Windows-1252?Q?11M6La7uicpofmSV4iob0lXdY7nvoKnrm/zdxhiCkgPppArWcgRqBaJK?=
 =?Windows-1252?Q?DBP9MSUU+CY0dkp/+MinPyeywb6fQzrtiw+VwrCgZmvD7/sZeP475vlh?=
 =?Windows-1252?Q?LHXPTtR5331Z5BM5Y0w5b/b8rkYRPMzxUt+WVFA8yRP8wAEnig41UmtS?=
 =?Windows-1252?Q?T8dd61vjHBFiub19ili3+ToGcHWPaZzG1hR7T5WBI1HtB/HiTkSqtbZE?=
 =?Windows-1252?Q?JSZy8GvQ/nFlNxNdC6uDZ/Y7znqBD2xdnka/Rkvh8to9x3/v4d5bju4D?=
 =?Windows-1252?Q?ouWBsY3km41vi3bIT2a31UUT13usJ4ycLP/Ocq2lh0hf/vD/Arth8WS8?=
 =?Windows-1252?Q?q7bbYXwiTa9YYNGE/ZbOBpnL9RbCHy8jsMVB6ofOg6MTzx+Lvg9jC6N2?=
 =?Windows-1252?Q?Qwuf7y7laaez8SnZQXaKSY6b1qJAXMVG1CrEWqkkMAHy8FQQCQTu9zhZ?=
 =?Windows-1252?Q?TZWjGMkr9dOQR61W9XfcvblO9yG4ok3imoRTWtIF76xiB5y73gQkS4Vg?=
 =?Windows-1252?Q?vZZt915R5lmUXSAH21Uu7Ic4TmJSDSmDaMNJDMYZTO+M20ZWq/c2gy9T?=
 =?Windows-1252?Q?cW8kqpEtvB3VaXcwjxE=3D?=
Content-Type: multipart/alternative;
 boundary="_000_PN2PR01MB92773B4CD541D6B9868369C69C06APN2PR01MB9277INDP_"
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB9277.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dc371449-e9f5-4a9c-8d36-08dde9ffde06
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 09:05:30.6911 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hics9hWY46Zi9Ut2igy3R15JDfFB8YRqQ5GTxdv7kXtFBb1XJsHR3WSagAWFVgxesk5G3qB9TxPiBbG2yu9mmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB9050
Received-SPF: pass client-ip=40.107.57.71; envelope-from=Adarsh.Mishra@kpit.com;
 helo=MA0PR01CU012.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 02 Sep 2025 09:05:10 -0400
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

--_000_PN2PR01MB92773B4CD541D6B9868369C69C06APN2PR01MB9277INDP_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Dear QEMU Team,
I am currently working on running a QNX 7.1.0 virtual machine using QEMU (q=
emu-system-aarch64, version 6.2.0 - Debian 1:6.2+dfsg-2ubuntu6.26), and I=
=92m facing an issue with adding multiple network interfaces.
Objective:
Enable additional network interfaces (e.g., vt1, vt2) in a QNX virtual mach=
ine. At present, only one interface (vt0) is detected and functional.
Environment Details:

  *   Host Emulator: QEMU (qemu-system-aarch64)
  *   Guest OS: QNX SDP 7.1.0
  *   Image Creation: Using mkqnximg utility to generate the bootable image=
 (ifs.bin and disk image)

QEMU Launch Command:

qemu-system-aarch64 \
    -machine vexpress-a15 -cpu cortex-a57 \
    -m 1G \
    -drive file=3Doutput/disk-qemu.vmdk,if=3Dnone,id=3Ddrv0 \
    -device virtio-blk-device,drive=3Ddrv0 \
    -netdev bridge,br=3Dvirbr0,id=3Dnet0 \
    -device virtio-net-device,netdev=3Dnet0,mac=3D52:54:00:f9:ef:20 \
    -netdev bridge,br=3Dvirbr0,id=3Dnet1 \
    -device virtio-net-device,netdev=3Dnet1,mac=3D52:54:00:4a:0c:74 \
    -object rng-random,filename=3D/dev/urandom,id=3Drng0 \
    -device virtio-rng-device,rng=3Drng0 \
    -pidfile output/qemu.pid \
    -nographic \
    -kernel output/ifs.bin \
    -serial mon:stdio

Issue:
Despite configuring two virtio-net-device entries, only one network interfa=
ce (vt0) is visible inside the QNX VM. Attempts to access vt1 result in the=
 following error:

vt1: No such device or address


We followed the guidance provided in the QNX Knowledge Base article:
https://www.qnx.com/support/knowledgebase.html?id=3D5015Y000001SVvT
However, the issue persists.
Request:
Could you please advise on the correct procedure or configuration required =
to enable and detect multiple network interfaces (e.g., vt1, vt2) in a QNX =
virtual machine running on QEMU?

Please let me know if any additional information or logs you need.
Any insights or suggestions would be greatly appreciated.
Best regards,
Adarsh Mishra


This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_PN2PR01MB92773B4CD541D6B9868369C69C06APN2PR01MB9277INDP_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"text-align: left; text-indent: 0px; margin: 8px 0px 4px; disp=
lay: block; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Ca=
libri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=
=3D"elementToProof">
Dear QEMU Team,</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 8px 0px 4px; disp=
lay: block; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Ca=
libri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=
=3D"elementToProof">
I am currently working on running a QNX 7.1.0 virtual machine using QEMU (<=
code>qemu-system-aarch64</code>, version 6.2.0 - Debian 1:6.2+dfsg-2ubuntu6=
.26), and I=92m facing an issue with adding multiple network interfaces.</d=
iv>
<div style=3D"text-align: left; text-indent: 0px; margin: 8px 0px 4px; disp=
lay: block; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Ca=
libri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=
=3D"elementToProof">
<span style=3D"font-weight: 600;">Objective:</span></div>
<div style=3D"text-align: left; text-indent: 0px; margin: 8px 0px 4px; disp=
lay: block; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Ca=
libri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=
=3D"elementToProof">
Enable additional network interfaces (e.g., <code>vt1</code>, <code>vt2</co=
de>) in a QNX virtual machine. At present, only one interface (<code>vt0</c=
ode>) is detected and functional.</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 8px 0px 4px; disp=
lay: block; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Ca=
libri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=
=3D"elementToProof">
<span style=3D"font-weight: 600;">Environment Details:</span></div>
<ul style=3D"text-align: left; margin: 4px 0px; list-style-type: disc;">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span role=3D"presentation" style=3D"font-weight: 600;">Host Emulator:</spa=
n>&nbsp;QEMU (<code>qemu-system-aarch64</code>)</li><li style=3D"font-famil=
y: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans=
-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span role=3D"presentation" style=3D"font-weight: 600;">Guest OS:</span>&nb=
sp;QNX SDP 7.1.0</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, A=
ptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color:=
 rgb(0, 0, 0);">
<span role=3D"presentation" style=3D"font-weight: 600;">Image Creation:</sp=
an>&nbsp;Using <code>
mkqnximg</code>&nbsp;utility to generate the bootable image (<code>ifs.bin<=
/code>&nbsp;and disk image)</li></ul>
<div style=3D"text-align: left; text-indent: 0px; margin: 8px 0px 4px; disp=
lay: block; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Ca=
libri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=
=3D"elementToProof">
<span style=3D"font-weight: 600;">QEMU Launch Command:</span></div>
<div style=3D"text-align: left; text-indent: 0px; margin: 8px 0px 4px; disp=
lay: block; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Ca=
libri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=
=3D"elementToProof">
<span style=3D"font-weight: 600;"><br>
</span></div>
<div style=3D"text-align: left; text-indent: 0px; margin: 1em 0px; display:=
 block; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibr=
i, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=3D"e=
lementToProof">
<span style=3D"font-weight: 600;">qemu-system-aarch64&nbsp;\</span></div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-weight: 600;">&nbsp;&nbsp;&nbsp;&nbsp;-machine&nbsp;vex=
press-a15&nbsp;-cpu&nbsp;cortex-a57&nbsp;\</span></div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-weight: 600;">&nbsp;&nbsp;&nbsp;&nbsp;-m&nbsp;1G&nbsp;\=
</span></div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-weight: 600;">&nbsp;&nbsp;&nbsp;&nbsp;-drive&nbsp;file=
=3Doutput/disk-qemu.vmdk,if=3Dnone,id=3Ddrv0&nbsp;\</span></div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-weight: 600;">&nbsp;&nbsp;&nbsp;&nbsp;-device&nbsp;virt=
io-blk-device,drive=3Ddrv0&nbsp;\</span></div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-weight: 600;">&nbsp;&nbsp;&nbsp;&nbsp;-netdev&nbsp;brid=
ge,br=3Dvirbr0,id=3Dnet0&nbsp;\</span></div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-weight: 600;">&nbsp;&nbsp;&nbsp;&nbsp;-device&nbsp;virt=
io-net-device,netdev=3Dnet0,mac=3D52:54:00:f9:ef:20&nbsp;\</span></div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-weight: 600;">&nbsp;&nbsp;&nbsp;&nbsp;-netdev&nbsp;brid=
ge,br=3Dvirbr0,id=3Dnet1&nbsp;\</span></div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-weight: 600;">&nbsp;&nbsp;&nbsp;&nbsp;-device&nbsp;virt=
io-net-device,netdev=3Dnet1,mac=3D52:54:00:4a:0c:74&nbsp;\</span></div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-weight: 600;">&nbsp;&nbsp;&nbsp;&nbsp;-object&nbsp;rng-=
random,filename=3D/dev/urandom,id=3Drng0&nbsp;\</span></div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-weight: 600;">&nbsp;&nbsp;&nbsp;&nbsp;-device&nbsp;virt=
io-rng-device,rng=3Drng0&nbsp;\</span></div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-weight: 600;">&nbsp;&nbsp;&nbsp;&nbsp;-pidfile&nbsp;out=
put/qemu.pid&nbsp;\</span></div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-weight: 600;">&nbsp;&nbsp;&nbsp;&nbsp;-nographic&nbsp;\=
</span></div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-weight: 600;">&nbsp;&nbsp;&nbsp;&nbsp;-kernel&nbsp;outp=
ut/ifs.bin&nbsp;\</span></div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-weight: 600;">&nbsp;&nbsp;&nbsp;&nbsp;-serial&nbsp;mon:=
stdio</span></div>
<div style=3D"text-align: left; text-indent: 0px; margin: 8px 0px 4px; disp=
lay: block; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Ca=
libri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=
=3D"elementToProof">
<span style=3D"font-weight: 600;"><br>
</span></div>
<div style=3D"text-align: left; text-indent: 0px; margin: 8px 0px 4px; disp=
lay: block; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Ca=
libri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=
=3D"elementToProof">
<span style=3D"font-weight: 600;">Issue:</span></div>
<div style=3D"text-align: left; text-indent: 0px; margin: 8px 0px 4px; disp=
lay: block; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Ca=
libri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=
=3D"elementToProof">
Despite configuring two <code>virtio-net-device</code>&nbsp;entries, only o=
ne network interface (<code>vt0</code>) is visible inside the QNX VM. Attem=
pts to access
<code>vt1</code>&nbsp;result in the following error:</div>
<pre style=3D"margin: 17px 0px 23px; padding: 23px 24px; border-width: 1px;=
 border-style: solid; border-color: rgb(102, 102, 102); border-radius: 4px;=
" class=3D"elementToProof"><div style=3D"text-align: left; text-indent: 0px=
; white-space: pre-wrap; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFo=
ntService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0=
, 0);" class=3D"elementToProof"><code>vt1: No such device or address=0A=
</code></div></pre>
<div style=3D"text-align: left; text-indent: 0px; margin: 8px 0px 4px; disp=
lay: block; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Ca=
libri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=
=3D"elementToProof">
We followed the guidance provided in the QNX Knowledge Base article:<br>
https://www.qnx.com/support/knowledgebase.html?id=3D5015Y000001SVvT<br>
However, the issue persists.</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 8px 0px 4px; disp=
lay: block; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Ca=
libri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=
=3D"elementToProof">
<span style=3D"font-weight: 600;">Request:</span></div>
<div style=3D"text-align: left; text-indent: 0px; margin: 8px 0px 4px; disp=
lay: block; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Ca=
libri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=
=3D"elementToProof">
Could you please advise on the correct procedure or configuration required =
to enable and detect multiple network interfaces (e.g.,
<code>vt1</code>, <code>vt2</code>) in a QNX virtual machine running on QEM=
U?</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 8px 0px 4px; disp=
lay: block; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Ca=
libri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 8px 0px 4px; disp=
lay: block; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Ca=
libri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=
=3D"elementToProof">
Please let me know if any additional information or logs you need.</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 8px 0px 4px; disp=
lay: block; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Ca=
libri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=
=3D"elementToProof">
Any insights or suggestions would be greatly appreciated.</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 8px 0px 4px; disp=
lay: block; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Ca=
libri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=
=3D"elementToProof">
Best regards,<br>
<span style=3D"font-weight: 600;">Adarsh Mishra</span><br>
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_PN2PR01MB92773B4CD541D6B9868369C69C06APN2PR01MB9277INDP_--

