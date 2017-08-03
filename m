Received: by 10.25.221.202 with SMTP id w71csp420160lfi;
        Thu, 3 Aug 2017 03:11:48 -0700 (PDT)
X-Received: by 10.200.41.241 with SMTP id 46mr1248587qtt.339.1501755108674;
        Thu, 03 Aug 2017 03:11:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501755108; cv=none;
        d=google.com; s=arc-20160816;
        b=L++6jEdraxPFeR0xSYAe5gAXlntWphqPUF5WDRVhl8j0Gn0fRazB20zYCpH/083phE
         f9u9wE8hlO0nC3Yuf/FnJfn3UxB2Ai3Isoz70WmgzCJA10sbG/jsPj4h6JSnhuZvjG6/
         qqefE2HKasOZ2WSSg3BXXJgRUfv69zxL9r9X8FE9s5yeRMQlC7ySQ5G01IKoeKRgRupl
         O2TV1p0SzDJ4ECkokqGhZflhHnn+MtqbSazITUo0wzuIJ99FbZ58dCpF3w+2BayNo6ai
         C9w3h8qsNaK0ophdXu1+QlkWuS1eJBHnjZFJxtMc4f8M1qxu+J4Uj7qRPgCxz1JQuvvT
         b7vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-transfer-encoding:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:dkim-signature:arc-authentication-results;
        bh=r85N33YSAqlPs2JRgkBB1b4qLBtXGk4WbzaVUrHRoFs=;
        b=e3yh/ioAEnK4wj7l0PFYxI1d4MTyZFFRDFdl0lnV4yRHuXkfVOhWwGerSxZ2n3rglT
         ug5QS0BGU/Xprxy8DfmmpXofqHUr4ah38tN5ktRKjEceFez59Vmo/obufZtD6gTv8TJS
         2/4XT7Iqxp2+oZTtp/Q2PGpJ6uTwqqVRK91bWBWEUyiZ2e9rm4htINOCUm2Kz7+HSW7s
         TI714mnPV5PcFePcpWlJkYhnYOC8Lq2/baiawnrRj0UMmRz13jOuQ7+LMPBLk5pI6AEJ
         OqwZ4TxHsKCGGdcvupRb7iKPW9UnnMaapdGyhMw9IrKaLTalQr6LM8v9qaWnex/cUJut
         I1jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com header.b=e1TnBZzW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h62si23749530qtd.295.2017.08.03.03.11.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 03:11:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com header.b=e1TnBZzW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53368 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddD6X-0004Yq-K4
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 06:11:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51862)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Tomasz.Nowicki@cavium.com>) id 1ddD6R-0004WU-Pl
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 06:11:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Tomasz.Nowicki@cavium.com>) id 1ddD6N-0000kd-HR
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 06:11:39 -0400
Received: from mail-by2nam01on0047.outbound.protection.outlook.com
	([104.47.34.47]:19969
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Tomasz.Nowicki@cavium.com>)
	id 1ddD6N-0000jp-2k; Thu, 03 Aug 2017 06:11:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=r85N33YSAqlPs2JRgkBB1b4qLBtXGk4WbzaVUrHRoFs=;
	b=e1TnBZzWeMXkhW1/Mpy83i+p0XnTbJumt8c492knYwuLB6z/f8q/l2tqa68R9u1+zO2duFfRGC4q+4QPWnsRQRGAM1FtcElPo8JUUrckfiuVdhCJT8GlCPsYb0awHtQY/gmhIhbBPMIx4dt3UaD/MZbbFZjAbnMAbfuwha/sdEk=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Tomasz.Nowicki@cavium.com; 
Received: from [10.0.0.85] (31.172.191.173) by
	MWHPR07MB2815.namprd07.prod.outlook.com (10.169.230.141) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1304.22; Thu, 3 Aug 2017 10:11:23 +0000
To: Auger Eric <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alex.williamson@redhat.com, prem.mallappa@gmail.com
References: <1499633493-19865-1-git-send-email-eric.auger@redhat.com>
	<a8fd7038-a840-8667-0db2-5765624903d3@caviumnetworks.com>
	<50d1685e-bfa6-02ac-2650-37637745431a@redhat.com>
From: Tomasz Nowicki <tnowicki@caviumnetworks.com>
Message-ID: <35467208-4e8f-b944-c247-c049c2301878@caviumnetworks.com>
Date: Thu, 3 Aug 2017 12:11:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Firefox/52.0 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <50d1685e-bfa6-02ac-2650-37637745431a@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [31.172.191.173]
X-ClientProxiedBy: HE1PR07CA0016.eurprd07.prod.outlook.com (10.160.74.154) To
	MWHPR07MB2815.namprd07.prod.outlook.com (10.169.230.141)
X-MS-Office365-Filtering-Correlation-Id: 0c12a9b1-5a77-4177-2c51-08d4da5801ba
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(300000503095)(300135400095)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:MWHPR07MB2815; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR07MB2815;
	3:X7pt0+i/gKB03OIoOualVskHttcnmngDJxpiQPKhKWF48GXfn/Pe+j3VsyAvWpxjJgJTfXHngX4NJahDlF7CTmCww4kvY5diWdae+vYiSl984s9xGiTn0MO3EEhPhYRiLzNJUiv9aSjVLlVTwmwbsmV6QpVRPGj3Pwr9mRrlK350A2/rJJ4bXqBA8L9iyqBw4IxP3ORP2l8y1Er9DdN2VEDCEi1V0Lfyfw+vFIyQzQu/Ybt2gl90vdRv6S3zRyMK;
	25:l7UwU6TVj/FodV+GdUOBiqnBzVXzJf/uL+AhAkJvqEtF1WudCJoaANx1Num36HZKNKampyqgXrndv5p+r1oeBJzMzWtintvv6zim4D7mYi2JfhdtUHHkPQJvrAWauz29vAxADideusc0UoQb/qzm/KN3Syp1k/Jv5jzQObHxakiFa8L+dcjkDXujoUwnFuUMvF8C0wDDyX9vmr7vjeeSzi6FQFD+mCT7kyJfh8Ix1k9f++he18q9BnNwlfzu6T+3tohvFOGeVZNJ14zDVAYPDsmEfy52N8soB+WhJkUA7c6aXcVZ5XryisOovqM05AvLnOWZ+KDmRb/AFobX4AM2dw==;
	31:pLHDMbvVtUE8ph4M2pkn/fPe6aEnxAX1TZyK33QACHZksVM6fBdDwUmdF7NjTtrbYVx1/+LpT9ShymjqRUz/5rruBwx3g4ojpajdwJhWPDyPje3MvtBc8UI2YBHBCcj7QciBrcvzhVxDtHliWwO0JM6CeDz39uezXRy5KF6MqRZn+H9qY7WHX1MPx8KLJP5bqwdKgztDDj9IfxP/EHoJJy8Oqu1ZrgFBNGUcSivpNvU=
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR07MB2815:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR07MB2815;
	20:/Hx5We0fe/uRBtr6J/auIDFW30iqn4pzXE/IjtP89s36Y82sC1sNrw9gI1sspVX+eaVb1UuXh2tsF547TiwOdYbuN1FNrk/QmXYNDcQiIXUWtQlFjf0q/ID/a8iC44rq4VfH0FlwbLcWJonEzoZgfbdxmjemuST9fy/+eHpjlB6h5887zn2/hVqWpSZQeopZNpHrawT962Z9DLP3gAnM8nk3WsiCLbsxroFJbEygKLf9/RrvRWzI8QJ6RI1Kc7y6m1zd96WMHGrgs2NGJCNATFdsyZHP9T4U6p5BQiYe1OQNvVBfUa9naxdFc4TtjjALVNFthLrBcDlteYEIXtGBs14pL2BVS8A6wiOT6ZaY1nJFMqzJJnLNQrEoQJm3XGiQLVBf06HU2WtOUBxClTeN4IC68oMFiF6MYucAXuoSr7vXgBxQIlLsCnY+naiXg9iw4DT5bS3iLoQADvx3FSGR5DKEdVtP21HSXBxNkPT0Zd86tXCe8AuLQwg3PkQwRoRRI03YHPGDDPVKWlck+bfxYq4+UClgEmuJ0TE3pHt4EqVb2i5QQjfjOz3VXmyA7/1q3YIqVeDckmcknp/cmtMTa4H3vQkj04wgkdwqiMCOxnE=;
	4:DaR5dVtTw4bHOSO/1AcuJOWTme8zLKnbmyIM7GZATUNpPP/FqUGtuaZaaKynikWQsNfEHfw2U5uKmBod9KjWrICo57sRHRZTcy+nl8DbAMP/FrnyIQmiNpQfRBVhv8LBJsAsZSiRva4ddI9LJKYK5w8cXm73gOORfQV5pjIcMFqiWsBZycLGeDzDWiUFz5xoD7W0uIelWiiTYuYltNbd8jXOL5tY2eJgaQSGVPKJg26T0Gxxgvp4I62i6ZORJDY4
X-Exchange-Antispam-Report-Test: UriScan:;
X-Microsoft-Antispam-PRVS: <MWHPR07MB2815B5634899F524A715D319FEB10@MWHPR07MB2815.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(100000703101)(100105400095)(93006095)(6041248)(20161123560025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123564025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR07MB2815; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR07MB2815; 
X-Forefront-PRVS: 03883BD916
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(7370300001)(4630300001)(6049001)(6009001)(39400400002)(39840400002)(39410400002)(39450400003)(24454002)(189002)(199003)(105586002)(2906002)(81156014)(8676002)(81166006)(3846002)(64126003)(50466002)(68736007)(6116002)(5660300001)(31686004)(4326008)(83506001)(33646002)(478600001)(25786009)(53546010)(42186005)(72206003)(36756003)(106356001)(23676002)(47776003)(65956001)(66066001)(97736004)(53936002)(4001350100001)(189998001)(6246003)(110136004)(107886003)(38730400002)(2950100002)(31696002)(7350300001)(42882006)(230700001)(7736002)(305945005)(8656003)(7416002)(76176999)(77096006)(101416001)(54356999)(229853002)(50986999)(6666003)(6486002)(90366009);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR07MB2815; H:[10.0.0.85];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: cavium.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjA3TUIyODE1OzIzOmRsWjZsaExRcUQ0SkV5M1ozNEdyWUFvam5Y?=
	=?utf-8?B?Z04xUEFLRllDVE5HM2hkWWgwa21Lc3VwZHJrMjkzUUxvQmRVUCttS2NmN3Ft?=
	=?utf-8?B?SEg2U0M2L3ltMGRRbHFSWFA0UTBrOEFyRmlhU1RpZ0xVQUpaeW5KbEdicVpV?=
	=?utf-8?B?dzF6aCsxVk1vam1WL1pzZiswUGF6SWUwKy91S2xHQ1BHTWxTN1RuMFArMXk4?=
	=?utf-8?B?clhGUHJsV3QwVlBXUGJZTjlkb1JYMWdJRk1mdmhwR3F3R2VDSHlkRmhweFJQ?=
	=?utf-8?B?MEdITlhZU29lYWhVWTlnTzJPYytEUHNKOVR3ZzJMSXdSc01QY2Y5THhRbzRT?=
	=?utf-8?B?YUJ0dkszck4yOTM1UUpMMDVZTE93TUxFTXVHV1ozUEVZTTJscVQzRUVvaVJr?=
	=?utf-8?B?STUvdVR2YXg4eER0MUJTcFJ3MWp6MmlmejVnRGJNNGZ4ODR3Z1VWZDBQY1kr?=
	=?utf-8?B?VlI0T2FlMVJoNDlJZkFtdzBQckJScXRuNndZRzFwZGhtYVlSSTROL3NiU2wv?=
	=?utf-8?B?U0cwMHVaNDV1T09LRDZhNm1GVmlKRWhJY0lIbkdFUWxaNk54YnRtdEM2QzZr?=
	=?utf-8?B?WVZCVGM0eTlpdUo1UFVFS2xIM3ppc1ZkdVVxNC9vc3JzUmMzK25RbUF0VENT?=
	=?utf-8?B?WkhldkNLMzN2ZXlGMm8yY3hYUlFxcWJTb2FWWDlZc1NkYWxkam5pVnl0dmY3?=
	=?utf-8?B?amdTWXN5WHlVOU1oODcvOGxIWUM4NExHRnRWeVhBZzNUUURERDltMXBEVmx5?=
	=?utf-8?B?NUdhVWtzUlVPdmR5cmdpQjIwYmpQZkRPYXh6TXdoTTVtNGtOdEFwTldiOENQ?=
	=?utf-8?B?REVUbkRwMXU3VGZhWEJvajdFU2xHZjRXOVR1V3ppVnNTSmZ6RTl5Y0pDZ29I?=
	=?utf-8?B?cmx6bkQ4bGM3SlVISWltU1RQS2ZZNmZtbUZrTU5FNVdVVEs1elVkaENqRjJF?=
	=?utf-8?B?eDZ2ek9kWDZ3aDhrSFIzRFhPbVprVXVWdDY3NDNqUngyQWd1ZXBZb2pEa0lF?=
	=?utf-8?B?MVg4MUpOdmZheUJLamt5UE5PTlB6cGhBczNYOVFnN0ptOEJlZGRKVE5iMVNp?=
	=?utf-8?B?VmYxWnMwaDRiRkhrSUpyb08xQTVWVy9JamR1R2lINVNyS3E5dll1ZlJNVTNB?=
	=?utf-8?B?Vi9ZKyt6bEFpUytuRnNJK25vYnpUNjdLUXpvazNaOFAzWEQ3aEhKcVprcGxB?=
	=?utf-8?B?bkx0SU13TFZzYXRWWDhDSjQwN0NjMnBqcGIzRmI2dHZ3aVF5Z3BobG1SOWFO?=
	=?utf-8?B?K0tJUzZERXczd2ZEdTNuUkV4ZWNsMXk1aHNvalJMdHMwVVdvYUY3WHd4TmlJ?=
	=?utf-8?B?cW5zS3JCVzRaeVNwQktBWVd5SlNUNmt1VjNjWmF4NHRVMTNPb0xGREFVeTE5?=
	=?utf-8?B?U1hQcllRT0xRS3dVaGE1YTBTU2ZDMlV5YmNkSU9ERlUrd0JjbFoxaXkyemdT?=
	=?utf-8?B?V1UyYUQ5em5nUFV5MXpEUU5KWS9UUWV2TUNCYURjWHV5SXFUUGtESUE1V1JE?=
	=?utf-8?B?T0xUVk9kVkpUcnVHVG9SZ0NHTU1ETDFtUEhsQ2I5Z0o1VWc5aktsRTI0VUp6?=
	=?utf-8?B?SjZjcmRDZGhsRWs2R0FaUHdEb2p1ZWN6MUtlZlhIakNxNGtXbDk3WTQ5RWlI?=
	=?utf-8?B?Nk96RWR5eFlLYmE1M2V0Q2dYaGtYaEpJY0VCOVRhR295c1V1emtYaTVEYjY4?=
	=?utf-8?B?azFMVWZyc3AreElnWFppazNvMjluZHlTQm12K0I2R3NXRzdhbDZsZlpITXRT?=
	=?utf-8?B?VkEvd3VOZXd4YTFteFhGT0QyaTJicEM0dHgveXFyZXhjeWhxeG5RRTNXWU9L?=
	=?utf-8?B?emEvNlpjK2pTcnNxZzVud2F5QVRSc2VpTFV4eUhYNHBNSmlibHFBNmJHTHZa?=
	=?utf-8?B?NzV4aVMyNzV3eXFaNXArcGRtN3BKdzRSUkxlQmdrVzd1RWNTd2RmUjkvRXZm?=
	=?utf-8?B?ekd5elVUd2FsMCtmckVzQUJnaGdXbFNqdi9TVWErNGhJNmZRaXdUVHFCR3JD?=
	=?utf-8?B?SHJxSEw3d2RycnM0T0t2UHlZWWZ6L2czSTczN3U5dG9aZFdXSDd5QXh0SjRz?=
	=?utf-8?Q?JLRw=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR07MB2815;
	6:Ca/IMsN+/zbFDAjUXGkvJcSHJDNuzkZLMHBDmCkCtbgNXIRrkSyFASdYzEqab8GfI+WPJ9AHkflM64Ch2UbhHzr73t8WdVSD+Uqbhq6W2JvH0JX4d/yG3MKNemfLdX6xtbblH4+5pAoPnva8rZ300ykCdatFgBxEJKQJ2PGFNynuwd4roFpdKtx5q0sj9Na0WWb1G24pIExaF8bAL8/krQkVFvWoul7S3l44a/tKdwEghxA0A1qzI9jW3/86tuEkXztNHNto+9qy+4ROmxb3uO1MwKl8y19nkQJS24nvkxAIfCkrCB/fDClRX3y/QoNCsR4WjK4hLqhw9MCGc2v2CA==;
	5:cMwpbx51yK+KaLHoDkvHFlBJ7RW90nxfVisaS+V+9SiTIjgBPPnV+ZZl64hoBGNgZMokFiIkc3JhEo1BGEr71IRvOs2/v6NQxMHFb2vOpe/7wq63C1YkwAM3uHA6bQQSNyBZjk22Kh94mV2OLzrdAQ==;
	24:fDj1aczaKmVH1mZgdtJSrK9qphmJT+NNT6h6L3H4FruM+jRuR+vNrdF2EjlAraDtHuAgxi1la1aCUcd2KyQXSZaEd1udGNmO9zQaJTpz9WU=;
	7:2Fwr52JMt0+wX+3K+jdA6WogaC7s+An4nUwGryQ/sjEQp3+h/6ATEFNQE14DuyP1Nwui6RP8IK6lqnr7maKmQp2/CVYSagbGzt6jLEarUqw3U+unLy3WAllr0cz6SUm7sBGVNNG0Jqa7sBeybih2EbaIfK6vDnEFdEDgSNL+nTAVa+qHBKMYGOyzQBF2fMLoT3RTGBI/ezR147bQifVmibgwW0zjRRCH2/A2NPfMMRE=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2017 10:11:23.3600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR07MB2815
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.34.47
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
X-TUID: uNNcyaIefFPu

Hi Eric,

On 01.08.2017 15:07, Auger Eric wrote:
> Hi Tomasz,
> On 01/08/2017 13:01, Tomasz Nowicki wrote:
>> Hi Eric,
>>
>> Just letting you know that I am facing another issue with the following
>> setup:
>> 1. host (4.12 kernel & 64K page) and VM (4.12 kernel & 64K page)
>> 2. QEMU + -netdev type=tap,ifname=tap,id=net0 -device
>> virtio-net-pci,netdev=net0,iommu_platform,disable-modern=off,disable-legacy=on
>>
>> 2. On VM, I allocate some huge pages and run DPDK testpmd app:
>> # echo 4 > /sys/kernel/mm/hugepages/hugepages-524288kB/nr_hugepages
>> # ./dpdk/usertools/dpdk-devbind.py -b vfio-pci  0000:00:02.0
>> # ./dpdk/build/app/testpmd -l 0-13 -n 4 -w 0000:00:02.0 --
>> --disable-hw-vlan-filter --disable-rss -i
>> EAL: Detected 14 lcore(s)
>> EAL: Probing VFIO support...
>> EAL: VFIO support initialized
>> EAL: PCI device 0000:00:02.0 on NUMA socket -1
>> EAL:   probe driver: 1af4:1041 net_virtio
>> EAL:   using IOMMU type 1 (Type 1)
>> EAL: iommu_map_dma vaddr ffff20000000 size 80000000 iova 120000000
>> EAL: Can't write to PCI bar (0) : offset (12)
>> EAL: Can't read from PCI bar (0) : offset (12)
>> EAL: Can't read from PCI bar (0) : offset (12)
>> EAL: Can't write to PCI bar (0) : offset (12)
>> EAL: Can't read from PCI bar (0) : offset (12)
>> EAL: Can't write to PCI bar (0) : offset (12)
>> EAL: Can't read from PCI bar (0) : offset (0)
>> EAL: Can't write to PCI bar (0) : offset (4)
>> EAL: Can't write to PCI bar (0) : offset (14)
>> EAL: Can't write to PCI bar (0) : offset (e)
>> EAL: Can't read from PCI bar (0) : offset (c)
>> EAL: Requested device 0000:00:02.0 cannot be used
>> EAL: No probed ethernet devices
>> Interactive-mode selected
>> USER1: create a new mbuf pool <mbuf_pool_socket_0>: n=251456, size=2176,
>> socket=0
>>
>> When VM uses *4K pages* the same setup works fine. I will work on this
>> but please let me know in case you already know what is going on.
> 
> No I did not face that one. I was able to launch testpmd without such
> early message. However I assigned an igbvf device to the guest and then
> to DPDK. I've never tested your config.
> 
> However as stated in my cover letter at the moment DPDK is not working
> for me because of storms of tlbi-on-maps. I intend to work on this as
> soon as get some bandwidth, sorry.

I found what was the reason of failure.

QEMU creates BARs for VIRTIO PCI device. The size of it depends on what 
is necessary for VIRTIO protocol. In my case the BAR is 16K size which 
is too small to be mmapable for kernel with 64K pages:
vfio_pci_enable() -> vfio_pci_probe_mmaps() ->
here guest kernel checks that BAR size is smaller than current PAGE_SIZE 
and clears VFIO_REGION_INFO_FLAG_MMAP flag which prevents BAR from being 
mmapped later on. I added -device virtio-net-pci,...,page-per-vq=on to 
enlarge BAR size to 8M and now testpmd works fine. I wonder how the same 
setup is working with e.g. Intel or AMD IOMMU.

Thanks,
Tomasz
