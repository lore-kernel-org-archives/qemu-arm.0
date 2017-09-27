Received: by 10.223.172.38 with SMTP id v35csp4571456wrc;
        Wed, 27 Sep 2017 04:07:50 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAMkwMSI2J7PiPzURX1y2Vsf2b0udTjq1juANvmbo+FG+iJ+ssP9JzNFF5xCXk6au3iambp
X-Received: by 10.200.27.6 with SMTP id y6mr1209469qtj.247.1506510470374;
        Wed, 27 Sep 2017 04:07:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506510470; cv=none;
        d=google.com; s=arc-20160816;
        b=wm4vnyW2icQC4fRFIJH96jc/b+ZVkD3wjQaK5aZ6ga4RsW0gPRMbLE2ofRduJFta3S
         mxPAFJPhPfJTRvJDAQL6TJcCc2wyqZfc8GwoYuUjruaj25weT1fejyTMamvzx7l00Ci2
         QnJ5qZvnuriPwrqYYCqqk7Xj0iUA9APFMBwg/UObDOC8hXsrcdm2H7Xnl6QtWwQ+yctg
         yd7IgQZVwa2HAKDRsGr1PIOemww3/pc0cOx3qNQfHMJ6McNqdPglfQI6t3WkDQgv57gW
         IZopwB03R9CLd+NikSEa30KsXYQJMRA5J0H8JCamQagSoU7u/MoFw8aARZ5RNpspdEKe
         wrUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-transfer-encoding:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:dkim-signature:arc-authentication-results;
        bh=CPYCRfRhjJHPJJmxAGmcTBN/KCkayOE6F7IsvpHSQyQ=;
        b=WSeOi9l3dYrmeUwPwSsfvfYSGfSINDstqeQLk63NsQGbu1ztdW4wRANBkvbosuuePJ
         U2ddvemW6vr3wBGHDsgxoVKROjtYFdC8bbDv1U2liOQBEJl56lx8zYXpOjJ87SXy90gM
         DMUyH8VasZUEOLAmWYrmV8WS1KLBQf/XnUd46xg8yrUTFGPa1DQNHnYEnNrOHA6IkhJa
         EPJZGf/Taig7/hFTqdlYiENhDdQC+4AlXwmFOUVARvtjs4EQERsupFqRG8kxE4OJfQdF
         9tVQsF/sI4LCzKJZXkgTO9IL6EYYohl6pNM0KsFRZQ5cVe1ZPPu1CVgVvpHbd2Db1Xx2
         XIKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com header.s=selector1-cavium-com header.b=gbqfGzvK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d55si10675886qtb.132.2017.09.27.04.07.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Sep 2017 04:07:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com header.s=selector1-cavium-com header.b=gbqfGzvK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54031 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dxABw-0005fP-3j
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 07:07:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51279)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Tomasz.Nowicki@cavium.com>) id 1dxABk-0005dy-Jb
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 07:07:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Tomasz.Nowicki@cavium.com>) id 1dxABh-00089B-7y
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 07:07:36 -0400
Received: from mail-bl2nam02on0042.outbound.protection.outlook.com
	([104.47.38.42]:31712
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Tomasz.Nowicki@cavium.com>)
	id 1dxABh-00088q-05; Wed, 27 Sep 2017 07:07:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=CPYCRfRhjJHPJJmxAGmcTBN/KCkayOE6F7IsvpHSQyQ=;
	b=gbqfGzvKBicJo0QyMQtTJ6/Ts0Uj4LMY77QOQ1oSepu54YR0BjeHvBWQ5lRqHuazMI18qncMfBiftHfUjvWQdYBZdTAZiCN3Fgw80nx6A9oJhnV7jgppr24AqH0jB95KoQNcudy98g9jLAJSzVc70G3eyG0LJCn0sAFJZjs36PI=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Tomasz.Nowicki@cavium.com; 
Received: from [192.168.46.112] (12.108.191.226) by
	CY4PR0701MB3649.namprd07.prod.outlook.com (2603:10b6:910:93::12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.77.7;
	Wed, 27 Sep 2017 11:07:25 +0000
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	peter.maydell@linaro.org, alex.williamson@redhat.com, mst@redhat.com,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
References: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
From: Tomasz Nowicki <tnowicki@caviumnetworks.com>
Message-ID: <0062ede1-54d4-7e13-2986-374ec62c0a2a@caviumnetworks.com>
Date: Wed, 27 Sep 2017 13:07:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Firefox/52.0 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [12.108.191.226]
X-ClientProxiedBy: MWHPR2201CA0024.namprd22.prod.outlook.com
	(2603:10b6:301:28::37) To CY4PR0701MB3649.namprd07.prod.outlook.com
	(2603:10b6:910:93::12)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb5b821f-18fb-40b6-caad-08d50597f22b
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
	SRVR:CY4PR0701MB3649; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0701MB3649;
	3:WnQU2hp3fseEjz71NLataJ4G+M60z9Rcc+hjRAcKWAgbuO6vHyCvBE88D6R7Pgy8F5a+VWpxBfD9i/kAkBozCenigE+PxpiLsPitvwZOLgcBLA5axAhT+UdMYV3PipsGfU+xaVRcBgifyEG9jktNW5BT2itGbdXPhx310ynYRK7VHynpT5tMdE82CgwN8CKyldHJ9aI7PL6+7giagTeMhhRDCmAG+XpoJanAblpIJmuSHNQlWQa7DjPbuXh9gdwd;
	25:Me0+RbOKZl86aDF3cVK8XZ5o62dPSH+ARDW6Y6TxtYYXkfjzCwnbnjGBYEtrJuFJs5pSfYoxD7RrtrKayjc9MXCk7cK3FdSe0OLSyQxcpqhESDutYE4Wn4/2SBaFN2AJjCVwgeDQVjVL6/Fa2xO8LttoPNnCmUxzYCqKAW6yYPWY06NZ0Pqx4Rs19Erx9j7YPi0KDWmEIFqUXw/Ic8MNK/6rR42cb4kONY6lgtJ2LwykSXRmW3Q8RekAwaPEidzDk4xiLE91nz3i1/TiXAuXDs3rHsZyPjrJk5m67Y4PivQxZDO/NYYT2ylq7RLxtgPqp3IqJIQqSHfTQOZd88Bo+g==;
	31:/LKD5QI9KfHTGyGW3d7lgmVX8CWoVrq5Wocx4ye+utIVZ+2p4AmnPDm3s0T0KM5JFCrgtdeM1JX/MBzelqIBZ+wp/2T/k93sV+oOcIE/PFGDKfeBLnX44Xeb04GeJdRBQaVZ5SCfikdkfrOcvaaZKi5+/6X5JEg20ZcicPhUQ5iNftum6D8znce3MPgitmDLQWMeOdI6ya9Q3SUq1m/o6qjyFuaeHeZFs7hOHB2tGFI=
X-MS-TrafficTypeDiagnostic: CY4PR0701MB3649:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0701MB3649;
	20:FF/dIllW91eEZM/A59ro0ncsUzo32IRXMUEp9NnGnzEq/WT+ogDs8nSXHFuJX8SEcpjzbMPVugEIiUrC/TYbnFsIz6iK0Q04+7xenuGj0QqoOOQKvgU0lq203XnD5IS5vVMgcIHDe2dpEKl9SO4IllS8y5baNoXeFKpMMH1D03XhEhL/WTztZuhDwn/oQPK4xCIuT7OLJNCAsgUfrrh1Q7yN6MKWwqDMkBk+GG+DsDrhR+1CK/9J4WCFDt8XezbH424C9x3fiH5kw6BpD4HaxWHoz9bcrGpA80LCw5xAM6/Wl9PMH2aYShTmEffjsH/fqvbmVJ2ruks8FrJOF9pblH6jiTCKksKas7QC5RTu02YG6Zb2K6Ih/hpHspxLu688tief2MJJc2pDvBvdpYdEEFp9wsJjXN3JyPcH7UmUVw3rFsN8NAmBhyjYduWWaWsUXn0nQMyoHnhtR0L7fy/iS4zef6sdtVxaga1qH7NI0AGSPcJi/tuc1WdW4JO3K63ScCoM+GGgbIPA3BoInLdK2ycLKsKZLZOwb2EA9/MTIr0RgeFJcGTMNu3ppN5BSWVw/FHV10Ivo522iZZ1zznOSYBLXdTw31o5X8QbEBJcsRU=;
	4:1IwRWF0A5681gDgnBRxkcfB918WulxPS72HcvVJNjCJ2veAlIhZzouLUlKjcgCtWaICdxZdNZzX78ix1/wAo8wRrZ4/fH9VFiqvJpHI8in78MsGeGlUfL8j45NV03UP2tlup2BtHVr7vZiqLzuYKgLme8Crs1EMDFHxb83dSOAY2Ecim8Yn8pAwyas0ssalJRDqxaB+ULD2P9Mz1rwnC22OjT+zjehVMbEcFRseictfRT7AY66kt3Oqr18r64Cks7feQoCO6FWlfYnpF0RkfhF/Ftagb+42yQUmW7JhWUQc=
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-Microsoft-Antispam-PRVS: <CY4PR0701MB36494011861E93B7128C1DC5FE780@CY4PR0701MB3649.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(100000703101)(100105400095)(6041248)(20161123564025)(20161123562025)(20161123560025)(20161123555025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0701MB3649; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0701MB3649; 
X-Forefront-PRVS: 04433051BF
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(6049001)(346002)(376002)(189002)(24454002)(199003)(76176999)(50986999)(966005)(8656003)(6306002)(54356999)(31696002)(101416001)(23676002)(6666003)(2950100002)(42882006)(97736004)(39060400002)(3846002)(6116002)(230700001)(58126008)(189998001)(8936002)(64126003)(4326008)(72206003)(5890100001)(68736007)(33646002)(478600001)(316002)(16576012)(16526017)(8676002)(81166006)(81156014)(36756003)(5660300001)(25786009)(229853002)(53936002)(66066001)(65956001)(47776003)(6246003)(106356001)(50466002)(53546010)(7416002)(305945005)(77096006)(6486002)(31686004)(7736002)(117156002)(2906002)(83506001)(105586002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0701MB3649;
	H:[192.168.46.112]; FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1;
	LANG:en; 
Received-SPF: None (protection.outlook.com: cavium.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjA3MDFNQjM2NDk7MjM6R0JPaktyMldFL3ppb3VIQW5tdDdhRFox?=
	=?utf-8?B?NWlDVVI4S09aTnYveTdDd2FUdFRHc09QYXVYK3krSkFJK1V1NDVGTnN2R2Jn?=
	=?utf-8?B?SS9JYWJ2RmpmZ3N3OUdWYXcwaHhyUHJHTkVCa2pMN2VDSFZ4M2xaYm43YWVz?=
	=?utf-8?B?MXFmTXV3dkZlSWNYS2l2RG5GK2VIQktTazFpUjBnQnlvODF4WUJhSUsvbGtj?=
	=?utf-8?B?Ukt2VTY4eGlpc0Y0akhVMlFMbWg2VVNXaHNFZ2dESllTU09BMFNRbW9GMEpD?=
	=?utf-8?B?YlMrVmUyYkpubkVwcXZDdm8xbUFZclBFV0VjQkR6SldTSnV5V01DNVJWdHFv?=
	=?utf-8?B?eEErQ21Pb3ZNaEhvTVdDZVVFNU1KbGpGbzk1VUtJZStJZk8vZm5xazZMSjRZ?=
	=?utf-8?B?TUs1ZmRZV0tXTWJ4alR2STQwa2gvNkhUOHc5R3gwV3JlZXdHbU42U1U4blpF?=
	=?utf-8?B?OUlKS2JpSHdRdHUwaHIxMFJYbnJUc2ZQYVJZSUJEZC9mdnlnUkx5eEs4THBU?=
	=?utf-8?B?cnF3cWpNMTdhQmoyeFk1bVZsT24rT1M1V0M5cXhDNVVQN0I5cEJKZzY4UlFj?=
	=?utf-8?B?eUNpdFdPSjRUVmxxTFpSSmxzVFhzRHpNWGhadEFhaU9LUFdzV1NsWG8vRjQ3?=
	=?utf-8?B?eEVBMnZZOE1qa054eVB2dHRRNjgzOWFwY0ZpYUpGaTJlMTgxdGppME96ZjZC?=
	=?utf-8?B?a0U5QTJ5RzA2NHBRSk43cFU3aEJITWtMZzJGcmE0QUFFamM0WjBieEJSQ2hm?=
	=?utf-8?B?ZEJIa0I2MFlpTjFialhxZUN1Y0ZZUG9la0tKNU9XS1RZeVdMbjd0Y1RZd2t5?=
	=?utf-8?B?RTRRNC9nL3RJZWg3V2FLYnlibzFpdmtoKy9xQ2JDZ3c0QURmMnRhdk5KelZr?=
	=?utf-8?B?V3NUNENseFZ6czJpSTJkZHl0ZW11TXpmSWhqZURsREN5OXczOXFLYktObFFr?=
	=?utf-8?B?bExIejA1V1A1UkQreHN4bTduaVZQWUdueFI5cEFJYlJtU21BNFp0R3RYN1Bi?=
	=?utf-8?B?TVNPODZEZWlYNmVScERrdEZTaFE0YXFrM3o3TVFORDZkYnlQOVY2V1pyTTVN?=
	=?utf-8?B?M3o5UzQ4bDdRN095VENHQzYvNFlqcktpNGZYSXFFREVIRlNpZUQ5Tnk3R1VZ?=
	=?utf-8?B?Nm0rT3luRGxhRy8zaHpOODhiT3doeEhNNGxYemtqeFZQMVhoVVA2OGdwVGJO?=
	=?utf-8?B?clAzQ2Q2UVV6ZW1VYnhRS3d5bnEvL2tlWmtLeHRnRm15K0MvelczSWVVRTQ3?=
	=?utf-8?B?T2xaRnNPRzV2MGFEUDJKdmI3ZWt6V0x1TWFSSWMvSCtYeDRDVU5OaG1UenZO?=
	=?utf-8?B?aTgwZWloL01JYk13cXhhakRkckN3TjA1U3dSbVo2c3pnME5IL3U4YWNyUEFK?=
	=?utf-8?B?MXZVYmQwUmx2a1licmJYVzBKZ0Z2SDlXV21ZWVJ5ZzU2WDg2V2MzWGRuUTlk?=
	=?utf-8?B?OFRmOWoyRnc2NEhvbXNUSWpDSzNueWJVR2RLQVIrL25SMStuMEt4V001OTBq?=
	=?utf-8?B?SFRhMkRVMVB0QSt0OXVjWWRML09aRTVBZmU4a2dHNE5OTG5Uai9tMm82aUxv?=
	=?utf-8?B?THptVWxWV1B5WHVXVXNoaE5EcXVibS9DNTZJVFp2bjJDczU2cEZBZFBFdWNv?=
	=?utf-8?B?T2pyMEY3eFFRcEFJS0UzaG9wQVM4bUU3RWhXVWJBZm9kdk55OURjUlRreGQ0?=
	=?utf-8?B?a3FwQndOTnZvWnFQQktpa1JjdmZNcWpETjl0ek5WMHl4SUJ4TzJJK05rMW5L?=
	=?utf-8?B?bjQ0WGxEaGhCK1cxUzdJNTBVT25zS2Ixa2svMWwzVmVId29jRjdBWkY5Q082?=
	=?utf-8?B?MTNDQjJJR0pCMjJZQTQrbWZ5bjZBV3J4MUo3TFdlYm11Qm1hNitXazQ3bjBl?=
	=?utf-8?B?Wkw4bFJMYkhhZUpQTnpHVDFjY0QxU3AxTFR5bGNScnlneE9JSUtTc0FZRjBT?=
	=?utf-8?B?OHBjRDdhbXV4V1E9PQ==?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0701MB3649;
	6:Oh26jZBpwo5g8Mqk1GtLUnvjLeLVhCUXmW8lwz1HO8NJ8aP24/NQa0jbvz1TPpfx3c7STfB3LJqun9yAzBUvCJwt7yhH9Z93BE0MSWByIBJsxT+R5TkdYgt3gWmO2xJShv+s9ZU3gcqGyd+UQ/BkoaecO2KFfJrkqPo9u2hX8EV+lCZMBKpU0qsHhKEPgnvwZ8G2o0TieHreUBw5fgHZEoVKSx7EiSMxNQsW541RKBzzeigvO8sLImSykdFqZVIw+TVHnbVPK400Lm7awjUUDnf3AxkdY18sf+6qzBaegOLQ5qtYB6nl+civ9hJ1/5A/MAFkTIlWEVAK5EONXsEP1g==;
	5:vW6FaTOSS53vGxJesT+PbqP0MKWNab7kiLwzAdqN+5SWdb8M/DQkeUJH7zrPFqv8n530NIU8KKq/kr/9FswwOGoHhb7XwSFDzA5XZ+bKzasuZ61zKBvvUm7m7AbRKOhRwHrEkEg1dD+ziFJxA4uJNw==;
	24:TycWS/5zZBblX1VidUjOfhgEtFnKd9HinWhprwSmGXFH+ida9FeXbgdZHxEW5vSFwQnPdqUO9ODQWsY9GXhLsqGDWpGSOJ2+J7m5Z7XJ8MM=;
	7:uAmTqiy31VGS3K8I/rCoFfOXpSRXXVh5sAOovXo453lwDdKbb6NkYw31dXcLIolTSUon71Dvtid20GGLHd0cCJPvpXoaLhG/2+1tMbayAYztvyv2cPB5SL5zIDzl1p29z3+Rv78ZtadVoJkRfjx7iXwuVcMy1UVaAf/0d8OZc10+yTi8pcsh77l2NLuQ8iRU6kX4+KzcoN1OMBqiji46jA7zCC/d/KC0xhzwk4k4HNg=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2017 11:07:25.8012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 711e4ccf-2e9b-4bcf-a551-4094005b6194
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0701MB3649
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.42
Subject: Re: [Qemu-arm] [RFC v4 00/16] VIRTIO-IOMMU device
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
Cc: kevin.tian@intel.com, marc.zyngier@arm.com, will.deacon@arm.com,
	drjones@redhat.com, peterx@redhat.com, linuc.decode@gmail.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OGxBMS+ZjWc0

Hi Eric,

Out of curiosity, I compared your SMMUv3 full emulation against 
virtio-iommu. For virtio-net device behind the virtio-iommu I get 50% 
performance of what I can get for SMMUv3 emulation.

Do you have similar observations? Since there is no need to emulate HW 
behaviour in QEMU I expected virtio-iommu to be faster. I will run some 
more benchmarks.

Thanks,
Tomasz

On 19.09.2017 09:46, Eric Auger wrote:
> This series implements the virtio-iommu device.
> 
> This v4 is an upgrade to v0.4 spec [1] and applies on QEMU v2.10.0.
> - probe request support although no reserved region is returned at
>    the moment
> - unmap semantics less strict, as specified in v0.4
> - device registration, attach/detach revisited
> - split into smaller patches to ease review
> - propose a way to inform the IOMMU mr about the page_size_mask
>    of underlying HW IOMMU, if any
> - remove warning associated with the translation of the MSI doorbell
> 
> The device gets instantiated using the "-device virtio-iommu-device"
> option. It currently works with ARM virt machine only, as the machine
> must handle the dt binding between the virtio-mmio "iommu" node and
> the PCI host bridge node.
> 
> The associated VHOST/VFIO adaptation is available on the branch
> below but is not officially delivered as part of this series.
> 
> Best Regards
> 
> Eric
> 
> This series can be found at:
> https://github.com/eauger/qemu/tree/v2.10.0-virtio-iommu-v4
> 
> References:
> [1] [RFC] virtio-iommu version 0.4
>      git://linux-arm.org/virtio-iommu.git branch viommu/v0.4
> 
> Testing:
> - guest kernel with v0.4 virtio-iommu driver (4kB page)
> - tested with guest using virtio-pci-net and vhost-net
>    (,vhost=on/off,iommu_platform,disable-modern=off,disable-legacy=on  )
> - tested with VFIO and guest assigned with 2 VFs
> - tested with DPDK on guest with 2 assigned VFs
> 
> Not tested:
> - hot-plug/hot-unplug of EP: not implemented
> 
> History:
> v2-> v4:
> - see above
> 
> v2 -> v3:
> - rebase on top of 2.10-rc0 and especially
>    [PATCH qemu v9 0/2] memory/iommu: QOM'fy IOMMU MemoryRegion
> - add mutex init
> - fix as->mappings deletion using g_tree_ref/unref
> - when a dev is attached whereas it is already attached to
>    another address space, first detach it
> - fix some error values
> - page_sizes = TARGET_PAGE_MASK;
> - I haven't changed the unmap() semantics yet, waiting for the
>    next virtio-iommu spec revision.
> 
> v1 -> v2:
> - fix redifinition of viommu_as typedef
> 
> Eric Auger (16):
>    update-linux-headers: import virtio_iommu.h
>    linux-headers: Update for virtio-iommu
>    virtio-iommu: add skeleton
>    virtio-iommu: Decode the command payload
>    virtio-iommu: Add the iommu regions
>    virtio-iommu: Register attached devices
>    virtio-iommu: Implement attach/detach command
>    virtio-iommu: Implement map/unmap
>    virtio-iommu: Implement translate
>    virtio-iommu: Implement probe request
>    hw/arm/virt: Add 2.11 machine type
>    hw/arm/virt: Add virtio-iommu to the virt board
>    memory.h: Add set_page_size_mask IOMMUMemoryRegion callback
>    hw/vfio/common: Set the IOMMUMemoryRegion supported page sizes
>    virtio-iommu: Implement set_page_size_mask
>    hw/vfio/common: Do not print error when viommu translates into an mmio
>      region
> 
>   hw/arm/virt.c                                 | 115 +++-
>   hw/vfio/common.c                              |   7 +-
>   hw/virtio/Makefile.objs                       |   1 +
>   hw/virtio/trace-events                        |  24 +
>   hw/virtio/virtio-iommu.c                      | 923 ++++++++++++++++++++++++++
>   include/exec/memory.h                         |   4 +
>   include/hw/arm/virt.h                         |   5 +
>   include/hw/vfio/vfio-common.h                 |   1 +
>   include/hw/virtio/virtio-iommu.h              |  61 ++
>   include/standard-headers/linux/virtio_ids.h   |   1 +
>   include/standard-headers/linux/virtio_iommu.h | 177 +++++
>   linux-headers/linux/virtio_iommu.h            |   1 +
>   scripts/update-linux-headers.sh               |   3 +
>   13 files changed, 1312 insertions(+), 11 deletions(-)
>   create mode 100644 hw/virtio/virtio-iommu.c
>   create mode 100644 include/hw/virtio/virtio-iommu.h
>   create mode 100644 include/standard-headers/linux/virtio_iommu.h
>   create mode 100644 linux-headers/linux/virtio_iommu.h
> 
