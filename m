Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3154624ejb;
        Mon, 5 Jun 2023 18:07:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5U23N+JbM+gGK8ZmoeeEiMD0kYBhCxizEugCVHB0oQCEd3magdsVVU4OCX1VtZP+xkNrdz
X-Received: by 2002:ad4:5cef:0:b0:626:272b:28e9 with SMTP id iv15-20020ad45cef000000b00626272b28e9mr688342qvb.24.1686013645550;
        Mon, 05 Jun 2023 18:07:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1686013645; cv=pass;
        d=google.com; s=arc-20160816;
        b=Y8t4csCYu6qzmlWIabXFTuHjPUM1d/ZemhHn6R7Vht0eL0ft5eCl4ckAhQSCDXzU8F
         Eu2/MdL784qlI6rtSGBInffPwY9KmOgdLZP45jzFQRrvbm0vrOfTDiXbW0Giy2ASKBhB
         HX7qZ0K2q7HF6mjMxnu0kqZe7yn0EStFDILhqDo6dopL0S2puyP6acn+JEV2CG4j80vy
         Q1sxIHS2VmpMEanY1HicAVSZTtmImr9CDHuvsqluLsspVnPbBkroJnOsDRokHbUn4iGw
         cYbBqvK6bbIValPbeairHMGC1AG7bFZLFGymQfUYITMoqkXIHQ5QTWuORePyqA3AFhxH
         vfqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:msip_labels
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=02bPDPWisRt47nI7gN84MjHZ3hilxX0wHz9Ze3xqJeU=;
        b=vX1IOp6E7kqmI80YIB3chI1aSV3NJxJug3en4zSqW8SpoUVbIFBa/H0LAb/nKhtCLU
         AqyiJaspVmX77imcCRkxYgqpqvMQfkpI4lHEdwtKMHdhMpw309WFOq3RT3dSD0oVz72E
         uzawXgGRO/2i8GbNC5UswAa+t5QyhXf3UhzRu3fbEQ5edpcWu7okvQJzfN/E6fsfkdpZ
         ry0DqcCXGtI/hHU+4IEGM3rChVX/56Dkme5XAX1Sw/gfZpXLSQFdgp7YojBco31ZcUXA
         u6Br2SB1peQODNQrlWOHgSBQlDTGwDf0GhmnhoXt+YpAD6mmFTU9oYphd7MuEu9Z3M/Z
         fE4A==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kpit.com header.s=selector1 header.b=nFz78vUV;
       arc=pass (i=1 spf=pass spfdomain=kpit.com dkim=pass dkdomain=kpit.com dmarc=pass fromdomain=kpit.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=kpit.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gs14-20020a056214226e00b005f16be313f0si5493413qvb.311.2023.06.05.18.07.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jun 2023 18:07:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kpit.com header.s=selector1 header.b=nFz78vUV;
       arc=pass (i=1 spf=pass spfdomain=kpit.com dkim=pass dkdomain=kpit.com dmarc=pass fromdomain=kpit.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=kpit.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6LAF-0004SB-77; Mon, 05 Jun 2023 21:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ahmed.Elsaka@kpit.com>)
 id 1q6HqE-000796-BV; Mon, 05 Jun 2023 17:34:18 -0400
Received: from mail-bmxind01on2062c.outbound.protection.outlook.com
 ([2a01:111:f403:7011::62c]
 helo=IND01-BMX-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ahmed.Elsaka@kpit.com>)
 id 1q6HqC-0006EI-7q; Mon, 05 Jun 2023 17:34:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZiLpW3DSrfNe2E6OGG9akq3jZRBIjPTGiiHFY/MIkw2XBusAQawzu/pMMhpMdQK057wl3do9O8FtfL1YUv5N68dMDPIx82SpPVK+PrWj2wwFnTPaMKg7+BdWdB/BPLS2QP4eAdOZW8f45H3nj7ZC2j5RWxgBoiTC5So1K8U2VrvIluSrJUjLmbwk/M9lxnuGiCfLWi4Evf5bLAAzrBFzS/ozD/lSH2Q+vnufSmSpcCi5PEMsqBKjWiVk5Ld0UUpOror4QwngvlEoheCmXkst87Q10DweQDB0rYi7wR95BA9G6+2K10+XIzExvS3yxCeIMAHgCUQGlPtZnoCpNdPz5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02bPDPWisRt47nI7gN84MjHZ3hilxX0wHz9Ze3xqJeU=;
 b=bzf9xZyFEboASinR8rX1p8sh0cvjgJdi/lv+noXABvH9jEL5u85W1/O/+aEnCrAFQD9RXCaI+aCfMLiXrAnejxdgCliBHOisOC1nNNcdxYl1XEKbaywK6BNOXd1Pill3vncolhH9OYd1oHDGPGszl4oFlrZt+/zwItsXmg1cdjd1emyK/KTBdZipaK31MxcFCKcXswoRmI4IXiSdxYEW/RMWh8ECC0BF+SB0Sj9dhBadW27ZF63LD5CjG335wHKfSG1xl9VKGwF3eqZpLGAxT6Os5dEFpDijYSsgCNiMbxXRfXQ3HxQyX8GVZvxIUlbCNK8a67dHCBne1i6NuJn14Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02bPDPWisRt47nI7gN84MjHZ3hilxX0wHz9Ze3xqJeU=;
 b=nFz78vUViVedLojoyTSJP0Dtwh5hR4B+JxB3ja/XpNe0ICOASN3NbLFE4blbL04Sgx/uqloswjWMX6G0yXe0n+3wtGYpw+TgL19tzCcNu30COtLPTNOjTmXbIUPVEkeA1l9czJI44qrcSTadvBGLMXb+wezlNh8ud9L0s5M8v/g=
Received: from MAZPR01MB6577.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:72::10)
 by PN3PR01MB5659.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:7b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 5 Jun
 2023 21:34:00 +0000
Received: from MAZPR01MB6577.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d7ef:41e7:6dde:8812]) by MAZPR01MB6577.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d7ef:41e7:6dde:8812%4]) with mapi id 15.20.6455.027; Mon, 5 Jun 2023
 21:33:59 +0000
From: Ahmed Elsaka <Ahmed.Elsaka@kpit.com>
To: "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>
Subject: Need help getting QEMU to run QNX ifs.bin for Raspberry Pi on QMEU
Thread-Topic: Need help getting QEMU to run QNX ifs.bin for Raspberry Pi on
 QMEU
Thread-Index: AQHZl/ViMvTx4adxeku17vUZCdI0Qw==
Date: Mon, 5 Jun 2023 21:33:59 +0000
Message-ID: <MAZPR01MB65775A1B6CFC1C1BD52A86BDE94DA@MAZPR01MB6577.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAZPR01MB6577:EE_|PN3PR01MB5659:EE_
x-ms-office365-filtering-correlation-id: 49da4fe3-3e77-4383-71bc-08db660c92f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /TSb5pTzuEOQbSBPXqIPWfKMxxj+HXoWyqTkYgbbCscADITqTuVoe4wszO5ZVo7tgUUtqAlaBAeWSyTINnIE5PF6U+JbEKoFDth+VQEL9lS9Lo34t0tjdwfiYiwhtHjXYvIXRDc7eShqzQvGEu1r3uFDc9at1+2ksTaAc0cbN2uJORmSKaLlJOWx91ImVpMk++Bt7LEb8LKf+7b8OsDc6f0eiig1ptJO0Zpa0RZdE+D0jIkalXJj+LcHZwcMkUDjMKbzcb3SuGDKGuGuC2OjYirCxCsiO6VTE6Gr0GgDmC+4zrKZL1w21O2F0s52UUYv4Nz6YGgkh9XwRjYpVVmmZljXPGclzjJ7C7AROQ53urZ1XHP4qEfIpiBX5RjPs7z0uQvVqTgkMxGYi6jPy6X+5DVuWKe3s6R5+Lk1QNlEjIJ1mQPYx6R9LLq/wA1DIdWQx/A+8LVOuUoR2NmM69P4xGhVkrF+Td5QSQqYv6msXWPgYxz9q2YWHuEas6hHbeVi8xERt+jbO7E5Wn1Hr+TnTpGfqB0Jv1nsdB7NZ9cFa38RIVLSQf35UORd5sNoXISLWtQd2zUF0eZsBkTg9V+JaS729fX5vvZ4tLx9UydKJ6nERFCFK35MYAODPrHLTzpstJg9eBLXKO82iNtYpH5S+Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MAZPR01MB6577.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(451199021)(19627405001)(7696005)(478600001)(110136005)(83380400001)(66574015)(86362001)(33656002)(6506007)(9686003)(2906002)(71200400001)(186003)(26005)(55016003)(38070700005)(38100700002)(122000001)(76116006)(66556008)(66476007)(316002)(66446008)(66946007)(91956017)(5660300002)(64756008)(52536014)(450100002)(8936002)(41300700001)(8676002)(15519875007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?qCDFCwaopKE8TAFUBg0K0a09lz7L/nZYL8d/sO/K0gwC0dRLIESni0r1Jr?=
 =?iso-8859-1?Q?GJVmaATofj9Zo2F/n78f3sW8j/VJMyhhrZqrs5RBBxUPAZIiGuFZuDgfHj?=
 =?iso-8859-1?Q?cBjjmmie+bjzikw1tB8a6/oxzBxcobOBhvJRrtFlenC0Y0gbEXW1h0Uo8f?=
 =?iso-8859-1?Q?ABs2GkE637qxMsp8Brwo4l690UICDgi2MnoU0fEkQ/hyUxei0L/SQ2M9G/?=
 =?iso-8859-1?Q?kQLQN5l4HpFH0qIY1chMPVVDBY25Jj4ZFHT8O9REZAFl5c3gLY/ubhw1Zp?=
 =?iso-8859-1?Q?xqk/CFYUTevTNfbcrhBJAjJsI+yVrK8xoF/2pscYFQNvfgalbMOIngIhk3?=
 =?iso-8859-1?Q?WsvB2HGbqoBuAvqAiPElepcDlwPGvymlivLWJbJHQqOF6iC5z2UU2ljUD3?=
 =?iso-8859-1?Q?1Le+fbT3ytsuJ5Qekw7ihdowFXx5eUm1mgPRIyg7ihfR32O1yxRLCDZqWH?=
 =?iso-8859-1?Q?8BBEyMnKko7weURp4kjLUDzWPwoT16l1b8YRmaHPRv1TsftV0k4ITUvEzR?=
 =?iso-8859-1?Q?4hYYAXgsvGHMsrbF5zW9OrK5xZ3OJts1sv4/N+HgSen3hafE6jojYKKaEZ?=
 =?iso-8859-1?Q?hj/R54jtOo9H9citb8nSAZgWjF132AXunl5f9MGZbk4PW9rc8vRRBu0V93?=
 =?iso-8859-1?Q?3jLxXE77Nw5NSxlppPkhkkaHTDU2Jq5ocGIg3o69yDA1aJuY0qg10l2cK1?=
 =?iso-8859-1?Q?TbW8tpCw+R3rF2z07iSQvyGuWSJlx/5rwgr8ZwCRL3tNMNte7Xbd60dRLP?=
 =?iso-8859-1?Q?JeuBHQoYkVcliKoiA50qjZh2GTkYLJDyej6y2P/519umc1VIqw1r0NWSqz?=
 =?iso-8859-1?Q?K+YfzDPpDNmaT9K/B+f8nQ8xAwDAZIDsFEYy4ZUEnmcGUKvk3s2h+PWEf5?=
 =?iso-8859-1?Q?CEBN6ypyvqH+yyPA1EB7NMdfDTjbJgbmtr/GFexQIJCfKRZf6Qj06xlHuP?=
 =?iso-8859-1?Q?Sd3JCJM1PsrsX8vTIbpUBpREQkuMYhqtEGA7mR4gAS6yPi0B7W5uTMdeNa?=
 =?iso-8859-1?Q?0U6BORWG6ZCTm4f1NDvYIW86Qymud/W1xByXs9TTFr7ckTAJsIuB7+1mww?=
 =?iso-8859-1?Q?DLUEgEMPg4Ct0f048irT5stzjofFH6DFPh6KM6FsiOP90fXm+R7yim0LJx?=
 =?iso-8859-1?Q?WJ50NsRysfuY03r/yvubZZfP6liYmp1OO4byrG/Z3WVLbm+JmXR1butGO0?=
 =?iso-8859-1?Q?CyE6BfCPJc++BhGs/zlKu+1fjBD5D8B47IZH4SX0SDDPN7+0FqwvfqZZti?=
 =?iso-8859-1?Q?Jv3cBrGwTuKPBAJkSQYMfjSJk6XP403NhXpqjqr6+Bnwl9nX0Z5mzQnrjJ?=
 =?iso-8859-1?Q?8EdMCFGdu2qmnZ71AGG3FbStm+zqYVwha/Poc7D6USmTHuHKkdMKFGiniy?=
 =?iso-8859-1?Q?xHHseGjxMQhuEvygWS07QqR584EdShYBrLHwucocsyiGgVal8mKVPpwus7?=
 =?iso-8859-1?Q?X7A0Z1GKGYrAfvgTg/9DgQOloHLUOTm2JSuH8euNae4d6QLTg6CNbgn007?=
 =?iso-8859-1?Q?TcSF4X4sNYZuv3e8vHkd/EksAGLCFGX9NVup4phfITaJk/ZsG8QKR2+0ZL?=
 =?iso-8859-1?Q?m2ym1VCDXMN4ULEcG7oxCqU5SU3YPAkVYEvCPXR6nuct4nbAkbpfv/gTbc?=
 =?iso-8859-1?Q?PRsWij21sA5Es=3D?=
Content-Type: multipart/alternative;
 boundary="_000_MAZPR01MB65775A1B6CFC1C1BD52A86BDE94DAMAZPR01MB6577INDP_"
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAZPR01MB6577.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 49da4fe3-3e77-4383-71bc-08db660c92f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2023 21:33:59.4129 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JFxa9PH9xjdNvjM/ICWyDLfaRPBLiS6D4XYc0JSiYgDtSl8/7dsT8BvZxIk2t/QQiyinJHcDY4hhgL0zkiCqeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB5659
Received-SPF: pass client-ip=2a01:111:f403:7011::62c;
 envelope-from=Ahmed.Elsaka@kpit.com;
 helo=IND01-BMX-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 05 Jun 2023 21:07:10 -0400
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
X-TUID: VEamuZ9njrxZ

--_000_MAZPR01MB65775A1B6CFC1C1BD52A86BDE94DAMAZPR01MB6577INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

i am trying to run QNX ifs.bin for raspberry pi on qmeu but it is not worki=
ng :

what i actually did :

  1.  installed qemu-system-aarch64
  2.  downloaded ifs-rpi4.bin file from qnx sw center 3- using the follwoin=
g command to run this "ifs-rpi4.bin" (image file system on qemu) using the =
following command :

qemu-system-aarch64 -M virt -m 2048 -smp 4 -cpu cortex-a72 -kernel ifs-rpi4=
.bin -nographic


[output]


i feel there are something missed , and i did a lot of search but till now =
not able to find what is missing .

Thanks for help in advance .

i was expecting kernel will run with normal debug messages


I also tried to use board which is supported by qemu like "mcimx6ul-evk Fre=
escale i.MX6UL Evaluation Kit (Cortex-A7)" but i still facing the same issu=
e.

Thanks in advance.

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_MAZPR01MB65775A1B6CFC1C1BD52A86BDE94DAMAZPR01MB6577INDP_
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
<div class=3D"x_elementToProof" style=3D"font-size: 12pt; font-family: Cali=
bri, Arial, Helvetica, sans-serif; margin: 0px; color: rgb(0, 0, 0); backgr=
ound-color: rgb(255, 255, 255);">
<p class=3D"x_ContentPasted0" style=3D"margin: 0px 0px 1.1em; font-size: 15=
px; clear: both; text-align: left; color: rgb(35, 38, 41); background-color=
: rgb(255, 255, 255);">
i am trying to run QNX ifs.bin for raspberry pi on qmeu but it is not worki=
ng :</p>
<p class=3D"x_ContentPasted0" style=3D"margin: 0px 0px 1.1em; font-size: 15=
px; clear: both; text-align: left; color: rgb(35, 38, 41); background-color=
: rgb(255, 255, 255);">
what i actually did :</p>
<ol data-listchain=3D"__List_Chain_53" style=3D"margin: 0px 0px 1.1em 30px;=
 font-size: 15px; list-style: decimal; text-align: left; color: rgb(35, 38,=
 41); background-color: rgb(255, 255, 255);">
<li class=3D"x_ContentPasted0">installed qemu-system-aarch64</li><li class=
=3D"x_ContentPasted0" style=3D"margin:0px">downloaded ifs-rpi4.bin file fro=
m qnx sw center 3- using the follwoing command to run this &quot;ifs-rpi4.b=
in&quot; (image file system on qemu) using the following command :</li></ol=
>
<pre style=3D"width:auto;max-height:600px;overflow:auto;text-align:left"><c=
ode class=3D"x_ContentPasted1" style=3D"margin:0px;border-radius:0px">qemu-=
system-aarch64 -M virt -m 2048 -smp 4 -cpu cortex-a72 -kernel ifs-rpi4.bin =
-nographic=0A=
</code></pre>
<img alt=3D"output" class=3D"x_ContentPasted2" style=3D"margin:0px" src=3D"=
https://i.stack.imgur.com/7Coh3.png"></div>
<div class=3D"x_elementToProof" style=3D"font-size: 12pt; font-family: Cali=
bri, Arial, Helvetica, sans-serif; margin: 0px; color: rgb(0, 0, 0); backgr=
ound-color: rgb(255, 255, 255);">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-size: 12pt; font-family: Cali=
bri, Arial, Helvetica, sans-serif; margin: 0px; color: rgb(0, 0, 0); backgr=
ound-color: rgb(255, 255, 255);">
<p class=3D"x_ContentPasted3" style=3D"margin: 0px 0px 1.1em; font-size: 15=
px; clear: both; text-align: left; color: rgb(35, 38, 41); background-color=
: rgb(255, 255, 255);">
i feel there are something missed , and i did a lot of search but till now =
not able to find what is missing .</p>
<p class=3D"x_ContentPasted3" style=3D"margin: 0px 0px 1.1em; font-size: 15=
px; clear: both; text-align: left; color: rgb(35, 38, 41); background-color=
: rgb(255, 255, 255);">
Thanks for help in advance .</p>
<p class=3D"x_ContentPasted3" style=3D"margin: 0px; font-size: 15px; clear:=
 both; text-align: left; color: rgb(35, 38, 41); background-color: rgb(255,=
 255, 255);">
i was expecting kernel will run with normal debug messages</p>
<div class=3D"x_elementToProof" style=3D"margin:0px"><br>
</div>
<div class=3D"x_elementToProof" style=3D"margin:0px"><br>
</div>
<div class=3D"x_elementToProof" style=3D"margin:0px"><span style=3D"margin:=
 0px; color: rgb(23, 78, 134);">I also tried to use board which is supporte=
d by qemu like &quot;</span><span class=3D"x_ContentPasted4" style=3D"font-=
size: 13px; margin: 0px; text-align: left; display: inline !important; colo=
r: rgb(23, 78, 134); background-color: rgb(255, 255, 255);">mcimx6ul-evk
 Freescale i.MX6UL Evaluation Kit (Cortex-A7)&quot; but i still facing the =
same issue.&nbsp;</span></div>
<div class=3D"x_elementToProof" style=3D"margin:0px"><span class=3D"x_Conte=
ntPasted4" style=3D"font-size: 13px; margin: 0px; text-align: left; display=
: inline !important; color: rgb(35, 38, 41); background-color: rgb(255, 255=
, 255);"><br>
</span></div>
Thanks in advance.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
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

--_000_MAZPR01MB65775A1B6CFC1C1BD52A86BDE94DAMAZPR01MB6577INDP_--
