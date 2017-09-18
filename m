Received: by 10.223.172.38 with SMTP id v35csp3567633wrc;
        Mon, 18 Sep 2017 02:51:13 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QB6xYLyrSYl0np5O8X6+CTYve0ZJu9396JxJwUy7DsK+I1b0f5/BTGCRe01pE4RW6sMYd0z
X-Received: by 10.55.137.66 with SMTP id l63mr19096456qkd.249.1505728273374;
        Mon, 18 Sep 2017 02:51:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505728273; cv=none;
        d=google.com; s=arc-20160816;
        b=zfd5hiEenvXBNpcNfAvWyrXkD92gUwF4k857gt+1exD8pdEkXLElOT+4etTIRp1fci
         UbJNjs8SFGcy+8MONZXWHbyX5j4p0zlYDFNq9ICHcTW5RSlSQ+gUrq/rZyE7WrZk518g
         zkJ/nbet3awxOEOYPC2pS6GTU3BxCUnroPqAOa7nDx/3iEMzM+am4KUVCmq7L46nTiDj
         xSiQFXLEIgGTMmsNGg8/DcCn9Vu85oxY2HzAvi6Gf0xaVqzW4PvYqcjlQxLtXJij6ySF
         BpZoS06izbFoinF6H5aXs+N0gq/c9dQrIbv24+4/DxWU7WxyE+awMMH0T2CjMVhy2lfa
         gd3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-transfer-encoding:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:dkim-signature:arc-authentication-results;
        bh=6CiN6Y9Ne9MO3ssU3ZJiX28TxEe+t+B+KxnQU3w2axM=;
        b=QxK0fawghRSKeuQ11p+Zph3Tow4chy96br0yrPyy3fvwvfFvEwIJuqmq6qFgty5Vj4
         6gjvVhWbIeBjGLjxYWox0YBZm7rPN98tAhoQu34YupUL1Jkye4bUkESo/0Z9IQFc311G
         t6u8aflKEpPOUFZk1q1r+hxlp/xuXC/gg+VcqgO3mSM7YuBLSXuNtjD3cY84jCUtU0QM
         v6DaC6H1wil8vklLsvS1lqcqvhvVohFRBmRMT59Lo8G1vALvQrzhaBHahnSEz+OhOPAe
         shUHBoAXey4beITjkGWurjnFX1iTdANxuGOJeKqGcdJf2VpDeH19D4pH5lpQ/HmSySRc
         hV1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@CAVIUMNETWORKS.onmicrosoft.com header.s=selector1-cavium-com header.b=n+zMNGe2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r9si6613814qkh.90.2017.09.18.02.51.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 02:51:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@CAVIUMNETWORKS.onmicrosoft.com header.s=selector1-cavium-com header.b=n+zMNGe2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35498 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dtshr-0003nw-1T
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 05:51:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Tomasz.Nowicki@cavium.com>) id 1dtshh-0003nZ-Sc
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 05:51:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Tomasz.Nowicki@cavium.com>) id 1dtshd-0000GE-05
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 05:51:01 -0400
Received: from mail-co1nam03on0082.outbound.protection.outlook.com
	([104.47.40.82]:42016
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Tomasz.Nowicki@cavium.com>)
	id 1dtshc-0000Fe-I2; Mon, 18 Sep 2017 05:50:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=6CiN6Y9Ne9MO3ssU3ZJiX28TxEe+t+B+KxnQU3w2axM=;
	b=n+zMNGe2qqFJvpA1F/NBnXnYi9dCC6+zepX48p4x0CrswI/wT+wwoUVEUbf8SUA5KuFHJ26SbvrRyC7zutDJXpKU4pR4FFIyP9ScVQhkrsnpgV0l+yGzmyUug96VmvhM35Pii5zLJU6VW7fZYXO1KzheDAGomg3S6LDehsRQBKk=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Tomasz.Nowicki@cavium.com; 
Received: from [192.168.46.114] (12.108.191.226) by
	SN4PR0701MB3662.namprd07.prod.outlook.com (2603:10b6:803:4d::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.56.11;
	Mon, 18 Sep 2017 09:50:44 +0000
To: Auger Eric <eric.auger@redhat.com>, tn <Tomasz.Nowicki@caviumnetworks.com>,
	Linu Cherian <linuc.decode@gmail.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<1504286483-23327-14-git-send-email-eric.auger@redhat.com>
	<20170914092751.GA3336@virtx40>
	<4dbbccae-64e1-f4ac-4dcc-3abd9766f324@caviumnetworks.com>
	<795d99ba-e492-04ce-dda4-709682baf6cd@caviumnetworks.com>
	<4f9fc697-9e6c-5dd7-65c7-92326135aa56@redhat.com>
	<MWHPR0701MB3660656E62CF668F057621A7F36C0@MWHPR0701MB3660.namprd07.prod.outlook.com>
	<64e946b3-8fb6-b918-e389-1a01c084fb47@redhat.com>
From: Tomasz Nowicki <tnowicki@caviumnetworks.com>
Message-ID: <eae88f57-d570-86d8-cbca-fd5b266c07d8@caviumnetworks.com>
Date: Mon, 18 Sep 2017 11:50:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Firefox/52.0 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <64e946b3-8fb6-b918-e389-1a01c084fb47@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [12.108.191.226]
X-ClientProxiedBy: MWHPR15CA0050.namprd15.prod.outlook.com
	(2603:10b6:301:4c::12) To SN4PR0701MB3662.namprd07.prod.outlook.com
	(2603:10b6:803:4d::16)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7884db3c-ca36-40d4-1e16-08d4fe7abf0a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(2017030254152)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:SN4PR0701MB3662; 
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0701MB3662;
	3:3DnxDSWzKnH8LdF5zLsjInaf+ipqy/RIKb5yiRk6iSPl+X2LaBqTLZIxsaSEq7u/kEsTzzGueKcDotWzMU4pvpPEk1ITHtVNZk4S2mFnQTuFgGwXKLSoqouXnw5F46MPZWpU1daQsJrKkQicHY3d2ZaGt/Bl+4eHQupXi/ULoPeeAMpm+POdr/x2bNZ4XGaejAgvHx+GNUaAFqJ9xG5QQmzYI3JGX6WeLWsVwUpINyLIqmHvecdXiWGkdrgqy48W;
	25:NFV7X7KhwiDcrV332r6T991mnx8VsdICcvd83DICvIhKhQ81O5SENsnbsp2BH4pPA+S9ljoV8pm1fQSeQWZ6Pa1fAgE3qz1osclL6v99Ww3te6YjzYtsSG25GpaPYeOf1rsqmiC1PRj5zAS0VAik+CeTt8LGfgjjZJh6l57bFYkj9ujxmOphC2PbDyC9GY0Ug4yDA7eKtHq7Mm9O35lUU9RM39rIcZ42qGoTRNqrop4HOJ2OLoswB4VHQWRWd/99tg3XnMwSYyHk6dH9Gj4gh5S6WueeL2k9k8REu/sJaLxNuuBa+K/gbJsssNdxdswUq6MH1hu6Ca2bBwhY32JZag==;
	31:KftmGaqSP3/xKI2mabrU4LpU6oRQL2UpQZwnAv6DibT/EzFfjxW+/bnJr72YUi+qwWDRnYkYztVsYPNITYucVhLGpplRx3uTlqOEr9CPBIcwpVsNoPx50JYsF4kjJpOa6/lqTsBdVHAa0pEx3uCxFfz2TL/bykVO5VX6mNvtwmxaB6VzdlJYVOjghb9nvL6r7v1bRxqoBz383FDkXxTcoEj9Mw/j25Vw1bg623FIJfc=
X-MS-TrafficTypeDiagnostic: SN4PR0701MB3662:
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0701MB3662;
	20:VpFbfLQjKWxgGLvFMjHFjuKR8ndkgQ5A/rFrw6PBUojlKhV2hRp5Ls+wamMPgtQRSGlhgLmJLhUIAKLAagEuRDiX4bp5b/CHBj777k7N7DJGVhJAAouSuU5aYt54Ov9yn1u0+1eCTYLaQwTqMtO6gqwjyYDoqs8AFbsVJvy1utzZJTw9uAcxx2n7SlhxIiZ+JV/i16PrtNuW3AcGTg94hdS5S1b5LNQXRXBw55PW1GY11PBI+NwLM9AbzJQ13AI+7twCV6b5HHjhiLQl9Xd+ANq7Kzn2uAh9mI7RYIXk8LisauF9FNu3xQMU454cSNh2yTNFdn8z+iWWGMnD3NGaDP+NO2p3FI6WcK3lnSLU8zNi0BdRmL8oDuSsKIbyaE2qY0molBsaSy2y1Pc/ZIr99XCSOACf4qNJewJULKtlxFOhYqHzzG+SCSN6Rzt5nJdtbKJAPy5x3Otvkq70tejyTlRTm12pWkSrSdF1PVGwOWgkLpshsF++hCrOVH9sqTVjfJK0isEvoJdHJuUDJTxm8/+7fDM0AriYoMJjZx3VeYqA1PsRkT9es5a/9NVAiiGhJvjL2fmRU8FlyVj7AGMYzlIUfl4knpPkReYsU6Kwb44=;
	4:ojYDQMH218u/POwRvdazrVZ6rN+FqKvOrqo+5ZlzA3hU+hSx4+8k95/BwMO//DEiquSOeQx8fF5JhCAWa/K5MASlI59IBEtW6BSxxBw+XlFhK88zf1GMmicwU3KDAKYSLpZ5E8KiHHNr2JTeYDYzFTUlRAjqRzpC9av7d1xxR0xad0uyEvkMSLaF9z5O6vDvc6YfIohwq4EXQ3+7tDdfI/Cjp3Ywtng0YcQHnFf/v4qamlHjaYIDFiX2nN3LAX/p
X-Exchange-Antispam-Report-Test: UriScan:;
X-Microsoft-Antispam-PRVS: <SN4PR0701MB3662AF0FBC923E04D55FF867FE630@SN4PR0701MB3662.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(93006095)(10201501046)(100000703101)(100105400095)(3002001)(6041248)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123555025)(20161123560025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:SN4PR0701MB3662; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:SN4PR0701MB3662; 
X-Forefront-PRVS: 04347F8039
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(6049001)(376002)(346002)(199003)(189002)(24454002)(5660300001)(8936002)(8676002)(36756003)(6666003)(81156014)(81166006)(31696002)(189998001)(50466002)(7416002)(64126003)(6486002)(77096006)(229853002)(4326008)(33646002)(106356001)(39060400002)(2950100002)(42882006)(105586002)(68736007)(107886003)(53936002)(6246003)(65956001)(66066001)(230700001)(8656003)(2906002)(47776003)(54356999)(50986999)(76176999)(23676002)(31686004)(117156002)(25786009)(53546010)(83506001)(72206003)(478600001)(97736004)(316002)(58126008)(16576012)(16526017)(101416001)(3846002)(305945005)(6116002)(93886005)(7736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN4PR0701MB3662;
	H:[192.168.46.114]; FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1;
	LANG:en; 
Received-SPF: None (protection.outlook.com: cavium.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtTTjRQUjA3MDFNQjM2NjI7MjM6YzBtV1NPZXBKdjdnYUdHMzR4dnFYWjd6?=
	=?utf-8?B?am8xTkhTNlFTY0dJWGh2N2ZPWXMrZUwxRGN6eFU0Q0I2UGZmR1luOExSTzF1?=
	=?utf-8?B?ZDlrQW9wcE5TZzg0dHNVMGJvRXlXTHV0SmorMDNOVVgwRldjNnQ2VHVQR1VZ?=
	=?utf-8?B?NWtqbFhNWHFuNlF2dmNFYWsrL2lOYVhIRXpVMUVtZE1KTWNDVmo1SkZNcVpR?=
	=?utf-8?B?R2dRWUg5VEZQZERCN1pXRG1xSHVTb2U0d1lhMTZLaFloQ1lNMkNmL243Zis2?=
	=?utf-8?B?SkFNejR6dHUyd2N0d2Z6RTdvZUR0U2NtdEFINTFDaW91ZGFOcUgzaTVRQVg2?=
	=?utf-8?B?WGorMUppTUp2eG9RR0dXODB0eHd2NnFYU1VLajZHQ3hHY3MxczM4SEFCcmYv?=
	=?utf-8?B?S0ZzY2p6STc2WkgyaFVBNTFzaCtxQldycHBERUUxUnh3My9TbDMycU1mOTdu?=
	=?utf-8?B?V1h4TlZvRkM5ZDdCQ0owS2lKNGdCZmhoTUhPaTBxMnVnTW5MM1YzWWw1Qkpz?=
	=?utf-8?B?ZmFJTmpjRW43ZENlb01aUUxEN1NVbi9KUUdFVTNoTkRiQWs0OVdCU0JLV01j?=
	=?utf-8?B?RmxDN28yWVlzQ2Zhd1VwcU5YcnBtU3dydjZSK1k0dUJhbE1hbzVPeWs3OXZm?=
	=?utf-8?B?ZzlGeFIyMFJSazlNdVE5Wmcra3lBUExTNzduZUJSVVp4UmhDUTFjWldmOVJY?=
	=?utf-8?B?NUlHVlFNVWJLVkI2dHppWW14a2lDOEp0ODR5emdFWE5VaHNGL2hDMFpYL0dY?=
	=?utf-8?B?SHo2S3IvZTQ2Rk9BMDdpL05wbG9QbDRENldWdHJIaUtRK1VzbXRWbVBRMmpz?=
	=?utf-8?B?eXFZVUMzTFkrSXZSdy9uaGpRWCsyR0Z0S1B3ZVo3UUJycEMvRENvYkNUUWdt?=
	=?utf-8?B?UUhQTkJiQnRkYnRNNCtLTmd5c2U0bFJpSlZSeFdyVjluY1FOQzBnNW90MXdk?=
	=?utf-8?B?TGVnYlh1aXBuMUt0TDNPcUk5cVl4RFRodFU4SmNJb2FCYXZiWllKS3dHbjFx?=
	=?utf-8?B?UmhoS25BOVhwcVR2S0VMTUtDWkpVMVg5VjJoQzFTQVZxVHlxNVJzQjBtaGkv?=
	=?utf-8?B?SWw3QWZoOWk2U1QwTnpKRkdsTmlGWlZYcnA4V3hjb1ZjUVhhK0ltZ2pDMi9C?=
	=?utf-8?B?Sm9XMEhWblRSanlMaHEvalhpY21INmxYVEFZc2RSQXdUTS9TNXluVTFnUEw3?=
	=?utf-8?B?U2k2SnhtRUkrV081ZlNuV2pVUTl1MnRDTHk1cHQ0bi9MSmNBZytFMUpubCtG?=
	=?utf-8?B?eXg3eSt0cDc5dXdBR3F0YnZBNGMyN0F6VHVEZDlyMDZ1KzlPVmI4ZFpiZUZt?=
	=?utf-8?B?U3QwdTc4a2w1aFhhbFM5UURteGpwTzJ6TzExUG9yYlRpdVIyMnYvcUNVNzht?=
	=?utf-8?B?NjlJNis5UUJMSzV0VS8rTm05RGxGb2lBWjFrSWpJVVFDZnpEcTJpYmEvYzZh?=
	=?utf-8?B?cnJQY3RmbFdHMWhVdFpXK2EyMnNhZmdMc1lwMkRpYXBhcDhNMi96TWt3WVVK?=
	=?utf-8?B?dlVwRmx0VDF4K0loVXlIMDhINWRkY01LRytoZkNZRW9XdFRYWjJadEpSenFz?=
	=?utf-8?B?NGNTSnJOUUpWR1pyTURQanU3YW90Z0xnczh3SEpiMVhTeUluYm93SFBPUU5k?=
	=?utf-8?B?WWc2ZzVML0Mzd09PbEpjOEIxbFRPZ1JJRTFvMS8zSUZtRjI5VWx4ekd4Tmw1?=
	=?utf-8?B?OHozMTMrTFB4SGVFSG54TmRXaEJSdjdVRncvVHhsNVJnOU5SUU1lS3lIdFRJ?=
	=?utf-8?B?VlFBcFlWc1dDOU1tSVYvcVJBSlBpOVRNVHN5SExYRktKeHBBdXBuT0JGV0Nw?=
	=?utf-8?B?MUpXTDRiNTRzRU5mVFNtbHUyZldaeUlxd0tLcFVOTE01R2EweGl4VnVtZWpL?=
	=?utf-8?Q?1CnbMjCN9sdCkv6sIwqLwMrygxLg6NUF1s?=
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0701MB3662;
	6:L5+9SJ+mTjRBKDwiLz3enU0n84LPTyiz9nuLHm2eR8ennncbP+v2BmP9QLRT/0AdHOYutlxXWjlzLCS6b6sY0NXtujQeWLNwA4DLyiwwFLzwqhmyDToqmVzkX6UlZ8JzntfH0WU4cLSjxGeVfo2fLBIqD4siS15Lu9Q3de4tRmxJHTTcdWJM1H1/4Ts7dk6if+MJkxHoBZRWTJlisvLhHuEzVD586AK+jcSx7UksnzQb38PFy1w3B8ikaTyAvWWGExy5uiecnR/RMYPAAQ1Rb7EoFEd6420WOZIu0KGY/O+/Tp47/qf6IKEzA9FGNCOQS3G44xRM2ESFqVTz9VBCVQ==;
	5:q/xjHJwcRoUtVct3WoxT4zrX8cuH13+tfyd2ytDnVI/raHg2YiL8qxUKXTm/Nme786cxfHhU3bvQvtGa9D22bRnp6fW7nV5AP5FYv1QqEXfCd9swkVhTFZtD9T+MxuEDMgcDnnS6YV2mvNei+4AAAw==;
	24:ehd91IDpQipdKqL30dosAJXR+XmDK1Nz5tw7inPdueYmuJkmYi8HaHldbmcjxXV692fyd7wQsMq8AgZ6mHmmd9vEdrPAbwT4yzqXMdhAz7c=;
	7:MLBQ6PJvQpaS5nIEth5/xJeuxKYORrHzG7fqguC21XFG2SfvUpwtAlSwpUe+yZ2VmNzZcBU9Yd0uTY6HiUZaZoC1I6j0wClGci5kwtT30xmV48DdqmPDz2EOU6XGukf99Z/vwBQ2BSW+Hsq4q20vcoAQdPSLpzvMmtCpxM+23h8Fl08Pxa8y+L0FOmjYH4Xkto6Uku7MZmR+0OUaTyIIzwShwdTHWggDjKjOyWrYs1o=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2017 09:50:44.8783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 711e4ccf-2e9b-4bcf-a551-4094005b6194
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0701MB3662
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.40.82
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
X-TUID: c2uF5Uuwr8dA

Hi Eric,

On 15.09.2017 16:50, Auger Eric wrote:
> Hi,
> 
> On 15/09/2017 12:42, tn wrote:
>> Hi Eric,
>>
>> On 15.09.2017 09:30, Auger Eric wrote:
>>> Hi Tomasz,
>>>
>>> On 14/09/2017 16:43, Tomasz Nowicki wrote:
>>>> On 14.09.2017 16:31, Tomasz Nowicki wrote:
>>>>> Hi Eric,
>>>>>
>>>>> On 14.09.2017 11:27, Linu Cherian wrote:
>>>>>> Hi Eric,
>>>>>>
>>>>>> On Fri Sep 01, 2017 at 07:21:16PM +0200, Eric Auger wrote:
>>>>>>> memory_region_iommu_replay() is used for VFIO integration.
>>>>>>>
>>>>>>> However its default implementation is not adapted to SMMUv3
>>>>>>> IOMMU memory region. Indeed the input address range is too
>>>>>>> huge and its execution is too slow as it calls the translate()
>>>>>>> callback on each granule.
>>>>>>>
>>>>>>> Let's implement the replay callback which hierarchically walk
>>>>>>> over the page table structure and notify only the segments
>>>>>>> that are populated with valid entries.
>>>>>>>
>>>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>>>> ---
>>>>>>>     hw/arm/smmuv3.c     | 36 ++++++++++++++++++++++++++++++++++++
>>>>>>>     hw/arm/trace-events |  1 +
>>>>>>>     2 files changed, 37 insertions(+)
>>>>>>>
>>>>>>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>>>>>>> index 8e7d10d..c43bd93 100644
>>>>>>> --- a/hw/arm/smmuv3.c
>>>>>>> +++ b/hw/arm/smmuv3.c
>>>>>>> @@ -657,6 +657,41 @@ static int smmuv3_notify_entry(IOMMUTLBEntry
>>>>>>> *entry, void *private)
>>>>>>>         return 0;
>>>>>>>     }
>>>>>>> +/* Unmap the whole notifier's range */
>>>>>>> +static void smmuv3_unmap_notifier_range(IOMMUNotifier *n)
>>>>>>> +{
>>>>>>> +    IOMMUTLBEntry entry;
>>>>>>> +    hwaddr size = n->end - n->start + 1;
>>>>>>> +
>>>>>>> +    entry.target_as = &address_space_memory;
>>>>>>> +    entry.iova = n->start & ~(size - 1);
>>>>>>> +    entry.perm = IOMMU_NONE;
>>>>>>> +    entry.addr_mask = size - 1;
>>>>>>> +
>>>>>>> +    memory_region_notify_one(n, &entry);
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void smmuv3_replay(IOMMUMemoryRegion *mr, IOMMUNotifier *n)
>>>>>>> +{
>>>>>>> +    SMMUTransCfg cfg = {};
>>>>>>> +    int ret;
>>>>>>> +
>>>>>>> +    trace_smmuv3_replay(mr->parent_obj.name, n, n->start, n->end);
>>>>>>> +    smmuv3_unmap_notifier_range(n);
>>>>>>> +
>>>>>>> +    ret = smmuv3_decode_config(mr, &cfg);
>>>>>>> +    if (ret) {
>>>>>>> +        error_report("%s error decoding the configuration for iommu
>>>>>>> mr=%s",
>>>>>>> +                     __func__, mr->parent_obj.name);
>>>>>>> +    }
>>>>>>>
>>>>>>
>>>>>> On an invalid config being found, shouldnt we return rather than
>>>>>> proceeding with
>>>>>> page table walk. For example on an invalid Stream table entry.
>>>>>
>>>>> Indeed, without return here vhost case is not working for me.
>>>>
>>>> I was just lucky one time. return here has no influence. Vhost still not
>>>> working. Sorry for noise.
>>>
>>> As far as I understand the replay() callback only is called in VFIO use
>>> case. So this shouldn't impact vhost.
>>>
>>> I can't reproduce your vhost issue on my side. I will review the
>>> invalidate code again and compare against the last version.
>>>
>>> What is the page size used by your guest?
>>
>> 64K page size for guest as well as for host.
>>
>> However, I've just checked 4K page size for guest and then vhost is
>> working fine.
> So the bug stems from the incorrect target page size used on
> SMMU_CMD_TLBI_NH_VA invalidation. This is now corrected by using the
> actual config granule size and this fixes the issue with vhost use case
> and 64KB page guest. I will release this fix early next week. Sorry for
> the inconvenience.
> 

Yes, that was it. I will provide my t-b for the next series version.

Thanks,
Tomasz
