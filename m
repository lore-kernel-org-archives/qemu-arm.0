Received: by 10.25.44.15 with SMTP id s15csp571163lfs;
        Fri, 14 Jul 2017 00:29:25 -0700 (PDT)
X-Received: by 10.237.60.19 with SMTP id t19mr10349922qte.206.1500017365337;
        Fri, 14 Jul 2017 00:29:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500017365; cv=none;
        d=google.com; s=arc-20160816;
        b=i6rqa6S8lyKcDO4Ew0U2ibKdiD1rghCrfnmiBMisXm4+cRfkrIf8J61Z1EzNk5Zffh
         8b/Tf6my9Ymy3HLcZ/OeYYQujLP3SjRXxQBgoQ4M6iD920V0frbGtcHrFl/EtRAjCAnV
         5uUFtjLF1iY/ObMCTqbwpwJTq/314VgmDjtY2dFHSBqIsViOhwj1+qgICf+l89llXWem
         pr4wbWMst5X7YkF5zviEDctF862dBY+DINyJ3J6ED8RoOMVGgqCBqfzUc+mvwVzZkusQ
         aAov7r7qhVjNXACliLM9+EvXsMLWvn+9zyrOh3yHG2qAhxTJIHizbPJBW1IaXDZeRFvq
         WKdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:arc-authentication-results;
        bh=558bkKBpOWYuwmnaUURKqOK9CS7ZiMQ+8ug/l9gi5GY=;
        b=VOG9n390OZcYGCHPNgBkobPvGbDbek4tjfcOOwVcqP/L54nxDLNxAHTWcqExMxn3xL
         qXRteJ4oDubirEJfIfdeK0oOCLnHP+wTu8zHNFB1uoSKuaOK6QOCQpbzFe1WEBnScZ1q
         7hcV1ctNXmRxBLQgiEkBJGdKJtRRVvQoqrfWuBfnNie8Q+AcGC/JrusjuQnD/b28HWdm
         2VAT4JQzfyhr2TFr7jmpWgxuwTEBuzBYWbetLO2B9Eluu9h5RoFmRqEe+mYLSTCGezNj
         kHkEtQuo1btwmgCKqAFJ2JdRu5PdXyI7/abasIuQn3PHXs1XwBuWXnN7DYEFnBxAFLXq
         0VMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m6si7148003qkc.39.2017.07.14.00.29.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Jul 2017 00:29:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:35946 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVv2Q-00048r-F8
	for alex.bennee@linaro.org; Fri, 14 Jul 2017 03:29:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1dVv0r-0002Ya-Dv
	for qemu-devel@nongnu.org; Fri, 14 Jul 2017 03:27:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1dVv0o-0002iD-9P
	for qemu-devel@nongnu.org; Fri, 14 Jul 2017 03:27:45 -0400
Received: from mail-by2nam03on0057.outbound.protection.outlook.com
	([104.47.42.57]:19184
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Bharat.Bhushan@nxp.com>)
	id 1dVv0n-0002h3-S6; Fri, 14 Jul 2017 03:27:42 -0400
Received: from CY4PR03CA0105.namprd03.prod.outlook.com (10.171.242.174) by
	CY1PR0301MB1194.namprd03.prod.outlook.com (10.160.165.25) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1220.11; Fri, 14 Jul 2017 07:27:39 +0000
Received: from BL2FFO11FD036.protection.gbl (2a01:111:f400:7c09::168) by
	CY4PR03CA0105.outlook.office365.com (2603:10b6:910:4d::46) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.13 via
	Frontend Transport; Fri, 14 Jul 2017 07:27:38 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD036.mail.protection.outlook.com (10.173.161.132) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.1.1240.9 via Frontend Transport; Fri, 14 Jul 2017 07:27:38 +0000
Received: from localhost.localdomain.ap.freescale.net ([10.232.14.21])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id v6E7RPn3029590;
	Fri, 14 Jul 2017 00:27:32 -0700
From: Bharat Bhushan <Bharat.Bhushan@nxp.com>
To: <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
	<peter.maydell@linaro.org>, <alex.williamson@redhat.com>,
	<mst@redhat.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Fri, 14 Jul 2017 12:55:03 +0530
Message-ID: <1500017104-3574-2-git-send-email-Bharat.Bhushan@nxp.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1500017104-3574-1-git-send-email-Bharat.Bhushan@nxp.com>
References: <1500017104-3574-1-git-send-email-Bharat.Bhushan@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131444908585658219;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39450400003)(39380400002)(39400400002)(39840400002)(39410400002)(39850400002)(39860400002)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(9170700003)(50986999)(498600001)(8676002)(72206003)(105606002)(2201001)(5003940100001)(189998001)(50226002)(8656002)(54906002)(356003)(48376002)(68736007)(81166006)(39060400002)(626005)(2906002)(4326008)(53936002)(38730400002)(106466001)(8936002)(76176999)(305945005)(2950100002)(104016004)(47776003)(50466002)(85426001)(6666003)(86362001)(5660300001)(7416002)(36756003)(77096006)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0301MB1194;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; MX:1;
	A:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL2FFO11FD036;
	1:Q7aG2UJrJQ7uKxAkcZLXWp69HdcbFeLWenEjQV6B74?=
	=?us-ascii?Q?xFlUWlRIcYBqTkhN4EjrB+6IIJbMo9AmjJq2kOKYRlBGR/drE+GfnRxxfpZr?=
	=?us-ascii?Q?8RbPy1YAMuJ8/LA0rpNcqEGLC/YNMW8B7wWm9MwtlgCn2LotXxa9QPkXjlwM?=
	=?us-ascii?Q?8soSiLYCbs01U3e90ovPfv6RpghzFiyNwiAzfCgRl3995EmwNB88ssbz5X1Q?=
	=?us-ascii?Q?hEXoSPbX1BzHi6sjfjAyDDKwv9wyUdoMndb7vZW09W1918w27eQQt8YhitEx?=
	=?us-ascii?Q?AoHu1HlpLOpvAAEinPzwDdekdeM1K5r+V7cHQHNtCd1aUJ2FLrhUJv0gOaS/?=
	=?us-ascii?Q?30LuiFeL2EaRBqsAqn0fRiIAioqAOvs+F7D+GliVRMEsG9BTxT3msBpgCKde?=
	=?us-ascii?Q?R0Yv1WsWeFgXkouxIKf9Wq83Hje1T2lqtfBfnUklGpKPSwFEuII30RZHkfIB?=
	=?us-ascii?Q?aN9u0cO0FtTiWbV/I+NwaRBj4VlxaF6XPHoMu4l0N6ipdmd6qg7tNXqWAKJQ?=
	=?us-ascii?Q?EL8fDS2+0eF1g/vnSsEhAWyJ3CUxStGu8qBt2X9syo9lgDjjru4LayU5xB6h?=
	=?us-ascii?Q?n2Mg5JH7rT3TUNSJX+kvA4R4799kAjAmZ0gIpLf5hT+j3Sn62LD/055D3yEg?=
	=?us-ascii?Q?pj8onJ5nPDPpteP6FBV14T/HIgFj1ZM0YGv5B2cDrszrzMwVRSPRDnuRzZxl?=
	=?us-ascii?Q?hr/t8QXprg27o7aLbcdUqBoTezehc9g/eeIwTsJn9IZnVL2ueJbUO058xRBi?=
	=?us-ascii?Q?cYlcirbhZMC/TjVNc6eKYBR/n9Qwhg3LSAJj5WgmLPUGEXroS+ks9oRySK+3?=
	=?us-ascii?Q?bAiAXftuHzcwpadzruAUUv0WBvgMpzVNMELa0fi0tFCvtVEsvbo4wh+zgtYU?=
	=?us-ascii?Q?nmVuHDZdk2iLZO7wtf8kl/ELy8IaR0fhU6TZfzDr472S4a9u95YgSKBDipfR?=
	=?us-ascii?Q?iLYkl/EtD2rOYBR8RaT23L2R+ooR+wMnq+tsZOH7YqnTwSROp0hrjyjbL2z5?=
	=?us-ascii?Q?BWetmp/OpPR9rXVXasdmBDV4VuEuoQUYk1mkMqZvRs8XB1jZQS0tZVJrwang?=
	=?us-ascii?Q?5h62kV54TfpGnMEws9HA1j27MP?=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e1d5b3e-06da-4848-c609-08d4ca89ce3c
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(2017052603031)(201703131430075)(201703131517081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:CY1PR0301MB1194; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1194;
	3:vyA5sci67DNQFGIai1b1JQae63S0VNIOIC3kr6e9B9HqQ2VtwfyqNFjafCQv/fcn/8NEbM52xpj9DQQYS+DIJ0yvabO+S+DcKJVqPQaXsk4f8U4IkbDwyB3loB5vNk08mud3VEiRjxUmrZ7unaUKknDrNUeJ97y6+c2fbFc9YLUGkDELhhr9VZI3ivKuAcaWJBJuYeOfeg4RMQVlfBEaQwMvRhHHy/k7HSQsQXYMLbgBqbWWHziTnrgpP5M+BJXwG7qPQlKsIlaKfkcq1FG4Kaj7O+YxTKpjuiYYHaCuPbBMpChvkrdPKgBHERJOnMESxkn86FR60JC0cLqNv71MPvvH8iwSo5B8Mrq+puEI7cLqT2pgcWyfXKCljDkspT6Af8FspLUPldfcEK1lTfACoScq++GXyl8rdFn9/GwSaQv6aYmn3d1oHj2oeJN9khxE4NsmNnL8c7z+1GkNtPOk7OhV+1PxaIhccLt/jZpLBrqsUb0epS2W6ihxzBCLK/WGRVNv5MgqGVOC7C8CMQlAxX6eL7NSdq44aocX54by6P0wAfXDIoXf5tTH19qp/u+BlmildGTjhKq/Q3qKIoeiKrBOHrT3BhoS6Ln6R5a5lFUkBVtlLj7k0ZhgFCNLn5/IH4JiCixFsPC9yQWT0lXb9hjJ7CU/maeZrr/Wai9akGH1ofCmAOWzIamqN8nxcjeSF6J/p3DHMSvQxWv+7u/E2TnN77j6KKEF9MEGgYcKhIxk+QZ0+QB9QlV1uap79+m50iea9sjq30g++ijgoafK5WCXdVVwQaNPAsRSPcDXcAquvs3fIYp9AoeqxXMJaOzfTwPM3uDhwkXCNAaRjGSa2uUzwee8hHFwWU6DV840GJ0=
X-MS-TrafficTypeDiagnostic: CY1PR0301MB1194:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1194;
	25:dy2tbfi+G+66GZmoFghKsnmQuyNrG1ykK78cNwP744XR3po5B/pVHgrGGnMlBM697wdIBC7T4kxHaTgSGcGvi3sIff5GjPMgZ5M7U4peN/pDjcV0gVbu0HaTp7z6XDkMd3CSdpJU39bPjzlHZzb8cgPGFNP3wXvuLdtpcwDWXEnevjdcBfnsz2U2RX0TFmhGqjX22QjQduu9KG1538xqYRY1DhU9icq2SvBB+EhmDjRLR6BrK18cGW7jsQmo7pIRFteI7hPnEoKh52Tlr+nmooCy9q4E6MiOfE467edPIzKkX1dgUuzyJRNWHpqXzGy+XnSVq1KVwnFbKFHR3/wDZdedkbJ0CIT7JNOvQnJ+IJU1yFJ/ajjqAyAxTrbHd2DmrpgvwsgorMQgpLyX8jzY2iLy5wR3787wLyAPk36Z7wzNooeLHRvsSZ4haUSttdwvMDqQ3ANdc8q7reBvy4HTRXYheP5c/SHdvpA+oW6JSX5tiXo8ItHgxCvMt+1Wa5pBGqTLk5kd+O/ce4u+13Dkwa0DBw6ZsJHH+zANWkeoKN+ohUl64K6/bKIY0QDwUnMi6Zwp8QE+dQ2WlQxhakdfMfBYFRvc/iYjWUshLz+Yk3iJhX8r7o18WjHH26LxoKj/kYOGdmy4QASEqZgXqvdzim+il6VIE1PdYWrBLvg1ZV2vPkp16Dsf6c8dhAYhYzaNdsQrIysRtwq4Rry/Wjmr0cuoWDvmarzlhgAZawiRVZNOAQwLEKqmus/4FP3pnLvd3+5SlorSPXpZQGEvqRI7Vd2vXrDa1pHc6XMzBaxewHewVczoUDXGprrjI2lb5brOyd+ARxYSOGtG8urwyFrlXpVLLZcnJGb9UiiOCDbGzSoG40NWt/z/Ly3BB8nOJBQ0Xrr9mf7T4x3TermNlKQm+vaeArPFkOdCbFq2qXb/esY=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1194;
	31:5Ql+aB44zSxkvSm35YQ11I3lphZ7eebtIdsWjdTcn9ldHM+qUqy6/52F7lQ8aYPxHe/6jQqLMeK+V+B7DUW9xuhsEppntnGM3E2nsXO3zw0QkCFVDd7kAuuNbCnhUWt+Zo1U2oNOazlGj02D52iXkxNFAzdeThU8WUvtizAYDY8mkXpITNti37cO64L3nVdqDkevMXzxs+rrBGbnWgcWGJ/yDIyqjdxqjSdyE32f4SfrTjYBNbTIrhcqPei4IUY80F5SL+t1WGiCbN2aaVFWpYxIpAcjkK7AZ7dra2kKQrgGHU2Ioe9iwYai5UaE+ipGSuZRbTvmFpFrYM2haP0Gpi3XMnbp6QMAA0JUN73OI1mETmn5C8Zh4Azur1r1+SNdQ5igb3PesaBaxTAqe7KoqLBArVXF2wnKmtULO12yr40tYPuObve1PsqAr/91p15mHfbxe5yVq4Csjy6SZ14F6SF2h44/KtU9waDai38b9+I1ZEcibKshRmlA5NRQzxjW7PK/bfowiZ7yl0ZStcnueFxcpeoshJ9/aZ4eX25mV3+6KjEyDgW+H+pB+fJ4rWX7t4ayhzvlrWrrydlDImD6zkwYifaKoou0+QYohnN7upFulJBYyQsVahmHsrsfw+IhkbAcyVr0qr3OlAVBJsoPwFnEA3IH7YnT7+U+7CLJgwePeNvZYrbdGqf+FhwHDW21Ip2zxRwsCL6mSlcM8HeXhA==
X-Exchange-Antispam-Report-Test: UriScan:(236129657087228)(185117386973197)(148574349560750); 
X-Microsoft-Antispam-PRVS: <CY1PR0301MB119447144AB1AF4228A34DB59AAD0@CY1PR0301MB1194.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6095135)(601004)(2401047)(2017060910075)(13018025)(13016025)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93001095)(100000703101)(100105400095)(6055026)(6096035)(20161123565025)(20161123563025)(201703131430075)(201703131433075)(201703131441075)(201703131448075)(201703161259150)(20161123561025)(20161123559100)(20161123556025)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY1PR0301MB1194; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(400006)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY1PR0301MB1194; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB1194;
	4:zuJaI8ib5IOAiw6KSB1/r3iqPszsp0O5QaEfJWIb?=
	=?us-ascii?Q?/lwKBGj6zb4jxS5NxzruYVWwwgV0vaT3DEt09uUi3mFDIW1upzvjncDyoI9B?=
	=?us-ascii?Q?GLW5+Bxcms8mwnpryVTQrBIedmlevft1/Pez3QhGZjWr2smOs9aVuJL9iFEe?=
	=?us-ascii?Q?BV5CBih9i9qaCPONlF1hmWXL0WiiTIoblbXcdOOSOsvzWSW5ot1L4qJ+s2fV?=
	=?us-ascii?Q?8h5x3jj4SDWY4mAHBVWx2c7xADTgAjQ5k0HcTqEXynn8WgLPUrS6i7EbaEIN?=
	=?us-ascii?Q?yzf5KdWxIYEsjDqMcs2ucbeG8SrEi//1O+O+BO6JB9azGd8wM3BxZeYxNdnG?=
	=?us-ascii?Q?gqmW15C+0NhdULtHVdGipKMFVOoVP60YvGHo4qJ6vmb94dM419g4XfMPWmso?=
	=?us-ascii?Q?b6yPxS85BdjJzfoBPLcknnGcbpd56+l5iX4H7vh0cr8txd5qeylFOF9dDwiE?=
	=?us-ascii?Q?BucxbNrpQFg8tiZ6dmzIP9X3TB+RaByEmLvVldA8YvdiHVwx+KZYgPyLvinm?=
	=?us-ascii?Q?nOHqzMv+ors9st8hlDgr9yF57Umfjos+pWF7xQqpkAMw8Kq1MO+271eqNcy1?=
	=?us-ascii?Q?ezUeM6yLa/sv9KnZS9HSRYU0oF0srzh3RWVTHeURbmrulrx7eu4i5bt3aOzh?=
	=?us-ascii?Q?AEqLFmqMMBbJJ1LjO7J37y3oh8cPJzNhtB6jC9Lvym/mx6f4/klC3/ICAhpM?=
	=?us-ascii?Q?k+nh+xXkOOnPf3lfzaCljqalGKM9pokMOJunN6u4+eS+57BNXfr3mXBKcHbO?=
	=?us-ascii?Q?/XWKbxf0KtxuyDPqOFc+1t+8MbW0hqeITQq4ugrYk149mspsEPl3lfb/bSHG?=
	=?us-ascii?Q?LXN/zc/cAFtJftyOPtRRXAjdmsWwa1ECEKaZK4Qffq3sYYAygHNMLu6oLUlO?=
	=?us-ascii?Q?+L1ZyMSAl41/d91qZ8q2l6RFqkjBNQT+cbWB6mli00gs9kqKV5HnXae/5FJ6?=
	=?us-ascii?Q?aT3aC6ApCrNq5jI9hJUnQfF/n4WCz1kqy04oawJAFJzK8Xn5x/5E+d+3wtDz?=
	=?us-ascii?Q?Tgo23kPq8CnesSPsa00U5sW/Rnd/QIRFM8i9Afo3QCicUVEG+pfOv58GMQ0u?=
	=?us-ascii?Q?ehIr+fSOAM6vUIMcss+yHMN1n43HNIaImDd2Lk2M4OjPO0jnEZxilqPdCfiT?=
	=?us-ascii?Q?3cz0RquB4Ug4DMAgQw/5Sc/btwtfPr6p9qatN4nwnQkm6mbLhCid6v1afU6T?=
	=?us-ascii?Q?FQFfxr8z1Pqm0r/vlnOanO/at4BjXVk98DkxhfQ3huPu4W1m+z2D0AI11mzw?=
	=?us-ascii?Q?3mpc3Tsl/G4qyyg7fYhb5RI4qD4hwHgPLFSWFuk3WQa5vqRUeS57dZw+VgXx?=
	=?us-ascii?Q?k5NnxeA0QZY/uaKqVjEZsvZOIUf1EnGKwIZLu/cEuErz5dIHWJ+BpMZTPkKc?=
	=?us-ascii?Q?IuSKmQ=3D=3D?=
X-Forefront-PRVS: 0368E78B5B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB1194;
	23:9+k9o4JJTB+RT36KKutYXfebn3lv27KgKLpFIGJ?=
	=?us-ascii?Q?Qkft19+nj+/95EhbwQuRPB/sL+WlgJdISO3YLo4p9IFTK6e2qt4lx4kzVHWn?=
	=?us-ascii?Q?JYJDlK9efRzerZ+RhgOpJZe4+IfCp3Tc2MsXCYoKrooUh7fawBPdQnIUJ6mM?=
	=?us-ascii?Q?yf28z4jDDURMoavEzCpNpyXUSQxyGyqOZhgaiCYUVdqIk38+VdIJ3jExYH63?=
	=?us-ascii?Q?qA500Lvz9LIgSWOfRVEvNI2wHj05dfYjzhLJa3hbTiCrElTnebSU4Sd//bJr?=
	=?us-ascii?Q?pIBMxNY5xOJS892CCQjCOV8LYq7QBbJTOON7xfb9nmlJYMRzvS22bEDI17I9?=
	=?us-ascii?Q?FkSEY7jLUvF6G/9HMMpugFcS3zMH2TZHZCeKrb5im6RVf3gtA8ywQOAYit2D?=
	=?us-ascii?Q?enZlwlBVNDZMI1qGlh6i7LLaGN4AJ5jQgvJxTMof6TE4l0CViDb3le/+xOCo?=
	=?us-ascii?Q?XEJ35J1OK8R+OR2d0XXlmIa5rAchk9WTg9+FvNQWLjd6UT8u9VLVljLZEgKU?=
	=?us-ascii?Q?dEcAnZQ1AG7rypxy2Xnvr158SbFcSOLervoNOG/Om5U3C/Y8bleAw9m1klFu?=
	=?us-ascii?Q?TZRrr4/3k/QLU4RcyHcorCl7ghyST4U95PAtHkXIdMdVt4Bax/8sIL35iIWP?=
	=?us-ascii?Q?3/uvZbsD5drk7ukIKPe9HN/n8R3Nbv7NLK/E4i8mPu3VCRiWip76GkLtYpxF?=
	=?us-ascii?Q?evORbNyp8FGKC1Bcj4JMuVFGHJ1SFHVrB16zWLMUeUhHwf5dIQCa9NcRf0ku?=
	=?us-ascii?Q?cq5E/rFgqRLV24UEnVDCNEKUBGYo3abhU6muvWVXSm9bbsVi0UL1nnJUXXx1?=
	=?us-ascii?Q?AQpS3qmp36F1Y+wXPZphqzClkzZGYYsq/xyY4oKsGWSmS2YD57zXfNM1gcJ6?=
	=?us-ascii?Q?AM9GZ9zpJlE77ptQzePfYJXPklpyOAYUci4CXPfVLzcLE3qwMmd68jVD9HXS?=
	=?us-ascii?Q?FzfLouU+BufTRCUyX+ffDO26hVYL2YYj+e4/I4vUcWG7EJN6Bt2c27ZuQC7H?=
	=?us-ascii?Q?w7vz0itSJnDRnW74W1kbM1g+Pp9wpAhZUt0yfglOi5TpnMvLvLJKflKqE1fg?=
	=?us-ascii?Q?jS3JizgfIku+48CZOvBZaQ80tuElH6vQRUIsXut6mWvObtXeh3qL3GBkx/LQ?=
	=?us-ascii?Q?VK+tgACM8qr7J4SDZHFUAQ+2cw1/U0pnamFupStOWBv89WQJw9pOhSi9gqzj?=
	=?us-ascii?Q?PsoBkKt+C+qRnl81E5banQkNZbAby6dzk3RZPaYIKjy8maYZZ1HAUJPwofzb?=
	=?us-ascii?Q?7er7wUfiAMP9GnEaWmf/5WTXV1zA4jnZWK1t3rZhUMdqyEUmOHB2QX3ucOY/?=
	=?us-ascii?Q?sQg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB1194;
	6:xITpceC6Ac78TN1JjzAGsBMl0XHTB3ln+A/O4JNj?=
	=?us-ascii?Q?brW+3DWGwRDdGu9IK7n2JATUAgpW5KFSbg67J0NSEPBuV082ZP/Fo0hIDWah?=
	=?us-ascii?Q?dbFpoe+eFKGW1zHpqmkplGFoGSupSqeDF8kRafYoQOAxNfhbkLTKb+6iQ3wr?=
	=?us-ascii?Q?t+AkdG2I25KEoRUKQOGz0oFQpyBAU06DyDKpz2qWa4A8QjDg9rKL27PHNrQi?=
	=?us-ascii?Q?7SOW0L2fbIimLzzAuTbi+oQngDtovZuhywtQs6vJM6oOjU0OetnVfbK/Hx47?=
	=?us-ascii?Q?yWn6rbA9g3JfpZlqSZxULrZUwa0yvbrYpCjWD8+rVkSfBrLijR3yIRndVNpk?=
	=?us-ascii?Q?hwZy91uM2Wh0IPdheMeUuQ2tMUvJEkcG5NsFfH2ePRgZvRlm/lrskt6RSYSk?=
	=?us-ascii?Q?iMr7v6qBhQdEyIDHtGv2VAuhv1GkO6bi6V+gnty83k1tHn5bE730hb4BlC6c?=
	=?us-ascii?Q?VFKVYA3OYYQm2r+FqsFzziJJcnHVIR+f5JmLbUT9uQUu9ucSjCNexLLfTMz9?=
	=?us-ascii?Q?YK4dW4+OMfIkeD3OPg5xAqdQ8+7HXWN5ejCmssTCpAFvU5aGBhdhl7/EsJFZ?=
	=?us-ascii?Q?ZfgBP5PmsWawp0UnE7gU8hn7ikmZz22qCjZApAWIjODTvlVG5vYGm932Yc+G?=
	=?us-ascii?Q?ano+ZDM8KckMvGIyM4Qj5u2mAgrmkLRrWnQhvuul9IZitxKJQ3Vwz+4Wsph6?=
	=?us-ascii?Q?ScsTB9L//p6EibH6R1x29MPoIbb2n3ELsvWXsGDGLj/KfuXPCUHY1aPcU3J1?=
	=?us-ascii?Q?vKW4E22fDfSGOxWEdpCt2/ba4hTBDoKKJnudSAl3pWYqZDjQIjSV9E1djUp2?=
	=?us-ascii?Q?7gQo0JrwjjN0Ci3cpWJ63z9A4WRGXeJrLcgBaE49e3YtiURNlKYHxdPmOpoW?=
	=?us-ascii?Q?iJwxFAfVgPrT7r4c4iavlFQASFZLArNihIMO1+yNOnVw0yds0tw7EUssZQ7+?=
	=?us-ascii?Q?vnEqg1gReX6L4Akp1hWvLVknsyphMoABe+FMEJHgMQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1194;
	5:ONR2uApW94/3uJSLaXFMTXgM/DNfHy0M0FizUjRkdz9qa0+xdYpxmy3daFgaC290GrpCBAZhGlFjUmf8MPgvg/jJzCCLFGgtMTdvmKADl7ufs/NVKJsKcjyfi8mzWkeQknAcNzRvvCT6hO0dweU9bA55cORirhPzOT8g3cEmtGkYzrrsbxepXFdSdiCcCLKGK4qEL4nRE7ejPNutP6YRozzlskC1OihRglmjluHnpwNolaecGDK3TO/Sa7ztYM14CY6LLHxbI+RV7Jh3zPI3NqrjmwQxBgMVaYKnqR3C2/GcxW9uLjYMFmkBSksdbiwiTax6Uj/ZfcZWebJNQSS3fv2PbXyhJXo/dWtBQddIZKgU3SKwSfnjzskz69MifMDIJBtN/EN8okRYNM2ogo2s903lRVUpV8PoXBKIBepOT06lt5e0tYOOtgwP7Tub5C6JrMo56PqsgDdZl3QAaaoARfiAqQmKwIPDw3swmWPidfhmvaXWym3Ln6bNVQ4clf9YVG7cXijP56pF1rwzIOCgkg==;
	24:XqrzYE1l3tQyx476ppi8iGzx4cw2WsjjjGaPT/r7UuqyfclndCHE5aAsZ2OVqP30gGc9lrSK4QslTGKbu2F+0CgbuMExOhTqCJSoNtWOymk=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1194;
	7:p1u+rSJURDreXPfOk4SK+0j2f54xFHi4cjIlTUYeKgifibgGX9heZRRE1Pje+Auh8HwoHyIEVh5AHpCv5akj/lvXYCyrbdvtwkc3QUTegaP7Js6Ru9wZblqAPIwVYvmQeAK7/fzlyPDSvYrTTwn00L2yRgZh/ikp1HiMD6RBEQzZLl0n0xpssR47avA6K1lsdJl7p7penOehH8Nr3d+x57rQYr19C5zJDMClKZa9jdY/s7H0yEvJKK0CVTPzqRYeuTgbvoOY9gMvjpFRE0rqa5NoqfAn1+YO14YkSLBqaJUTayHH9L8QKqNaahZ2bxJJJrDgI918Br4y64abMyk/qY3gfWE/K6Aq6T3DrOZ7IDT9MwxCl54aTWSi5oiaBiTcZH6cOLHtMzHLsw+VQ47O2gXafbbxyCPSDqfo5aB1djZLNgM/Lq3D6VHp1z/BN5/5QqtWre2u1XiktUGJeXbdrGWjYXr/0emoy0jx7t1M/CXpSRo1bnynwFk+DxwyTiPhayJiyrLAxnd07eFLIpE3mZ4HZHWDpBd59PS+P9HrLV8EOEwNcT8LplCEh1AJCIcFYCsKHhLTRE8Ev2gPPlhi/sLBzQe5y2zzFTP87QWCTdgiIcvLncPgyACDNgt1CC0B+bXA3cz/SIXfe8BclnHQ/vm1yO0WXU0Mr9Z2IHHQiiKyP+9gt9CWf4wSKQx+jusjVtCplqpm7OwWwpZUFTUAkK2qfH9S90SrEPAnFZbjtJEzcPuOA7BSPhiv3fEebaFN50xczxRTCcoOonmKgjMJgaDZpQWKFee005QNeW8WBe4=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2017 07:27:38.2694 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1194
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.57
Subject: [Qemu-devel] [RFC v2 PATCH 1/2] target/arm/kvm: Translate the MSI
 doorbell in kvm_arch_fixup_msi_route
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: wei@redhat.com, kevin.tian@intel.com,
	Bharat Bhushan <Bharat.Bhushan@nxp.com>, marc.zyngier@arm.com,
	tn@semihalf.com, will.deacon@arm.com, drjones@redhat.com,
	robin.murphy@arm.com, christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3WK+LysS4a8/

Translate msi address if device is behind virtio-iommu.
This logic is similar to vSMMUv3/Intel iommu emulation.

This RFC patch does not handle the case where both vsmmuv3 and
virtio-iommu are available.

Signed-off-by: Bharat Bhushan <Bharat.Bhushan@nxp.com>
---
v1-v2:
  - Added trace events
  - removed vSMMU3 link in patch description

 target/arm/kvm.c        | 25 +++++++++++++++++++++++++
 target/arm/trace-events |  3 +++
 2 files changed, 28 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 4555468..5a28956 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -21,7 +21,11 @@
 #include "kvm_arm.h"
 #include "cpu.h"
 #include "internals.h"
+#include "trace.h"
 #include "hw/arm/arm.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/msi.h"
+#include "hw/virtio/virtio-iommu.h"
 #include "exec/memattrs.h"
 #include "exec/address-spaces.h"
 #include "hw/boards.h"
@@ -611,6 +615,27 @@ int kvm_arm_vgic_probe(void)
 int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
                              uint64_t address, uint32_t data, PCIDevice *dev)
 {
+    AddressSpace *as = pci_device_iommu_address_space(dev);
+    IOMMUTLBEntry entry;
+    IOMMUDevice *sdev;
+    VirtIOIOMMU *s;
+
+    if (as == &address_space_memory) {
+        return 0;
+    }
+
+    /* MSI doorbell address is translated by an IOMMU */
+    sdev = container_of(as, IOMMUDevice, as);
+    s = sdev->viommu;
+
+    entry = s->iommu_ops.translate(&sdev->iommu_mr, address, IOMMU_WO);
+
+    route->u.msi.address_lo = entry.translated_addr;
+    route->u.msi.address_hi = entry.translated_addr >> 32;
+
+    trace_kvm_arm_fixup_msi_route(address, sdev->devfn, sdev->iommu_mr.name,
+                                  entry.translated_addr);
+
     return 0;
 }
 
diff --git a/target/arm/trace-events b/target/arm/trace-events
index e21c84f..eff2822 100644
--- a/target/arm/trace-events
+++ b/target/arm/trace-events
@@ -8,3 +8,6 @@ arm_gt_tval_write(int timer, uint64_t value) "gt_tval_write: timer %d value %" P
 arm_gt_ctl_write(int timer, uint64_t value) "gt_ctl_write: timer %d value %" PRIx64
 arm_gt_imask_toggle(int timer, int irqstate) "gt_ctl_write: timer %d IMASK toggle, new irqstate %d"
 arm_gt_cntvoff_write(uint64_t value) "gt_cntvoff_write: value %" PRIx64
+
+# target/arm/kvm.c
+kvm_arm_fixup_msi_route(uint64_t iova, uint32_t devid, const char *name, uint64_t gpa) "MSI addr = 0x%"PRIx64" is translated for devfn=%d through %s into 0x%"PRIx64
-- 
1.9.3

