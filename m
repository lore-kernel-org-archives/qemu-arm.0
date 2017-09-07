Received: by 10.223.172.38 with SMTP id v35csp415151wrc;
        Thu, 7 Sep 2017 09:05:36 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb4aWduCB9Rd1YBsBDl+WQFF4ywuNFUxa+UnkGnumcKqdNB6cW7B52OLPRQbFMeUBS9b7NnE
X-Received: by 10.237.63.15 with SMTP id p15mr4334544qtf.113.1504800336643;
        Thu, 07 Sep 2017 09:05:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504800336; cv=none;
        d=google.com; s=arc-20160816;
        b=UWz/9JZppv99WTz50L4n/HZ8WEe7+72XuEjnc1b+17IOCOzwhwykXUs06+N1XuZL8+
         ed4/LllD0vvyuZ7ycuA7Qd/gOfFyi0z6lwAca+S3V6baRKKTLwOkv1TTb76OZrwh7lEI
         f4quRISuPeJCbWw2SzA6VgLIk3frplq+DjdQuwPEkr6NcDfR/I2kYTD7DtUl/rWltfur
         6OWHEIoNPiIfQiuQtKaFRZAQz0r0I132RqyFI4WAQTRNyrrJB59gndjVwrRxSJmdMppW
         7CFIFkoVM/sHyFWPXWsObtIqPah09yhSRWPD9AkH/5w+JLW2qJaNTLwvW047hlex9a63
         B27w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=x7YkyGnBxvpc+7eLi5n8j/348oMlMlaEbKAO5sgr804=;
        b=xHACM7CTgi9NJKsNZtcVfK9eVB6YJT07C0O+vRI9aqT2xFMMe5OllmEba09S7T1H0M
         s9h2HUwKyRx6XdyA8n6Xt0WSAiMD+FTHd1GshffC5sRMRUfH1FyLZm/yhQA1AewgmBZm
         qeBslzzOQ12cMFaqPz3WNFA45zbOmSwzAB4zvPM3mLJck2fdfnYRoUMsc12FhYiNBWoE
         0B52tiLqzTZzr1st5fHgc33FSXr+9Q7eHxgqfsjuoMa9ROhrY4k61nXuHRRr7WE0FSUm
         8PjDtjqj4T1g0QX4Cgk0q0CR/114w2gB8E8WcuEDxlidZiOEVqYvVnkqTv1Q6pzNaU+7
         Jgmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=NCm2VLr7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y137si17911qkb.277.2017.09.07.09.05.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Sep 2017 09:05:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=NCm2VLr7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41178 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpzJ8-0007HY-3B
	for alex.bennee@linaro.org; Thu, 07 Sep 2017 12:05:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39640)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dpzEh-0003wj-0O
	for qemu-devel@nongnu.org; Thu, 07 Sep 2017 12:01:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dpzEW-0003YI-R8
	for qemu-devel@nongnu.org; Thu, 07 Sep 2017 12:00:59 -0400
Received: from mail-bl2nam02on0081.outbound.protection.outlook.com
	([104.47.38.81]:57952
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dpzEW-0003Xp-Jz; Thu, 07 Sep 2017 12:00:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=x7YkyGnBxvpc+7eLi5n8j/348oMlMlaEbKAO5sgr804=;
	b=NCm2VLr7dhoxIFqD+LqZ/VQG4AL+uFaU+38+I7x9YaERWWzmnVQkjVUSTNNUEonV7gAgwf6fJFQObbRghS0ivDL+8sj+jZ6S77IIJ501hrjud/Pjh0VXcbRPpwT04uYlZ17fvfDNOkCyGTWgifMmKKQmQrV7a3veMKf8svWyDL4=
Received: from SN4PR0201CA0042.namprd02.prod.outlook.com (10.162.76.28) by
	BY2PR0201MB1928.namprd02.prod.outlook.com (10.163.75.158) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.13.10; Thu, 7 Sep 2017 16:00:46 +0000
Received: from BL2NAM02FT048.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::203) by SN4PR0201CA0042.outlook.office365.com
	(2603:10b6:803:2e::28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.35.12 via
	Frontend Transport; Thu, 7 Sep 2017 16:00:46 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT048.mail.protection.outlook.com (10.152.76.109) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.13.11
	via Frontend Transport; Thu, 7 Sep 2017 16:00:43 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:39670
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dpzEQ-0002ZW-Ns; Thu, 07 Sep 2017 09:00:42 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dpzEQ-0002gc-L0; Thu, 07 Sep 2017 09:00:42 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dpzEO-0002gS-Hy; Thu, 07 Sep 2017 09:00:40 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Thu, 7 Sep 2017 08:57:05 -0700
Message-ID: <be926a221e31f7aaefe8558965a644a7ced817f2.1504222314.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1504222314.git.alistair.francis@xilinx.com>
References: <cover.1504222314.git.alistair.francis@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23310.003
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(2980300002)(438002)(189002)(199003)(5003940100001)(9786002)(478600001)(39060400002)(189998001)(77096006)(2950100002)(6666003)(106466001)(33646002)(2201001)(50986999)(76176999)(2906002)(4326008)(118296001)(626005)(63266004)(8936002)(356003)(81156014)(81166006)(8676002)(5660300001)(50226002)(305945005)(47776003)(48376002)(36756003)(54906002)(50466002)(36386004)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR0201MB1928;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT048;
	1:Sd6TkwXWmcNY/YyW2/HKoNyaAsPeobXxHdyxJMK4w1r+cxp0pq0gjg3wRvRsfgXUUh8lZ8SA+u9LBDOk/VUw6Tbr6svaIz5OZldapES+5oPR15MqQqFYP8wZgPQlWBEY
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f30a168c-003f-4ce2-b187-08d4f6099985
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BY2PR0201MB1928; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB1928;
	3:RmN2y9ztKDPi95VFQYQeTHZQ7CsAq72tzgwdH8hQme3yqaYaCFoSLZ3+1pP51E+anOue/pO3YE0yDZtTHJcRJDbIhFu1MJVs7dXBAk3zzs6Rq0Uv/LjNYKObbZDFp1r98IFK5XiNYiqFX/g0hVG6Qe8zofzoh5UXxwPBPARa9nE350uZEpVKGTOFDJMxt5vox1G/+8ats64Z4IreN2aaX1Q09YuxeFRoOsQyMVtbgJXHqfYN67lx78Xsyw8e+dlWw+c2y6r5FJGvFbMgRalOwE9VqZpnSY2jGsDOUpIekBV9hxfjAS9yoBtyudAfCcA+nNFTG3XogZfO4yDL/9RidxoebngTUpWCTVSMi9mcSQA=;
	25:tu4PmHugx66cfGsuqqmFNvk4pJEpJedaYW14gpzxs2XYa0B86ezdx2WBTZb9v/0pyFEdQGSLvlf9elKiMrPusYYxJxG3j4A3RtbhwxBvo2m8Yks3DWuMQeDk4G4xsHIXDJYroaOckX7W2HVMy5jOD3GKkBYQd1SOgh0oSOTvaYihdwBsqs5ZNKjqiF0z0zMnD5p64XIgyKQxFJXyEuJj4gYtKqWejsJscx+NKpYd2bRJSTXsfed6wf++eT+HJGG1nDC260Aai6ZT4mpRQA7lbu7YD9ILmGRK70dYczS88ByPtMgSPVsJYzz3W+QVt5dCafUMxb1VKfdjqivwDApnZw==
X-MS-TrafficTypeDiagnostic: BY2PR0201MB1928:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB1928;
	31:j0CEHikIole7Y+h2KsD53Ix/P6xSM6KCWmbi63vWRIkSKHxOiw/IrQ/pn4on+ALCq7wBVyGo7opynARCowcqh60fgilDHzSkJGkL3/+vq0Y23aNvoDDS9DLqLr4lEcTrNSmAfWOYIPzTsjawwxYIwNF5jTY01HeTSVM7QogDCFunVkNd945JZyK4/f72GkjMNHyFcL3syMXlx+ItWO0+Ow46D7UTNq8Bq9WcYjJXNIg=;
	20:YukrLYtnY/phQ82ej8rmNa+aczNMMJ6TNqFesdKXBWj3Up682W1Ip0C/lZ21nAkhDd0vBv7nbmbdWAUjLgzqS8REyMOw568ui5FtyiT3AqWKwTaFVnnkwojWxXhGDpUF6NIPyuCeRQvTzeMAWpKsRf8KeWIAMRxmlzz+1fkDkw8hCMBMemmI4cLnKSAumLlnNpERnHJSaC/US6zbW+94pH6RbFNQgF4mNX27HZTqG8KEFiapqYT72ccWWfvCDZtTwGohWscTCN5Gk2m+HtiVF4qSnUkTvxUcs0y9PazPfd3lGr74oWo/YeI2ZNaXjMQgJVycO+3T1oSg3mwf+R5PeTuUOcohKO2klYHIARIwBOb4M+FI4mXgaVK2AvTBaDXFsCrwnWdQQcpCZqSfkNOQ7sidsrvPz2aEfsnF40HUxLpbzj3qxHVQrPXwrkmcAShh7lR8JMkXTfml9ehSKAVBvf0qRjw6l6JWn1YV2SPO2NRwF9Bww0NNvPKsU56VCR5c
X-Exchange-Antispam-Report-Test: UriScan:(192374486261705)(192813158149592);
X-Microsoft-Antispam-PRVS: <BY2PR0201MB1928663BF91AD7BFE6D35893DC940@BY2PR0201MB1928.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93004095)(3002001)(10201501046)(100000703101)(100105400095)(6055026)(6041248)(20161123560025)(20161123558100)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BY2PR0201MB1928; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BY2PR0201MB1928; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB1928;
	4:QWTzfnRIPayDGt4xRdfzeHDjRN7OG5uEIng06wtEa2OZpUo4/JzhDegG8IHUuhY/YFYZp2qtuEe3GLaTZjMoorn3mc0cpT94L+NckawWVhYJPGTGvFICpbqYY4h9oV6MvgoqzVWzCYMHL4rNf84wtHnGb6ghat17Ioz6bKa0i5q9tCXPWgTjT+LgfllPijabspskpkjBB6UXazfUcb4yokSZroovvHJVhdjy9Awo1UWauNkmFYkWqEYSfLIDWZP/Yt+pxqDTwgEnyDZTi1I5FnkwsMn6Gr6dYWjgGPT22NxCmc1RILVsOrCexcJIF+TOsQJ0ZVuFWdEZaPbyhyiCJw==
X-Forefront-PRVS: 04238CD941
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR0201MB1928;
	23:vhthdz/cXoDrbwXeLRpRSqE00BV01qgocg70j3R?=
	=?us-ascii?Q?ctiycIrVWlwP5qZCcwW11iu2sqcDlk2irsobMSpmXKaKmYAeR1aCyVjkNSST?=
	=?us-ascii?Q?oeKa50MS6vA8lgYdkDzFiwdHP1NSdEpqVERcE90e3vzx+V4qXwg1x4oG50p6?=
	=?us-ascii?Q?Fl91uRsbIxZmqaYFpvoNLxngnwZR2ADtci2aAfy1H/gjQ+4tH5aROzadn5zr?=
	=?us-ascii?Q?MMuYBu2H2Ayf2yf0psiEjrKZ3SxobLTPTIns0VS7/Svhx/Yi7R/UuOUWGeNB?=
	=?us-ascii?Q?Yq87PK7aW48LwtfLLe24Y+5p0l2aW4nr73Dr8U6a1JOAPpxeJPCfO5aeHMyE?=
	=?us-ascii?Q?q6CmqOLMj6gL+hzm9vmsi+9s/YVRrp+QmqSPrKmM+1zh03VJZ5SX2cDZnL32?=
	=?us-ascii?Q?1U3lEVCO3WNnKX8F9XnZjzrweqOxnk9jzVn1ztdsESK3AKm6AWP2cXaGxESg?=
	=?us-ascii?Q?5hAA0vzGo+Sx+77Wasi7IwWRSa/kCiJBlnVr8fug7WIscrZPPPKEgKcDE+qh?=
	=?us-ascii?Q?MTfzulg90pE4zTM+ZNOTs1/qu3+4uFgaAZwQFXrkwa2UWi4r8UZESwTXIOEX?=
	=?us-ascii?Q?EV6R/Vl49Z6H/FrdGtRba5HxQk4/q6yvpgV97DKRw6cGciO8U1rKdqXQVNgg?=
	=?us-ascii?Q?oFKFSrTDUGvLg0Fd4jreTDIUcPIaikk8FSDCzkBHT3YwT0vYZQITXSKYZeY8?=
	=?us-ascii?Q?Fd4Lbn8VGSil0pK++wAm6P/Gf0yJ5peZTN6048QYZaNZX0IcQH5Q3TXzHDgZ?=
	=?us-ascii?Q?XOgFjMubfwvRBG9txbYot3/5yaoUOPVEj4q3DnRtVTa9Ndd+9myeuuh/CEL7?=
	=?us-ascii?Q?EAxfzzd1gkd0zpu9SELoLo74Mc8P7ADEb/zUJSQ2PeBACiKc4O3rRSKxaXlh?=
	=?us-ascii?Q?Bloaoa7Sml36QzJacr15Pfvl4Zkp2Qao8qoq2gJNSQRsvuUEjfovjCw4MR+9?=
	=?us-ascii?Q?kSD5evmV9tjlSRDk29OlncybNuO6AgcGx/BW2gxUSY8dmP1IkLtEdSRtq4rp?=
	=?us-ascii?Q?fEy0=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB1928;
	6:uW8QGB87U3U55cuU/bODQtBAkrOsKN6KH5BNRbCxEumtLREEOC/c9ZvehtcUmfABHURhbt/mTUpY1sxbnS9+Vdi0+KAAgOwyIzQeFQpoWyCpWIqmRo51p3zjveB2DeIb+jdUb8NxAWzucNsHzCJ9/ViKvARE/twfG26excLgpICfWlBGSbK/rhYyCZWm6EQqn+uFXctuYAy+GpFCf3VjcCZkpk3bEbqPoUCaLQVS3kip6F4nsPHOrwi2Y0FjN1U2ytdNeJK0zj+RSA6udlWoAQ36imDNMSKRgmId2fRK/vHusvkRTnSL4V9Qe02H2SGqiYCQjkwnBSFzEs/mdHiyiQ==;
	5:xYZa73svxHRJzT4Me3kXEaXb4X4XlJavSVZat1b3gw2m9LpKSKUSQgNC9oEKBSTgrVFFPt8tlqxfpCdFYCRhDnVtg0SOv5BB5anESoIy51u0urM9Y1l6ToBR8wnBvlxfBOm9k5v+MALtpzUigIyNAQ==;
	24:Y0hnU98bYxB7hAH/fdLpNCeEcAjntqUiIjbV5SXQvWygdj4KmnlE2z5BnxvAQl6VBo8EAInTKiPJChD40sPgKO1KtCajIML0+zaQ5U8ghZ8=;
	7:6YkUEpLCpPjl8GdxADSpghU5pMxNcbwSgyv42XrS4T9PdjAhmlIF2wshaAH7drHZRzsxwHljvM8R4WWTScAciSVN80q4gd8w2NPKXfRHvl7pnM/E2u8f2wAbWn0h1JIPO5PRGtZ+LfgmfhsafRTmbQ9qLbNDQT8kNuuSE89y6747yZfIMnKYD+CeNmZbUUT+JNeaFJn21z97fINblsk3eRbRcFzgudcHcDt1J/KrRr8=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2017 16:00:43.6896 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR0201MB1928
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.81
Subject: [Qemu-devel] [PATCH Resend v2 4/5] xlnx-zcu102: Add a machine level
 virtualization property
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
Cc: edgar.iglesias@xilinx.com, alistair23@gmail.com, edgar.iglesias@gmail.com,
	alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fqA5StTgW5T4
Message-ID: <20170907155705.qOTnHa3H0cLBWsFKiTGhA1uC9_gBWIkyUFtrgQUnhvc@z>

Add a machine level virtualization property. This defaults to false and can be
set to true using this machine command line argument:
    -machine xlnx-zcu102,virtualization=on

This follows what the ARM virt machine does.

This property only applies to the ZCU102 machine. The EP108 machine does
not have this property.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 hw/arm/xlnx-zcu102.c         | 30 +++++++++++++++++++++++++++++-
 hw/arm/xlnx-zynqmp.c         |  3 ++-
 include/hw/arm/xlnx-zynqmp.h |  2 ++
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 080507831a..40c1f5bbf6 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -32,6 +32,7 @@ typedef struct XlnxZCU102 {
     MemoryRegion ddr_ram;
 
     bool secure;
+    bool virt;
 } XlnxZCU102;
 
 #define TYPE_ZCU102_MACHINE   MACHINE_TYPE_NAME("xlnx-zcu102")
@@ -58,6 +59,20 @@ static void zcu102_set_secure(Object *obj, bool value, Error **errp)
     s->secure = value;
 }
 
+static bool zcu102_get_virt(Object *obj, Error **errp)
+{
+    XlnxZCU102 *s = ZCU102_MACHINE(obj);
+
+    return s->virt;
+}
+
+static void zcu102_set_virt(Object *obj, bool value, Error **errp)
+{
+    XlnxZCU102 *s = ZCU102_MACHINE(obj);
+
+    s->virt = value;
+}
+
 static void xlnx_zynqmp_init(XlnxZCU102 *s, MachineState *machine)
 {
     int i;
@@ -87,6 +102,8 @@ static void xlnx_zynqmp_init(XlnxZCU102 *s, MachineState *machine)
                          "ddr-ram", &error_abort);
     object_property_set_bool(OBJECT(&s->soc), s->secure, "secure",
                              &error_fatal);
+    object_property_set_bool(OBJECT(&s->soc), s->virt, "virtualization",
+                             &error_fatal);
 
     object_property_set_bool(OBJECT(&s->soc), true, "realized", &error_fatal);
 
@@ -154,8 +171,9 @@ static void xlnx_ep108_machine_instance_init(Object *obj)
 {
     XlnxZCU102 *s = EP108_MACHINE(obj);
 
-    /* EP108, we don't support setting secure */
+    /* EP108, we don't support setting secure or virt */
     s->secure = false;
+    s->virt = false;
 }
 
 static void xlnx_ep108_machine_class_init(ObjectClass *oc, void *data)
@@ -200,6 +218,16 @@ static void xlnx_zcu102_machine_instance_init(Object *obj)
                                     "Set on/off to enable/disable the ARM "
                                     "Security Extensions (TrustZone)",
                                     NULL);
+
+    /* Default to virt (EL2) being disabled */
+    s->virt = false;
+    object_property_add_bool(obj, "virtualization", zcu102_get_virt,
+                             zcu102_set_virt, NULL);
+    object_property_set_description(obj, "virtualization",
+                                    "Set on/off to enable/disable emulating a "
+                                    "guest CPU which implements the ARM "
+                                    "Virtualization Extensions",
+                                    NULL);
 }
 
 static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 9eceadbdc8..37a8bf2ccd 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -260,7 +260,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         object_property_set_bool(OBJECT(&s->apu_cpu[i]),
                                  s->secure, "has_el3", NULL);
         object_property_set_bool(OBJECT(&s->apu_cpu[i]),
-                                 false, "has_el2", NULL);
+                                 s->virt, "has_el2", NULL);
         object_property_set_int(OBJECT(&s->apu_cpu[i]), GIC_BASE_ADDR,
                                 "reset-cbar", &error_abort);
         object_property_set_bool(OBJECT(&s->apu_cpu[i]), true, "realized",
@@ -432,6 +432,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 static Property xlnx_zynqmp_props[] = {
     DEFINE_PROP_STRING("boot-cpu", XlnxZynqMPState, boot_cpu),
     DEFINE_PROP_BOOL("secure", XlnxZynqMPState, secure, false),
+    DEFINE_PROP_BOOL("virtualization", XlnxZynqMPState, virt, false),
     DEFINE_PROP_BOOL("has_rpu", XlnxZynqMPState, has_rpu, false),
     DEFINE_PROP_END_OF_LIST()
 };
diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index c2931bf39c..6eff81a995 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -91,6 +91,8 @@ typedef struct XlnxZynqMPState {
 
     /* Has the ARM Security extensions?  */
     bool secure;
+    /* Has the ARM Virtualization extensions?  */
+    bool virt;
     /* Has the RPU subsystem?  */
     bool has_rpu;
 }  XlnxZynqMPState;
-- 
2.11.0

