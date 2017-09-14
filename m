Received: by 10.223.172.38 with SMTP id v35csp969635wrc;
        Thu, 14 Sep 2017 07:57:15 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCmovokscQY+xC51+Ii7BJu8EBqnMqlPvdjFcZ+162yunOnWcwprJ8jSguOJZsclFJLLjwM
X-Received: by 10.237.45.199 with SMTP id i65mr16753559qtd.188.1505401035008;
        Thu, 14 Sep 2017 07:57:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505401035; cv=none;
        d=google.com; s=arc-20160816;
        b=K45tXQS7fapRkeH4hemXEeSwJVCSeGRbzmm4e10LXXRtzW7HtOL2/nZiVzIjUQ8Kyk
         wpPLmX/+h1WmiYScym/DOFHu70V+hlrgm7YenVn4fpkHw3LPnVRxEQJRMzc5a0XwKHg1
         7fDnjFp/iogYWdDXnOOLc1PfG+AXor1C/VTiuxXm2tALuLKM4fSAqD3FPkZQYm7DIdRP
         Tt3CPMwX0aGNd4/TXpdyP2VssPcVWliKwOgEOKV+XzziSKXlrkrp+TUvCwxNUoFjFXMO
         yB+cgyQ0mk++LiajaZ2lku2vo1LzOKacwyKJJGcwZBDO2qzC8Oki9HX70zanceUkDRlN
         Yr+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-transfer-encoding:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:references:to
         :from:dkim-signature:arc-authentication-results;
        bh=/GWoYjR/cshcH2qUBLkO/PQjFmy6u/xzQfBOoCQ2sGo=;
        b=mzv0VahpQyZQuXpeRXO+PKEziJNZuFIKaZgG7yge0yXWZUW8SA5kXikquQq0Lgm6da
         LOj0Ej4qQS2sWt8Yho6SaFVFW79aUL44zUIm4fSFaLUxNS+Q9/wfuxiiO3CoLHhsyDAD
         TOwquYH/1t2pxLfRyRR0/x0cN1jsuco4U+M7joz2n2tUT6+1u/KYT8toLjERfLeObHzF
         M4hgr6mK4eL+VmYiWcZmdckvDGJJdMogFtF6/mx53l8Rmd6hsZVFUmmW5pL93IjZFJns
         035dUgVyawmzsc0YIKlkn/GEd42iitIVlsrSn77uyCK2hDtdB9BrVMeKJTX4en3hlhz2
         zkSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@CAVIUMNETWORKS.onmicrosoft.com header.s=selector1-cavium-com header.b=PFG91o29;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z6si4740361qth.133.2017.09.14.07.57.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Sep 2017 07:57:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@CAVIUMNETWORKS.onmicrosoft.com header.s=selector1-cavium-com header.b=PFG91o29;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48256 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsVZo-0007YO-JU
	for alex.bennee@linaro.org; Thu, 14 Sep 2017 10:57:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Tomasz.Nowicki@cavium.com>) id 1dsVMm-0008NH-3y
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 10:43:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Tomasz.Nowicki@cavium.com>) id 1dsVMh-00049d-3S
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 10:43:44 -0400
Received: from mail-dm3nam03on0055.outbound.protection.outlook.com
	([104.47.41.55]:59552
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Tomasz.Nowicki@cavium.com>)
	id 1dsVMg-00048U-NM; Thu, 14 Sep 2017 10:43:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=/GWoYjR/cshcH2qUBLkO/PQjFmy6u/xzQfBOoCQ2sGo=;
	b=PFG91o29ERYn0y053pjY8MxWTxGmcC+ttbSePyfbtBmO2rSDkXD89sbDJfLYk4L1zc/GB1b2BI2Nv/MyB3Wod8I43EpgnynTs3TndqZEwpNM7OKOSKVR6vJeDT2vDmmdCCulPII3MRpnfTfuqPELAPL1eMdlmcMV0l0GRamBgn0=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Tomasz.Nowicki@cavium.com; 
Received: from [10.0.0.85] (31.172.191.173) by
	MWHPR0701MB3659.namprd07.prod.outlook.com (2603:10b6:301:7e::10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.56.11;
	Thu, 14 Sep 2017 14:43:30 +0000
From: Tomasz Nowicki <tnowicki@caviumnetworks.com>
To: Linu Cherian <linuc.decode@gmail.com>, Eric Auger <eric.auger@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<1504286483-23327-14-git-send-email-eric.auger@redhat.com>
	<20170914092751.GA3336@virtx40>
	<4dbbccae-64e1-f4ac-4dcc-3abd9766f324@caviumnetworks.com>
Message-ID: <795d99ba-e492-04ce-dda4-709682baf6cd@caviumnetworks.com>
Date: Thu, 14 Sep 2017 16:43:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Firefox/52.0 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <4dbbccae-64e1-f4ac-4dcc-3abd9766f324@caviumnetworks.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [31.172.191.173]
X-ClientProxiedBy: AM5PR0502CA0023.eurprd05.prod.outlook.com
	(2603:10a6:203:91::33) To MWHPR0701MB3659.namprd07.prod.outlook.com
	(2603:10b6:301:7e::10)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02be227c-8233-4ede-a6d5-08d4fb7efa45
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(2017030254152)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:MWHPR0701MB3659; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0701MB3659;
	3:fcsl1W3U22z2XN0egP8WT3+C9026DIfTbsorc1TngmwzDqHX7jzM8f2yz0F3IIyZt1KiBkpQ0t9GR1gfAUPj/XlfN5hDjjA/2STFAN2Yh+EeKFcvb8/UGQVbSQYiUZEDi5JihyNC8yASuNLMoB5S1014pTyWQLXFV+aVPB4LgEadv21c88Wol+tySqPy029z+mGLJVivhL8ASXZZ1OaQe5QzNRt5qrx6VLZWfASODQbx/dyaH9ORMYMDKdw11QMQ;
	25:K6KWCNd7RiaLqTkPv71dRt0FUcXe6nk2g+k6EbL0I7FT5VCFRPPJSvy5FDmPRX1uiC6HEGhhEXlr5eYbsIT8OCN/P/oBl6Zw2OxdmJDZoYHpdqwbQV3o59Cm9qlF3xIAEPD+dYoCMdBUsPwwHGrmfkx7tKC+9wFK6PJB7q3ijlM1Os5NFOs5g811u4ol9lq+FEQxMoDiSpXnA2Cw8slw5Mw2NFQz+plZI/A8qOSGPAJckrHLocAHjqSXsNOYD8DB3TlAicR2akHYhm6lPOyPp744naNtwe4/nV5oBVCkjemJbiICrD/Q83ceQKYYAqOMAIykU3JYpUjYFTv5MHkdlQ==;
	31:NU9ZUacmqc0rwtFe6qEvK1+5dhMOGVX+GrROriVPW3LM4mIK+etAt5+sCt+S0AdCSYEDLNE58T9MTEsXk8ubHlTjy5mnJJFqZyu/qjivWnxUWi3kUYp9MOnIkB9TyK3SuEXTw6hDth5Mc6udIbtF7FSWozJj1WIygu4Lu1NBZ3kJCTfYWyvnRCVL+SmB/z9Id8ko7Sqacl9k5UwsIcJaAfxBAgVDlDwP6eKj/aewPLw=
X-MS-TrafficTypeDiagnostic: MWHPR0701MB3659:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0701MB3659;
	20:ZDWj0F/Xxjtd+ynWnhFwwVbC9tmVPv5YBqUxutGrs8ghfx2QDbog+x5aLl5UK6mjEX0drpYSQfmGqp1dkwxvLEEaPLfnR2Gq+alVZl6ko2fSRL1QUYCpUBF9IdjSg1/fDzjxH4YIDIrMllh3lTpIep9g6Sfha4XCdOyzbTnLm/ffN2N5YpFK+RbIYkgXamTBHTRQsl3l+Qeta+YBkhYpTPVPGDWqGRKsZDufZzqhUpaFMWSeNk47xFkM46fCvkCUxVWhMt1+uYnxMM8mZsVBMwJlW/wQqIWMUS5j4LHMSZfShsrZ8sDpcsn+FXll8s/Kh21+YaZtzsrAZLY9NB427W5VP0MZNUjsIQefOnaqAGGUjQQ92ZyZfD+/8tiXx10bFQpWCDqL58RVnDOLeCHT07/TyVjRL+UMGs+5/w3oiomxFVAddLrC+H1Ir3rx5XNbSjIOGfC9oPT5hozmlgrsih5nQ51dpEhAoboxqBowZigLD9og3voOtB34agnAG7oYihp3ioLqpxdy4HjPG7OID2O49n/pyCPGql9wpcE01Gq+crt6HuOZPkwBCW4kcCKx9FXVTvgGPzWCwXDUUT8iQSe8i7ifULxfnKwWTWBCOZE=;
	4:qWYa8oHhqjpG2vwiIfizGb6gi9rOTgx4MkmQm/gsyRSl36BbRRWNdAGOFvPs1AHSPs/EKL/o8bya7TZ65J2HOOn7RwP6arrcORpZf6X77QOGPfcBInoq8Tqu0lHHUXgpsIXPCBis1jaP1BWsG5ESkxBROKfezY89SzD4y3fVmeHPAuueEmtrt5Jd2SR8HmQ5FGEZ083FvNzxvCVvv0QbXo7dS+yzBU02tu2iOrTMo9XpN6kEKrR0vPhSsfhmm3/W
X-Exchange-Antispam-Report-Test: UriScan:;
X-Microsoft-Antispam-PRVS: <MWHPR0701MB3659D1B426A99909F3716070FE6F0@MWHPR0701MB3659.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(100000703101)(100105400095)(93006095)(3002001)(10201501046)(6041248)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123555025)(20161123558100)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR0701MB3659; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR0701MB3659; 
X-Forefront-PRVS: 0430FA5CB7
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(6049001)(346002)(376002)(24454002)(199003)(189002)(65956001)(8936002)(7736002)(189998001)(8676002)(305945005)(4326008)(31696002)(23676002)(101416001)(33646002)(81156014)(93886005)(81166006)(8656003)(39060400002)(42882006)(2950100002)(229853002)(6246003)(6666003)(53936002)(5660300001)(7416002)(107886003)(77096006)(2906002)(3846002)(6116002)(36756003)(31686004)(4001350100001)(68736007)(97736004)(316002)(16526017)(16576012)(47776003)(6486002)(230700001)(53546010)(66066001)(106356001)(64126003)(76176999)(54356999)(50986999)(25786009)(83506001)(50466002)(105586002)(72206003)(478600001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0701MB3659; H:[10.0.0.85];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: cavium.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjA3MDFNQjM2NTk7MjM6SWZzdDloUVU1UFpVODBIRDY1WkJ1WTlr?=
	=?utf-8?B?WEZkaWx1T05vb3N1TkFKMHBoNytYZnhpQnozbU9XTjBJOEZXQnpDNFU3NnUw?=
	=?utf-8?B?ZUs5VTNJS1JDQk8wbXhrSlhYWmlEbFJaUzdlYmliL2dsaTgvcm9OUWlERmF2?=
	=?utf-8?B?UUVENERPYWlzWXgxTndkbnorSmM3Q1NmVFJUcjFPeFFnSEJ0SXJqNVpjNlJo?=
	=?utf-8?B?ajhJWHhNb3hlQ2lZYTBYNUFwSG9nd1E5anEraWtBV1FrTjkxZVVYTjI5RDRv?=
	=?utf-8?B?OXI5dHg1eDNzQU1tYlhOdFpUajFHQlNCRjh3V2lBVXJIU3QyZ3Bua1ByT09W?=
	=?utf-8?B?clluczFWZmRmOGlScnE3ZkZXemx6b3FEQ3JEajJTUURiSzdqYkFzb2RRbWYy?=
	=?utf-8?B?RE9ZWGkrMk9xR3kxTEdNbDV3RHdYOUNEcEYwblZTczhHb0FSRDdRNWMrMTJi?=
	=?utf-8?B?UUFYVlpZN2ZhQkJvdEI0YXB1eU0ydkZWb1Z5ZW5uMnpmWWtUbk9wbFRKYzBX?=
	=?utf-8?B?SzNLUDZOVWJQeVlmRXovbDI3NDRiemoxRlQvWWpnZmw5YTZGNWxoWDBNQ1N6?=
	=?utf-8?B?VXkvWWxYd1F4Tytqd29tYTAwVTMyTlpkSFRUOGVPRGQ2ZmEzdUtXWUJWa0Mr?=
	=?utf-8?B?bUtwV2N6YVNZR1JtTEV3S3N0c0hDUU96R3RwUkYxL0t4emo4ZmthWS9lSG4r?=
	=?utf-8?B?UHo1aXU2MWs4amZLTjZETUFVUExDdmIzTWtHODhMUTdQa2IwVkZYVHRZazU1?=
	=?utf-8?B?b0lMYVNuOFBTeStRSW9TY1dyL1dheGx1U1Rkamd6WXF4RTdpRnlkbXdVTkoz?=
	=?utf-8?B?b0ZkYVQxb09JUEpLcC8zcmFsMGt3NGlIcVFxQVlPZ2lvandQMmR5VmZhT25k?=
	=?utf-8?B?U1RLTXVVWHF6SEJuUFh2ejhtNHVGT05jZENFMnhMZXRrRGl0emRzNkhWRXdC?=
	=?utf-8?B?T1ZJL252b3ZxTi82dGVpYUZybmpOTjVpTlBWYVFLSWhxUGk3NC91aDBQL2xS?=
	=?utf-8?B?UGZGZDdXOHhidjVwU2dmTmdEVEFkajhaMmpDUUJBTU9DaU1GNG5PYldCR3RH?=
	=?utf-8?B?WU1ibDBlazN2SWdpMlcvb3RMeWUyNTl2dTZmd0lhVDJDZTdMU3VQUEc4N2kw?=
	=?utf-8?B?ZWE4Y0dzcVcrc3pnSWlpWklEQVpMYnI0S3oxTGYxQmJoZTU4ekNNZGZRT3RI?=
	=?utf-8?B?Y3RmanRKbDZjcmJLWmtoVklZZmJuMXk0UHNxd0Y0czFtTCs4OXMwZ2RnaVdL?=
	=?utf-8?B?VVBHYlg3SkFHOXZTQU5kQlBNcVloV1lyWXJZU08rTmFMQWRPZmlzWHlqSVlv?=
	=?utf-8?B?QkUvTytjZFU5b3IwSVJ4Vlg1dWcrenY0T0xnQjVLYUx1Wjk2bHlpKzJqN0kw?=
	=?utf-8?B?b3M5N3lTRWFkMTdyRkJ6Mmt6eFZwT1hla2EwR3B6Yy9tNzB5L1NicEloVFFw?=
	=?utf-8?B?eDNYWEg4bFBTdmJJS25ZUllVdStEV1ZMQ3ppYnJFVEdEazdCWUtKMDR1M1Fr?=
	=?utf-8?B?bTgzRGg4dk01TURMOFRlYm90WEdtV1lZdmNwN0pXSU9tNTExcFMra01zUHFP?=
	=?utf-8?B?TUptbEUzaElsT2VHMWh4MHdQbmgzZFlGM1laS2RoYzRaa3FnbzA1NWxsclR3?=
	=?utf-8?B?NFJqQWwrb0xQTk1OTWFaUFhWR3RFYlg3TGhncVo1R20xbHo2OUJEMnIwSlJU?=
	=?utf-8?B?aUlSY0JPUkZmM0x4SGVFUzg5cTYzQ1RzRERrVDdqMk5nNnM2eWRZMmFHb1lQ?=
	=?utf-8?B?cU52L0FybUdYNEJhWUhRTTRWUzA3Zjlnc1QwQWVTZTJHR0x0ZHY1d3Q5Q2ZH?=
	=?utf-8?B?QTBxb2RKYytPNXdtbFdRWHdFRjIrZjNnaEIxbGlsTm16QUFZa2FoS2lGZjhJ?=
	=?utf-8?Q?2ev0RAcI6TszIQADhKtm2qKPDkdg4TEZ1H?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0701MB3659;
	6:Jg4eDvWmforKN6KDi65pCBmd0RfumacyaAVpI1WdTUdLXtWGdsn4a4D0X7Z/kvHhKx5+TD+tWP1eBbwwVMYGqgaKcLntH75HCPDd5MGSbRpXWM9Mus+0BHopPfZ+8ormg35EgJV6D3y7ippYgbPkdMcm68mBm3A+fc/khduZjLcvJKs4jCpw5IC7xMDRWlmul6gOmG7En0uJNIpROcuhNZrYzRFJ1889e6vT6YOmFIJcEw0YvBEPRVIJp8pDurK2EKK5n9FCWTjq07Mi51DbIOoseiMoeCbmnXM+87EOASIk9q3NHprPn9HHDekUR0jWtGZCjUeH0wVagMhPOely6A==;
	5:ysvHepHyQ1073pbxzwB1bxQ/R4OGEdiV8qtsYmbuuTs/jmBmSZF2zcXdeIR0116UvashNh9mA5QqGmZpDzfVE9b1k1ghfyDt6QJPdM8xEfSl4xyjeEfpHX1R2gmZ2Ilu+7fs8lLA44R7pGxdWJQaAA==;
	24:V7aiNjMGbxF1PlRooyGBhHJSn0nJyV8Ae9YdzcqHJTXiNO4KqRFndZdLq18q0dW4nLzBEZ/QhdkjNvpSgbgsKeHlCKOgV8ZkXbUONbDvqUY=;
	7:6HEzCxppZy9jLTqcHzG+rRg30Xu3lyezYZz7dxRu29OTrM6PT3L2gNSIxFJW4XJ2xmwDZPHJqYFECgBpJjgaeqUWI9bG36cAlcOUyxV2J/KK+ehL4UJp7svSSX2swMhV+gpNqxRNkw2bQe8si0IvVeQbgYnth0ioRHPRxVvaD6UrImW2KlueZ1GRe3OywkvkLXLBLK2/HCVms8ChtSjpMO75qyS0jhWtB3k/vg2snT0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2017 14:43:30.4245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 711e4ccf-2e9b-4bcf-a551-4094005b6194
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0701MB3659
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.41.55
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
X-TUID: Fkv2Btlstplu

On 14.09.2017 16:31, Tomasz Nowicki wrote:
> Hi Eric,
> 
> On 14.09.2017 11:27, Linu Cherian wrote:
>> Hi Eric,
>>
>> On Fri Sep 01, 2017 at 07:21:16PM +0200, Eric Auger wrote:
>>> memory_region_iommu_replay() is used for VFIO integration.
>>>
>>> However its default implementation is not adapted to SMMUv3
>>> IOMMU memory region. Indeed the input address range is too
>>> huge and its execution is too slow as it calls the translate()
>>> callback on each granule.
>>>
>>> Let's implement the replay callback which hierarchically walk
>>> over the page table structure and notify only the segments
>>> that are populated with valid entries.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> ---
>>>   hw/arm/smmuv3.c     | 36 ++++++++++++++++++++++++++++++++++++
>>>   hw/arm/trace-events |  1 +
>>>   2 files changed, 37 insertions(+)
>>>
>>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>>> index 8e7d10d..c43bd93 100644
>>> --- a/hw/arm/smmuv3.c
>>> +++ b/hw/arm/smmuv3.c
>>> @@ -657,6 +657,41 @@ static int smmuv3_notify_entry(IOMMUTLBEntry 
>>> *entry, void *private)
>>>       return 0;
>>>   }
>>> +/* Unmap the whole notifier's range */
>>> +static void smmuv3_unmap_notifier_range(IOMMUNotifier *n)
>>> +{
>>> +    IOMMUTLBEntry entry;
>>> +    hwaddr size = n->end - n->start + 1;
>>> +
>>> +    entry.target_as = &address_space_memory;
>>> +    entry.iova = n->start & ~(size - 1);
>>> +    entry.perm = IOMMU_NONE;
>>> +    entry.addr_mask = size - 1;
>>> +
>>> +    memory_region_notify_one(n, &entry);
>>> +}
>>> +
>>> +static void smmuv3_replay(IOMMUMemoryRegion *mr, IOMMUNotifier *n)
>>> +{
>>> +    SMMUTransCfg cfg = {};
>>> +    int ret;
>>> +
>>> +    trace_smmuv3_replay(mr->parent_obj.name, n, n->start, n->end);
>>> +    smmuv3_unmap_notifier_range(n);
>>> +
>>> +    ret = smmuv3_decode_config(mr, &cfg);
>>> +    if (ret) {
>>> +        error_report("%s error decoding the configuration for iommu 
>>> mr=%s",
>>> +                     __func__, mr->parent_obj.name);
>>> +    }
>>>
>>
>> On an invalid config being found, shouldnt we return rather than 
>> proceeding with
>> page table walk. For example on an invalid Stream table entry.
> 
> Indeed, without return here vhost case is not working for me.

I was just lucky one time. return here has no influence. Vhost still not 
working. Sorry for noise.

Tomasz

> 
> Thanks,
> Tomasz
> 
>>
>> +
>>> +    if (cfg.disabled || cfg.bypassed) {
>>> +        return;
>>> +    }
>>> +    /* walk the page tables and replay valid entries */
>>> +    smmu_page_walk(&cfg, 0, (1ULL << (64 - cfg.tsz)) - 1, false,
>>> +                   smmuv3_notify_entry, n);
>>> +}
>>>   static void smmuv3_notify_iova_range(IOMMUMemoryRegion *mr, 
>>> IOMMUNotifier *n,
>>>                                        uint64_t iova, size_t size)
>>>   {
>>> @@ -1095,6 +1130,7 @@ static void 
>>> smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
>>>       imrc->translate = smmuv3_translate;
>>>       imrc->notify_flag_changed = smmuv3_notify_flag_changed;
>>> +    imrc->replay = smmuv3_replay;
>>>   }
>>>   static const TypeInfo smmuv3_type_info = {
>>> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
>>> index 4ac264d..15f84d6 100644
>>> --- a/hw/arm/trace-events
>>> +++ b/hw/arm/trace-events
>>> @@ -46,5 +46,6 @@ smmuv3_cfg_stage(int s, uint32_t oas, uint32_t tsz, 
>>> uint64_t ttbr, bool aa64, ui
>>>   smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node 
>>> for iommu mr=%s"
>>>   smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node 
>>> for iommu mr=%s"
>>>   smmuv3_replay_mr(const char *name) "iommu mr=%s"
>>> +smmuv3_replay(const char *name, void *n, hwaddr start, hwaddr end) 
>>> "iommu mr=%s notifier=%p [0x%"PRIx64",0x%"PRIx64"]"
>>>   smmuv3_notify_entry(hwaddr iova, hwaddr pa, hwaddr mask, int perm) 
>>> "iova=0x%"PRIx64" pa=0x%" PRIx64" mask=0x%"PRIx64" perm=%d"
>>>   smmuv3_notify_iova_range(const char *name, uint64_t iova, size_t 
>>> size, void *n) "iommu mr=%s iova=0x%"PRIx64" size=0x%lx n=%p"
>>> -- 
>>> 2.5.5
>>>
>>>
>>
