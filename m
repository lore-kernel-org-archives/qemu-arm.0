Received: by 10.223.188.70 with SMTP id a6csp1502891wrh;
        Fri, 1 Sep 2017 14:08:03 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb5FtypRMTkLFvr7XehSVtCm1woNSzPUhjNuZkJWt6bRpvOnN8vefxxt4s6eQAfxpwqJ8c5c
X-Received: by 10.55.2.6 with SMTP id 6mr4247568qkc.330.1504300083533;
        Fri, 01 Sep 2017 14:08:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504300083; cv=none;
        d=google.com; s=arc-20160816;
        b=A2Ey3o6SWJSvCOGaQbPprO37DWpxftN8F2l5ZbjWtG8xdMPJpRSh6ttw3+W69JK3/a
         xdN4RFffQrnc6mZBka5erBSwKzpaRevpVnXmJuji3Tgx+UnBu8BjqqJ2pOi2Co9DzMm1
         nY134kWqNo+3lE2XZFsxlHYdga+yPAF1Hp4+cEmA+IQXJkskkbE9eqxWpw3s+Gx/cDSf
         vCO1OPlrnviWkyy7LZjt4DPw5Yuq4bFQmlD/VqFW2wPsGy/i4QIKCnggAxWG7pm6Uenp
         5/dtQi8OnY3d7VedA0BXEX2/aj1Ck4iRw5NqqUHBHF0U2bRnx/WXB82g2xIRA9UoF+w7
         7HeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=P5OShS5KdOQE+i7mWTXki63poW5uo8nxMIid7u6qqNQ=;
        b=bzik07dM8EM4MNw1SfWn5KR3yEJYp6dlYa2zPo4MNdoZa2cWWGB4O5KkeHy3eYtqdt
         dMpfcmD6XPvHTNshqUyl9a0GVoDzQEbrrWq0xDZJdGqErg6mGf/CPEOyFUS9BTX1AbFV
         tIxxrqolZVQL+Q6u+9RYSoh4RroCpZiQM7XLDwffC0YzfReXbnZfhLsgyAXXUxtWM60+
         i4T9LvygWNhLdNfO8vKUiw+ks5ia/BITUcan4XOqzNxHLtm61Je6HpccbHvKwR9OgMxw
         Of0DviJnmWREp/NWAsS7CWplTyB7CUYxADBRQJmIuFhTeMhqZ/PdgVVRjVDu7nU5kpa1
         a0Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=mUl+y1F2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j189si11039432qkf.47.2017.09.01.14.08.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Sep 2017 14:08:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=mUl+y1F2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60631 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dntAX-0003Ui-8P
	for alex.bennee@linaro.org; Fri, 01 Sep 2017 17:08:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dnt7H-0000Vw-MW
	for qemu-devel@nongnu.org; Fri, 01 Sep 2017 17:04:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dnt7G-0006ur-LT
	for qemu-devel@nongnu.org; Fri, 01 Sep 2017 17:04:39 -0400
Received: from mail-by2nam03on0042.outbound.protection.outlook.com
	([104.47.42.42]:45690
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dnt7A-0006ob-5i; Fri, 01 Sep 2017 17:04:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=P5OShS5KdOQE+i7mWTXki63poW5uo8nxMIid7u6qqNQ=;
	b=mUl+y1F2NcNojKZcZe9M+irhXaK+14AuE53vp72M9pirR9huXoorTJbvWuFeNtWQ4uaC/jx7hRX/8SYm/K9nS6XUWtW6UoEj8N/BLrz2NRwaom9ZlUw6x8gRg+sL+TYach2R+IqQldAEhx14Ly6Q3iMWlzCVSQcvBP4MRRuCksM=
Received: from BY2PR02CA0114.namprd02.prod.outlook.com (10.163.44.168) by
	BLUPR02MB1123.namprd02.prod.outlook.com (10.163.79.149) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.13.10; Fri, 1 Sep 2017 21:04:28 +0000
Received: from SN1NAM02FT016.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::207) by BY2PR02CA0114.outlook.office365.com
	(2a01:111:e400:5261::40) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.13.10 via
	Frontend Transport; Fri, 1 Sep 2017 21:04:27 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT016.mail.protection.outlook.com (10.152.72.113) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1385.11
	via Frontend Transport; Fri, 1 Sep 2017 21:04:27 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnt74-0004gP-VG; Fri, 01 Sep 2017 14:04:26 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnt74-0007gz-RY; Fri, 01 Sep 2017 14:04:26 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v81L4FdV027538; Fri, 1 Sep 2017 14:04:16 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dnt6t-0007f0-Sz; Fri, 01 Sep 2017 14:04:15 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Fri, 1 Sep 2017 14:00:40 -0700
Message-ID: <26b702658b5bf9984edaecb22b1190be0a9d7052.1504293917.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1504293917.git.alistair.francis@xilinx.com>
References: <cover.1504293917.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23296.003
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(2980300002)(438002)(199003)(189002)(76176999)(9786002)(50986999)(54906002)(77096006)(8676002)(2950100002)(81166006)(6666003)(81156014)(50226002)(106466001)(33646002)(63266004)(5660300001)(50466002)(2906002)(8936002)(36756003)(48376002)(189998001)(5003940100001)(118296001)(36386004)(478600001)(356003)(305945005)(39060400002)(626005)(47776003)(4326008)(2201001)(107986001)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR02MB1123; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT016;
	1:vBw60s0keESfnk5zigd0wXM5JqezKAb6CAHdkuhiLn7YNs84iy5zdgzglsOplypIwMUz2fTPzLvyk4TmJ0soejl76acvGNfSTPwGRgkyeycSxo+QQbYMcFGr8wDzT102
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dddfef3-004b-4751-9a77-08d4f17d0857
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BLUPR02MB1123; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1123;
	3:/t04mMrtQqptX35hZk6V+IPbdIvh/UFsGAZwlDMMj6vOHmhtFXgrjj6TheX5HcjMjb6sBaRCcugz5QyF1hzo+jMwBuSoY4RCkwyVVx4b19J5/u/Nv1vdfWi1MO5E8/kKGL+QFTxFKfHj79j02WHQpPeUvhB+OxeUgafPQFlrLGPMUPuy6awwm7tt7lZLUCUFpHM3ppp0CG0N3xzofBeYwdTAC2+V2eSmT8hRJLvZsmhKb8VpG0VRpe3mE4P3PHhNu3ASOYrELuPLy06QuWsAd7wRyzqHnnKhTuX/VLj6l0u6AeZoBOw7sAcyz7gZuBxdcXD8ZXVE6lU/i24q7/a0xbYWkbiZbw5k35BQCOzgXm0=;
	25:IMC0dBeKjR/QmPyVQDW3GuVpedfD7myV2YHlPf2YZ1UskbnKOZzAm5dr/cas1Yo/Yl/HeZUqTfXB6YpxlfJpvAsKpqcUVTW5T7rYdF7Fa3qxrAUmyUADfWvG30Iz+cBas7GCSoVnhd/ZHc4nDWpjq4bhVwDZDy+b5oWpf7TQZTk4ISKY9iuUtc9AQr6e2OuBMxcqFCOo1KNE3fgLgXxqWAZ67duqQV4qV8I6VEbtj2j4KLp7W+6MltJRFfarPy4OEIDmJyg0642qdEh7bznalh3KlPZtMexNuW5fUOnhGmmbyuLu+zD7dKG6Pou5t2vpD7g8VhNWirpU6TIzzaCMcA==
X-MS-TrafficTypeDiagnostic: BLUPR02MB1123:
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1123;
	31:EpsvIH7tf01+HFQSTJvYjItm3aesV6hBDYAkIbUlIq6TzNgWxwU/fEyFghRcvZC81795OhZNWx4wvQTDF828cA5v5qA7Z0uVjfLPNkn+3gDY4O7+Evu2dGXFc8p0BrRllgqXsR7mrXQLOoXYgL7jglOhqv6Cpd/Ml7V1egMUKFk29/jaTg1oQnf152eGvy8ZUBz2wTXvIns9YdORJr7JwPfX4oIZC7y3KFMXZiddlv4=;
	20:m8bT4kmr3F5+zKPNtU1ePO6IpUUKiT3zEDx3JZSr5aNjpA3ukRi97oR3UloGm/SYXwYYykkfKniw3PrvuL4+no9Of3fUu9cKLzA+sNQH1ie1nAztekeqAIJQe5NxLpuTBeRe+lYUirY59fNhuQ61uPReC6y1pHpd2iCRatVYTxtAybqMahF3eup5etLTPiCHF6kQjOoixalOLMbMSuqZlgmzMqZk/BMQjzFQA7Lpq7C1OCUXvI2iOY9QsBvfGApMNI/bX8exk+agZ6lEWuEa0dLBpHMNzU+uxdhy4DlY4FBCL7ohm67LwcnAoizliaM8Fj6CGQT+aYznicSLID3YJNnuD/8uf/F4na8qOujwY7KI4LpWY4lo/LivuleOwqschpLP6tFNZbbnKwksYqIIiW4Q8Rp9wu/WiMa3872tNB+jAPzO8SYLI/uwLdl7z87o7zfe/rLGX8R+Ivj3esZsrH5l4UZkAg9Jojqf7TpDvdTWc8A6oii5RWIyyOS9tXtd
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <BLUPR02MB1123DCB6F19885EF141607B3DC920@BLUPR02MB1123.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(13016025)(8121501046)(13018025)(3002001)(93006095)(93004095)(10201501046)(100000703101)(100105400095)(6055026)(6041248)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123555025)(20161123562025)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BLUPR02MB1123; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BLUPR02MB1123; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1123;
	4:SJkxoqONo+Uo39+VFF3fhuNihe6o0JrBMWgBEXbopEDNxsFrBxedzP7db30h7Qvlhhlia57Z4P6WfZpiDJT5JoFl6+3ZK5rtzoDAnM1CBdkdVVtd1V5CIbJd+E+VV8SIsTZWwURRg6PN5pfK4fSDJxqGIViBAtPV9QIFkqOl7P7fQOU0+s1gg+OFJoKKCl97m0tnh7yykTFjRs5pPsOzIZrGQ4NrEC1e0EmM3TC+FTYiJn1o2+Qiw8y00H4NbVi8YyIzXvUIA0bHUBQLHf0PBHKVLyqGuXvO7ThevQ3Nqmo=
X-Forefront-PRVS: 0417A3FFD2
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR02MB1123;
	23:v8auP9Qjd8LBsrrB/qroTQ1sr1obgOUtOl9M1Ek32?=
	=?us-ascii?Q?uktCofLK+5ZSIFdz8xulzmvERSDNPiF7Mgpkt1FHSIyvHVy6lwvkfJWG5yZu?=
	=?us-ascii?Q?sRjpkb/AR7WIu1u9T0t2wzgrsavETPQDlxmYogm43s3tmW0rgVKPc//5ZMWQ?=
	=?us-ascii?Q?cZwOrnBN63NQIwt6NvX6LCWk6O/aFXXZA466DttwLZcBtNF6tZCCS8V2kvHQ?=
	=?us-ascii?Q?HwvGnDXgK7VhQabiMm+HqWkKhIxoqEpAT0qNj/EOL/X4t366PyiOIuDnMKRu?=
	=?us-ascii?Q?UD+/kc8SivdLYeIjmHF/vWAD/0+Cj6BUZ2Rk+VDrMlHQHb5TrrA1xutNwHdc?=
	=?us-ascii?Q?/it3edVzYMEerxLSiMZ3hz+Nr/8iEzRDLSN62b1Fn0SmufCxdXpznDvuddRf?=
	=?us-ascii?Q?vNDgDytUeu7y+/ZZDkQUqyHaTdrKFcNUkHdx377ffqyAUAA42ozRqaLPp/Ve?=
	=?us-ascii?Q?JF/K3LfUWDU6VvkAXdjCSKc/OrvfCLZRGgj0JFCHIyYhajiSgV8wG4NFwusA?=
	=?us-ascii?Q?fM0HRForEqYxI0YCdHdULnk18pc2l7Ve4ZF8o5JkvUW6qYECuE/ABY124Pw6?=
	=?us-ascii?Q?FWXZOA6IczNMgYXF1eH4krP4+ycxs3esQlnpXYNiPZK4AdpRw9NFyq1LN98b?=
	=?us-ascii?Q?5jcz3pSbI/haOA2hq4rvgcxyJhRP4/JUFngdELVWCQrEeF0CHBeEKztAYNAn?=
	=?us-ascii?Q?nvfijemrFUpqhWbcdmfPFjL0q70Rr6/wbwPrVmVwx43owaLHxXF0JUMc+ADM?=
	=?us-ascii?Q?mdBMznP2ciZoKuMotLhvWxbXCWMKxdP09U2zpq90RGMhaL8NcJnR6MJvBOBI?=
	=?us-ascii?Q?dbL8gC+JMSq/nAjxRiq4pI7RPjeGQIL8iYDuLT3Kk7HShGJis5N/QwriFNJQ?=
	=?us-ascii?Q?eJJ/Cosb4RlZ3Xi5CL2RYFt6Z32Z5DG2f+yKbBPgGDSsX6YvEiwa5EYRMo+v?=
	=?us-ascii?Q?1cEPgoHBoilS5SqiuUsXWIJjEmQ/FbD464uIARHMr/X0YRG7TlEIR7b1rpnp?=
	=?us-ascii?Q?JE=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1123;
	6:S+7RqP0liMS4etnC7vP80rsNNiYBF8M8m8AxGQgpK1ARZSKnu8UlFi5j4ndOzU3O+G5tY0VnLQ8HYFiw6dBdHFUDPPeoaep6jylXryeBRNa5d52XCVSsYdsi/OREe1fW6i77k77Bpv038GgSNWeaju84x1/dLpO6xoLptwuwjKriVfiMXqccPsFXZGkjURINWaMo0VEnyH3PpmS7O/AwOa6JltjvIn0P53lxDhQqekuVaoqdCnDomNbzwB7fgsesM0ILWOGiBG0k62qqWQYYv+xgolFgnmEgZjALd3ojD1gA1gaJEdvbo79w1dTpHtcB0orsMISX06Q9gFFAFxgNvg==;
	5:Wq8oEZ2ROMuFC6DF/JZnYB8iU8zazoIM9Irf5UysNZXBQDylSsWbtMs397447mgsz/osLrWAaCa5mMEqxWbG62XkFM5wvLT+N34E9EtiQkAt50aSgxZMBUPmPP80DD/9lK6Ha3hTXzC71b4BZuDRrg==;
	24:Q24R1rpBgI7lx10kZHYrpU1ooG5Ema2JeCVn+mg1gwNZoPeRM1/7rYZ2deW2M6kzwGC/TjRb/p/XCzY8BEjRi55peLqzoARjU6MqyLgnIoI=;
	7:TrhEJnY0F6ceEjm3s8ewV+0Sz/0HwV/PatFBx4dgaNq3gj/LcE9TOZZuDlbz82rX0f6ZpHxQWMM8JFy1dsrRSH2HTh1h4eMYaBS+QgmHOMOgPZfPLSqMnZfFo0JEVoKQmlDrBg54q4k5Xaeiu/wWnYkrxcGNGmncPdWIICf/58S+SEAnCOkkAWaWw6wojARS6ZKmd1eLCGeJR248NiBPTlvVX6T3sR5KjtBUBvWcPRQ=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2017 21:04:27.7372 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR02MB1123
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.42
Subject: [Qemu-devel] [PATCH v2 3/6] aarch64-softmmu.mak: Use an ARM
 specific config
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PjOpO5KHS9d0

In preperation for having an ARM and MicroBlaze ZynqMP machine let's
split out the current ARM specific config options.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 default-configs/aarch64-softmmu.mak | 1 +
 hw/arm/Makefile.objs                | 2 +-
 hw/display/Makefile.objs            | 2 +-
 hw/dma/Makefile.objs                | 2 +-
 4 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarch64-softmmu.mak
index 24494832cf..9ddccf855e 100644
--- a/default-configs/aarch64-softmmu.mak
+++ b/default-configs/aarch64-softmmu.mak
@@ -7,3 +7,4 @@ CONFIG_AUX=y
 CONFIG_DDC=y
 CONFIG_DPCD=y
 CONFIG_XLNX_ZYNQMP=y
+CONFIG_XLNX_ZYNQMP_ARM=y
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index a2e56ecaae..95daa67836 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -13,7 +13,7 @@ obj-y += omap1.o omap2.o strongarm.o
 obj-$(CONFIG_ALLWINNER_A10) += allwinner-a10.o cubieboard.o
 obj-$(CONFIG_RASPI) += bcm2835_peripherals.o bcm2836.o raspi.o
 obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
-obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp.o xlnx-ep108.o
+obj-$(CONFIG_XLNX_ZYNQMP_ARM) += xlnx-zynqmp.o xlnx-ep108.o
 obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
 obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
 obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
diff --git a/hw/display/Makefile.objs b/hw/display/Makefile.objs
index 551c050a6a..d3a4cb396e 100644
--- a/hw/display/Makefile.objs
+++ b/hw/display/Makefile.objs
@@ -40,4 +40,4 @@ virtio-gpu.o-libs += $(VIRGL_LIBS)
 virtio-gpu-3d.o-cflags := $(VIRGL_CFLAGS)
 virtio-gpu-3d.o-libs += $(VIRGL_LIBS)
 obj-$(CONFIG_DPCD) += dpcd.o
-obj-$(CONFIG_XLNX_ZYNQMP) += xlnx_dp.o
+obj-$(CONFIG_XLNX_ZYNQMP_ARM) += xlnx_dp.o
diff --git a/hw/dma/Makefile.objs b/hw/dma/Makefile.objs
index 087c8e6855..be98d5d3d8 100644
--- a/hw/dma/Makefile.objs
+++ b/hw/dma/Makefile.objs
@@ -9,7 +9,7 @@ common-obj-$(CONFIG_ZYNQ_DEVCFG) += xlnx-zynq-devcfg.o
 common-obj-$(CONFIG_ETRAXFS) += etraxfs_dma.o
 common-obj-$(CONFIG_STP2000) += sparc32_dma.o
 common-obj-$(CONFIG_SUN4M) += sun4m_iommu.o
-obj-$(CONFIG_XLNX_ZYNQMP) += xlnx_dpdma.o
+obj-$(CONFIG_XLNX_ZYNQMP_ARM) += xlnx_dpdma.o
 
 obj-$(CONFIG_OMAP) += omap_dma.o soc_dma.o
 obj-$(CONFIG_PXA2XX) += pxa2xx_dma.o
-- 
2.11.0

