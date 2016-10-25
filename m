Received: by 10.80.166.35 with SMTP id d32csp3258592edc;
        Tue, 25 Oct 2016 08:33:47 -0700 (PDT)
X-Received: by 10.55.176.197 with SMTP id z188mr6759998qke.286.1477409627186;
        Tue, 25 Oct 2016 08:33:47 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h11si13828783qta.61.2016.10.25.08.33.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Oct 2016 08:33:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55743 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bz3jW-00022H-HJ
	for alex.bennee@linaro.org; Tue, 25 Oct 2016 11:33:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>) id 1bz3YX-0001pW-6N
	for qemu-devel@nongnu.org; Tue, 25 Oct 2016 11:22:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>) id 1bz3YT-0008Gl-Jg
	for qemu-devel@nongnu.org; Tue, 25 Oct 2016 11:22:25 -0400
Received: from mail-by2nam03on0041.outbound.protection.outlook.com
	([104.47.42.41]:24105
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgar.iglesias@xilinx.com>)
	id 1bz3YT-0008GG-7r
	for qemu-devel@nongnu.org; Tue, 25 Oct 2016 11:22:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=T7ntXHcqCiuCeh6KHvrf/tr0vt2wiek6aGROSucYWI4=;
	b=ZjoaehtFXBvQ4AV4XGqW5ysoAiSveTp/+diYFDCv0yvcrhBxt537MtCqVu0WHd6Oe/ANnqNEp9FcCS4UwMZEGWHWLhVNLDYISxLCYf+dsS+fQ3awKYGDL0ms2T+6y8SA30Y0si3i1VD/oLl9VWqoGnfBH8ctFoYy/9ifu2NNSEY=
Received: from CY1PR0201CA0024.namprd02.prod.outlook.com (10.163.30.162) by
	BLUPR02MB1234.namprd02.prod.outlook.com (10.163.80.151) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.679.12; Tue, 25 Oct 2016 12:50:10 +0000
Received: from BL2NAM02FT015.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::200) by CY1PR0201CA0024.outlook.office365.com
	(2a01:111:e400:58b9::34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.679.12 via
	Frontend Transport; Tue, 25 Oct 2016 12:50:09 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; fedoraproject.org;
	dkim=none (message not signed)
	header.d=none;fedoraproject.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT015.mail.protection.outlook.com (10.152.77.167) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.679.5
	via Frontend Transport; Tue, 25 Oct 2016 12:50:09 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1bz18h-0002ey-Ou; Tue, 25 Oct 2016 05:47:35 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1bz18h-00025S-LJ; Tue, 25 Oct 2016 05:47:35 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u9PClYjw026019; Tue, 25 Oct 2016 05:47:34 -0700
Received: from [172.19.5.101] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1bz18f-00024y-MJ; Tue, 25 Oct 2016 05:47:34 -0700
Date: Tue, 25 Oct 2016 14:47:32 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161025124732.GT32180@toto>
References: <1477378140-2670-1-git-send-email-ppandit@redhat.com>
	<CAFEAcA_H7OaczsgH-Tu6X10KoerJTwtr_jf2h4Jz+Wn0b+pLSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_H7OaczsgH-Tu6X10KoerJTwtr_jf2h4Jz+Wn0b+pLSw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22658.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(199003)(24454002)(189002)(83506001)(4001430100002)(19580395003)(19580405001)(54356999)(7846002)(81166006)(81156014)(305945005)(50986999)(189998001)(97756001)(86362001)(4001350100001)(77096005)(36386004)(107886002)(2906002)(76176999)(8676002)(5660300001)(110136003)(23726003)(92566002)(46406003)(50466002)(11100500001)(2950100002)(6916009)(1076002)(47776003)(356003)(106466001)(76506005)(9686002)(586003)(33716001)(626004)(33656002)(9786002)(63266004)(8936002)(87936001)(57986006)(4326007)(18370500001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR02MB1234; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT015;
	1:Js9okp/bk4V3uykrOxkSyckpU0/sAUZkqvDnqnwqot7A5l/KQrvB3MyqAD+/eyw0xQdzhsJYjD4DuQ6PBJ2JFjdGn8Hi178kLJRzS5kKzg6YlE7+Hv/XqOtYqz50UUMUOT3RWhUH+b2X8Xvk5QatJ0SgZqBbqbabKRkwuGks0k2quGCXlZNq6tbukuZJMcJYUi366cRV7wYRB1GrL8L1M9ATVir/QHt/ogSuhjcFs6D/t6Sn8NFDVH5Sq1mYwv3q29WQ8Y3oOmnGa/UOwNwNaPPYYamzZKZzm7/knF74gSHm5cJpWmLL6UIsn29Cd6vVJ449al0fM5SLXV/rhwHxLrDDWB6cMnUS66waoOPQg4nnXiIPz0TJ1ae8SRic370XWq6TfGZKIQ9bMvziZSl72yAFNpqTZ7QuQORPWVtxw/L0FKpzi1g+VbVUdK9SQvLJ0gtm00O56rY72aDkKgiuLB9qmNVZQypiwBboaUuxEizgHfvM2F/yldV8BRjK2YZCVp+47ZRqlVylX6jAiJRIgBZ3Q0z54inwleygXSnSmy66mdwlbTw/xNNwsdpgA5IMjagoQaDj2WUcWyKWHZypiyxkYGmgSY5gUuEajvTwPZs=
X-MS-Office365-Filtering-Correlation-Id: cdbe4eeb-26e8-4327-c9f5-08d3fcd5740f
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1234;
	2:qLheFZxI9+OJdtI0AoWuzXRHA6DPPuHJIjWDzkHs0Tc1MYm5gjS+Piqt+Fzl2wDPTPll3Xvy3NAc9zWnuSEWSZZ2QQqGqedjrLUAH1RdkcMMBXH1kZZNrzBJWrNS0jK4jlBjCMnFs1dpuDzPNTCYKWIUxTqD4RnLPUi4HRHYvQgmu/LkP7oGSKUFFZl6SSqxOJoCt/I2iEJxAYhJk3LAPg==;
	3:j7PnvnTQmPNUFMR6hi8kyPqCSjG80cbQl9SCeEGnJMroxtBeKrXM0wbmF4/4mjdOOrglHnYiA+Rb8uDrTGSKe8rfYiewDZ8zo2Ru5IFoQuQLjOIkUhs0lhISbAGzx2KvcWRKXVex5t4kavnyWZrNGmLcUbQ5JNNA3KPh9LPdxMNF/cYmbU0vT1t6QIoGN+mIM1HZIKjL4OEaafA+yXC4jWPaF+093Pn5r9NVxmnuY6VQnyZnQSI/irLZTFkLo9LvTsDA7j4LhFQA8ITrsZmN+PyJHz8Uo9X9eLNggo2Cm9s=;
	25:hQJqchnwQn1n/I7mcG5l3OIzki7lt8JUO0lzcz0ICTbiDwU7gLIromlGrXJhIPVqniFC5f76HvONczKIDdBWZ/Cizfn1645cTg+TGfjsDPOx6NXTxSqjYNFyEmNV5RZJeiGm5E7++Rijqc3/5FQaCIc6M0rQRzlYLzckeseB7Z79fxNQNjEcp2aadbGaxZkTlz9Z1Ai8bIAtZgzjjCDdgT4UXag8mFyH0NgYYBrblZvlDQLU+0M4g7wy3vfJwRF7MZmUVCClP9cdLz0R/b2mbdQVUSiowzsuDeDVEUmVKBel3SphNWTeWg5uvqcVXZ9qDnOyFEhm3jLbuwkc6aaXBCYGPc/ZcL2MoTuniikODRHxyIY6V3p3VrUjNAEQUzlR5uuHAdzq//B85ff7Erw9w2KM0jWfAccoI5li9zB+VuMckImz2mAmrRSRKGMaShvo
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:BLUPR02MB1234; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1234;
	31:n6mogoXzsHQJ7wIH7eqijdOa6Ha8UTsXptVeiE1Ba192+2HUYPXtKgSko5lBuqXrF0t0dCmz6P3V4LwFJqErBrB6s2zbFXl1rpsE1eQIkiY26NqwS8n1eOCwa6Llx+J02xURuTGUGRYhoxpZCr8zWv6ThhAPBZEeCSQnqEkHxsa5dWNT+Ebjeu8Pc/5KJ1BdMBZZFDIlSnres4+xIvnjlDSLL3DhAj8JIWqeOzhmQrP6ByuBfHNLj2PrKqbGlLTk;
	20:W9NxNUZs4oqOPD6FOAXMxj9TxQaqOAJlYVB9aEOTU/hl8Hbo/RQEtC86nKDwsOwYl9UVRxM/bjpMNsVdVXWlf7YSyeKi0iuEtuhLb1VvJOEOIfPN/fvmgA2DbYqJzO7erZHWIUMFNwtG8z3tDrMuavLe5zKy/8A3CXUUsUiRyCy4vT08pyeYErR8EZvl47oZc5s+Z/KfFl9Tmf60vMs748NVzdShMy4qnIQDALOzgbJsY1iJvsBoozXbvKULjqIJQGz1iBagXwBpDEeEbiVSqOeflyOay2c+A65Bz3dcJdgSLXHmUcLE8EzXlVjmyXSbYDfTOnmm4WuBuRGQn+CS0vN+vyz/ImMdxtJs4kv/8w3xB5NMdt87t7LLJe+lP870ebo2gaeK13twX5kUBphTvfpprfRLYBunYPff3UgUXumGp8q9Dty49k6+DumZd1f3e+V7JSXnMPTLI9wZIU/KcS/Cz1AGDeyGKLtQOcgimCXJrBSl/RDSRIV0ltxaeYz0
X-Microsoft-Antispam-PRVS: <BLUPR02MB123478185134F26C8A1325A4E3A80@BLUPR02MB1234.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(64507834874202);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(5005006)(13024025)(8121501046)(13023025)(13017025)(13015025)(13018025)(3002001)(10201501046)(6055026);
	SRVR:BLUPR02MB1234; BCL:0; PCL:0; RULEID:; SRVR:BLUPR02MB1234; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1234;
	4:X4xiYhkAGcz8kbWMhunDOBjn36vjEiORvyDkdxOELMNPDpL0EQcEwoLEoAFz/jRSB4v1Qd+kbDVCCnWzRazobY4p5Md8pcJ4CgGJ/Ti12p0/cASnM1AMAEvkbaRrWs5MQxElzRaC942m+eg4S90IKaB+zAu2k07cUJFkmTKPox5omKHg2SfS5r911jn8073TK4tH8YBmUTz7JnPbo878BDtFfgdYHbX9AfnX1pSgPOXrF62j/1O12H0DLVr0mq/Fx4DCw+1Yu/hmAr7nhAoVKTbvrWPDKbCqdVMsXXAXl/1/5mg6cdM4SYO5RMnDizb18ICj4TzWRGrCUI/JrJAc/V/JHh2mSWAkqsXgfY1C16cknDCnSfwGX9LQzEtkIu6n06VZj7K1UfxMuUT8rDDq2js4BruA5YGwbqgetXjxkKiCwvV67BiBum1ckUhaO/ev75o6OPf8PaKyEisoz+lTa2odfAtvG14haRFXTBfaHMlOfAGGAbQbOOy94oBGVbF9a2tmZUNEyIHY7FlPehr+L05e8ETiFXPF9zuTgqUhDblApmvFzKIcRN6TkgzfQ9xdjF21JHG8gnzn8mHg5UZFkQ==
X-Forefront-PRVS: 01068D0A20
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR02MB1234;
	23:D238g83iDnLCgYaRyt2/lHbajTfQ/tBaBQNRq3UFn?=
	=?us-ascii?Q?BFNpVWOCMJ4Ek/OmJvshrEA5CjbmEKxjIg1o8cujH5STm0Uhr1NxPy/5u/js?=
	=?us-ascii?Q?jbsxg/lJyyRJw9WBgjqzOXE6iFXRI/lVMdXIfC+bJBrjKe1xoZIjpVKHLC/0?=
	=?us-ascii?Q?VWK6nuqMSziUvbxgfqFqfweXKj2fCzm9vFIUxBwsJPfySd9/xs/6+oUSlQ01?=
	=?us-ascii?Q?v64XRPua0icBBvSrBz/JGqbkpPAyMYwx5my+CrhKYwwgHMGGCOqpYxAw3tPH?=
	=?us-ascii?Q?8U7Bmo8+gHQ+Y3D4MNr86eznUdruKf9D8ERE4GSYxXBBoNJ7QwosgT50rkym?=
	=?us-ascii?Q?3gGCq1Q5WDvy/4POCNQPky6nE66AUST4Aj9BtVxCwqQckIlxKk3Jsz7v360i?=
	=?us-ascii?Q?anInurGZ5F5zVdK1bf+YJZIgopMTIfE8W8OXYQz40hzuRjNtoMKJQAhXAknv?=
	=?us-ascii?Q?ZGHA2Tqjja5f7mNe+FlusAhxNVZHZWAIUuwb0P17UL5w8QU5sntQOW/GBfUR?=
	=?us-ascii?Q?Alqhtd27wevB1xLsWPiHacoV+P9tNrBrsHcieNzLHLESNj5ovbbT9OoxG8mu?=
	=?us-ascii?Q?7hZZ5tLVSHeaPuWInHddvhFGl0tAZHnOBWtGxE5qTFbZy6sXbxxW6iKduQbY?=
	=?us-ascii?Q?KhILf8XsvB5fQgRv+ZkEy1XJ8FmxptSntktjDJM16yCs0cxMfiC/7g2jDEKb?=
	=?us-ascii?Q?dV203sBhJq5aVWjVYrIN4rKvGEpR0xc4DOLldpxyU03H2RJYtql7dOTjI7dI?=
	=?us-ascii?Q?VJb4zJrvAfiP5mArPNYUqurCbO5LXhxoas+O30zkMSC0OiMqUiiE/+ftvg0r?=
	=?us-ascii?Q?kKxYAfcanmf5bLS05nOSG6T4lu5ByUBbPevUz+TObtbEsI7fF/bDBMPyE4tJ?=
	=?us-ascii?Q?sfVFOLssk00ifC7m8Uv8gxC7Bcqhs7wevib8ebH6T/VuO4KfxUf+097/3d+x?=
	=?us-ascii?Q?vJoLJ5nndVKJq4rAk+slVQWTiesgsci5AZVDsIf89OOIhvvu2YCFiFVJONq7?=
	=?us-ascii?Q?Pj9fcvHpFNIEtW+ej2qiNOoVqI0lwW1Sk/fZ5tCpxgEcWSu6binYm5+ogaO3?=
	=?us-ascii?Q?lJFpGnKLZIlFgFED4DFWsH7WOKeI5So2LF1+HrAKY0c1PRof89sidTzQ+OHs?=
	=?us-ascii?Q?7JkOdLkbrjJ/Fn0xeBQTAzt9fRvnTHq9pZqxK4n6S21yDnFSazhbT8yq4YAp?=
	=?us-ascii?Q?OIKTKRSHMCAg52lxIu4vDD1WtZNof7oB10fIhbINQU2qbLT6HEB4QzXs69u6?=
	=?us-ascii?Q?wd6pmANFGvZAEH86xCSHloODHGkt0qVBjQcT/F6dS533+xxseM+LqKQKUL0t?=
	=?us-ascii?B?QT09?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1234;
	6:hkd3NF7KPVgFpZBcLXB23yweSj/Rz0WUsAb7AwD9FyuXMYnyaRjjxLZZhiKBMzzsOysAaRCCS02KBEOfXmOzVV1HZ/aIjoHDcw/5mj5GSmkqPMane+6eT+bR+nMC068vEER8TcgQW76SCyJtrDALwREz+ltT4+/MjZueRZQjL4vYdCoidTyizQ/oLolonpeiRxqq1OrfA5m7FgbIcVh2un3CyhO0ZdAN9m4ar7h/RKzwgYUxYpHCPeNKdZbhcQ8Ay+hfNBCDfLUJw7Y6OfpVbUXPywaAcOz7YZB6ZP4vBKLFm9EI8KUZQ0fUJnlEZKuBLtG8a2hpIx8n64ifGIyslyB04jhrE9Sy8D8sZLW86bY=;
	5:bf0IJWaqm+BJ+YxkMSIeOeKdBRRLtDwh8gYrs88chX5SQ/5q4ivdddpkbvkA1Vs62nVXNQ2/oxOzFsFxYkX1FOX3d17hJBGtP8UUWWt4bs4+wxjgEFXJPp7tAi3z8ovahCmh3IkgFZmJABr0xw+lRTsSiC95eLiYaEvsMQ5kvFU=;
	24:tqz7C57jOzrDviHY7yqWRSZW19byY1qEYk+orXqys3VSM3x7P6sIYEQSd6dwyT0O72WRCqxuz804ndf+X+nWljielxxePNKl93JJIuhQbns=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1234;
	7:L+Y8SvKSJnl79FBFk/4XS+ylwl+TcmUotd4eEebA1bVpgi8jqU8Kxra8Rc1ywFtzzW1CTA9WStJbkrc0ly16FLEXavm6XaMZQ6JQwvbA503+ubOHBhWIoX6nNygsDTbIx+0eLHwfs/1JMQj0Dk7RAjakOqXbhjgkkS0WH3wbU4cgxeGX23dhl2DnN9bS2q/HJBAiAwUX2UMkp3wEfGHu0KpbmN0acP600MgKjgpEAfMEkdiNLxiGWKv/5cufB+JVaYjJBSOPeKEyXztjU0Om/PdXKC+9p70e0prqMH+SxJxSc+svDPiBffFtL8YbbiJtDdMB1A07QT6vpmP2oXll20A0T2RI9Nw+Rvrc9DZPxBE=;
	20:2rg7e/EnxKEryqxj/8y3bmo2EZBd1kgazx30SnvTX36Tj+e3/KzKR/9yWEP/r/s6EWm1jGMG3x9VvcE/MJ1IlHOMmz4DqYByPO5UEbFwJi0hlS/RDUt+/+aSxtk0BLxcljyt9Hc6TcodblFB04BECKGky7R1+s1YxNbhX73gRXY=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2016 12:50:09.2766 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR02MB1234
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.41
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] char: cadence: correct reset
 value for baud rate registers
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>, qemu-arm <qemu-arm@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Qemu Developers <qemu-devel@nongnu.org>, P J P <ppandit@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yWRRNn1YKhWI

On Tue, Oct 25, 2016 at 01:19:28PM +0100, Peter Maydell wrote:
> On 25 October 2016 at 07:49, P J P <ppandit@redhat.com> wrote:
> > From: Prasad J Pandit <pjp@fedoraproject.org>
> >
> > The Cadence UART device emulator stores 'baud rate generator'
> > and 'baud rate divider' values, used in computing speed, in two
> > registers. The device specification defines their range and
> > their reset value. Use their correct value when resetting the
> > device in cadence_uart_reset.
> >
> > Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> > ---
> >  hw/char/cadence_uart.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> > index c176446..b8d4c28 100644
> > --- a/hw/char/cadence_uart.c
> > +++ b/hw/char/cadence_uart.c
> > @@ -471,7 +471,8 @@ static void cadence_uart_reset(DeviceState *dev)
> >      s->r[R_IMR] = 0;
> >      s->r[R_CISR] = 0;
> >      s->r[R_RTRIG] = 0x00000020;
> > -    s->r[R_BRGR] = 0x0000000F;
> > +    s->r[R_BRGR] = 0x0000028B;
> > +    s->r[R_BDIV] = 0x0000000F;
> >      s->r[R_TTRIG] = 0x00000020;
> >
> >      uart_rx_reset(s);
> > --
> > 2.7.4
> 
> I'm going to wait for a review/ack from one of the Xilinx folk
> before putting this in target-arm.next.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Best regards,
Edgar

