Received: by 10.25.44.15 with SMTP id s15csp4918103lfs;
        Tue, 1 Aug 2017 06:52:34 -0700 (PDT)
X-Received: by 10.200.40.131 with SMTP id i3mr3147129qti.63.1501595554608;
        Tue, 01 Aug 2017 06:52:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501595554; cv=none;
        d=google.com; s=arc-20160816;
        b=KMENWz6lD1USmtPHbiF7ah7SK1Mfgj9dSqP7aykPBeTe8E7CroVgCkXwLPAHzIHRjw
         we88PeKFBdQPjvThWErLyGV2/N7FiTsRvcC+wKXDOYPM4muFoiTQIrNMGCBVk4u/Enkq
         O0DNV9cB8ufobvjlw6/bD/1Mu6Hi0RuHwTKGrl9fSPWYVGvmaqVn3scbTOxncr0ZugGf
         mK5c/c7GZjKAquim81Z6s0Hu/YQ1i/qqr8wTqEDDaH2E4xWfNH9GxnNsikhZ6uho0gg8
         cQeVWD7TsbqALe3754ujVr4bW8bsxRig6pX5dEpLP2d0h/NPQ1QHV7AmXLteiZdAOFii
         IX7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-transfer-encoding:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:dkim-signature:arc-authentication-results;
        bh=wIhWwb5/gGF2vPYtL7FgTTErCaZ4DtlDM8bDi6usS4s=;
        b=ibIbkLDQavh6oNHnu6RCu2sqHvk4hIELuxFDu5uLiNrCM6IKQaBn0Ux6pkmqtMI1D+
         m+iMMrIfLfZZFzSKk/tqaacTVntxZEahc109yh7Xo4FHCWLcdYTtbhfL5VSK3jHm35pG
         CVlemh45SJ2kq4NWNpUtOQh/wPNAr6Gv5NX7wzXZrjJL+k7qGIzrDLmaiEze2kdTG/+T
         O6MBFWwFvwbjfuNxkGOBPQF64WPO1eqP8hYSXmg3c+c/epeQbSPZ89iDZkqgsMz9s81y
         d9nbtKWqzt7GGMdDwgwGXacMM0fYDdh2J+9AhRK7jz+M+xlJ0qIwLbN3bVTWRuudL7e5
         njxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com header.b=NBBzc0y6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w30si8591708qtd.10.2017.08.01.06.52.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Aug 2017 06:52:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com header.b=NBBzc0y6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42663 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcXb5-0007I1-Pt
	for alex.bennee@linaro.org; Tue, 01 Aug 2017 09:52:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Tomasz.Nowicki@cavium.com>) id 1dcUvh-0002dV-IK
	for qemu-arm@nongnu.org; Tue, 01 Aug 2017 07:01:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Tomasz.Nowicki@cavium.com>) id 1dcUve-0002H3-Ez
	for qemu-arm@nongnu.org; Tue, 01 Aug 2017 07:01:37 -0400
Received: from mail-sn1nam01on0041.outbound.protection.outlook.com
	([104.47.32.41]:60159
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Tomasz.Nowicki@cavium.com>)
	id 1dcUve-0002G7-0L; Tue, 01 Aug 2017 07:01:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=wIhWwb5/gGF2vPYtL7FgTTErCaZ4DtlDM8bDi6usS4s=;
	b=NBBzc0y6y7tIuRcLcrO6xjOj7MhmS8kbyNGpcA7hFsHd+4HrCv6BM8Ni8422fZmMVUhcmdBX+kET9zQG2Hhw1O/zZGNeGVNHtZKSz0p4lOZjsOM+nNBhj+tJo3sQUQ5PDaNeWwCLZAjm9RZwBxmOZqrQpp3khx9uCfma1PR2ym4=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Tomasz.Nowicki@cavium.com; 
Received: from [10.0.0.85] (31.172.191.173) by
	DM5PR07MB2812.namprd07.prod.outlook.com (10.168.101.142) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1304.22; Tue, 1 Aug 2017 11:01:27 +0000
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alex.williamson@redhat.com, prem.mallappa@gmail.com
References: <1499633493-19865-1-git-send-email-eric.auger@redhat.com>
From: Tomasz Nowicki <tnowicki@caviumnetworks.com>
Message-ID: <a8fd7038-a840-8667-0db2-5765624903d3@caviumnetworks.com>
Date: Tue, 1 Aug 2017 13:01:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Firefox/52.0 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1499633493-19865-1-git-send-email-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [31.172.191.173]
X-ClientProxiedBy: VI1P18901CA0012.EURP189.PROD.OUTLOOK.COM (10.173.66.150) To
	DM5PR07MB2812.namprd07.prod.outlook.com (10.168.101.142)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4399e21-de8b-42d9-78ce-08d4d8ccaa71
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(300000503095)(300135400095)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:DM5PR07MB2812; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR07MB2812;
	3:k/ckpBHtx+LGCE0hS5zP97VjvGnoIWmPEt2b8G4ux2lYdYSYWu0MHY8Shc7q3P2eP+XQOOY0AhvkKyy7KgpBo+rhxNUQjAukAz6LFJR23zlKhX198yS139Ooi1HPxl0uEUrvlIyYSA2pZlelFH7flP1tgIE54u+xMKDxKPeiLmMZRCKmEfZG8hCYZfVcXC6TNZA6n6ZbsA6zBXK/1/2B7NPS7YA8TelkWYw+bN1iF73Xu4jcsYQmpN+klvimxeoxCsk+rcIINNSoBs4j2RUkyrZKj4zkkZbjqncxP6ix6XxEoyhyj+XwDIoJiRGZmMmWE7SfNF/YY5sjEuYQIhjdyBsypoajipZ01zd5sVfGaxNNULobej6+hh37PYZnBWA8UNcmuSU3uPzGTkSkmmcd61zBOG+bxifJsfPMLhtmwMXEhZimCJHxFlVCIr0n4zL9lRmDP+tgnqQ4JhMxRxc7HD/IID/GJZgQk9IqEuUCNUiU+zUgjxINjrbzMq9ZOzA/xEdtS/prembJx86FEgLWR+XiMnuvrtbYSrNz3FSDr90vPXNnrQfpROsvZI+MRlSzHWW4x8E6R2hvVfylyGEYmo05jwP6OfhkLZcqNySXQsJytDVYnLJ85o/ziEOkBT9bN6ug5ibhIOsIc2IUJOzWuzn7sDatz3WGfifq8dLoJYqxYzO50MqzW67Ki0cospvnwTRJcLw1YI9rOnxTMuwi+nPDf2url2s+z7xytS19i6QsdeHcWjETEujhGAIqn1iePN8aGE/0zc0zoN3faCNqw2quQyNUJrpKWBY2b0+Wr3RZOAKXnrKFgn1AJGmqBdOd
X-MS-TrafficTypeDiagnostic: DM5PR07MB2812:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR07MB2812;
	25:Gi7z0QMbSR/njdHoXEeYBrVipM1ydGAzhxrqqK0Mk61d8KuWNGbvICSS4mvP5aYkiW8NCcRwsvaNnxG5JjbA0DyTPSpfzMqvED3ZCe6ZHQlMXianDIf92m2EzDhYhxxYC4n3lO/kS0LObBuKbZ9V455NKtIANqfSn46lKKCAzmbF22+H4G5JLM89wnhXsDawTHDaAGi1pBtNH/zaw1hLG3Rv6rzeW5/WDqGZsSXo4FQKyFZl7OFR8a2+ZxAEtu860EwIpoa+Lq7sw0kXk+ZMtiz9tz79fBs49FpZTuH9hGLWMn1rxlaPvgetTyhI0OUAOhcilIacwGH0eygc8hGFedIMylkwlP8ShYufkn5qQmL8eis9JBmHeruVphD4WUUu2d6iv4OUsz2tpuEAz2O0SDhvw9Hm6PuFj2smcIwMBFpOfepWYybbpsQcr27UFYvl1GWtwRrMuFwREpBVkg9w/A8Uw3du0lAzzxp/izFsoAX/FxYoTH6YLH/UNJSch71BY4qbf5H8545pli/NjiHVVAGSg22lKHcDZONEI0JbrpYiyLKNgPgKcJ0Ex86B9tnPhSBk61iNH9Ec6AxHywE56np1kxnHnxV2t3JIcBi1UyON332vL6gZp9zXluw/1FPlQ+h1KD66QJ1sRWumPFK9eJzec60TqQKuXajP663ubTZutox764tHkV0leVajbpm/vmmOjUdq72LkQxTUaAuGvXcX6zyjr/hRqVx0Vo+SZfekFnozD2WXQvPktChxO8ZGnAptccIkhDXwI+A6rnBQP1gkqKWZQW1dzkLx5Y+Uh/AJ9yuTKxtWgqW32toJBKj1Ic2y7IjkvRHKA4jlLBienVNt56IZAkaGPNSvPhPBIhaLCLCzP0PnXqWmfBACULGpXRzQGhqKItwZUwp90mj4u8yBgIaefuwpV4fA1T6f8YY=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR07MB2812;
	31:Sio2D9qjjtBsYgKoFRwlhOJapLZU9PltwrgwklWzEmKXVie4vIsQj4HDShbNFvSEMtEbVL78V5oS+08CTXHZ9iOL3h74Mn0BOFBbyNQVjOaL3SCbcHfXqZ9huiV3payD1Zqikk8TtIpFVazOHJQJzLWqa1g0deFvpu2/Xm7AOIAwntkzj1xVxKWWpoFh7TmR9fzM1/KpZzyr1azWdzsrs/gkeR9noBKH+qoFUbwag6xNzHVmCEHZ5EvHH0DjIgM05q4Jd8b5y2ZsnXJwhtXwqOMQi7CtjlP953z1JJqttVSPFUczt5nBYPT+lzbiv+8PYsz64oKomQv6urEuK6YP/pw8Rs1TcMqvFdtOfunSRleIo1/WP6k5FxtpLirTKmdGhI+f8Nq656vagq1Q3bqWXN1A3mXUTAmMzkfCr43E6iLR0RzsL7BBm+Qejlsle50QELZ7opAE57rSuwAkEM410QLMh8npPgQ9eubiCSqlgiNHCkbPrbUY9edPdgbv5B3Ul0K/XpU3CeCaNVkYT+rzKMopxqUmEXecUY4LSwESsNz7CKWtzHceW30rJrmPQfTmnBhRAFH7pA4sWaQisJcLVUdnBZYNEtEsqib5KWKVvFgHDIthMh563oKtiJ+QvtHo7Bwxn6r8ppyAkgdZ2WcJEF0fYSUfHFF6ERvZZWsJkv8=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR07MB2812;
	20:VeKp/tUDH0mP8lPz/Z7uvYAkRQ8jjidwAc0YIZ387Q+f7x4s24gj0Fsh6RCWICeYVRCLvSo3KcBmd94pJFXN3AqDs0jD70liieFEN+AjtCJQE3Ofhhw2C+OH44JvMvBp9K8tRNgJME1aavoUCmBGPVQ8jPOI3hKA05dTpowWqtMjc2oF+QAQ1owfAvYSdlLehxBBpQGPC44T1z1X7/2dxvAFmajLPrml9iC9Ua/9KIqFj4qH7a+pZZAbnme5CCZ/HgBc85K4+8+7l1HXRI0jhJwnHuGxWCI7siaF9DkXKyRseRPcyQEQpF9UbtcfZy8jF/Xu9G5LA17MmxK65trhTidjMT0xuxywmbb6pz1Q/YwXPdz4EUNmhYH4C5IQrvf87XK8svZvBm4HTR5szZ14LongDXbUCvCJPcNIUDBNfZiSJwcoF+5Kc1OiwCvWVmPkH1t1BbBlyVkF6rfuGo+On7rvxU947P2BrjyJyp2pjtYY6zdKljR8LOjOeuilvlIkta7N08wmUXRdT6BzqTBwO85lYYDVaSt2PJ/S03qX9xBpWwPh7XnwTYzuf2wJO0+fHejsv3Nso3CoANIaIB6TYUwcYx0zC9epATuGlciY7Vw=
X-Exchange-Antispam-Report-Test: UriScan:(226959686518644)(22074186197030)(166708455590820); 
X-Microsoft-Antispam-PRVS: <DM5PR07MB28121DC6FCEB5F275D74CEE5FEB30@DM5PR07MB2812.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(3002001)(100000703101)(100105400095)(10201501046)(93006095)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123555025)(20161123562025)(20161123558100)(20161123560025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR07MB2812; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR07MB2812; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjA3TUIyODEyOzQ6SHJCdEczMnpiMExtbStFMnhZTjRHTi83bVYy?=
	=?utf-8?B?c0FjR0RiQzhXK1ZZbW0wTlBIV21MOVB1R0p5WjZwSUxySEJiTWE5VjVQM3lK?=
	=?utf-8?B?SkcwWHV2OU5RVWlUQi9NdHh5d3lucVNSZ2ZRaGl1emh1NUlvU0c4d1BsYlJo?=
	=?utf-8?B?ZTZGeWhkd1h5Q2RMRGhBbnora3NuR2V5c293ektQYVZGTjBpaGxGMXdocGk5?=
	=?utf-8?B?SW8zbFNLUGRSVUh6Z3RPYmRNRTlYL3ZZVUNUUlNOMGRCWmJ2dkJ2Q1JMVDlT?=
	=?utf-8?B?WDh3KytoS0NVeE4yeHhyVWtMM1A1NlEvaDMxaVFVZmZQNFZ1Q242M3R0dnor?=
	=?utf-8?B?L1RWdmtUTUZmQi9mYmN5RHlmakFPbXJyeFJ1enBTOEdSYnpGZ3YxZFdCTEdr?=
	=?utf-8?B?Si9FWGxLblFNdmVST1dSRDZ2NTJXeG1OZ0ZxemxSamtzdHNvMmxEYS9LN3dL?=
	=?utf-8?B?V3NxQm1KQkF0UmhKTmRKc0tGT2NFYWhrNDV6NjBWZUkvamY1OXN1NUQrZ2ZH?=
	=?utf-8?B?ZnRUcDdCYlVMN29SL1I4VEpHR1FPWlo0NC9veko0T3JwZngyQUhuQUJpYVBB?=
	=?utf-8?B?OW9ud3hMNjV4Vk1sbUQvVnlBcXplbCtkOGJaQzNNUmFPeERzalczYkFhSHdv?=
	=?utf-8?B?anpzR3RYdGpMRFRkRGZHZlJVTkMyUFNtOVFDODNCOXJWclU4R1pZd0RpUWJh?=
	=?utf-8?B?M1lYTTZmengxQWNPSmp3TzN0TS9HN2J6cFhhUEt5Ulg0QkNrVWpIYjRLYkdj?=
	=?utf-8?B?Rk1yd1NOd2cvME40VCtpaDF3dW50WWtLb01HUVV2bTJrSTh5TW1iTktuQm41?=
	=?utf-8?B?SzJkaG1ZeFU3UWxKWUVjT2hBbHdON2FEVHcyb1R0TU0yeGpRQnlQT0lYanpv?=
	=?utf-8?B?bkg0VXlRM3NtblJxME9JeEhPWU1ucjdqd3Ztd09sL2hSVnJ4UGwzOVVmN0FD?=
	=?utf-8?B?VUVFYmxseGFpV1Y1dlpOV08xTlliZk9lU1d0M1JYYlNqU05OTDNkc01RUmZy?=
	=?utf-8?B?WDU5ZVRsV0lvRUZtVVNra0I4K0FNWThqSndjTFJuNWgva2NVam1KNTBYTDRQ?=
	=?utf-8?B?emRWbTVzVjdqTXN1dXFBN1hXaGxHMUJuYnBUZFZNODV3Nlo2UmVVWFVaZ1Vr?=
	=?utf-8?B?NmlCTFBmREFXU2hvblZHVk1aRGFJT0t4bGRtbE1XTThWWXFvZGFpRStsbUNG?=
	=?utf-8?B?VU0yelhWenE3NllldDU5dFZ5ZzBLN0J4dTdkQ3F1aDZiY1owM21HblRlM1RC?=
	=?utf-8?B?N1pzZnVUNXV5YkZ0YTN0c3oyaDRNNFVWcENCaHBLb2swOUNKTE05TjBFRURR?=
	=?utf-8?B?NFNTVlJYYVd3L2RocEJ4U0Vva0xycC9pQVR2VG40eklxYWZ3MVM3TkNKdStV?=
	=?utf-8?B?YjdWa1V5eXpadGxCcVduRDl4VFM4WVFUVm1Ca2Y5M1Z1T1ltUFdoUGRuWENV?=
	=?utf-8?B?RXhoUnNLaVkxRkdXOWJGOHJ2b1RwTHJNQkR6K2ZxdWZFRnloaDMzeTFtbEIv?=
	=?utf-8?B?WG9lUDdGUlNhMVRmZlRtT3JDTnZ1L20yOUlOTUlrTldmMzVrTEF5Qmg2UGpR?=
	=?utf-8?B?OWkvaTcvRkwrU1A5YVJxTXJlMnBtLzdmUGZPY2x3RGhvWTJwV2RxamNlUmhM?=
	=?utf-8?B?V2o4N1lFMEozV3hybVR4RTFTWXJaLzNabW9ybFpadzR5eXNHYTkyamc9PQ==?=
X-Forefront-PRVS: 0386B406AA
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(7370300001)(4630300001)(6009001)(6049001)(39450400003)(39840400002)(39410400002)(39400400002)(189002)(199003)(24454002)(66066001)(305945005)(189998001)(2950100002)(6666003)(6306002)(966005)(7736002)(97736004)(23676002)(50466002)(25786009)(38730400002)(6246003)(68736007)(110136004)(107886003)(6116002)(53546010)(72206003)(3846002)(31696002)(42882006)(36756003)(478600001)(53936002)(230700001)(83506001)(65956001)(64126003)(33646002)(31686004)(8656003)(7350300001)(5660300001)(105586002)(101416001)(106356001)(47776003)(2906002)(50986999)(4326008)(81166006)(81156014)(8676002)(7416002)(4001350100001)(42186005)(6486002)(90366009)(77096006)(54356999)(76176999)(229853002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR07MB2812; H:[10.0.0.85];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: cavium.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjA3TUIyODEyOzIzOnc0N2NuTmtKTkZ6amtNeFdnZVdkREVwaThU?=
	=?utf-8?B?K3pXVFZXMWsvNlkrVFZzNHRNd0dQOS9ZTUZoUHZ5Y0Z5WTF2d3lNZUFqWVJp?=
	=?utf-8?B?dko5SnFBNHZ6WUFSeDRLTUg3Tkh6bkZqZGVSZTYzUU52R1lBU2xIeXBxNmZI?=
	=?utf-8?B?ZFRienBjNjhqQ2YxVW43ZVhlOFp5YzlrUDkzMFJLYXhVMlV1UE04cWdvZkpj?=
	=?utf-8?B?SDIrWHNlUWJ5RS90VU93alJMMXZ3b1I0dCtaTlBURk5oR3A2bnNXOFFJeEtK?=
	=?utf-8?B?bzQxbmRpb1BMakxaNForNUpMeWdNTlFEbnRkZWlqKy9HQXRFSFZzN3k4bUY1?=
	=?utf-8?B?NTFyVm44ak1vQjlUYU9ORmxxR0FJSVloZGdKMElWNTVoZ0VIWWVETmd5L1pN?=
	=?utf-8?B?UDlhQ0YzTzVzTTJDWEVoZVM2VmVUZ3lVQUZudG91RklXVGR0aDdQN21qbExo?=
	=?utf-8?B?Qi9LK1BOcnp5NEFwOEZmMWxzZUN2Q21EQWtpbDh1SzlYNmoxRnJQYlRlQTFw?=
	=?utf-8?B?cFlxbUpQT01jdmRuNUx6WS9KSzIrbnUvemhlZkNKQzVIRXRWdm5XNTQ0cVVa?=
	=?utf-8?B?QTFUQjZ2bi8zc0tyb29RMTZia0kyVUZlM1JHNkFhRjNJeVdvNWpOeTFSN3Bp?=
	=?utf-8?B?MU9GNFFnSDBUaDJSZjdZQm4vYXBIWGlkNlZtVW1WWC9JZ3A4WjNUZUcxVDZX?=
	=?utf-8?B?RDN4UHl4R2R2aUpPbXFxYWx5aXAzek1KdXIyLzBHQ0ZWWTVXY0ZuNFF2WGlm?=
	=?utf-8?B?d083a09GMmxSRUd6R28xQ1JpMHJHdUc5c1gwMWtPS3Z6dUlQVEgrYXR1bDkv?=
	=?utf-8?B?WklPODNLQ1o4U2xMLzh5Z0JOcVppWkZPWkthMFAxTkwwQVJVQjRnTFJMa2s1?=
	=?utf-8?B?VXBNam83M3hFdmtuUXdJUi92WnZ1Q0MzZU9ia3RJYTFUMEFYdXVxajF6WHdr?=
	=?utf-8?B?RlpTbWV4dEVLS1EzdjN6VEZxUlBpbmV2MWw2bXJZcVAzL3pHb0xxZFlUVUFU?=
	=?utf-8?B?MWZxU2xMVXlTU3l5NVVqNGsrYzRxZnRRemJYSE5OeUp1NENKZmVVSmoxVHJQ?=
	=?utf-8?B?L2RXcG13M0dreVZRVEd6b1pzQjdJY0RNZVZrVytWVDVxN09jSzdEWUhtbjU3?=
	=?utf-8?B?LzdjQlN6RUtmNnZjc3RQR3JVOHJrRkVlL3V6M1Q3aEFPbUhBZWdZL1RlTU1N?=
	=?utf-8?B?QUZxNnhLUTE5a2NGNHJWMkw2S1RwblJFY08zVWFTOFVOYmRLRFM0d0pjdWFF?=
	=?utf-8?B?TGRLMk41VmZjWm9BWEtlRzFPT21sSmkvVmpKTWpVMEI2MkFBM1piOWFBMW5Z?=
	=?utf-8?B?YU53V2NwVXJGWnUrdnFZY3F1UzRVVFkrTW1iVVYvWG5ibEVsdDNmRHdxOVlO?=
	=?utf-8?B?WUlsWHdQeWo4Mk5jRERaeGFwTVdiU1g2ckpya0s4OEk3ZzRIa1U5TTRLTkxF?=
	=?utf-8?B?SXlMNk1VbmQ4aE0waWlsOXVOejIySDBWcEs2T2RaR2ppMmM0dzZiZTJiTHFK?=
	=?utf-8?B?dlVhM3VNRDlyRnluaGF1NGJzUGQ4K2dRWDEwYW5VdldQTTMvbzYveTlPR041?=
	=?utf-8?B?RFNUdjh2OUtkT3dIWVBQTkxiVElYcWg4dlhjT3RLbUppOFZxVE1YL3ZUdFYr?=
	=?utf-8?B?Zi9WeWV5WTJnbExTMUJRZEI5ZWFQZm9sU1lPQ2luVXMyWUh2Y0pLS21RZHZ3?=
	=?utf-8?B?ZjJJdG1iNHNWTlV4UHltbzQ0Q251Yk5FTGVkUEN2UjZ5ZlZQbWRnN0pXR0ov?=
	=?utf-8?B?MUcvV2lUcFRqSmlqcFhpa0V1QnliQW5lSVVQWkw4eEtybUFydEROWUk3N3R6?=
	=?utf-8?B?cXN1b0w3dVNEVEZUWjEzWmh1SUt2M3V5dUU1NFQ5VThydEJjbHlrT1FVYkpP?=
	=?utf-8?B?QTdPbSthNDRSMFVkM3B4dUM1WFRZY3hkVkNvMVFodnZ1YVA1Y0NGRVp0WGtR?=
	=?utf-8?B?RUlaSm9jRStCU3c3bFpuODBXNTdKbzB1M084ZWpGVzJ4b2VEb3RhNTBmVDg3?=
	=?utf-8?B?bXNuVHRhV00yMFQ4THI1eWNhdWFSN1hBMFV4dWZpYjRnQjlCNm1PR1VON3Jl?=
	=?utf-8?B?bEprMTRjeEpPZjh1YTVJUWFHcHNGQ1FEc2ppWkhVY29PemZlUnRkdGhkdDVG?=
	=?utf-8?B?dmc9PQ==?=
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjA3TUIyODEyOzY6Z3NWN0h0UDRVdmF1QkxxS3V1Z003Smk5d05R?=
	=?utf-8?B?QWFZOGtsNmZCSS9OcXNsRnY2MVB4UDY0T1FuZ0VQblZ1ODNzVmNmVG5VMEU3?=
	=?utf-8?B?SUJFZDEzODlzUTlydnFncWlVYy9XNEpGamY2SFZESmdKMU5TVjRLd3hpRW1l?=
	=?utf-8?B?VUpHaU9PcmNSbHU0eVVjUnAwcXAxK3UzdGkvLzBmSStha0dMMGhqUGJMYWdB?=
	=?utf-8?B?RHlhZzVUYmk0REdtOEdnK3VRb2hUVEJxZC9jcS9Oc1JnMmxTbGNCREZzOUZX?=
	=?utf-8?B?R3RFUWsyVHRNMGFST1doMkdjbFFRZnJuWlFwRml6OFVwekxZc3cvZG9qSEhz?=
	=?utf-8?B?MGhyQm56NFJGL0JmQ0N0Umx4QXpoVnJsU05jOUZwSUJPUk01QXYyQzlyMFI1?=
	=?utf-8?B?VVJXcmRscWxpTmd2Z0lhY0VBTnJtTTQzc3lMS1FZM1RCL2tOdlJNd0NnNXZB?=
	=?utf-8?B?VzUzSUlhbzFncHFaeHdGUXZVUVg1NjM4emthbEFFenVxcXZTNlBvUTR4M2to?=
	=?utf-8?B?MXBiaG9Mcjhoem93OVo5MldPRFg2YUFxUHJheWMrL2lQZ3VnUThiNjU1OUpC?=
	=?utf-8?B?K1hWOHh1T0JvVUVBZXVVekJSS2djaDNHYUt3d0s0T1cvQzNwdEo3VHgxdTRl?=
	=?utf-8?B?UGlXZ3hDTTRhL2I1VjRJMml4b3VVT3F6TU0yMTBXNXFZVDhRakhzbkR6d0Zj?=
	=?utf-8?B?Nm1sNmlzbEdqM0NTdkNZcCtCUktNUTFObEs2SnRBai8yUXJRelBTVGh1bmNq?=
	=?utf-8?B?TFN1R0liMjI2SCtoSlZLTlZLdElFOU5WREVHRGtMckR4VnpFTnRya3BDWGNE?=
	=?utf-8?B?bVpQWFdJTTE2OUNnRXM5ZFpQL1V5S2JTSGdObzhmZ2dwcXdvOGt6dnRVclN3?=
	=?utf-8?B?RGtVZXdYVVRRSHpsM1BoZDlsSzdyQ3hTZUdScER4M2RGVWRnNlNRVnFWYXQ1?=
	=?utf-8?B?UU5mMnBhWE93QXNwZGlkR21pa1lXcHlXbHQvbUVHcUF3M0pQa2UvcXhRQlBW?=
	=?utf-8?B?SkltQ3ozUjNUMUtLSXJSVE1acWZnV0J2ODVxRUczTXBYa0xlMDFqME51aWc3?=
	=?utf-8?B?TDhLTU9CYW53MUhoMjdWcDBGR01YNHg3RWhBdGo1VzBUM1Y1NWhsc1U5eHl0?=
	=?utf-8?B?dU81YnVsZHpwQ2hsY3lyaDQrQWRXbkZqNDFOUXBRUC9Nc2pZMEI5VmJXY2lj?=
	=?utf-8?B?ejZkb3JHUmRMeGdFRk9yc2paK2t6bVQrQnlqSkFtaU9Zc2JGY09HcFlaSUFl?=
	=?utf-8?B?bzF5L21kdFRhRlRpWUN3a05kWm9ZekhjUWZZR2NlNlcvS0s5MStuZllLWHdR?=
	=?utf-8?Q?3HBKRniUancraKaAohscIMh2r4XB7E8=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR07MB2812;
	5:jUM05odQ7J4vjZZistm3GpKATq1xR8369pVvydIF/9ornw4kQs29kLZ/1uWAXsAlG+U7Mid3H5sfdrAIGeUcHW/jUj3rMo0Yp7qnLxmzYCjkzPpT/AlkQIDHxptZhA1qrifIivPKYljj4RkOrpRTIOSp2KEc88y0DvNv5opCIMut03KtxxS4iuhEiZYJXF0MAoQ0fQV8SwtUE7/5QHlRSCp8JKNjEZl9FHRtJRgG8gqWL9DyG9jDExonsO+m0MLaUyGeVrNE5Yj6vK5TWqEiLmNM6TzDoJslf2kjSee/FXjY3EmHmr6sFtFpDSgYQTIfT+ddXbWxksweBA+SS7Jnsc7AYp8m+EA1KeXZPVIUnaMNMoDc19x4JCBs1fk0ZkbF5KhKC/mAdz58ZrzCLBiRB4j0Hdm4+XLUEOFwjHS+MsadC5BoAGZPIUfuEYsMl/yR81AniLkhKN/ucNjLtpmZwBZYEg0c48K8k5fle2ou3oC4jlxK13oVNw9gbzkAoglr;
	24:Tvl5cQIHJMmc5ptNNiEqUl0QL0gmq5Hkv+kq5gpAyaLOqWbria8HeqHXEkNCVcgWcaepv/Qzl0Y9LX6qUh0iNxUnImYeuide7onNv/DGknU=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR07MB2812;
	7:CB+2XSul+nvDTSxqieW1j1bKTyIHgT1Z9LIEctZqCqhU3WSeUXAyfX+g94SucjsKvpWIgzXcRKmCtrBMJQNpF8svOGDgCnuoDwbiUjyNWE4HeQAWAZXDBXoZR/nSVDm+JEnR9XQ5rZ2YKj8zHzHy15dBkWjr69A76oRzV7A/RZHWhV5YCKp4RqDFCZfkTPWEBHV+fAdB0xd2evXmbdP3jon2rcdJY229RdnpBVUNesMOT7IOQ8z2OqXZUVSbWBfksDi9pqX0SDyk8QH40QDwxpHmrcAl9h4p1V0sqUIGdpT/Z8+LpCSNudkFbphjTbnqeBpwySdXMxN+L/syxkgmT+Z71r8Cs4KHX1m7AYe8WwgKBzjEo69p9r1kgDaLc1zTx+79Zbn/tAzLR5oFeNry6Sxw7Cn3GfEwLverT5g55iGaSJ9LunGDzuF4BTLUN+0bAjs6iRFoWSlvAgEv10CzSYheAtsNcuPcg6hNdwz6FlSf04hXZGEs5LsHvjuVPLI62SWSGhVh5y+O8lqaWQgV4SmmyJGDsTNPUB+bJQl2l1rrOqFqiBH8RVCqovT83qmpN2xHP0qeg5j56llZb4AyV7IfrguE3J1jf8gQOstx7h2dvBivistbQyo5BTa473PndqFP8yieH1R0/nYn1q18VCVA7FXNM/cNHwGaE2HJBxE6E1GxqvHodqRgvW0sTUQeGkxTbaTNZmbqvROBctLyf+flxe9VucjmcTPa4f41R2bv5M4U1x+5HFtC7HuSnyEy3Zh2Ra9QdGu5nN7D8cTghg17ceFym5bL3RLxF+9zd5Q=
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2017 11:01:27.5417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR07MB2812
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.41
X-Mailman-Approved-At: Tue, 01 Aug 2017 09:50:26 -0400
Subject: Re: [Qemu-arm] [RFC v5 0/8] ARM SMMUv3 Emulation Support
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
Cc: mohun106@gmail.com, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mst@redhat.com, jean-philippe.brucker@arm.com,
	robin.murphy@arm.com, will.deacon@arm.com, "Nair,
	Jayachandran" <Jayachandran.Nair@cavium.com>, peterx@redhat.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PSLEtCm/Igkz

Hi Eric,

Just letting you know that I am facing another issue with the following 
setup:
1. host (4.12 kernel & 64K page) and VM (4.12 kernel & 64K page)
2. QEMU + -netdev type=tap,ifname=tap,id=net0 -device 
virtio-net-pci,netdev=net0,iommu_platform,disable-modern=off,disable-legacy=on
2. On VM, I allocate some huge pages and run DPDK testpmd app:
# echo 4 > /sys/kernel/mm/hugepages/hugepages-524288kB/nr_hugepages
# ./dpdk/usertools/dpdk-devbind.py -b vfio-pci  0000:00:02.0
# ./dpdk/build/app/testpmd -l 0-13 -n 4 -w 0000:00:02.0 -- 
--disable-hw-vlan-filter --disable-rss -i
EAL: Detected 14 lcore(s)
EAL: Probing VFIO support...
EAL: VFIO support initialized
EAL: PCI device 0000:00:02.0 on NUMA socket -1
EAL:   probe driver: 1af4:1041 net_virtio
EAL:   using IOMMU type 1 (Type 1)
EAL: iommu_map_dma vaddr ffff20000000 size 80000000 iova 120000000
EAL: Can't write to PCI bar (0) : offset (12)
EAL: Can't read from PCI bar (0) : offset (12)
EAL: Can't read from PCI bar (0) : offset (12)
EAL: Can't write to PCI bar (0) : offset (12)
EAL: Can't read from PCI bar (0) : offset (12)
EAL: Can't write to PCI bar (0) : offset (12)
EAL: Can't read from PCI bar (0) : offset (0)
EAL: Can't write to PCI bar (0) : offset (4)
EAL: Can't write to PCI bar (0) : offset (14)
EAL: Can't write to PCI bar (0) : offset (e)
EAL: Can't read from PCI bar (0) : offset (c)
EAL: Requested device 0000:00:02.0 cannot be used
EAL: No probed ethernet devices
Interactive-mode selected
USER1: create a new mbuf pool <mbuf_pool_socket_0>: n=251456, size=2176, 
socket=0

When VM uses *4K pages* the same setup works fine. I will work on this 
but please let me know in case you already know what is going on.

Thanks,
Tomasz


On 09.07.2017 22:51, Eric Auger wrote:
> This series implements the emulation code for ARM SMMUv3.
> This is the continuation of Prem's work [1].
> 
> This v5 mainly brings VFIO integration in DT mode. On guest kernel
> side, this requires a quirk [1] to force TLB invalidation on map.
> 
> The following changes also are noticeable:
> - fix SMMU_CMDQ_CONS offset
> - adds dma-coherent dt property which fixes the unhandled command
>    opcode bug.
> - implements block PTE
> 
> The smmu is instantiated when passing the smmu option to machvirt:
> "-M virt-2.10,smmu"
> 
> As I haven't split the code yet so that it can be easily reviewable
> I don't expect deep reviews at this stage. Also the implementation may
> be largely sub-optimal.
> 
> Tested Use Cases:
> - booted a guest in dt and acpi mode with an iommu_platform
>    virtio-net-pci device (using dma ops). Tested with the following
>    guest combinations: 4K page - 39 bit VA, 4K - 48b, 64K - 39b,
>    64K - 48b.
> - booted a guest (featuring [1]) with PCIe passthrough'ed PCIe devices:
>    - AMD Overdrive and igbvf passthrough (using gsi direct mapping)
>    - Cavium ThunderX and ixgbevf passthrough (using KVM MSI routing)
> 
> Unfortunately I have not been able to run DPDK testpmd yet on guest side.
> The problem I see is the user space driver dma-maps a huge area
> and this causes plenty of CMDQ_OP_TLBI_NH_VA commands to be sent
> (tlbi-on-map) which are sent for each page whereas the dma-map covers a
> huge page. I will work on this issue for next version.
> 
> Known limitations:
> - no VMSAv8-32 suport
> - no nested stage support (S1 + S2)
> - no support for HYP mappings
> - register fine emulation, commands, interrupts and errors were
>    not accurately tested. Handling is sufficient to run use cases
>    described hereafter though.
> 
> Best Regards
> 
> Eric
> 
> This series can be found at:
> v5: https://github.com/eauger/qemu/tree/v2.9-SMMU-v5
> v4: https://github.com/eauger/qemu/tree/v2.9-SMMU-v4
> 
> References:
> [1] [RFC 0/2] arm-smmu-v3 tlbi-on-map option
> [2] Prem's last iteration:
> - https://lists.gnu.org/archive/html/qemu-devel/2016-08/msg03531.html
> 
> History:
> v4 -> v5:
> - initial_level now part of SMMUTransCfg
> - smmu_page_walk_64 takes into account the max input size
> - implement sys->iommu_ops.replay and sys->iommu_ops.notify_flag_changed
> - smmuv3_translate: bug fix: don't walk on bypass
> - smmu_update_qreg: fix PROD index update
> - I did not yet address Peter's comments as the code is not mature enough
>    to be split into sub patches.
> 
> v3 -> v4 [Eric]:
> - page table walk rewritten to allow scan of the page table within a
>    range of IOVA. This prepares for VFIO integration and replay.
> - configuration parsing partially reworked.
> - do not advertise unsupported/untested features: S2, S1 + S2, HYP,
>    PRI, ATS, ..
> - added ACPI table generation
> - migrated to dynamic traces
> - mingw compilation fix
> 
> v2 -> v3 [Eric]:
> - rebased on 2.9
> - mostly code and patch reorganization to ease the review process
> - optional patches removed. They may be handled separately. I am currently
>    working on ACPI enablement.
> - optional instantiation of the smmu in mach-virt
> - removed [2/9] (fdt functions) since not mandated
> - start splitting main patch into base and derived object
> - no new function feature added
> 
> v1 -> v2 [Prem]:
> - Adopted review comments from Eric Auger
>          - Make SMMU_DPRINTF to internally call qemu_log
>              (since translation requests are too many, we need control
>               on the type of log we want)
>          - SMMUTransCfg modified to suite simplicity
>          - Change RegInfo to uint64 register array
>          - Code cleanup
>          - Test cleanups
> - Reshuffled patches
> 
> v0 -> v1 [Prem]:
> - As per SMMUv3 spec 16.0 (only is_ste_consistant() is noticeable)
> - Reworked register access/update logic
> - Factored out translation code for
>          - single point bug fix
>          - sharing/removal in future
> - (optional) Unit tests added, with PCI test device
>          - S1 with 4k/64k, S1+S2 with 4k/64k
>          - (S1 or S2) only can be verified by Linux 4.7 driver
>          - (optional) Priliminary ACPI support
> 
> v0 [Prem]:
> - Implements SMMUv3 spec 11.0
> - Supported for PCIe devices,
> - Command Queue and Event Queue supported
> - LPAE only, S1 is supported and Tested, S2 not tested
> - BE mode Translation not supported
> - IRQ support (legacy, no MSI)
> - Tested with DPDK and e1000
> 
> 
> Eric Auger (5):
>    hw/arm/smmu-common: smmu base class
>    hw/arm/virt: Add 2.10 machine type
>    hw/arm/virt: Add tlbi-on-map property to the smmuv3 node
>    target/arm/kvm: Translate the MSI doorbell in kvm_arch_fixup_msi_route
>    hw/arm/smmuv3: VFIO integration
> 
> Prem Mallappa (3):
>    hw/arm/smmuv3: smmuv3 emulation model
>    hw/arm/virt: Add SMMUv3 to the virt board
>    hw/arm/virt-acpi-build: Add smmuv3 node in IORT table
> 
>   default-configs/aarch64-softmmu.mak |    1 +
>   hw/arm/Makefile.objs                |    1 +
>   hw/arm/smmu-common.c                |  474 +++++++++++++
>   hw/arm/smmu-internal.h              |   89 +++
>   hw/arm/smmuv3-internal.h            |  651 ++++++++++++++++++
>   hw/arm/smmuv3.c                     | 1256 +++++++++++++++++++++++++++++++++++
>   hw/arm/trace-events                 |   54 ++
>   hw/arm/virt-acpi-build.c            |   56 +-
>   hw/arm/virt.c                       |  111 +++-
>   include/hw/acpi/acpi-defs.h         |   15 +
>   include/hw/arm/smmu-common.h        |  127 ++++
>   include/hw/arm/smmuv3.h             |   87 +++
>   include/hw/arm/virt.h               |    5 +
>   target/arm/kvm.c                    |   28 +
>   target/arm/trace-events             |    3 +
>   15 files changed, 2949 insertions(+), 9 deletions(-)
>   create mode 100644 hw/arm/smmu-common.c
>   create mode 100644 hw/arm/smmu-internal.h
>   create mode 100644 hw/arm/smmuv3-internal.h
>   create mode 100644 hw/arm/smmuv3.c
>   create mode 100644 include/hw/arm/smmu-common.h
>   create mode 100644 include/hw/arm/smmuv3.h
> 
