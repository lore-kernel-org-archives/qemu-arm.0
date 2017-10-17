Received: by 10.223.197.9 with SMTP id q9csp4842600wrf;
        Tue, 17 Oct 2017 10:36:41 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBwzXqGEvJ33SIBoVghqV4fn5q6m6En6l+Wa77ZTLX1j5DEFbIRGfto8wOD0QlAWfiBKFLY
X-Received: by 10.55.176.4 with SMTP id z4mr20652711qke.159.1508261801032;
        Tue, 17 Oct 2017 10:36:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508261801; cv=none;
        d=google.com; s=arc-20160816;
        b=UTMA9JkE88vIRHj9MxvfxYlSHoI+2A7tWb0tqfpUuP0RjnH+2dS+TwhTotJDgfFsP8
         iD4G/deCLQGSGQJYRa2xsiZAuYUjKScTN7iSKmvoTEdvLO7cA9CGXwz1HMbnRqRiIJ0I
         babS7Ygo5zREqsJ7ofvn+UYb8KFt3cXvIrrkhnqacw8Hz5pi7VncE7pJIKQFTzNCJYMC
         9VO1oKzMFIaQkpxDhUOUPevdaXBqVCqumVa7a1+AXfXvmhdc4HrP6lLOb0JXq48bsYrm
         mLc7285slDVzFUkyEUly9B3JcqkpGrXH9k8iqvyfufFK9uq8RBPv1n1nbi52/vUofnaG
         a70Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=3ZqkR+YXndSB/HweNqMSMeXD6ktPmdO63Po/LqRhGbU=;
        b=mgXgFk6oOSvEoILtgNFlNnSNbCmRlfOirceFMP306lLeyzbYBpNTeB9RrUp8eJ98go
         8LT9uTJozHH18USZslt1XRc8pgiICiGJ3vvMrc4FAuzuReypqNYagwBoF/ZsLwWyFjPF
         CddJGVsDtQU/XArEKCGXrONgflwiMV1+4oax/FPJqT/p3Bel7z5kX2sZhs5G6k4YhtRA
         L9vt4T9AQ5MgrISzizH76AIbjHN7iRBndXxzTnB7AokU5SenLcXgvXg8o8BGrBNff5SM
         rJ5281/YeZK6naGUgmEpYS44Fp6wgEQ4LKCpBK0Jrv/Y/VKL4D24tDyGu3zLZr0V5yYs
         drcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=ECmlpyqu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q25si1563358qkl.266.2017.10.17.10.36.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 10:36:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=ECmlpyqu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40872 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4VnC-00077R-BU
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 13:36:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1e4Vkj-0005Eu-Uh
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 13:34:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1e4Vkh-0006SF-0w
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 13:34:05 -0400
Received: from mail-co1nam03on0052.outbound.protection.outlook.com
	([104.47.40.52]:16054
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1e4VkZ-0006OB-0M; Tue, 17 Oct 2017 13:33:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=3ZqkR+YXndSB/HweNqMSMeXD6ktPmdO63Po/LqRhGbU=;
	b=ECmlpyqufVCfsHfmPRNqNSmAIRYDjGrACCLCMwPYm1cTCrno9OVewTnBqDkqRoVa6cKprzxm7Ny8vkT+RSwV9udn15rFyHbbbA0XPlRW1Ul2I0CcUIjQvgRcrAihVSJqchq4qM6ZAtVP52VhCgTS0rS003Vh2E3FLbU44Mh9/kE=
Received: from BN6PR02CA0047.namprd02.prod.outlook.com (10.173.146.161) by
	CY1PR02MB1333.namprd02.prod.outlook.com (10.161.170.24) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Tue, 17 Oct 2017 17:33:51 +0000
Received: from BL2NAM02FT006.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::208) by BN6PR02CA0047.outlook.office365.com
	(2603:10b6:404:5f::33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.77.7 via
	Frontend Transport; Tue, 17 Oct 2017 17:33:50 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT006.mail.protection.outlook.com (10.152.76.239) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.77.10
	via Frontend Transport; Tue, 17 Oct 2017 17:33:50 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e4VkT-0002Qs-T8; Tue, 17 Oct 2017 10:33:49 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e4VkT-0000oi-Ne; Tue, 17 Oct 2017 10:33:49 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e4VkK-0000n4-3D; Tue, 17 Oct 2017 10:33:40 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Tue, 17 Oct 2017 10:29:51 -0700
Message-ID: <12d01491de4612b533f6525efbf2be189635fd07.1508261326.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1508261326.git.alistair.francis@xilinx.com>
References: <cover.1508261326.git.alistair.francis@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23400.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(346002)(376002)(39860400002)(2980300002)(438002)(189002)(199003)(316002)(106002)(110136005)(36386004)(118296001)(5003940100001)(4326008)(305945005)(230783001)(16586007)(47776003)(356003)(9786002)(39060400002)(5660300001)(50226002)(48376002)(54906003)(106466001)(2950100002)(50466002)(2201001)(2906002)(189998001)(36756003)(33646002)(63266004)(478600001)(81156014)(81166006)(575784001)(76176999)(77096006)(8936002)(8676002)(50986999)(6666003)(107986001)(2101003)(309714004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1333; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT006;
	1:Pyme1KlKQUKR29kwfxcTq+9dDedmvRmn4NOZZ21VIemn1F+mlwfuiXNLiFDmsMZSrl9jE08m4+L4UwHKp92/mON30q4pfNT+k4ybmnrFXCMShx7aONzR3zvD/CjD1bvw
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00434385-fd93-4b60-9144-08d515853b06
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(8251501002)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
	SRVR:CY1PR02MB1333; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1333;
	3:+xtkHQCbmJa9PMVMKST3NyyldyqB++BKW3WiFI/wf1QAiob7Vsaa0rn+bU8m5ALGqNSB9qnfumGOdz5oCYsHpNgbYRBnIiVaIOqivz9o/MoOumFp9/MSzADY3xxxw9z5EknWFHOCZ9vPMl3JbzOJPC2yl8k7zyHT1orIRdj+/6DnvMpAZz4qiYcFcfT1XAKMl/8Js8Jg+QadBvHrTJNpIRUA/RULNoWcEnA6FXPRwPf4w2nSJ6POc5ylY1B7X6x97v9hIq0tcZgXgmdE+damgA40+CNTMT+aXMOKLk23wZY+2/eoWeCuT5oSnlTQ5P4wmpHLV/N914my0cE1GF9GZgqqRauGL+jyij4lb3GPw7k=;
	25:UEyLRKOjUpe8rL37JY2WmOh+BzWgXUHcc6aJuYf+UVbo380w2vS7MTQakFJopTNMRryENf7R+ta3aFpdgEPnzaXig3c1nxzbOKwXagm2j5eJZDVxtOe3Tc+HUla5wjC7a9UhTo/eHEIs48NkhVvoAqqlSMGCD3a5vBDMn+snJ+Y19sAb8ovOZoVKIMpmklb+AYd5cWXuQL98Aixxe+YuVSqcxhS3uFV2EKAiPAZmaYczOvhWDvoO7f7QM2nHO9HIpBTqgiqIGhwnerUOS5YmHYW1HawdX/wF7KCjexzEMPaIsA573UJ2//PK7mSTGXc3xtcWRt44bqfDhAs+uLi4SQ==
X-MS-TrafficTypeDiagnostic: CY1PR02MB1333:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1333;
	31:Fe9Up9yEZyqWb4fSinyexCsA4qvDFIgs9q8Q/btyGXaQykPJt6tujnvI3pSNUW7WWKkMzFhZ2ffcetttPYkQAo+pcrZeWWBFNTW0naWZzurcVBTpulmaL+Xd/zUrVu1IVx2tze/DqOUs2vuwThN5AjM48Fb3JL6L0CioG29qhpyIfk23M9HUX7Adct36N4eS6qbmf8fyXM3XDL9ed6cxQHRny08ugnONJxre5r6g9HA=;
	20:9Bd/KfN1lN2mXYRUIOpo9LuvEVwPWYoCBv1JoHKoAoIkC9WkioT0R5qg5VgixKpQtrcoB+gq8ROBzH1bbu0caaGFhlY8JWtEQrVvfnjkSDzd6v+ea+BoW4EZRfLLx6zFicHmtFSm3ylRP1AaRtmvuTz+0s144CczdIfaX1OnV/kc3EG6wXwNCSZd4eIhYvJ1YwnASfslGhkAG70Weqt1Td3jph2osNYNhWaf0XBtDrV7PnE8rx+gtxrgcHhXi210lMOn2qWs0bxJA0IexaQTWr2SzZTDoE6olqeujAo1bmwMWcOisWbNXvMFiLUcZR3hI8JaLyJ2x/k+FDKfMlq8CTLtQp1vdjQweHZmmfDTBDIzLcczShbXJKkNxjVn1qT0j1Ihq+3k7y6ibuiVD/QyeW4hQ4P7ci7J5IzyKBOsayPOKz0iNeEcfLvWYrCZDV9ggwIE+k3r6KmCmisISh03J6ja2K9H4mSvtw+lpK1gqUknHyZKQdPHOtTiWlyStIki
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <CY1PR02MB1333ED0955061C460991597FDC4C0@CY1PR02MB1333.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(10201501046)(100000703101)(100105400095)(93006095)(93004095)(6055026)(6041248)(20161123564025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123560025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY1PR02MB1333; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY1PR02MB1333; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1333;
	4:iGkvycm0KXy/f1iss9hGWwuvecLARlxnG9B3jMwWw4f64/XHW5oNMHUZE8KG/+d4+/uf7V8iN2/jrFhGtkEWpYfD9JMHhHpRx2HvLmlJ9fQStHhSlWCPN/Hqn9ZeyiyRBuKWECsYLG/qz7nv80zCVkeC9RvAhocUzAgy7EvrrPbsTphsiYS71MdnwzyUNCvagWFE8rMO0oDV4P8czJYC7ow3x/cDvd9XIN1q633G2ua6t5ZJK+akxPrhc3CZonR+1XtkTmYLNajdxmTZ6gLeKDtkxS3bgf9qxadAHulfOA8=
X-Forefront-PRVS: 04631F8F77
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR02MB1333;
	23:jxWeNCHnmMzhmu+XMG7NWIGRX5wSnsrlTj351vcT9?=
	=?us-ascii?Q?ZrOmpEX9UjdAdlLUZ+l0TbnrZ4uAYvP68c5D3mPRQEkhGTj76zjzS2y6lzlm?=
	=?us-ascii?Q?awGN1NC2lCIk9os/rpzdpLOYKOCUsWn3EyCriDJiT6CriET6B6hSi/kkEX3u?=
	=?us-ascii?Q?OoaHYa5ttyXhrLWBjA+6z3bQ4ezfCw5+g+UUEGb0AERh9MHFCWAtkktycfbe?=
	=?us-ascii?Q?AZ+hKyR8f1PHazSeeP3T1rNVvkE94e7AGjfpuVRah+q2Q7XAFdS4U9DDCTvS?=
	=?us-ascii?Q?QZAMLOHVXkuYlSLRFMny4j5aBcDSKWdr0Ndm6uK47epIaMIeP7/Yd90nJXBk?=
	=?us-ascii?Q?r1Eq2nuMac7zST0etzBintgajmk170lREcp7GalsDQJn0etlskNmA8xNo+8u?=
	=?us-ascii?Q?LZm3HFEpn58saVWA+HfSR+SuNu+BgSunmV9VCkDXCrP/dGikQk0sfAQd547z?=
	=?us-ascii?Q?a22fQ2zOtmcCPhoIbuUzEguLER/ufxNPydNzjHOF9i6OPzT9Dti/yU+9C1tC?=
	=?us-ascii?Q?mM/7OppbSzn1pwhNO9vcYLmr/RYzAR7cUGGaargPfhzo5Ot+DTIOU27+l8Kf?=
	=?us-ascii?Q?ZmFdcfkCnP8hVXd5ZtNUh32RnxBe7ZTJwlcR3YdoBMpEF8RAbI4MeBA7TIe5?=
	=?us-ascii?Q?Qnh+zwTopfyDjlH+9Udnn32OfSUXxpJBjP2rBqmSRzLRyLSm7L/WGn9YXblW?=
	=?us-ascii?Q?lWA5lOcwpA+x9v9hR6fLXVVwwVCQFX7Rg3tQOm+jh4bbfHudlehfaeAVCQ1u?=
	=?us-ascii?Q?o/MKKg4LZfsy134mpsrFGkmTfeD0w+HdYBJ1+fe4kqOX98C+SXOEOm6MLg9n?=
	=?us-ascii?Q?hBLFK3UtI+kZKF6hRAPQYfRN5hiTObcZK1wFvLDN6elwEvFOkAbHKAZ6E3lK?=
	=?us-ascii?Q?o+qF4MYgP9eplV+9+b+8kG3y6qeLA7hjmU7unhVqemH4ptBiKRFnvi4tUfvY?=
	=?us-ascii?Q?h7NHA2OSgQTEReoAhAMO20jYs4I7av4c8CkC7m09bpFoHoLmmMj9AOAlRyKB?=
	=?us-ascii?Q?TR7UrE7Uan3LUJk1t59SE2CqUk7MZuYFqvpZHqcXzfIwT8+BCoi1JgmuXo4p?=
	=?us-ascii?Q?6a6osQF4ORftDQC5ILEcA76yJLLnRPpxVNIAiwTxtFfyE5PePXKmIAw/EqwM?=
	=?us-ascii?Q?bW3Zu8d5rkSbh/coJLMY1QK7IuN7OHq?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1333;
	6:B7eK95mqYuPxxgpaZSMohanjMF3d0J28JLMu/6oo59fgkee/FQdsUQfLIMeOaPEjZEXbr3XK+NqgLpaszDxxj7nkq7C5CL+W1WXU0I/shdZAIDoTjeyCRBIXzN+QcDhHHM4cDPDMlsxoOORUaTeYXWl9ntLMIFcpkJpzlsVpW4VgfVsLlX06u6qDXNKribFvND8IbXzwHScvDgEBjiH8yICWO2e452sH5hq789GXndTVWkZabw2Ex1pYNGPQGF49QPqCjOWWEGrEzo2dysK6Q9RovZ9zKTL/0WnqfkSWhDZ4shKVesLr2hJk+vRRGZbprCIwX8np9jlWxxYqGxa32Q==;
	5:uoxgrWbfabYKBaAegCwEMiZ7A1DHCCkFM4cUzLVUFXTxbJoQaOAdefyWUDfKaBQJmooU6vkPHtLkk436BcN7fdDfRzpE80lY6F7xCjQAaIX4Int326pb3LNT6owE9iVrgRZXyMF5GzEpIoOO+Nb5Xb/VnLIe3gPxNMxD4VZFWgo=;
	24:zGkczAR7ytnrFwvVh2a5F4/pLkJa7783/qlqtKDaX9sMMbDsh0/GV+THImi/DHWNtkmXDf30IszDoZZ5Sp01B3f9Bv5E0T8QazQulXEVyyo=;
	7:M4R/r5xLrO2UTs7GuHEwyyOsUyq5+RqX44lgt118tS8xKImdzsiHKGyrc/FEWaNyyxt1uZS8bQfS5ZDxU73VoenNLPKnyIyw1duDZsHa742WuLH2nh3tq04giIubPimZraBJ0SeLdXD1pMdO25DNqPiplo7pmp3iOl49tSR6RnFLHBUlQP3dwfYrYM+RzEyE45YJ5qZvYqLV7ylOAzf/eaXrL7k6YuWOkxcnTWcBL/Y=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2017 17:33:50.4475 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1333
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.40.52
Subject: [Qemu-arm] [PATCH v4 4/8] xlnx-pmu-iomod-intc: Add the PMU
 Interrupt controller
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TuzHNasR8bIv

Add the PMU IO Module Interrupt controller device.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 default-configs/microblaze-softmmu.mak |   1 +
 hw/intc/Makefile.objs                  |   1 +
 hw/intc/xlnx-pmu-iomod-intc.c          | 554 +++++++++++++++++++++++++++++++++
 include/hw/intc/xlnx-pmu-iomod-intc.h  |  58 ++++
 4 files changed, 614 insertions(+)
 create mode 100644 hw/intc/xlnx-pmu-iomod-intc.c
 create mode 100644 include/hw/intc/xlnx-pmu-iomod-intc.h

diff --git a/default-configs/microblaze-softmmu.mak b/default-configs/microblaze-softmmu.mak
index ce2630818a..7fca8e4c99 100644
--- a/default-configs/microblaze-softmmu.mak
+++ b/default-configs/microblaze-softmmu.mak
@@ -9,3 +9,4 @@ CONFIG_XILINX_SPI=y
 CONFIG_XILINX_ETHLITE=y
 CONFIG_SSI=y
 CONFIG_SSI_M25P80=y
+CONFIG_XLNX_ZYNQMP=y
diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
index 78426a7daf..0fce61e2ce 100644
--- a/hw/intc/Makefile.objs
+++ b/hw/intc/Makefile.objs
@@ -3,6 +3,7 @@ common-obj-$(CONFIG_I8259) += i8259_common.o i8259.o
 common-obj-$(CONFIG_PL190) += pl190.o
 common-obj-$(CONFIG_PUV3) += puv3_intc.o
 common-obj-$(CONFIG_XILINX) += xilinx_intc.o
+common-obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-pmu-iomod-intc.o
 common-obj-$(CONFIG_ETRAXFS) += etraxfs_pic.o
 common-obj-$(CONFIG_IMX) += imx_avic.o
 common-obj-$(CONFIG_LM32) += lm32_pic.o
diff --git a/hw/intc/xlnx-pmu-iomod-intc.c b/hw/intc/xlnx-pmu-iomod-intc.c
new file mode 100644
index 0000000000..4ec7991f4f
--- /dev/null
+++ b/hw/intc/xlnx-pmu-iomod-intc.c
@@ -0,0 +1,554 @@
+/*
+ * QEMU model of Xilinx I/O Module Interrupt Controller
+ *
+ * Copyright (c) 2013 Xilinx Inc
+ * Written by Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+ * Written by Alistair Francis <alistair.francis@xilinx.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/register.h"
+#include "qemu/bitops.h"
+#include "qemu/log.h"
+#include "hw/intc/xlnx-pmu-iomod-intc.h"
+
+#ifndef XLNX_PMU_IO_INTC_ERR_DEBUG
+#define XLNX_PMU_IO_INTC_ERR_DEBUG 0
+#endif
+
+#define DB_PRINT_L(lvl, fmt, args...) do {\
+    if (XLNX_PMU_IO_INTC_ERR_DEBUG >= lvl) {\
+        qemu_log(TYPE_XLNX_PMU_IO_INTC ": %s:" fmt, __func__, ## args);\
+    } \
+} while (0);
+
+#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
+
+REG32(IRQ_MODE, 0xc)
+REG32(GPO0, 0x10)
+    FIELD(GPO0, MAGIC_WORD_1, 24, 8)
+    FIELD(GPO0, MAGIC_WORD_2, 16, 8)
+    FIELD(GPO0, FT_INJECT_FAILURE, 13, 3)
+    FIELD(GPO0, DISABLE_RST_FTSM, 12, 1)
+    FIELD(GPO0, RST_FTSM, 11, 1)
+    FIELD(GPO0, CLR_FTSTS, 10, 1)
+    FIELD(GPO0, RST_ON_SLEEP, 9, 1)
+    FIELD(GPO0, DISABLE_TRACE_COMP, 8, 1)
+    FIELD(GPO0, PIT3_PRESCALE, 7, 1)
+    FIELD(GPO0, PIT2_PRESCALE, 5, 2)
+    FIELD(GPO0, PIT1_PRESCALE, 3, 2)
+    FIELD(GPO0, PIT0_PRESCALE, 1, 2)
+    FIELD(GPO0, DEBUG_REMAP, 0, 1)
+REG32(GPO1, 0x14)
+    FIELD(GPO1, MIO_5, 5, 1)
+    FIELD(GPO1, MIO_4, 4, 1)
+    FIELD(GPO1, MIO_3, 3, 1)
+    FIELD(GPO1, MIO_2, 2, 1)
+    FIELD(GPO1, MIO_1, 1, 1)
+    FIELD(GPO1, MIO_0, 0, 1)
+REG32(GPO2, 0x18)
+    FIELD(GPO2, DAP_RPU_WAKE_ACK, 9, 1)
+    FIELD(GPO2, DAP_FP_WAKE_ACK, 8, 1)
+    FIELD(GPO2, PS_STATUS, 7, 1)
+    FIELD(GPO2, PCAP_EN, 6, 1)
+REG32(GPO3, 0x1c)
+    FIELD(GPO3, PL_GPO_31, 31, 1)
+    FIELD(GPO3, PL_GPO_30, 30, 1)
+    FIELD(GPO3, PL_GPO_29, 29, 1)
+    FIELD(GPO3, PL_GPO_28, 28, 1)
+    FIELD(GPO3, PL_GPO_27, 27, 1)
+    FIELD(GPO3, PL_GPO_26, 26, 1)
+    FIELD(GPO3, PL_GPO_25, 25, 1)
+    FIELD(GPO3, PL_GPO_24, 24, 1)
+    FIELD(GPO3, PL_GPO_23, 23, 1)
+    FIELD(GPO3, PL_GPO_22, 22, 1)
+    FIELD(GPO3, PL_GPO_21, 21, 1)
+    FIELD(GPO3, PL_GPO_20, 20, 1)
+    FIELD(GPO3, PL_GPO_19, 19, 1)
+    FIELD(GPO3, PL_GPO_18, 18, 1)
+    FIELD(GPO3, PL_GPO_17, 17, 1)
+    FIELD(GPO3, PL_GPO_16, 16, 1)
+    FIELD(GPO3, PL_GPO_15, 15, 1)
+    FIELD(GPO3, PL_GPO_14, 14, 1)
+    FIELD(GPO3, PL_GPO_13, 13, 1)
+    FIELD(GPO3, PL_GPO_12, 12, 1)
+    FIELD(GPO3, PL_GPO_11, 11, 1)
+    FIELD(GPO3, PL_GPO_10, 10, 1)
+    FIELD(GPO3, PL_GPO_9, 9, 1)
+    FIELD(GPO3, PL_GPO_8, 8, 1)
+    FIELD(GPO3, PL_GPO_7, 7, 1)
+    FIELD(GPO3, PL_GPO_6, 6, 1)
+    FIELD(GPO3, PL_GPO_5, 5, 1)
+    FIELD(GPO3, PL_GPO_4, 4, 1)
+    FIELD(GPO3, PL_GPO_3, 3, 1)
+    FIELD(GPO3, PL_GPO_2, 2, 1)
+    FIELD(GPO3, PL_GPO_1, 1, 1)
+    FIELD(GPO3, PL_GPO_0, 0, 1)
+REG32(GPI0, 0x20)
+    FIELD(GPI0, RFT_ECC_FATAL_ERR, 31, 1)
+    FIELD(GPI0, RFT_VOTER_ERR, 30, 1)
+    FIELD(GPI0, RFT_COMPARE_ERR_23, 29, 1)
+    FIELD(GPI0, RFT_COMPARE_ERR_13, 28, 1)
+    FIELD(GPI0, RFT_COMPARE_ERR_12, 27, 1)
+    FIELD(GPI0, RFT_LS_MISMATCH_23_B, 26, 1)
+    FIELD(GPI0, RFT_LS_MISMATCH_13_B, 25, 1)
+    FIELD(GPI0, RFT_LS_MISMATCH_12_B, 24, 1)
+    FIELD(GPI0, RFT_MISMATCH_STATE, 23, 1)
+    FIELD(GPI0, RFT_MISMATCH_CPU, 22, 1)
+    FIELD(GPI0, RFT_SLEEP_RESET, 19, 1)
+    FIELD(GPI0, RFT_LS_MISMATCH_23_A, 18, 1)
+    FIELD(GPI0, RFT_LS_MISMATCH_13_A, 17, 1)
+    FIELD(GPI0, RFT_LS_MISMATCH_12_A, 16, 1)
+    FIELD(GPI0, NFT_ECC_FATAL_ERR, 15, 1)
+    FIELD(GPI0, NFT_VOTER_ERR, 14, 1)
+    FIELD(GPI0, NFT_COMPARE_ERR_23, 13, 1)
+    FIELD(GPI0, NFT_COMPARE_ERR_13, 12, 1)
+    FIELD(GPI0, NFT_COMPARE_ERR_12, 11, 1)
+    FIELD(GPI0, NFT_LS_MISMATCH_23_B, 10, 1)
+    FIELD(GPI0, NFT_LS_MISMATCH_13_B, 9, 1)
+    FIELD(GPI0, NFT_LS_MISMATCH_12_B, 8, 1)
+    FIELD(GPI0, NFT_MISMATCH_STATE, 7, 1)
+    FIELD(GPI0, NFT_MISMATCH_CPU, 6, 1)
+    FIELD(GPI0, NFT_SLEEP_RESET, 3, 1)
+    FIELD(GPI0, NFT_LS_MISMATCH_23_A, 2, 1)
+    FIELD(GPI0, NFT_LS_MISMATCH_13_A, 1, 1)
+    FIELD(GPI0, NFT_LS_MISMATCH_12_A, 0, 1)
+REG32(GPI1, 0x24)
+    FIELD(GPI1, APB_AIB_ERROR, 31, 1)
+    FIELD(GPI1, AXI_AIB_ERROR, 30, 1)
+    FIELD(GPI1, ERROR_2, 29, 1)
+    FIELD(GPI1, ERROR_1, 28, 1)
+    FIELD(GPI1, ACPU_3_DBG_PWRUP, 23, 1)
+    FIELD(GPI1, ACPU_2_DBG_PWRUP, 22, 1)
+    FIELD(GPI1, ACPU_1_DBG_PWRUP, 21, 1)
+    FIELD(GPI1, ACPU_0_DBG_PWRUP, 20, 1)
+    FIELD(GPI1, FPD_WAKE_GIC_PROXY, 16, 1)
+    FIELD(GPI1, MIO_WAKE_5, 15, 1)
+    FIELD(GPI1, MIO_WAKE_4, 14, 1)
+    FIELD(GPI1, MIO_WAKE_3, 13, 1)
+    FIELD(GPI1, MIO_WAKE_2, 12, 1)
+    FIELD(GPI1, MIO_WAKE_1, 11, 1)
+    FIELD(GPI1, MIO_WAKE_0, 10, 1)
+    FIELD(GPI1, DAP_RPU_WAKE, 9, 1)
+    FIELD(GPI1, DAP_FPD_WAKE, 8, 1)
+    FIELD(GPI1, USB_1_WAKE, 7, 1)
+    FIELD(GPI1, USB_0_WAKE, 6, 1)
+    FIELD(GPI1, R5_1_WAKE, 5, 1)
+    FIELD(GPI1, R5_0_WAKE, 4, 1)
+    FIELD(GPI1, ACPU_3_WAKE, 3, 1)
+    FIELD(GPI1, ACPU_2_WAKE, 2, 1)
+    FIELD(GPI1, ACPU_1_WAKE, 1, 1)
+    FIELD(GPI1, ACPU_0_WAKE, 0, 1)
+REG32(GPI2, 0x28)
+    FIELD(GPI2, VCC_INT_FP_DISCONNECT, 31, 1)
+    FIELD(GPI2, VCC_INT_DISCONNECT, 30, 1)
+    FIELD(GPI2, VCC_AUX_DISCONNECT, 29, 1)
+    FIELD(GPI2, DBG_ACPU3_RST_REQ, 23, 1)
+    FIELD(GPI2, DBG_ACPU2_RST_REQ, 22, 1)
+    FIELD(GPI2, DBG_ACPU1_RST_REQ, 21, 1)
+    FIELD(GPI2, DBG_ACPU0_RST_REQ, 20, 1)
+    FIELD(GPI2, CP_ACPU3_RST_REQ, 19, 1)
+    FIELD(GPI2, CP_ACPU2_RST_REQ, 18, 1)
+    FIELD(GPI2, CP_ACPU1_RST_REQ, 17, 1)
+    FIELD(GPI2, CP_ACPU0_RST_REQ, 16, 1)
+    FIELD(GPI2, DBG_RCPU1_RST_REQ, 9, 1)
+    FIELD(GPI2, DBG_RCPU0_RST_REQ, 8, 1)
+    FIELD(GPI2, R5_1_SLEEP, 5, 1)
+    FIELD(GPI2, R5_0_SLEEP, 4, 1)
+    FIELD(GPI2, ACPU_3_SLEEP, 3, 1)
+    FIELD(GPI2, ACPU_2_SLEEP, 2, 1)
+    FIELD(GPI2, ACPU_1_SLEEP, 1, 1)
+    FIELD(GPI2, ACPU_0_SLEEP, 0, 1)
+REG32(GPI3, 0x2c)
+    FIELD(GPI3, PL_GPI_31, 31, 1)
+    FIELD(GPI3, PL_GPI_30, 30, 1)
+    FIELD(GPI3, PL_GPI_29, 29, 1)
+    FIELD(GPI3, PL_GPI_28, 28, 1)
+    FIELD(GPI3, PL_GPI_27, 27, 1)
+    FIELD(GPI3, PL_GPI_26, 26, 1)
+    FIELD(GPI3, PL_GPI_25, 25, 1)
+    FIELD(GPI3, PL_GPI_24, 24, 1)
+    FIELD(GPI3, PL_GPI_23, 23, 1)
+    FIELD(GPI3, PL_GPI_22, 22, 1)
+    FIELD(GPI3, PL_GPI_21, 21, 1)
+    FIELD(GPI3, PL_GPI_20, 20, 1)
+    FIELD(GPI3, PL_GPI_19, 19, 1)
+    FIELD(GPI3, PL_GPI_18, 18, 1)
+    FIELD(GPI3, PL_GPI_17, 17, 1)
+    FIELD(GPI3, PL_GPI_16, 16, 1)
+    FIELD(GPI3, PL_GPI_15, 15, 1)
+    FIELD(GPI3, PL_GPI_14, 14, 1)
+    FIELD(GPI3, PL_GPI_13, 13, 1)
+    FIELD(GPI3, PL_GPI_12, 12, 1)
+    FIELD(GPI3, PL_GPI_11, 11, 1)
+    FIELD(GPI3, PL_GPI_10, 10, 1)
+    FIELD(GPI3, PL_GPI_9, 9, 1)
+    FIELD(GPI3, PL_GPI_8, 8, 1)
+    FIELD(GPI3, PL_GPI_7, 7, 1)
+    FIELD(GPI3, PL_GPI_6, 6, 1)
+    FIELD(GPI3, PL_GPI_5, 5, 1)
+    FIELD(GPI3, PL_GPI_4, 4, 1)
+    FIELD(GPI3, PL_GPI_3, 3, 1)
+    FIELD(GPI3, PL_GPI_2, 2, 1)
+    FIELD(GPI3, PL_GPI_1, 1, 1)
+    FIELD(GPI3, PL_GPI_0, 0, 1)
+REG32(IRQ_STATUS, 0x30)
+    FIELD(IRQ_STATUS, CSU_PMU_SEC_LOCK, 31, 1)
+    FIELD(IRQ_STATUS, INV_ADDR, 29, 1)
+    FIELD(IRQ_STATUS, PWR_DN_REQ, 28, 1)
+    FIELD(IRQ_STATUS, PWR_UP_REQ, 27, 1)
+    FIELD(IRQ_STATUS, SW_RST_REQ, 26, 1)
+    FIELD(IRQ_STATUS, HW_RST_REQ, 25, 1)
+    FIELD(IRQ_STATUS, ISO_REQ, 24, 1)
+    FIELD(IRQ_STATUS, FW_REQ, 23, 1)
+    FIELD(IRQ_STATUS, IPI3, 22, 1)
+    FIELD(IRQ_STATUS, IPI2, 21, 1)
+    FIELD(IRQ_STATUS, IPI1, 20, 1)
+    FIELD(IRQ_STATUS, IPI0, 19, 1)
+    FIELD(IRQ_STATUS, RTC_ALARM, 18, 1)
+    FIELD(IRQ_STATUS, RTC_EVERY_SECOND, 17, 1)
+    FIELD(IRQ_STATUS, CORRECTABLE_ECC, 16, 1)
+    FIELD(IRQ_STATUS, GPI3, 14, 1)
+    FIELD(IRQ_STATUS, GPI2, 13, 1)
+    FIELD(IRQ_STATUS, GPI1, 12, 1)
+    FIELD(IRQ_STATUS, GPI0, 11, 1)
+    FIELD(IRQ_STATUS, PIT3, 6, 1)
+    FIELD(IRQ_STATUS, PIT2, 5, 1)
+    FIELD(IRQ_STATUS, PIT1, 4, 1)
+    FIELD(IRQ_STATUS, PIT0, 3, 1)
+REG32(IRQ_PENDING, 0x34)
+    FIELD(IRQ_PENDING, CSU_PMU_SEC_LOCK, 31, 1)
+    FIELD(IRQ_PENDING, INV_ADDR, 29, 1)
+    FIELD(IRQ_PENDING, PWR_DN_REQ, 28, 1)
+    FIELD(IRQ_PENDING, PWR_UP_REQ, 27, 1)
+    FIELD(IRQ_PENDING, SW_RST_REQ, 26, 1)
+    FIELD(IRQ_PENDING, HW_RST_REQ, 25, 1)
+    FIELD(IRQ_PENDING, ISO_REQ, 24, 1)
+    FIELD(IRQ_PENDING, FW_REQ, 23, 1)
+    FIELD(IRQ_PENDING, IPI3, 22, 1)
+    FIELD(IRQ_PENDING, IPI2, 21, 1)
+    FIELD(IRQ_PENDING, IPI1, 20, 1)
+    FIELD(IRQ_PENDING, IPI0, 19, 1)
+    FIELD(IRQ_PENDING, RTC_ALARM, 18, 1)
+    FIELD(IRQ_PENDING, RTC_EVERY_SECOND, 17, 1)
+    FIELD(IRQ_PENDING, CORRECTABLE_ECC, 16, 1)
+    FIELD(IRQ_PENDING, GPI3, 14, 1)
+    FIELD(IRQ_PENDING, GPI2, 13, 1)
+    FIELD(IRQ_PENDING, GPI1, 12, 1)
+    FIELD(IRQ_PENDING, GPI0, 11, 1)
+    FIELD(IRQ_PENDING, PIT3, 6, 1)
+    FIELD(IRQ_PENDING, PIT2, 5, 1)
+    FIELD(IRQ_PENDING, PIT1, 4, 1)
+    FIELD(IRQ_PENDING, PIT0, 3, 1)
+REG32(IRQ_ENABLE, 0x38)
+    FIELD(IRQ_ENABLE, CSU_PMU_SEC_LOCK, 31, 1)
+    FIELD(IRQ_ENABLE, INV_ADDR, 29, 1)
+    FIELD(IRQ_ENABLE, PWR_DN_REQ, 28, 1)
+    FIELD(IRQ_ENABLE, PWR_UP_REQ, 27, 1)
+    FIELD(IRQ_ENABLE, SW_RST_REQ, 26, 1)
+    FIELD(IRQ_ENABLE, HW_RST_REQ, 25, 1)
+    FIELD(IRQ_ENABLE, ISO_REQ, 24, 1)
+    FIELD(IRQ_ENABLE, FW_REQ, 23, 1)
+    FIELD(IRQ_ENABLE, IPI3, 22, 1)
+    FIELD(IRQ_ENABLE, IPI2, 21, 1)
+    FIELD(IRQ_ENABLE, IPI1, 20, 1)
+    FIELD(IRQ_ENABLE, IPI0, 19, 1)
+    FIELD(IRQ_ENABLE, RTC_ALARM, 18, 1)
+    FIELD(IRQ_ENABLE, RTC_EVERY_SECOND, 17, 1)
+    FIELD(IRQ_ENABLE, CORRECTABLE_ECC, 16, 1)
+    FIELD(IRQ_ENABLE, GPI3, 14, 1)
+    FIELD(IRQ_ENABLE, GPI2, 13, 1)
+    FIELD(IRQ_ENABLE, GPI1, 12, 1)
+    FIELD(IRQ_ENABLE, GPI0, 11, 1)
+    FIELD(IRQ_ENABLE, PIT3, 6, 1)
+    FIELD(IRQ_ENABLE, PIT2, 5, 1)
+    FIELD(IRQ_ENABLE, PIT1, 4, 1)
+    FIELD(IRQ_ENABLE, PIT0, 3, 1)
+REG32(IRQ_ACK, 0x3c)
+    FIELD(IRQ_ACK, CSU_PMU_SEC_LOCK, 31, 1)
+    FIELD(IRQ_ACK, INV_ADDR, 29, 1)
+    FIELD(IRQ_ACK, PWR_DN_REQ, 28, 1)
+    FIELD(IRQ_ACK, PWR_UP_REQ, 27, 1)
+    FIELD(IRQ_ACK, SW_RST_REQ, 26, 1)
+    FIELD(IRQ_ACK, HW_RST_REQ, 25, 1)
+    FIELD(IRQ_ACK, ISO_REQ, 24, 1)
+    FIELD(IRQ_ACK, FW_REQ, 23, 1)
+    FIELD(IRQ_ACK, IPI3, 22, 1)
+    FIELD(IRQ_ACK, IPI2, 21, 1)
+    FIELD(IRQ_ACK, IPI1, 20, 1)
+    FIELD(IRQ_ACK, IPI0, 19, 1)
+    FIELD(IRQ_ACK, RTC_ALARM, 18, 1)
+    FIELD(IRQ_ACK, RTC_EVERY_SECOND, 17, 1)
+    FIELD(IRQ_ACK, CORRECTABLE_ECC, 16, 1)
+    FIELD(IRQ_ACK, GPI3, 14, 1)
+    FIELD(IRQ_ACK, GPI2, 13, 1)
+    FIELD(IRQ_ACK, GPI1, 12, 1)
+    FIELD(IRQ_ACK, GPI0, 11, 1)
+    FIELD(IRQ_ACK, PIT3, 6, 1)
+    FIELD(IRQ_ACK, PIT2, 5, 1)
+    FIELD(IRQ_ACK, PIT1, 4, 1)
+    FIELD(IRQ_ACK, PIT0, 3, 1)
+REG32(PIT0_PRELOAD, 0x40)
+REG32(PIT0_COUNTER, 0x44)
+REG32(PIT0_CONTROL, 0x48)
+    FIELD(PIT0_CONTROL, PRELOAD, 1, 1)
+    FIELD(PIT0_CONTROL, EN, 0, 1)
+REG32(PIT1_PRELOAD, 0x50)
+REG32(PIT1_COUNTER, 0x54)
+REG32(PIT1_CONTROL, 0x58)
+    FIELD(PIT1_CONTROL, PRELOAD, 1, 1)
+    FIELD(PIT1_CONTROL, EN, 0, 1)
+REG32(PIT2_PRELOAD, 0x60)
+REG32(PIT2_COUNTER, 0x64)
+REG32(PIT2_CONTROL, 0x68)
+    FIELD(PIT2_CONTROL, PRELOAD, 1, 1)
+    FIELD(PIT2_CONTROL, EN, 0, 1)
+REG32(PIT3_PRELOAD, 0x70)
+REG32(PIT3_COUNTER, 0x74)
+REG32(PIT3_CONTROL, 0x78)
+    FIELD(PIT3_CONTROL, PRELOAD, 1, 1)
+    FIELD(PIT3_CONTROL, EN, 0, 1)
+
+static void xlnx_pmu_io_irq_update(XlnxPMUIOIntc *s)
+{
+    bool irq_out;
+
+    s->regs[R_IRQ_PENDING] = s->regs[R_IRQ_STATUS] & s->regs[R_IRQ_ENABLE];
+    irq_out = !!s->regs[R_IRQ_PENDING];
+
+    DB_PRINT("Setting IRQ output = %d\n", irq_out);
+
+    qemu_set_irq(s->parent_irq, irq_out);
+}
+
+static void xlnx_pmu_io_irq_enable_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxPMUIOIntc *s = XLNX_PMU_IO_INTC(reg->opaque);
+
+    xlnx_pmu_io_irq_update(s);
+}
+
+static void xlnx_pmu_io_irq_ack_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxPMUIOIntc *s = XLNX_PMU_IO_INTC(reg->opaque);
+    uint32_t val = val64;
+
+    /* Only clear */
+    val &= s->regs[R_IRQ_STATUS];
+    s->regs[R_IRQ_STATUS] ^= val;
+
+    /* Active level triggered interrupts stay high.  */
+    s->regs[R_IRQ_STATUS] |= s->irq_raw & ~s->cfg.level_edge;
+
+    xlnx_pmu_io_irq_update(s);
+}
+
+static const RegisterAccessInfo xlnx_pmu_io_intc_regs_info[] = {
+    {   .name = "IRQ_MODE",  .addr = A_IRQ_MODE,
+        .rsvd = 0xffffffff,
+    },{ .name = "GPO0",  .addr = A_GPO0,
+    },{ .name = "GPO1",  .addr = A_GPO1,
+        .rsvd = 0xffffffc0,
+    },{ .name = "GPO2",  .addr = A_GPO2,
+        .rsvd = 0xfffffc3f,
+    },{ .name = "GPO3",  .addr = A_GPO3,
+    },{ .name = "GPI0",  .addr = A_GPI0,
+        .rsvd = 0x300030,
+        .ro = 0xffcfffcf,
+    },{ .name = "GPI1",  .addr = A_GPI1,
+        .rsvd = 0xf0e0000,
+        .ro = 0xf0f1ffff,
+    },{ .name = "GPI2",  .addr = A_GPI2,
+        .rsvd = 0x1f00fcc0,
+        .ro = 0xe0ff033f,
+    },{ .name = "GPI3",  .addr = A_GPI3,
+        .ro = 0xffffffff,
+    },{ .name = "IRQ_STATUS",  .addr = A_IRQ_STATUS,
+        .rsvd = 0x40008787,
+        .ro = 0xbfff7878,
+    },{ .name = "IRQ_PENDING",  .addr = A_IRQ_PENDING,
+        .rsvd = 0x40008787,
+        .ro = 0xdfff7ff8,
+    },{ .name = "IRQ_ENABLE",  .addr = A_IRQ_ENABLE,
+        .rsvd = 0x40008787,
+        .ro = 0x7800,
+        .post_write = xlnx_pmu_io_irq_enable_postw,
+    },{ .name = "IRQ_ACK",  .addr = A_IRQ_ACK,
+        .rsvd = 0x40008787,
+        .post_write = xlnx_pmu_io_irq_ack_postw,
+    },{ .name = "PIT0_PRELOAD",  .addr = A_PIT0_PRELOAD,
+        .ro = 0xffffffff,
+    },{ .name = "PIT0_COUNTER",  .addr = A_PIT0_COUNTER,
+        .ro = 0xffffffff,
+    },{ .name = "PIT0_CONTROL",  .addr = A_PIT0_CONTROL,
+        .rsvd = 0xfffffffc,
+    },{ .name = "PIT1_PRELOAD",  .addr = A_PIT1_PRELOAD,
+        .ro = 0xffffffff,
+    },{ .name = "PIT1_COUNTER",  .addr = A_PIT1_COUNTER,
+        .ro = 0xffffffff,
+    },{ .name = "PIT1_CONTROL",  .addr = A_PIT1_CONTROL,
+        .rsvd = 0xfffffffc,
+    },{ .name = "PIT2_PRELOAD",  .addr = A_PIT2_PRELOAD,
+        .ro = 0xffffffff,
+    },{ .name = "PIT2_COUNTER",  .addr = A_PIT2_COUNTER,
+        .ro = 0xffffffff,
+    },{ .name = "PIT2_CONTROL",  .addr = A_PIT2_CONTROL,
+        .rsvd = 0xfffffffc,
+    },{ .name = "PIT3_PRELOAD",  .addr = A_PIT3_PRELOAD,
+        .ro = 0xffffffff,
+    },{ .name = "PIT3_COUNTER",  .addr = A_PIT3_COUNTER,
+        .ro = 0xffffffff,
+    },{ .name = "PIT3_CONTROL",  .addr = A_PIT3_CONTROL,
+        .rsvd = 0xfffffffc,
+    }
+};
+
+static void irq_handler(void *opaque, int irq, int level)
+{
+    XlnxPMUIOIntc *s = XLNX_PMU_IO_INTC(opaque);
+    uint32_t mask = 1 << irq;
+    uint32_t prev = s->irq_raw;
+    uint32_t temp;
+
+    s->irq_raw &= ~mask;
+    s->irq_raw |= (!!level) << irq;
+
+    /* Turn active-low into active-high.  */
+    s->irq_raw ^= (~s->cfg.positive);
+    s->irq_raw &= mask;
+
+    if (s->cfg.level_edge & mask) {
+        /* Edge triggered.  */
+        temp = (prev ^ s->irq_raw) & s->irq_raw;
+    } else {
+        /* Level triggered.  */
+        temp = s->irq_raw;
+    }
+    s->regs[R_IRQ_STATUS] |= temp;
+
+    xlnx_pmu_io_irq_update(s);
+}
+
+static void xlnx_pmu_io_intc_reset(DeviceState *dev)
+{
+    XlnxPMUIOIntc *s = XLNX_PMU_IO_INTC(dev);
+    unsigned int i;
+
+    for (i = 0; i < ARRAY_SIZE(s->regs_info); ++i) {
+        register_reset(&s->regs_info[i]);
+    }
+
+    xlnx_pmu_io_irq_update(s);
+}
+
+static const MemoryRegionOps xlnx_pmu_io_intc_ops = {
+    .read = register_read_memory,
+    .write = register_write_memory,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+static Property xlnx_pmu_io_intc_properties[] = {
+    DEFINE_PROP_UINT32("intc-intr-size", XlnxPMUIOIntc, cfg.intr_size, 0),
+    DEFINE_PROP_UINT32("intc-level-edge", XlnxPMUIOIntc, cfg.level_edge, 0),
+    DEFINE_PROP_UINT32("intc-positive", XlnxPMUIOIntc, cfg.positive, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void xlnx_pmu_io_intc_realize(DeviceState *dev, Error **errp)
+{
+    XlnxPMUIOIntc *s = XLNX_PMU_IO_INTC(dev);
+
+    /* Internal interrupts are edge triggered?  */
+    s->cfg.level_edge <<= 16;
+    s->cfg.level_edge |= 0xffff;
+
+    /* Internal interrupts are postitive.  */
+    s->cfg.positive <<= 16;
+    s->cfg.positive |= 0xffff;
+
+    /* Max 16 external interrupts.  */
+    assert(s->cfg.intr_size <= 16);
+
+    qdev_init_gpio_in(dev, irq_handler, 16 + s->cfg.intr_size);
+}
+
+static void xlnx_pmu_io_intc_init(Object *obj)
+{
+    XlnxPMUIOIntc *s = XLNX_PMU_IO_INTC(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    RegisterInfoArray *reg_array;
+
+    memory_region_init(&s->iomem, obj, TYPE_XLNX_PMU_IO_INTC,
+                       XlnxPMUIOIntc_R_MAX * 4);
+    reg_array =
+        register_init_block32(DEVICE(obj), xlnx_pmu_io_intc_regs_info,
+                              ARRAY_SIZE(xlnx_pmu_io_intc_regs_info),
+                              s->regs_info, s->regs,
+                              &xlnx_pmu_io_intc_ops,
+                              XLNX_PMU_IO_INTC_ERR_DEBUG,
+                              XlnxPMUIOIntc_R_MAX * 4);
+    memory_region_add_subregion(&s->iomem,
+                                0x0,
+                                &reg_array->mem);
+    sysbus_init_mmio(sbd, &s->iomem);
+
+    sysbus_init_irq(sbd, &s->parent_irq);
+}
+
+static const VMStateDescription vmstate_xlnx_pmu_io_intc = {
+    .name = TYPE_XLNX_PMU_IO_INTC,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, XlnxPMUIOIntc, XlnxPMUIOIntc_R_MAX),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static void xlnx_pmu_io_intc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = xlnx_pmu_io_intc_reset;
+    dc->realize = xlnx_pmu_io_intc_realize;
+    dc->vmsd = &vmstate_xlnx_pmu_io_intc;
+    dc->props = xlnx_pmu_io_intc_properties;
+}
+
+static const TypeInfo xlnx_pmu_io_intc_info = {
+    .name          = TYPE_XLNX_PMU_IO_INTC,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(XlnxPMUIOIntc),
+    .class_init    = xlnx_pmu_io_intc_class_init,
+    .instance_init = xlnx_pmu_io_intc_init,
+};
+
+static void xlnx_pmu_io_intc_register_types(void)
+{
+    type_register_static(&xlnx_pmu_io_intc_info);
+}
+
+type_init(xlnx_pmu_io_intc_register_types)
diff --git a/include/hw/intc/xlnx-pmu-iomod-intc.h b/include/hw/intc/xlnx-pmu-iomod-intc.h
new file mode 100644
index 0000000000..3478d8cf6c
--- /dev/null
+++ b/include/hw/intc/xlnx-pmu-iomod-intc.h
@@ -0,0 +1,58 @@
+/*
+ * QEMU model of Xilinx I/O Module Interrupt Controller
+ *
+ * Copyright (c) 2014 Xilinx Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef XLNX_PMU_IO_INTC_H
+#define XLNX_PMU_IO_INTC_H
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/register.h"
+
+#define TYPE_XLNX_PMU_IO_INTC "xlnx.pmu_io_intc"
+
+#define XLNX_PMU_IO_INTC(obj) \
+     OBJECT_CHECK(XlnxPMUIOIntc, (obj), TYPE_XLNX_PMU_IO_INTC)
+
+/* This is R_PIT3_CONTROL + 1 */
+#define XlnxPMUIOIntc_R_MAX (0x78 + 1)
+
+typedef struct XlnxPMUIOIntc {
+    SysBusDevice parent_obj;
+    MemoryRegion iomem;
+
+    qemu_irq parent_irq;
+
+    struct {
+        uint32_t intr_size;
+        uint32_t level_edge;
+        uint32_t positive;
+    } cfg;
+
+    uint32_t irq_raw;
+
+    uint32_t regs[XlnxPMUIOIntc_R_MAX];
+    RegisterInfo regs_info[XlnxPMUIOIntc_R_MAX];
+} XlnxPMUIOIntc;
+
+#endif /* XLNX_PMU_IO_INTC_H */
-- 
2.11.0

