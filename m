Received: by 10.25.221.202 with SMTP id w71csp2027868lfi;
        Sat, 12 Aug 2017 04:41:20 -0700 (PDT)
X-Received: by 10.237.36.6 with SMTP id r6mr26119355qtc.159.1502538080830;
        Sat, 12 Aug 2017 04:41:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502538080; cv=none;
        d=google.com; s=arc-20160816;
        b=OEKI1ot/UBfYOC5ytO/06yUPSKAXvs9ounRQi88mh/F+RjCPv5tXO50rrNP/QUGkKt
         DOwB6LONGUI2t6DQsv+EvFFI5PaEsWjXdZRA7MhPEpAcxgiXcARUEyXDmjHLa39SMNmy
         BZwONZGkWATVfALhvf1kZKfBdBQwpX5QQXrlRz1t3OZWHa5u7PaSucJlFqWtxug644Py
         kWaAXzioWlUixa+QrvbMivP9SlFNgXdpNIZF3vO/Mb88acboifoQJqssduR5uFB6nOE5
         Y0SF5j2GHvbdxo8ExVn+f+AiSr411aUsb3FR/Br3wGptBh9+uG6zgBofC7be9VNjghKA
         zgfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=HB0FeWw78sixWNuFoMYsx7xEKlp/wuTwfcu9UUJCAY8=;
        b=kvX6L8KoIux/JVplyaii1E/Aom/5TztkRqc4GsMKq7X0cqMcIGAW73Jj4EYSYPOnxc
         o/+FfvaEShoysz+Z0bia3Qeth+Y4PlcwmpyUIHw/fhJ4RkQctbSUIZ3s+2WlVRRVgIbP
         40ZimIj9mx3tLSf7AWBiOoymjymd9MeSxgALMbiFNXeqDE8oswuxhZ4Pjn/pYj7FgY4O
         c0EzCZlYsqE829ZHVa49wXayWyBefTAt97yBZYKKmSx1KGD5dfZBsJ5KbEoFG8P+2K8R
         pIF2JZFeGpAJQuFxcXiObQ7FSaNJkOvULJHM6KXRFjRpfQWKyl1fhF1TvOECe5uPcpYd
         I17w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=Yk8g4UH0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n65si2586981qka.129.2017.08.12.04.41.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 12 Aug 2017 04:41:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=Yk8g4UH0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46705 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgUn7-0000Dy-O0
	for alex.bennee@linaro.org; Sat, 12 Aug 2017 07:41:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1dgUlR-0006zF-IW
	for qemu-arm@nongnu.org; Sat, 12 Aug 2017 07:39:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1dgUlN-0002Th-Ha
	for qemu-arm@nongnu.org; Sat, 12 Aug 2017 07:39:33 -0400
Received: from mail-bl2nam02on0053.outbound.protection.outlook.com
	([104.47.38.53]:59744
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1dgUlN-0002T4-Ai; Sat, 12 Aug 2017 07:39:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=HB0FeWw78sixWNuFoMYsx7xEKlp/wuTwfcu9UUJCAY8=;
	b=Yk8g4UH0XBVGsK9LA+/wCKXJ61Ai6RAMwOaTRRJNLMLG36Td17jzXsP5cRG8wL3W4M44jOYQt05fbLm32TK6Gyyiqas5GMTeP6v+zd1bymr+cwBJm05HZn5Q4/Bj9nNL9icP664j4sgTgMaNY708Yrl5UnMZuoN33M495qBGVQ4=
Received: from BY2PR02CA0110.namprd02.prod.outlook.com
	(2a01:111:e400:5261::36) by DM2PR0201MB1056.namprd02.prod.outlook.com
	(2a01:111:e400:5021::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1320.16;
	Sat, 12 Aug 2017 11:39:26 +0000
Received: from BL2NAM02FT057.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::203) by BY2PR02CA0110.outlook.office365.com
	(2a01:111:e400:5261::36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1341.17 via
	Frontend Transport; Sat, 12 Aug 2017 11:39:26 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT057.mail.protection.outlook.com (10.152.77.36) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1304.16
	via Frontend Transport; Sat, 12 Aug 2017 11:39:26 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1dgUlJ-0003if-4p; Sat, 12 Aug 2017 04:39:25 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1dgUlJ-0002Gl-2C; Sat, 12 Aug 2017 04:39:25 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v7CBdF0C023115; Sat, 12 Aug 2017 04:39:16 -0700
Received: from [172.19.116.66] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1dgUl9-0002GH-Ge; Sat, 12 Aug 2017 04:39:15 -0700
Date: Sat, 12 Aug 2017 13:39:14 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Message-ID: <20170812113914.GY12347@toto>
References: <cover.1502488636.git.alistair.francis@xilinx.com>
	<885b354ba1e79510bfd6a905d62971c275645ad5.1502488636.git.alistair.francis@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <885b354ba1e79510bfd6a905d62971c275645ad5.1502488636.git.alistair.francis@xilinx.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23252.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(2980300002)(438002)(24454002)(199003)(189002)(76176999)(4001350100001)(8936002)(97756001)(189998001)(9786002)(626005)(36386004)(4326008)(478600001)(106466001)(63266004)(54356999)(23726003)(50986999)(33656002)(50466002)(1076002)(46406003)(33716001)(8676002)(356003)(39060400002)(6246003)(83506001)(81166006)(229853002)(110136004)(81156014)(6862004)(2950100002)(54906002)(6636002)(77096006)(5660300001)(47776003)(2906002)(305945005)(9686003)(18370500001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR0201MB1056;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT057;
	1:E61IYOF4UWeK6T2OLbeyZKVpFk2ZtmWS2bzQeRZsX34/a1IBLEvGS7q2AbB4yENY37Cp/ibd/adsIIOjLSn2TNNeu809kG84Vxm+obX3tpcQwCnrcox+mCBii/JIYaIfNPeUU26jY+GB8WOSBxUnukv55RKNIMxY7dW4pK+bO/q65agsIxX8oMBYPPuA/dRfiSiDwWyBSpoE3IV/lk+BZCiE+pWFqB86emMjs9iHkZnD1SN2o30NutH4hXVqgTzXdJQbCrdQzi6jEOiwRUK2QjENWrnv5+iZCxousW8LdQ9gIDAiogONdjBfrwlHjTKBWVy+1uOsWpo1jAW+1z25iSJ98+En77RjbmxnU3HXUdFLNqS8O9yYWKNjiiJTz/juHQvn1j5sTNJBNBHpYGFTyCrwi5ZJbGkIu5ExNBflKKSuVNK8CGWo5tFn5Wiiv00bL2STkL0iKO/O9GovmxAfEw+LXXQ6m/VFZWtQV/Pc6JOYD8mPhcKDhjK5jvlhosrUyqga95zZefui4od8ZyCBKyWYYM35VcU6WU2ys4YJuF9yEr7CPxvWECqzfN+frURQynL9PEoUx+mVghGJfqjIKWQmJ8RvLVqPYS9ZKaDB/1jQO5Vm0DOx5Tjkvwlw/G+ISDLTeeYIpdtrNBxh7bkP2fYlAdMXsg6+jGaVi7yQ7+kvg9T+RKj6GFVLMg54jo7fl9B6HvyNC068KO+tXcDGeuazgtL+K92HkmA1gcWqFQujnqKOFjHSBmq33b1rJUvQUHio70zQdibp8Uq3igMo5Dad7z6hVMGAfdBJjKNQlb3kv4O1VHoqXzQEh7VP8fXRlMjZq7UGh1PdlYZ9iJC9EA==
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a8eefcc-78c7-464c-e196-08d4e176c928
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:DM2PR0201MB1056; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB1056;
	3:7kmwN83KRn1XgQ8Xj7OanUHFm0VF5zgU9g/VZlOxObioNwHllTsZLhZ+Mob7PpUHyla8Y7AV/ORwk0RXNQG85kTL3nNghy1xZB5pUI/tvOGhQZxSl48m3SZzeGbcpY6OwByLa3K6RuternqWs+Eci2kVabDqHZYWC+1r3qM8Y7pw2WgxRsJk6JKxlWB9XL2OMWd6Gp1tKX0khx0nW6LSWpXuYOCUKCOAsPi+SQHhnsiwtRUGxaRSKZBKtSDm26VGoCkHmTAaFlMDg7lqHckfjF1OifUdm9XkK8mi9AqXeL19pWkf3EAR73mBGwPa4cIiTQoIZCZKNjFLmQDnPuJUrv7Ts3UZolFSf5MzIH+bETU=;
	25:5sXmsPKY6kuamkhXs+Jp/Ew7GixcUKOBVMSfVS6y/Y5e3HUytlF7vDBKcq52PY0zOZ/mh1rEp3ykPC9hGEop+oXeJtfBR/jFb9llFNN4U2kG0rQqUTh11h6RzSGI4p78Fz5wnodwqgs79FzV2uz4Mc6wWs/4my30oV5MoJHZ1jQAqVTVrXhjauPLbxKCBZz5gs7qEOi5fwUPnP9GM/NETsrpw/huQ6OW5EKwHU8hrOW2+TulwLIJz9341bUMESgYxBBkZdFLJYA8jC0xDxRbFtH+H7mVYA9WpbZKDOaQgBBc0wJq9ii+j5ORoU9LJ42nNvHiS/9X7jNuJk4xKIeIEOh7IyU3ZhFJXYF09QFIAdA=
X-MS-TrafficTypeDiagnostic: DM2PR0201MB1056:
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB1056;
	31:UTvzXakPJDTpLmrnylb3YRJXOHQjof2M1WVxt64YYYfeCn3ChIIquRPHZ/7iXgL80j+rrcwhKJi940sRUHflg2oBayGW54ekoqEmyGBC50v+TWH8CFv0Yv5pMfL8APF4vH0xMNm7mzKo2P/D3IBQUIM37CbzRDdNhIZJ4JTAk7frrqQpm6q5y3OXSr+P1uAmjokSlVtVUiOE9z/PtWZ5081y7vJwFS0N+T/PJztLPzY=;
	20:k25Z25J2DiTwomKf2liDmYtmBtqiaF5Wgt9T1aQUXa7OllUccxNMjcIZMdXNTE8QfA0LGxyqYA+W1PsvIAqeVgRpAVwZPZ7vmnIy7VKcvmcT/hBdvVUTXYpHJ13PzNXwsK3D58rmR4ik64A7Sm3JVFt4rGHmhf9Ge2zQCQX/86kfMjRod8dUVMnGqgBSbqvVgIPBj57FQXRALjGqlKYt8nnccEomYOyqcx124QyllIMSMTs97sHVOrywUC2fAZXWjnm/y5ajLkOzrd1aYCXgGWslXHku/VjblpYlc/3P7si2H2InnWh2MEdX0MiI9+d4M4PnHDIQqdUlyoyqZ1ebLHNWoZooCxoxQXxae/s669q0RWb8YUEPCy4Z1UHmoC2g7q4HSFjcIJotwzbDYiAnS5c/SXSY66bNKAdr+mEEkNe2xWx1zP7nwFn9ycpC/nCNkv4ZLyKleN4PytScDxHlUAQHW0+gCxbnmFumXp5iK7Sqi4ALAC6JP13esJwPU59G
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <DM2PR0201MB10567A0BC57BC49F860041E2AB8E0@DM2PR0201MB1056.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(13016025)(13018025)(93006095)(93004095)(100000703101)(100105400095)(3002001)(10201501046)(6055026)(6041248)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123564025)(20161123555025)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM2PR0201MB1056; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM2PR0201MB1056; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB1056;
	4:BClBZO2TVCymrpZ5KRoOtgORywU45QJOSMnwQgBeqcE5KrQiUopETEuiDZ1ADkj6bBTxG98cXRMDHuN5Jsad4tTJWBGKQJlb+aCYR+oHQX5gwQj2YMCbVsSETBxWWPZf+lYWMG4DfZ1MTOXphf0fJoHVd3J617eL4wAFdQUfZS2vu5/+Vy0FdXBMTNX6QGoM/04YANFtBiskPmKJ7xiR/neJOZ+heg3YUWmurGDJuqfQSUo7jlI7Ch7KX4iSq8U57//bhWWvUOMqVC+b4c8yY7CpPyhDXVXqU6SBEgJkxJM=
X-Forefront-PRVS: 039735BC4E
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0201MB1056;
	23:uzrmDLDNP6xBYsoMS8dvfpxMrdQcN7FLxtkCnzz?=
	=?us-ascii?Q?WRfkr1PhXIddOx3LYT135ovZqaKFGL6RwpxbjRZozCef+TaG+Ab2Smb3tqZF?=
	=?us-ascii?Q?gGG4w18KtQVa8mMVGsIbmPkbux06UvOKyO1x3wuZgxxMZqRqMPu1R2sST8rC?=
	=?us-ascii?Q?3GkA2jtyYin+XKnjAj2VHZdXxLGMmNqGyjfrzxPqFNhe5Whcmv/RO23qoHjy?=
	=?us-ascii?Q?vz3TFCP7e/t6t4RjaMMx1nYceyvcyL5zlTBUCD8yefcl1nHx3kRYv3oMtLN1?=
	=?us-ascii?Q?NPndiAFRx/2PdZnBJ2txhTg9b2WoqUSN0llxslPhGFbt7asiDC7YJkYKJlnw?=
	=?us-ascii?Q?XQk3Q48hsOJT9zjNe1PE4EtEmVQKKFeDNZRlY5YvdcjC6qkXtV3ybuIeiKtu?=
	=?us-ascii?Q?exfo/lx6FP0qZNG78p/26YEVKj9mEjAinaY98bDbS0MvekSe0DPM9K1tnw/2?=
	=?us-ascii?Q?pjSfUFHXy4KW/wK63XJkmbrUxJlN0g9iMW9rbkbKuakgs1sbso0Q8Ff+6ntO?=
	=?us-ascii?Q?9IWXpnJyyEbof0mMLwvcqrSBZCOTfuz3h3ypcuEjICC8AKmDcp9O+wGUUnmb?=
	=?us-ascii?Q?1BXEkRETnBsAK5USL6v3LF/nGVzSbTjsRz7+JvgZtsJwj0VQ2VJ/MUhYS4fs?=
	=?us-ascii?Q?YeUMcdN+/Kh9k+1ol1ZnswaKWJSJdcQD1lKrqhJAjpWFBjI57ENx48lQWACb?=
	=?us-ascii?Q?1zckGWzIRZI523QvuCAke6fG7C2syjSW2phfJuolhBQMCsYx/Y7KQhXvkLk5?=
	=?us-ascii?Q?POCz904CoJuCviiLC31CtQ5gviTnQbU7t/SNP3KTZDKYFLX6OhdZTHfQUNAb?=
	=?us-ascii?Q?k1LfE8C5MRgKRDkaN1pmYEe51HiwWBa0F6UOk+nefIpRIv5QNCDc2zBuB+DB?=
	=?us-ascii?Q?Lh8KB5cBYBhUwFk1MV16uXvttpJSrPgtfZmDqtr39//CbHStuXEpiek77Jmb?=
	=?us-ascii?Q?3OmDVgJnxPVGDrFXUD6YpAt10NFE7XIME7EzfzX+NfJz5hWHFcbFYAvAUyNB?=
	=?us-ascii?Q?vZ/Tccx8dwu0PqIaqqasmmquIH9BREXQJhHDRdCjliWu5VMa5Km5jwPKnhwb?=
	=?us-ascii?Q?qEXKkhoFRWl1+ew+ZmeUaMRDBoBBrI/z0mdH177hPnOYpsaQ1XuXUOwmo7OD?=
	=?us-ascii?Q?hNwGrs1HYVxoDzaYVmq8SOmUzAc8OoTmZCV8rCGcIfk4RYTpSe1C49w=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB1056;
	6:ZyRHTjSqQ3iW8fH9zJhkIecSJ4GXlcbTNtsN9za/58DBwbAPhZRlYdIJj8m+bpx6ItRwhNpbOoXj9qECtU3hByJtcRz4wn0KyCwHzDurm3nutjHrHJHoihK6hgMQQ4aQKZKCaVJJF2ciYdlcJj/y1rnBBpw5GJmt9WSkeZ0vUjpNH0cyYz/gCWa9/pSxjfKECrasethQIFnpXYtKA2QQAdwsYYoYtXNdp+wto5RouLU9zVekhoyAlMFTmPY3uwhUDo/JV75sqA8hDdp7qxKdR0Wy7mCFDIMWqBuNGa64s2aD8RdvVaCXZsv4ZyUnwJNPvAbWvWUuR0VqQvtcOzRnBA==;
	5:KZqW1DpARUb8hRKQF9kFaAE84ok966/crIur+N4rsKYenWlKK38PEzs3o+UcFfLCM7iaV5OHU50fxIdiYRDy1KpS8sKH5EGbmObEsZ9RNHFq0Zr2/d/F0l4OUeC9cpUMDodErvWnUrDWcs7WJOpbQQ==;
	24:4lFoWUh+Jz56YGaEyMViBncVCyrdHBHIOWOJI+/bbsvzSt97IONrvOxsuRpnMmeIPv3utiLMtURNi6lENkoilUBwHeXWrJnBb7HCDI/D6NM=;
	7:BwBGvzPXm0usUkGsclRwr61io8LMrPBG4xR4D281c2oBTKHbvg4wD6b9+XRTMsz6FJUG4hkIxJS+RpDw1WuVsnkugIxvXM67/GAjB1e5QBrI7V67dKkEGkus/Or2YBOueYqTCkmbRcwI4TPu0RYy1UyB6hP/Ac0wRJdIGEY72XFFh+R9D7dDuj/nYYpb3WxyCpTeSZIm9Zxi+PYIBm48YnwBWG9AYrDXmyCQeEW1/Rc=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2017 11:39:26.1497 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0201MB1056
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.53
Subject: Re: [Qemu-arm] [PATCH v1 2/3] tcg/tcg-op: Expose the tcg_gen_ext_i*
 functions
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
X-TUID: d5lJHEpfVLgE

On Fri, Aug 11, 2017 at 03:17:38PM -0700, Alistair Francis wrote:
> Expose the tcg_gen_ext_i32() and tcg_gen_ext_i64() functions.
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
> 
> Although I no longer am using these functions I have left this patch in
> as Richard thought it was a good idea.
> 
>  tcg/tcg-op.c | 4 ++--
>  tcg/tcg-op.h | 2 ++
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
> index 87f673ef49..d25e3003ef 100644
> --- a/tcg/tcg-op.c
> +++ b/tcg/tcg-op.c
> @@ -2709,7 +2709,7 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, TCGMemOp memop)
>      gen_ldst_i64(INDEX_op_qemu_st_i64, val, addr, memop, idx);
>  }
>  
> -static void tcg_gen_ext_i32(TCGv_i32 ret, TCGv_i32 val, TCGMemOp opc)
> +void tcg_gen_ext_i32(TCGv_i32 ret, TCGv_i32 val, TCGMemOp opc)
>  {
>      switch (opc & MO_SSIZE) {
>      case MO_SB:
> @@ -2730,7 +2730,7 @@ static void tcg_gen_ext_i32(TCGv_i32 ret, TCGv_i32 val, TCGMemOp opc)
>      }
>  }
>  
> -static void tcg_gen_ext_i64(TCGv_i64 ret, TCGv_i64 val, TCGMemOp opc)
> +void tcg_gen_ext_i64(TCGv_i64 ret, TCGv_i64 val, TCGMemOp opc)
>  {
>      switch (opc & MO_SSIZE) {
>      case MO_SB:
> diff --git a/tcg/tcg-op.h b/tcg/tcg-op.h
> index 5d3278f243..8c45b79a92 100644
> --- a/tcg/tcg-op.h
> +++ b/tcg/tcg-op.h
> @@ -835,6 +835,8 @@ void tcg_gen_qemu_ld_i32(TCGv_i32, TCGv, TCGArg, TCGMemOp);
>  void tcg_gen_qemu_st_i32(TCGv_i32, TCGv, TCGArg, TCGMemOp);
>  void tcg_gen_qemu_ld_i64(TCGv_i64, TCGv, TCGArg, TCGMemOp);
>  void tcg_gen_qemu_st_i64(TCGv_i64, TCGv, TCGArg, TCGMemOp);
> +void tcg_gen_ext_i32(TCGv_i32 ret, TCGv_i32 val, TCGMemOp opc);
> +void tcg_gen_ext_i64(TCGv_i64 ret, TCGv_i64 val, TCGMemOp opc);
>  
>  static inline void tcg_gen_qemu_ld8u(TCGv ret, TCGv addr, int mem_index)
>  {
> -- 
> 2.11.0
> 
