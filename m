Received: by 10.25.221.202 with SMTP id w71csp1448826lfi;
        Fri, 11 Aug 2017 15:21:21 -0700 (PDT)
X-Received: by 10.200.53.113 with SMTP id z46mr24357161qtb.184.1502490081441;
        Fri, 11 Aug 2017 15:21:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502490081; cv=none;
        d=google.com; s=arc-20160816;
        b=VYlpENkdL7RSarvRhyjZZr27yX217RM7X+g6uxEWhf9eCYkh8CCSgHSy/VhL8IWIhY
         RLRc3zttRMY34I83dSEtBrGEA4FHA/HR7YTdkuENWMe6HS5NpyO9DXAbU99VxIC3LFum
         mahjYI/THRnU3tjtjN7u3GulkEPTiw8pJZUsRIefn45Zyvl6G/xqh9lVtsvC+6nvrqoy
         uo1cEkF3sGhHjzWFAokHVmMKUgqjnuTxgg+kNkqcm9V9JfvCcvY2mvfAyGLGv3sxPVwP
         alI/pVbKPbW4LaNL1xcGSEjSD+qERCVh8ePmn/tw20uF0dQlcn470vBO0KkE92OrkRJd
         Q79Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=xVHvLEUGHuCTeTXgqakIrVoEPoyM+K1HM6ZRGp2L51s=;
        b=d6eIOoW1lT9Ixc1VRXx9ljSiTMD/dvw1y94ZMxOYZDhw06jPUkZL0kq9YdpPeGRD52
         rIkJF/W6RWvXoEjv3LKtFN5FjTYd+7cFArA6A5TR0l2eAbykUeIM2LXgbYB/g4ef90zd
         kMLumFo8r/+y5Yspl7N6KvAd1oNaHPsiQXSvLFI/J3mgs7xjZoVbJG/VZlqPJPnvp2fl
         /R7LFZ1o2XPCPDfSTBoqUGABaEcjdBh2SFtZloxH9KziEMDkHQ9KSY4xC81pYpU/HQ/l
         ErcOFfRnNnHqnV5JBuBlr52I5BKmOXZ66G0q56NhTVSGuCCmTY7J/2HtHIX7en7YAp6U
         COQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=5FKzcw3h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t5si1595864qtd.471.2017.08.11.15.21.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 15:21:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=5FKzcw3h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53808 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgIIw-0008Ps-N8
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 18:21:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dgIIr-0008P9-BU
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 18:21:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dgIIo-0007Gf-90
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 18:21:13 -0400
Received: from mail-by2nam03on0074.outbound.protection.outlook.com
	([104.47.42.74]:44064
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dgIIn-0007Fk-Op; Fri, 11 Aug 2017 18:21:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=xVHvLEUGHuCTeTXgqakIrVoEPoyM+K1HM6ZRGp2L51s=;
	b=5FKzcw3hRpC7dZ9JlyiRfwj+YmgmDFXLe/b7SNuxdFX8hF9FOcxQ7MhMUiwWnvtXqwez5yoXby11jKYHl18nA1khxrvhNu3CCYrBQ6lqV3cK+m6QkXNG3Bq2us6fff84IoUlgCX8J4oyTKl6sghiP2k2jvsgIryB8b8fCFzSL/4=
Received: from BLUPR0201CA0024.namprd02.prod.outlook.com (10.163.116.34) by
	BN6PR02MB2241.namprd02.prod.outlook.com (10.168.253.135) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1341.17; Fri, 11 Aug 2017 22:21:07 +0000
Received: from BL2NAM02FT059.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::206) by BLUPR0201CA0024.outlook.office365.com
	(2a01:111:e400:52e7::34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1341.17 via
	Frontend Transport; Fri, 11 Aug 2017 22:21:07 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT059.mail.protection.outlook.com (10.152.76.247) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1304.16
	via Frontend Transport; Fri, 11 Aug 2017 22:21:06 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:45673
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dgIIi-0006oU-HB; Fri, 11 Aug 2017 15:21:04 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dgIIi-0006Ib-1a; Fri, 11 Aug 2017 15:21:04 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v7BMKvUH005105; Fri, 11 Aug 2017 15:20:57 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dgIIb-0006GZ-59; Fri, 11 Aug 2017 15:20:57 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2017 15:17:33 -0700
Message-ID: <cover.1502488636.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23250.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(2980300002)(438002)(199003)(189002)(356003)(5003940100001)(305945005)(5660300001)(36386004)(36756003)(50466002)(6666003)(33646002)(50226002)(8676002)(189998001)(81166006)(47776003)(8936002)(9786002)(81156014)(39060400002)(626005)(4326008)(50986999)(54906002)(77096006)(478600001)(48376002)(2906002)(106466001)(63266004)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB2241; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT059;
	1:afFHU9GhPJz2edj/G4qxFDrvw7MsZptRVCod5GKQkHtTX183uu39yjax5tN80xkvYN7nw33Kk/Pwedkgpa+WH2FvqG+BwSbUd628GA2MhzL954O5sOOQGwnUmAmHekoBBh/x06+DwJbcJaVI0/GoxCwzv9quOJHNs1rrV2S8QxwdkJK8BR1AkaRTad6kVaYnsozFPNhaLPRiIORPDSG7WsTwezjbtFdIudxfFC1wFfmLh1I5to5fmH8pI44TnqCHsr8ZH1eYQWjJTMmJIpM1A/oSkszi3vsJV/zA3IbWSmij+qat7ol452xdJGoi3c5FwYSW4AwWzoiyfVeERMyLjhLnHENvh89CpL/nHfPsI7rgGa2XjrFtwo5B+4dNFezhawF59UzqgzTtHpRJybNCEkc9FLOb/DBNI7SvRv5uZXhLtS/JsSDIy5rozM0YGLnxjoUE13tK8hh+1qq52yAn2l6GmygH58Iu2j+ghBo/ryIczKu633m7cBJZbK9QANuJp2xlQ7Ux4Yl8eLiERJaoOx/dhb3+G47BXF70ivdAbAeboPxABP3GtSdrBgWMJcd2NocAtQm75EpAVu2TBl+2gCMBxsNykFpLrA5R6t+cUf/QCIsqS7a0LhAQjeNek+MWGdFs/PvCwNHwCs3tyvqwEGDeYr+2vW4I4JO4ob5zN8a1qHDLTnh5Gy5vfbdswAGfej7pg9ZKTWpEn+lmBBKQRWrk0ywbJumBxwIosek5rfjOJjd2wddmlWeGfrEYd8D4wwCnyRFnnlPYeYK59Q0X1Ic1ehaaTsW5fq3nOg4s1frSVPPBm0bFqFpiv2GHY1lGkW457X0AjJ296ZY1L0LhnQ==
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 036063c6-f059-40b2-9300-08d4e10742bb
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BN6PR02MB2241; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2241;
	3:luSIbiu1xD4OfDgzrwczscaaPLj6hOaodscombOeVlGjPKUEKJrlAKWk1aRxSuwTi/XPv/JvviiFljjZfSl4ELhlZ8QrLiT+fgQI+AcCd7M4r8nymaNp+3kI2F+If5w3Eeqa9QI6iQBqt+pjG/hEA3uIs5t2h0POqWMaBP2YUtVpB1DSWZWHU+NFNOIWE2Ma0wvPQx2lLh+VFxeEdXTt50bR87vJVlcUhhJvNQegfpsorRALhzQjbn5SUr9FVSTVbYv4OvDxQCB7xTfuZoHqifbroX/DmNUvhp243YuA+Ynzfs1YKxff8HBmO7QXJ8d87EOXvYHoABK8llaPIsZleRQC23LY1S9l+J4d+Pm5rrY=;
	25:dwYgPT749soTn7L2r5dHjo6xMWsmx3DMc1F2mxCxjofMDKIib+C6EQaVc57nDiQHm7PFELOh60d1BL6dLiQwfA60Jd1S4Cj1z6MohSkSe4NnBwUl33qXA/JxhdBkMaX9WPUxi5LQXmhJwypC9lA78Q4VaKTVbPT6Tthx7/6ud+1O37Il8QUbne5PAUoN6jd6q0kNkfwZCY2q8FR/PKPYDV/m41P2YURBDXm66gzV1j1Lc2gfp03B3f3lLW7szhnZWf7tLhlgjL4KWvtgZ0BSEn9kHWV/ysFm28FtiOiwHdvhjmQpebpSKO9F6trOk1p94Ju1BWBIXXJAKJIG9wB4TQ==
X-MS-TrafficTypeDiagnostic: BN6PR02MB2241:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2241;
	31:1e2DRbQS8Ai662bIV1FPl7l4k81kLch/fkEuXYTtmSqV7IhWEXac7+U+JBZcdATLSrGDzj9bYdvh6pGIZkSfRt/eBaokU5cDDpjj6bL3VyOYOhk9tOx2UQNUikV9QS0y/yqrnYQvQte67GF+xqKOBXaZwt9iLsdXVMhYZmBs9o9UaairMgP9f+xkgfa+a9RfUY1+6VnDlUByMMly9gulquT7k0zVPzQh5WWw5YdnmYg=;
	20:3PlNt1BUOrjzKygs5W4+RIAoRUqTVBEV3PqCt8MKAnIP55Z16UjA2vhDNQUrufDmLm8GwhQ6Q5MmzMEhc4Qh5d4eQieFhMLAsCD/Mm0SoUCf2c3Pt6Z04cH0DSJ+It5IVB5/FxYjk1aCx3IYaOY40VVGe2WXLaq4OwBZyjeYB5ueLOYqokieN2CFdyy8D2kLg5k1rvCGt0GZufMGGxQIjr4dQ5TM8cmtA+mNjrzjchTrlu6IIKBo7k/S/CBZzgb4lTkX8wPZACOYcUWrHlNFk5gs8lG+g44KniOy8BZ95AakMOXOqAs/U4MTmScxkNBn1pfp2hbxok7xwWntlVDlGokmhF2rI9GKb3scxYvt7KZ14110hu0n39b/NsrSf9BFatE8w9sWJe6LPtg5C3VXfrxfaccIOFOa/jfx0T1Iz2rKRBeb1KaWSSnChe/kvuMVUebV4fZvSiNS/Q+mMJoqYfc5rUZTVp4I0y31fYvd8Dt7QmnFwVxOJXL8oV2UInOr
X-Exchange-Antispam-Report-Test: UriScan:;
X-Microsoft-Antispam-PRVS: <BN6PR02MB224154B351D932DC1705DDE8DC890@BN6PR02MB2241.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(13018025)(13016025)(5005006)(10201501046)(3002001)(100000703101)(100105400095)(93006095)(93004095)(6055026)(6041248)(20161123558100)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123555025)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR02MB2241; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR02MB2241; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2241;
	4:7QqpV/lMDBFBnJnGZgMDK+H7i/Xbm8wTusPFBt48gVEa0UWf64yX9/Pn+5huRv03WLG8fhnJ95v6flgFqeQ+agJSgKa1ELcvtbyR1/SA+hDG62wTN7TTrp8e1Z/mXXb6J2KJw5PsxzrReKFd+iX+bqjNJjRwgQJFy6oM7otieMPCQUM+N0oBGTJKhqs0sqWY/IQhiKLitaC3kbWo/VIVShLaSXsrLPV/WxDigQqEDez1S24n/0aFxFBLhFxpiyBk
X-Forefront-PRVS: 03965EFC76
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2241;
	23:ZDElYTCF64lkhpc/FRzYNGGIpdvIM7r4y60Yw0ys9WcpeBWgRNNEiiSHcZhXzS6KM6PtSltAgmeYfBuzj75qfHPb8rv5K0f1BQezDzgct7/zKHetqfUunH1AWzRv6xKS/Qtt49IhLom6kYnv2t1kGZH+vRvFGRjKD/uGf5YaCXUtQpRFROOyhYEmRHZZdB/cYtAW/vAArxiRM83YYU//LZQf5FgSQnhwOW4KiEW06Zh23HSc0REnL770FMrC/bZRyDbQ8E41aS7q7z0mQfs/HA8v4L97sVRi+4DPdaQ/w2UMPV8rrm2IuHnhoG0k77BUZwkN4Me9OTVvKw7zqCcqrVdPGvk4K3t8enUsk2Tzp7Z24C3BNdKxiRwFGznwApOwofTV0EMIqelGa3lXDWN2Yig+AYW+0WqeRY1u+kqpxQOpjZ5wi5YjtgncHgciU7hyfm3UxF7E593NqL6c3Bi6sidE47IiIbGjBIOWBz7oWNW5fcl64i7F+o1c2ihwavDk6dwmWRaniWaktr4TWt24D32cB2BuvT3dbguR8aG8UJRppLdoBy7yfEZn7th3iIs6pYPJIWLbqs0msIMivkxmaZyW2OorOh8n5veb6dI5Z7qWr/8ow4TtGgX6JFD9W5u0rF2d8bYMZyn3e8D4qNe8mxAZEr2fitXngoVn5/BTt6gyTVoR5rD8csBrbzAgkKMzsE9LclniYx1Tq4avPNNhknwv7dOJtMOAnn4IqebznWyoW9NdewSmW2vowC30VkHiHHcMKPwIrRaaw9GgkKoxV86ID0Wrty0A4T5RF7DrWkbkDCez4avUJDynPoWugYlIKbbWYBLj/Zo7RVqm1aPAzewjNX0vImPvXqmTtoY73TDwtfIIgXfKWxTz3ebizbg0A/kjy4pGhYosjLW45TjxkA==
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2241;
	6:3qdDeTBjSHTccUZVGEwLvUAbW0bwGU5BYCHm7dzagZdsIpdqjsyu8aN7n0hRM4mHDxbtJvS78aYA9D6qKOSc5k/RCN2L3bMyjd57KnRZSBrH4UBtIfCKa9wv7nVRgqgQw0NkwlY0IKFVsv0jYCPBGBg7hX2kkcdUA9xsqL1uxE0+3NeC0mG7f2IhIGCsP3KIjwS0r1Mj8n9vOAxW15Ee1kQHLGLYNrgJmcy98JclVm/uaJxGj9CG0BR5+N2aDeJIt+QR5/iWtg9C5yV0i2q/u/p7vLOeVkIlt4qPU5G6kUIoRcsD9CPzA5U1q9KNdJA2316fLWUzVcFjAOOFcCOhrw==;
	5:ONV5Cd6o6YVAcWokT7VA8GQnACrdBTOrOohiF7wMqiH3K97HYWyhe9yyuiG/8TzONg7Vwu+DBoH7qylYPiV20vBqr5hwdNbwjghFGVd1tg3pUh20OVwDU1K74Qzz/vs3PiKS3QqT4sMsrk8+JXmGrQ==;
	24:F65ebSBnXY1YqKbLiIPZcPCm7fThp3hZisQDThpllVacgFLu8SJ4jzeDHewwFXOHzFEV2tNRwazb/pTu+R3c2ieQuU4IzlAkuvoBa+y2joA=;
	7:+t51PLyMhZEQwk3C10cP6GOdpgWzb+3cIpyqED4jlZpQO+ktAmiXRecIQfr6OKPxS0QXQ+tv9h9R3L1q8ZmTrxcyIkgrcUgWWZEDkr+aOpqLINMwhnVaccWPP0zx/MhrgE6kvGERsmwWRJVNRzprSsPUEDEAx8cx6/A1cR8N8gb9Lbch/dixsUn1eUBLOCvTVuSp/uNWdIrIs6WPLiJyts5j1CuRW5V6IeVMTEsNC0w=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2017 22:21:06.2004 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2241
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.74
Subject: [Qemu-arm] [PATCH v1 0/3]  Fixup exclusive store logic
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
Cc: edgar.iglesias@xilinx.com, alistair23@gmail.com, qemu-arm@nongnu.org,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F29EwgTWL6V/

I found some issues with the way exclusive store was working. This patch
series seems to fix the test cases that were failing for me.

The first patch is just a simple adjustment.

The third patch fixes the main bug I was seeing.

The second patch is left over from the RFC that seems like it is still a
good idea.

Changes from RFC:
 - Rewrite the third patch to correctly fix the issue.

Alistair Francis (3):
  target/arm: Update the memops for exclusive load
  tcg/tcg-op: Expose the tcg_gen_ext_i* functions
  target/arm: Correct exclusive store cmpxchg memop mask

 target/arm/translate-a64.c | 4 ++--
 tcg/tcg-op.c               | 4 ++--
 tcg/tcg-op.h               | 2 ++
 3 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.11.0

