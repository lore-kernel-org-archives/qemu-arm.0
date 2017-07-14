Received: by 10.12.150.144 with SMTP id a16csp521466qvd;
        Fri, 14 Jul 2017 00:31:16 -0700 (PDT)
X-Received: by 10.200.45.182 with SMTP id p51mr10586902qta.208.1500017476004;
        Fri, 14 Jul 2017 00:31:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500017475; cv=none;
        d=google.com; s=arc-20160816;
        b=iZAWoc4irXJ+lp6fBu9FqqH19aAXEZkpWOLkhDjknUEp1lHQ5xo3THIHm+1vpWq90G
         ASgPXeu7Z6E26jcDD9oRUXekurDW1SBcKypGTBAHV19zLK8uBDzT6wb62Q56Bu7CpeSJ
         pjWhTvp65MU1xyC2EzLFh9q1X7hLSnXY4lwwsb3dvUgIgyqc7l9tY/qyAH2uV5LaV8Ls
         CJ6ELIIy6GipCu70kz5c3IbjU6qyi6HgRKa1tFo4BnCiJI+7Xhbj9ZaGeu2yu9lhbPL+
         /i3M0oLLzHI9tVjm8+rwSTXpiLpHEjzyM4S1lfsNeGZlSGwvPMom08U1ugMvhpC4jGe+
         vvAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:arc-authentication-results;
        bh=PEV9XbrjciR0eIi1AEB5UB2qsaL+Ut1x+9IJ68U+qUk=;
        b=KPLBmXFwZggkBvMqxvufehncGfMjgvLyVXLYgPHJqkObt9ciX2cdemANF0+Cb4cnMk
         w67RivGFqmUwkKwU015ksjsQ1QpjlzzlAEUPOTPkdH1f28wbNEIDJb/JWeTjYX2fukdl
         3ErYeMg7En07LSTdFdqDFV33AYGsLq1T4e+KZjNIYg7IzTWJWayytSMYLZyhPJV9lrFs
         6x8koEazNHo23V1VrO4RN0zA3lefI+XMrxQoFrPflBO+875ggoLjWDVuMw3H/ejKOQGQ
         64lCdBAlJifDKkZUd/SQhwt49LCvaaLGDm7PKStXpVrStzxPMEM2o0rugtZ2OTyndUTt
         MQvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 30si7169799qty.275.2017.07.14.00.31.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Jul 2017 00:31:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:35963 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVv4D-0005i0-BX
	for alex.bennee@linaro.org; Fri, 14 Jul 2017 03:31:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1dVv0w-0002bc-ID
	for qemu-devel@nongnu.org; Fri, 14 Jul 2017 03:27:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1dVv0t-0002jd-Cz
	for qemu-devel@nongnu.org; Fri, 14 Jul 2017 03:27:50 -0400
Received: from mail-by2nam01on0078.outbound.protection.outlook.com
	([104.47.34.78]:31184
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Bharat.Bhushan@nxp.com>)
	id 1dVv0s-0002j5-Ui; Fri, 14 Jul 2017 03:27:47 -0400
Received: from BLUPR0301CA0010.namprd03.prod.outlook.com (10.162.113.148) by
	CY1PR0301MB1194.namprd03.prod.outlook.com (10.160.165.25) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1220.11; Fri, 14 Jul 2017 07:27:44 +0000
Received: from BL2FFO11FD037.protection.gbl (2a01:111:f400:7c09::189) by
	BLUPR0301CA0010.outlook.office365.com (2a01:111:e400:5259::20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.13 via
	Frontend Transport; Fri, 14 Jul 2017 07:27:44 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD037.mail.protection.outlook.com (10.173.161.133) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.1.1240.9 via Frontend Transport; Fri, 14 Jul 2017 07:27:43 +0000
Received: from localhost.localdomain.ap.freescale.net ([10.232.14.21])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id v6E7RPn4029590;
	Fri, 14 Jul 2017 00:27:38 -0700
From: Bharat Bhushan <Bharat.Bhushan@nxp.com>
To: <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
	<peter.maydell@linaro.org>, <alex.williamson@redhat.com>,
	<mst@redhat.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Fri, 14 Jul 2017 12:55:04 +0530
Message-ID: <1500017104-3574-3-git-send-email-Bharat.Bhushan@nxp.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1500017104-3574-1-git-send-email-Bharat.Bhushan@nxp.com>
References: <1500017104-3574-1-git-send-email-Bharat.Bhushan@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131444908641929946;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39450400003)(39380400002)(39400400002)(39840400002)(39410400002)(39850400002)(39860400002)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(9170700003)(50986999)(498600001)(8676002)(72206003)(105606002)(2201001)(5003940100001)(189998001)(50226002)(8656002)(54906002)(356003)(48376002)(68736007)(81166006)(39060400002)(626005)(2906002)(5890100001)(4326008)(53936002)(38730400002)(106466001)(8936002)(76176999)(305945005)(2950100002)(104016004)(47776003)(50466002)(85426001)(6666003)(86362001)(5660300001)(7416002)(36756003)(77096006)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0301MB1194;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; MX:1;
	A:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL2FFO11FD037;
	1:blE4+HGs5SGeUwZVu5O0DWLHr/D6HgwsZyp6/qNbOi?=
	=?us-ascii?Q?ESUK2eflJSDu4SvCq8CDo5hnrNzFA/kGlbRLgUfzKDRb7LlC0W4hSy3ueHNF?=
	=?us-ascii?Q?rXaELbQsPiBQN+IV5WsTgjACco+A9CPeAaH7wZzvD1oaXCtzhMqZKuBC6Dj2?=
	=?us-ascii?Q?5YSJ/il683EWHGsFMRKqjAxVd5stf1AB4fKR/ZjRQY9ySvul7qz3SRU2CH6M?=
	=?us-ascii?Q?9h1g/ydkX2eFA2YSVA4ahEYkGukBYO7QlbV5fUxeAJoJk3geg6g08Poe+s8C?=
	=?us-ascii?Q?joUuFXnheZtn/EqYGw+HKnypU+ac4SJdRSEjUfGQ1W4jjOZVS9zkorea5JuY?=
	=?us-ascii?Q?ril0MRvgr9SoCdC7gubQ+JJeODaa24FLonxP8OFTLzvRUnrvPQ5BaWi5Gw0A?=
	=?us-ascii?Q?9KkW2JtNRi5J58NPWOVF5bhFcflz1qzX5PPK1horjS6Waunh+pL7xQobSI5+?=
	=?us-ascii?Q?ChKU4b0H5zGWncdG/GB9fK9Fwv1NKR6U4B+e9J8y8qIdV7J8Zd0ox0AkOX2C?=
	=?us-ascii?Q?zMpJ0KNwoZN7RkCfTiFMbTODMKFlO6HXPTyeazFWKlKLhv67Q0MI6sjS5adm?=
	=?us-ascii?Q?hy2wtXZddLjxmW9lHfGSo7cp0/GOceZbrq5ibJigj7io3sPc/Eqf696lk0et?=
	=?us-ascii?Q?R8ImIhEOw3XWfmBusOirCDd02wso8BD/q0QkbiZcNmhOrtacwLvlsZ81l0s0?=
	=?us-ascii?Q?+/4Fw9lAsLTyz9UW/NwVX1KUC9CYewxikV2+EvLKQD6jcYXa+hP5C1gOZBqR?=
	=?us-ascii?Q?JXdPLNl+23V5bD09ea7RYlAc14AXbQOtHEK0Vh7m1x+TUvr4hbVDbK60qsmK?=
	=?us-ascii?Q?1EXoOWSer0GYZU2xfHz3jg5WbeD4ToTBybcPsTtN7yXbedeGvQMjziyZLz9+?=
	=?us-ascii?Q?fAPcFCViy9DUBqQ0SPTlZLzuENJDuRvsiZ+/pj3+uWj2H8PnSWfsl/lyKp5N?=
	=?us-ascii?Q?Br8mKpY005CclKgWcqQgI0KyYRfbbmA8wPDeEFlk/JulFzLcCsogcQSiCZFp?=
	=?us-ascii?Q?Kyu8OgAPfBnrBWOhey84AWbKj2g+aJOPhKFXnjKCLqYyvgwUMBpjbe2tkAdA?=
	=?us-ascii?Q?aFm2BDLoaRx8bJRfbntsEFzrS9?=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1a04fd6-6a8b-4596-6979-08d4ca89d197
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(2017052603031)(201703131430075)(201703131517081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:CY1PR0301MB1194; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1194;
	3:2eZWIpR1M57iHbP3gjJWLl5wqPUUpieElNKE7g1AFH7dSZSQR4lHKbE3vyLiodNdF3eEWPmepHMgAExYrSC4N9GWvRuMdGUdCeyeskNWDQCLNbGd/+C15MNI1pErvyjb7ndEt0RjUTvVmjmnBnNQasw2yaBrKwIlHrNa5u3Psh//QsUu3dBz0vZ4JSn4pQBXvsYYhP3uy0IpHVmihCXKpKUwGvYD3WuyZezqoUoUSxPja87x2KZOlDVhHFPT73NT3af926jRrtY0WIUVJtW69esXm8KFxT39uERLgyehLJvwvKZMeaygNZ/6Kwg5szm56H+aUJHvz/gyV4evTbk5u7CAGiQIUdjUWRUj1Rd/1wQjZBMvOxr2aPwvAy4bHgTjGzuZkF6hi3qtqB5dWP3N/o4iebZ8YgsyLEjFrCiKcd+k2ijKM5YA8C85IOhxnvv54b3AN83SphBfegwkCQC+nZN4FEtlV67/2rKn1NQx4l6gjqBWCce4W6T/r2qcIpDhr2KXtw1Gtmh1ywxVQVGtkTOKrWgK1vpsMdMDfr3oZkaM9ERCnMebPaj2j8DcjcXM3gBXtOTZ65/vu5rGcqJI5rA4LA+y6GUVRzu/PkyBqhj1LcI4ZEU1AfjVh5BPO/WfYvEfkYRvx6fTzld9DSvig/Ix9nMrUgZG4atZ5tLBEn6Ck45uTaGOTayWGFsIW3uPRqqFg6cz0fZ9QScBhkLilEvnMQkS0YqeDpzUO+QDsYstbL/1riaFoq0EdsIHOw1ED9jkEQWubHtFutf2/9FB+sCimw2LFmptyKT0s08LwegIeQsZkzi20pDectY0fqXB0K3VziZMmopBfdSRSdhr37ClZg1r8JSDxDZkca8MWfU=
X-MS-TrafficTypeDiagnostic: CY1PR0301MB1194:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1194;
	25:Co8KGC3Xz63tcWJgbnt2xDh/qT3LqC2eOpokBPf2C0xA6JC0cWbpoBTGKuZvmPkWlNIPbJGSPY3RgRREXVzYx1eGXs2IKpVkB3iubjb3WKjhknIviHJZp6SfkxdHvjA9zmMJGllLwBHNhsUKwJZoA6pNC89PQvX/h/DIipMYB3ntszuNCcSdQ2+f8ADvKNzSOZqOYV8s51e21mDq9EHJ5hB9XDXP5OPvuu/9MLta9xfogdyAljd/d7focrf1pzA+J/Yus+gMOwck/R8pbJu5yff+sT94fADtNNZFFoL1kmEVTA8zSaFBPzoEpgNiZMeJU2uocMZh8COxj3xMvmg2FHqIvqgdimNgXysSPWCzKTMNnen+frmrxB0xcqjHnRmnOMfMtaOkO+9u2Hxtl9bWcLnLUxsR9MJ5G+hUCyFYBfg3KLyjH9A/2vycm5KInVNLzhSrBAswJ1MUpBN17fgxSSQTf6ZDigPQ/4gt/LFI1vOCbsqoV7HOPTNLMhnCbtFGt5D4pI2EVWMpCTmATOvMgAQ1iRy5ZUCVUFkj5lnyGyYPD3o6vQVW5rdse0bKLn83cClAWGKHd5A7A2+SBAeU+iFN59R+Ag7Lcc7TJhP+bRY6BHHLHTBrBVSd34/rbsWG5tYAXHmnhrwj1tiflYc/fGreGO6mBo2Yc9OWl4Aujpsceh429SP2+mTNbOTfu99gKU6kx+2kcuqvMZaZSJrOzWad2Eg0D8U2ghQIY516T6NTGuVxR0D4XLELxHc78xTYDZHc8reC4dxyka1ptB4kclbtgPwhA6LjXsJZpa6adG31jtFAIqV0uGJuqjMXMN/IRre/9AP/tfkKiKN4QftlR2m7URpR4dGtO0hHnom92LeGu1p90A5KVCilJ44VHH/poEE92JkopBxca5h1no4pGyz8J02CxqYoJSEQ3Z4Zo+c=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1194;
	31:cVQXlvZAXUigAXOKIyA1/m6y8h4yExNlE5BEKI2lnKz+lnCqK5W+JyN7HN/ZiDXRBD/hux62fhkkuBFkxBSXJXJPEKfr18WoU2gtJJr9/zXa5i0sm9XT6qtAkssanHw1kABx2L0LQnjz2o1Bg4yaHMijQswMvGOvKv92pdZDm8YQ6rWsorhU7LILCczEEOQnd4kLjBLWo0I+D4meeTZZ7d4MZxI8zxqGsmdN7dqhGaj26sq21nIKzzrrTQpGDpA91kiM4hpnoqU9zK9M0ZoCqOi13KirSYzMRSJ3wC9AnZm3aBnD01sgdpqcWXhXFr+zgO5aMs2SawrbJqynap5UOm07HAPjbPaIuaugDRkA35afFbVFaewPRMPfb/DnG55Ac0kttYZlEreNwn+5MRTX08ghkCqPol1rCqaVm7xF/OoCwEStMzJjz42hsdEhd3JUgwwvUDxTCP3DKi6XaMphoFssUe33Qlpd5MULPqcWhXkXFu3bZCXHJ7d7vx2H77no0F66wqgYLSFGFmG0y8vTvuk/WyYV68sRlD5XjZu8FGS0bS8dmHF/vaO8qlFFRYrhiDGB7VAQEIqIIyFFMNZr89ODnXra6Ay/8oCL+0YQxGglUpdXtpXJPqg7oU6wRw3RLKBpXrwoSXvMzrViHTmGRqWdMx17mc6Uf1FcefF7cS4OCMlJ5mKNA5n3M2v9INvFySJhAQMXCLY/Zpo3Iae8Hw==
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197)(148574349560750)(167848164394848); 
X-Microsoft-Antispam-PRVS: <CY1PR0301MB1194C6BBDF8D569F0895E0149AAD0@CY1PR0301MB1194.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6095135)(601004)(2401047)(2017060910075)(13018025)(13016025)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93001095)(100000703101)(100105400095)(6055026)(6096035)(20161123565025)(20161123563025)(201703131430075)(201703131433075)(201703131441075)(201703131448075)(201703161259150)(20161123561025)(20161123559100)(20161123556025)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY1PR0301MB1194; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(400006)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY1PR0301MB1194; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB1194;
	4:+CK2cUsi9kYMIwKlcdU+z2bnbrWUjr0Pnopn/hvc?=
	=?us-ascii?Q?+JwlU4B/ovVShOIG2pCwBWeuoYKAVZF7wbLMuQEPFNLF6gktVcdYIH27X4yg?=
	=?us-ascii?Q?WQwpW4pQpeVjAZWSsFHjTRuuRQ+STPty5sUnPDSCtgIYqV84epbHMfO/idGb?=
	=?us-ascii?Q?bpVXZmImyDwDN5aiPkAjnovBC9LuojIBTfmrza3APulBIcYv3p9KRbKfeYio?=
	=?us-ascii?Q?YJxLwbPh3gSly4rLkBkmArd7Sz/x2o27dBZjBZ7J95CjJnIYAKaXz9Wrb7g0?=
	=?us-ascii?Q?WjGNaweSlOvdaypEOUdlF0d4Lfv/PrvN4Zu71SZo1uAKl9vYOQ68hRL0eJjA?=
	=?us-ascii?Q?TUFkI4rxVUtoZAlpe7gyANMRhnmnkDnjyQR/Qj81dBNSj83ujnJ5q2SPHChp?=
	=?us-ascii?Q?r4OqlXSZZhhPGFIn8mBtlu7lE6DuKmpT2DftpPhnccBwga89zWDFcIh/xiTG?=
	=?us-ascii?Q?ThAUBqZaUX3ZdbDTj/ADAVXi1/tyYR2OBy3MFoainKVmD18OU/+RdU2OEHg0?=
	=?us-ascii?Q?1GmXKVvOif7EcxVkFYDDh1zikidBOpo4sHBzRBvblcYjAtXcDClGYYDHt+Gz?=
	=?us-ascii?Q?JDpHlCDTksDsedauwIbU2vWdHCJKAS9j6+ytWQPWlqkQkw2AmbLSoFUU5jQ5?=
	=?us-ascii?Q?k0+lddkyXW6cmPPaRFcRDTEyCP0qlz0egUaNOPzYseWSJfKWLUyuBvTvWGjd?=
	=?us-ascii?Q?Z3VgShOWF6tDKJe40GTjerhfYSRC/zToiMRcu+mpILxbFGu7V80EUfgz7T1K?=
	=?us-ascii?Q?th4HDvTrOIE95Pi8x9BrDJCfLBydmhl/LK8dv/hl2cYERIj03Y3FIhHSFgr3?=
	=?us-ascii?Q?qg6FgChgNduagnDa3E5kssYt9rAUBL/R7xmNvUmOqUQS3Is8anjD3/JXj9H+?=
	=?us-ascii?Q?qzt41aaGjPT5r9ejLOKYUHP/jtYR5LD1FBSjVC9ms6DA22lSKkWNoRFHXU1p?=
	=?us-ascii?Q?PtlrTcMr99hFwsO2VlxGJw5o+ZS/eWCA7rLm/Tz9uriieK0Chal116TeaG0k?=
	=?us-ascii?Q?4bFjNRyHsxIwkFJx425epqGByhUZlKFyBcLHBLViIDzCV4UAGeZwlRds+uFP?=
	=?us-ascii?Q?sGP0FdNyw+MoY6Ubl+AyFGhmA7b5dPs4vfeu/rWGw4884EertiyCwoCl1au0?=
	=?us-ascii?Q?e1WQTuRJenPQRp/8S6olW1ZC5wHxOVZT5Z8PFjmqO669pqxTezeBeOiL+FSB?=
	=?us-ascii?Q?+acpqC23BM59JRh9p7YEdCZvPZKB1SE+OIO2nKq7lAXodQgZxpIgQ9GCgtMs?=
	=?us-ascii?Q?CSrIdyNE9+LBLm9m2l9r+OHb2OXReaEUD5pcsseifpvXWdx8n//rVnRsQ8yx?=
	=?us-ascii?Q?LInVwBRy8q+SlyXhk8mv3UcTAOmA9hAcjyz2FUqrNCZzG8c9H8/VtMXElubA?=
	=?us-ascii?Q?NGN3jw=3D=3D?=
X-Forefront-PRVS: 0368E78B5B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB1194;
	23:34spCzI2VyywH7hph3yKWi8y9iG7bOigxSnzGLV?=
	=?us-ascii?Q?Wv/JUEhkqYMDvJHOfm+h0NAVWzBpZqZqO79S2MUE9a39o6Mw5esKLcaKnTaL?=
	=?us-ascii?Q?we6/yWCqRcQmPa/njpzoENvjZLqC4/7lcQU+k3tI/mampGEUIQEYfcLt2kxE?=
	=?us-ascii?Q?p//SXT8aHw+RtlJmr2xgC+5i7Qa2qlTLl9XRX9qhmdWEqSLfiSjWBDaR6zXW?=
	=?us-ascii?Q?MaAKRzwuqiGNDxm/y5itWotk40+9KQ3FHt/kmSqXP5n/AuPFQ+YHfd435lQo?=
	=?us-ascii?Q?0lRdInYO+IXs2ANX83sUqYXNhE71OMGnQl4FThoq4jsq3574npQHA9BFv64C?=
	=?us-ascii?Q?lqdyiOA6I6rh042MAImY4yRhKqICjcG9gUroMQYSvVc1X+DbyazDMjtyjVIa?=
	=?us-ascii?Q?Y9UlLdP/F/IRzUKcR4H2hKPLT5adJG5fHvEWGbBDYdn3ZZFB+9hFg0I8+RwZ?=
	=?us-ascii?Q?eB5p1sGUGNbRAq2vbVqv05G03pAJgYPkb7yB2o0XyCzTypPg973LenwkTVFs?=
	=?us-ascii?Q?9orrM7x//VumVA+uJZKvs/SvpJLh1CCqcRWpUPk60gQTg58KOXVOreBFL9OM?=
	=?us-ascii?Q?0EYlqUJWMdgYoHBj+aTG862n60ymjX90kzWOQEd9bWyZtRj4x8QN4sdudwXP?=
	=?us-ascii?Q?udYTiVOSUnjcPHOWDEGRbcmvomrZ6dsjVeYM8S7KlX9fHSCFkcT/vTiyTTGd?=
	=?us-ascii?Q?nIATOAEds+CPdMyP4zOGsBFSavlCHMUZnwqQbxh/VFhdHa8p1WtuAceuHOmK?=
	=?us-ascii?Q?dERhZWNHA2vjCj4loWpS1hpXyXQdLi2efFD1IhY8QChRbYN6nXp2+D1hD4mC?=
	=?us-ascii?Q?OykMjTYTeYUJefigbLbaiEmbHCO3bM0v3Iyj93+3O5IAAyB1OhHZeVdnIHR0?=
	=?us-ascii?Q?IXv2iuT6Cl6ZJM3kpoBsj5ZcrCQMvaVOKWN/LTDZkuQc4TaYEaex2+2uAXEC?=
	=?us-ascii?Q?NYwf87R2HHTVCLHpxH10egS8/KCMpVkTatyWyrIs5QMU1GZgVgFdiQAXJl2/?=
	=?us-ascii?Q?OB2rJu4yxzSr6jc0xoyBhg5c3o+N4uQCbm/YjJ+ICeCuun4Ie5ShecD1r5cV?=
	=?us-ascii?Q?edcYj/fxZThP2FytGw4HM/zOoXjhPKKa+kuC1eH1FiN0mdBmRniqQJIOWL7p?=
	=?us-ascii?Q?VTif7GJFrqj7olN1zdClNG7tYpbanTmgjF4HDI52F2yklrCfwp9UEFL+l58A?=
	=?us-ascii?Q?v9qPOXZJOgIz27pqP86GE6zh7mYncsvHmZR4TWFeBObqqcGqBeqKotGgT+wj?=
	=?us-ascii?Q?Dde9yNiNPyWyhtNT8LCqtiZs0P0oofwq9/6Vm9wi80YEnpzcnNsYbQrO2TnA?=
	=?us-ascii?Q?YjECpnFwXMTwwgiRrJv2VdT0Bdq9ftmvYJFqSypilDba+?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB1194;
	6:pblHZ+gEiZc0plJsB5z9iEorL4Lfu7CPRwmNTAys?=
	=?us-ascii?Q?9FSwMs0kb2BY8rjynUhC1eTv9gbVPpWubdpgYW47Hoc8E23YD6gsz8gWkUuk?=
	=?us-ascii?Q?57OdqTI4HsVFNcZOJI8tEl8AgQSh0QS+cXl6PM2MaEe4uI6btP4sssmRxdYF?=
	=?us-ascii?Q?UcBrpE2uZ3XKil8+GH+JYAT7hC16JweXJKsSstRVl8NjWzvdaAUB45mD3y5P?=
	=?us-ascii?Q?cqXQ2hn61QlYrx3ZqLiaxB3wnkEpNpEL9Si2FeJtg+0l3KltJz95gX0k31Wc?=
	=?us-ascii?Q?zsWxcoolHpZgGKYTdT4qTXpTdvNVWmv9vEy+D809voHg794Xvp5BS4WS9vXD?=
	=?us-ascii?Q?7PPUbxV2po3zzZn042PeMMXioSiLye2AQH6G63toQhaKWZWinwX58KkUCUE6?=
	=?us-ascii?Q?q2SsrmFkSp51P/H9mYoyj4MlUFnFBVVr1NjDcOOU3r4TqK+AfhfKlw3dl61v?=
	=?us-ascii?Q?DglnF6bG7y1zqkRbyzefrPlXHbENyAFtWOv6v3U0ohbbqXZIgcc3jVON4ZuC?=
	=?us-ascii?Q?5togTkY0ED+Z+1GUn1XVCVQDG5FedI8h3QRBgd4fzQxMoAJ2gF0FnqPfQuCe?=
	=?us-ascii?Q?hvtdwitLemHWbhGIpmwdqiKYeMvNKK6Et/R2sV5LrR8pegfw4vAEh/4VJriI?=
	=?us-ascii?Q?9jpwlCvcbo0fkYygNKHH9J2yELaiiE+6gJ2Nyp932Tp7Cqlvo27gJCR2eWBI?=
	=?us-ascii?Q?88NiiBpfp/15/k9CzS4TgttNIxM5R0TOErEps7ki3Gegeb4oNg401RiyMR20?=
	=?us-ascii?Q?EOhu+YF9PxRwZJ6vUFT1dwGN8OmUbt+1VHyCAxmHQrBzBL4r3IMLC1bL7G/z?=
	=?us-ascii?Q?PTd2pe+DQGaBObXOebDyuJijkh9aSrIvSu6/WilWLLMgXycI+NmzMO6P8r6Q?=
	=?us-ascii?Q?pj1WFPRDalxWnh4bo96GkU7tKMqd2aTz6+h6os2MkwB3cbS6qos7i8XnIVAv?=
	=?us-ascii?Q?1FQWEiMI1rZkTKxxzkXYgga5lzsK45n+S7K9GLugbQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1194;
	5:MPwePL/T28faZKF0Y9apEFmFRyJTY/bjtHEVWX7F9bJgBusicA/1OM+1QoKuQytO76Cayp6Y2pOnGlG1NSDoxQKWGypVdNJeAyNuyC3m2a6/koJirRZLfD1Zd0Rsf+1qPLTlH0QeF8+YQxW4q5Vjjhi8RGE/15p6C00Z/CwAQmf3SzxsHVeHjDI/TRHoEyiU16G+DlO5GR1NY+EaiD80Kwp2aOPPuKQhHNDN8Y4llRbyLuxFhcTRXf/3xNodI5fT7VG1Re3qgTER8IWedT1cxoeIWylPHY95vQphkXtA3A5A3jecAIFzJotu1aGd0+HC9vACJ44YuYr9svAJ2AZLBmd7xs4mzgFD2jr2UwxGXKERZ757EFG3nhLyInT5wGFLlDyvsrBEYNaGdNWIIiTMu/VjePMEAUcqepGy5B76b7BHvxjYNAROo5NTumOctMTYNSs+Q1bi812SKG+T8V88H37VDOF2LlA61NBGPp8iLbMKawvPGiXf/Ty21p/xCtR612UariSftN3IEjou1GtYEA==;
	24:GDfGwbUkYcTlwMf5ReJBRmaKPjOUCwKUCjih2pA0rvwuqqoFftxHWWzf+XcCSybQBRP35F3bMo8h6QE+xeDCHuIDva0jC4RLJn89hxUYi3A=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1194;
	7:y40nI4PafC/Dko3b/BJBqCrl+S4uzpnlhwJcu0G2/mFiWeju4ciND0ugI+YXkNVq1Zy/XbZUPzjrz7jnxu+R9g8JVGkzO6Rhde3PtmD8UQXbDG8wMAIFCIAlsmtcI9Tosk87sbsLmkJojm7UQdSnpTuKru3+vG0Xjs8rMGEozAthc5ykKKFNx6qX7jz4durPrJGHPwZQNfYwPmsXM9yZb8N7zsBmfzFDbytprbCDOkuEKfXOKgH7rVhfrG7stBe9fPCnWEVPOYj/Z544cPFtVI+PDS0eayCmnHCYlN/egKLwRIGdOz9BdhtHYF5Z6MCAlAq5O2tzD71f3DgWNQ6b3bU7OuEqAn5Piyj5PkRzAMw5SKx9at6sWgg9Q4p9d9snA6hlU+3q5gfHzIwZdvKx+SCc61w11eLoXWyJYHfy4ygNw9PaNTYLKpEvKlC8xUfZuCUvWKiPxAmJ0rdsVdMZ9EV3K4itpey6jWeq6aKHeERtY7wYFy7XFuc+m3BBQ3emTCExsAefrOT0X8QTm+et0HqjBJ9c+73GSn2rOA2vIZVX0+fxXTZPT2Qqww/h49jr9oVFJV0MS4oFx/xqlpQTBabiz6OYNnG1BbBEu9Seh2GM9zZk+RI285HeGnFH+gMJVj4bpQLcnyCbaPFeGfNygWj0rIs/Mj5o3C8Vpvd6AgVDqBbMNFx7ei58ku177a1uElyQ4xRmjT42iJZH0SiPaGg25jkkruO6qfHSd2bNg37z3wJTjk4tuwkZ6QCj0BSi7MEYlxDKt0bF4ilALjJmkICU5oBIm1ryOydbcDogd4U=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2017 07:27:43.9433 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1194
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.34.78
Subject: [Qemu-devel] [RFC v2 PATCH 2/2] virtio-iommu: vfio integration with
 virtio-iommu
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
X-TUID: rnnE5GMok16n

This patch allows virtio-iommu protection for PCI
device-passthrough.

MSI region is mapped by current version of virtio-iommu driver.
This MSI region mapping in not getting pushed on hw iommu
vfio_get_vaddr() allows only ram-region. This RFC patch needed
to be improved.

Signed-off-by: Bharat Bhushan <Bharat.Bhushan@nxp.com>
---
v1-v2:
  - Added trace events

 hw/virtio/trace-events           |   5 ++
 hw/virtio/virtio-iommu.c         | 133 +++++++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-iommu.h |   6 ++
 3 files changed, 144 insertions(+)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 9196b63..3a3968b 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -39,3 +39,8 @@ virtio_iommu_unmap_left_interval(uint64_t low, uint64_t high, uint64_t next_low,
 virtio_iommu_unmap_right_interval(uint64_t low, uint64_t high, uint64_t next_low, uint64_t next_high) "Unmap right [0x%"PRIx64",0x%"PRIx64"], new interval=[0x%"PRIx64",0x%"PRIx64"]"
 virtio_iommu_unmap_inc_interval(uint64_t low, uint64_t high) "Unmap inc [0x%"PRIx64",0x%"PRIx64"]"
 virtio_iommu_translate_result(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
+virtio_iommu_notify_flag_add(const char *iommu) "Add virtio-iommu notifier node for memory region %s"
+virtio_iommu_notify_flag_del(const char *iommu) "Del virtio-iommu notifier node for memory region %s"
+virtio_iommu_remap(hwaddr iova, hwaddr pa, hwaddr size) "iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64""
+virtio_iommu_map_region(hwaddr iova, hwaddr paddr, hwaddr map_size) "iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64""
+virtio_iommu_unmap_region(hwaddr iova, hwaddr paddr, hwaddr map_size) "iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64""
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index cd188fc..61f33cb 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -129,6 +129,48 @@ static gint interval_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
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
+                trace_virtio_iommu_map_region(iova, paddr, map_size);
+                entry.perm = IOMMU_RW;
+                entry.translated_addr = paddr + (i * map_size);
+        } else {
+                trace_virtio_iommu_unmap_region(iova, paddr, map_size);
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
@@ -170,10 +212,26 @@ static int virtio_iommu_detach(VirtIOIOMMU *s,
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
@@ -217,6 +275,7 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
 
     g_tree_insert(as->mappings, interval, mapping);
 
+    virtio_iommu_map_region(s, virt_addr, phys_addr, size, 1);
     return VIRTIO_IOMMU_S_OK;
 }
 
@@ -267,7 +326,9 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
         } else {
             break;
         }
+
         if (interval.low >= interval.high) {
+            virtio_iommu_map_region(s, virt_addr, 0, size, 0);
             return VIRTIO_IOMMU_S_OK;
         } else {
             mapping = g_tree_lookup(as->mappings, (gpointer)&interval);
@@ -410,6 +471,37 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
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
+        trace_virtio_iommu_notify_flag_add(iommu->name);
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
+                trace_virtio_iommu_notify_flag_del(iommu->name);
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
@@ -523,11 +615,50 @@ static gint int_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
     return (ua > ub) - (ua < ub);
 }
 
+static gboolean virtio_iommu_remap(gpointer key, gpointer value, gpointer data)
+{
+    viommu_mapping *mapping = (viommu_mapping *) value;
+    VirtIOIOMMU *s = (VirtIOIOMMU *) data;
+
+    trace_virtio_iommu_remap(mapping->virt_addr, mapping->phys_addr,
+                             mapping->size);
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
 
@@ -538,6 +669,8 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
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

