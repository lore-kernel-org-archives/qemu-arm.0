Received: by 10.223.172.38 with SMTP id v35csp792763wrc;
        Fri, 15 Sep 2017 07:39:28 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDRISpJCc/sC1KvfbGbcrgDfUKqqhVHiE2BYNyDVnWlUAE9PrGvqNunIco1Jqpns2lv3Qgl
X-Received: by 10.55.21.228 with SMTP id 97mr7711161qkv.6.1505486368182;
        Fri, 15 Sep 2017 07:39:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505486368; cv=none;
        d=google.com; s=arc-20160816;
        b=LTT15rfGkhG/CuyK0ESCVsbCyuvii8SyWt06h0bu3QyT1sLMYW36F2k0wWJadUyu+q
         tvNCCuIxifoBlaWklh/JyHGU8BC/ByopXJdELK7yanlEMq4Ixk1PATl2mEscUiJzY+vv
         YTUxVuoLngIx/g7YO7ZBUUOFAWeFetAiTLi+gYPt/5tuqP+az/egiFpba8Z8B0ASFJPP
         p6eAAtj1/XM+lOk+Wn6r43I7tCR2Jm8UsztcH8fu9LfsoGXBIH54mcSJotyu98bMPyzk
         cz54EXNP4+qzkt2a6dVHtBImaNQ7fIc7Uvb4yg1NVX6A4KHpUHnKNH7kfgD/2qJD2b1/
         I0oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:message-id:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date:from
         :references:to:dkim-signature:arc-authentication-results;
        bh=spz7t0l1GH2Fl60ZDSOezExc+2ukxISzKjkdv3QW0Yw=;
        b=xgWic9q+NDpUHNwkXt5b7HvSvKqqUhV9YZ700+91n6lRR2yGK1/V2OYEjBiKMcLS7G
         xWTl4eyfTKnD4wA4Vh8xdpsSJ07CCW9x/xP0AASxWQllCWlyGWca0lbS6/WsgVmwpaX6
         Fy+OSoVq/WadMniCCHO5a7NXvGdpAND+tQSg3syBct+WMZbsBsHRCdKSPZT3SSzXkVrD
         NXQagXiQbBBu1USHgZ/yckh3YlQZNeQ9KWEKx/qLC+9D/IUexEUtcKjO3dvBHAx/FvWc
         kgTaItFxGcrIKSpYC8WIDPnS/CiZzhE8V9GXdlu3eYslcT2eXXeCM7PVA3W7khXpTmK7
         kidg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@CAVIUMNETWORKS.onmicrosoft.com header.s=selector1-cavium-com header.b=Xa4JFbr7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o3si1052101qtd.478.2017.09.15.07.39.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Sep 2017 07:39:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@CAVIUMNETWORKS.onmicrosoft.com header.s=selector1-cavium-com header.b=Xa4JFbr7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53616 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsrm9-0002jL-NO
	for alex.bennee@linaro.org; Fri, 15 Sep 2017 10:39:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Tomasz.Nowicki@cavium.com>) id 1dso5T-0005GS-N8
	for qemu-arm@nongnu.org; Fri, 15 Sep 2017 06:43:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Tomasz.Nowicki@cavium.com>) id 1dso5P-0005Id-Gx
	for qemu-arm@nongnu.org; Fri, 15 Sep 2017 06:43:06 -0400
Received: from mail-sn1nam02on0073.outbound.protection.outlook.com
	([104.47.36.73]:34368
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Tomasz.Nowicki@cavium.com>)
	id 1dso5P-0005FM-0J; Fri, 15 Sep 2017 06:43:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=spz7t0l1GH2Fl60ZDSOezExc+2ukxISzKjkdv3QW0Yw=;
	b=Xa4JFbr7DdyW4l0qRHWI+MVgOOnK71W3vc2YnnrJfWxKlyrCjUuxFouA5iQX4ZOkK7cHoMmJ5q5f1T1RC261y6opf/yqaYKXz8Zd+b8DO8YQQBGj3pko5sLRq4owxMS4ip4JmsA5gPMzhydjsmZ1XYV5UpD6QaglZGCtrxxTtBE=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Tomasz.Nowicki@cavium.com; 
Received: from [192.168.2.100] (87.116.213.6) by
	MWHPR0701MB3660.namprd07.prod.outlook.com (2603:10b6:301:7e::11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.56.11;
	Fri, 15 Sep 2017 10:42:53 +0000
To: Auger Eric <eric.auger@redhat.com>,
	Tomasz Nowicki <tnowicki@caviumnetworks.com>,
	Linu Cherian <linuc.decode@gmail.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<1504286483-23327-14-git-send-email-eric.auger@redhat.com>
	<20170914092751.GA3336@virtx40>
	<4dbbccae-64e1-f4ac-4dcc-3abd9766f324@caviumnetworks.com>
	<795d99ba-e492-04ce-dda4-709682baf6cd@caviumnetworks.com>
	<4f9fc697-9e6c-5dd7-65c7-92326135aa56@redhat.com>
From: tn <Tomasz.Nowicki@caviumnetworks.com>
Date: Fri, 15 Sep 2017 12:42:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <4f9fc697-9e6c-5dd7-65c7-92326135aa56@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [87.116.213.6]
X-ClientProxiedBy: VI1P18901CA0013.EURP189.PROD.OUTLOOK.COM
	(2603:10a6:801::23) To MWHPR0701MB3660.namprd07.prod.outlook.com
	(2603:10b6:301:7e::11)
Message-ID: <MWHPR0701MB3660656E62CF668F057621A7F36C0@MWHPR0701MB3660.namprd07.prod.outlook.com>
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b39c88d6-2581-4ad8-7665-08d4fc268850
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:MWHPR0701MB3660; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0701MB3660;
	3:1W4De4YQQMP+9vdwyN64zSbmfdYcPLApURGrPxtyryV3nDni8IBtzb1ufrNR8AtJqEE/9NAPsqLE9CNkThQNOkbqf2qwkibl5Eq5JXtmZFnzYR/wj5+evwAPW8fJI3P0c73Y6ZpRX+1j5Epfm+azAsIq2hseQuV0hrJNxLnfRQjd//jAxebyVJeIpbo/FvLvm9X3jDdZWrePC3iBwZn09cwUfLKuhkHYy6GmMXFwvC6LwEoNeRdwupBrR8mGcVbV;
	25:jKf3kToqBvTTL0MHIbOM5xO3HOHY7/16iObtCI9ewlGf8+LpXQbhThXofdy6JAxL4DFBcBSk6JSR+pB+Oyq7t9w9WJLta+QSI1leD24UIP11S7nGCgOsD1GQhpJ9FwqNJEsUaAWJPrqf8skzhuXQpkI3Y4mcS+tMeJCe8dgvjXKzW5YqgbqmQjRS8ESt9JKBsMlsuoGnEG95OUSdrSyVpv7gIdShAxOZnQ7JdCTY+twc5NThUiEwlWPy70cNIdQdR5w3Qs+qL0doGwK1POdzmPifJJ6RE3M14ackfM068W8RqguLdg07a9fBJmBKrHYP6kjzLpEZQsEAg3ugt1v04A==;
	31:odaPbyxJiHeDN9/RncRt4mDXaYVobxMjaFSF3Ymc62tGa+CQgcTwpXdS5i9seAx/0Jsnj5SizTj13HYWPMqK3/eaQudgw9sMygQLeyldb2xkxtz1GTvHiOwkzSG2mnkYhsd57B2tP1IA8x68S7d/dswzqQwQ4QieVp4J3HB4x3efZaQdPtE+Zvi7wNTE3Zmqn2CU+SKaC+bCWRKyC+oXVjuMVywSMDwABIKy8EXNH28=
X-MS-TrafficTypeDiagnostic: MWHPR0701MB3660:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0701MB3660;
	20:/LkcHQegdr1oCafVQxOAQZmu9cNoR9dgJK9cupBwm966+dT9loQD1hMBCpiG0Qa0F/SqqQCuFByMgoKFm1wXZa5gGyyYzHK8Pl2Y7IvQYOJzTfIvSIssIsgCTcDVxcFCTgD8ukq/c22074c7LBM5DIIHjIf03zkF1D//XpztvsidBmz4zsRP4Vs/hA7wjVQM1b50vY8LTmL1iJN4YbWA4A7YyCAR9cYFpOiALA/ld//fy+Cv2i5+ZiapXPi0h9zJmXpaRFF2fMfv28/Ea1MEeUykGfuOQ2Evm4ca04N1czWIAjOwybqx1bqLb5GtntsOcoiqDmPKfoz7LLIBDmlfIvepwzlj9edNT4NCRu3BeyXrFlda9NnFwQMrxqVD7WjwqjDxH7k/fxvjs91C7UEuBV7Ve022OP3w419onm1jy/AjtfizvsvNGReHJHM6Ve58gNR0LdAudFSA7CEZORGUXDIei1Om8MzEu59YUn0vMQIMXhOeHo5enqVUKLRj9v6WejqvQKnvg9InGry+4tg+d1bflg59yxIMB7KNRSiZRY7w3hYE0aBipuHFiNWmIUeNdBqOL24b7DBQoBDkgcRzBccL9vYd2OKt8lOHz6g/TLc=;
	4:qh7JPJbl5UU2ebJdy+N7CjZrou0m3LglyPLOEyx8+DXYYp3pp14ca8Xbbk95M2IovIm8ZUSpr5rCaly/TUqZ8UYOc1d8YXgZlN2CuEcWwrbMtVSoljpu0s2/D2Wv14g991cB+XGSiPj8Be9VEEavO5z5or66U8RQm/IG9pPWEtaBEErGtUim6vWuow3a+ti3eqiV1wyWjy9/RJKzk5ncHFOW1BFODfJLnjUFKQ5Y17zvAwdiMBQ9CKGPDvIaZK8D
X-Exchange-Antispam-Report-Test: UriScan:;
X-Microsoft-Antispam-PRVS: <MWHPR0701MB3660B9C71D6AD3BC6E5F1BB1FE6C0@MWHPR0701MB3660.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(10201501046)(3002001)(100000703101)(100105400095)(93006095)(6041248)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123562025)(20161123564025)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR0701MB3660; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR0701MB3660; 
X-Forefront-PRVS: 0431F981D8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(6049001)(346002)(376002)(189002)(199003)(24454002)(305945005)(33656002)(7416002)(2906002)(2950100002)(6666003)(42882006)(6486002)(74316002)(229853002)(77096006)(65826007)(8676002)(81166006)(81156014)(5660300001)(8936002)(50466002)(64126003)(23676002)(66066001)(47776003)(65806001)(65956001)(3846002)(6116002)(7736002)(6246003)(101416001)(106356001)(76176999)(54356999)(50986999)(105586002)(230700001)(53546010)(86152003)(53936002)(8656003)(25786009)(4326008)(39060400002)(68736007)(107886003)(58126008)(189998001)(9686003)(83506001)(97736004)(93886005)(72206003)(16576012)(316002)(478600001)(117156002)(65966003)(43062003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0701MB3660;
	H:[192.168.2.100]; FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1;
	LANG:en; 
Received-SPF: None (protection.outlook.com: cavium.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjA3MDFNQjM2NjA7MjM6RXdyai9Fb2RrSzVndlJ6dll6T05pckxX?=
	=?utf-8?B?ay9iNFRQNzJVV3RVV1c1Lzl4QWpsT2dHeHVGcC9IRFVqM2dKeE5SSURpQi93?=
	=?utf-8?B?Uzd3OWFSYVJiU21RT2d0VTRndzIxd202cXlONE5OYjNsODQ1QlBHZll2UFBJ?=
	=?utf-8?B?WTVVWFpwNjVPMDBRYWc0akUwZVpaemlLUnViUE1mdVcrWDdveE5WQWd2WEVN?=
	=?utf-8?B?d3FRMjIwUXo4enJabDE0Wk43K1MzcUFhS1lYcjJISkxWL0JnM24rYThtNkYz?=
	=?utf-8?B?Mk91bXVnRjRsVTY1aHAvdDVIbURJeTJqMWczejBUQ2dhZlg4dnV2ZFYrTHdR?=
	=?utf-8?B?allJaStOdmVJYzJlNUcxMzYwVVVmNStqbkhaNVl2MXphM1lHRldXdjYwTHc0?=
	=?utf-8?B?M1M5Qjg1cW5GMlJCN2RlWitlN0pkWVpEYTJKNWxFODJjdmFZckVROEcwMlJN?=
	=?utf-8?B?dFZsUU9WbGVuNUZPbjh2MUVQZmtzeUxEYmZ1VXcrWGxUa1ZLc2Q5Vkdoemkx?=
	=?utf-8?B?Z0JzdldGaGxkaTdyYnoxeUhGRE9VMHNBNm1KR2VmcFVEajlZYUl0VUhlcGl6?=
	=?utf-8?B?S1RtZkthS3ZGR3h1OU9WRUtWTyttQlQzVU9CZUh3eHFRRTR6QWVPc3NxNnMv?=
	=?utf-8?B?RWhaVklRWXBPOTc5WnBqQ3ZEb2drL3hGUGhXVzJwYnJSSW9lVmZYeFZWamR4?=
	=?utf-8?B?MFBScUtmdWxEeWhxTFVaOXlTcHhKUFAyUVBHQnRMblZVOXVDWGhDbEg1RVpE?=
	=?utf-8?B?YWFmdzdrSW9TVEZ4akpJU0pqdFZUU1haNjR6UG1selhBcVdjZUZlZzZEVWZW?=
	=?utf-8?B?VjN0TytPakhiQVNSdEhJcXBZUHdUZ1BOMUF3UlBDa1dpQWhoSHIycGd5dTA3?=
	=?utf-8?B?aE10eXBxNEdWWGN0K0REdVBMM1ptQklaRE5oL0o5UklmZzJFenlDa0ljbk13?=
	=?utf-8?B?N1dlQjl4UDR6eWR5dCtBL1JUR3J5Szl1eWVRZWVjb1oyNmNwZ0h5UHBoUUxt?=
	=?utf-8?B?aGlidTdHcDV6UW1CUm5Cd3h3WkVwSkZJMy81RGZsNkZuSkMreHlZeUVFdWJR?=
	=?utf-8?B?UmV6RXpwS0JzZFlLTDNZdzRNM3c3SVUzdkgzWVpQT1ZhdkF2Q1dhSDlmc2Jo?=
	=?utf-8?B?QWhCQzNmSUloMGhHSFFCMDcvaytCZDY2WEZYdG00bkNJQU0wT0Rac3FMdlRn?=
	=?utf-8?B?NXdpSC92aFpkYUhId01McW5waHB1Zk9uY3dvQWN6cnVGeVhaL043ODk4Ykc3?=
	=?utf-8?B?Z2QrblFCZjNXZjlQOHRxUlVGUXpEcTZOOWxKTXo4dzNGZHlpQjZIVnFkV0xO?=
	=?utf-8?B?YU54dmVkOTQrb3dFRWZpSGxZblRNR2tYdlFUdDhUampDSjB3S0xzQ3k1MFJl?=
	=?utf-8?B?WmpjTTh0bUNlbEhsQSsxU0k0c1libXB1dFJFN2d2RXVnN1JmUGFFVk1ZNENz?=
	=?utf-8?B?aHlnaXVFUGxCd2pkeHhuVGQ4clEwZFUvUzh2aXQvQ0tVaWxPcENBNWtQdktZ?=
	=?utf-8?B?NGordjhrR2N5QWFtSHIzVDdVZ1pRVVdUbUZWZGI4a29kZXAxbmRnQTFDK0Uz?=
	=?utf-8?B?N1hnMEJVandlQ2o3VldWcjUyaVplOVBzUTJpLzlMT2lSVzJ0WEZZNWM0Y0cv?=
	=?utf-8?B?bWZKS2dXNmpHUDVFd25tKzVsSVY1Zmc5WW5NLzJHaUk1VTdMdzZEMXRGNkp3?=
	=?utf-8?B?VTVrZEVNNzZkQVdTb2pIYnhpcmNRYURVM3hucU9MTXJxejNiNXFSVGxRWUc3?=
	=?utf-8?B?eVNsM2p5YkE5dnNGUmRSTVpsb1d5bk5hNysreCs4aUxzU0hzWXpIMFJvOU8v?=
	=?utf-8?B?L1c3Uk9XNjQvS1l3Q2JiYVJoSjN2bkVxM2ZRTzRQSHd1RWozQWNLVVlReGor?=
	=?utf-8?B?Q2RQd2gyOWV4VEprcE5qNGxNaVd4UG03c2lxTzJRaU9ORG8vT05IYVFkM21s?=
	=?utf-8?B?d0MzUkxkR2hUZFhJbTZ1YjAyN21kUG5oYWhCeHB1MHQva1ZYeXROcTVWWWFZ?=
	=?utf-8?Q?A2iXGf+3?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0701MB3660;
	6:BrrBB2qYlf3NhSCRzBfypWtc3Of7fZDOTlplbqw/UgHgbg8391rY4diUeizTuAKlDKwsR+pkf4tzb5nwvAGpdM+FD5Eu4ArlJgqFblNAYnjzxOFq++uixadIA8iubDYoUiJe9CRDwgPV+ykRjLLAI3NTn2Y/q7EOCfAAAv5dUytatpfySP0BYessCIYlUAHSRk8zXhLn8DeuoNNxELArPzFeQ4aG4Vn+cNeyUXbG6NnyIbUuSswGZ4m8drLS+DlS0ge7Tix70gJy6S9Ajq8wG39X21YzpP+JlYG2qZxed/t9mbeSW4vQHS6/hk+y9gZuHVC4ekZ+1ZWpPw+3zgLPzQ==;
	5:O/Wuq4r1B+fO+tSShZ3sltuOyVJBYoQlliLuD6GUkS6XDj5IVDbK4UU/fyJ43XKonkQ3wGzdM8XMg75JLdDLdngRoM/XFsZzUyq6h9+ugkBK2G/eOzblww1XJaGD2XH3T7gh4o9297NkoRSCLdr+jA==;
	24:HXrVSbzpjb+GbPCF0utqSgiSUVYIRSHluVZhQIr13mm1xzdwcFY900yX5HsjS6X+3GAfMK1RPMiQJHkHt/x4qDJ1+7R3eSp1z/aRUW9MHeQ=;
	7:SEtGX/GJ+uFX9aruFMEjLxLfRRBDM0FbYWJCfhWz2Z9Rs4czCTL05ti133upj3W8CJseCV9yEc837fgyX//81M3dTGx83olPBkJ5CbCX7Xr/04boS/x0jL3aGjAWA46VCL66pn56Pg/j8QgWE2O9ARwfHC2TgovyqeAsc53d+ULQt6t/VikupcD27t2i0oF8Ipn1wwq7bYibsCz602Np7B84QjQOwAKUPDfzcP+G1e0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2017 10:42:53.7169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 711e4ccf-2e9b-4bcf-a551-4094005b6194
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0701MB3660
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.73
X-Mailman-Approved-At: Fri, 15 Sep 2017 10:39:11 -0400
Subject: Re: [Qemu-arm] [PATCH v7 13/20] hw/arm/smmuv3: Implement IOMMU
 memory region replay callback
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mohun106@gmail.com, jean-philippe.brucker@arm.com,
	bharat.bhushan@nxp.com, mst@redhat.com, will.deacon@arm.com,
	qemu-devel@nongnu.org, peterx@redhat.com,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	christoffer.dall@linaro.org, linu.cherian@cavium.com,
	wtownsen@redhat.com, robin.murphy@arm.com,
	prem.mallappa@gmail.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TelsyVXwE55M

Hi Eric,

On 15.09.2017 09:30, Auger Eric wrote:
> Hi Tomasz,
> 
> On 14/09/2017 16:43, Tomasz Nowicki wrote:
>> On 14.09.2017 16:31, Tomasz Nowicki wrote:
>>> Hi Eric,
>>>
>>> On 14.09.2017 11:27, Linu Cherian wrote:
>>>> Hi Eric,
>>>>
>>>> On Fri Sep 01, 2017 at 07:21:16PM +0200, Eric Auger wrote:
>>>>> memory_region_iommu_replay() is used for VFIO integration.
>>>>>
>>>>> However its default implementation is not adapted to SMMUv3
>>>>> IOMMU memory region. Indeed the input address range is too
>>>>> huge and its execution is too slow as it calls the translate()
>>>>> callback on each granule.
>>>>>
>>>>> Let's implement the replay callback which hierarchically walk
>>>>> over the page table structure and notify only the segments
>>>>> that are populated with valid entries.
>>>>>
>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>> ---
>>>>>    hw/arm/smmuv3.c     | 36 ++++++++++++++++++++++++++++++++++++
>>>>>    hw/arm/trace-events |  1 +
>>>>>    2 files changed, 37 insertions(+)
>>>>>
>>>>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>>>>> index 8e7d10d..c43bd93 100644
>>>>> --- a/hw/arm/smmuv3.c
>>>>> +++ b/hw/arm/smmuv3.c
>>>>> @@ -657,6 +657,41 @@ static int smmuv3_notify_entry(IOMMUTLBEntry
>>>>> *entry, void *private)
>>>>>        return 0;
>>>>>    }
>>>>> +/* Unmap the whole notifier's range */
>>>>> +static void smmuv3_unmap_notifier_range(IOMMUNotifier *n)
>>>>> +{
>>>>> +    IOMMUTLBEntry entry;
>>>>> +    hwaddr size = n->end - n->start + 1;
>>>>> +
>>>>> +    entry.target_as = &address_space_memory;
>>>>> +    entry.iova = n->start & ~(size - 1);
>>>>> +    entry.perm = IOMMU_NONE;
>>>>> +    entry.addr_mask = size - 1;
>>>>> +
>>>>> +    memory_region_notify_one(n, &entry);
>>>>> +}
>>>>> +
>>>>> +static void smmuv3_replay(IOMMUMemoryRegion *mr, IOMMUNotifier *n)
>>>>> +{
>>>>> +    SMMUTransCfg cfg = {};
>>>>> +    int ret;
>>>>> +
>>>>> +    trace_smmuv3_replay(mr->parent_obj.name, n, n->start, n->end);
>>>>> +    smmuv3_unmap_notifier_range(n);
>>>>> +
>>>>> +    ret = smmuv3_decode_config(mr, &cfg);
>>>>> +    if (ret) {
>>>>> +        error_report("%s error decoding the configuration for iommu
>>>>> mr=%s",
>>>>> +                     __func__, mr->parent_obj.name);
>>>>> +    }
>>>>>
>>>>
>>>> On an invalid config being found, shouldnt we return rather than
>>>> proceeding with
>>>> page table walk. For example on an invalid Stream table entry.
>>>
>>> Indeed, without return here vhost case is not working for me.
>>
>> I was just lucky one time. return here has no influence. Vhost still not
>> working. Sorry for noise.
> 
> As far as I understand the replay() callback only is called in VFIO use
> case. So this shouldn't impact vhost.
> 
> I can't reproduce your vhost issue on my side. I will review the
> invalidate code again and compare against the last version.
> 
> What is the page size used by your guest?

64K page size for guest as well as for host.

However, I've just checked 4K page size for guest and then vhost is 
working fine.

Thanks,
Tomasz
