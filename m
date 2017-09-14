Received: by 10.223.172.38 with SMTP id v35csp943088wrc;
        Thu, 14 Sep 2017 07:32:53 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDABiBs2QElqXcJ2ccj73UMaw8+KoC4LIFCfSki2nid6JxSB53XUWKUsysUaQNkBFECPGJp
X-Received: by 10.200.51.137 with SMTP id c9mr29748689qtb.263.1505399573038;
        Thu, 14 Sep 2017 07:32:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505399573; cv=none;
        d=google.com; s=arc-20160816;
        b=IvntWumMojzjsxjWgmWaPLANhie4BUXTGYup/8g61b9YCjHZyF7thRvLPjiP70qLB4
         HDYPhss944i/UZwrQJGr98e9tWT9+//FL4YaY5tknusQCTjEzqId13tKUcWPVXZlhpZR
         EW/84LsHtgoqw/aq5Box7hDJI/S0jQFwpqNvAXHfHyQL+uoSb2UE3oMeW44bIQiBN35R
         dVuiekSMvneQLV0+/4CAqjb0vguBQxAy18c7Wcxh6EOtXMSZWX6nRODhTkLAvDrBM5NG
         DfHO1mYzkESAKZrF2o2zuuGTjjKjcK14HQvX30svmV0A5mK4dMP2qHnh3w1A0+eiWlm/
         V71Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-transfer-encoding:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:dkim-signature:arc-authentication-results;
        bh=0o7tT9h/31wbsg0qO9t4qnhsVmTHw6RPdVJ9YtBt1b0=;
        b=Vf4PNVreHDMRzFd4yrd64C/f0nHrqg1tVfzOYEtPt0hEpVBe1UGTVTA3Dgpwm32jZg
         dkX44bTktnaRy6/A+yhjxkvvopRWPu7VfU/I637bTk4I5Lbj+jT7HSx/UgSvDQIEXo5Y
         gScVBYx4F/vnFG+Yqb4YUQaHm9xIo1DPN+HDkKU1cf9P0Hq6RWTB100v0bGoRN8cAeVs
         jU0+jdd+HR5LxQgtPhJ52nRcmb9lUcieoCZsIT4kK7lkO2UZuzgfoPOop/dPi59TafJR
         7njmPy134mxWtyM7ly8H3iuuQgJTWI3x83tK/R8ebznE7CCDm092D9UG/qtYifv9JeTZ
         0lbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@CAVIUMNETWORKS.onmicrosoft.com header.s=selector1-cavium-com header.b=U6kkyLXW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 5si7744973qkm.21.2017.09.14.07.32.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Sep 2017 07:32:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@CAVIUMNETWORKS.onmicrosoft.com header.s=selector1-cavium-com header.b=U6kkyLXW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48134 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsVCE-0001v0-MV
	for alex.bennee@linaro.org; Thu, 14 Sep 2017 10:32:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Tomasz.Nowicki@cavium.com>) id 1dsVBm-0001bz-Qt
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 10:32:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Tomasz.Nowicki@cavium.com>) id 1dsVBh-0006ek-JW
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 10:32:22 -0400
Received: from mail-sn1nam01on0066.outbound.protection.outlook.com
	([104.47.32.66]:12761
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Tomasz.Nowicki@cavium.com>)
	id 1dsVBh-0006ae-5h; Thu, 14 Sep 2017 10:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=0o7tT9h/31wbsg0qO9t4qnhsVmTHw6RPdVJ9YtBt1b0=;
	b=U6kkyLXW8IlS7m5/zqQfiYJBQSLtquoeqRq3dxtwdH/7PSiEVNb/cX66AmUHjyyIXOg9Pk8tZqI4koZTedosPIy/es9/nz/PXpMW/rRtPf4AIkwkOz/Ykp8zHlzWeeeRMUFDOAZbtkTCA3t3OCakMrWJ/PVNRth8Yxzcgrjo6/g=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Tomasz.Nowicki@cavium.com; 
Received: from [10.0.0.85] (31.172.191.173) by
	SN4PR0701MB3664.namprd07.prod.outlook.com (2603:10b6:803:4d::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.35.12;
	Thu, 14 Sep 2017 14:32:09 +0000
To: Linu Cherian <linuc.decode@gmail.com>, Eric Auger <eric.auger@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<1504286483-23327-14-git-send-email-eric.auger@redhat.com>
	<20170914092751.GA3336@virtx40>
From: Tomasz Nowicki <tnowicki@caviumnetworks.com>
Message-ID: <4dbbccae-64e1-f4ac-4dcc-3abd9766f324@caviumnetworks.com>
Date: Thu, 14 Sep 2017 16:31:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Firefox/52.0 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170914092751.GA3336@virtx40>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [31.172.191.173]
X-ClientProxiedBy: AM5PR0701CA0056.eurprd07.prod.outlook.com
	(2603:10a6:203:2::18) To SN4PR0701MB3664.namprd07.prod.outlook.com
	(2603:10b6:803:4d::18)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d0dd8a8-9f81-40b2-8b62-08d4fb7d641f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(2017030254152)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:SN4PR0701MB3664; 
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0701MB3664;
	3:i4xWWKZg84bhqFFwlNSLXwGzuT6DNOROSUX45fy3mz3RfpWTaaQu06jPCNTfp073r4InrLROEyolkA5aku3Qi1dzT4+xhZhIgU3geu+4Em2os7PGgGwuqBfqEYyVmO9h4EdID19KnMtxDQUZvytlOFZisVU2p43w2ct7WyDaXWYzDWptXKRVAfDwYhpe5goKtSxRHB+yBkBEkI03mTHtsyqOCsgvvYkfmqsPAd/pAxu655+g2acRtC6fIOb+Q4kX;
	25:tKY+VRP0RaPTJ6ymFK3IqoDVkFZR424HGelxoyS79jiKk3UkcBqFB+ChuyRTq19ejelqjf0ODTPRr9MYq3PG4bMLgAS1uGKZmH535V26X3IBjeaY0jdr+caqiQo5MPANok58EMgbH/RFK5iyTJtZfbArdCo/Jcazy5dn3jWk5haDFXJGj+BicxA5VE6n9F88+MWG7aDY8MEGgduEYbgaLQ3m4k/cQILvQYnTfPXFzJ2npk5JyNr4dkAh/x1nXLfmvB8CzKyH+4XjA730oz7lHEnrWPbdzkvlLFXgseU2ydryAgvjytMLYlyH/ny8viQTCEIq5WbLe84HhvYf9rv/Aw==;
	31:uTRiQwpvVtHtvVE9h8Xpar96LK2OQ2j4KXmtw/zO7d9zqNmN4fphjfT9zuRynwUs+6QQAPoBujW1W0rC4V0I6X6bZ5HzkPTkyea715Igr8g6rNZhhBfI6cYCTo/N5WMgqisks5pOZ5OiK0/Kik3UGuAm9W/Ye74H2t9S/7UAjH0IP3WhUd21vmeLjpXS1Jski2cldVB38gR2CGfJpduycIskUyTs0ROHAv7B94fIRMY=
X-MS-TrafficTypeDiagnostic: SN4PR0701MB3664:
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0701MB3664;
	20:GOseN1wWjnQxyyFR1Lfktsg9J9xgPwiLRD0cn0N2N8dQBI60kVZa4yv0ArfAuN2xPjtx7EP36ucIUJogjlH0gzo9sI9A/A93kscptpgRkWZREGJ7Si3Zc/v8P/pUq7/U+y26D2rXo5FpqcbYVmv9NS6qiY8wCFGnLqjJj9/kNqqSgcmGtRcns9bJZAaFXRbwEp9IbvW8caKYnQBGdPu4Vqk9wf9pGgfE8QIns6OVDzqh9aQuSVET95879j7HtQvuPb4jmC/TsSOaPnK7sGCSDQ0XuNn7i40WCq714y9GDpLQi8tvEW4P0Sq8BU6pA+eS6sOeh1JEaEiA+jgBmZ33VshqHnfM9HhFj+Qp729BFKCmMsAHxiVtIWaBttvdMlg018D9QV9ItoA0n0SHODFWJkMzKHwcfKv5q33x9rE61qAJGffu3A7xUk+M8dU32xi8tXIKrwTsoWyx9ZNe8jUTcCfSS/5qMBlwrB8hQKPXdd0t4YPlWDuaPyuU5cRKv6E+R2XzSiOt79himIlYf17fRDqgOYGJFNQwOb+VlXgntxCYh+iptRoFSfA0iiXY1oTkLFVVk+rorLV7ic13IzPYSmDsJlrbu5nJhu+opteL5p4=;
	4:j3hdqxURhxkCiHplA2vuL/Bb3oBvr6l/TGlnPimi41ma/z0zrltKjvv7Env2syT4rOwe5pyj3LfqFnQT/gwsG7TkmS9yFYek+gua/Q1WvS+o0BW6fP45UVdNpnacWXJVPWoflTEXqjQez17omIoiB2RWOaLyP3GJ9XKvY9t4DN62N/I+R4MBbAI9sX1Ca44iEI0uyIaNHxUzz2ovNqCLtkXCg8+Vkdm8+ltfi2Pb6RD1q0HUlb265hcSA/DX8/q8
X-Exchange-Antispam-Report-Test: UriScan:;
X-Microsoft-Antispam-PRVS: <SN4PR0701MB36649C3EC86218A35D31E4C6FE6F0@SN4PR0701MB3664.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(10201501046)(100000703101)(100105400095)(93006095)(3002001)(6041248)(20161123562025)(20161123555025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:SN4PR0701MB3664; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:SN4PR0701MB3664; 
X-Forefront-PRVS: 0430FA5CB7
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(6049001)(376002)(346002)(24454002)(189002)(199003)(106356001)(53546010)(33646002)(3846002)(25786009)(64126003)(31696002)(101416001)(76176999)(50466002)(478600001)(105586002)(6116002)(230700001)(54356999)(97736004)(31686004)(72206003)(4001350100001)(68736007)(50986999)(5660300001)(8936002)(316002)(107886003)(77096006)(83506001)(81156014)(7416002)(8676002)(36756003)(47776003)(2906002)(53936002)(6486002)(4326008)(81166006)(6666003)(229853002)(8656003)(2950100002)(42882006)(66066001)(16576012)(16526017)(6246003)(189998001)(23676002)(65956001)(39060400002)(305945005)(7736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN4PR0701MB3664; H:[10.0.0.85];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: cavium.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtTTjRQUjA3MDFNQjM2NjQ7MjM6cXRxVGJ5SURUZXc1TGxyN3RMQk5kbUhy?=
	=?utf-8?B?V2d5VGR3R3k0V1AvaTFzUkR4aytYcDZ6NlRGWUpJQWVRTCtWWVhJbTd6cFg1?=
	=?utf-8?B?WXEva0JGYk1YVnlhWStMa1cyY2V3KzJDOUFDNUxpaGpoVmYrMUUxejJ1VkNy?=
	=?utf-8?B?UVRMc2RMdDBBQ0dFWGoyTlZHVmdIdmF0a2ZxYyt4TytuaUxJc0Qwd0hPeWpU?=
	=?utf-8?B?UDBPYm1US0hNZkdMTmFyS3ZjTlpBTEZ1L3ZmRmtqajJqVEFpTTlSOVhlY1Jj?=
	=?utf-8?B?ckRRMXhXK2dzTC9tSG9HOHBWaHFZbmRwdUlDdFUzS2s5eXk1WnNxZmxwRDg2?=
	=?utf-8?B?QlBzNmpuU3NFNGpMMHEyMEVnOVdMVXM0RXhSa1JPVXNtR1V3S0dITTNCNWRS?=
	=?utf-8?B?RlhRbXZZdC95eWNyRmtoZktjOS9makFlcmxsRWxHNGxQOTF2NVRpNzJQNTJp?=
	=?utf-8?B?eEVnMi8ydy9ndVZpcVlMVGJPYWw0TVU3cWhqMGp1YU5WYjdwcjI4WVNmS3BO?=
	=?utf-8?B?b1lnVEd2QzBpbVVxekFVRXlZSGpEUmRseFc2ZEd2RFVPclVSdzNqOFBKU3ZT?=
	=?utf-8?B?L2VpRzNoVWJIS25XNDdUWThnNnZNWFNXL0VmclFmU0Fyc0E3RVJGYVlWMElC?=
	=?utf-8?B?T205eitHWGxOMHRaendYZm1haVpNMzI1Z2l6WGhLU3lsbHlOOGFScmd0SE9k?=
	=?utf-8?B?UWFqYkJ0L0ptbHVvbWh2Z1NMVGlrM2JEREhpdWNLamFFbm1Vd2F0Z3JCRGdM?=
	=?utf-8?B?V2Jsa1RmSDE3TnBZbVUvZE9YNFVTckNvM3ZBdExNWXBVOWd2Mi9CaWhIbzVl?=
	=?utf-8?B?Rk42aE5XWUhoZjBlSXZ0RTBqUTMvNlNJUk1ISHN5YThrSkw5S2dxcFBxdkpw?=
	=?utf-8?B?ZjlCRFhCNHZibVoxL1JPWFAxZmlhc041UFd4OE1MejNya1B1K3c5a1BkNjQw?=
	=?utf-8?B?V3pFOThOcklFN1FXRHIxaHRMcTdweHdOQUZNOHQ2cVFTeEk0Y0Z5b1FOV0ty?=
	=?utf-8?B?eWplSDcxSC9sNC9RdTVPeDBQQmptYmd3ZHJSMlUxQ0FvbXdrcnRTdHNxbmxZ?=
	=?utf-8?B?QkFLcmVQZVhlTjhNRXYyeFJITHQyeTZCZlZ3WFFrMmp3eU1YSGNTZXBzTjJM?=
	=?utf-8?B?UXd6bHBtazB5d29LdU9HQnoxZXM4UjhLYTVaM1p1QVM1c0wra3g3c204TG0z?=
	=?utf-8?B?M1VCRnV3TXNTL2tQR2NKYU15dGh0NTRZbm1wekFIemVBZ1AxeVF3RTk4VUhF?=
	=?utf-8?B?Sm9NRXJBZTZ1RE9OVUFKeTQyLzAvVlN1eE1VSHNaaW14UHBsajUrMVZLTmRP?=
	=?utf-8?B?QVhBS2VYU2FocTFCTFl0NVh2OGs3ditoZm1wa3RzQko3c080YXA1QXcvdWhy?=
	=?utf-8?B?YzEzS0JEU1BvTHRNV2dlY0FlUTU5WGVjQW1HWXZVcVZMbUFvM0xYVmFqZGRI?=
	=?utf-8?B?VHhmTEF6VDVuZklISkdIV0FhT2ZVRUhkTy8rb1IwNVRpbmZWcjFzcEorLzg1?=
	=?utf-8?B?M1U1UURaL2xlY2NKZHRzUm1yTm1lalIvN1Yrc3lHRFJncUpjWjJyTXJiclpY?=
	=?utf-8?B?S1lZU1VmTE1OczVDR1ppMStCWVRRNy9TclRod2MzL0hSMFlMd1Q5NmhtYzUw?=
	=?utf-8?B?b0hrMTAxeE03WE9KYzhDN1QvYjFvcTB5WnhjOFF3WnNjclBGZTZZWjZMYk56?=
	=?utf-8?B?YzFUekRRTGdtZFRPVkpiRFlPQkR4NDRaeGc1U2VpVlc4dkxIYXF0RWJNZHhY?=
	=?utf-8?B?QW5lL1RFU294SkRLWndjd0dheWhwdUZTWVEvREgvWXlzaW5yWTZEMnhPWG1p?=
	=?utf-8?B?dUVjVjBGZ0s4YWtyV2tuQWJjdHYwRWM3dkJzZjJtNkxobEEzNXNCQTN4amFQ?=
	=?utf-8?Q?vew9WJ3PMfabw=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0701MB3664;
	6:B4JUusgmsN830dLNb2IqP0UiGujfqykPUaNghD/CBLg1Oy0J3eFKplyKuh/5mhtF5Pk3gaJEElfvXzB8rPfJLxQ1AH9EPTUts4sLMbuSOrucDev5Ap4sKcIegLZ1896rZGcAxkbTCj8uNmXBmTrdIO62BkwPvU+jzlcpHQue2FGA3Ie2vwlmPv4KyUS93tsPamZuB79jjHWPgsl8CLx1ZgRzDeHiWzxqNSbe9MZtqCx4QwIF1JsaBqVAvTN8PIALG1pSdHUqSSwH5iuU//R5DEf5osWoOad8LagKEbOitF17uO0ZDUG9eEkEgD60AyhGgfjt0CD0n153dlELvG9Zag==;
	5:rd5N+q6qstouau6kNDXhdsmWpYRpEPGBMjLpLFEclu8pMaNJ3PK03IzmAQqW0OWURd3j1PVXgZC0F6U8bKGroz+0rqE7amD6TBb/bnYjCbjtMvVTBQ4QrMsC5VjfpyzyVMCcUZUsmvc3OWxxvaoFkg==;
	24:rPDexi4K0V/OsTFHNUiHyAPAiasycjXWV2GycHYkXWd3Nb8DfnZLgHDe+DwzcET8/S7nsBlzZ1vXGbhGxZI03CFtVtaSUW6aOGhm5d6qxPM=;
	7:LkgaVkn3a4U6+SjFojUrdJXjNVNkJdQE2VI8jkJ9UoiwrRiZ698qyKr6IyjwHpiwkGCR78EPBuuH8AIAoqrCLBn+zDRAAaib3J8CoohVVL1ygw8DU1Uh19LV2+/04Lzcy58khTQpkSFiHB1K2yo1eF3rFeMEmkbuHau9WfhcVQc+ouNDFSdc262ndGWoWlUNMT+6zEvy8p6DSdo6LGBNTIUfqzEhGzmTWpiQIr1jy8g=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2017 14:32:09.6448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 711e4ccf-2e9b-4bcf-a551-4094005b6194
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0701MB3664
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.66
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
X-TUID: seqUfAjTKS1F

Hi Eric,

On 14.09.2017 11:27, Linu Cherian wrote:
> Hi Eric,
> 
> On Fri Sep 01, 2017 at 07:21:16PM +0200, Eric Auger wrote:
>> memory_region_iommu_replay() is used for VFIO integration.
>>
>> However its default implementation is not adapted to SMMUv3
>> IOMMU memory region. Indeed the input address range is too
>> huge and its execution is too slow as it calls the translate()
>> callback on each granule.
>>
>> Let's implement the replay callback which hierarchically walk
>> over the page table structure and notify only the segments
>> that are populated with valid entries.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>   hw/arm/smmuv3.c     | 36 ++++++++++++++++++++++++++++++++++++
>>   hw/arm/trace-events |  1 +
>>   2 files changed, 37 insertions(+)
>>
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index 8e7d10d..c43bd93 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -657,6 +657,41 @@ static int smmuv3_notify_entry(IOMMUTLBEntry *entry, void *private)
>>       return 0;
>>   }
>>   
>> +/* Unmap the whole notifier's range */
>> +static void smmuv3_unmap_notifier_range(IOMMUNotifier *n)
>> +{
>> +    IOMMUTLBEntry entry;
>> +    hwaddr size = n->end - n->start + 1;
>> +
>> +    entry.target_as = &address_space_memory;
>> +    entry.iova = n->start & ~(size - 1);
>> +    entry.perm = IOMMU_NONE;
>> +    entry.addr_mask = size - 1;
>> +
>> +    memory_region_notify_one(n, &entry);
>> +}
>> +
>> +static void smmuv3_replay(IOMMUMemoryRegion *mr, IOMMUNotifier *n)
>> +{
>> +    SMMUTransCfg cfg = {};
>> +    int ret;
>> +
>> +    trace_smmuv3_replay(mr->parent_obj.name, n, n->start, n->end);
>> +    smmuv3_unmap_notifier_range(n);
>> +
>> +    ret = smmuv3_decode_config(mr, &cfg);
>> +    if (ret) {
>> +        error_report("%s error decoding the configuration for iommu mr=%s",
>> +                     __func__, mr->parent_obj.name);
>> +    }
>>
> 
> On an invalid config being found, shouldnt we return rather than proceeding with
> page table walk. For example on an invalid Stream table entry.

Indeed, without return here vhost case is not working for me.

Thanks,
Tomasz

> 
> +
>> +    if (cfg.disabled || cfg.bypassed) {
>> +        return;
>> +    }
>> +    /* walk the page tables and replay valid entries */
>> +    smmu_page_walk(&cfg, 0, (1ULL << (64 - cfg.tsz)) - 1, false,
>> +                   smmuv3_notify_entry, n);
>> +}
>>   static void smmuv3_notify_iova_range(IOMMUMemoryRegion *mr, IOMMUNotifier *n,
>>                                        uint64_t iova, size_t size)
>>   {
>> @@ -1095,6 +1130,7 @@ static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
>>   
>>       imrc->translate = smmuv3_translate;
>>       imrc->notify_flag_changed = smmuv3_notify_flag_changed;
>> +    imrc->replay = smmuv3_replay;
>>   }
>>   
>>   static const TypeInfo smmuv3_type_info = {
>> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
>> index 4ac264d..15f84d6 100644
>> --- a/hw/arm/trace-events
>> +++ b/hw/arm/trace-events
>> @@ -46,5 +46,6 @@ smmuv3_cfg_stage(int s, uint32_t oas, uint32_t tsz, uint64_t ttbr, bool aa64, ui
>>   smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
>>   smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
>>   smmuv3_replay_mr(const char *name) "iommu mr=%s"
>> +smmuv3_replay(const char *name, void *n, hwaddr start, hwaddr end) "iommu mr=%s notifier=%p [0x%"PRIx64",0x%"PRIx64"]"
>>   smmuv3_notify_entry(hwaddr iova, hwaddr pa, hwaddr mask, int perm) "iova=0x%"PRIx64" pa=0x%" PRIx64" mask=0x%"PRIx64" perm=%d"
>>   smmuv3_notify_iova_range(const char *name, uint64_t iova, size_t size, void *n) "iommu mr=%s iova=0x%"PRIx64" size=0x%lx n=%p"
>> -- 
>> 2.5.5
>>
>>
> 
