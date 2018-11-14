Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp5540222wrw;
        Wed, 14 Nov 2018 02:28:02 -0800 (PST)
X-Google-Smtp-Source: AJdET5fbOUHgv2mEhSCDyxlbz4M6sa56TP5i4jfd10QaTejo2tF9jDVDftHHQxMXu59qWS/D1V1r
X-Received: by 2002:a37:dd43:: with SMTP id n64mr1131413qki.7.1542191282123;
        Wed, 14 Nov 2018 02:28:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542191282; cv=none;
        d=google.com; s=arc-20160816;
        b=rysgutkGjPLdjJUpjKo727ZGM+CHAT9ShlzjaQhkz4zdZPeq6zN7nY9uL97h4y787z
         AKm6OFUzYvtF1NZ7i4Nbdtlvl5YXauYSm1KgqQbY0rAF6S2+jiKs3CJGwuygVibR8xtm
         IFBw+rpLSqfoF4DysZJXZB3bW8jZFCO7BW5R+vqiI5CBoQrUbdxiR+hmTjVjrsL4q2Jp
         wrLSJbJgSzfK1GenTFRrFWc0ti+6UCWet3xGqNgr/PK2ZcBBA55FDYGOdUwyTUuxRPAi
         Rm8s+jIvKbnKcGMnt0/TRKKh++3Z5l92tAxDn5CpeBk8wCO/Qw9Sq7vOuT7nlAkguVYl
         EkdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature;
        bh=intIenTiQ8r04GuoGiVwAik73LF2whu/w8ltv4h01q4=;
        b=L2fgmtWzqle40ESkzSDBH3to5++xU/QFiZyXrJD8KUdHo+TvRt62XAJ1zgulEYP53E
         fcc9VQOj0Q3zyE54VvJHoRd1SiyVZ0Jy74iT0WLrLJdARzkNbCBwBV3w1Pz5CztLf2E2
         ijxu+A8hyT0lHS57ImtXhrTk7zOlM91QbqPRbRcsJQ5qRovHLIdVZcWO7sijEz0ktLY0
         L8zpXwigE7j0z0z9gk0FMSKuVJcjs+BZyfgBWnpn+9H7C7gwT8o8yew8DPiuCKKn5r+O
         R6uXjh/DlHle59Jj2TPvJ1yyCJb8w4kmeMKYaFc1kZ/+hxGodgdwugRYHaxRbvvO7gq+
         zirg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=vnW1ntqw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k4si10281915qtm.244.2018.11.14.02.28.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Nov 2018 02:28:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=vnW1ntqw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59361 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMsOv-0001vV-Bv
	for alex.bennee@linaro.org; Wed, 14 Nov 2018 05:28:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55432)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gMsOl-0001u8-VU
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 05:27:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1gMsOg-0004J9-UJ
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 05:27:51 -0500
Received: from mail-eopbgr740078.outbound.protection.outlook.com
	([40.107.74.78]:11936
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1gMsOg-0004Ib-Ky; Wed, 14 Nov 2018 05:27:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=intIenTiQ8r04GuoGiVwAik73LF2whu/w8ltv4h01q4=;
	b=vnW1ntqwXIya7sYqoiLI/J6FpQicFnDO2i05Jk37H01nuGg1DNCmFrSqKlh30+XlcgvvYbZstPMeObCDFGyTO4SDiA1A6rO78A7dt3dmTwb+1qIr0oShYtrowHiboOSBcyZMcpimh36oqYEwryWnwMPhwiPy0oA8EuFZwtPyvuM=
Received: from BYAPR02CA0006.namprd02.prod.outlook.com (2603:10b6:a02:ee::19)
	by SN6PR02MB4461.namprd02.prod.outlook.com (2603:10b6:805:a8::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1294.45;
	Wed, 14 Nov 2018 10:27:42 +0000
Received: from SN1NAM02FT020.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::201) by BYAPR02CA0006.outlook.office365.com
	(2603:10b6:a02:ee::19) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1339.20 via
	Frontend Transport; Wed, 14 Nov 2018 10:27:42 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT020.mail.protection.outlook.com (10.152.72.139) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1339.15
	via Frontend Transport; Wed, 14 Nov 2018 10:27:41 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gMsOb-0002HX-64; Wed, 14 Nov 2018 02:27:41 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gMsOV-00078I-Vt; Wed, 14 Nov 2018 02:27:36 -0800
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wAEARPXB032642; Wed, 14 Nov 2018 02:27:25 -0800
Received: from [10.23.116.79] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1gMsOK-00076r-P5; Wed, 14 Nov 2018 02:27:25 -0800
Date: Wed, 14 Nov 2018 11:27:23 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Luc Michel <luc.michel@greensocs.com>
Message-ID: <20181114102723.GC7447@toto>
References: <20181110081147.4027-1-luc.michel@greensocs.com>
	<20181110081147.4027-4-luc.michel@greensocs.com>
	<20181113110636.GH1148@toto>
	<a67ef945-2466-155c-0f16-0a1b3b74c9fc@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a67ef945-2466-155c-0f16-0a1b3b74c9fc@greensocs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(39860400002)(376002)(346002)(136003)(396003)(2980300002)(438002)(54094003)(189003)(199004)(52314003)(47776003)(76176011)(63266004)(9786002)(36386004)(53546011)(33656002)(97756001)(6916009)(33716001)(478600001)(186003)(23726003)(46406003)(26005)(1076002)(77096007)(54906003)(50466002)(356004)(58126008)(316002)(106002)(93886005)(106466001)(81156014)(8676002)(81166006)(5660300001)(16586007)(8936002)(305945005)(2906002)(426003)(336012)(486006)(126002)(4326008)(476003)(229853002)(6246003)(446003)(11346002)(39060400002)(14444005)(9686003)(18370500001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB4461; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT020;
	1:j449ZvlWVNAR5MAkZPQXLE9zl2ogY8suMOTp29WJExFmodm8xexiQv8mWgu6HA6XYX5IDUeMjbLMHtHqu0nQX++qT8JQ2E2mnHBDBj1w6azUYexLenzJJwZrhtR658AV
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 911ee656-f934-4c85-e045-08d64a1bcf29
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:SN6PR02MB4461; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4461;
	3:uwY3DFvjEYPMlqC8QKN68FHLiflQbKanjgM0SRzIK1hb8cfz3h6YtTvxHo5zsVeUfx5ccHR4H5HvQG40AIYBjQ9Lu1GmwExxmUlFil35THRg4Aa2/OtMtmwGFvkCyTXiibGERpH7JSYtluMRogZbtLM1uMDfTQvnWh1zs/R06W27y5adRiXpAMvr/Qgbop+puz8l/3fkIne5KJjdWu9uQ3PLSfh/2CidutSiUsn/Mk3w/ttU2HMw/z5+XDPx/BGgUgzcpf+ZGvRRNLcPEc7h7NZ07IvJdzJGspf6wyzZ2Z5uNScRLh9JJ7m5Muxab3rj5jf4exFO+TZCcfrCjreKH6Lsw6t8ENFEikuhXNOzbHI=;
	25:UKxIPQt7kcuRNG7aV1YtUbvl5Gr6sFWIzPNiOCcvgo+USgRA0pxi0nOrIaCMYIFIhh37f0nteTF/G+pV9IlbwugVc5Orqwlnw4dWar8WiXFlk36hlqYBu14NhuM+IV02O8xbjVqRYj+4nOwR9U2tFHFesZT/idvvyEJrIUur4mLjmueFyKUALZvBQDfBQO0VRiL/zdhKPGB9Vkx/8I8Q88izk1L9fcWp+9eB6bKxd6F68A6MYLyS6sV2QfkrF6DqJ1beryG46fzWXGg3RouN2Gpl0LY0LimP997xNNoYY8iefByR1N8DvXeya8P7OoSpfT2Ma1wz8tYgvgkfmRKaJw==
X-MS-TrafficTypeDiagnostic: SN6PR02MB4461:
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4461;
	31:2Ps9guhEjvLgS71ePwNGjy8HhJQyIt8QthQGmIIek7P2G0ThA2jXPV86Skvpzp2EppW7aZzYy46q1E157UNVFB1OhED0rTipV7kJiTVTNeGDI3gsLAdiMl3tgl4tL9gFBM1lnr+GOmzpl/N+ncxkVgSYtcZEd0eAIIaqxyFrHuIpjJ3NlRK3xP+kZj+U9vunH/Ps7FqTUb3zlKjcvxmJpGCbOn86LvpkfzGW+0uQo7M=;
	20:hymfrii4wDGNBf/giYuWIP9xZVE8vYIVKurwf+PzdMpkH+WvsFQQXhAhHay3sS1DJQfJ4vtxTq47yD1aY+2+JxsQ2a8TfMIrFALCSsEgmPw5f1Je9wcLnMFwq0cuudEOQ/I0Z7WMIFDi4bcClrxN7YBy2G3rmIoCdHcV23dVREF3XCUOoJCnVgxXoAwETZXAHazQEygvlLTFNrC3uiiW62yb6trUuKKzijGO1hlJt7J1elsMs8S8/fWU4M7bFdDgOp/24BO5jk+0mY46YJe8LIO751BciJNRUeE7qsWf6V7T1rOxywQww5dNQeMITJI99hRuXh9hZLLsMs7I2Saxr9uNL3Bj4a3C2d+YaSC+IVj7lLluyLToTeqhEUIdZW8NRfWIqF5e1dvTZ/z/XJeGf8k6CLR/ow5J4vUf7LapPyRAQ9s1HJXk7/5A2ak97OVSQ/NOMXkgzYv3mkCxQ64Ml83YxRzqN9QNIVqIHnTO5egZpptfpK8UiNysQc+oJtJp
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN6PR02MB446175B9F024DF606AF0683FABC30@SN6PR02MB4461.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(21532816269658);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93004095)(10201501046)(3231382)(944501410)(52105112)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:SN6PR02MB4461; BCL:0; PCL:0; RULEID:; SRVR:SN6PR02MB4461; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4461;
	4:w7scxg5yu2kkcVu/zE+8yRr0mzNiD3Ippl1/DklzTKev/5pQOhXlNLzz+NxCc0KC+xdesXHPu8/vlzWKEKou3UoyMuoJQsSXejDjKYCwQ5hzBbuILOqtk7kf+xU1XpUl8rupeI6CgfqIMyZcFwNuT2R1JmI/7VawZEEHKTtXYcS8s9fXU+9eUHaAg3i0S04BGDaPw5M+uecTclA9Rjo6hEGafHrfZKsYxcMBKfRiWUr31SUp48l3ZRqLuBSJlOHPaN9xMWCTfWTI7UJibGqeK78XKgd5dZLg09/1W06lF9aeKMOp4Jo0KoXmCJX8Ewriac4C5iB0TSWQWydjMdC0vB/+nKg7DLDjehqOl2PSNDQ=
X-Forefront-PRVS: 085634EFF4
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN6PR02MB4461;
	23:VLddbfv/hhhEhmUplsV4FcPW0XB2Q8w9PGVl9RWir?=
	=?us-ascii?Q?hHa7kM5hmAzwSyGKS/E+rosSkTJXS1mVqJ77nJ/8uPOUBD+rNI+9Up13xtCA?=
	=?us-ascii?Q?31Yxf/Ih7Ftmyjgrnl0tLy5lHaRHsBu2Q92dwhV6dRp3ckhZUOq7KGICNDFM?=
	=?us-ascii?Q?lK+7KrkXIIVdF05rvV/Cdtpkp3BGrtLnUc9gd7cuYBenwzYb4M27C/YPycaf?=
	=?us-ascii?Q?cYyQRzb6IsulzbKGG2cEZ8F1McRrDGY6AgitPjsx14WnMq4LeY6pdzqFr7I7?=
	=?us-ascii?Q?ND89X3nkWdsmBlrpYCkN8Uq1nwWt5BKk2xL4gBjU9vY4/qkC+h6Nu0bYzztD?=
	=?us-ascii?Q?ZZCVbe0FZzJafOvXSDGsyTAUA1QLefAai6mBHgzTMKm4qsnzJGi3AKhNPTWh?=
	=?us-ascii?Q?lqIJRDTcHCRGrCaecsQK6HpEM8Q3z4QCeIwO6CYGDvHdb5Ako8Y+gZkFLtAL?=
	=?us-ascii?Q?E4DJOhsgY6kySmJ5a2K0xZ5yzeqnfeiu5/LIr7alakUeZautjkNWWQC/NCL8?=
	=?us-ascii?Q?+tCxx2evZlH1OJGck1pgVWVWA/j8HgrbZH3zkqDkgO4KNWH4VKESWsPN4wRZ?=
	=?us-ascii?Q?NEa2Y0QeCcNL2AUgbqH1J0XQhvYGzVvWcTGZ9K4vVZ1GgkJ8IKcQtrusRMeh?=
	=?us-ascii?Q?NBdtM/AhP3P/5rS55VW9+TkwXdR60DLSbYFqsdsdu8IfJOSoHzix00N6OcCE?=
	=?us-ascii?Q?DjvoC0Jg8okgGkAyHqggItaCaqRgXnwgBgEqxJSP9Kmhk2q2yFQfgRfa2M9U?=
	=?us-ascii?Q?CuCOPX8SzWbg71PfRqnKwfFAx4NDq2WV2lgXVQed8i47o2AqzPrrKsn8Tnl8?=
	=?us-ascii?Q?u1gAgoYT3UUALtXoZBDySFCSbMgFuSf9LJSFfmYEJbOYyAiU5rmVafC3YuGa?=
	=?us-ascii?Q?fPQmguQaJjBNdJujzUczMKMwWf/Va/My6Whpb73ELSg7yOEYB6r6UMyQ+li7?=
	=?us-ascii?Q?E6Vu1eqdiwBpJ9GE3Tjb8hlegLgrW5AanvCU57ArYsg9Db/AwZlAOWVyyOnw?=
	=?us-ascii?Q?b3TfBgYdZStIicFYIo7LKxoVzzqI6KJLggBCa7T50p6Iubf3zPjxIcGmlBbc?=
	=?us-ascii?Q?zNm4W1Fr996ow9DOCmbhbtfZwNGcemJDsw5GiNM3smDEiVYgG5YC2RYl5sAR?=
	=?us-ascii?Q?wp0mtLrJWoBGEWIyZkp2Sb4aj5GAuZHyoxMgIy9ssafJiiK4qFQG+uce57hh?=
	=?us-ascii?Q?5PvIzytofMBs9Y+LKoqUN5ULpg3IC4/FK2BJTzfqcgmu/PC829Hz5JYj3rK0?=
	=?us-ascii?Q?8eoDhU43iAaSiD7cuTt5ui60tfwb4V2f7fNVp+qCaMYN2QzN6Pe/ldY2jn7J?=
	=?us-ascii?Q?nYBJQgmGW8N5bzL9DJY6Kg=3D?=
X-Microsoft-Antispam-Message-Info: E7fQWYjHrq66oswTMBc14mSKl4ZiPYIs9147/M2DH+Jouak+/BOWuso46qiZULKfvK0YxEU+xJ/uaH86jliMlpJnXr/sNliYTamhFtPAziQPvxOw+eDk7+oQVlrk1IKhz2AoTT5BKDzY3+1I33iOgRLUsfsJsHwxYZQijVse7RghcXjVwiGP67vzgqFYoOdlmgrAe4ZiZE3GRa2o06dL4xjKQVfWwmYOH9iq5w0d0OgHDjtXe5EgbxhgXOPn0bMKliDLc8v/nqGZkaLp34YqIyP2DQIj/wu2Ac1nWsNHcdXTBkSob3WIwNhRTZxRuS5keItRiEcK7U1krqHn2z2MMwVUCTzG6eLkYghK2A7TJCQ=
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4461;
	6:Tzg3Q/Yrh2/fz+6rHXtOI3V9ckNiJb54ujrkQRCLTNCCnX7idklObzeyHH0Jrj0M6BV0JI0rqof4mHPts12ncEAxp5V8QS3BuqUR2SXm56/MLTTkBNbIPbgM0w+T5FBWt8lYESKAHOfOn6gjrASCCMmWhN1ojhkHCgA9FqBk/6aYK9QFOL8iKeQL1YKZyh8uZQ+R1AE3hH1WqpvWaG0q6mg+jrcGtkvd99/GbLUi+l1AHoAjuJYaTSksqdvwlkNLHLN1P5uBCdiQ5pL2+T0KHyVxTCNCoLz3pX7JQiaE7Y/QwS3YUDw+uABMytcreU82YGHO0h00hjbIuWTedVrLpDtOSWbZ0c4ivyoyF+DLn+OJVxTPRq+42Y2zHO5apBhi6kbp283EBptA5TXdS1jMO3/v6sD9QMsOcRoxHlbAzPajcACd217fCRM8HrcmfY3usQd8hecjwsjS/57MKS6WwQ==;
	5:A4NddmbRolGYBj5YbNVyAIkom0Xc2Xc8TI0nKpYsi7Qw8+ZntrHDe86mrZm0HtD2wYpDf4l+SYW0G1rsJADWc8x3xyagPbQtk/+U2GRnEUyMLcj8P7Xd9GJCm2RpnUz/a4s/wLHMCggYDBF922d4MqpTxOOcp8hkWGo3BZvQpwg=;
	7:lRaqVknK03B9UZTRqtaWEcLeHOQ1NX+lI83xPsY+gRAqOnlv0D3mU/YuRFEFRcsIWynI62mcnc0K5A9Es4wsKKmkW/Q5/V77O5dUV0M5dL3Nylk0kP88D6Af8zLzHJkFdR96Daxdcoq9a5WlTJdOUw==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2018 10:27:41.5798 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 911ee656-f934-4c85-e045-08d64a1bcf29
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4461
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.74.78
Subject: Re: [Qemu-arm] [PATCH v5 03/16] gdbstub: add multiprocess support
 to '?' packets
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com, qemu-devel@nongnu.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KEjZHgFVAiab

On Wed, Nov 14, 2018 at 09:43:27AM +0100, Luc Michel wrote:
> Hi Edgar,
> 
> On 11/13/18 12:06 PM, Edgar E. Iglesias wrote:
> > On Sat, Nov 10, 2018 at 09:11:34AM +0100, Luc Michel wrote:
> >> The gdb_get_cpu_pid() function does the PID lookup for the given CPU. It
> >> checks if the CPU is a direct child of a CPU cluster. If it is, the
> >> returned PID is the cluster ID plus one (cluster IDs start at 0, GDB
> >> PIDs at 1). When the CPU is not a child of such a container, the PID of
> >> the first process is returned.
> >>
> >> The gdb_fmt_thread_id() function generates the string to be used to identify
> >> a given thread, in a response packet for the peer. This function
> >> supports generating thread IDs when multiprocess mode is enabled (in the
> >> form `p<pid>.<tid>').
> >>
> >> Use them in the reply to a '?' request.
> >>
> >> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> >> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > 
> > 
> > This is also theoretical but:
> > When looking at this, it seems like you could have lazily created
> > the s->processes array entries (if you find a cluster but the
> > no valid entry in s->processes). Then we could perhaps eliminate the
> > scan of all objects at startup and also support CPU/Cluster hotplug.
> Yes you are right, this could be an improvement to this series to add
> cluster hotplug support (CPU hotplug is actually supported). It's a
> little bit tricky though since we would have to maintain the
> s->processes array and properly signal to GDB when a process dies.

Hi Luc,

IMO, support for hotplugging could be added incrementally with follow-up work.
I wonder if the GDB stub would handle it today, without your patches?

Cheers,
Edgar


> 
> Cheers,
> Luc
> 
> > 
> > Anyway, this looks good to me!
> > Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > 
> > Cheers,
> > Edgar
> > 
> > 
> >> ---
> >>  gdbstub.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++++--
> >>  1 file changed, 58 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/gdbstub.c b/gdbstub.c
> >> index 0d70b89598..d26bad4b67 100644
> >> --- a/gdbstub.c
> >> +++ b/gdbstub.c
> >> @@ -638,10 +638,52 @@ static int memtox(char *buf, const char *mem, int len)
> >>          }
> >>      }
> >>      return p - buf;
> >>  }
> >>  
> >> +static uint32_t gdb_get_cpu_pid(const GDBState *s, CPUState *cpu)
> >> +{
> >> +#ifndef CONFIG_USER_ONLY
> >> +    gchar *path, *name;
> >> +    Object *obj;
> >> +    CPUClusterState *cluster;
> >> +    uint32_t ret;
> >> +
> >> +    path = object_get_canonical_path(OBJECT(cpu));
> >> +    name = object_get_canonical_path_component(OBJECT(cpu));
> >> +
> >> +    if (path == NULL) {
> >> +        ret = s->processes[0].pid;
> >> +        goto out;
> >> +    }
> >> +
> >> +    /*
> >> +     * Retrieve the CPU parent path by removing the last '/' and the CPU name
> >> +     * from the CPU canonical path. */
> >> +    path[strlen(path) - strlen(name) - 1] = '\0';
> >> +
> >> +    obj = object_resolve_path_type(path, TYPE_CPU_CLUSTER, NULL);
> >> +
> >> +    if (obj == NULL) {
> >> +        ret = s->processes[0].pid;
> >> +        goto out;
> >> +    }
> >> +
> >> +    cluster = CPU_CLUSTER(obj);
> >> +    ret = cluster->cluster_id + 1;
> >> +
> >> +out:
> >> +    g_free(name);
> >> +    g_free(path);
> >> +
> >> +    return ret;
> >> +
> >> +#else
> >> +    return s->processes[0].pid;
> >> +#endif
> >> +}
> >> +
> >>  static const char *get_feature_xml(const char *p, const char **newp,
> >>                                     CPUClass *cc)
> >>  {
> >>      size_t len;
> >>      int i;
> >> @@ -907,10 +949,23 @@ static CPUState *find_cpu(uint32_t thread_id)
> >>      }
> >>  
> >>      return NULL;
> >>  }
> >>  
> >> +static char *gdb_fmt_thread_id(const GDBState *s, CPUState *cpu,
> >> +                           char *buf, size_t buf_size)
> >> +{
> >> +    if (s->multiprocess) {
> >> +        snprintf(buf, buf_size, "p%02x.%02x",
> >> +                 gdb_get_cpu_pid(s, cpu), cpu_gdb_index(cpu));
> >> +    } else {
> >> +        snprintf(buf, buf_size, "%02x", cpu_gdb_index(cpu));
> >> +    }
> >> +
> >> +    return buf;
> >> +}
> >> +
> >>  static int is_query_packet(const char *p, const char *query, char separator)
> >>  {
> >>      unsigned int query_len = strlen(query);
> >>  
> >>      return strncmp(p, query, query_len) == 0 &&
> >> @@ -1018,22 +1073,23 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
> >>      const char *p;
> >>      uint32_t thread;
> >>      int ch, reg_size, type, res;
> >>      uint8_t mem_buf[MAX_PACKET_LENGTH];
> >>      char buf[sizeof(mem_buf) + 1 /* trailing NUL */];
> >> +    char thread_id[16];
> >>      uint8_t *registers;
> >>      target_ulong addr, len;
> >>  
> >>      trace_gdbstub_io_command(line_buf);
> >>  
> >>      p = line_buf;
> >>      ch = *p++;
> >>      switch(ch) {
> >>      case '?':
> >>          /* TODO: Make this return the correct value for user-mode.  */
> >> -        snprintf(buf, sizeof(buf), "T%02xthread:%02x;", GDB_SIGNAL_TRAP,
> >> -                 cpu_gdb_index(s->c_cpu));
> >> +        snprintf(buf, sizeof(buf), "T%02xthread:%s;", GDB_SIGNAL_TRAP,
> >> +                 gdb_fmt_thread_id(s, s->c_cpu, thread_id, sizeof(thread_id)));
> >>          put_packet(s, buf);
> >>          /* Remove all the breakpoints when this query is issued,
> >>           * because gdb is doing and initial connect and the state
> >>           * should be cleaned up.
> >>           */
> >> -- 
> >> 2.19.1
> >>
> >>
