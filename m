Received: by 10.25.205.13 with SMTP id d13csp11476273lfg;
        Mon, 9 Jan 2017 04:43:30 -0800 (PST)
X-Received: by 10.200.54.247 with SMTP id b52mr10048050qtc.124.1483965809950;
        Mon, 09 Jan 2017 04:43:29 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q3si48690661qkd.22.2017.01.09.04.43.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jan 2017 04:43:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39295 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cQZIN-0004ui-2f
	for alex.bennee@linaro.org; Mon, 09 Jan 2017 07:43:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48088)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1cQZII-0004sv-0z
	for qemu-arm@nongnu.org; Mon, 09 Jan 2017 07:43:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1cQZIG-0006Sa-Lo
	for qemu-arm@nongnu.org; Mon, 09 Jan 2017 07:43:22 -0500
Received: from mail-dm3nam03on0056.outbound.protection.outlook.com
	([104.47.41.56]:37856
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1cQZI9-0006QP-Id; Mon, 09 Jan 2017 07:43:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=7Ikmv3NcR1A77oAAgVjiaXWyKSMujAbdOvXpoz/hgt4=;
	b=TzE99z6MLWqXDt1K9NUnTlVnX7mxFYblkjbr3maQxxTGJ3m8PBhkx2OZraqKRhR5Q5o5p3rZxyVxbo3kNoV/R8sHuBTqTF/ibppbIB4XfjuGa5TtPu+61Ohw9UhN/3CXZYalm6EFqx0GDxZXmbfHcapqdG/piGQp10quZHt74+M=
Received: from BY2PR02CA0027.namprd02.prod.outlook.com (10.141.216.17) by
	BY2PR0201MB0760.namprd02.prod.outlook.com (10.160.125.13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.829.7; Mon, 9 Jan 2017 11:10:09 +0000
Received: from BL2NAM02FT019.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::208) by BY2PR02CA0027.outlook.office365.com
	(2a01:111:e400:2c40::17) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.829.7 via
	Frontend Transport; Mon, 9 Jan 2017 11:10:08 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT019.mail.protection.outlook.com (10.152.77.166) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.803.8
	via Frontend Transport; Mon, 9 Jan 2017 11:10:08 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1cQXq2-0006xM-Uq; Mon, 09 Jan 2017 03:10:06 -0800
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1cQXq2-00079U-Le; Mon, 09 Jan 2017 03:10:06 -0800
Received: from [172.19.5.101] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1cQXq0-00076j-Rw; Mon, 09 Jan 2017 03:10:05 -0800
Date: Mon, 9 Jan 2017 12:10:04 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Marcin Krzeminski <mar.krzeminski@gmail.com>
Message-ID: <20170109111004.GH14990@toto>
References: <20170108083854.5006-1-mar.krzeminski@gmail.com>
	<20170108083854.5006-3-mar.krzeminski@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20170108083854.5006-3-mar.krzeminski@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22812.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(39860400002)(39840400002)(39410400002)(39450400003)(39850400002)(2980300002)(438002)(189002)(24454002)(199003)(8936002)(9786002)(50466002)(305945005)(626004)(5660300001)(4001350100001)(6916009)(2950100002)(2906002)(1076002)(4326007)(189998001)(9686003)(23726003)(33716001)(97756001)(57986006)(63266004)(54356999)(76176999)(106466001)(8676002)(76506005)(46406003)(81156014)(356003)(110136003)(38730400001)(81166006)(83506001)(92566002)(33656002)(229853002)(50986999)(47776003)(77096006)(39060400001)(54906002)(18370500001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR0201MB0760;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT019;
	1:tDsAGsgijzKzDdsh6P89q+QlaYl0APPvYnouRKoxpOEZkFC6/BnrAHG7B5Qn9uTHUt9hvWIJiVoliHdXXKA4zNXH/I3/66GCXPPBCh0NoZQ7bbNUX2HGIyYuLNp2OurV80JQc9QiUp1xUUeoO76Se25PR5enM1sHr+Q2oRPjLz06A4w7Zrz9LMgw02EZYnaiF79guJl1mziIfOrZ7WO6gH+CGx+XBkCJhuT4xWmj16R2KT6tyhq1soL/2+o7qUk3Nibk3rDdgkP16Q2Uf5Vp1wUrMtIgcOBRg0opoD6Pfa3YacPWzb6OPqr3/h2kF4gMOUCKsvLFYYPtT+ddnlXJKV2rjEgnGkSO4gHAa6SfM5stTs+vUQ4MNtNxrszPkusqPC1TxXmAF/upP3yXAy6i3niSbFs+qth8C5bm9NP203KoIh6T7mCZ3JgL1v+S0InwE0IiFWg5gGssn0yt18jB4Uye5f3hIFbmjETB5ggB2UaKrfuFIyRvEIJhxHp8HK3ymc5IC3xlNHRhYjneDZj72gztj8rKSrbeB2n8YpNZ7xo=
X-MS-Office365-Filtering-Correlation-Id: 5d3ecd87-f1f9-43fc-ccdf-08d438801287
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(8251501002);
	SRVR:BY2PR0201MB0760; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB0760;
	3:hWI9Njv8Aw88FUPCG7CxVvzPKMUpcvxn3C96alaD5qqpa7zOMegAKDCwWZy6MCf7ROaZmso0dGQxMLAzSRluGpC7PgUJ1S0ZxVK5hCvFZ/LZhzlk06UOeMMKI/j7hjNGlJrtjwRzyXdeTuM8LX2ovfjWK/VKRQX8X8wVlgTAvoGyEsSatF7M3qvMu2Ql2nZufq6hvTlt5lirWmNt3NDZeScvoqU1zXDqBRlR1KvDpNjr+W6KcVXIqzqQDcmq4/2Djcm++q60/I6QbUdkB1l2B+o6EnroCv5tjGi0yIWmrQDK2FHXU03jqrkpTKEkuq4ybvS6y8yPuIrsSrCxqcbuSdi5HqvHwOUOGtFjEuFUnBj7fXa0xTUCZ0bJUD4jahOkJNujfJuQja/2PvOeAujqTQ==;
	25:PGjFwFEZIpyW3/jmfEJ4MOpW9T5ei4MxWgBPu2XDV9f4CbL+UK23jbqSsJgLG7Bk+oSeTqm6oj1xHT9DGXZP2+Bsa2avMKFpUv1M2N/ha7lylnq83WyH9qo8vhIip+IZcDjjyEXWCVHSE0wS8oJe1mBG759RMT5TjBGNAI2Z1/1SKjpgM97aHUnJxkn8wlGoqyRT1UpuW40ZEweCxaUoDNn5ret3R8t4v8OhPxYY7DHyzuexJ9UzF0GjhaA0edvE407TFJuahI2SWIaGwbZ5E/tOmuZovv6/zLsS51kkE+Piz7NHkKVYEOfzOHJbQon8Se0FXeXuFY0ufGphK7RIgrv6zYonWF08HWuUUMiQINkc04yZw0kfhIrdjbJlHkTKjHL3HCKYL7Vctf+zyqKD7f8xBMr84lgHFmDPikEDtPLHeGEpMIltrXUeJoLA6ryoG15PflGsshkOwb4l1FIIAw==
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB0760;
	31:sywzZ3K4MCOMRv2ewzhY+uSsiJgIBtwWTzeSLFzs53UF2vLQaVJ6LarO2mzcU1+fxibHTKVdthADkGUWnIz/2GN5xcgWzlBxW02vpWG7neu7cAN6Qb9cYHXjXnfSuVCk9do1+Q00oKqOrxTZM9cDjvq2RF3AVAeploauKtOmwugEO98Qr/Cdufbgy1JhsM22SpjkG+ETRKcVgYrZWtPl7IIqu5V3fo1v8EUQtxRSX46IdV2bty3jl5nW/6ZjPz9+wZpqpm+mW3qVCbmLEEbQ5w==;
	20:QIRV3OktBlckC9GntKJa2ZLQdXJVAJZtpWen+mIzbrE+vs5z8BeVf8vD5VLyV5AlQjgsUJ5brGBnJulpuQo0WP70KN/ckoth4tY+2JE+ixeFxXOBoCcZOoqCAeouuJV2TFhxDllvViEc/hRCUnSbEMd6yOQfhfi6RE45cxJCb+0gGbrz6YIG4uVJtVddNm6ywv/wnEk47k8C3Dkgla61WFSuQe6Vkxvwu86n+M3MdEl+2lPKa92NW9nJwXy/jv4fdk97nfplKmYdl13u7QTqUK20xHqg2GKCTUlhPZMixu98yI7wJcMo4jX1a/YmFaRfChnXDcI5BPqeXkzqbIrkVJ1Bd6F2pq0EBEXSYZ0psgy53hrSyMUgsm5cF1r1fVH/0c94vFlU6xbNkyQuA3rzEx4FLnqe8lK2XxT2M8pNP7s5ao4Cin9FjKj5QUuB2ydMXEVYaEA5HOHw4R5PdenhfGRBz9iPrrXsTTJ8LPTHyAFdf029QhU9LqZB6MHH/sT7
X-Microsoft-Antispam-PRVS: <BY2PR0201MB07607C56063AE74B16E396A4AB640@BY2PR0201MB0760.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(13015025)(13017025)(13023025)(13024025)(13018025)(5005006)(8121501046)(3002001)(10201501046)(6055026)(6041248)(20161123560025)(20161123558021)(20161123555025)(20161123562025)(20161123564025)(6072148);
	SRVR:BY2PR0201MB0760; BCL:0; PCL:0; RULEID:;
	SRVR:BY2PR0201MB0760; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB0760;
	4:eKnjBo916Yg+o9VWZH+Hz0QTSD/CewnVsRFAQYXPdEbssc6BHP4uOy7M2tYp7caGjsEuoLbQNmEqCAwoGOyLMESr3/8bKXFYasnNSHh/IfUjuGWY3FoYXz8fCil9obItZ10/qNGLBQQWl8VVDiPg6SXFYVIz9nrCLWoQu6SYKIhTMfzQlWAnmeoaqz6SSxEv/aPExwIDfzUSUs6O5lgEpOBAeX0oIY76FiaXWBd48BSd1eBvXDS6D8O/87FDvMY8JtghJ0iabrfoE1zVJ53wufczVHlmfjycxBBo9wpU6+pQqfMhvHBaIPphpyGQ1Od6GPmUPqSeXqLCXUSQ+H1q4iTc2O3ONG8frw+N2nj9zX07O+jnldGuspjPdMCP0C7tk2lV+uCCsALL0PV7TPrVm2ZrIEH0Gt9jrj/qRVu3qlaJsJjYApmbz7mZurbE+0DDU5CzYPoC1Z9SbJ2Bd3cWtqq5LuSweYsnsZv8dgcvd5Ih0Sj8y7QZAJjDXk2z3fXpFHo98SJyKq01RfF34Q0VY/Dn/eskWGG0OhdSWjs1emfiJUilumhXwZ6r1Zr9leu5BRw9t92VvQz0KGUZGE8kgdQRuhsPKpoR2PiTIlOgB2Iseb/tfH9pr9/KF41sQX54fwHo54kVx3IB3JWujpZnup38T9YWCNdr4db/oA7L34TdVHOCtpaajavezk0roPjOhgCR4rH6XhT3hOhIDBNf/U6EZJxKb55a7UDwVcGO0+MrLMKa1wNzWnkPYJsMlTSyJJVpzpQ8ShRag24SzrvOz+TlPE3+zqQjgzZILrpnPxg=
X-Forefront-PRVS: 0182DBBB05
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR0201MB0760;
	23:qeJBHWKVxN7iUE6WNgWcNgZLFW9lKYogArsXu5g?=
	=?us-ascii?Q?aWZCBZTsJRMJDEwIt4tE95gi4PdcWVqvg4O9GI3ZKwce4Jhqwzt2/nq4N0M+?=
	=?us-ascii?Q?gYXyrjceV3XbVpgSDzTqwTWos65BLfsRdxwKBBBXtRIu09CPoq5QfW56aBoX?=
	=?us-ascii?Q?z0Tra9tPl2tY8YLPPE8aCSnqbiwQ/m5PAuRFGVJuw+FWqn5l+aSKeGEMIBZL?=
	=?us-ascii?Q?pT7P6BxxsnR85UW8iCG5UmZCjYN3me4x1E0RJXzvbkLRhxtwLZG7the4FZXQ?=
	=?us-ascii?Q?Jeq3Pj3SHRhsvrht3+hkqnfDYE8LfuujGJzr7Rvj0Il2XtdI73e2Mqr4zzUB?=
	=?us-ascii?Q?Ri5sBOtFU1z9cPkaINKeITKLUOuJYRBe+hmtIpFcTM7EIvhBWYtC8drJm8zt?=
	=?us-ascii?Q?qvSDwnEwxaPvvAY0TO/bZAJNU8j9hvjZhTbBK6DEefZ3qw8jhIU34sx6WvJK?=
	=?us-ascii?Q?bnPeymoVla4nKvHAm1JgAl8HreEMcztKFfSRnlAIddd0HqviS6aJhZXfSGnZ?=
	=?us-ascii?Q?UcK7pLoz3neUB5fOqgi+BEIWR64KMpTQBxPrgANekVs6Mjo92KTde9ETnUzc?=
	=?us-ascii?Q?3/7Kpg2S1Mp3C5rsXGTRYR7NmNXdYeyJDTSxoJSLJRFzmpALQ+yEYv+QVLta?=
	=?us-ascii?Q?dDhc2EXEjEjlqfz7eolP6jPuEVRXYQaPCtWYrCfRQeeoRFN+I0i7yqHsvRUo?=
	=?us-ascii?Q?GhGF7Owtbp/j4EGyZW6Kj3/Bfc4rwmKxl64LMvBA/NwthUIC5DMWIm0SgVtL?=
	=?us-ascii?Q?HZ0DcLQJbbjIQwByB+VoeqotbxRhqSY9l9zBkzNoAXRnGrqqd/wcgscpTXlz?=
	=?us-ascii?Q?ODNXBOnAkc/RsXRA4Dfhm4xiK0b2zKNSNVsCLaQO2lLkpE+RivxPGzFt/Wxj?=
	=?us-ascii?Q?N34lj7kr2q6U1pT1Lb50YOPoA8odo5qFi46Zp8H3Kal7urAWIiRobImve9Lt?=
	=?us-ascii?Q?IOpRExXK+iRJSTsKyROehbX+zrqTcdZelMC1L5zlm2OpKhkzlQjcZhYBTZBf?=
	=?us-ascii?Q?zjmBP4J/VdKpIvDgonPZ64yvPg6Uc8TEvHY13MOYCViLjWHdHHsPhMWmnfSK?=
	=?us-ascii?Q?YZBq4nfqaK/DB7h+Vex+LNqZQQxLgLre2yCvIGPc4R1EF+Oin7vJPosLhkdZ?=
	=?us-ascii?Q?WTfjNBgZWqab1QltfedpntdsA2Osu3GIYvJ4O7F7EcDO12PoOxZBBvuet25U?=
	=?us-ascii?Q?cSzr3NjS94nEfw53diYXZlCRy8EpaCUZCV7jOs+RMt3JV2ZnHV55/RgwCO/O?=
	=?us-ascii?Q?hPBN8aYx4qmqBahawUE8S/rQuq0x7a4mwRbOm/Xr5sBLdDVeMDG/ZEuYmNNd?=
	=?us-ascii?Q?zeg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB0760;
	6:p6YIN90ie0dW3dB10PidbZXPR3KAUwzrq4iD8PKpn5OrigeHfKmCsalSRJw/lfsTHzu6hHuK4KbjgI8LdFt1+t0oG27TWElIDZFm6LGObsmfVFv1bHUxEz/vT19BKCMpmLxE+jL0KgEe3DQk708d0DJVDRqOsMxWO+j+9zQ0F7t7jwko4xO2Cd6AMgQHhkSCUQxTriDIdAwQcFNQrXSRjBwsT19bpCGBEQtE26FEO/EW0sp8f32fpYpdcVOg53BMf5nA/O+Z9JECVoiPVxsSaDPf2hSJ/Tv3DnVeqdWZXR+dthdiWtp3Z1azg2hXFs3vzkfKgxOeH/UlWXXyDIr0dh5hMnhlFAwhMtVDjQqp5YqslXuQ9e+SRYmCF/TgIL+M1mK8T4On2TUmtczSnh8Ll8d3nteTYPX5KWYPJt7q5Fr41vt7nIv7ZiAIbgks2u6JPqdluLTvCZ0jJbbnaHF3Zw==;
	5:rG/+TMHMSvVUM6xJCV5fG0k3lce6/3N63n3HKYjavogevh+9KsHTPkcdWzqtvqBI/CQ70DTwLFO6alNIVbE1+p+P3vDuFXtc+Nas4YZJGh8J9QiG/nI5IFY4CYcOfxMnexXfWxe/w7DWaf/GZxW2sw==;
	24:yA2TRD1sD/CJtsNoQXvmWRcUoUexd07WuW9DOQb5z50RfWALC4rVVhWivKbS/3p3pe5O+qQtf0S4hGOOEfD8gcjgljS73V8/pZonh3dVOGg=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB0760;
	7:Ii+tfNGakGzzR0K2o1HeVf7JTMhhjCphOOh8uJcF04Wn0palZddJte62K8yIR7z+qBwVUXnF3RBC1GPyO0imNZ4Sl2Upno4IqsrSqnyDcII0McpW/V+wNHJX7FbzlGTFhkTEmxSB8l2bt87Au1uy+g+l69C53tsCufoVhO6EqdPu1dYIrEyrbTBaVazGkRMB4jI3QtEBnACBy9Eaw6Ac6AUXT6fQvd7ezb+gIka3EXXFPA2OPTtG9wF5VFiwdelT+sznW1j4qp2QZt1wH9x7Y8Fld+GJHc8yqCU0a29mGRxGAWrj1FfqBV3pRyfaWI12MrOV4JVA8avg6jEwbV5Kj/eH/k5pKcHZnfbF8frPH6lqBNtnbkCfIB+o8l5/2fdQg5IqJnRCXiX8iYEjfi81HtjCVPQVBdSg68VUz+007+YHHFMS6UW/8kISZETGPNHw1odAmOVPJBIMZ6tCSJR4hQ==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2017 11:10:08.1287 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR0201MB0760
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.41.56
Subject: Re: [Qemu-arm] [PATCH v3 2/3] block: m25p80: Introduce die erase
 command
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vr6QRmrBcQdO

On Sun, Jan 08, 2017 at 09:38:53AM +0100, Marcin Krzeminski wrote:
> Modern big flash nor devices consist from more than one die.
> Some of them do not support chip erase and instead have die
> erase command that can erase one die only. This commit adds
> possibility to define number of dies in the chip and adds
> support for die erase command. Nor flash model is not strict
> thus option to disable chip eras was not added.
                                 ^^
                              erase

The commit message could be improved but codewise this looks
good to me:

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Marcin Krzeminski <mar.krzeminski@gmail.com>
> ---
>  hw/block/m25p80.c | 41 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 6dff81b..a9b025b 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -73,6 +73,12 @@ typedef struct FlashPartInfo {
>      uint32_t n_sectors;
>      uint32_t page_size;
>      uint16_t flags;
> +    /*
> +     * Big sized spi nor are often stacked devices, thus sometime
> +     * replace chip erase with die erase.
> +     * This field inform how many die is in the chip.
> +     */
> +    uint8_t die_cnt;
>  } FlashPartInfo;
>  
>  /* adapted from linux */
> @@ -90,7 +96,8 @@ typedef struct FlashPartInfo {
>      .sector_size = (_sector_size),\
>      .n_sectors = (_n_sectors),\
>      .page_size = 256,\
> -    .flags = (_flags),
> +    .flags = (_flags),\
> +    .die_cnt = 0
>  
>  #define INFO6(_part_name, _jedec_id, _ext_id, _sector_size, _n_sectors, _flags)\
>      .part_name = _part_name,\
> @@ -107,6 +114,24 @@ typedef struct FlashPartInfo {
>      .n_sectors = (_n_sectors),\
>      .page_size = 256,\
>      .flags = (_flags),\
> +    .die_cnt = 0
> +
> +#define INFO_STACKED(_part_name, _jedec_id, _ext_id, _sector_size, _n_sectors,\
> +                    _flags, _die_cnt)\
> +    .part_name = _part_name,\
> +    .id = {\
> +        ((_jedec_id) >> 16) & 0xff,\
> +        ((_jedec_id) >> 8) & 0xff,\
> +        (_jedec_id) & 0xff,\
> +        ((_ext_id) >> 8) & 0xff,\
> +        (_ext_id) & 0xff,\
> +          },\
> +    .id_len = (!(_jedec_id) ? 0 : (3 + ((_ext_id) ? 2 : 0))),\
> +    .sector_size = (_sector_size),\
> +    .n_sectors = (_n_sectors),\
> +    .page_size = 256,\
> +    .flags = (_flags),\
> +    .die_cnt = _die_cnt
>  
>  #define JEDEC_NUMONYX 0x20
>  #define JEDEC_WINBOND 0xEF
> @@ -359,6 +384,8 @@ typedef enum {
>  
>      REVCR = 0x65,
>      WEVCR = 0x61,
> +
> +    DIE_ERASE = 0xC4,
>  } FlashCMD;
>  
>  typedef enum {
> @@ -514,6 +541,16 @@ static void flash_erase(Flash *s, int offset, FlashCMD cmd)
>      case BULK_ERASE:
>          len = s->size;
>          break;
> +    case DIE_ERASE:
> +        if (s->pi->die_cnt) {
> +            len = s->size / s->pi->die_cnt;
> +            offset = offset & (~(len - 1));
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: die erase is not supported"
> +                          " by device\n");
> +            return;
> +        }
> +        break;
>      default:
>          abort();
>      }
> @@ -635,6 +672,7 @@ static void complete_collecting_data(Flash *s)
>      case ERASE4_32K:
>      case ERASE_SECTOR:
>      case ERASE4_SECTOR:
> +    case DIE_ERASE:
>          flash_erase(s, s->cur_addr, s->cmd_in_progress);
>          break;
>      case WRSR:
> @@ -881,6 +919,7 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>      case PP:
>      case PP4:
>      case PP4_4:
> +    case DIE_ERASE:
>          s->needed_bytes = get_addr_length(s);
>          s->pos = 0;
>          s->len = 0;
> -- 
> 2.9.3
> 
