Received: by 10.223.172.38 with SMTP id v35csp731941wrc;
        Thu, 7 Sep 2017 14:35:50 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAEXpb9RL/9JipH2VRPbn5rU6bL9lTDWMCzwM4K2Mys4d/By6IcIY+C2RCngWek/S4Gz1B/
X-Received: by 10.200.22.201 with SMTP id y9mr1055037qtk.115.1504820150793;
        Thu, 07 Sep 2017 14:35:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504820150; cv=none;
        d=google.com; s=arc-20160816;
        b=K1u1Kmqdj0VxDlI9TjCt6MGVzbndsazYJxJne4KbvcWcUk9Oe4RADPvgyFD1G6CNrr
         twdDuhXzEdrmorO30uaCWAil9GXAekJBSGu67jCaWEo4lm/6sJ9wggebseO1wBeeKag8
         ZBZzQ0oTUAoxxbHTql6aC5tWS5KkFxIG83wj/wujxjutV3yqa76M60wC79TiFCRAdiwH
         3NjpFN8LRRMd8boP+jjV/9Nt9NR7LwUFAMPaCdfxvGM9CFJ57b97LUTnC5WOC7r/5f2H
         Ib055nyzPRQK9ona4wIIPlGDCAtbebeYZD9hghoDr9TyiHnwCdwMKQ56reRJCN3SY9bL
         NivA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=OWs+iETNQRoRoEix7ozngomkNxoYlUsgN6k/WitDOrw=;
        b=xn5dWMhg8nyOwsfVLPI2NSzpQLxTVS96PLfBePB/7WHrwNBOZTLLjTxNINFOlWcq9e
         4eNQg62nd1ylVBSgPKZ9gvtjbku9YOP2kJzENVb/FJ6hsFLtkvE9XC8M0VXZiX6JTSdV
         0A2KmXIYmootjfknCl0oqv04GGFWzwFwll7Cba2ofKRY12/xcAPDeTyEOb63LvPp8VCs
         AtOgE+DHjXHWi0+0YXVYoHOqsHxRFTSa3fDk8QBC17EwMOA4o8BUsTo6qySIuS1m0jwd
         M+Yz/BNATvUuTLnWmjXuEA/fqShrbA3ShwlaTsbYIVTFqlMM32NTDbnMIFLtO62Wuepx
         ItDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=1YgLt6CZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x77si346804qkb.192.2017.09.07.14.35.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Sep 2017 14:35:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=1YgLt6CZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42351 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dq4Si-0002DP-Ig
	for alex.bennee@linaro.org; Thu, 07 Sep 2017 17:35:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar@xilinx.com>) id 1dq4Sa-0002Cx-TR
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 17:35:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar@xilinx.com>) id 1dq4SW-0001UM-6E
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 17:35:40 -0400
Received: from mail-bn3nam01on0057.outbound.protection.outlook.com
	([104.47.33.57]:25734
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgar@xilinx.com>)
	id 1dq4SV-0001TI-DK; Thu, 07 Sep 2017 17:35:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=OWs+iETNQRoRoEix7ozngomkNxoYlUsgN6k/WitDOrw=;
	b=1YgLt6CZuy6Sbcd+g+eXhQ1y5oXgkt67e2Ge4t65byYu9krrzJsHVJj5LewLt5E321g8Cxbh+f4DWO4qGWo2LE2ZUVxWmf+uzpufIx36/5/nuaLUcH4++uqKmk4qPkWgp60Kby/BYU7LngHNnNa1AeUZvzFPmOu0vOimuOQLO4U=
Received: from SN4PR0201CA0046.namprd02.prod.outlook.com (10.162.76.32) by
	SN1PR0201MB1934.namprd02.prod.outlook.com (10.163.87.156) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.13.10; Thu, 7 Sep 2017 21:35:33 +0000
Received: from SN1NAM02FT028.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::202) by SN4PR0201CA0046.outlook.office365.com
	(2603:10b6:803:2e::32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.35.12 via
	Frontend Transport; Thu, 7 Sep 2017 21:35:33 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT028.mail.protection.outlook.com (10.152.72.105) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1385.11
	via Frontend Transport; Thu, 7 Sep 2017 21:35:32 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar@xilinx.com>)
	id 1dq4SR-0002bS-Ut; Thu, 07 Sep 2017 14:35:31 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar@xilinx.com>)
	id 1dq4SR-0006Oi-RT; Thu, 07 Sep 2017 14:35:31 -0700
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v87LZUkY002792; Thu, 7 Sep 2017 14:35:30 -0700
Received: from [172.19.117.116] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar@xilinx.com>)
	id 1dq4SQ-0006ON-4q; Thu, 07 Sep 2017 14:35:30 -0700
Date: Fri, 8 Sep 2017 04:35:25 +0700
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Message-ID: <20170907213525.GJ5763@toto>
References: <cover.1504222314.git.alistair.francis@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1504222314.git.alistair.francis@xilinx.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23310.003
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916004)(39860400002)(2980300002)(438002)(24454002)(199003)(189002)(83506001)(305945005)(33656002)(6246003)(2906002)(6636002)(356003)(110136004)(106466001)(189998001)(23726003)(6666003)(81166006)(81156014)(77096006)(229853002)(2950100002)(8936002)(47776003)(1076002)(8676002)(54356999)(76176999)(4001350100001)(50986999)(5660300001)(4326008)(9686003)(36386004)(54906002)(9786002)(97756001)(46406003)(50466002)(63266004)(39060400002)(33716001)(478600001)(57986006)(76506005)(6862004)(18370500001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR0201MB1934;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT028;
	1:vL4KqYjKjUnUaDrp3X8jfZFNSSGSc01EgXWK7yyHjq8ZsiN0ddXD+Fdy+BOIkWkFy2LpFYmV89cgdwPEIsfygpU5C8vsyp3kQxdxWGYyLWJ5n4Awyufb6++0+RLWxxkr
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbd12fbc-c3a2-4a6e-e2d6-08d4f6385e72
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:SN1PR0201MB1934; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0201MB1934;
	3:bqp3yYPicbm0zcNqS+TfLzsAZsSspXcsHlXfWobjyImSbvdEoNSfJQqyaMK0wbdnHBwsV0cCKXEobB76y3eQOYxeFKuPfo3BH2whWRvvdBh0QIkeF39ykDU/0Ozj4Ut07kLU5CCuzoAQdO+bftwXUwr4Xpz1tSoWbUU2FotyXIWJ9oXjVIzo850ieU2aZvigxsP/C8s2mXI0p7af1ZFMUabf/SxfipcmB858MM8aY/aR44PVPUy0I3AGbIkOl55+mvinFdQsfUrSYjyUO1a1v6oi+T38TxknqIvniWBRIZGl2EzmRrtM997p58knG9pZYkUBiE8aJ1geMCYaYo5jxzn8lgQiWgR8bJKBjvMVXaM=;
	25:aVoiGBN9NriraUNQQ6/k+5BzbRiT8PE8dDEfBURtOX1SJGTXOwR0fwL4GyufwvMoq7PfL/L3tuAxl+rkuPzjr3LeUWVmDN087mm7BU09un3IPRBvcLQdqtRixfxgkLV2MVQrqEZG4Xws5Ad9Qvb8OKmDrM3bc0ZIkdOs/Rat4kn5tDZOLqDA8gHivsY7VlHVRsPGs4e2r0ILvR+5c3VsFtSEz+bNjz3rEA/YTOoCaxMRwJ9l9graACzBGsl5R2LrH+nHZMVkBVRX6krML2taAY/WdXJ3UApEkaKkZSQUg6MkTbDsh8cCrT7n1ayixb7WWInxI6De29zJH32Tx1i+eA==
X-MS-TrafficTypeDiagnostic: SN1PR0201MB1934:
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0201MB1934;
	31:jtq0qD4LJ1jAnr5Ad45l4+FzEGA+fXPOnc9X+pehXtbHjiXNb6bw/I5p5rMamOLTErIl+Oj65I3oA82LObBBR8MkWW+PKMZ2pDBmHlq4Sh9uZH4FJn//s9nVI0fiJUp/UPH45RruEDNZGlIlWlk1GSYE6RTFHhVV9tAv+7CLGfSJbwmMDGBZnMoX9O3a81rVuvFM5B1M4iIiIiXQ+7ZmPgM9+itL4x5QQvEd9qXC07s=;
	20:i1qIN9GGEeDdd23RBmP28EbCZSFAffWYMMpkfiZWJhJ/tKQXLVIpUTEREwlu7qZY+apl5CNlFnc5IxFfTCGzuX1DlqJz7oX+Kul6kIZ79hYr0iftN85I/HLdxCc/u9cqDKv07vuGiFNcl7l9hyThS1M87ltEAt7dEmqMLW87irR8cKEe5x+4fZwvW8p/T9XzgMm/6nsmDqI4CkuOqAc9yiYgkU85eYwM2mTFQxJ1DaLVGS6JlfA9eTahWJ7+10DqpyyaRe8jrz6I5A5XREJX6rwrQglphazPMnsUYLIaJkuGFgUwVaGy9O8d91ymOcGnkZMVQxvZokLtvVwTY0kWwbyeNO1dFcC0bF1MKZvKTpTW0CT0vIJtyuM6JIMROnt8iPQqFQ0rWFGjVlMux1zN0SczwY8hXAtnrP575PRijKP31AL39GA0NxSScJp9cyIemz/kUSMWyvvWVB4bFSOcJePRLm5BMQ12wHxZPW4/3bm8j2y/cksNlRtBOKmysUm9
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <SN1PR0201MB1934997E0B5E146351A9BDE8C2940@SN1PR0201MB1934.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93004095)(100000703101)(100105400095)(6055026)(6041248)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123562025)(20161123558100)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:SN1PR0201MB1934; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:SN1PR0201MB1934; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0201MB1934;
	4:AIyKbwvOTmwGffU/NkYoGbhdynLD3kDVKTcWkbe8yzpc5JgPsiOPo7sjlVkJBTVXq0+C/FHAJ5D2FBOv+M5Uttp0nU8Ug2Ow4wf6pL/gB2gMWOEGetvADBgMZ+U+Vv7/AfGPzRDcRqVWwFNh+d9NtLo2qLxkuUIfBAcTWN3kmAGo66HvlMpX7VIaTj9PXuHvSgpChH2us2iWFC9IYEGGymPXDoNr+VDkU2AbhVgLxf26n6FO+KVknh5irpwy50c+Ind1i93Yy9VPL0ejW7sCc4iowp/vowpALgClLSGqNOs=
X-Forefront-PRVS: 04238CD941
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR0201MB1934;
	23:6esC5IQbrQviZsCToJl2s7Re6UA9HeZvsSD53m2?=
	=?us-ascii?Q?FS6NNkgFS5ZTM8izh44au+yBEldZ5r6KB0eRQYVF2IydfKV3EVsOb7dFWvbQ?=
	=?us-ascii?Q?FB2Nh7DRX+KuhtPSTvPv9wyw458w2JNGZaTcvBsfoWt0yCJlZn65ZTocM0Uf?=
	=?us-ascii?Q?3B65XBOsq/xTVdSEkmB1JQDP1SDzKvsMk492MjR0ftUesGWNB+PGW8KvNpfc?=
	=?us-ascii?Q?IzZMlqsBkhm0orrQAGU/bClh084Trc1LDfJkUgUi2Y3ZzD6NtX7nFz02u2L9?=
	=?us-ascii?Q?1nD4wZ6NQRrvnKnh6vz/HW/VOKiBJfK5Sj2x2icHE7zGn4jS5hAk3K0acDvi?=
	=?us-ascii?Q?laja4NbYks0zZkB/4HBbZHl5cVVV0pmv3YRzBpYlvlqnpSUUY/d/A0kT3gxh?=
	=?us-ascii?Q?Q0YKCGNz2zulI309Akiof00zuIWL3r9T57xFSPXbbk2ic5SqcYD4f06ZiRfd?=
	=?us-ascii?Q?SKa2RThXBZnxaAT/fjlExMzJ2rZ/aKqbuiwdw8lW3JWl1dTEBWJuJZppjcb0?=
	=?us-ascii?Q?TYOecyDvRALLsFcu4rM1d213UOAdlUUMplpXvLhBkr8UA46A6fuhtV6b6chZ?=
	=?us-ascii?Q?HBCaSgljcsyjpUo1lVLTrcLLsyzK22k0Uh+BlwxADsioDp8TNFbYXmhP7j4C?=
	=?us-ascii?Q?zPsKUA7OwdheGYqEJUW5YSUkS4SWWnQIb1PNDAt5c+6lkxagttmVI7peSxLY?=
	=?us-ascii?Q?jf8Hbub6C80X2uuD4ZfKbPelDOuEyUntF8u9Q7bIb5y/QDN8lZFHBmdFuUaa?=
	=?us-ascii?Q?IizHfgzjmjO7HctuQpY1tqKrw06xNttnYCJOuXIMID5ZLCs0rkuyz6ak9j6N?=
	=?us-ascii?Q?l4sqmVlJH+cFNTMjXKTPFXxGdfWVPIKItFvG66dGnUfNaj8MOxfgiHldniL9?=
	=?us-ascii?Q?9sUU0ZyfXrJcXvWSiNHq6ERMK6obMaSk8Rdj9QpaFr5CgrzWP9HeX7PB9M9o?=
	=?us-ascii?Q?9MVG47f7s1I6t7OHOIf5pYUpQK4vhmMa+clBivsQTblD9f9ddmFoqslQvwYf?=
	=?us-ascii?Q?VJ0W37iwLSS9JZTS/yVqfVmW6zLNxsteWmVTwRwGoa9K2PpiXP11AgFG5n+H?=
	=?us-ascii?Q?MXq0ok9X3VDzCs29p1LjBrhT+FlxvfY6U73matFYDDYFa3pKnUvy35MvQ7T8?=
	=?us-ascii?Q?PwoLczM+zrErM1Ed/iaxBk2WsM0jJfYoYI6v1rPPgUbYpOdTmLo6VdRYzuIW?=
	=?us-ascii?Q?B9A8oG9ouKPttkWh/opKHELhZVrKtO5CdT/Dbc5Tz7ZPUDS3KCvGd1s/AnQ?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0201MB1934;
	6:9ZH2RFsF4Lh0PAkqFSjvcTe6wrUYpkFatMtPCd7P6lYEKKDBLL1O1F78qGMkej1jtHX33TgddRZTmtNRycHtSKj+JWdHrRFrrtMsYZ5Dc2HeukGNjdQ0MYr1+n4L+OL/vB0Sm+OyTmb2/icjKVD1e6/snmOjutl8RrasTXGpmWyeyvY+X4Tn54U/IsZeiqxc9g0lPUUHZ12P49GinvTiIAZQjozmsd1bUvLMS3ai9enrldL3twB1xZMPFuj1mne0BJo5tXdlhFW9x94rsbUuQ0jbbw5UWRYeVSK0NU8vrrZyaQd7ZkxVSlrKt/cSidjBkfh/+giKW9VJHnZRKOAIbg==;
	5:h0/PbF5wUk8Afh9Hbaa0VU7zXbldPnDql9BaYvRhqsCI+k9U6FQnP9JHnP/Cq6OnFOosRTKCpRj5gtURSS/zS/J44YJVXC2gZu0HPT/fY33mzy85RDebi2winZHZkx8+0vmDAvRi7D7iF6BkgLPi1A==;
	24:d82Ulf5lS+mEftjq6RdbsFPgvUg6OcsCXA11VM2HS2/e8Zydp57j4wAYQ73wVy8RM3mnF4JR5U10cTQifbl1mfEkWemD+76H7qoxAXT4XNA=;
	7:Px5VXQ7j46CC0qRdxwNg1ZuIhojvIgdBKzafLq3yv98wjnO55u6KROpsy+KMcSZxF6s2zyBWq7j+AEXn+RwmPR7vrVOUbGTasM4F83OEjS/PCLWJfYhNbRoTAMqaa01HPPWlxFJjks+uEUBLUN+1OVnxWOixSJCB2ob31Lnb5zFbUZHv/MES6RbVem6VLe4zxdyNwa45z268wgNmaCJLsoQx8dIEiMEui9BCCPn1FS0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2017 21:35:32.6771 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR0201MB1934
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.33.57
Subject: Re: [Qemu-arm] [PATCH Resend v2 0/5] Expose the secure and virt
 properties to the
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SVJ1MbxWOF6g

On Thu, Sep 07, 2017 at 08:56:55AM -0700, Alistair Francis wrote:
> 
> The EL2 and EL3 work is working well now and interanlly we now have
> tests that expect to start in EL3 and transition through EL2 to EL1. To
> make this easy to run let's expose the secure property to the machine
> and also add a virt property that can enable EL2.
> 
> This series also does some machine/name tidying up and makes the first
> move to deprecating the EP108 machine, which was just an early access
> development board.
> 
> V2:
>  - Add a virt option for setting EL2


Thanks Alistair!
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> 
> 
> 
> Alistair Francis (5):
>   xlnx-ep108: Rename to ZCU102
>   xlnx-zcu102: Manually create the machines
>   xlnx-zcu102: Add a machine level secure property
>   xlnx-zcu102: Add a machine level virtualization property
>   xlnx-zcu102: Mark the EP108 machine as deprecated
> 
>  hw/arm/Makefile.objs         |   2 +-
>  hw/arm/xlnx-ep108.c          | 137 -----------------------
>  hw/arm/xlnx-zcu102.c         | 257 +++++++++++++++++++++++++++++++++++++++++++
>  hw/arm/xlnx-zynqmp.c         |   3 +-
>  include/hw/arm/xlnx-zynqmp.h |   2 +
>  5 files changed, 262 insertions(+), 139 deletions(-)
>  delete mode 100644 hw/arm/xlnx-ep108.c
>  create mode 100644 hw/arm/xlnx-zcu102.c
> 
> -- 
> 2.11.0
> 
