Received: by 10.25.205.13 with SMTP id d13csp320769lfg;
        Tue, 10 Jan 2017 08:52:59 -0800 (PST)
X-Received: by 10.200.40.177 with SMTP id i46mr904011qti.279.1484067179340;
        Tue, 10 Jan 2017 08:52:59 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u67si1702785qkh.315.2017.01.10.08.52.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jan 2017 08:52:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48447 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cQzfO-0002kr-RB
	for alex.bennee@linaro.org; Tue, 10 Jan 2017 11:52:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1cQzcI-0000cj-5q
	for qemu-devel@nongnu.org; Tue, 10 Jan 2017 11:49:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1cQzcD-0001kY-AH
	for qemu-devel@nongnu.org; Tue, 10 Jan 2017 11:49:46 -0500
Received: from mail-by2nam03on0056.outbound.protection.outlook.com
	([104.47.42.56]:7040
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1cQzcC-0001jK-Uo; Tue, 10 Jan 2017 11:49:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=m72f+UblEyzj3tmO7LVgbSocTlDH3A1GWpBtFLisloQ=;
	b=gRIoUoc5ahlxYrRo5InOfp5GLX6BHsPWkucPOJ/8m/bNrPrpHRm9DYCx2+2ZllFPLUaWTgnTK1L12/FWQaZEzL/OLYvFBPyjHrEsa1hjAdX4wuNjgzlYdKY3vA3J1zy6BqJxmTa/0uWmCdAFKTm85W0osJAyytN8nGgkYLdhLIs=
Received: from MWHPR02CA0020.namprd02.prod.outlook.com (10.168.209.158) by
	DM2PR02MB1388.namprd02.prod.outlook.com (10.161.143.145) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.829.7; Tue, 10 Jan 2017 16:49:38 +0000
Received: from CY1NAM02FT061.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::203) by MWHPR02CA0020.outlook.office365.com
	(2603:10b6:300:4b::30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.829.7 via
	Frontend Transport; Tue, 10 Jan 2017 16:49:37 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none;linaro.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT061.mail.protection.outlook.com (10.152.75.30) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.803.8
	via Frontend Transport; Tue, 10 Jan 2017 16:49:36 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1cQzc8-0008Lz-4B; Tue, 10 Jan 2017 08:49:36 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1cQzc7-0006oi-WE; Tue, 10 Jan 2017 08:49:36 -0800
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v0AGnWOO031859; Tue, 10 Jan 2017 08:49:32 -0800
Received: from [172.19.5.101] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1cQzc4-0006na-4v; Tue, 10 Jan 2017 08:49:32 -0800
Date: Tue, 10 Jan 2017 17:49:31 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170110164931.GV14990@toto>
References: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
	<1483977924-14522-3-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1483977924-14522-3-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22814.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(979002)(6009001)(7916002)(39410400002)(39860400002)(39450400003)(39850400002)(39840400002)(2980300002)(438002)(189002)(199003)(24454002)(5660300001)(4001350100001)(2906002)(107886002)(33656002)(81166006)(81156014)(92566002)(8936002)(626004)(2950100002)(356003)(110136003)(46406003)(6916009)(106466001)(54906002)(83506001)(8676002)(63266004)(36386004)(57986006)(76506005)(305945005)(50466002)(54356999)(77096006)(23726003)(38730400001)(9786002)(189998001)(97756001)(229853002)(1076002)(4326007)(4001430100002)(47776003)(33716001)(9686003)(50986999)(76176999)(18370500001)(107986001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR02MB1388; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT061;
	1:z2fkkoLEDgwvWEa7LQKxpdOVaB/f/j0LFnuHED8O5er4D34FukME8YQ2Hclr91YM2XYIH0cPH1nOCotskyJMPdIsLam7DLsIGBQo4C7mm9jU6SXf0diWdWVbUFDFJX2ZxQzZ1+DBOwt2I8p1Ji3+7r1XqSTa9wAVkeQoF+rmcCqcXqZiabByVoVH57mAvgANZjwn1mri9tTTGKP1SZIx4u67UoXaB+Tx+uTNGCcQDed0yJm6fWHZKSR0xwnl13Dj20sWGx2s6bCH7O+5R/6M798UsWTmXFGTA77m41dQil4M+9Y8Z32jLVpdsMb4gBYlLRBlSb4sBPp8z3eEDCU2VzxbN9VmCz0o4rSFr5w0yRjxJVzu1ei+w15Y0eYg7eVDtdyKQ7fLu15wSzo3eQaRHaosqmJJvCK8i3GT9V570pmW7SHHIQ4TbPKqmuEPGPrmUm0xZ+u/WaxuFJ7+HIR4hPUdYc+vbm8ZQp/WD2W4AMTmn/XGVyj7FcB77NIYNYlCXFDr1cUCvgbTTNjUWywUqvTGobq1g/iK/U6qCk9QW8Q=
X-MS-Office365-Filtering-Correlation-Id: 6445eab3-a3bc-46bc-7605-08d43978a9a0
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(8251501002);
	SRVR:DM2PR02MB1388; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1388;
	3:GagW2tf2PTQktHcbtazd27VN7NJgajqBEflwns/lDzwOkYlKo7j2u47kx5cPJ/0aOLcytf+Q3NKRyyEVNR0aSpbSliXkWBYuoejTp0uHrtNcSPaVcnGqgA/Vu2fQqCbhIl9DMuwSk4gYVzFyv2zpQLbF/4tJmeWslhg+YIzyb7fX4QGzgbig7bc3Um1Xtsr6QiODUFkwjg2aPbMLJQ0oNhe7QvFb7i7dNe819olkkF1f487UejNz7NDCnvRqaGayf6y/GYrDPqGzSieHIe6jw3rdt0G9Gj91fo6oe3eBeFZmfP9lyv3VPtQWuYnYidRwTGiMdIy0DZKNo+HAH9feAHrfgrwTDE2azEXTlDTgYd9hXlYqbzMhBNBfKX+fW+OUUJzWgBjvveNA8CRdY4f1vQ==
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1388;
	25:KmgKt+04qO8jH0yCMz9TnQ02lCV614YVechmsltR41BPpTCHE0dYrrKPjuelmZzcVrqRnFUh0HPTLzexktVWLfBIoRUNzJ/Nk3U5bX6kuF74UEHfAdxiHX5IQYwfI1ucVyWNVPB41/XeE7mnWuW7+H2ARyLskgwnJEIIHLCgQGamuBLwOsuWSbvI/KbrIwz8vwL/zZkj4aqbUCEZoFB/wDOOZ84GRITJNweiwnqZUfbRtG2BA9MXvNqiHcJics6ScFsj6rsVfnbPZk6xPUMgauYIxL8Ja6GNXXtm0C+n3eEfwCI4AyfgEsY7K1diNkEpy2fs0uL/uOnZviooWXtwnEAEVMfwCOp6V33xWhT3w3E1BsT5U0yXZqnv1vAKOdg9xXtn38sgpm3QlqZFxiVxT9QIJthIcisyNPqzbVdqKiWnnYtWnFKvq8t4QjNwI7Uq3fkuztWXrTA4gl2n3z7kQaJCy9gC17ZZ9V6m4JWtfJ7+QAUq42VGLYpjsAC/Cbq0PruvyeTOjjZLV01IgyMz9qh6a4roNTVxqhmdMiy6687jvbnd55gPBRwChgCBc994aBJdfK4vN5tHFNpNU6OG7C37IUa1GEXoeyou0vLw3CZetFm0Ij/ovN/pQ4tfhcAKRRXezRZ4wdBt01gCWVaiKHBXoFewZrmNxxydzo6o6KhPUymbW0exMKkqUpSYzNf383Rc0rMndFZjjJjC/v+siEkzE7oTM1QdULqEDP7PhOOncP7DCRd3ZhaIvdS+8IMIEhgTOLuos05ZKIWI2NPdslBwHCwkpdrEucfklZlQZMMByoc7G6kA77A/v5ycIevSb5OqQgCaXNk63RUqdDpYzA==
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1388;
	31:nkGHlpjdN2gjjNJ23RFtPbyQjmoseTrsysY2pfcVLJMG4CtEsr5iaM9vSupEYeog90VhSYhWw5N6gSjEwlhK0aw+pVZLynRs2IIR18pzKNy1TBRGPkpIPAwIWrG2DPEQtFs1FBAtdA3la5HP7H6CNrbBRImvkdxMwseeGAQBSnO+JiLF8e9aHE2LHACfENod/mzOZsPFWoqrdmf9clwVGN6KCJGbPBWnQRpdTYlFbF53sFi6doVfvDRUuLaYh3u7cqUmN/pi2pnoL7RwFcwwZw==;
	20:Pz+2CHBw90y27genv66dYmNSHhQOFGPj8O6rrXCXl6qif3bKv/hNapG7/iYzhCUDdNX1mOkXjjIu+NSHAFdSLBQYgBm+eGQTxQS+IhNTr2LXsb+E9RoJUkB1sZTMketoTQFm97l2LXG/2412BpM8rmENUpzzmpuqBh1gNDA1BFJlLF5K+AFXvus1wTiSY7TaRruH7zEJFFCefAvIsobwTx5HG1PMNqxCx/BR/VYLESU7C4qcAjs1hB0afcbwfxlF4PgwULBIqHRD8/Flk6VGh7k4QSQLqwEA71MW11m22AyH4oWk0kuvK2orsM5mUfGNhyOusdg6IeiwNNEA3lFrkqJxdGl+/0DCipQjFAo96CQzGzFdm/XqUyQIeNed5P7T7YYyDjEanYGy9AIQ0s+4it7BFKvDpppNwRruK3ZFJ1EvVOc7WqAZdZg1T2gzIzMgBXi6npqyfpvAsQORAUbOyC2xna7f6NrEwVuONdckDS0z09r3tTK1X/78afIcoWkt
X-Microsoft-Antispam-PRVS: <DM2PR02MB1388E898AE0C0DCAFAB1E4CCAB670@DM2PR02MB1388.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192374486261705)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(13015025)(13017025)(13023025)(13024025)(13018025)(5005006)(8121501046)(3002001)(10201501046)(6055026)(6041248)(20161123560025)(20161123558021)(20161123555025)(20161123562025)(20161123564025)(6072148);
	SRVR:DM2PR02MB1388; BCL:0; PCL:0; RULEID:; SRVR:DM2PR02MB1388; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1388;
	4:Ag20AdKSE7ARAjghxrP93jAGKwc13m9TBNt71SMmTQaJiP8Aktpxt2+xnuKzm84y/+cxAG2oJ4fTQhL0aZ7GouxZeUqPhu9K4BcXrz9VjtXPdvjkO0aIh+zfN1l/4j6w0LL8Fl7YkJsl8JJ5aDKYAoQB6wA2o6DddDBrsIdIb+MUW82CKSoFgFfbQwBf5AQXXM21dCrJ6G/o+Z6UXxhXh51J9n1Welx+7LgMl2Td6bWbM5HjA7IoeOy05tgYYw1PWhxM3+SEIp1XVdzYIJtqf3kaZgJxcxUtIbvwSL7teMv9q85gEr1Ngq2JAsSCgUD6XMvOTYnOr784ekKQv2ZLGz/fvx/ICVIs9aU8KdBI7KtLKYVsiQBI2ofM53xNmQ0OolWgQNoK+0j92ByeGQYOLRFEdHIPCv2OKzWFJ28CYNVLYzOtGrhHIuXrOyKIs34wz2bunnKE5mWtUUS0mbJU10ATBSH+iQYCWKqQFZbXIuvEzJJsjGH3F+7wZOv5FXo9iUkEZtjLx8KrDGs5nx+5/wBXLYfwIQjBxas1Kde/gGPOsNzjL93Vfclfk1pxnpOEHnWfbxgRlGH1x8uz7me/6ezxirqBDDOHRpVFqYG5///Jyk4PMCOdYFw3HLn0N6qe3BywFeu3NjmO+utEFfb207Gc9wPmi1/ELvo6vZePVXc/4JqfA6nZYGuCvcONNizej8qiq1NQI4HRJ0Ac84wj4kawAf94/gCKy+xrNqw/i8l3oEUuG0+Bskmy+Tb7xS+W68JdvC66y7sNCiSABc8DDfyWYwapzUUIN+B5rYhSj/4=
X-Forefront-PRVS: 01834E39B7
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR02MB1388;
	23:35ZGn0K9ua2UwGnr6JNtQWWFajKqP7gUxrAYaYQp4?=
	=?us-ascii?Q?NB63m9iqpwVE5A5zCR4NDnHZK2evEGNOmDrb8JCykDoCh/JaPDV5EWUFCmfh?=
	=?us-ascii?Q?uZRcdOZJMLcBKazVLvq7J7pQ2yI7Ik2EtYlwk7v/zsH8gtOvMJteJ9B3NqXM?=
	=?us-ascii?Q?3x4qjvi4fJDHEZ/hNXdBS932V6IZAhY4/iGM4iqtMWytDDt4H2Yjh5YZyDTY?=
	=?us-ascii?Q?evLJUCtuKPgay6q2mSaAMAgsV911xzOlay+Q+hWieqVWuShM/88wYy0fKN86?=
	=?us-ascii?Q?2q+svW7eiWY1xaYOJJhaF187jU+QuDulkfbh1UJ4tl1WlGP1Sy7SWa6zWBLr?=
	=?us-ascii?Q?62JmckTAoRLqgqY4e0WzHV181VfKXt8VOJn6+iL5vHJCH1g5PpSopQf1muWm?=
	=?us-ascii?Q?WhpiQpDd7QMxzAsRYze/lcJL0ib4AyBdOMmdBR5gPfjXkLWYst45hWx4i3IC?=
	=?us-ascii?Q?Vl42nKcCdrUN6aZk/mRE2irK2o4m6fHmeTdeoUIjEs9ZwPvNsHse367we4kp?=
	=?us-ascii?Q?yW2RCt8p1jlHmZDtUy4Co7CQo33g2fJ65+5fc/5wnl2Q4X3EK/ETM8bNmPVB?=
	=?us-ascii?Q?orleGexAhUNLEuEkVDvtb11AbzpKVD9M0S57gnqECin/oVcLmJFbMNNXxE8L?=
	=?us-ascii?Q?/O+fNb9/pt4AsVWwWYKk+8fj2jywFl6ZoibJswlJcNovweTD/JY+Fs3K4Hxz?=
	=?us-ascii?Q?h8WScbBBrQmq8Rd1l0D04eLpnaas7iiJ3r6aUcqrM1PoZq1vuzizZOOkYuej?=
	=?us-ascii?Q?F9HxwY/KtvfgRqjtxmMDfhVoe9MqH5OIwCPHPP3kSTLM5rbDDNDpMOimyrrk?=
	=?us-ascii?Q?/0Wr8EH9gZsBbcsLSX+LzoHjlU92lOOn/Z6hv8Ait6OCgD4SNYjXWiG47Dwr?=
	=?us-ascii?Q?6KF2QsyS2ATl9YzdiayfL2qqVBAqG/QRZasDTZR/GbpBICdkDdK39GU+K2vD?=
	=?us-ascii?Q?QD5dTGI/j5lBdIusk92qkElvlh7A6f96kmBeo5ENPfDQv8hR/ZSXctHY1yb0?=
	=?us-ascii?Q?NHhnVgO+jUJes1e+9MCGkVV1AgpQV5sc74kpO1OOnZMyfYigcbdeflMBfCb6?=
	=?us-ascii?Q?gzzL8zQ9gHepeo1wx5ozq14ogqw96e1XqE+tI9sT1LsE+862Bn+7+V/HRAIT?=
	=?us-ascii?Q?LYhdMb5oJYjDYhuSKip/Q39U5tOda9tO4v0LGc96F37SKMBIAwh9P1/FDlyN?=
	=?us-ascii?Q?dKjifEL300+Tlu4gQttmt35E/mmO5XebW7+na4Cq97sC4ayhlAwU9ZYcPQEO?=
	=?us-ascii?Q?V8jHDLNqwTgFYxem6uthQsvD+R9B22b0cUmnKEUwdYUaxCreUvpHTjmheLvE?=
	=?us-ascii?Q?Q4YmQoWk93sB2Qz+dbqD6ws+NJ2PobIP9Co0+6kvIbPYRdmWAMihwKCQrykt?=
	=?us-ascii?Q?IK2L3HVwArj+xgywYw2Nnel6/eL8nZmkkQvYohKoDzCE5j6q2M0M536Ta55/?=
	=?us-ascii?Q?YZwke9oP63/eGX8oY5aZuthGfrbDNU=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1388;
	6:CUQ8QE0WxptJx5VWL0H6Lt40mvBRUIZDkGXynAUbKIAW3cc5/JoRdfLlWr/V6pyw12CYM/8CCK8agtaWzGU1/TDoJM0/Ei7kWMH1QfTwsH5qS8G3W8sTqy+9Uv1+18XhDpACpge0MyzpXDk4ZLNeofON+BUlUvgQaxI11jyKyddvmUoZpRRQpQfdvS15cHKwf0EuUoNZXHw54x7g2xman1dpb5kvzrIlArxqAw1lttGHrcVTEhW7mWKEUp9RWuZhrDlgW3IE8hbu3YGraKkhBgzSIGSsZQR05nxtyzsjdfL8yt0cjVk7wW940BIHGzSHT2dHBVB5NWCMxO5mFLduiZ02Cml7SU1qkrf3MZ1EJdU21oNm/HCxTjvjkJhre+UbsIxLdk2sIYxm1md/zGanzIXa4ddxafxsKtQJcwIZAsE4I0eZYl/gDBpimXxb+Ea2PRC+QWInO5u1weDryQIHNA==;
	5:Se+GbRMnYC7aZA+FgcQrV8qjXkrpsoU+BlKOpyKbUFs4Jepfhf69sUkMimqR5otB2c3wD5WYL9TU02tGfavZ77LBhe2y9KbCPsQOTAWAXyTUALAKcU0Ybk1kUMuWG4Wfv0yf5GLggVBxmLmFhLX4jeHa3xvrL43T3Rfz4huqQBc=;
	24:XZqRyUug45RP6It06M3JbRwufSp1eP3tPevON79Fe0o0ugGFtiF4NG6di6Y8iQM0SbVcGsMpmNAiQHN2EigEGNMFx/Fsbd464hJPljtO6Hg=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1388;
	7:jv7hJgdRNEk5w3cdNFpH8Xqu55FhiF+DGniSCiKCyLWHTDu0vn29C6wLh16Wxbgpht1K4i/JjT6BqDgJ6BQZL/MX99gAQbFFh2TKdMChNQvClvhRGKcWfyX3ME3uEu26bnmgQVuQ4tK/Dy9fnlXDZeFVat3eE2uDKge2MpYFOWt5D4uzFrVkrHaPpuHmxHBbyQmQEcqFZp8NkN6cJ/G3QWyrC+aJn5SkZAPd/stiyvrs8IcdTw+A5Mobky92TT7UheFyCz3ITFvBOw1SBXpRSAVKUFCugYftHjKS100vWC11ACvFLVs1W2/3VdOSjFZOblxEdvHUrbH1Pi/VWcqYAxfoXFvwKXfFG+JE5pAY3geGRyuJz0/iXkMiWn7vdx52XT3QvdclR30pSoXDqjkw/5VjuQSO2QNGY1PCgEWbeU0TK/Nwq2RTf1ygRqn5wq6y75FAFD44dL9yH2GXiVQdxg==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2017 16:49:36.5494 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR02MB1388
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.56
Subject: Re: [Qemu-devel] [PATCH v2 02/18] hw/intc/arm_gic: Add external IRQ
 lines for VIRQ and VFIQ
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
Cc: Andrew Jones <drjones@redhat.com>, patches@linaro.org,
	qemu-devel@nongnu.org, Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hE9T4KgPLvlw

On Mon, Jan 09, 2017 at 04:05:08PM +0000, Peter Maydell wrote:
> Augment the GIC's QOM device interface by adding two
> new sets of sysbus IRQ lines, to signal VIRQ and VFIQ to
> each CPU.
> 
> We never use these, but it's helpful to keep the v2-and-earlier
> GIC's external interface in line with that of the GICv3 to
> avoid board code having to add extra code conditional on which
> version of the GIC is in use.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  include/hw/intc/arm_gic_common.h | 2 ++
>  hw/intc/arm_gic_common.c         | 6 ++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/include/hw/intc/arm_gic_common.h b/include/hw/intc/arm_gic_common.h
> index f4c349a..af3ca18 100644
> --- a/include/hw/intc/arm_gic_common.h
> +++ b/include/hw/intc/arm_gic_common.h
> @@ -55,6 +55,8 @@ typedef struct GICState {
>  
>      qemu_irq parent_irq[GIC_NCPU];
>      qemu_irq parent_fiq[GIC_NCPU];
> +    qemu_irq parent_virq[GIC_NCPU];
> +    qemu_irq parent_vfiq[GIC_NCPU];
>      /* GICD_CTLR; for a GIC with the security extensions the NS banked version
>       * of this register is just an alias of bit 1 of the S banked version.
>       */
> diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
> index 0a1f56a..4a8df44 100644
> --- a/hw/intc/arm_gic_common.c
> +++ b/hw/intc/arm_gic_common.c
> @@ -110,6 +110,12 @@ void gic_init_irqs_and_mmio(GICState *s, qemu_irq_handler handler,
>      for (i = 0; i < s->num_cpu; i++) {
>          sysbus_init_irq(sbd, &s->parent_fiq[i]);
>      }
> +    for (i = 0; i < s->num_cpu; i++) {
> +        sysbus_init_irq(sbd, &s->parent_virq[i]);
> +    }
> +    for (i = 0; i < s->num_cpu; i++) {
> +        sysbus_init_irq(sbd, &s->parent_vfiq[i]);
> +    }
>  
>      /* Distributor */
>      memory_region_init_io(&s->iomem, OBJECT(s), ops, s, "gic_dist", 0x1000);
> -- 
> 2.7.4
> 
