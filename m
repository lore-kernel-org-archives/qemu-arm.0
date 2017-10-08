Received: by 10.223.197.9 with SMTP id q9csp1866435wrf;
        Sun, 8 Oct 2017 15:21:00 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBjev59EETJnE9AIT8vh9gGWYwAHLFKz3mPJ5ve8SacuYfWqWpOyUpRPbkoiH3rCxMxt9zg
X-Received: by 10.200.8.166 with SMTP id v35mr12641962qth.306.1507501260128;
        Sun, 08 Oct 2017 15:21:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507501260; cv=none;
        d=google.com; s=arc-20160816;
        b=v8y+iNaHuOdqX/i/1g4/pzu/CL4MBz0rRH9O4edlPsNnb2nwu9nn+R/jYrRLDCx5zx
         3InPl3wUjj4HUdk6E3yLI6+P0TztbrVWEMZ+UGOqY8TubTPXbspIhY3AVlrb0Po5j3Vu
         8B3ISWw+Ezi8dcWrIAcsm3aSE2zvDz/Av3XZ8JEw0nm177IfcXZvMEFEJytkWqNVRCU6
         lElrEkTUSpPou9TFiEDlxSOclrQ8+PGwwAu3+dUHt2Ns4oMOoSkJdwMKdDy/WULsoqwM
         7tSBSltFRcftQK+3lRokAcLgLlOyEILTVNNva3kiI1PWvGPqT1KpB0/H0kPUtsfhAC+9
         av0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=FBl7E0meWmkmuNkxQOUagi86+WZ9iskTQOya/7oMhPs=;
        b=mj7KywzxuHY4+zUaXHmp2FE8Ol1C/YK7dMcy88eN9UNwa5M1w0Vtttjobt4+gWvx+4
         U+imDoIJFq1B5/0rKz+OU3zWu3LQVsGCKLn8AuLPLRWGXv1oe5Ir9POBLJWVVg6pmVNp
         kBnG/7q3Gs17jMULz98F/nQ2SYsZEM9LkFveI/bVAhmjyk1vh8+GQCSgmOgRFWVDn0gP
         Y4RoX/fmtBxAcRiu7sPub+WpT9dGPrpwLm8qQqH6FoITTGWk63+BDduzMWZUIoW/qIYy
         Pd2bZjvnLRMrpJ2nAJE1LkpB3kNoKlReVy+tIRTWRg77aFtZangJRC/Rx5k/+QYTt6uo
         Pytw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=wUqCEf+1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d5si5529707qtb.132.2017.10.08.15.20.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 08 Oct 2017 15:21:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=wUqCEf+1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55286 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1JwR-0006Gc-In
	for alex.bennee@linaro.org; Sun, 08 Oct 2017 18:20:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar@xilinx.com>) id 1e1JwI-0006GX-FH
	for qemu-arm@nongnu.org; Sun, 08 Oct 2017 18:20:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar@xilinx.com>) id 1e1JwD-0004vY-Gf
	for qemu-arm@nongnu.org; Sun, 08 Oct 2017 18:20:50 -0400
Received: from mail-co1nam03on0063.outbound.protection.outlook.com
	([104.47.40.63]:35729
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgar@xilinx.com>)
	id 1e1JwD-0004u2-5X; Sun, 08 Oct 2017 18:20:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=FBl7E0meWmkmuNkxQOUagi86+WZ9iskTQOya/7oMhPs=;
	b=wUqCEf+1GHH7QNTR8RDPBZM2F5o1cuvQmtZ/1XZgD217t8u3Tg/syaJMjvvuKp7ZVxZxBYQ02sM6r3bA0+z02+MXQ6+xdea0ZhjsG3LkxWx/oqz0pEWd97Ms4Xet35yNKvZQrMdMk/HwrwRFivw+cb95slmsG4l7nFeeQGu1aXE=
Received: from CY4PR02CA0013.namprd02.prod.outlook.com (10.169.188.23) by
	MWHPR02MB3280.namprd02.prod.outlook.com (10.164.187.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Sun, 8 Oct 2017 22:20:41 +0000
Received: from CY1NAM02FT050.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::203) by CY4PR02CA0013.outlook.office365.com
	(2603:10b6:903:18::23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.77.7 via
	Frontend Transport; Sun, 8 Oct 2017 22:20:40 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT050.mail.protection.outlook.com (10.152.75.65) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.77.10
	via Frontend Transport; Sun, 8 Oct 2017 22:20:40 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar@xilinx.com>)
	id 1e1Jw7-0001BV-Bw; Sun, 08 Oct 2017 15:20:39 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar@xilinx.com>)
	id 1e1Jw7-0002yY-8r; Sun, 08 Oct 2017 15:20:39 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v98MKYTu007713; Sun, 8 Oct 2017 15:20:34 -0700
Received: from [172.19.118.73] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar@xilinx.com>)
	id 1e1Jw0-0002xo-M0; Sun, 08 Oct 2017 15:20:33 -0700
Date: Mon, 9 Oct 2017 05:20:29 +0700
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Message-ID: <20171008222029.GA29979@toto>
References: <cover.1505929556.git.alistair.francis@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1505929556.git.alistair.francis@xilinx.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23378.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916004)(346002)(376002)(2980300002)(438002)(189002)(24454002)(199003)(2906002)(305945005)(316002)(46406003)(50466002)(6666003)(1076002)(106466001)(23726003)(356003)(8676002)(6862004)(6246003)(81156014)(39060400002)(106002)(8936002)(97756001)(4326008)(77096006)(83506001)(6636002)(229853002)(478600001)(9686003)(50986999)(58126008)(5660300001)(2950100002)(54906003)(81166006)(57986006)(189998001)(9786002)(33716001)(76176999)(54356999)(16586007)(63266004)(33656002)(76506005)(47776003)(36386004)(18370500001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB3280; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT050;
	1:qv/y5Ggnx6p0HQ3V54uBh2sYbHaqCp8v3sEFM4LnhxuaLvxMPwE04wkN+zpnXjAvjicxiAIcauUtGupOPyv4d3FtUArrANYv88Bw/NR69VlxDSdmBHtigksjjQ2jeKg9
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64b57f14-da84-4aa8-1926-08d50e9acf1a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(8251501002)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
	SRVR:MWHPR02MB3280; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3280;
	3:vRr5UPF9DT70VQqdraLbJAyyjn5Y4dsPmbm0wuO1psYJmH1QbJtKjFz4m7DtBF5xhA3LbsRSe1ISUU/FPMVucVYAJg0N4TH/AvDGD0O/ubS2rJFxp7wYJOmp4FevN4z7ebRBHk6/1yCA9pYpNAvpDkspOV2v6n+ESlOkC8Lav0kuE9y/LceagTekL7SLrNd83gUCt6nVe4LkOjBG9Ky/c2ZJrvNWO8PHqxacs26a1eigqhp/l35/ZhVxbUXwB2CIJ9HEK6cmRBjInWeJtjWPqdBlxcYbWmByiSXoQ9EIUCVAuxWYrq5wc7DXBa2z2ksl2aN5Prm7i1LGUm5iazB/fQ0frGAcSjHlb198Z24rtaY=;
	25:E++swlF63uugDTur/LzreTb0wXxez/FXcbS97NjnnZgYS6OWIJduht6+Tpp8TT6Z3nRaOvPg88arY22sI5armV07vTajJd+XebYdcWSUlzELNpdLlVOsxu9om5dE7TnLzfbwxlL4SRrl7hJdfQ6kyntT3vsIlLZsTCh4MAhkx3kULR/GFNV6CupSmSkRXPSeuAfo1JDyC2EObTH08OapARTsTlnpHy5IlsICUpyzP35HknaCJ3zvwK1LhGqYfRc+YcTdU24fRodCoui7o4/xQ3+2DtmG48fANNtnwCcwsz2uees8b+O09Y3n/UKvvtPdNbG77xt7biOeRehrJ78+5g==
X-MS-TrafficTypeDiagnostic: MWHPR02MB3280:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3280;
	31:Dn9fMqONuD208hRuDCQ2ml7Lf+x0J9id0rzvqvySs71TTGvowcnCCmmL7O1u+XIWPgRPL0FwHKhMdw7m9117lhVFuHN3MwYfC7n7j+r/7qCixI/fUoyxezrG+d1XgFYk6qCz0pimCtslIKoeZxmGIUASgoGdSojP81qDKA4dfIJpIkoCLqHHRt6w8BEcWiydYsQa4P6uA83hMn/iMrr/+z28/eXB3Tlr2AOoT1T+WcU=;
	20:qP/fxkb94v2DLPWKVPjZeKz3crg+yBXBJZ2P7Z7BEkFFu5Leae3bzZkV40MD0y1uvd6x34Cuf2fxPtCIYD54zQa/Rwe8b+Jvl9QNhhb/G+znWblmZdfFUUH6g0TxVPQ0UuIaQNKRgVa0q9fe5SiWvtrSimUxJassRbmvksgYI5o69kV8YviiDpUKBynI2igHnSdv1Ap5FLT6YyE4o8J8ilfeG4wvLaugH1lC83g803JcHfdHgooKzL6Z+pMzL2k3gawBH2e8GAIilKomecps4C9sP5YFHWMb2cR1PUZsXh75x9JWip5UzFiTXKuJPbvHFkert80vZTEVwurjTRl2hTGnKLxjSLviwB62j7Qg7qybuOXrtBu8XhuUA5cXAYxJZ8rgi6B7l6RzhZ4c9Oe9d1DComctqM3wueqLu7XDj5uYwcQ3HIbozjO5wJR1rynm330+FYZWz193CF8xXI+YcoqqiwnbPZMJt7g5hdC5jB5mVpS6L4sTb1gH2bfMAv/Z
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(21532816269658);
X-Microsoft-Antispam-PRVS: <MWHPR02MB3280C798D7E56B23A0352C49C2770@MWHPR02MB3280.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93004095)(100000703101)(100105400095)(6055026)(6041248)(20161123564025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123555025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR02MB3280; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR02MB3280; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3280;
	4:vfB3NJKJ1J/+QtAwT2O76P6qD4QAwr+73wDJa1mTS9dUlJ6ezCeOxQ6b7Ysq0iTfv60c7sfpH/0Q367JaHyvTtN0qPC3PbcT6tiSdHdr4gP23pvWAmWxhIHCkzZ2F3HzNK14tOJDCjFtlpHiz1sesmJ+5fWuJYq/xwoVThnD3rV7jYeei3NnV8qekGrE5rGM1c7aGdNfeUE1/3uzUlVS0/1VxkAwMVhZZcJpPtj4NTrdimRwg7OCwNJZzjzmaFdlZUly//Lr7vyD58C8M5zdpgnoEXYSI2lF4d5p4OSEQpg+DwDW3IqKbPUjsZqVnRkFns73t4JW3kOf6qh34J72Kg==
X-Forefront-PRVS: 0454444834
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR02MB3280;
	23:EEZsIJUWGm0423K5dZWqzRlylkC+5oItUKzEm8fXI?=
	=?us-ascii?Q?BvFKVDJlOsWVgZebMCCxTsf+1+3Bd+6PiItgxgo/yqKB3+1OBIicMPx+u7kf?=
	=?us-ascii?Q?9TGM/yLyMYwLHL4zK7MY/s5Hsd+NPCMllyLxoYvjZT6vYbrGaLjNWDtNPqUE?=
	=?us-ascii?Q?0SHfH7ZJGGLI6fz4ua3SL41L0yIyieAiFGsXlQh66bkHvU95syDhX6ulHJ0m?=
	=?us-ascii?Q?E1ZK7hMea78jnJmKSUokxC64ttldYKmSLihGmllg5WiYUEzLEiGuB/HihLXM?=
	=?us-ascii?Q?ewukuwEkoKPqu14141XMv4ix4g+j3DAk3BO8PngCfzyG50vsrET4jSPGWJ1P?=
	=?us-ascii?Q?YlLzB08YhTv7y8DzTalCMhJEQL+6gFQI6QB+TwxdNJCYrV7YEwxCV9GsOhKy?=
	=?us-ascii?Q?MHodRLl8ifO1dnByRWlnhAQf2ljThW096G3pnuVcLxEvSGXV9zVq9ZhoBa53?=
	=?us-ascii?Q?eo6eiGRKUB7Y0fH5JFJtiJBg0DiibjJDU/dcXmjlPtr3fzXJMGEuS7MQD5Kk?=
	=?us-ascii?Q?BefeR6Ye8yn09RKCX/eKnZtk8cQkBHRcbMIateKPP7eXVoDf7vDXIiutyxbd?=
	=?us-ascii?Q?2gy7IIOiRAKb5zAA/zJexFmSgG5AWUA2BqJh8CzQONb1urqk3pza/xhhJdk8?=
	=?us-ascii?Q?dV0e9b5C/wldwljXBfuaMJNC9O0hGvaQskYsAsAv+PyoyjCq7h/5qMmeEW7B?=
	=?us-ascii?Q?W5q86EziI5zZLhxE+EHDJvgyzS8pGfxnJp7QSYBDHGbWP54d+dbKPo/mIIc4?=
	=?us-ascii?Q?LWTbSw+Q1nnbtYJ+YtUV4410Ut8nTGvq+5y4p5qrhKryb66mZFodd6/q9kRq?=
	=?us-ascii?Q?qnNcVI8IyoIYx6IL260Sege/JhqAkpBbypuCB6rs+QmeMLpm7aEf/0q+V5Uk?=
	=?us-ascii?Q?7ebMdK06C5GKlqKje+akRofiVsd3Kddi92Cajv6wFp+A5wgvmScXm/oWZk29?=
	=?us-ascii?Q?/O/CWBB+5fGrZEEnEa4Z5wMrWgp2VIT7wlTT08KQhZAna2MTrYGoh6TKydhZ?=
	=?us-ascii?Q?jy71fRqEAA7Vw+Dg7MvnOd56UStLSd0e6bhkfL+kL7A5WHpdOxb00B9KI+bm?=
	=?us-ascii?Q?tbq2xDT41Il3ZlRvrIvC0dshBNQQVJxFK/IcmLV5z6pCW+9H/9NX2RKAGAWU?=
	=?us-ascii?Q?Fwn2H8ce9gKHy7VOra/a7YHIVB71mxHj/DJk+xvTv9/g7Wvzv87P/glqV5Ps?=
	=?us-ascii?Q?7EORW3FHnG/PGS1VjjA0GPAnCH+LAj+tmDzjILeIBgFy2Cdkmp6dByhnUEcf?=
	=?us-ascii?Q?nECZVcyfWNSaMu9vHM=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3280;
	6:hbkeCtm6HFQGVXF8o4sLW7xJ+URVybtDt200iuUZ65mBEuNcwHmnrgBoFrUW+De5Xi7RQVAPi5vXtmflWcCNovIlYZmUSwGUJzCKNqIBhEsAsI06wFAWgMINH6cLH5xtzyq6iDquML5k2dy+Tk6A3zGO3AOjkABor145Cd2qM3adXykJ+99Qy70XOVH2eLWlNQbtXcsRoG/Y8u/1yrwLZUEfH0nCPPeI8jv51d9d/1UanjqZLf9JUF0G8PDStjIKouKAhvgPk8ANuGI03jGWL5B/dregVkqzxD4GXFgUaGtzSt6ceM5eqang/SHq43jkhtsFK4L42/6sMmREk+eivQ==;
	5:zSUco1JIZscTNa5DBADrx9Z7YfXIey2tNd3jOUo6J/W6KdShx+Z+ct2danky9zPLMXCoHhFKm0EnWZnnYnMbvMI40jCSIyjgISjXDfkr7jnsPV+OATNusDy3ry4I8ltM/L0SV9TTHiLWg/J0ut1dLQ==;
	24:DAjccJdy3YZbJGxVV3L5dHBbE3KxRbC6Jl/wVPuRD+DTWaLG3lAw7DsbAx/fvBibK/edeZWDNzxieDqBnGZGK8yFfZRWym9jQmkEfeJWYGY=;
	7:wbt+V5gegMk9BA6AcXvjcpg3XkIY6OBoMgDdiNSeRy7fGVsFH6nmU8WOJmyev0CM/brNck31dJ89EoXO1GPyG2s+LZW8Nng3YBzvwJrG8xyV0StaZg6uEOyAm2XLBQdyhw1gx23AGIP0rbtHvOxJwZqJfF+MtXRQUwyc1MbZtqSW2zb9vzZnIarnLQnHetffelvGsLob8rLVnBE+fQxW3oBe2wRuBg7xTusrpPwGMkM=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2017 22:20:40.2170 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3280
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.40.63
Subject: Re: [Qemu-arm] [PATCH v3 0/8]  Add the ZynqMP PMU and IPI
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bGYkG5uOemI1

On Wed, Sep 20, 2017 at 03:01:31PM -0700, Alistair Francis wrote:
> 
> This series adds the ZynqMP Power Management Unit (PMU) machine with basic
> functionality.
> 
> The machine only has the
>  - CPU
>  - Memory
>  - Interrupt controller
>  - IPI device
> 
> connected, but that is enough to run some of the ROM and firmware
> code on the machine
> 
> The series also adds the IPI device and connects it to the ZynqMP ARM
> side and the ZynqMP PMU. These IPI devices don't connect between the ARM
> and MicroBlaze instances though.
> 
> v3:
>  - Add the interrupt controller
>  - Replace some of the error_fatals with errp
>  - Fix the PMU CPU name

Hi Alistair,


Sorry for the super long delay...

I think this mostly looks good but I was wondering if we really need
to have a board specific (zcu102) PMU?

Best regards,
Edgar



> 
> 
> 
> Alistair Francis (8):
>   xlnx-zynqmp-pmu: Initial commit of the ZynqMP PMU
>   xlnx-zynqmp-pmu: Add the CPU and memory
>   aarch64-softmmu.mak: Use an ARM specific config
>   xlnx-pmu-iomod-intc: Add the PMU Interrupt controller
>   xlnx-zynqmp-pmu: Connect the PMU interrupt controller
>   xlnx-zynqmp-ipi: Initial version of the Xilinx IPI device
>   xlnx-zynqmp-pmu: Connect the IPI device to the PMU
>   xlnx-zynqmp: Connect the IPI device to the ZynqMP SoC
> 
>  default-configs/aarch64-softmmu.mak    |   1 +
>  default-configs/microblaze-softmmu.mak |   1 +
>  hw/arm/Makefile.objs                   |   2 +-
>  hw/arm/xlnx-zynqmp.c                   |  14 +
>  hw/display/Makefile.objs               |   2 +-
>  hw/dma/Makefile.objs                   |   2 +-
>  hw/intc/Makefile.objs                  |   2 +
>  hw/intc/xlnx-pmu-iomod-intc.c          | 554 +++++++++++++++++++++++++++++++++
>  hw/intc/xlnx-zynqmp-ipi.c              | 377 ++++++++++++++++++++++
>  hw/microblaze/Makefile.objs            |   1 +
>  hw/microblaze/xlnx-zynqmp-pmu.c        | 200 ++++++++++++
>  include/hw/arm/xlnx-zynqmp.h           |   2 +
>  include/hw/intc/xlnx-pmu-iomod-intc.h  |  58 ++++
>  include/hw/intc/xlnx-zynqmp-ipi.h      |  57 ++++
>  14 files changed, 1270 insertions(+), 3 deletions(-)
>  create mode 100644 hw/intc/xlnx-pmu-iomod-intc.c
>  create mode 100644 hw/intc/xlnx-zynqmp-ipi.c
>  create mode 100644 hw/microblaze/xlnx-zynqmp-pmu.c
>  create mode 100644 include/hw/intc/xlnx-pmu-iomod-intc.h
>  create mode 100644 include/hw/intc/xlnx-zynqmp-ipi.h
> 
> -- 
> 2.11.0
> 
