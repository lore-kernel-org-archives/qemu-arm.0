Received: by 10.25.21.156 with SMTP id 28csp960683lfv;
        Thu, 28 Jul 2016 12:06:51 -0700 (PDT)
X-Received: by 10.200.37.252 with SMTP id f57mr61487764qtf.68.1469732811640;
        Thu, 28 Jul 2016 12:06:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v6si8963326qkl.213.2016.07.28.12.06.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 12:06:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55203 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSqdu-0007Hu-To
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 15:06:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bSqYQ-0002ko-Cw
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 15:01:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bSqYL-0001vD-6a
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 15:01:09 -0400
Received: from mail-sn1nam02on0061.outbound.protection.outlook.com
	([104.47.36.61]:59104
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSqYK-0001uv-SV; Thu, 28 Jul 2016 15:01:05 -0400
Received: from CY1NAM02FT007.eop-nam02.prod.protection.outlook.com
	(10.152.74.52) by CY1NAM02HT082.eop-nam02.prod.protection.outlook.com
	(10.152.75.216) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.549.5;
	Thu, 28 Jul 2016 19:01:02 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	CY1NAM02FT007.mail.protection.outlook.com (10.152.75.5) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.549.5
	via Frontend Transport; Thu, 28 Jul 2016 19:01:02 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:46903
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSqYH-0008JS-KU; Thu, 28 Jul 2016 12:01:01 -0700
Received: from [127.0.0.1] (port=52191 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSqYH-0007oW-I7; Thu, 28 Jul 2016 12:01:01 -0700
Received: from xsj-tvapsmtp02 (smtptest.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u6SIsFZD008162; Thu, 28 Jul 2016 11:54:16 -0700
Received: from [172.19.74.182] (port=55032 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSqYG-0007oH-Ru; Thu, 28 Jul 2016 12:01:00 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Thu, 28 Jul 2016 12:00:31 -0700
Message-ID: <b40d1b12d24be9f0ac5d72f86249103e0c1c720a.1469727764.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1469727764.git.alistair.francis@xilinx.com>
References: <cover.1469727764.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22478.005
X-TM-AS-Result: No--7.060-7.0-31-10
X-imss-scan-details: No--7.060-7.0-31-10
X-TMASE-MatchedRID: NqUYE3Jzbv8dsKV+lYHQBqOONuzwygtGmyqQJWNsukn/evmlVf9xZvp9
	YdWlfxDykKaVbA4S4D3c8+FPg1rJdhLmJd2F/yFu4pdq9sdj8LUSNRDlFTpYkvNhzIgXtFJVibw
	HCxoXFpesrpv7ZGx0TfmRngQJRUJwi9Om4SO4imTThGbP9qB93BPbyBtwZTa9RQ0dAChl/lwxBh
	Y3mcMkVIeOUtXkXvGMeTjw/FyRX6QfE8yM4pjsDwtuKBGekqUpI/NGWt0UYPBVxYUwfvqMpx67g
	4dLRmRnjb9Nq/BX8Ch617D4o5aohsdLFNEgDIsW
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(979002)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(81156014)(50986999)(85426001)(50226002)(76176999)(229853001)(48376002)(92566002)(8936002)(71366001)(8676002)(81166006)(189998001)(2906002)(4326007)(118296001)(11100500001)(5001770100001)(586003)(87936001)(305945005)(2950100001)(64026002)(50466002)(106466001)(5003940100001)(47776003)(19580405001)(77096005)(356003)(7846002)(7696003)(105606002)(36756003)(33646002)(19580395003)(9786002)(86362001)(107986001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1NAM02HT082; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT007;
	1:sySmV6PyTE0AovfWzFM/ColVMR3x82OR4zNfnAXs4OTp6FiYwhty/0/FC1xo7EaNTi2hIzMsKrSroMaMsL2eVGI9J94HEHYzkL9xLMtLA9eyFiJcfDgmGac5fihX1GlM2w6S+BtmCwdWA3m+ZuMVNho13iuhp+jyjf+3aDSdlTtKOG2zaMt8pDKVXaEoFC4hfXp1jMtj7HLvWS/p9G7nNVfLSrG8k5mqw3HGW/H+d0EjlWaGRHJ3nMrYLcmo4dT4vNAgM3glXDoix5sNaoGVCZ/TiOKvo8WbHx8MMamF1/NAp+dLADCiShXlYYU0463mqxyvIXeOpdxgV/uiYdNkCRZfS8qEWFLo0Sxd9/suM4XiR+WWzmn2F/GFqJ9topHzE7yVgeKDRt7Fu4ghozHYjPICcGjb7Yp7BGVK1raSQY8TWtDokqNHPx6rXDojTeUOz4A5dTmLXo7/nwsctES5DplI3QAu7DGYZ2rVpdfrG6VPWvEAQ6VJlj/FMcpknSYo0pqWvcNMRGX7rmc4hDmLNycH5cS76Nxtk4NphyCU7bggqpR9nWtVYUFTM0G7LqivSK4Mo2ib3U6eKnlDdkcyLH2z4OrGt5tTbJUE+Ap7hlI=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7d24a05b-f0cd-4eed-db1f-08d3b7198545
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT082;
	2:ODi6bBhSEXNRQCN/fEYATvb6U20ZF0i4h4+6iaCfCCf8xWpeMcscR5HfA9dmHw8JCcyCfMd16w6v2ts0YO15sliL2/1IMfnZihmYXmZ66rjq+jWoUR6NlVXjhzUmoge2HloDiYoTkRkLeETVWdR8F6vuGT6ow14zlkZUI7gIFB6YMd9xTJRr33H0JaxiqLLE;
	3:20g4gbzKq4L9HWtRrGuCwb2YDARpIOLeBpZrdCsRwSatKOgRU8Z9BzgkpvJb3fvC35BbkzZhnhShYV5RmSqgeLCE7+Yd6ITsYDKiXgaEhUE7OV4Y0tC3DlIJsnnBWRt6W2IauABz7ytSIz8BV9sWX8ToZoJ85ikhERbmQynbaSi4eex0R1xNEpF8OT0QuQ6RL2Uzq0pgXxyzh+JABYAw7zI1yPDHnd4MCj2BdGiVy3s=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1NAM02HT082;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT082;
	25:oVZXvcl7KUw8ZpJgzgm0boseqMNYPeJbiE4MuRAwWXCh5Kb3iWR744cNXUhojRqaVjgL+tfd4+mCJ6uFzpkjjPH+SzFpdO4aO1en+y0/0iOo/A+s5I8zKZoeklQOsP3wqfy0YgR9U31PAXz4UrtrN+ySqCqXhib6XIGELhlHuUB+3D902VJGLOPrSP94VooPpWvyRLV76OMaLI7VhGPlRJMskNNXaNZw6bNtLBSC7slZdtniH1U0tnK5xYl9sZ74DY1OGAlFb4VqV883R0pWtRlbO5Hsz/0/QN8EPZd/mMyAU9RMu5c+oiZgKzvE06+vrggioD+0S+1ZnZTJSBC00sY9IklCwuIo0O6eJb5NMOOZd42MnFSFBpLi1j6OmFOLOZ7tRyOfZl6kg6MYkZTL/pbf9bUIB6kEnyI/Gmf1L0R30HbJzpQjA3xaCl5g9vgijFxFyXP4bB6iomuXb7wXeRoj2sM/+QG0OPockxiH4zp4+Sutg8qmVExzjisMJMIzRs94j0sFW9maSG1qDBuAHF76c0ehp3WT+z2FrDr4i0oDFUA5rYnlcju8G9n69lNFnkPYB400yc3LUxL1FmgrQoJRdjg+xqhKeK6y77bdH0y8cCUBiJsHUNNbwDHyuDCIJks/m7fESNNLK9WCbDwbi01sZCCrSDZl+oHv0iDeZXP19C1WX7QKhySkFa+N3JqGrGEtm3MGVfFxBe5FY51RrIoXFXFHZvsIkQM2OzOL7QnC+Zv/uNeU8fgWupbEahRZGEJSMB6l+gAJoXDqlEwszzcWN+hBuTGXV2xAAv+P5+I=
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT082;
	31:Hywx6GwvVGpphrtnR3iauI/aX2VFP5hVO4CbW/xhVGevCTRHMSFwchqiqFeyIXixCaocW1ZKGiKuWyWK7M5LviieNr4hNgiPAZEpCM5iPoFQN39nYadvLnA8ji+rRWH2ENy5azAEdKqyCDsJ6dTRzTii0/ffXLt3YcZIN/Dadww0t5yXq5CXrwarnSIu/6VNM5pm9WSJlV4PA5VAZDLV/g5ftLlGbXWgNm46giizmRs=;
	20:dVtYw+WaNc83Bdjkpid/myEHaaOuBakPkD4/cXKoeGTr8tuMHe8j8ZfKu5W8J7x58JcVBlpVYmCrmxnPDPvgpizd3XSUvYKs38PFWw9nEbVMTlWiaI182deZTJllV2GlO6u4k7ngi8mEG0f6m3jk5NV9/AORJMlLgxyCdKX2IB/A/FP8q6lFptoGyCIH9RqWn9p7wXMIQ6CjQQpLZABd7no5tP7qPuZEc8H6cG8qqCCPuie9PliSiCwXIu3azIVVD8lAPhOVkdpgin/hlulJRKnhloTUStsP8y29VjvLnuisHGog7INTpZlSjJOl38AH6Pom8qZER8BB/1grbp/ZJJ0pLjLNbX/WV0SeV8TSQ5q9ote4oU2pGxZx2L/3CILm3uU3PH0C9sgA7AtaCp+sSop09F4x7oDbWyAZ1KBn3WAWhT4V+qpTQqCcS66ei+YglJy3BUeHPtb3BFeXyTUlWr6Yee9j9TXiV+rwzUPSfegVEE+lfTnMEAee1w8g4ZZL
X-Microsoft-Antispam-PRVS: <55b8985432dc4ccfabe5732a98f54422@CY1NAM02HT082.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(17755550239193);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040149)(601004)(2401047)(13024025)(13023025)(13015025)(13017025)(8121501046)(13018025)(5005006)(10201501046)(3002001)(6055026);
	SRVR:CY1NAM02HT082; BCL:0; PCL:0; RULEID:; SRVR:CY1NAM02HT082; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT082;
	4:Tg5yBHx7gM80W2n3+etVPJ83wEN58+tkRcrFMptHFHOIJKxz9IpBMMJTKPpqYW89LBuI506eglHhMAaptaGFfCe0b3fnh6PLZcTAWDuR93CZ7il8uIAz+ZjJbpV5JwcH0SyohQ7XzmPVjLnJMmyf8zQ5Mlnb8NJTgyR1t7NVFhYFEOH/NbAHq+hitWV65Js5LskRmk/b4SmXrUVnNxFJiVylnvgMK01du/7jd74Rb9cUW9h7+IeenKVZfIXYPcIUA4b+PN/oHbq5rz16xOUOPJuPTQcHVCKGQcVJ+Rbp/X88XnTxX5JvgALrk9EWJRtCJEVkhNayCkSouQd5vraT21J3kXCxbfwyUM9bIMtR3dW3Me4BTZZDpa0AuHqv2aPrFc7Y+nWLZ5t6xB1kP7Yo44VkwBhTTgADslr1k/edyKiwYoVwqmamuh6e4MLq4TUVZzBrJ3b1gHp4usOv+Ye4hhB06BKMw7hdSCFyGHu/BwIdZArMv3wbP7nD3S1M7ygo9UYgCGn+Kxie0eucZY7Aaa1q6STRUskcBZfMsg4C+3X5Wo/ZYZu9zBgJs94L+/DPmgcS6WIk6L9d/Rtpg3UyaQ==
X-Forefront-PRVS: 00179089FD
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1NAM02HT082;
	23:20JJB8e7CaAI/x/+ZBm36VBccAjoSKJcVNCVYHuNJ?=
	=?us-ascii?Q?DaKrRRyrPcV0Tm5zgbk2HBCXEgJddeTk+JmdFfSyudgmWlOJdutCpTEhqdAy?=
	=?us-ascii?Q?w+GSflOwoYLxv79w/2j4g5VJaDfnlHCTP2TUNDixKo+WEDyuYYZEwClTGwSN?=
	=?us-ascii?Q?3P30yGmogu/aL5Drjq73tcptus+AzR0T7NwktE2BUvoeCEtl5dPVT7Iwjlyi?=
	=?us-ascii?Q?E7zPCG8Jka+mKkGYtu4NWwzbfOyatIb2DDvuWeofsbcBx3wFm0of4G+216oe?=
	=?us-ascii?Q?aao2blkhf8eeoJZkPVwr/THjRM8PaqS6EhgwrhbuSKsMqk4FcDltmTbuOf5p?=
	=?us-ascii?Q?s14xaPMZjE5pgUvG2is0YANhb7GxAlgFkl/KApFSkWtZGmwlGZdQfiX9dtwZ?=
	=?us-ascii?Q?ixBTbvvdKTV2hgCsFGXEsg8GqrV+BRThPi65jz1yTNMzhdj5bCTWnovKuPrY?=
	=?us-ascii?Q?H6bJ65LiKDjtmULZ+Abth4385bGBtn9XeecJNUS/AowpoZrDeePGNp7GH0lo?=
	=?us-ascii?Q?Aoo4xAMlGUn1ZDGJDQj3Od9J6XZ0oXLjpD7eRRLWxVhL5pG9q8QjWlwUKKdL?=
	=?us-ascii?Q?OllYt60YCJjUJq549ENtjzsxUotgibdKJbbzSyCbF9+xyTqQ5C936LHRXdZH?=
	=?us-ascii?Q?lTfH3TEKsONCCg1C8x0wUgzDbR3Z6mVB1/gCZBGMM+NXKxk9+YeL3gxwstmH?=
	=?us-ascii?Q?B+gUcotpKcas1xOijbaauta0Y35MeBz5gcjBQK4t2jtriL1VY48rZ7uCRnjj?=
	=?us-ascii?Q?GpzbYT0bSvXhAYuL7JrOFgVQDgJuiSUPtgoGkznOykDYUvhBaCZau+Zykeyj?=
	=?us-ascii?Q?IjlIjVcaXUxkCsdy1FWsi8b0v2Dj14MVIXBou95fg6+iRfedm+PwVCfCqy3d?=
	=?us-ascii?Q?G6HGegvfVnHaQ4WwQbX/XupsGMFEz4g1AEOibUTKecxBW3SxZKREdhK2yxuy?=
	=?us-ascii?Q?1KVdJAooTNL+7C7T5C9srZtxQazBe696ineU+cpVvCpubB43U7kVe71VeCC6?=
	=?us-ascii?Q?pfwI1EuH+TfrsWNBfO6sQH6V+QGOz5f4L5+wJpTRdup5a6ZoWKmbdd5ynikz?=
	=?us-ascii?Q?OYc931mv4XqT0TVPnyyGUas9Fw53sAaR+tg1ujQn7areVotd6y8FjMPzqaqw?=
	=?us-ascii?Q?nr5MfkXOIm2vLbClBvuqHOymYx9bfW8BhU4YoOYIPQkBPDzrO5glCFXL6M0+?=
	=?us-ascii?Q?vmltF+Bt2SMHRQ25wSWPVYo9vYuXFVU2ee2f4rSSQZRoYQ17vKC/2fAVNMhn?=
	=?us-ascii?Q?CrXGmt/KI6zlbiZVLSyCUXnTfQAPvO1MGS8u+Sk?=
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT082;
	6:wkO+iz0DNTk0mV7cOUO0e6RthhN5jyO07B4ETzqva8JlyJE2hmsUqpVnWsqh+uL2ignv7oYahS5zNLLnG/YBlGftA3utoQsvG26nHMHDUH4uuxW7hVWDmpblVP5vc+5O+36P36i2vACFtgjrpiyse2IqxlMH9sjTtaOP82HA+je4FDFR88TmZBRFR0GigEwHO9RVRq/Ke36rYlnrehrJAReJL1dMb2MambuLPnqBxwWb0TAq0zWveae9i0zlrhfVJwInJt5SR1hyvzspjEYa+L9rTPh+FnpTh0iW8Zg/jUdAkkDqYgZrLFj9FiOcDNZrAaQboXkbX5FZVzQ03Va51Q==;
	5:yRO0XrS5o1Mpyx3Hqnh0pH3+6/2YOFTBATL6hm7y2vibZLoC7RZD4RqZr8OETvDjYyY8PrMmcNtqOvkBk5h8fKj5E0pc3aGvDC0Y0EU8Qw3jspas8Lw0IquSwfQxiU1GEaDWDBVbdHPl1P6pYu8wQQ==;
	24:1Ozmirw953vbMqo8kqQPvJ0MnARLAWx169fgqC61UeamZYbk1SoKxDeQhdu15UbqJdQqswIMdF/8gsqZlWWlg3B5j6DmMkR6t3+XfBoXA6w=;
	7:wHcTm4xXv5ntG+kx6hzRPvTgg+AwhP8Sur2n3wb5vg9tqaRKTDfpb7fDCDaqq7k9fc1g2fE4vMeecCbIkMNgRNjM1NzkJWYulolloR8V9yid+vmg4n6PkVOoGqL/2Eib8b/f4ARiWktsC/H/8myJJfZE2mLi56D8zuJCVTkfjdZiIpDSyx8Idd65yeUMdbYcPFTfHSfBPZrAFRosO5LohbGAIMqD4vgilsck4Kc6xxQce/CJjb0juUL5qcDZ70og
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2016 19:01:02.3791 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT082
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.61
Subject: [Qemu-arm] [PATCH for-2.8 v4 5/6] cadence_gem: Correct indentation
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
Cc: peter.maydell@linaro.org, crosthwaitepeter@gmail.com,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GtPY3sjyNdNl

Fix up the indentation inside the for loop that was introduced in the previous
patch. This commit is almost empty if viewed using 'git show -w', except for a
few changes that were required to avoid the 80 charecter line limit.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
V2:
 - Conform to 80 chareceter line limit
 - Improve commit message
 - Re-apply based on previous patches

 hw/net/cadence_gem.c | 197 ++++++++++++++++++++++++++-------------------------
 1 file changed, 101 insertions(+), 96 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index c46fff4..8618e7a 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1054,117 +1054,122 @@ static void gem_transmit(CadenceGEMState *s)
     total_bytes = 0;
 
     for (q = s->num_priority_queues - 1; q >= 0; q--) {
-    /* read current descriptor */
-    packet_desc_addr = s->tx_desc_addr[q];
-
-    DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
-    cpu_physical_memory_read(packet_desc_addr,
-                             (uint8_t *)desc, sizeof(desc));
-    /* Handle all descriptors owned by hardware */
-    while (tx_desc_get_used(desc) == 0) {
-
-        /* Do nothing if transmit is not enabled. */
-        if (!(s->regs[GEM_NWCTRL] & GEM_NWCTRL_TXENA)) {
-            return;
-        }
-        print_gem_tx_desc(desc, q);
-
-        /* The real hardware would eat this (and possibly crash).
-         * For QEMU let's lend a helping hand.
-         */
-        if ((tx_desc_get_buffer(desc) == 0) ||
-            (tx_desc_get_length(desc) == 0)) {
-            DB_PRINT("Invalid TX descriptor @ 0x%x\n",
-                     (unsigned)packet_desc_addr);
-            break;
-        }
-
-        if (tx_desc_get_length(desc) > sizeof(tx_packet) - (p - tx_packet)) {
-            DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x space 0x%x\n",
-                     (unsigned)packet_desc_addr,
-                     (unsigned)tx_desc_get_length(desc),
-                     sizeof(tx_packet) - (p - tx_packet));
-            break;
-        }
+        /* read current descriptor */
+        packet_desc_addr = s->tx_desc_addr[q];
 
-        /* Gather this fragment of the packet from "dma memory" to our contig.
-         * buffer.
-         */
-        cpu_physical_memory_read(tx_desc_get_buffer(desc), p,
-                                 tx_desc_get_length(desc));
-        p += tx_desc_get_length(desc);
-        total_bytes += tx_desc_get_length(desc);
+        DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
+        cpu_physical_memory_read(packet_desc_addr,
+                                 (uint8_t *)desc, sizeof(desc));
+        /* Handle all descriptors owned by hardware */
+        while (tx_desc_get_used(desc) == 0) {
 
-        /* Last descriptor for this packet; hand the whole thing off */
-        if (tx_desc_get_last(desc)) {
-            unsigned    desc_first[2];
+            /* Do nothing if transmit is not enabled. */
+            if (!(s->regs[GEM_NWCTRL] & GEM_NWCTRL_TXENA)) {
+                return;
+            }
+            print_gem_tx_desc(desc, q);
 
-            /* Modify the 1st descriptor of this packet to be owned by
-             * the processor.
+            /* The real hardware would eat this (and possibly crash).
+             * For QEMU let's lend a helping hand.
              */
-            cpu_physical_memory_read(s->tx_desc_addr[q], (uint8_t *)desc_first,
-                                     sizeof(desc_first));
-            tx_desc_set_used(desc_first);
-            cpu_physical_memory_write(s->tx_desc_addr[q], (uint8_t *)desc_first,
-                                      sizeof(desc_first));
-            /* Advance the hardware current descriptor past this packet */
-            if (tx_desc_get_wrap(desc)) {
-                s->tx_desc_addr[q] = s->regs[GEM_TXQBASE];
-            } else {
-                s->tx_desc_addr[q] = packet_desc_addr + 8;
+            if ((tx_desc_get_buffer(desc) == 0) ||
+                (tx_desc_get_length(desc) == 0)) {
+                DB_PRINT("Invalid TX descriptor @ 0x%x\n",
+                         (unsigned)packet_desc_addr);
+                break;
             }
-            DB_PRINT("TX descriptor next: 0x%08x\n", s->tx_desc_addr[q]);
-
-            s->regs[GEM_TXSTATUS] |= GEM_TXSTATUS_TXCMPL;
-            s->regs[GEM_ISR] |= GEM_INT_TXCMPL & ~(s->regs[GEM_IMR]);
 
-            /* Update queue interrupt status */
-            if (s->num_priority_queues > 1) {
-                s->regs[GEM_INT_Q1_STATUS + q] |=
-                        GEM_INT_TXCMPL & ~(s->regs[GEM_INT_Q1_MASK + q]);
+            if (tx_desc_get_length(desc) > sizeof(tx_packet) -
+                                               (p - tx_packet)) {
+                DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x space " \
+                         "0x%x\n", (unsigned)packet_desc_addr,
+                         (unsigned)tx_desc_get_length(desc),
+                         sizeof(tx_packet) - (p - tx_packet));
+                break;
             }
 
-            /* Handle interrupt consequences */
-            gem_update_int_status(s);
-
-            /* Is checksum offload enabled? */
-            if (s->regs[GEM_DMACFG] & GEM_DMACFG_TXCSUM_OFFL) {
-                net_checksum_calculate(tx_packet, total_bytes);
+            /* Gather this fragment of the packet from "dma memory" to our
+             * contig buffer.
+             */
+            cpu_physical_memory_read(tx_desc_get_buffer(desc), p,
+                                     tx_desc_get_length(desc));
+            p += tx_desc_get_length(desc);
+            total_bytes += tx_desc_get_length(desc);
+
+            /* Last descriptor for this packet; hand the whole thing off */
+            if (tx_desc_get_last(desc)) {
+                unsigned    desc_first[2];
+
+                /* Modify the 1st descriptor of this packet to be owned by
+                 * the processor.
+                 */
+                cpu_physical_memory_read(s->tx_desc_addr[q],
+                                         (uint8_t *)desc_first,
+                                         sizeof(desc_first));
+                tx_desc_set_used(desc_first);
+                cpu_physical_memory_write(s->tx_desc_addr[q],
+                                          (uint8_t *)desc_first,
+                                          sizeof(desc_first));
+                /* Advance the hardware current descriptor past this packet */
+                if (tx_desc_get_wrap(desc)) {
+                    s->tx_desc_addr[q] = s->regs[GEM_TXQBASE];
+                } else {
+                    s->tx_desc_addr[q] = packet_desc_addr + 8;
+                }
+                DB_PRINT("TX descriptor next: 0x%08x\n", s->tx_desc_addr[q]);
+
+                s->regs[GEM_TXSTATUS] |= GEM_TXSTATUS_TXCMPL;
+                s->regs[GEM_ISR] |= GEM_INT_TXCMPL & ~(s->regs[GEM_IMR]);
+
+                /* Update queue interrupt status */
+                if (s->num_priority_queues > 1) {
+                    s->regs[GEM_INT_Q1_STATUS + q] |=
+                            GEM_INT_TXCMPL & ~(s->regs[GEM_INT_Q1_MASK + q]);
+                }
+
+                /* Handle interrupt consequences */
+                gem_update_int_status(s);
+
+                /* Is checksum offload enabled? */
+                if (s->regs[GEM_DMACFG] & GEM_DMACFG_TXCSUM_OFFL) {
+                    net_checksum_calculate(tx_packet, total_bytes);
+                }
+
+                /* Update MAC statistics */
+                gem_transmit_updatestats(s, tx_packet, total_bytes);
+
+                /* Send the packet somewhere */
+                if (s->phy_loop || (s->regs[GEM_NWCTRL] &
+                                    GEM_NWCTRL_LOCALLOOP)) {
+                    gem_receive(qemu_get_queue(s->nic), tx_packet,
+                                total_bytes);
+                } else {
+                    qemu_send_packet(qemu_get_queue(s->nic), tx_packet,
+                                     total_bytes);
+                }
+
+                /* Prepare for next packet */
+                p = tx_packet;
+                total_bytes = 0;
             }
 
-            /* Update MAC statistics */
-            gem_transmit_updatestats(s, tx_packet, total_bytes);
-
-            /* Send the packet somewhere */
-            if (s->phy_loop || (s->regs[GEM_NWCTRL] & GEM_NWCTRL_LOCALLOOP)) {
-                gem_receive(qemu_get_queue(s->nic), tx_packet, total_bytes);
+            /* read next descriptor */
+            if (tx_desc_get_wrap(desc)) {
+                tx_desc_set_last(desc);
+                packet_desc_addr = s->regs[GEM_TXQBASE];
             } else {
-                qemu_send_packet(qemu_get_queue(s->nic), tx_packet,
-                                 total_bytes);
+                packet_desc_addr += 8;
             }
-
-            /* Prepare for next packet */
-            p = tx_packet;
-            total_bytes = 0;
+            DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
+            cpu_physical_memory_read(packet_desc_addr,
+                                     (uint8_t *)desc, sizeof(desc));
         }
 
-        /* read next descriptor */
-        if (tx_desc_get_wrap(desc)) {
-            tx_desc_set_last(desc);
-            packet_desc_addr = s->regs[GEM_TXQBASE];
-        } else {
-            packet_desc_addr += 8;
+        if (tx_desc_get_used(desc)) {
+            s->regs[GEM_TXSTATUS] |= GEM_TXSTATUS_USED;
+            s->regs[GEM_ISR] |= GEM_INT_TXUSED & ~(s->regs[GEM_IMR]);
+            gem_update_int_status(s);
         }
-        DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
-        cpu_physical_memory_read(packet_desc_addr,
-                                 (uint8_t *)desc, sizeof(desc));
-    }
-
-    if (tx_desc_get_used(desc)) {
-        s->regs[GEM_TXSTATUS] |= GEM_TXSTATUS_USED;
-        s->regs[GEM_ISR] |= GEM_INT_TXUSED & ~(s->regs[GEM_IMR]);
-        gem_update_int_status(s);
-    }
     }
 }
 
-- 
2.7.4

