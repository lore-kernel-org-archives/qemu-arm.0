Received: by 10.80.166.35 with SMTP id d32csp196481edc;
        Mon, 31 Oct 2016 08:22:25 -0700 (PDT)
X-Received: by 10.55.156.138 with SMTP id f132mr23938931qke.177.1477927345673;
        Mon, 31 Oct 2016 08:22:25 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n84si8560663qkn.163.2016.10.31.08.22.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 31 Oct 2016 08:22:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nokia.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=nokia.com
Received: from localhost ([::1]:36286 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c1EPp-0006Gz-1B
	for alex.bennee@linaro.org; Mon, 31 Oct 2016 11:22:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45607)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1c1ECL-0001Tf-P7
	for qemu-arm@nongnu.org; Mon, 31 Oct 2016 11:08:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1c1ECK-0004rI-PP
	for qemu-arm@nongnu.org; Mon, 31 Oct 2016 11:08:29 -0400
Received: from mail-db5eur01on0103.outbound.protection.outlook.com
	([104.47.2.103]:58341
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcin.krzeminski@nokia.com>)
	id 1c1ECF-0004pT-6s; Mon, 31 Oct 2016 11:08:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ODYyZfyFbzmKAwaVg1c0kOcyxAP89UFS7/0wfM1Fncs=;
	b=OMI4bhtZcnGOrGb7PeKz530ijj/hLOwET/tpdKLEWl7rKKFCM4prOUMkKbcVxUBflTJKTYKgMByvwvqjh9UelqzOi3H9iTCTSGqIxwkX2sPuai7HqlBn9dyHtmP1gsnCCjU43Tsmn9ALT+uhMO1EACMX6r45G1XPlfDzAyBgpRE=
Received: from HE1PR0701CA0009.eurprd07.prod.outlook.com (10.165.214.147) by
	DB6PR0701MB2790.eurprd07.prod.outlook.com (10.169.216.7) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.679.5; Mon, 31 Oct 2016 09:36:00 +0000
Received: from DB3FFO11FD045.protection.gbl (2a01:111:f400:7e04::181) by
	HE1PR0701CA0009.outlook.office365.com (2603:10a6:3:5::19) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.707.1 via Frontend Transport; Mon, 31 Oct 2016 09:36:00 +0000
Authentication-Results: spf=pass (sender IP is 131.228.2.240)
	smtp.mailfrom=nokia.com; nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org; dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
	131.228.2.240 as permitted sender) receiver=protection.outlook.com;
	client-ip=131.228.2.240; helo=fihe3nok0734.emea.nsn-net.net;
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.240) by
	DB3FFO11FD045.mail.protection.outlook.com (10.47.217.76) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.693.6 via Frontend Transport; Mon, 31 Oct 2016 09:36:00 +0000
Received: from fihe3nok0734.emea.nsn-net.net (localhost [127.0.0.1])
	by fihe3nok0734.emea.nsn-net.net (8.14.9/8.14.5) with ESMTP id
	u9V9ZrvI004120
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 31 Oct 2016 11:35:53 +0200
Received: from CNU418C7XK.nsn-intra.net ([10.154.154.85])
	by fihe3nok0734.emea.nsn-net.net (8.14.9/8.14.5) with ESMTP id
	u9V9Zr6j004117; Mon, 31 Oct 2016 11:35:53 +0200
X-HPESVCS-Source-Ip: 10.154.154.85
From: <marcin.krzeminski@nokia.com>
To: <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>
Date: Mon, 31 Oct 2016 10:35:53 +0100
Message-ID: <1477906553-5374-1-git-send-email-marcin.krzeminski@nokia.com>
X-Mailer: git-send-email 2.7.4
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:131.228.2.240; IPV:NLI; CTRY:FI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(2980300002)(438002)(189002)(199003)(2876002)(48376002)(36756003)(5003940100001)(229853001)(626004)(106466001)(4326007)(50466002)(33646002)(87936001)(305945005)(189998001)(11100500001)(2906002)(50226002)(586003)(86152002)(53416004)(81166006)(7846002)(8936002)(107886002)(68736007)(86362001)(5660300001)(77096005)(8676002)(47776003)(50986999)(97736004)(5001770100001)(92566002)(4001430100002)(356003)(19580405001)(19580395003)(81156014);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR0701MB2790;
	H:fihe3nok0734.emea.nsn-net.net; FPR:; SPF:Pass;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; DB3FFO11FD045;
	1:t9sfuhHJlsJguYC0IjwCQjLXichyTy8QWrQ6QEx+eZZuNo7kMU0+65gQKzcLBD6veT3xDHkT2BJEdzNzAKs9NA0dDFWNZjDhPTSJ9fF0cRitkm/0WDlQ0v/DK+sjjEYVHzilVtfou8HBudtcuXAbVCgGV6kXefKQbjkhNem/WVknrEJF3c8dbd/Op2ISll32C3dqbSghJYEd97M1O6P5EFv4enlDBMEONQrXXsPDhI8qi//c+ekPDLRARmgL3BhUksTnFPEMExW8xxPkKI+LryMw3koVP5mJGOzyxD/BTKoF6Vvrl4uDJzx6DKVXIpOPkBKoobntFXEueWqRofrklgoas3AYgJhnXxQJ/deSkVahFsFlIW4Z5dwjr0RR3XeH+BowPEC+bI4pXdq5UHdb40CVh+7QpArpdCe9u+3Koyo7Kv0JaPqhUbboxcuhx0BQ+uMH3v7XASQc78W7BpHoSdEgRCnyYwT2ZQRd5E5mpWUbgVDNyyN3Vx5cGgyWuCtD
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d224de8c-8f2b-45df-cd36-08d40171531a
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0701MB2790;
	2:9sZokOoOKlcLr5PiTCevMdXLdq3F4t2/H97XQ9mB5G7vdYXiXRXFzI37s0f7DlsTmk9fzM26t/utRQ0kdOdYTSADQPcZZ6w9+8i3udahIvlH9mZ6EK1wXzkSqz4a4TYvRMzRqiEOjt75skfl+WoOVcA8Ud+LFi/vTiZe5hG7esMboOHZwAObBddfc3e+u1cDhY7ruPL4A+JC5jFtAQJCAg==;
	3:Ob85sv86NiC0PUZGf8eNRDLCjrbNO9qmqLHpZvme5SqS4AoxV1p1URbYAo4PJD+ywSFPvqno0BSRbkwvY7Co65s65fANd+/dI8gJ24bURkZuCUqiugEiZtbvVnDgCWADZ64iqN8wTrU3v5rY12r0VzPwobr6btQ5TqDa1Wa9YBa3uCbRe3rU4eISUSFv4bppQqJ2hs9apNJxUYLfV1NEVTwXkwPsK/ayP1TtFZaNgoHUYiVreIjpiYSvHYIPeRTJQ237BzfaCKVXmAQjm/u+YpEDZknPyqiT8VDFgdi/pAc=
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:DB6PR0701MB2790; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0701MB2790;
	25:TMrAJHX6kB2PWAgCEWvVeTCuMe8UyPaVM/MXWNZRKBi3GclfBcU8cfOZ5Qso89NZcjQHqH/dnCpbplonaw+btn1uKTj5tHw2osMFN35nukhEr6KjDmvKwja49nf+NCAlqQvBKSz8V8yMwN+DWFw12zzuxI9u9H0l0C1sWkizMj5tuKg4BFEKDaWq0mHIRuhfW5xcl0cS57MIjq480ZAd/HEPjw09Igg3nzPtZLSgc5sRiw+DYlKlL8b9P53gf4DZxOwUOCr+bjOo0IiQEt/hMWAVzrnCdR7YE2KvRW4JX0aSASlRRlnke0REeKHMspeDT1+sN5wl6fqac+/dOrHuq6nTnuL8LMmHSksmP09dj7N/CqZ2hlyxZr0NyPjx3MNneqdg8rdCNOHdL1M4WTDY/eJ91cE+7VLq45/4ab/WDi8Jxt0zzzVlrIGT4Ai21GW1glpXqNmxU+g8OpDTCf0lirSrEtIkMIuiqrvAGzLXAR+rI/q5DWVtFd+BmJzf1sisrLVyiviuBh/8vYfs3hFznOf/MMBauaLOHtb08mLkkcpJs+7pAaYALj2yT8HtuQR/9ytWyaJtKR67frbKS1lbcHg454obFXHUgdomDXxR6D3gYwTnISVQPDKddW4RZLsjJAyZEgxAAex9uk7jVHgTkiDioVcy/HWDq6L1HT5qvmiYCNy0kv5dULQq0UkrI/QZUm1gP6H75OtcMjqlye+YBFDI6H72jCn869NDMccfennWc34ei/PBN7z18sIbxVBT
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0701MB2790;
	31:No1k2GON8KQg+sZEkq/1rXPGVa0KaydkSislnp0/B+pVlaQpt+pifBbd8MgjfBJM7Qh/9wMpggqbT++78paRQm/r5aei0Ms+XQoPhES2tRSKgh+fu6dbISko4+m1oRO0KoFTx/K3aZaKQHQfW/k9Tjr5UEdbXavNrpYoCSM3sVwkwC35HEri7rd7e1LdNzr0q94Lsqup4PyJrNxFrKXc/uAKXWr6HZy7TyCLZnpwqWj805+EwgSUswUUzaUN/QTljzToCbVtKF3QNd5XJ8oLMg==;
	20:rIG/n47DowurHCsmmFeCtljQalIHfW5PIXX65za095HEfb19vxyTo22Gm8wsJy2HaHoXBAp+W4Ao7DIHN2o/bl3b+ZBIbrudVfd7wR2jiTxsYYDP9K2TsbeCUw/uEq4C11O8EHtUBxF3UXyZDC3mPpMP7aSGf8AibkliTjIHxgqCNebVTyMXNMMkfOXsaAS9ginGV1zU3NGpIpkMpuXdl7mZEOI7nQb/4pQ1hEG5wPTg7NUYFlcL+LBUStZ0jXYmVahf9VIma5iAPigyp/5prvavLuXWI2uihZzszUZOPX++S+1LTnHkiofER6MOQEUzJaPUWABIWAVXNYJthzro22voufFO1y5AeUS5SInSAN84PMRX3Y2qAN4rBM4kehFGx8RJBNK5lAK2z8MZaQhXrvxBRC2IMJruigDoReCIfBDxvFLWGp+NNfrzuimei7kxvBKhYpnOlkkZJ0fenD0UyFQkMRxCibMa+TM0bjpVx/0eu8SFqoa0jV2zEg42NG+fCaQVxaKqY+gpsMGRtgJhQf+OYeNivfqKw3r3NNpai9OaOx5cq9mTLCvoWthOii2tAf7t9N6Syh0quilo4YDuuSL2KabnSixC+h5AVCM7qwM=
X-Microsoft-Antispam-PRVS: <DB6PR0701MB2790640383A11ED77A5CFB41FEAE0@DB6PR0701MB2790.eurprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(82608151540597);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(8121501046)(5005006)(13016025)(13018025)(10201501046)(3002001)(6055026);
	SRVR:DB6PR0701MB2790; BCL:0; PCL:0; RULEID:;
	SRVR:DB6PR0701MB2790; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0701MB2790;
	4:LlnECxacmvZrsZNufadJpssTcrKyzLte6nQMXnsnSrHd1iA9sl3S7nvPA+rC/FzyyTwA9AIDJTqtOrpTP52g1+RUv8aJtI5TYPrS0NSoVomc6Iv92OLbkgQRHv6R3+9A1GaTUPtuRHlP42jJtjGT4Hwv6cxX/aXCzIjjnf3iX6lyvbAtL5ZzRqOd8yzziQBby3sPwT/Q13TjDFAGdAlfdq1G+2xoPaAzRC0ovyvUIw9OTKU2js5NX+RN+RJYNidtsUjAtk/veWrEyrqrY9rprXRCfWHiLYQev3u0FJ3K/35OPsCPhToABfyJRAVk0ua9JUf7ujqkwSJX/EMyNHOfcJRsoHUtbVzy5qxvXNpmXL+1P75Sjk2N5dUetNfaTFEV6S1L+LMfOkWwE2mAiJwgdgNabI0x6ta4dm6rKQ1maL/t6SJjzUO6m2fDWGy1sBv7tK0B7LORcNRCsXWeI6bH2J5t9k2lmHeL9Z14sgspSArZ4SSKVNdWQs37Lpq7b/QV
X-Forefront-PRVS: 01128BA907
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB6PR0701MB2790;
	23:XfPS/Q37OPC6TQOdf6zvYDLRWBZKIl2+FLDfnA9?=
	=?us-ascii?Q?W+raT4iSWWuxIXyg0FBz7A5xqj5p/ihR97RwFBKPM4K28NsZePKWM2NS8S5r?=
	=?us-ascii?Q?7eSkNlwtt1VK0JCqNlDDmoIM3NzE+8mn3bJ8vmE/7f+bReVsIDELSR6mXt/j?=
	=?us-ascii?Q?ZFMQ/iVTZ+hSYSyvSKtCqou4d+jV/glisxHHtUvPp837uLiVCUlZRQFSQmbg?=
	=?us-ascii?Q?PZPS0+L6i5XzkKmx5wz0Md6ACKKLFFyF2b9F5oh0I54vwGSprZ60QqLyoBKU?=
	=?us-ascii?Q?UPdqvojboVlkagTpF//1mRflwa98eXrH0WqIDWyx1GU7Bto/fuGKk3HgfRuR?=
	=?us-ascii?Q?rMLvspY7r2SGaL33uG6CpWdONx3U+CvudfeCbE0u3LNurGiuN7tx9FZ20Piv?=
	=?us-ascii?Q?22JzYH+IktE+rX7ByqOejZMfn66Hy3QMqDF/zzk7AkyqO089YbEX9Wxeb0UY?=
	=?us-ascii?Q?BZ7QWfshT7h9E42kjOGmdwBdT8p/ZnO7Acr1hDaxw/BwmX1b3xPZyVz6DKD8?=
	=?us-ascii?Q?gYfVb4p6AH902eCXbWHCi9UNHB3Z2TRz9JKulAXkkfYh5QeGN+iTogRUlLqT?=
	=?us-ascii?Q?zKYCuqZofo68gopBImUA9cNCxWziKbuCHebXzCPbfUTyPBItmHDpHIN7nRC3?=
	=?us-ascii?Q?P+7kzcDo0mTaIdyxdiwyQWLOoVCet4QE1ARyv6si3jbabjl3j9zcpdtraR3V?=
	=?us-ascii?Q?mIBd+uDtqbOe6TgorU6D/3+ky21mnWMt6HhCj50zODyr5MRf3FVrDZgyCA6N?=
	=?us-ascii?Q?FMtvBlnAQdC4ecPgMI2UTrTtPuQbj4RbQ5ORLOKFbA7ItgGBlA/68sxCB5+A?=
	=?us-ascii?Q?3PGVlO1HkgruyVDAoKEQI7tNVWO6haOmcxjY1bTsyj6oSAp8WfldbEYXYsRO?=
	=?us-ascii?Q?p5HDTQWtcIkm6h2Z+ZCgu+IFBtH46X96RviGZs9EWl/nd79ET6DnpEcXer7y?=
	=?us-ascii?Q?NFAujVmDQ0iZJM8aUN1bj2FNnnm2vriv/hMPdJHf5tkRRulMYihl1ylZVs2M?=
	=?us-ascii?Q?nRW8/zsVE0TqvpDpT4JF4UW7W/5AoAn40cYhjHusJJdiooMqGHriNpbrckLY?=
	=?us-ascii?Q?0HFg76S2fJqFRQf9yhtXchGUECT594E0d46aEzhvk7MZmr3kM2U06XPwgsTx?=
	=?us-ascii?Q?fd4K/YsS9FQk=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0701MB2790;
	6:FP6KY02EYslb8TiYsTDGkSd6a9zNa2uZ5R1Zw5MANKCAMHpEo+xupPFskoCgMv0LqE5q+19tiYEhhaI+3dWzPTHB7qFqCEzE55+Pfg7fu0qzZhFPYuVJzxKzD+I7al05G7H7CqNmjFjBtqTPgaAZjsrTm11KxgrvvcXSHzt0uY0JQSf/u2EwtUM1rqPP3C19YHQ7HWKke3DaTvsnBVSY2zVvoyfy3TaGObmYlrG/s6puFmJTf+8d/t7IveCCrkf0WY+xZYjGwBhPQlIL4R0fKfn90z0+Jc3sV8xaDPnJvPEEucBCjOT6SgyV9tOdX2ZhMdox7twmjl+aHwRv97AIAyhoLLs7OAu7+iq0Uj2i6kQ=;
	5:z2S9Ck7CoHe6PJ1MRZi/VAp4OeegS7OviPkwvhJ8qWFZh7zsqQ4Eiw0Y8zKX+EVXPzUbczvJonkuT8EjutrKYY8V+0pbHSxDClr6TVwdjggA2VHYgVFghJXT7GMoCZkWCExvtSAzPAJyWqcunEGa2g==;
	24:sQbczQDTfNeRKA0IcT7kM2Nua/jKULjVn2uM56R6sq6tafyOtGz/JOHZKrAflQ4O0ACrD6w4aovU9vboGZIWSl6AwIzx9OMD1SWP98Bvkh8=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0701MB2790;
	7:1qwRwVVNVmfDR8GrC7CMjD7q625deF7hcrfJcfTZ0b0mRNxtpAh/VABL5froC/DXUxfUIFjlfwsHyDolQCk9WqeC+kojn2Ar632tl9QnFAwFfc08PcQVtKaY0bi5U3aMyhAJ5jZFCtBif6TRbEjrrnz8XOlDvsZPtjNk5hs8C6vXarZWOu5gTwC0mIsDOUmgj8y++nf0GOTtGgRlWJcAcs9sk65MKxXCar7sT7vQz4ACSlWNb9Lue/3aZkNBYcnm+1Z0rlByY0tc9LT545QzzQ+9KFahArdrjtAY9senjNgWR/foB/1kkky/cnW633J6h7Rp/ob9bbYnXlCR2QV/PmeJd+PBzhCmqem/sGkgPtk=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2016 09:36:00.1252 (UTC)
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;
	Ip=[131.228.2.240]; Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0701MB2790
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.103
Subject: [Qemu-arm] [v3] nvic: set pending status for not active interrupts
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
Cc: rfsw-patches@mlist.nokia.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9cacYOIERwU/

From: Marcin Krzeminski <marcin.krzeminski@nokia.com>

According to ARM DUI 0552A 4.2.10. NVIC set pending status
also for disabled interrupts. This patch adds possibility
to emulate this in Qemu.

Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
---
v3:
    - corrected logic to reflect NVIC behaviour
v2:
    - add a dedicated function for nvic
    - update complete_irq

 hw/intc/arm_gic.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index b30cc91..521aac3 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -156,6 +156,17 @@ static void gic_set_irq_11mpcore(GICState *s, int irq, int level,
     }
 }
 
+static void gic_set_irq_nvic(GICState *s, int irq, int level,
+                                 int cm, int target)
+{
+    if (level) {
+        GIC_SET_LEVEL(irq, cm);
+        GIC_SET_PENDING(irq, target);
+    } else {
+        GIC_CLEAR_LEVEL(irq, cm);
+    }
+}
+
 static void gic_set_irq_generic(GICState *s, int irq, int level,
                                 int cm, int target)
 {
@@ -201,8 +212,10 @@ static void gic_set_irq(void *opaque, int irq, int level)
         return;
     }
 
-    if (s->revision == REV_11MPCORE || s->revision == REV_NVIC) {
+    if (s->revision == REV_11MPCORE) {
         gic_set_irq_11mpcore(s, irq, level, cm, target);
+    } else if (s->revision == REV_NVIC) {
+        gic_set_irq_nvic(s, irq, level, cm, target);
     } else {
         gic_set_irq_generic(s, irq, level, cm, target);
     }
@@ -568,7 +581,7 @@ void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
         return; /* No active IRQ.  */
     }
 
-    if (s->revision == REV_11MPCORE || s->revision == REV_NVIC) {
+    if (s->revision == REV_11MPCORE) {
         /* Mark level triggered interrupts as pending if they are still
            raised.  */
         if (!GIC_TEST_EDGE_TRIGGER(irq) && GIC_TEST_ENABLED(irq, cm)
@@ -576,6 +589,11 @@ void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
             DPRINTF("Set %d pending mask %x\n", irq, cm);
             GIC_SET_PENDING(irq, cm);
         }
+    } else if (s->revision == REV_NVIC) {
+        if (GIC_TEST_LEVEL(irq, cm)) {
+            DPRINTF("Set nvic %d pending mask %x\n", irq, cm);
+            GIC_SET_PENDING(irq, cm);
+        }
     }
 
     group = gic_has_groups(s) && GIC_TEST_GROUP(irq, cm);
-- 
2.7.4

