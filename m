Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2193581wrd;
        Fri, 24 Aug 2018 03:55:34 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdY5lAlWBB8jIcgoBOGAZZ0ybbBK8mDzBJfK6XNzOvBBfZ+QzHkWeEyEdcarvyuJ9tRc5axA
X-Received: by 2002:a37:ad0a:: with SMTP id f10-v6mr1044676qkm.186.1535108134351;
        Fri, 24 Aug 2018 03:55:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535108134; cv=none;
        d=google.com; s=arc-20160816;
        b=TlIqqj01yk61PII2DfHRAroBZjkbW6Mb3GooUj0QTLm8mlQH+v1eJWv1GgCwxLFUiy
         WHJPimdsvHC/0kIRVPKXVpB+HpllTW1lD3Dwpeoxkhn8W0suA0LORZox0gNlCouhe9Ov
         CcM0SVm21E51V6W4eN0KNvXdi6IvQg/D5m819XB636MrpTj/LG6Sj/kgX4MBOOTbtXYX
         6u9KXi3r7/3eRxhlSOh6YpWJ6XNYeh/juGZWe/sKhALftBgcr/Jsul7DzNdDqtwzjxdu
         zy0i9VVi1kbzjebsfyjH1q35KaRBlkPZZJmvheFlqMw9MEMIfsktHpf5qV76/OukHd9B
         5brQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:to:from:dkim-signature
         :arc-authentication-results;
        bh=QbEpGKI3ZliZy6f8B/5LNCu++Inf5u7qogCtW4VzZHk=;
        b=Pr287sP2k26OBlYMybYGyrS97LwxTqpt+hnz6zMAYT9e2Zh6zB42ofu7YVF42fUUi/
         EtmcCe5yuSVWJSW6j8+/sHMGmc5YRynKheiz7FmYFBL2zsUpPWauVhnsvOqJ4w2An8Ca
         5SLVRlKm2AFbd8gj6Qp3mdDQgknc2IejWSVGc9DzIeUwUAZrBvDZGNxeZ39qBzHyoGDn
         3IREmw4a8E9eOxHSSbvjYrMuJe34ZdCq5J5agBTbyGIGTEdEkRAQpFEFzVDtgvk9J5sw
         z6L+PLh3mLrjDdtOr5WicbgEncVu2BJMVZwmgOHHuOlA0DK/Kv3Ayv7G6BqD/VOup1r7
         iU2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=zux5z5Y4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w12-v6si3720qkf.264.2018.08.24.03.55.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Aug 2018 03:55:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=zux5z5Y4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41124 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ft9kb-0007V0-Ph
	for alex.bennee@linaro.org; Fri, 24 Aug 2018 06:55:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58386)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <saipava@xilinx.com>) id 1ft9kD-0007PC-Af
	for qemu-devel@nongnu.org; Fri, 24 Aug 2018 06:55:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <saipava@xilinx.com>) id 1ft9k9-00020f-Ie
	for qemu-devel@nongnu.org; Fri, 24 Aug 2018 06:55:09 -0400
Received: from mail-sn1nam01on0056.outbound.protection.outlook.com
	([104.47.32.56]:10160
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <saipava@xilinx.com>)
	id 1ft9k5-0001tm-UD; Fri, 24 Aug 2018 06:55:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=QbEpGKI3ZliZy6f8B/5LNCu++Inf5u7qogCtW4VzZHk=;
	b=zux5z5Y4tTZ0l5Ed/wDePy85fWKegNehW0+pwszvkE1Xpa1iJEDbQKMFfYbFxVzP3cOiLKZvPE0wh/TfYg1NYQwSv0CvksRNdal8DPVr5KbSfk7odJfYK0hVZ/PfISS/QQKaszXUaSArHCWYkW9R4mKBBsvPRJO7Uk+IkN62I28=
Received: from SN4PR0201CA0042.namprd02.prod.outlook.com
	(2603:10b6:803:2e::28) by BLUPR02MB083.namprd02.prod.outlook.com
	(2a01:111:e400:811::21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.1059.23;
	Fri, 24 Aug 2018 10:54:55 +0000
Received: from BL2NAM02FT017.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::203) by SN4PR0201CA0042.outlook.office365.com
	(2603:10b6:803:2e::28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1080.14 via
	Frontend Transport; Fri, 24 Aug 2018 10:54:55 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; zoho.com; dkim=none (message not signed)
	header.d=none;zoho.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT017.mail.protection.outlook.com (10.152.77.174) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1080.9
	via Frontend Transport; Fri, 24 Aug 2018 10:54:54 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:42969
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <sai.pavan.boddu@xilinx.com>)
	id 1ft9jx-0007FF-V4; Fri, 24 Aug 2018 03:54:53 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <sai.pavan.boddu@xilinx.com>)
	id 1ft9js-0008Ir-OK; Fri, 24 Aug 2018 03:54:48 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w7OAsloO011066; Fri, 24 Aug 2018 03:54:47 -0700
Received: from [172.23.37.96] (helo=xhdsaipava40.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <saipava@xhdsaipava40.xilinx.com>)
	id 1ft9jr-0008I5-9g; Fri, 24 Aug 2018 03:54:47 -0700
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
	id 4E6DA13C0C8C; Fri, 24 Aug 2018 16:25:37 +0530 (IST)
From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
To: <edgari@xilinx.com>, <figlesia@xilinx.com>
Date: Fri, 24 Aug 2018 16:25:32 +0530
Message-ID: <1535108133-3722-8-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535108133-3722-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1535108133-3722-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(136003)(39860400002)(396003)(376002)(2980300002)(438002)(189003)(199004)(47776003)(356003)(90966002)(4326008)(50466002)(14444005)(8676002)(81156014)(81166006)(76176011)(5660300001)(103686004)(6266002)(36756003)(39060400002)(23676004)(478600001)(42186006)(110136005)(106002)(5820100001)(54906003)(316002)(106466001)(6666003)(85306007)(6636002)(63266004)(8746002)(8936002)(50226002)(426003)(305945005)(52956003)(336012)(2616005)(11346002)(446003)(476003)(186003)(26005)(126002)(486006)(2906002)(1857600001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR02MB083; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT017;
	1:lpIDTUfGk88rN/0yC3ZoxE1FjOBSMxNYPQJ+JiZ1D4g6qiEGZzsBC1IL49rzd2LkAt3T11tXs7KNIW4SGHULupNl++bANR7225Cirz1LmgOFxjDtUd5Rav05Gw5QQpdh
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b568fa8-17a7-4975-f612-08d609b006a1
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(5600074)(711020)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060);
	SRVR:BLUPR02MB083; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB083;
	3:vM13pX38WUng+EjTFFqZm3HylNMoH+1KQFvTvgqoy01GKEIj1LJ1ENT894VnFBIG4PyICgu6oCwVJGujg+iQ7NmTZfjNO9Zy7BqJ3QYQ3Retu7/U+r+vWHrNkwLJD3lqqeNii4WBd61OJ+bih7VVyzyEvLRILy/JwQvUWVeP9RtqSqVn9EEccubq/tS/1Nl34DtHP5c0ckqh1cnuRY9wG5jPFx0agfETMu8tVpAKIsDNdyVU0+WcxZF1Z6Y3M28om1LIz9uE4uZ2vWNP2/YY9HgYXYOn4JsDdBf8Imwpgr6ZtNCAT155CulC2iE7DWUYLkqFI3HzBKtqQYzZzIzgC4jP+4qdFAeC2mAmLwY0BKk=;
	25:TOZXwyhXU4m0CcS38nuEDVIRiGshb9rBOiU2fqixLaWdQJi0TGcniCeAUb7vHYfCeCEeh2RMFHUrWe0HOHaCVydFiBapP7LJHOV2ZzDBzS8IK9OnaIMkDW/hFrq8QAdbI2bzRqmTV6f0GS4eYPWsnB535yCHP5db01JzO1Kk6oYfVTUTbXe3Ib+WYUYCDdfLccq5oYik956eW8Ep0wuehJ31Q5/ukLjtn44TXUlPjsQ8XChYkp2epu1anV9x8Hfbjg7jkGjlV+0aDgcfa9VOSq50HsAKlHmDXK6vTNbdcA6hln4eQNY88ptrDbELPP8NFju2Kg3UNd2KHG6LjGnexT+7qwxhS6Ji2P31UmZ1Cyg=
X-MS-TrafficTypeDiagnostic: BLUPR02MB083:
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB083;
	31:+JfVwihx3IohvFED1vT93a5cHRfbmSSZAjaaAo1eV7uGtG7S6fuf+Qexy5ahOExjc4npAmPOAAUB7B7slu8khsjSK/S+M+m1NCr/si2O8nwqYl98Rj88dZQ2dQvOsur74nH7CmUIUV0k/eK2dqgKdv55+NpufGNeCfpnrP0kHuhPfmupUHf2gV9TNSp+Vac8qeo44d6ta1CJurdkE8JH97die4QvJQgtkj473Wf+BMc=;
	20:lGtIBtfLOlyQv4I8yJtnwczFjxWpba30g913dAYvbDe/ysLBDHTj8lkdS2LMn6cQD127MXGI9gLSWbJ6hV7AqkSfxGobw1fdsK1Ab4AfeNsXxpbZgW2uiJV25sr+1VRr8f8yMTGwRBpA77pyDGhg6BHGM+qa8FEOmAhTLOCUcCuhK+FhYa4sq7MAUqm7IgYe5wDbMf4o/n5oumogmb1GuL96Z68HRQ1YGQPIv3W3QmCZho39XyXmGWJlo2YoumLLAILr7hmqO82TftZrq/cJed4wkAHVU9no7Vk+1umxkkOChPXRrKkPYVYPpLmlwJKI3JwgNtcQVmGb7Nq727zNL2l4VaSzT9ptQLwOQ1H80YmUVcQdgmmq35w4Zd2FykT2u3HVmEqZ56gpmNdFy/5G6GLOqVRz5iiZkyYwlPlRptpI4brNYdpLYbgybHyjnp0YB7AjhGWiRwYHuecwtantkvAerBJsjeptmpUSP2tQM1TK/ham3x+9QZEih51H+Sq3
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BLUPR02MB083B549977DF37B61E62723CA360@BLUPR02MB083.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158)(247784426924974);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231311)(944501410)(52105095)(10201501046)(93006095)(93004095)(3002001)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123564045)(20161123562045)(201708071742011)(7699016);
	SRVR:BLUPR02MB083; BCL:0; PCL:0; RULEID:; SRVR:BLUPR02MB083; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB083;
	4:hKN0ZZ7rIX7iIWF8XWVtcnz/bpYIQ3C3luSZ4wHworQ2PL/Va/lMb3VsIwZk8TgEcitEXmQMkgatY92/5lbtfYlUlCyVTSGOMld+o3uaM0YjJQHl/8xCGEqPd89Z/q89pJCH7a6KyL6gq21casg6lalEtVEm2+mmTdhtkKY+F9yWCEVckjiOAhI6uqQLaxjK3cRhvMXF0X6+X6c7v4EX9plJwUdjuVFOGM9N7SsjmAll5BRO5NGFkeo4yX5RX4eJak9y5tO6WQJHFEOanPMypf8XwbRZfvzFNRqZrhWYqTRPfMga0HEPKueBXRNTdGFOMUnppa0RhVcqEUaIXpG7fU/YAZJNghFvswF8+8myoGY=
X-Forefront-PRVS: 07749F8C42
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTFVQUjAyTUIwODM7MjM6cU14QzY5TDZuaHgwKytWZ29UVVNKNjMvRUVL?=
	=?utf-8?B?NHVWUnZ4eXUrQ1cyeVh1U0JSVlJ4UDg0TUxIQnhjZWp4d01WSC85NmljOGRE?=
	=?utf-8?B?eXpQclpqb2JIMHdiT0RpclRNVmhxb3gwYUYzWkRRa2V2emREeHlhVjhVWmpB?=
	=?utf-8?B?WDRpaUh2UWVtZ21rVEpJdnNDQy9mdUJMcWZZRE9QWGxNZWxxVWNzM1ZpbVdR?=
	=?utf-8?B?cWgyT1NweGtLODhxTnZRQWFoZE9xZG5wQWxPZFN1c0V1VUJvTkZacUV5NnI4?=
	=?utf-8?B?Ukw4Z3hKREZkYUdFT0cxb1huUnJOMkxKbll1M0lXSENIamRvVURZbU5oVHVL?=
	=?utf-8?B?aWhwR0pkWUpHMXJNY1htNWU5MlpJVGVKZ0JTUlh5S2VkM0R1THUzY1NQc0hL?=
	=?utf-8?B?aGhscU84eXZNQmJnRWJKRGRVZHFmNG8xSTdYbEF2cHJ5YzRHOGZQRmJZSVJa?=
	=?utf-8?B?NFhBVHVab1I2L0lrNVQxTHhSQXZWOGliK0ZNeitFWjdOQUdqWkNwTkpWZnZ0?=
	=?utf-8?B?RFJQMXdXTnFaSENVck5ib0VwMWlVM0JiR2JBYVlWNDVzdGk0bDA2WmI0TkVK?=
	=?utf-8?B?MEljQ2pOcjJuWDcxNXdMMTU4OEVldjAzTWthMDI0cnRqa2xHZXZxZjdSWFdl?=
	=?utf-8?B?bVNVZkJTdWxrdzE5Y2w4ckFSNk8zaktxaFhqSHpVQTM4ZFZ5MzM2dTJib1hu?=
	=?utf-8?B?QjdNOFFJdkM2R3pDbVpiZDAwL053bEUzWXlTb1VUVUpHWmZGSkl2eGJWc1lr?=
	=?utf-8?B?RUg0Uit2dWIxUkEzTWh1R2Q3cFBCK2I3TTVGcHkwRFh5azJUMFNobEZtWk1t?=
	=?utf-8?B?akIxRXZ2eUVSWUFhcXE1bGZjbS92NmJwajN0RzVjY2FIZEdUV1JPNU1KUUVm?=
	=?utf-8?B?WlZKUFVGdHRZVzJrRERkUUlFNERSeGhFaDZremxrS1JKUHVJZkMzVXlLeUlh?=
	=?utf-8?B?dHQyc2g3Y2xuZlRxbVFnRFJTa2Y4cjh0cllFWDFxQldOMC9ZVkZPTFpSUUgv?=
	=?utf-8?B?ZitITlE4eTZwOGxHSE5KYi9VSlpjTXA1NXc2YmhQbUQ4QkdUQnhzRU5XZkdv?=
	=?utf-8?B?bDAwRTZOcmhkZnM3TkxwNFJoZGRhbmNqZXVMVHRwQW5JUlNQcVpvMThsUE9z?=
	=?utf-8?B?K1ExWXZVZHg2VDZ4aFNoai9hUGl3T2Z3SHBZQnA1VFduNHpOa2lBUE9FTGZq?=
	=?utf-8?B?K04zVXQ2TkwrdVZrUTRkdjZGNmUzR09qaGN1RDl2L1NHaXJudk5IbDYwMUpt?=
	=?utf-8?B?TFhrKzMwZktOMXlXUWpjdzk2YjhSRks0ZURwNUNuYm9uUEZZQStMZHAxMG42?=
	=?utf-8?B?YUJiUlV0emtiWkFwWmN4dXVQYWVJUkMyekJtSlFldUxDbDZUWEV0TDh5Rkkv?=
	=?utf-8?B?YzMvbzgvZ0MyQk41MjhGeXhJeWFpZ2l2ZnBFbnNCNXRYakxDOXdxRy84cTVn?=
	=?utf-8?B?bzJOMHF0U1Z0TUZuQ3BmUDQ4OFNXQVRMTEYyTnVUQUJLa29IV1hWbWUydnZR?=
	=?utf-8?B?YWVQa2xRVnJONDdoRUtKRUFjVW1ZaGw0SEk0bnlTTzc4YnNCNXZKaUxhKzBJ?=
	=?utf-8?B?dVNRclZURVRsRGROWnl5QVRrS0Y0aEZJY2I4MzNjenRRenA3TDJnMjJHTFFi?=
	=?utf-8?B?Wkk4emd0bVkxSFhRRmg3RGF6Y2RZaGVKd01VbEllbGs4WFF5ZTNXWFMraDVv?=
	=?utf-8?Q?Xgrb7ex6Ko9yS6wBY=3D?=
X-Microsoft-Antispam-Message-Info: 9HGjtLcI8rh3SJBdCRFowBxqAd/ypcpzAixaiQAIrAviWDijEzlSSdGg5h5X5sAKG0ML3sEbnNB4O2lE3meIuz4UAATuoPdyhKkFs0Y625bzlXViA0pVDDljcX72j0a6FQ++50AJnulQcofRNjdjW5bXnlAsEu/JIDqN6XjBcHryBhlY6oxbTf3MlPQXtFUYofAnFvXu4jc/wkBq0ZxjvqODXZXV1VTMhsfa13DI6Uscn0Quq6U+ABN61fqzTJOqbddfuFFKtwa/nHRLR1m4aBh+3C1rGIMeCUUDuOMm0klQ0UAOL7W1xpqLknap6HkLJ1cZJ+JTDR5JYeA8xt/sAIfsD3JG1wc44dNx/FoEK/4=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB083;
	6:MwNx/UGpMGZOCVj5bMoyuSS49SkVNhKA21DPCoeE3qoGa6eVKkBb0yZcyReVZaCTv2eUiM4+l+mw9DQ0RsLYTWE+b4Be6UWsEKrGMBYSsnX/cImBcTQJHL0GZFHtYU+uBU/TcYdY7XsOvkeHdUhn/kOD1VSEIQj5kumQWg6zZHnTcRE0b3pIBrfFhv+zR0fTsPIOazMgT90VvlXgk4s9t1xBEG+Q36mF8zJEUjlahZhPjlvuQe3tKTxy25apUIdKvuz9HTsqZr621YntEGz93Gvr44txG+f66qcQrhbp+9O/3NP4Bz0rtkPHnEJM5+gmOrJHgvZocwoO1oxTNR1C4P9UjSkp86nXLALaWAINM6KVYq3n3wg0JtUkEfyxwKwk27SH4woiO4+a5F5gM7culKM11Ma7h5/Oe6JmXhmtNt9Xh5bCZUF4yk9mDTvAGsVdCo6oAKBPTBvs38SL49zRFA==;
	5:/IPTaS6RrWjYRiClcPbCvkSrAFrO0kqwiHr7EvYH5PgxjuKHbOShN9tIfxBZMZoUqgeGjJRbOFZk3X1heOVHNuQgtoBEfAaHU5Fle1W5OUuBkO/xhtfa+UWNcm4b+86fTUXYGT2+o5s1dFPghaVc0gJMyAlsbXMZQl/7IxbSFVw=;
	7:qPPYcYyvrppEKxGxDm3cCBVylg7FxMng3WNUuOR8+oh5YKEKb/nBHOp7kWboLLZD282HCVmrb//bZRmxsPhC/bnxvEadM+PQSF+P6cfVRtm/Zw5Iub8qhWdLqBkOk2wyrfdp7CSTgq/deCU8pUGy5pb7XdWgsc/YiH5CRPP5ZCXMJ5ndAME4mYaiPktB4OPhTRfwvhBnlXvEPPAjf6YRGZfoYwdGHnwIMm6Q61YSoFx/LsYP9JM9d8ZKbNcKc65I
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2018 10:54:54.6394 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b568fa8-17a7-4975-f612-08d609b006a1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR02MB083
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.56
Subject: [Qemu-devel] [QEMU][PATCH 7/8] sdhci: Add i.MX specific subtype of
 SDHCI
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-dev@xilinx.com,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Jason Wang <jasowang@redhat.com>, yurovsky@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x+yP3iATTnW+

From: Andrey Smirnov <andrew.smirnov@gmail.com>

IP block found on several generations of i.MX family does not use
vanilla SDHCI implementation and it comes with a number of quirks.

Introduce i.MX SDHCI subtype of SDHCI block to add code necessary to
support unmodified Linux guest driver.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Cc: Marcel Apfelbaum <marcel.apfelbaum@zoho.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
[PMM: define and use ESDHC_UNDOCUMENTED_REG27]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/sd/sdhci-internal.h |  22 +++++
 hw/sd/sdhci.c          | 230 +++++++++++++++++++++++++++++++++++++++++++=
+++++-
 include/hw/sd/sdhci.h  |  13 +++
 3 files changed, 264 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index fa69331..756ef3f 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -89,6 +89,7 @@ FIELD(SDHC_PRNSTS, CMD_LVL,            24, 1);
=20
 /* R/W Host control Register 0x0 */
 #define SDHC_HOSTCTL                   0x28
+#define SDHC_CTRL_LED                  0x01
 #define SDHC_CTRL_DATATRANSFERWIDTH    0x02 /* SD mode only */
 #define SDHC_CTRL_HIGH_SPEED           0x04
 #define SDHC_CTRL_DMA_CHECK_MASK       0x18
@@ -97,6 +98,10 @@ FIELD(SDHC_PRNSTS, CMD_LVL,            24, 1);
 #define SDHC_CTRL_ADMA2_32             0x10
 #define SDHC_CTRL_ADMA2_64             0x18
 #define SDHC_DMA_TYPE(x)               ((x) & SDHC_CTRL_DMA_CHECK_MASK)
+#define SDHC_CTRL_4BITBUS              0x02
+#define SDHC_CTRL_8BITBUS              0x20
+#define SDHC_CTRL_CDTEST_INS           0x40
+#define SDHC_CTRL_CDTEST_EN            0x80
=20
 /* R/W Power Control Register 0x0 */
 #define SDHC_PWRCON                    0x29
@@ -280,4 +285,21 @@ enum {
     sdhc_gap_write  =3D 2   /* SDHC stopped at block gap during write op=
eration */
 };
=20
+extern const VMStateDescription sdhci_vmstate;
+
+
+#define ESDHC_MIX_CTRL                  0x48
+#define ESDHC_VENDOR_SPEC               0xc0
+#define ESDHC_DLL_CTRL                  0x60
+
+#define ESDHC_TUNING_CTRL               0xcc
+#define ESDHC_TUNE_CTRL_STATUS          0x68
+#define ESDHC_WTMK_LVL                  0x44
+
+/* Undocumented register used by guests working around erratum ERR004536=
 */
+#define ESDHC_UNDOCUMENTED_REG27        0x6c
+
+#define ESDHC_CTRL_4BITBUS              (0x1 << 1)
+#define ESDHC_CTRL_8BITBUS              (0x2 << 1)
+
 #endif
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 8910470..3017e5a 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -365,7 +365,8 @@ static void sdhci_send_command(SDHCIState *s)
             }
         }
=20
-        if ((s->norintstsen & SDHC_NISEN_TRSCMP) &&
+        if (!(s->quirks & SDHCI_QUIRK_NO_BUSY_IRQ) &&
+            (s->norintstsen & SDHC_NISEN_TRSCMP) &&
             (s->cmdreg & SDHC_CMD_RESPONSE) =3D=3D SDHC_CMD_RSP_WITH_BUS=
Y) {
             s->norintsts |=3D SDHC_NIS_TRSCMP;
         }
@@ -1348,6 +1349,8 @@ static void sdhci_initfn(SDHCIState *s)
=20
     s->insert_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_raise_ins=
ertion_irq, s);
     s->transfer_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_data_tr=
ansfer, s);
+
+    s->io_ops =3D &sdhci_mmio_ops;
 }
=20
 static void sdhci_uninitfn(SDHCIState *s)
@@ -1566,6 +1569,10 @@ static void sdhci_sysbus_realize(DeviceState *dev,=
 Error ** errp)
     }
=20
     sysbus_init_irq(sbd, &s->irq);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), s->io_ops, s, "sdhci",
+            SDHC_REGISTERS_MAP_SIZE);
+
     sysbus_init_mmio(sbd, &s->iomem);
 }
=20
@@ -1617,11 +1624,232 @@ static const TypeInfo sdhci_bus_info =3D {
     .class_init =3D sdhci_bus_class_init,
 };
=20
+static uint64_t usdhc_read(void *opaque, hwaddr offset, unsigned size)
+{
+    SDHCIState *s =3D SYSBUS_SDHCI(opaque);
+    uint32_t ret;
+    uint16_t hostctl1;
+
+    switch (offset) {
+    default:
+        return sdhci_read(opaque, offset, size);
+
+    case SDHC_HOSTCTL:
+        /*
+         * For a detailed explanation on the following bit
+         * manipulation code see comments in a similar part of
+         * usdhc_write()
+         */
+        hostctl1 =3D SDHC_DMA_TYPE(s->hostctl1) << (8 - 3);
+
+        if (s->hostctl1 & SDHC_CTRL_8BITBUS) {
+            hostctl1 |=3D ESDHC_CTRL_8BITBUS;
+        }
+
+        if (s->hostctl1 & SDHC_CTRL_4BITBUS) {
+            hostctl1 |=3D ESDHC_CTRL_4BITBUS;
+        }
+
+        ret  =3D hostctl1;
+        ret |=3D (uint32_t)s->blkgap << 16;
+        ret |=3D (uint32_t)s->wakcon << 24;
+
+        break;
+
+    case ESDHC_DLL_CTRL:
+    case ESDHC_TUNE_CTRL_STATUS:
+    case ESDHC_UNDOCUMENTED_REG27:
+    case ESDHC_TUNING_CTRL:
+    case ESDHC_VENDOR_SPEC:
+    case ESDHC_MIX_CTRL:
+    case ESDHC_WTMK_LVL:
+        ret =3D 0;
+        break;
+    }
+
+    return ret;
+}
+
+static void
+usdhc_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
+{
+    SDHCIState *s =3D SYSBUS_SDHCI(opaque);
+    uint8_t hostctl1;
+    uint32_t value =3D (uint32_t)val;
+
+    switch (offset) {
+    case ESDHC_DLL_CTRL:
+    case ESDHC_TUNE_CTRL_STATUS:
+    case ESDHC_UNDOCUMENTED_REG27:
+    case ESDHC_TUNING_CTRL:
+    case ESDHC_WTMK_LVL:
+    case ESDHC_VENDOR_SPEC:
+        break;
+
+    case SDHC_HOSTCTL:
+        /*
+         * Here's What ESDHCI has at offset 0x28 (SDHC_HOSTCTL)
+         *
+         *       7         6     5      4      3      2        1      0
+         * |-----------+--------+--------+-----------+----------+-------=
--|
+         * | Card      | Card   | Endian | DATA3     | Data     | Led   =
  |
+         * | Detect    | Detect | Mode   | as Card   | Transfer | Contro=
l |
+         * | Signal    | Test   |        | Detection | Width    |       =
  |
+         * | Selection | Level  |        | Pin       |          |       =
  |
+         * |-----------+--------+--------+-----------+----------+-------=
--|
+         *
+         * and 0x29
+         *
+         *  15      10 9    8
+         * |----------+------|
+         * | Reserved | DMA  |
+         * |          | Sel. |
+         * |          |      |
+         * |----------+------|
+         *
+         * and here's what SDCHI spec expects those offsets to be:
+         *
+         * 0x28 (Host Control Register)
+         *
+         *     7        6         5       4  3      2         1        0
+         * |--------+--------+----------+------+--------+----------+----=
-----|
+         * | Card   | Card   | Extended | DMA  | High   | Data     | LED=
     |
+         * | Detect | Detect | Data     | Sel. | Speed  | Transfer | Con=
trol |
+         * | Signal | Test   | Transfer |      | Enable | Width    |    =
     |
+         * | Sel.   | Level  | Width    |      |        |          |    =
     |
+         * |--------+--------+----------+------+--------+----------+----=
-----|
+         *
+         * and 0x29 (Power Control Register)
+         *
+         * |----------------------------------|
+         * | Power Control Register           |
+         * |                                  |
+         * | Description omitted,             |
+         * | since it has no analog in ESDHCI |
+         * |                                  |
+         * |----------------------------------|
+         *
+         * Since offsets 0x2A and 0x2B should be compatible between
+         * both IP specs we only need to reconcile least 16-bit of the
+         * word we've been given.
+         */
+
+        /*
+         * First, save bits 7 6 and 0 since they are identical
+         */
+        hostctl1 =3D value & (SDHC_CTRL_LED |
+                            SDHC_CTRL_CDTEST_INS |
+                            SDHC_CTRL_CDTEST_EN);
+        /*
+         * Second, split "Data Transfer Width" from bits 2 and 1 in to
+         * bits 5 and 1
+         */
+        if (value & ESDHC_CTRL_8BITBUS) {
+            hostctl1 |=3D SDHC_CTRL_8BITBUS;
+        }
+
+        if (value & ESDHC_CTRL_4BITBUS) {
+            hostctl1 |=3D ESDHC_CTRL_4BITBUS;
+        }
+
+        /*
+         * Third, move DMA select from bits 9 and 8 to bits 4 and 3
+         */
+        hostctl1 |=3D SDHC_DMA_TYPE(value >> (8 - 3));
+
+        /*
+         * Now place the corrected value into low 16-bit of the value
+         * we are going to give standard SDHCI write function
+         *
+         * NOTE: This transformation should be the inverse of what can
+         * be found in drivers/mmc/host/sdhci-esdhc-imx.c in Linux
+         * kernel
+         */
+        value &=3D ~UINT16_MAX;
+        value |=3D hostctl1;
+        value |=3D (uint16_t)s->pwrcon << 8;
+
+        sdhci_write(opaque, offset, value, size);
+        break;
+
+    case ESDHC_MIX_CTRL:
+        /*
+         * So, when SD/MMC stack in Linux tries to write to "Transfer
+         * Mode Register", ESDHC i.MX quirk code will translate it
+         * into a write to ESDHC_MIX_CTRL, so we do the opposite in
+         * order to get where we started
+         *
+         * Note that Auto CMD23 Enable bit is located in a wrong place
+         * on i.MX, but since it is not used by QEMU we do not care.
+         *
+         * We don't want to call sdhci_write(.., SDHC_TRNMOD, ...)
+         * here becuase it will result in a call to
+         * sdhci_send_command(s) which we don't want.
+         *
+         */
+        s->trnmod =3D value & UINT16_MAX;
+        break;
+    case SDHC_TRNMOD:
+        /*
+         * Similar to above, but this time a write to "Command
+         * Register" will be translated into a 4-byte write to
+         * "Transfer Mode register" where lower 16-bit of value would
+         * be set to zero. So what we do is fill those bits with
+         * cached value from s->trnmod and let the SDHCI
+         * infrastructure handle the rest
+         */
+        sdhci_write(opaque, offset, val | s->trnmod, size);
+        break;
+    case SDHC_BLKSIZE:
+        /*
+         * ESDHCI does not implement "Host SDMA Buffer Boundary", and
+         * Linux driver will try to zero this field out which will
+         * break the rest of SDHCI emulation.
+         *
+         * Linux defaults to maximum possible setting (512K boundary)
+         * and it seems to be the only option that i.MX IP implements,
+         * so we artificially set it to that value.
+         */
+        val |=3D 0x7 << 12;
+        /* FALLTHROUGH */
+    default:
+        sdhci_write(opaque, offset, val, size);
+        break;
+    }
+}
+
+
+static const MemoryRegionOps usdhc_mmio_ops =3D {
+    .read =3D usdhc_read,
+    .write =3D usdhc_write,
+    .valid =3D {
+        .min_access_size =3D 1,
+        .max_access_size =3D 4,
+        .unaligned =3D false
+    },
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+};
+
+static void imx_usdhc_init(Object *obj)
+{
+    SDHCIState *s =3D SYSBUS_SDHCI(obj);
+
+    s->io_ops =3D &usdhc_mmio_ops;
+    s->quirks =3D SDHCI_QUIRK_NO_BUSY_IRQ;
+}
+
+static const TypeInfo imx_usdhc_info =3D {
+    .name =3D TYPE_IMX_USDHC,
+    .parent =3D TYPE_SYSBUS_SDHCI,
+    .instance_init =3D imx_usdhc_init,
+};
+
 static void sdhci_register_types(void)
 {
     type_register_static(&sdhci_pci_info);
     type_register_static(&sdhci_sysbus_info);
     type_register_static(&sdhci_bus_info);
+    type_register_static(&imx_usdhc_info);
 }
=20
 type_init(sdhci_register_types)
diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 129d212..f321767 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -44,6 +44,7 @@ typedef struct SDHCIState {
     AddressSpace sysbus_dma_as;
     AddressSpace *dma_as;
     MemoryRegion *dma_mr;
+    const MemoryRegionOps *io_ops;
=20
     QEMUTimer *insert_timer;       /* timer for 'changing' sd card. */
     QEMUTimer *transfer_timer;
@@ -93,10 +94,20 @@ typedef struct SDHCIState {
=20
     /* Configurable properties */
     bool pending_insert_quirk; /* Quirk for Raspberry Pi card insert int=
 */
+    uint32_t quirks;
     uint8_t sd_spec_version;
     uint8_t uhs_mode;
 } SDHCIState;
=20
+/*
+ * Controller does not provide transfer-complete interrupt when not
+ * busy.
+ *
+ * NOTE: This definition is taken out of Linux kernel and so the
+ * original bit number is preserved
+ */
+#define SDHCI_QUIRK_NO_BUSY_IRQ    BIT(14)
+
 #define TYPE_PCI_SDHCI "sdhci-pci"
 #define PCI_SDHCI(obj) OBJECT_CHECK(SDHCIState, (obj), TYPE_PCI_SDHCI)
=20
@@ -104,4 +115,6 @@ typedef struct SDHCIState {
 #define SYSBUS_SDHCI(obj)                               \
      OBJECT_CHECK(SDHCIState, (obj), TYPE_SYSBUS_SDHCI)
=20
+#define TYPE_IMX_USDHC "imx-usdhc"
+
 #endif /* SDHCI_H */
--=20
2.7.4

