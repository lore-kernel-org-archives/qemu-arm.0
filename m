Received: by 10.25.44.15 with SMTP id s15csp1773193lfs;
        Wed, 12 Jul 2017 23:41:58 -0700 (PDT)
X-Received: by 10.237.62.132 with SMTP id n4mr2944339qtf.0.1499928118155;
        Wed, 12 Jul 2017 23:41:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499928118; cv=none;
        d=google.com; s=arc-20160816;
        b=VJNUtEFvZsgxdp2R9L92GSTrIOz/BO8mB6IawtHRnMTmce0F20DN1AyIkZpXyxsowf
         Evr7oPWZV0CS9EIzlxcKt0u+hF6It2Abkfuez+Exhhe3EubRYh287dsTxRTRa12EVeVC
         pRUpE5wPHTLmxfmfGXnxTUQSR2QndLQFsBeG2VURb6YRfOMxkDKfbLglZA2raOWBdcd0
         eOXJhd0wYmctD8qtNDXx7/AVSGgBk3Ddo1FnAc4MhqlvfA170ILrqS8cM+Bk00a1QrCX
         0yLhIT0esKOBw1Gdy6/c8KSW246t3p9EitdUEF1AKzie5PIie1Hznrh/2063sC4M6YtR
         kA7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:arc-authentication-results;
        bh=4B0D5Rr8dAazRd69grOu5KKIDV2VmyijcZW7cOnl3vU=;
        b=tWQB1w6D/Ey+vZAsfR69U9+rlma5Cpxv0PVtqwFuJcUXf+J6IexkDPQLgiBwNIXVba
         dDmEBHbnlME52qFpQQDpDT5Nrm88DK7ZV41gueGS/Lh7/lbxbrZAuWZamSOg0YTACiPt
         OLdbPJiqJxSr4pp+0FGUQnkssgzhEZjieJLTyrFH53t8HHwSnhEDx82CN4SXcbAIu1MO
         dYgPPuCm/1+4dQCl8M8v+dSu5fzsqXG5tZefTHjG7njrwA5vYDb7gvzZAzEshdOi5dH9
         ELdftbhJAm5qP0Nh29eOKhI49AIOta8almmn8aQI5CaPSRcBq0u84okoGIA2AIwyFami
         vL2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id q17si4351109qtb.129.2017.07.12.23.41.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Jul 2017 23:41:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:57468 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVXox-0001Xn-Ah
	for alex.bennee@linaro.org; Thu, 13 Jul 2017 02:41:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54491)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1dVXoe-0001Sy-3e
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 02:41:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1dVXoc-0004wR-S0
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 02:41:36 -0400
Received: from mail-bl2nam02on0082.outbound.protection.outlook.com
	([104.47.38.82]:61264
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Bharat.Bhushan@nxp.com>)
	id 1dVXoS-0004tZ-R0; Thu, 13 Jul 2017 02:41:25 -0400
Received: from BN3PR03CA0093.namprd03.prod.outlook.com (10.174.66.11) by
	BY2PR0301MB0599.namprd03.prod.outlook.com (10.160.125.21) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1261.13; Thu, 13 Jul 2017 06:41:22 +0000
Received: from BY2FFO11FD019.protection.gbl (2a01:111:f400:7c0c::172) by
	BN3PR03CA0093.outlook.office365.com (2603:10b6:400:4::11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1261.13 via Frontend Transport; Thu, 13 Jul 2017 06:41:21 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD019.mail.protection.outlook.com (10.1.14.107) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1240.9
	via Frontend Transport; Thu, 13 Jul 2017 06:41:21 +0000
Received: from localhost.localdomain.ap.freescale.net ([10.232.14.21])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id v6D6f2F6013081;
	Wed, 12 Jul 2017 23:41:15 -0700
From: Bharat Bhushan <Bharat.Bhushan@nxp.com>
To: <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
	<peter.maydell@linaro.org>, <alex.williamson@redhat.com>,
	<mst@redhat.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Thu, 13 Jul 2017 12:08:42 +0530
Message-ID: <1499927922-32303-3-git-send-email-Bharat.Bhushan@nxp.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1499927922-32303-1-git-send-email-Bharat.Bhushan@nxp.com>
References: <1499927922-32303-1-git-send-email-Bharat.Bhushan@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131444016812543309;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39400400002)(39850400002)(39380400002)(39410400002)(39450400003)(39840400002)(39860400002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(9170700003)(68736007)(36756003)(48376002)(356003)(50226002)(8936002)(81166006)(38730400002)(6666003)(85426001)(2950100002)(4326008)(189998001)(8656002)(626005)(50466002)(8676002)(498600001)(72206003)(77096006)(54906002)(53936002)(47776003)(5660300001)(305945005)(5890100001)(2906002)(5003940100001)(7416002)(86362001)(39060400002)(106466001)(2201001)(104016004)(76176999)(105606002)(50986999)(2101003)(217873001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR0301MB0599;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; MX:1;
	A:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2FFO11FD019;
	1:NKdjgG1QRXlPVa1bf0Lc8Dts76xoJKLAvDTb1wY+yG?=
	=?us-ascii?Q?RL4Q9d0PqZi9g1dsdZD1kwqaM9NrlqAd+xG/PisAnrJ7HSHjTMcZlkCF1O73?=
	=?us-ascii?Q?JhPoDPK/mGBHClkBfHW+4yEZ+Tq+mmWqreo+Unf1n/lqDFoEjlMySQquY1ob?=
	=?us-ascii?Q?nuVs9mF2Y4HJ13acEBVxKNxtShZ99ov6eAwGOmd2jcljpej57w7zK5vJKIev?=
	=?us-ascii?Q?4p1eyYpv/hW3nj7mv6nFVRlYlA7voPF7NE713Q3MGCfrDGne2MXIT5XuLBGk?=
	=?us-ascii?Q?iQ1uw31HB1SQFnB8ZGAisRzfuI74h6FxK9fdk522Ry5crkzpbukesMsso+yn?=
	=?us-ascii?Q?/RdlULrcbZeTjxuz2YAyteYneroCMhzDxsg4SgiLfKYI5PVEPSGZ2A8kAKbI?=
	=?us-ascii?Q?sZ0uo0aLPGWe89Ya9JgGIEEYCPTRBFFWNTdjGpI4dPPfMwzDa7sl0R2CjiMt?=
	=?us-ascii?Q?meDu+qAbhGvU2sxBGavpUQgUIK+Okund4v1+rFYX2Kqtxx+QXbmobfh9n3AN?=
	=?us-ascii?Q?ouwZ7kisMFXr5tFmv/CCoo3mnd/ohvkIsA8yYyMJVDygbQVg0uwKOsIImd7D?=
	=?us-ascii?Q?TnpKbsbGirKnqQJKrugyVqVrJCYR1igXEYibMvSwYWQcF0bbSyllDDKrblhV?=
	=?us-ascii?Q?kJcbU5bRStT3XLPvrtPyDuf3A+ZYB2B9ZI6/2e0peRdLDeo/iyoCw4kWWw0S?=
	=?us-ascii?Q?jHUQ9++EnMc8FR8VY9K2hYVCvfkLP0iMKUCnyRi9mbFxEccCRMX9IQhnt0Cr?=
	=?us-ascii?Q?uLidbg5sQZE54CfRts/GG1ninHNRWidD4vDDTG4nSMUAoHnt31BFpFo9fNV3?=
	=?us-ascii?Q?cQf0kFIH+FyzRnnxaI0MvZEYDX8xMEI8bHolTY9pUdF1s/AVNEQ1RBGaXmmP?=
	=?us-ascii?Q?V/8r8wRW/ZJSs62J5MdekClxNxxpvWOYiRe5a2RSBUk+4Kmk+EzKd6fvZyNN?=
	=?us-ascii?Q?S8SP0z5IRBMzm0m/7f0DFCqlS1PlQ0VkafPNxSTTf76HYAoIA9W8eFojy9LX?=
	=?us-ascii?Q?9b4KZzj7Gap4NoKhHwJkW9EtZ2JMPYD0X9aHc9RBQc/LasTm6pq7/3ZZI8mS?=
	=?us-ascii?Q?E6Ry0oilCTCpzqb01H4KaKAKN7?=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b0d0c3a-fcea-450e-4255-08d4c9ba2c5a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(2017052603031)(201703131430075)(201703131517081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BY2PR0301MB0599; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB0599;
	3:VeUKdg71o+kVYZZmv17Y3JT+ANOgBqqFkyxM6iJ/O65HjaZemyyVvv4O0lAfzdO3oZ94SQxv0k/KnOQFQRDZkBPHXRhUwb9J7cSdz87yMrTo16kFkCczRdrreRnuMoxT4fu/3BHkB1cUwsiQD2d7qqQKvIhGQGdP5Qz3cT+aZdd6EVpXRWZy1GHvg7oahgcGRR3AVJcZSKKAzyVQb3sgGZOkuLbBk3xxpdwikjG1AiulkqBdtQPrNVyPCmcdoLQY5ISM8rgtNxOPgTkYbHcZDtE6gTB8H/sEkQv3aigDCl88sieIAsBTEhCYrz1p91JonH87QpW1L2UMZoGWLa7OOnokaiLaxwwBtGRFBhaIr+nNUOwjAtN7ZfeCZhldECE4uCdnRyngI8jD7J+9EalJyO78g8OzqUPgVODhN51RxVIvI4eFUbpq5A53piOCvFH5zubinPPgpkew7du2mtm2X166Y+MbMNtXjCO9mIA3bLQyV1EanrNGiFXtC7byMEIEPbuXs+V1Drxhta3b5IY6PWDT2sObhve2pkZnOLVoQI0je0oVgjX4kxSUPfbRGsNxY2EULDgyQhpeK33kB0mWjh2K9/77xMmEErIr/E4prRFaw4WP5vSzm++42pMsH/OCEc9c/pQLQ/ogkRhmhxm9lnnZmKvf2kpC0aRhtrSoKtqoinu3Orz57XfYqGYoVjwzTg6DZEsh0K4agWK2CVOvUYLgeO6PUdYEpSgqzfj3NVNVnrprEiaEQEOWSYBkDhaw5jbniq91Q23LpbPqiKTkBHQWXj8jWTkXko63K7qF97O9vWJSVtSsT537lZkxRzNGNbXlCLPVLSvORyDlUhK1nNUakkSICENDtJRjSFj+WLg=
X-MS-TrafficTypeDiagnostic: BY2PR0301MB0599:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB0599;
	25:cgZiX/DrRTeGdg02KGD+XOEeQa6+Bdy+j01vNe2Y2l9JONn20MKg7s0y+d66DPhnhdPEQtSgrKTD+dzjt00DFuSseCM1/dX0T4ZgOpoqIUQi74aQFIRlBvf5WVLgquWdLMwi+XAVv1MLDSOEVHCO9lR8ErPFpkxFSiWQVMTaOi2nawGwM/Un/u+5bSA62GoXiAXmIDfQ/O2LThrEMWMCtiluh6hyQDDuBrHSuZp4esvA4Ihb9owyjZN2DmEV4sNqbFG58HiJJ9zRBENSTdfkXdmdq95N7KifAXnFHt5MC5oaTYp2pIhxxGbbCxN7yJGimlJv8lNQRcd04FmsAoR7P+1Id+CrdWZxpk/4Ob0dAtay+5cTAXF3/3tKA2A8Pztp92aPEkfMyopEVjDo3HUTIVdDcqsjwzve1Qf8PSKGWCzQl9y6MKBTUEIHmlcSYzLtJpHDv3SR/IrIGcxmVbKbHu7SfsLgtYXDVaNjnKeZvZh8pBS/Sir0fnJ7+p2d4MTHQJ+XdzqXDH+yjKcJu+WE4qrKhMR6hdHwfJpubOYBdIBhDtje77Gg+39a2DVvcSK3c2OoJkGBZz9e0SurTjF3XFRw4XfqDgEkAg3rMtc6gfq5Mo5p5dJAVhLXliWWfUWdmrCZK4jTAvq6Vje8Io6Jyg/g28N2zj/MroW6bIEbDzZ8yQfGhzfkTWwXBFbo+4gIeMT6FvyTbJ9CIvnaGcOK26mdKVJhocidGPB4ckst1yPNh/iJTshbgkEpLAY8MHKJwr30EsT6vvmYk/dbFRSotCuRjYFfsmFuCXYhzJZM/HgsOo7KZ0z2g2cppbRV4b8zDCodM0A30QYbTG3Di2+fuGTycGr89MyFXBX5YXyqOR/66BX58Wj8GU5ZvbbmVP+Cj0VgpkvvErhssUzHg0IXEd4BLlpB63tOiOp6vTuHGpw=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB0599;
	31:ufkgEhXTn4KgB7leI0hIwzE0ADVZQfw2VSCxY5UBgzsyoBJTznSt0mEB67xUCqLhIgAckLlY60GF3LzT+NpFzT8zKSix47ykjoXdHXz//jtm1mX/dAuiEIQNMAB9U+qxKmZQbHrzrqzJ0sNz9BrEG1y/KwAfaH6foz/eOJz1TgVjZkbJLyo7ddDDRVQlXfBxnHqDFIh5ohFRvRP9V75zuyusyVoWoHCWVWCALPsq8ZQCzSrYaAOuwzTywtJ18N5UKSzItJYboBcuE1AS91XzGp2WnZo9SUkSiJkt+SJGl6NOs+1nEb0RCi51FxKXeC5/C3IZHAAH+oL/iT9PLgoamwUMFJXfBenfLsVvUXlUoTg8aDpHFOhr/xcSn3Sr808AeQFdImpmv8hblxeEQzL3DFemQtAkJQOptf11jQR5ncDUWUSuEenrqgynhhdzYxSvkqzFFoytArBdPv5lh6WqrwVBIPR4Oiuvy+II5p2C+6nJVp6z7FRQ+5W5iM+Q6r5Wk5YgY4fJaXwTcIz1bJPhnxD5zYej+uubO2t5We7RMzoG7cKjk8NVWe24RTtg2782m/jI0HP1rLnDHSENALGZY8+xz3moPTTt8iDeR9wXwl1OIyP29DamMKy71PbbPjBpeZaPLhPdZbRFWXqy4wfN7syVCXQZe+eqvveQynpxO6K/yRgmWamT1i+RhSOuL6lbmxhBz1IR+veUTTH60iE6kw==
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197)(148574349560750)(167848164394848); 
X-Microsoft-Antispam-PRVS: <BY2PR0301MB0599E4F91E74079CA3BAA5669AAC0@BY2PR0301MB0599.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6095135)(601004)(2401047)(13018025)(2017060910075)(5005006)(13016025)(8121501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(6055026)(6096035)(20161123563025)(201703131430075)(201703131433075)(201703131448075)(201703161259150)(201703151042153)(20161123559100)(20161123565025)(20161123561025)(20161123556025)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BY2PR0301MB0599; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(400006)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BY2PR0301MB0599; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR0301MB0599;
	4:zy2jduPjuF7LqN7TK2v32RWVGchvNZZx+TM9oPee?=
	=?us-ascii?Q?LE8Yi/BQywgL5iMLLfU6JVfwFphnc9bzep02siLQ1ZDN6iu68lgkPXzFqnS5?=
	=?us-ascii?Q?cAbmAt0X/fp0shjnwL9hDFV9X/udPY7ZXR87/BpBnA+3hhmwfNSXSNXiW9UG?=
	=?us-ascii?Q?TaJ6CeITBAoJNdcpZ4v+cyZ1v6F48lMNZcIu9g//SkyFEy29CULUJlD4LHMK?=
	=?us-ascii?Q?EOB6xCidnZp07hR35M/tPBKzp/a8z6BnZGZh/1gfXwf/tfQO2isfPVz8Buua?=
	=?us-ascii?Q?iRIhBWlpVDa4CdXQJe9YL79oY0Dg/mw1HI8LKq6unsM7NRfzT6UZrgHGKgFL?=
	=?us-ascii?Q?JjktExfpfoR4q7LHcuP3S4ikJEGczN9P33zavRjmhZjTVI0RENHk5R6+l0Bp?=
	=?us-ascii?Q?mmqNHq5BOmrPY+qa6E7Tamzcmfxkl9qj61kyZmugPwCZmGm5FsfPA/tlYGKc?=
	=?us-ascii?Q?+RbdhJIo8BYATYetDl0Hews2OHUUckB1BwFxR6e/7AC2JqW7iv0ppWTwJUPd?=
	=?us-ascii?Q?anKPj1NObVulNe57aT+xcG1KUOH4WPEDmW7/iB5U4517b3Oo/PyFV3aGB9VN?=
	=?us-ascii?Q?++xu7cPhwBBsqChF6dOwzpoQH+laITuorxg+Txm22SOKxEXA8WrkhZO/QJOg?=
	=?us-ascii?Q?+A08vOTppsFlB9h+n7bTHNSZh9f0LIX1XA0RBz38rL5+I6EiHFN1UadvYQkK?=
	=?us-ascii?Q?JOUqOPh9IarJZj2+XNRxCai7KCAoURL73nGIqLhG9sk30iKjnpIWXPCZCwLD?=
	=?us-ascii?Q?zCFBlg4zWI30YTctMJxqpVNDhBRp+V5MlQ3haDbsnXxIdpvS0pAnxyzsCRTj?=
	=?us-ascii?Q?tKmNQTOiGMlNhk9zuaLGtzl9SUZHtzAiVC9bpdphMv3r6lpR44k8k8n+dOMD?=
	=?us-ascii?Q?S25Nclp/LQyFpS5mhvKAL+qXg73Q6MpcIcxPtyiNEXqvqO9Tpw4Wxw/0jLFn?=
	=?us-ascii?Q?4mAVn+itgiOx7MTJMasEeI84l7edqjJEjS84wHKKstLk16YGTdd5aSzbtwqp?=
	=?us-ascii?Q?3qevC58T0kStlcdkKh4UPew7THkkjWbiTUQpMQH2FGCGfZ2RIzA+7Mdah9ev?=
	=?us-ascii?Q?vy2HMA7zqoDMd0DprbzvP335EGYB22z2FKeCovjVSKUIla5+eiVQC90eQzWL?=
	=?us-ascii?Q?JrRx8Q1Y+GI7k4ASdk83KKG0b6QklOl0FUYlMKjhg0Zf7qrH0Fh93XZ9YLw0?=
	=?us-ascii?Q?7FuLjCNZENM6mRBpWfd0mpKT1Thn8MyQk45Hn5bGQgrkA/batkSFMZa0qQBR?=
	=?us-ascii?Q?e3T0Mf4zobyQv7XniFYK+KZVf11v/IkYPphjlsR6oDF9OqNNr4YLkKOqY3X3?=
	=?us-ascii?Q?F/S1Pn5q4Kr53egD+rCk7/1nb+/v95m/mJ6ZecDXnsTDFEtgXMOf9x9LPZO7?=
	=?us-ascii?Q?U1lFdA=3D=3D?=
X-Forefront-PRVS: 0367A50BB1
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR0301MB0599;
	23:keqdrZzFrW+2kf4OBKIBgekDFXNP0Hd/ZhoHyII?=
	=?us-ascii?Q?TZ4oBMi7pSVpII1xTL43Qz/NMfQ/9hzdO2JThRvwQbSfJEbVT0KyYgyPSo+U?=
	=?us-ascii?Q?A9B/9LcpBws+G+QGgSBCEOsh858b2lg+uj2CPq8iQhxM5U9zV4mJqwZdQe5w?=
	=?us-ascii?Q?A3fTAp426ouaHjZHgpHUwfoi1ftB8aqpAwUdqSKW+k2OgGWcKOhF7dj9MoIL?=
	=?us-ascii?Q?QNsCPGlTEqCKa0u0TMqkKGdAK2yOBKV53f8aUWRb3fzOKECpvJGgW52dDUCZ?=
	=?us-ascii?Q?MZzqRuFvmPQ95Lazn121+teRtN8RrT85I42L1Bfz0D8MX1UgrOKKfQVxXO/o?=
	=?us-ascii?Q?JaGDHCB9cyyflrfbUUTgJidpnEoA5d9P7sJ+7UhAvkLS6f/7/jUt4iqUxoX2?=
	=?us-ascii?Q?2dgkeYECBUBwVMqP03TZjy1iiImTYEjqutSIth5LXdgP3EpErdzw4AJ8tuHc?=
	=?us-ascii?Q?PWw4CvrHFuWqOhUbWkZvxqvrrfiGcArgdDH2hpnrbxEIG1rmy8RZBXVWY/EB?=
	=?us-ascii?Q?DcvsDXRLlT5XsW1HTMyNK9e2+DvHSJ318ORJKTzd2UqbPNrY/3kosnK4zDMq?=
	=?us-ascii?Q?FV7az342MSypRXrazyQtwTQ7fK2hOsy4r/TdvOIaJGzSfJj/rMBMf56zuspI?=
	=?us-ascii?Q?4gI1qlRPSqXt6jR92VhtABWwh46f279CB+u6/7i16LjU8QLE16wRM5g4NDrf?=
	=?us-ascii?Q?c7SgxWyyHWQ1J75VIW8E/E13psxnRaNk+QNVTcfKOaG3rXGKaBvxWJt2Xp/y?=
	=?us-ascii?Q?BWRATobBarh8REOsb39K7xqXVmvbuxs4ohDDHRRzA4TuwwSUOoNsGQopJMOt?=
	=?us-ascii?Q?Vl7T3rFTOmFQ8xDT1/0A9H0wOInNrphtHvOGQfOVubBicA1IB448SCAschYH?=
	=?us-ascii?Q?9rt1Y/zFrN0ADCnAlaGovtFP7bFGyX2lat0GRcnM7ysDj4E+oE1DZgogg3ny?=
	=?us-ascii?Q?kGI+hFPXHETTioyjZuBNDfEh7nv+xesjc8Ccyy+yAkGRpq3K1UgD4W1lvMt8?=
	=?us-ascii?Q?Ew7fj+jdjHHCb9w/KI52EjEVohgNSZtmxnRsoxkHseyQZozahEOcZrNXwdCK?=
	=?us-ascii?Q?mlDHFtUk4Wyt0oxopLH+u++80pasZtDrobaThPam/wMh9eqC5nPiGhZ4mxx+?=
	=?us-ascii?Q?IG29TKFLaqQCj+clPa+SDwIjTXuJQnym7UsmAn2Q1ntzg8OnZFyQ2XD14/+6?=
	=?us-ascii?Q?nO8nKlj9AwANADlouzwqGSwy0RPxsffPdZO5PbMv9H9SudweP0zvVioyweX+?=
	=?us-ascii?Q?qb3lHhBjX3SWUH+xZ3BLCDapFK4/qZWJ3qr+W7uYztwNawWd9TMnduI2/0eR?=
	=?us-ascii?Q?xNe3jnFuQxDwc1K3UA/N1aM74x/zmWBQ5bGhjm604JfZ8b0YZndEhWUVbEsl?=
	=?us-ascii?Q?7wWge2A=3D=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR0301MB0599;
	6:0ey4cw5TWN+HLU4SH63lLGiuwKVDj9XJHV7AL2W2?=
	=?us-ascii?Q?pSwz8Zcjt0blsNyzMZJjSv5IKF7/H2kAJmjMMxpzcmG3zt72tNfwubjLzriH?=
	=?us-ascii?Q?ZxTkjEJhDjLVQA3WlL0kKmNFA1W51VljH1StF20lsxt9+x8La2aukxNDE9Kg?=
	=?us-ascii?Q?/2hhQhX3DAWogwUUUSxlb2lYqTozmIP8lba1GkpbMGBDTts4Flynj35G4Q6w?=
	=?us-ascii?Q?RraUasbHLBrF0wmcsNlIwVb6Ur1npIiraPXCYbEystZ/Lr6W6mdlLlMnkFIq?=
	=?us-ascii?Q?eQyPp3Aw2EDx61eqoUtPhwqbAXorD36rN1zHr42/UO+28OQK+oxd+v4qqpBQ?=
	=?us-ascii?Q?HYz/MCeFz8q0LKvP3dcPjVWT/G03h3xxw15m+v40oO7xexitUtQH7w6LrVad?=
	=?us-ascii?Q?fPk5C2JOoBGOVorqw2yDKeI/acrBlE3dhxFjtPJwx7pj1JgWArdzpZm96IYp?=
	=?us-ascii?Q?z0gpRqxehs6O96Qpi3+xDZJQrJYDJxueqy7k2Cxc15yyPm00DsCoXmCNXt0Z?=
	=?us-ascii?Q?aPWmgPQVSbPwbI4THjWV09ry3PWEuSLS94A36SiCM5vYuAgEY8e31uFKFz3q?=
	=?us-ascii?Q?JMs5u6KLdyK14nWqbUjU2v4Ybm0tMMYwKyGiko08XYyaYb87myf+5qULweF2?=
	=?us-ascii?Q?Jg+7ZzLg2xqX9kw7Gq9Zls6n38FmNJEFNZhEqi33rN5dGX4qFJVu0aRXe1f4?=
	=?us-ascii?Q?nrySbJKdrrW+GAfqjiqZj8vMth4F/7pqKcJWEb+h9ZmeV+8sEQzH2h8ZxADP?=
	=?us-ascii?Q?KEwkwo1on4m4F5wH41wRw6CHpQuyb4E+OO4+OjtiaDXSL95gGUGa9MKuBY34?=
	=?us-ascii?Q?5B8il1YfmiCfKlIokkLha59ACs0E71hXmhoGgpVBbD6SQxOq52CWkoArEs4G?=
	=?us-ascii?Q?aDbf+4v9bvDmgIRvH2FWQ2tc+MPMcqucn/VEmDSb7TrLr8pEQ9ZxR/9+n3AX?=
	=?us-ascii?Q?MovTu66YG0xSgoORfhDDJvWCWisr37cPjQ/IV7H4RL9876xO9gm/RpG4Vzfi?=
	=?us-ascii?Q?Gk4=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB0599;
	5:aYirotfErhXVXjFQFnruAQcxS5bz9/nPnUuvZ4NNs6I6+WaqNZU328fGzXUGgCy6w8qzLMASBKIKx9XBjHoubmgV173giPldrXeHGppfA2fUGpVQnN6cv7NU4IU+60ReJGOlLV7Ah6xI85RpE8a68OIOtdnbM1oSY3weMjEo4CGg/4Ehh1Iyu5AORJohy5kAkcsvO1EhsDJ5mQGsmc9otnHkua9CR3qNmideRLVma9J4pzXvZilu0kuZvA92W2TU4nPPq6fJ5AoT/AB/J/B9EBT6QovT+5ObFlDhztzyGoFtxYECu6hTyhGDxdN1eQMQPleXXxycMaXYZLeVg/5l4DY2729eMEbRxRPZu033a+2bl0vl3b145XAjTIyxaIvVWHSjpLptYZ+yBWTY+rhkz8RwSFoUf+mITci17Pu+y/y5RGFroMCLgSWHqDbNMCTOufaCrZ9ltZNVgeButNyiIV2ZV682iyjVU0BjtSPwtbEQ3qKZLll8/rfLTb++h5zfpQvLUl3FvCH0w15bmYA1Dw==;
	24:gaT7qBYxoAi0eMNZeIKzn4wEdF+4ibzFQzH1zMv+zsxSFfmlrPTJwx3p8mYL5hJe6fvGnTGASQ5OUCrff60Pl0vQ4UwNoW1cuLWiAFv9+Uk=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB0599;
	7:iFZjdG/vKbEtgIpKftChQ6DxUJ6F1dL9MowYQUPmhFrAqT5EPnxYL2bsPtkgsaTWaFsiWcxTudht8tapjoFPtoog+8LTYFejltKHvl66JS5tRO9+ozPQZn9H8uhLXsK4RVxg4aOaYu4bxXmVeJqR+xSN64dc5DDeG/Rni5SlFftl7Hx+TD3HiwkXPtfhxqM6tVyO/i2fAdRprppjZiBpyCyWdxAhOr8X8CdHBwJQ4cp+GREDmcVsNpdd9xdjHlyLRPjpCqoKdvFPLcTnYZ73VsAQSMeJsG+Nd4mloE27FX7mVG6DrcOpgKaX6/s+r57XvWENBupSTxvditEyXLFifC+Q/xTa2NmmAPGJyVSR5niOEASpU4scakuY937yVQG4sBcK+QJv9y5IQ6/LwlxlrQPdpTOIk2CPf9cfT5VKBOphSKmGIKJAMxG08iX6qCvRXaddGarB4o8Mg3VxsCN3snkmxFxG6h3w+e3SX7grMW42w4gZlxjLeUAad5xuQVqLCwMA8VcvUJ8mENcvuAzslNi/FW5kHY/20GVJ319kWLVQkU/lawCWlceXOsEd1NlhHltRYPC39Kf8L77AAKTnyEztaYam9VCmSKd1e8pynvObiESsJCVEKGEoSjRr1iKnNX1FVGmBc1TcHTkSMEj9AXuYiJP4N5RVcYzdMQ1X9EtiqZSfnHk7shXmXFoIVuRoOMghf/SFGo1KX/VBEFryoeo9POZIPQDXsA3AGON+uQ5UIBzS/tHJgrNyLImCuGqoN8ewL4DW3aqG0t/DoAjEXcWEB67vO1GisLy6atfhX9U=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2017 06:41:21.0203 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR0301MB0599
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.82
Subject: [Qemu-arm] [RFC PATCH 2/2] virtio-iommu: vfio integration with
 virtio-iommu
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: kevin.tian@intel.com, Bharat Bhushan <Bharat.Bhushan@nxp.com>,
	marc.zyngier@arm.com, tn@semihalf.com, will.deacon@arm.com,
	drjones@redhat.com, robin.murphy@arm.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mHpdgXAy3Nzw

This patch allows virtio-iommu protection for PCI
device-passthrough.

MSI region is mapped by current version of virtio-iommu driver.
This MSI region mapping in not getting pushed on hw iommu
vfio_get_vaddr() allows only ram-region. This RFC patch needed
to be improved.

Signed-off-by: Bharat Bhushan <Bharat.Bhushan@nxp.com>
---
 hw/virtio/virtio-iommu.c         | 127 +++++++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-iommu.h |   6 ++
 2 files changed, 133 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index cd188fc..08d5a2f 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -129,6 +129,46 @@ static gint interval_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
     }
 }
 
+static void virtio_iommu_map_region(VirtIOIOMMU *s, hwaddr iova, hwaddr paddr,
+                                    hwaddr size, int map)
+{
+    VirtioIOMMUNotifierNode *node;
+    IOMMUTLBEntry entry;
+    uint64_t map_size = (1 << 12);
+    int npages;
+    int i;
+
+    npages = size / map_size;
+    entry.target_as = &address_space_memory;
+    entry.addr_mask = map_size - 1;
+
+    for (i = 0; i < npages; i++) {
+        entry.iova = iova + (i * map_size);
+        if (map) {
+                entry.perm = IOMMU_RW;
+                entry.translated_addr = paddr + (i * map_size);
+        } else {
+                entry.perm = IOMMU_NONE;
+                entry.translated_addr = 0;
+        }
+
+        QLIST_FOREACH(node, &s->notifiers_list, next) {
+            memory_region_notify_iommu(&node->iommu_dev->iommu_mr, entry);
+        }
+    }
+}
+
+static gboolean virtio_iommu_unmap_single(gpointer key, gpointer value,
+                                          gpointer data)
+{
+    viommu_mapping *mapping = (viommu_mapping *) value;
+    VirtIOIOMMU *s = (VirtIOIOMMU *) data;
+
+    virtio_iommu_map_region(s, mapping->virt_addr, 0, mapping->size, 0);
+
+    return true;
+}
+
 static int virtio_iommu_attach(VirtIOIOMMU *s,
                                struct virtio_iommu_req_attach *req)
 {
@@ -170,10 +210,26 @@ static int virtio_iommu_detach(VirtIOIOMMU *s,
 {
     uint32_t devid = le32_to_cpu(req->device);
     uint32_t reserved = le32_to_cpu(req->reserved);
+    viommu_dev *dev;
     int ret;
 
     trace_virtio_iommu_detach(devid, reserved);
 
+    dev = g_tree_lookup(s->devices, GUINT_TO_POINTER(devid));
+    if (!dev || !dev->as) {
+        return -EINVAL;
+    }
+
+    dev->as->nr_devices--;
+
+    /* Unmap all if this is last device detached */
+    if (dev->as->nr_devices == 0) {
+        g_tree_foreach(dev->as->mappings, virtio_iommu_unmap_single, s);
+
+        g_tree_remove(s->address_spaces, GUINT_TO_POINTER(dev->as->id));
+        g_tree_destroy(dev->as->mappings);
+    }
+
     ret = g_tree_remove(s->devices, GUINT_TO_POINTER(devid));
 
     return ret ? VIRTIO_IOMMU_S_OK : VIRTIO_IOMMU_S_INVAL;
@@ -217,6 +273,7 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
 
     g_tree_insert(as->mappings, interval, mapping);
 
+    virtio_iommu_map_region(s, virt_addr, phys_addr, size, 1);
     return VIRTIO_IOMMU_S_OK;
 }
 
@@ -267,7 +324,9 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
         } else {
             break;
         }
+
         if (interval.low >= interval.high) {
+            virtio_iommu_map_region(s, virt_addr, 0, size, 0);
             return VIRTIO_IOMMU_S_OK;
         } else {
             mapping = g_tree_lookup(as->mappings, (gpointer)&interval);
@@ -410,6 +469,35 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
     }
 }
 
+static void virtio_iommu_notify_flag_changed(MemoryRegion *iommu,
+                                          IOMMUNotifierFlag old,
+                                          IOMMUNotifierFlag new)
+{
+    IOMMUDevice *sdev = container_of(iommu, IOMMUDevice, iommu_mr);
+    VirtIOIOMMU *s = sdev->viommu;
+    VirtioIOMMUNotifierNode *node = NULL;
+    VirtioIOMMUNotifierNode *next_node = NULL;
+
+    if (old == IOMMU_NOTIFIER_NONE) {
+        node = g_malloc0(sizeof(*node));
+        node->iommu_dev = sdev;
+        QLIST_INSERT_HEAD(&s->notifiers_list, node, next);
+        return;
+    }
+
+    /* update notifier node with new flags */
+    QLIST_FOREACH_SAFE(node, &s->notifiers_list, next, next_node) {
+        if (node->iommu_dev == sdev) {
+            if (new == IOMMU_NOTIFIER_NONE) {
+                QLIST_REMOVE(node, next);
+                g_free(node);
+            }
+            return;
+        }
+    }
+}
+
+
 static IOMMUTLBEntry virtio_iommu_translate(MemoryRegion *mr, hwaddr addr,
                                             IOMMUAccessFlags flag)
 {
@@ -523,11 +611,48 @@ static gint int_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
     return (ua > ub) - (ua < ub);
 }
 
+static gboolean virtio_iommu_remap(gpointer key, gpointer value, gpointer data)
+{
+    viommu_mapping *mapping = (viommu_mapping *) value;
+    VirtIOIOMMU *s = (VirtIOIOMMU *) data;
+
+    /* unmap previous entry and map again */
+    virtio_iommu_map_region(s, mapping->virt_addr, 0, mapping->size, 0);
+
+    virtio_iommu_map_region(s, mapping->virt_addr, mapping->phys_addr,
+                            mapping->size, 1);
+    return true;
+}
+
+static void virtio_iommu_replay(MemoryRegion *mr, IOMMUNotifier *n)
+{
+    IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
+    VirtIOIOMMU *s = sdev->viommu;
+    uint32_t sid;
+    viommu_dev *dev;
+
+    sid = smmu_get_sid(sdev);
+
+    qemu_mutex_lock(&s->mutex);
+
+    dev = g_tree_lookup(s->devices, GUINT_TO_POINTER(sid));
+    if (!dev) {
+        goto unlock;
+    }
+
+    g_tree_foreach(dev->as->mappings, virtio_iommu_remap, s);
+
+unlock:
+    qemu_mutex_unlock(&s->mutex);
+    return;
+}
+
 static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
 
+    QLIST_INIT(&s->notifiers_list);
     virtio_init(vdev, "virtio-iommu", VIRTIO_ID_IOMMU,
                 sizeof(struct virtio_iommu_config));
 
@@ -538,6 +663,8 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
     s->config.input_range.end = -1UL;
 
     s->iommu_ops.translate = virtio_iommu_translate;
+    s->iommu_ops.notify_flag_changed = virtio_iommu_notify_flag_changed;
+    s->iommu_ops.replay = virtio_iommu_replay;
     memset(s->as_by_bus_num, 0, sizeof(s->as_by_bus_num));
     s->as_by_busptr = g_hash_table_new_full(as_uint64_hash,
                                             as_uint64_equal,
diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index 2259413..76c758d 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -44,6 +44,11 @@ typedef struct IOMMUPciBus {
     IOMMUDevice  *pbdev[0]; /* Parent array is sparse, so dynamically alloc */
 } IOMMUPciBus;
 
+typedef struct VirtioIOMMUNotifierNode {
+    IOMMUDevice *iommu_dev;
+    QLIST_ENTRY(VirtioIOMMUNotifierNode) next;
+} VirtioIOMMUNotifierNode;
+
 typedef struct VirtIOIOMMU {
     VirtIODevice parent_obj;
     VirtQueue *vq;
@@ -55,6 +60,7 @@ typedef struct VirtIOIOMMU {
     GTree *address_spaces;
     QemuMutex mutex;
     GTree *devices;
+    QLIST_HEAD(, VirtioIOMMUNotifierNode) notifiers_list;
 } VirtIOIOMMU;
 
 #endif
-- 
1.9.3

