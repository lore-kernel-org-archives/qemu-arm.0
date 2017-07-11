Received: by 10.25.44.15 with SMTP id s15csp4601891lfs;
        Tue, 11 Jul 2017 03:03:43 -0700 (PDT)
X-Received: by 10.107.178.208 with SMTP id b199mr6796278iof.43.1499767423572;
        Tue, 11 Jul 2017 03:03:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499767423; cv=none;
        d=google.com; s=arc-20160816;
        b=tzRc18YSKrZSl2H7p3LLl0VEspq89ZdKorPNRukH46hm0GURhheXm4ciceXB34FAa5
         S3zuzVR7lrL7JrNzSFJVlbw+4LtCaUhP6YA8ox+B72KLuoIPoEcqgpieNqwFHCrYLNmo
         QKnW7ASm4JRCSBP1fz5lkUOmR1dV7evbogyZXp6TtvVoPo+WtPlX+4YdKrUUGtQgAwXF
         LaLTKRSEMxphyxQEG3F+cfIwxbJR04cn/xl0QvCMTPdyg439UJZpEX0OgFZyysEregF8
         c+PegugrbyqSXeHP8gwcAtVm1NDBoA9c+e8G3f4SoyXmAHHceQrL7ahFDe/Ab8XgeON6
         eKjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=spamdiagnosticmetadata:spamdiagnosticoutput:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature:arc-authentication-results;
        bh=dBP+EWpCCEllyVnFROhwJFuuooNiwgHPY3lAH9eQcws=;
        b=eHNaaEzx/TY/EuY2pFK+Im+o/BUB5thqTsehdTic663EaElVy7fafBE2jEY6WgO1/n
         YqgWLEHjNWkrsc0lQMgXLTOKkqL41CT1mlqo2+j7jULae2VklprBBpWbcBig7OepPX70
         oYHqTBDwlBYnmptw1WHIBw6dMr1+W+ErmpGp+75n0U6FPjzJR+ZmIfEWRHAIKayDhcTM
         oxsTwrNHcybjTnLztZYx9YxB2YH7B2GJ3fMSKxufVTM/huP0+H1BP3fthVtqY0c51Nws
         TSgNxtWKnGAE05NxJt5qGAskTaDtObc+4qUWSG2HHiKuux9M+/RHsd6g2RQZK2ya+7gR
         4ERw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.b=uQBrNLGS;
       spf=pass (google.com: domain of edgari@xilinx.com designates 104.47.41.65 as permitted sender) smtp.mailfrom=edgari@xilinx.com
Return-Path: <edgari@xilinx.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (mail-dm3nam03on0065.outbound.protection.outlook.com. [104.47.41.65])
        by mx.google.com with ESMTPS id 73si12766490iom.45.2017.07.11.03.03.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 03:03:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgari@xilinx.com designates 104.47.41.65 as permitted sender) client-ip=104.47.41.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.b=uQBrNLGS;
       spf=pass (google.com: domain of edgari@xilinx.com designates 104.47.41.65 as permitted sender) smtp.mailfrom=edgari@xilinx.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=dBP+EWpCCEllyVnFROhwJFuuooNiwgHPY3lAH9eQcws=;
 b=uQBrNLGSwlwSCtqpObAY0OoAgN+BwQN0XnOAWj19y84fTeS3LQ8flfIA/DJvfXnjjaIxe0XXIOt2/u2FdWTQEmHgB3DkBWpgzNqtRMzaHyMZmyN1DgS28ohqzegbtRm0VI7dcwtmDFIeeXXv9TCb58+iOqImdBGFoABMYVjgwWQ=
Received: from CY1PR0201CA0014.namprd02.prod.outlook.com (10.163.30.152) by
 CY4PR02MB2727.namprd02.prod.outlook.com (10.175.59.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1240.13; Tue, 11 Jul 2017 10:03:42 +0000
Received: from CY1NAM02FT050.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::205) by CY1PR0201CA0014.outlook.office365.com
 (2a01:111:e400:58b9::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1240.13 via
 Frontend Transport; Tue, 11 Jul 2017 10:03:41 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT050.mail.protection.outlook.com (10.152.75.65) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1220.9
 via Frontend Transport; Tue, 11 Jul 2017 10:03:41 +0000
Return-Path: edgar.iglesias@xilinx.com
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1dUs16-0003SB-O4; Tue, 11 Jul 2017 03:03:40 -0700
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1dUs16-0008DA-Kd; Tue, 11 Jul 2017 03:03:40 -0700
Received: from [172.19.118.242] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1dUs15-0008Bx-IB; Tue, 11 Jul 2017 03:03:40 -0700
Date: Tue, 11 Jul 2017 12:03:34 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, QEMU Developers
	<qemu-devel@nongnu.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH v1 2/2] target-arm: Extend PAR format determination
Message-ID: <20170711100334.GA25504@toto>
References: <1498830302-19274-1-git-send-email-edgar.iglesias@gmail.com>
 <1498830302-19274-3-git-send-email-edgar.iglesias@gmail.com>
 <CAFEAcA-dssYnbZjuWTjBta1aK3iL3pyRKh5Qs4hFh=bPONgnTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA-dssYnbZjuWTjBta1aK3iL3pyRKh5Qs4hFh=bPONgnTA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23188.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report:
	CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(6009001)(39450400003)(39850400002)(39860400002)(39400400002)(39410400002)(39840400002)(2980300002)(438002)(199003)(189002)(24454002)(9170700003)(2906002)(53546010)(54906002)(305945005)(33656002)(2950100002)(23726003)(9786002)(6666003)(97756001)(50466002)(478600001)(1076002)(6916009)(83506001)(4001350100001)(8936002)(46406003)(626005)(8676002)(63266004)(229853002)(189998001)(110136004)(106466001)(50986999)(76176999)(47776003)(81166006)(54356999)(38730400002)(9686003)(33716001)(6246003)(77096006)(356003)(5660300001)(4326008)(76506005)(39060400002)(57986006)(18370500001)(107986001);DIR:OUT;SFP:1101;SCL:1;SRVR:CY4PR02MB2727;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;MLV:ovrnspm;PTR:unknown-60-83.xilinx.com;A:1;MX:1;LANG:en;
X-Microsoft-Exchange-Diagnostics: 1;CY1NAM02FT050;1:I8Mw6QDOO4O25IMr7DpYy3JFXmMH2vhKzT3TrFOHXfmktNFzsJc37urksY2RYuLeg6FtXafUOYoWZ0a42R59IMCDC3YJt5d3cbip6JQDJW+BDjtt5uwJ9eAIbagFs9vDKWavHIz/TtmdWQ2SaUrSpPDVUhp+E6G3RdwhHRnFKEmMQasAaNdvZOfZOJKFv3DOS4jyuLDiwCkkV3mjDBzTad5izhpE+wh5YcpdUdewN0eux/kDurUTXbBxiMXPb6JUI9hCJS2YWazreRYBUwGmRP1Z8VmPK+VPTw/ucUFSM9VdJ+W3oumSy8luWQmiqAkPQFU0Bey24B65Hg5FvuY9VsReQ2gfV/L/zbJVW5X5XmsFLz+NNMhO/7QnEybHQo49TnJpwdA+WfIKobh+BhI+pbeWtthHJBJI3fUNuQpvkhgB907jY2NSKYn0Eum5sTW7VnniTuqxseflyc1YD7Q+S+xPPHQkB751hYZvg7+wGamrHPohMf/kgC3hhAcCpsWjzZx8aD3hNIP9w3XnnWJmzsQoJ4+8ZW79DlX3yqgyS/K2B7t6o2NxPuqW0sS8Af3z5poyz+PSzDZbB7xeGqxurV+FQiYUGDPLOgHOn0K62RpeWr+eFY5NPqgyH820W4hQvpmpjdQdTOId8KKE5NU4hFsGS0dATcM0HD1okYxkONbKUoSz45YCGJzPBGBOoP6yTsxZO0r03e276AlRtYZlYpAF43OINdKYvqqQ8YoH5/f8jKc+3BkPjLcd3OfWYUovP+8g8TYHNmPan/GXBh2YhQM/mTbJottwkq/WsuC/Qs2e1KPDlVYD5CJzZxMF73DNAKHnZJZSIx/jKLJNwW6LKPVTBUQEAgAgDHqB6yYgCOA=
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 843244a3-0f04-484b-641b-08d4c8441bf3
X-Microsoft-Antispam:
	UriScan:;BCL:0;PCL:0;RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(8251501002)(2017030254075)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);SRVR:CY4PR02MB2727;
X-Microsoft-Exchange-Diagnostics:
	=?us-ascii?Q?1;CY4PR02MB2727;3:mTlxWtdQWQmIhZdU0lWmlwjnOrM5Ms9g58/dxiW1b2?=
 =?us-ascii?Q?0FS2Nyx+CXVEiQa6qxBdDA3Xi2w5HO6jaST/1IabNhixeagKZUJs3kQrhx2Z?=
 =?us-ascii?Q?DMcQBydZ7gCTQY+sVl1sV+8pPVagI7Q64LKvdiLXGsmQS2vzwRQXhX6XaS/O?=
 =?us-ascii?Q?FF5KCGezOVUrudzC1UjCWai+Y695Ti0GAp8z0hVQUXXEfKGARaRlQy4T5tWP?=
 =?us-ascii?Q?WhdIQbjY8Nl8uaRYjIRH08LGBjbLwzAIFgZFwKmZyQgiYTtdx3hMEn3tUkpr?=
 =?us-ascii?Q?QxcvmtcBAESAJggZa1UJzwbB4A1v9DePyezxIRrI0I46A5B/4g/6PJQz4me7?=
 =?us-ascii?Q?Rvn+DzM09kpVW9WsqENelxWoLpzmCzIDEXKz2of2zO9myLlgWsJcm3/8KT91?=
 =?us-ascii?Q?QaOlpGmict/I6ucA12Y6VqeYAvZmVphjLMnM7fpF20uFCW4E0/mmJa/0fUiz?=
 =?us-ascii?Q?toIeBxdPIjiN52z81lTOwDNQgVvH0t4VaDoPbPnMURB7Ruxy+XVVfklyPW8T?=
 =?us-ascii?Q?sZdMeiOu7jijgKc+9bHO5RZtw4Ss9Zh6RC+NyaTJGQFU283ptUin0yI6Yo7F?=
 =?us-ascii?Q?E49V6fv4mJrJatRSv6O7ArC9JmmabcN4No8N0qUvg9iSzpcul8bKw5qHc99l?=
 =?us-ascii?Q?chXWx6gaEU3n9CAW0wOb+HZ01echW5qLigIRVUJMZXCHvCCHpcukRtwgWe5z?=
 =?us-ascii?Q?FF5NXvqCcL3jbUFYKYv77WC6KbLgYFvujVzM/D6yXMeyenKlE71dX983B4GP?=
 =?us-ascii?Q?n2jwErisQUardPNVthvP2cC+TKp9mCIbxf+y0Oti9/Yo5VHr3yEHXS8Z2Uvw?=
 =?us-ascii?Q?ZdKl8YreWHfnD7rIsGR/3BFD0fzShXdsVJPm+u8M2sDWsaVrjioaWYkEPq9I?=
 =?us-ascii?Q?+hxNHvkNC1MQgIIYiS5NdKnWpJTBunLbKNcNTUIOxxNBuSYi8qckA8oZ/alM?=
 =?us-ascii?Q?7yy3eAKkNbGNn2Nz9nwehGPEg05InjOnLN31rvZA=3D=3D?=
X-MS-TrafficTypeDiagnostic: CY4PR02MB2727:
X-Microsoft-Exchange-Diagnostics:
	1;CY4PR02MB2727;25:TRwhYal64PbMz3SsLMicyuhyuoPTdVbahnf3vaKZWTr+RrfD0QoeAdLpq0WUoqn2S1o/GcsXlWnLIHIuqHwlqpjbXnTTFd8zb3mHFQ9etgJ8CQB5LmNgPF9tvpzNzg3K4o96qinl1ogOZS8FU2TtYWczAdArA+zwa4bc4DcpSKtzjfUOmJYYV5w3Mt3QOfLP44p5Sj8DK5pR9//75O4PqYQkaji1L/BnR22w9P7nBguCiOSqtCw51hIIGkDW6rqJAmiJedrg/5Wy/D8wz56yJ3MjqW/om8C2zT5oBTs7CwnDV7NjzLRppf9bJYUKWkGyvAhUq7RpM2cD0Hb+HxDjxy0YTfx3xcSQniC/Suqf2PfElmqkE5D6zKz/QpKWBs39RxqmvDUbrhxnP4fRruSXSt90LgphJtq5SYE5Y4DtB/KV/tfx2opxZoUcDzQbJJg5CojBh5/T27IV4FTDJ1KPDT1II+VZAbZWxJVYD1oa+4mmUX4d1kDyGFnSMc/F5H+y8v6vYq1DYtiV/QnCMtToXSbGlXH9ab/7pOucKDaNmLiE3tDRGHXNs99IN1TGpowUDt/2tkK7yxm9sgrX6nn800VPtuxbMeKvmWG8rrNm0LUNIMIQkL2BQinp2QjRjkLpI6vhKGF3Jwg+niqjQdEylj2RR6Y14awUGewKfIoSyMce5MZmJhktVRQ3Kg4EzsLGQAxdvX6ioRqF9XBviSRk34ovmnCGc0T3MxIn0lRSJGqRyEMlcQ5L8TWSHpzAXc/+Rx33KYXQxgWwrMOVGbFxH7dq1jro7mKnic+HGQ53KPHEs2RqY8PsHUlI+UeOSg+sw3cLzn3hFR9IVypRy9p41lh6XmHJxCUKGSQdINDmF9Nu75MUvyYqYk819jwSmKgGRjpVztnbwVKX55N+8LInUp+b6MgpKOl+3DNXX6uFvLM=
X-Microsoft-Exchange-Diagnostics:
	1;CY4PR02MB2727;31:P5QOKftoFOByuD6yhZM+GivtckUGdAIBcLlqn1efZ7YS0MjPeKWYKG3JWDXT6woAhNgEIVkmRMVHa5zUbEOOAqFsRueLF6zfByalt9wE1hRVZYxliTRbGBDtirhqkrk0ipuVvTqMQpuicTHPetL/Nfn8jPqHUsp6iDD2AczB3lshi8ULHhMwiNdupx2p5I2I1+Th9PE3IPBxb+jtxQnM3SGVv0wfKJSGzBnStHXE53IRoYyJrfGA5FwLb3DhlvCeeNVtfVYPvA8UzcXcE0VLIR4mj5LNj4dryxkxliLo2MnHtHPYsA1waKZK9PmMfOzJk9I7129EjkQLgoP9giIFxF/ukhdu4qcbUuVgFoiw2s5EHQhtnLqFW/wbl1mZ4NmLk8PbQmM4l6AlbaS4zp4SD3L8nay6/LasRQs5YMQpW1d9SU5sNU/AjuAG/KGrhWoYEFnYXShLVrAtzPm1CJKK5pMW2e6qKTZzaqzMiWMMFM/x8NJw8cJf5ZJZYG8f6Ze23Fc6kotpgM+RPNaqDw44wgc077w46joEaLdwTU1TO7qEis08KaaqR6+klg1VxoWgD7xEuriVR5cWNSYBb+MR0VedF7zFT8XGNe7QjS4VJo66pV+pAe7YH1MFKWuMa2YRbZ7RNBMuKuWNDryTCM5T+UlpntPGijWb/yuUp7ITyvg1WJ7Hm/MKmBSqwM+c4Nwz
X-Microsoft-Exchange-Diagnostics:
	1;CY4PR02MB2727;20:hOtcxShhjp5p3jJOE3DKpa43i+iR2Fj9/o0xCDfZafoB/q0ODbqYHimaoffr4J+arnaC6waJTFFkryjj/YjoMm+AQGJywC/0bsWe1nbgukWZa1c+dDI5rSHOMwM3/5Kw2SgiZ3BuJxqKKJEwRywWHqLGufDMlkHzMESPb2IzPtJ8rkmWjqBUjxXjovELvS+Cqu7dtPdbaV95r3LHia8FKT9AifUeoWilMx9CLdFG7+W2p0OZlBuzWrSbcOsJ9prn65I7YPdsFsgcpkCowmNOqZG+9jzSzIuZKZEf0oJUJEbOuEtdFsEQONe6C73bm52P/Z1EFTJJQ/3+8ncqbW+bNcHLeBiWfcjXcB5wI1luflGexClJq5mrBiTie9Y1nVKd71N3iWP8cDQ+5DiRGI3gqhlunnFsHmua6/ijqSWX+CwjeY8P/wjlJJKVOviC3CrGGtNCY/EhWzqk7kOFLJu4Lsd9GJ77rJwmeWrphnJkLUNi89hWBJYjmp7INzWwhWiV
X-Microsoft-Antispam-PRVS:
	<CY4PR02MB2727111F9EF7D9B775A218B5ABAE0@CY4PR02MB2727.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test:
	UriScan:(236129657087228)(48057245064654)(192813158149592)(148574349560750)(17755550239193);
X-Exchange-Antispam-Report-CFA-Test:
	BCL:0;PCL:0;RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(2017060910075)(13018025)(8121501046)(13016025)(5005006)(100000703101)(100105400095)(3002001)(10201501046)(93006095)(93004095)(6055026)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123562025)(20161123560025)(20161123564025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);SRVR:CY4PR02MB2727;BCL:0;PCL:0;RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);SRVR:CY4PR02MB2727;
X-Microsoft-Exchange-Diagnostics:
	=?us-ascii?Q?1;CY4PR02MB2727;4:B6NLGvCVGejAr/6yL2JUSBjV4000agNtOMoufgT2cU?=
 =?us-ascii?Q?7+i5ooBJ02dmIWN4bI8QtGVAGJd0YXazxdDxz5auTxc2fi4HxuuW2q5r9fx+?=
 =?us-ascii?Q?We+Ni/0kgdY34UJFZFJglKWTh4Upup+uwFnURv4+NLS0Ykwzh4xPFmIBZ9Gt?=
 =?us-ascii?Q?Ea0mNRxYHLeTduIPnlscHKj158hL2s7vo8t+eTg4qrbHnzyIAfXxJomkAOx7?=
 =?us-ascii?Q?ma4cf17htvrmPgwpETGF/RATFedOw2Wt7MFRgwfmyvg0viIQFmVZ7w4fQRm+?=
 =?us-ascii?Q?CMOsPex3cOBGJ2j00fSfZOOlnIXC4PLeR/1QfxqI7w9OkjpwQ6QjU4gVLRag?=
 =?us-ascii?Q?2nhf/wXeYsjqv9K74XZmssuxL6SgVP9h19xWwIH/L1Yc5FEdwLWlFkO1INmO?=
 =?us-ascii?Q?pivUrLpvuBh0SmcsKZDtzTEY6dwyWNvIgzvisjb1eie8oaNuTDY9/pdMV+77?=
 =?us-ascii?Q?efVgFPRNkEgvR2lIpHQa1BS7H6BZysecWcDVgNQ8fKlauQj0Y3ZYIXtDjYxw?=
 =?us-ascii?Q?+ile6aNO3JAxKA8XB51O4Nu0B9t6smuj/7KRITos4gFrruvoSjRXYrLI69B/?=
 =?us-ascii?Q?pizPc4K403FZK9f+RQVQYVUnQLy1bfEzSxuAEivih1dgDFE9bd9kGyWRLBFY?=
 =?us-ascii?Q?ZGqiW1u/6VzrwhJhaFJgAPApHk2GpAsLpy578Nmn3upWyxx/m2HWp+4ULWT3?=
 =?us-ascii?Q?LKE81Ot/+svaiAa52E9XmfFnOTWYig7UwifAAdNmJXKDnFT0efiXFJFf04Gg?=
 =?us-ascii?Q?9HSGZFrXLrQ0AIQxAxnszmKgp3ACoreL7+Ek7gzZleiLJ0VpcgoMcyPy2QVb?=
 =?us-ascii?Q?oRQJMji9+2+HtoR8t/N8stoYrm2xt5LoIKy4onLNkXdI3HE/1BTYGZTIrFB2?=
 =?us-ascii?Q?fxNhtUASwNeZwmXbuKgRqMC7Xq128QfhwWxsA4RXBV91Ti8/1B88Hkdfe/+n?=
 =?us-ascii?Q?PnL8zuxlEwE82cSGg5Q9kyQlzpb4w9ztESh0k3W9G9F9m9Wosms8iOee2s+L?=
 =?us-ascii?Q?3IcipouwG/VtOs7YhNJxsvj0YVSlcR3wkpuJ+WGIOhVQaZqwQgKnJciSNRrr?=
 =?us-ascii?Q?DTh9ZhTEszfgBlG2UmgorbVtcbXEFNqVftcWOHJmJdVqC1HlmQcUx6PwXJqa?=
 =?us-ascii?Q?ovUOmTWSz+XMzxMJ7p+bz4TJxpSQRNVctjGSY0/6PLu0f670jvIbLU7A6AwJ?=
 =?us-ascii?Q?b3YcXre7kzmYqziCwqbpgKu0K/JW09M6b38UVJWBti9wOR+ks0RcePosYYtK?=
 =?us-ascii?Q?I6ddOz46t6nVZc/cmzRZEh9qnOfMa4QMPN7svB1TLE+YfSzRuQrXfFdJ5v7f?=
 =?us-ascii?Q?S0yLAAyQlaQW4UKbTOlyI1uGuuDjpGUA09zYOc+ubGv8xTDGyBC4n4fa5Pg0?=
 =?us-ascii?Q?F9YiMTGMusGl65n5yUkOepq3DbtlCjpB9WfK9AuGATuzwLgLZIwvDtFI4iBL?=
 =?us-ascii?Q?p5y6McCw=3D=3D?=
X-Forefront-PRVS: 0365C0E14B
X-Microsoft-Exchange-Diagnostics:
	=?us-ascii?Q?1;CY4PR02MB2727;23:RY5teB1WrVh0tIOiDQntJbI/ndKP3O8TuWBNbbshx?=
 =?us-ascii?Q?vGcciz4emIHIDeiVXj8fai8SmL7NI8NcR6VgdLnU7W+pXkCoqPjRG8albDY0?=
 =?us-ascii?Q?uPtjSU8qlRjBtbjaaZdLdDgMPkD6zk9vAcy+CKWQ/RmwwCwWH/sGLSz2RT4+?=
 =?us-ascii?Q?Ja6PKCyc52BIAHu+40einRRSjKPjpIxZhDKF2gfGD5Ka30X5W/deHo5//TIO?=
 =?us-ascii?Q?/cPF26e48+qWWWtPY8kuL266r4YRJEHkxcD1NUeDdUI+WPkc7yuOsSerJniR?=
 =?us-ascii?Q?TU3hAwkivmbO5IqchUY41j0jLkdCsJWvzieoY1TgmB8R5we9Ip1qNig6VUeL?=
 =?us-ascii?Q?k/cTyU2dRBn+4sdYaMsHk7+gRjcVesYO7JdZa3SwaqXMc1JGcp8IOxbPGDz+?=
 =?us-ascii?Q?uekfQqq5biGR0qg0k6sKffCAlnlemHI6Qr6GPJ8aP+WhRPymwLQ8qR4t7M/j?=
 =?us-ascii?Q?OuR0CZljQnqUxPuExe0ExCGUDaJeZiqBkF3nNdFhJeSaKfRFdYY+bcZpbKMq?=
 =?us-ascii?Q?925qTo+J8prE+z6asgMduNRJwmxLdo/uspuxUxbUncj4u5R+MsOoYdo4AfK5?=
 =?us-ascii?Q?fvD1p5otPYbTIVQMjiryRJKV4n56G2hdOJYT/9tLOCIRW0kbF3ISTTt+af9b?=
 =?us-ascii?Q?hPyix/L65UaLUt8FmAFyNW4FHxydegl6NUKgAGl9R7NSXgUFAoHQmuvJ+lr3?=
 =?us-ascii?Q?lto9gwHvICVkFP8YRq/C2T66KoVYRfUpr9Y3LRIKDuzD47eFsUtXP6/WFM3S?=
 =?us-ascii?Q?WCzUa/kx9hbR3gsj6jghWwWg/jV2+dmfFGeA8ttn7iZzIIcNLKI3KlClrK3F?=
 =?us-ascii?Q?TMmC6Zd1HKwg5PHNLQipxeWka3VHYerjMyUidkyLOy9wrTGBRC2KT0xV3MhE?=
 =?us-ascii?Q?utn7h15W0t0AkW5uwIf5inOsjQRi+/NVgV1L3JoKFcMkxROApCAS7FkOX6Ti?=
 =?us-ascii?Q?HifqSUg1OsLW8hSQc0QLgxu6UPgsaPNj8+kwv50zB92/7RH53Y99p0+OxMuk?=
 =?us-ascii?Q?RALdJ3sBG/X1cNuoiX5hRa0mnciKrKWyIC0N9/jMK5mtC82t5BZ49hv+k0V5?=
 =?us-ascii?Q?14ezJ4lqnSftwHPdggC9Fb8hNznj2FjIVpv8GppGq78G/4WlXpEjHQJrDIlX?=
 =?us-ascii?Q?L7ulzT/8cGFtw72qDZ2VXxEUsj1GLsKrSuy/GRKHdVELvP94ZtebJBtzi1SY?=
 =?us-ascii?Q?Q6yAy4HTD/Tle0wzCPLzSzKeC/wX75NhwRTQxRXUlQB5JcnqwQCiV+0ye6Es?=
 =?us-ascii?Q?N3PkDEjEZqVTCqB348JwNUjvqOXrVCHfweLL0VXPrLPmuuCAX+kSVzAIvf7i?=
 =?us-ascii?Q?0B17Hxzm/1WzWr0h/9NWGNePpSeqTyNolJkS14fftqCi2ek+DV1HnV+42L8C?=
 =?us-ascii?Q?OfRIg=3D=3D?=
X-Microsoft-Exchange-Diagnostics:
	=?us-ascii?Q?1;CY4PR02MB2727;6:7xmkE5iwxv5QpsJ61podn0MlvvWZ3eDdRD5EhSJMDf?=
 =?us-ascii?Q?/ADt3HcCs++/y+kQ7HCWGAvzOBdLIe+ZQBJ4w/NHE3GMUXwo3QMmurfGV5CU?=
 =?us-ascii?Q?bGktzddR3bHVOBs9Eo+MU4VWPSxl7Zzr7M9teE/WQC44vkZe7XBlqezovr8J?=
 =?us-ascii?Q?JLfpTConcd1N0CBLDC6XKvCD78PExQl7E2XBzuLA2LUPqJIoVDC7FDNV8fzn?=
 =?us-ascii?Q?NU6EZ+rSrGQVMFLwvFXCkm5we4cMVCHjSnZCEXpdQI+FZgZy1W5GzmooPkM6?=
 =?us-ascii?Q?GPvYSZsa6Y7Z7rCgbu+iW31lFVnFt+MF4cIcRHMFJhpJ1T/xH/LqwHg1P6oY?=
 =?us-ascii?Q?i65uvrB6G11PlyWcjKRmVkrUnWJBEyN1dmpabs1o7ylNtKvH1qNM5U4RQvrh?=
 =?us-ascii?Q?bzwPdEtSklXc6af2H+hUfpoq5bn0nOmCIlF1l/NHrIsmRt5o8mBbdc1gaKRQ?=
 =?us-ascii?Q?YCKbrdbdPqCTCFd+HXaNyuByhlSZBnGuSdmaMazpjF53+QhSEdw57rSEma9e?=
 =?us-ascii?Q?fkK9PnKawNIosd0aOCoIKZisKZHnfZpGnO0+4Lhjiie+ZGuJBDK83OfPvPag?=
 =?us-ascii?Q?ec2ZwV0Tgjaioh+I3cFnw4/qjXTTWRY52yZtYeijXrnkpGHo5iXTxnjT8ECX?=
 =?us-ascii?Q?fnXxWYWF60Tu7RUFi9dgENJJtvcmNK3exHHwwJVnBFb4uwcXUbxhz3ArrpL/?=
 =?us-ascii?Q?JKuRW4XEgZpDDbgSBxYPYGwWHEyPq1Tqlt0KmDUiX2ljnSWChgZ+BXZPx1oR?=
 =?us-ascii?Q?fZ7yh1kKF8KNz1+1rbk/PeKefkRVUDIDgF1pBUDisQKG0odbPBl+JipeyTKz?=
 =?us-ascii?Q?i+N4WG4OEGw4S4dJbaAaP/fUxjggdCdz3jjHNKOOS4pBnM6iFTmsedN6gR4P?=
 =?us-ascii?Q?IWU9eKNI5DIlOBqcH7NfMjBdaY8Fk+HHn+3PmjzhjU8n97/HT/k3LI1NuP+1?=
 =?us-ascii?Q?c/AkBJfYreLycN3jHmXKAgnB4rwEzIm6pgvjntLFNwmzcSx5kNPGn59bodCY?=
 =?us-ascii?Q?/rB1PyoqQvDpbHmGmClOQB?=
X-Microsoft-Exchange-Diagnostics:
	1;CY4PR02MB2727;5:lue7+fnFyxw+jdV++KHuhHtDKCD2DNwkR8wqZeyC3/W9KSUTuJs+R3CJn+ENnpzq/oo0wtyH01kh2ZctGTTx68Yghxy32ZfwC2lwFpqLNjpZjyPRWAwvKs5JVPgCCdezu14twMWx9GZhD4RwSijZPwW6DZ1cxGNb+hfEv0NK4fXpuVEEe9dxyWYrz+TuUUyN4Sh4byQUA+eeWU73w9M4tbiMbfxH09FoXZxP2TzDcJOeksIQ61285OcYUW8eeIAg9MpotkvDgA2gD6m+923yLoMDFNaVH2+DLBE+sc5S8sxklDE7JmTXeG6xneVnetCbGLqm6nghE9wm/3y4e/7AgsyCTe+UR1buRpnkdtr+QQY1Nab7yvN+NrNxqLXGZNP//Kf4hswRRXAj7V3pB9RABYYlPRsMH8e2R0hBUC0Zh5n3YsNrDhjsf0/yQE58eMivX+EeAXJwsUpLbHAmeZ9QNMoVcu/p6p9RaGRYMVZbeAOl4m8Y/DXG5N/x0MzILYJM;24:5J3tZEkQu+bXqmF2Hd2MdpDYDtqDmP+LfBb10dxnGOYoB78EFwLrINCVdkNOAsCDlr+CqJiPkCIKkpzDu4XBdDSarFeYWEP/Z6Kt7jwKXRI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics:
	1;CY4PR02MB2727;7:zyGRS0gFFgAsSna0NrlOiHPBZ+dDcXajmMjczpUdlM/vyHDHDkGg0ehSqYQYcyiuTvqpOsQbrspont8NFBZfBCtuIGXdUS4pOd2uI0eJMW1KFjcFG+pzmgWbPdoA9vsQ4PBhgkEXY3CzE7jFGE+czL7+6gJLv6VQQUW8FHeSbvJIwTr0ApjjT/dHb0MyL0jH+dzNYTV9RTqrHriDmVg1MKVMou6Pr9HdvH59oEU97mXlxy+n5S6BCLjQvJZKMUI9VVj//pGYuGjQ19XzAIx2V3FPclEClde5R4/2kIvsvuSGeuwerRfgPjh9u29dMjXqD7bqNuVvBsaZuwWKThb8TpcQ5vZJrVXCrW5X5esYcxT1cYHaqL+GMxnpiPEOt1FZW8M1r0c/t5xvAhufUDDWKDmjLnvd9WM2dupZgQmyfMLjFkPZdRskLAHxsVmGT5KECShYANcdTFn3QJGU/IO1m1YYQ7ic/4Ld2kdZBpk4AR91Ro0ICaSIIL2xatMOYcLLL+ZuDM6ABs+xjQmN05eO7jjZmlNJeIjc6TyzjsWKYSi5tu4doFLjybF+HbMhVWAdkUd+xPhpZcZ1CpqiCaWbYNsPtEqZDfYMQJUntLW9OBKPxL/QJvDPvjjwVaSBFkmBm2mXM5t3J4OkFZgUkj/cNpiOvJ8LnPWXeLr43yzk1ad45xX85jmhyF0ZJN60yplk+VK4O1m8IzMxGSQp3oBdTMS/597Xurh3bvb+1Ksg0bW1fjk29RRx6W1sFOnwUyHfdOc/aa2gJUZ3qnzMuOq7TLYMJ/BQOoQBk30INecj90M=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2017 10:03:41.4755
 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2727
X-TUID: LLqHdz9yBdYw

On Mon, Jul 10, 2017 at 04:11:29PM +0100, Peter Maydell wrote:
> On 30 June 2017 at 14:45, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >
> > Extend PAR format determination to handle more cases.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > ---
> >  target/arm/helper.c | 30 +++++++++++++++++++++++++++++-
> >  1 file changed, 29 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index fd1027e..6a1fffe 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -2345,12 +2345,40 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
> >      uint32_t fsr;
> >      bool ret;
> >      uint64_t par64;
> > +    bool format64 = false;
> >      MemTxAttrs attrs = {};
> >      ARMMMUFaultInfo fi = {};
> >
> >      ret = get_phys_addr(env, value, access_type, mmu_idx,
> >                          &phys_addr, &attrs, &prot, &page_size, &fsr, &fi);
> > -    if (extended_addresses_enabled(env)) {
> > +
> > +    if (is_a64(env)) {
> > +        format64 = true;
> > +    } else if (arm_feature(env, ARM_FEATURE_LPAE)) {
> > +        /*
> > +         * ATS1Cxx:
> > +         * * TTBCR.EAE determines whether the result is returned using the
> > +         *   32-bit or the 64-bit PAR format
> > +         * * Instructions executed in Hyp mode always use the 64bit format
> > +         *
> > +         * ATS1S2NSOxx uses the 64bit format if any of the following is true:
> > +         * * The Non-secure TTBCR.EAE bit is set to 1
> > +         * * The implementation includes EL2, and the value of HCR.VM is 1
> > +         *
> > +         * ATS1Hx always uses the 64bit format (not supported yet).
> > +         */
> > +        format64 = regime_using_lpae_format(env, mmu_idx);
> > +
> > +        if (arm_feature(env, ARM_FEATURE_EL2)) {
> > +            if (mmu_idx == ARMMMUIdx_S12NSE0 || mmu_idx == ARMMMUIdx_S12NSE1) {
> > +                format64 |= env->cp15.hcr_el2 & HCR_VM;
> > +            } else {
> > +                format64 |= arm_current_el(env) == 2;
> > +            }
> > +        }
> > +    }
> 
> So this kind of worries me, because what it's coded as is "determine
> whether architecturally we should be returning a 64-bit or 32-bit
> PAR format", but what the code below it uses the format64 flag for is
> "manipulate whatever PAR we got handed back by get_phys_addr()".
> So we have two separate bits of code that are both choosing
> 32 vs 64 bit PAR (the code in this patch, and the logic inside
> get_phys_addr()), and they have to come to the same conclusion
> or we'll silently mangle the PAR. It seems like it would be
> better to either have get_phys_addr() explicitly tell us what kind
> of format it is returning to us, or to have the caller tell it
> what kind of PAR it needs.

Yes, I see your point and that's exactly what's happenning before the patch.
Some of these new checks are generic in the sense that they check for LPAE/64bitness
but others are I guess ATS specific for lack of a better term.
It feels a bit weird to put the ATS specific PAR format logic into get_phys_addr.

The basic idea here is that we never downgrade to the 32bit format, we only uprgade.
The following line was meant to get the initial format I think you are requesting:
format64 = regime_using_lpae_format(env, mmu_idx);

After that, we apply possible ATS specfic upgrades to 64bit PAR format if needed.

For clarity, perhaps we could make get_phys_addr return this same initial format, and then
we can follow up with the ATS specific upgrades. E.g:

    ret = get_phys_addr(env, value, access_type, mmu_idx,
                        &phys_addr, &attrs, &prot, &page_size, &fsr, &fi,
                        &format64);

    /* Apply possible ATS/PAR 64bit upgrades if format64 is false.  */
    if (is_a64(env)) {
        format64 = true;
    } else if (arm_feature(env, ARM_FEATURE_LPAE)) {
        if (arm_feature(env, ARM_FEATURE_EL2)) {
            if (mmu_idx == ARMMMUIdx_S12NSE0 || mmu_idx == ARMMMUIdx_S12NSE1) {
                format64 |= env->cp15.hcr_el2 & HCR_VM;
            } else {
                format64 |= arm_current_el(env) == 2;
            }
        }
    }


Does something like that sound OK?

Cheers,
Edgar


> >      ret = get_phys_addr(env, value, access_type, mmu_idx,
> >                          &phys_addr, &attrs, &prot, &page_size, &fsr, &fi);
> > -    if (extended_addresses_enabled(env)) {
> > +
> > +    if (is_a64(env)) {
> > +        format64 = true;
> > +    } else if (arm_feature(env, ARM_FEATURE_LPAE)) {
> > +        /*
> > +         * ATS1Cxx:
> > +         * * TTBCR.EAE determines whether the result is returned using the
> > +         *   32-bit or the 64-bit PAR format
> > +         * * Instructions executed in Hyp mode always use the 64bit format
> > +         *
> > +         * ATS1S2NSOxx uses the 64bit format if any of the following is true:
> > +         * * The Non-secure TTBCR.EAE bit is set to 1
> > +         * * The implementation includes EL2, and the value of HCR.VM is 1
> > +         *
> > +         * ATS1Hx always uses the 64bit format (not supported yet).
> > +         */
> > +        format64 = regime_using_lpae_format(env, mmu_idx);
> > +
> > +        if (arm_feature(env, ARM_FEATURE_EL2)) {
> > +            if (mmu_idx == ARMMMUIdx_S12NSE0 || mmu_idx == ARMMMUIdx_S12NSE1) {
> > +                format64 |= env->cp15.hcr_el2 & HCR_VM;
> > +            } else {
> > +                format64 |= arm_current_el(env) == 2;
> > +            }
>

> 
> PS: on the subject of virtualization, I notice there's a comment
> a bit later on in do_ats_write() that says
>     /* Note that S2WLK and FSTAGE are always zero, because we don't
>      * implement virtualization and therefore there can't be a stage 2
>      * fault.
>      */
> so we'll need to address that too at some point...
> 
> thanks
> -- PMM
