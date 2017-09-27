Received: by 10.223.172.38 with SMTP id v35csp4558763wrc;
        Wed, 27 Sep 2017 03:53:58 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCApRUfhkMHBs3cJD/1XkpJiSzTOEbdgYQ6e3NQFamhBYDyJPUITwn9NK/94fhODASu8MXp
X-Received: by 10.55.200.210 with SMTP id t79mr1687592qkl.140.1506509638180;
        Wed, 27 Sep 2017 03:53:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506509638; cv=none;
        d=google.com; s=arc-20160816;
        b=rOtiZnwOXsZT1TemUsOmsQN29R8a1JeYezV9Cv7g0kWH7gMyz/cE3M/LAtp2KSmerO
         ijSPuE/0eLON+b1SWyaZkj0yFmslzyIpuBG5Ge01UiYcK5vJGUlr/P6Ns4G61FRRjJ+2
         p8+iOa4ZRPI+e07AhYLyUxBaRXJAN4R/jJL4kZfhugxThXOeeAkmdri5xdP6RPg1NUhp
         3ruQE1P5dRhD5CbXV/m+0fm9gWKhoJx4SI68x8D4W2G59x6nu6yQIDa+murhQaBXAlKL
         STZm+0D1mq2bdoJpbLmvAzMCFmtkXiY0gm0TEErmcktOMe4hpt6erwbUwqrxogZO4YSG
         LU+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-transfer-encoding:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:dkim-signature:arc-authentication-results;
        bh=hCllQF7s/V/swSbckBJk6PmSgcQ6r6B5HQCYgYLmjd0=;
        b=EVgAsfjYO4ZdsJz+mcZE62DKTneTAbRQ3PpnPWhYBCjvtB9AQpG2DqfXfEK7XxoY4r
         TV4NKzMIisMJtYfXEe5TX3ULq8Jl9piBx+1kT8eLpmTY1exrRy+3PLvIAC0U5hJGvIBZ
         A2xZGfm/LxnAiStNTl5BTAJ+46tt4+sDmT5qaN/tvvxLRjyl7uLovLQUvhW63xsmsGp6
         csjijiKHDYNZ30B+ciTXMrH2lBiNnPMl+GFAjuKTGtGqrWiQS6TL50jG6/viVdi0rQhG
         xlX11I1ie0sThvqWxAKzuAJg9cULgxauJVyXLwEhDvGus9WQM41P2GXpPkpc2z5IF5lP
         bATg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com header.s=selector1-cavium-com header.b=F4z5jkcD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p125si6102803qkd.162.2017.09.27.03.53.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Sep 2017 03:53:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com header.s=selector1-cavium-com header.b=F4z5jkcD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53973 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dx9yV-0001tX-VK
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 06:53:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48236)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Tomasz.Nowicki@cavium.com>) id 1dx9yJ-0001tR-V5
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 06:53:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Tomasz.Nowicki@cavium.com>) id 1dx9yF-0008BP-V8
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 06:53:44 -0400
Received: from mail-dm3nam03on0054.outbound.protection.outlook.com
	([104.47.41.54]:33056
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Tomasz.Nowicki@cavium.com>)
	id 1dx9yF-0008AN-Mx; Wed, 27 Sep 2017 06:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=hCllQF7s/V/swSbckBJk6PmSgcQ6r6B5HQCYgYLmjd0=;
	b=F4z5jkcDEFQM1dqSxBvQW8ym9h9nUzGXbP63vD51kX01IYSJcVplRX8CtdGe1o4q5u2Mks0zLH5pLvF3YJSBZjdqJ7SZXhL6t5CrChAAJjZDWQwsInqB8UZ5AUpAgSM5s8scEcoJps56eJA7ihSyYI0jQB4FqbFAKzPFtFVPmKg=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Tomasz.Nowicki@cavium.com; 
Received: from [192.168.46.112] (12.108.191.226) by
	DM5PR0701MB3656.namprd07.prod.outlook.com (2603:10b6:4:7e::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.77.7;
	Wed, 27 Sep 2017 10:53:30 +0000
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	peter.maydell@linaro.org, alex.williamson@redhat.com, mst@redhat.com,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
References: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
	<1505807208-9063-11-git-send-email-eric.auger@redhat.com>
From: Tomasz Nowicki <tnowicki@caviumnetworks.com>
Message-ID: <4cecfa75-c97a-586b-aadf-9b0bfd168960@caviumnetworks.com>
Date: Wed, 27 Sep 2017 12:53:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Firefox/52.0 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1505807208-9063-11-git-send-email-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [12.108.191.226]
X-ClientProxiedBy: MWHPR2201CA0012.namprd22.prod.outlook.com
	(2603:10b6:301:28::25) To DM5PR0701MB3656.namprd07.prod.outlook.com
	(2603:10b6:4:7e::16)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f6ddaa9-3846-4667-eb21-08d505960004
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
	SRVR:DM5PR0701MB3656; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0701MB3656;
	3:L96c0OlshB2RysxXy2lFlVmpqvLbIxXJf8FKhAkKiMxQsxd0yoUtPx7joccECIJqogC9ZQeyH5hkj2Bws90h/EM112mLXnXF1GKRC28AwJyfmsINFgRdjNliAyVd2aboDeuqiKYZNnUwyXHYmPABRBNDrqksigTmUQ3QC1kJ/uw5Tp0kHM06aH0YNyR1h15UQnImrAwwfVBmfii1Av9+C1fqugvh7GWIAGd+AT3kJTTXDE06OU64k7T0qZEY4bJK;
	25:2v52uYPnuHSOrK5BuEJft+CKkZF++N4YcgvoAqDZYDzyuD+DhvNGYUF+aTVHfdvfaLw7RP/Rx/bAwb7//C1p9R0Accu2XfS+XZupc7SW4dWGNj0rmydqOL7R75DHa1cJoB68ujPf6G2NFZ8bTfdwFhs1r+spMnEl43PtIDyUDhF5UKc14jxDQk7gDC2ZN6d3RkAWaFTNoytHDDIFa1Q4hD1vG/5Zp4j1cRBI1QMkDH0+Vh6mRgyXeG/kNM0xLRaFsaGT7x0ElY80shpIJEabNuAzY5b1b0oHtFwRukpzkNJwyDywjiA2lpG6CMgsvm1SfMAjlZpy8N9jgW4u0ASpUg==;
	31:SENuSl3dth+C20fFsdkzArFk6uzgrwNKIIxt/7xcRppgmlQvgvjF2Cb8xwFGlVS5N9R0RFoOKlDY2Reyo7s2z8xWX9rk3Bhb19mgABRIPzgd4eWK22F4Jtu7WeLt5yjfuhge53FvtgEPxCppQT1cBjvhIOWIpd935zuFWGKr6zdWH1kSzQ6OB4FzqkFMPNFAnESiJ70ZtgHxgGk0z5VojZ/T+35gkVLsqaoDm/uLRqU=
X-MS-TrafficTypeDiagnostic: DM5PR0701MB3656:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0701MB3656;
	20:qM7VBa+MOK6oxI7L3XLIKhvzSJtamt/5uIWHEoZn9lneKShT/txOQmP9XRjbLyKzGR+DadayjdhIzt2Suxw8XsIneoPObNIM8ziuWlqJYKYTG+rqauV8gqP+KrSQPweorRXNkAUyAH8Fpu82hAx/4KXlYU9o9qIi0iFOPbL56REBju3NV067rkMKwmIj1WHtmGsvOfEck9QRm5ClOSka1RFdPVBhLaLbZWyKe6pPoIOhdZ65j2i9wWZgNLOIDvWBcpwieeX2RKRfbIXJH5mwHLQ8ZCndKqL0nOXR5n5r7D8sMsfD+5ISqyWUjC1uMA7u1VZpZbybTqFL6GEEOt5XlI4kLR28b72o7SKdMLTR/g6q+IR4wrdFcnvZybsY2yBcbEZHnHjSE3ETnl8GL9yES0oCew6Gbd+FMkz62S7KBmrR/hNOdL1YAe0cgfIYc7oxMsU2B5uzH1gnBl4+z6ckc9/IramZChUKhqtQEqLgmYdwB2eu+0IZGbMTI6E3/slVsJhRMyamLWvNYr1u3jURmS3X2IP5vqKJeXO+qUoKIGMxI6yBtf6YISWIN8lOABslT3MBMcvJdr1XWIUP53fQnl6rdOVL/RVBMFl/SyqCcG4=;
	4:REw8cT0q2tpXCA9rqPUzrvgkGYLVrbIpiCEkTjyHB0wuChSLIthvtQHrpXm7Cp1E5j45alwbFPi8qobpJjhq6O8xe35/iRKRVHd5H08Mfs2TM88xYTl3fbqUYNTz30Lq1+bJ2qhJa0pCriLxYeb5dQA2HwQPSoMdbNyZ0YPyb5j34fQUbMB1sEHNkUl01LIWBELGjzjIX5iBJPvZbinD55kV8Uk3yo90Qgfx7Oz33N5o5xgCipFExp5cuBOsNElG
X-Exchange-Antispam-Report-Test: UriScan:;
X-Microsoft-Antispam-PRVS: <DM5PR0701MB3656F74CA1501F7107F2F006FE780@DM5PR0701MB3656.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(93006095)(100000703101)(100105400095)(3002001)(10201501046)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123558100)(20161123564025)(20161123562025)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR0701MB3656; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR0701MB3656; 
X-Forefront-PRVS: 04433051BF
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(6009001)(346002)(376002)(199003)(189002)(24454002)(23676002)(54356999)(230700001)(81166006)(81156014)(8676002)(50986999)(76176999)(31686004)(105586002)(36756003)(316002)(5660300001)(305945005)(106356001)(8936002)(31696002)(478600001)(83506001)(16576012)(16526017)(53546010)(2906002)(72206003)(58126008)(97736004)(4326008)(50466002)(42882006)(2950100002)(64126003)(33646002)(117156002)(53936002)(25786009)(39060400002)(7416002)(8656003)(6246003)(68736007)(101416001)(3846002)(6116002)(7736002)(47776003)(6666003)(66066001)(65956001)(229853002)(6486002)(77096006)(189998001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0701MB3656;
	H:[192.168.46.112]; FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1;
	LANG:en; 
Received-SPF: None (protection.outlook.com: cavium.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjA3MDFNQjM2NTY7MjM6KzhZeFN4L0xzMGlPUlpYajg0UVF3M2ZO?=
	=?utf-8?B?eERVZjhVVzFXSVVOSzA5bk1EY2xwWFJnd0RHKytqdG5ERjdpR003dFNFdS9v?=
	=?utf-8?B?L3ZPTjhPbmhSek5zVVF1cFBpRFZFVVAzdm5nb3ExU05jdTNjbnBQcXpNWDlk?=
	=?utf-8?B?andnUlV3NFh0cTlSeUlhQ2hOZldqUmpJVDV2K0FiRjgzWGFJMk5rTGhWK1Rs?=
	=?utf-8?B?SlM4cXl0aWNxYlR4MXFjcHM4dlJReTFSaWpid0Jlek51VVNSam5pN0MrN2hO?=
	=?utf-8?B?UW1GUGErOGlWRDFraDBHbndCcDFSNlJwRUlFUWFKQndLUFJ3Ti9BQVNrRHRV?=
	=?utf-8?B?ZSs5cXc2bHh1SkZkRTJTUW5FV1U4TmJJVzJOZ2hHZDN0UTNRNFpqUURHZjNa?=
	=?utf-8?B?YUpGOTRmVldCWCtFejZwbVNZRzVsanlrVG5PN3p0QkpnWDVCdWtMaGVJU0tj?=
	=?utf-8?B?VWhWbWhDTWxGaHJKK2RHWjFGcEl3WUUrN3F2bE9ZdXVoUWlCZ1ljYUIwbWRm?=
	=?utf-8?B?bnRlQ3VTbkxjTjlwMW1ldUh0MXVPZW9WTlhuUEFlWTM2ZDFUNWlMSE81eit3?=
	=?utf-8?B?YXY0dEFBS1hjeDUyZTNSVWtzWEJjei84WjdFREVHbVFqOXdtNytOK1FpNXFv?=
	=?utf-8?B?aGFtMUR0elRKUGZiZTBzbjdKLzcvc1A5V29Id3FsblBwNUw0UWxEaDMxclkw?=
	=?utf-8?B?MmlreXVOZWV3STAramZESFB1K1lLVHFjWEhJSW9YajRTNmxzNUFLQzFzZGp4?=
	=?utf-8?B?RWFiRy9VR3FsU0lOZWkweUkzQ0gyaDhXWW5sU0ZxanJUNGYrNHFTNmJmM1Az?=
	=?utf-8?B?ZTdEVEtOZmFCcURNaTFXa2lWREFSNnNDbnRQVDRWRm51S3VHYkJrdlAvWGx4?=
	=?utf-8?B?MjZ0ckMxWGc2bU9tNWJ6NTV3ZDJDOWJIaVRUc1BoNzF5Y2hvcEpPeUJjN05Y?=
	=?utf-8?B?Q0lpVWtML2VMdlpHeVdkNFdJaUQyVnU4Mjd4M0YxVjU5NFk4cWxQdFhaUm1R?=
	=?utf-8?B?cGUvU1ZuY3VmcmZPeHlhQmlSa3FORmNmclpuaEwvTSs4MTJ3emkyM24yQ0Vw?=
	=?utf-8?B?bk9WaXMrcmtTNzZ3dFRLREw2dFlqRTFxeFg0M3NqdHZKeG1yekRHMEx4eDNm?=
	=?utf-8?B?c3NSWHhrc2dHbDFROUt4cWYwVnVkdVV1dStGbUNndEZYa3JRUy9VYXJUKzFy?=
	=?utf-8?B?U2k5ZlBXaXlQRW0xSmhnSVB0cjRnL0U3TlNKOUF0bDRHWFAxSldyQlNxZW91?=
	=?utf-8?B?VDJ6blRoNUx0bndCNGNUOUtOUklMZmJKQlJWSFByMllXczAxTzljMjlMVk5u?=
	=?utf-8?B?bjNBdmpOOHl5WEdheG5DM25Uc1AzTWE4SjAyL21aOUNyRTZDQ2dYWEd4WEp6?=
	=?utf-8?B?RWJYZnJWU0tUUlJoNytydm1BMUg2bGZnNTBGVmkrRGliWmM0Y2I4am5Lb3hX?=
	=?utf-8?B?NERCM1BPaDhCbEs1RDlEMjlJa1VXV29GWkNsYjhaME1IbFRQRi9TTEdYRHdB?=
	=?utf-8?B?cERBODJOclBUQXIwRFhZV1ZNWStrVUNUQmdSVzA3d1hnVVV3aWk0QlRpQlNl?=
	=?utf-8?B?ZUpZL3pTUDlaTTVNb2daTGxSM2ViVmJyZ3FiakgwZHV6cVJwWG5PSGtiRUdw?=
	=?utf-8?B?dmI5L2prN0R6Rk9kM21pOFlIdkZlNWxXRE92RU90TXJ1aWVmQmZndjBJc1FH?=
	=?utf-8?B?a3NGcHpsenBMZUVuZmFFUTBlMGwwQjc0dTBwYVNOSkFuTWxHdlBpeG5IOG1I?=
	=?utf-8?B?L3hwSWt0UUs1bU85aWY4TmVsY1pJVnNQWnZEZFhRdllNbDFkSUEyRVZIakNi?=
	=?utf-8?B?V0VvL25nNVJQMXJZZFZ0ejU5cWFUNitDWlpERCtTZm5KR3JYZz09?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0701MB3656;
	6:K45zgKPvoPtrlS6KpBj8AbUo2lXfTBei+7qvdxf5WJ6sZ+n57+6s4spQOnp8deoTcbKkCbuELhcIF0BVxdUbKHr7eIq7iYisbR44umKrAc7cBkw20R0OZj8+jlu9UWtnCrV4sO+jz8SFRkPxWQHWfN0t3pNUtO2nVbCgtM5of288I7p+boxpTecISlFi5U5UASWExFq9If1qy4yfvCv4N4XIjgwE9GhtmnREJvYTSDMrc/bR1XP57UbZhdLr8w2P0V5BxLikSSiDj41Ms0OKtC2PbLy0Vds7aYf46PqW6tJgcfXXFn3g2vmWHPoDlyw+xWph6U1YQuoJqGeyW6Bp3A==;
	5:I7DrcwE3mdGV3gVgk013Vx6iwfU3eDmJ30Wn1z3Zm6enymv8xQe31w5EfVruV6t4TGRIE8Y0nNsGK4rLC1ClDLp+0BH0Fn76Bm1bBzlbMWjDnjw6PiMfHUJIZ3Fyh+DFkqoIjKYEeqT1ff/Fl+R3sA==;
	24:BHw+qfKDTY8F+mtzgaxFExNqWA1rD1+2vxtFuHq4UPY+Q+F+Oq3nT3hjHQcOOt4sIB77y6oA+dWrZCw7ZQABduwgw4g4ID4J+CzzxenIcug=;
	7:MBJY1TzdNrR+Huuds/VYPV0vJRCCo4mZpgUSSUdpXwnm8fvSzBcXB0FN0VLe6FB5qvQXeKYjCMCQf7vYdSjbzlE+H9bl9pt0OI+vwElpClDv3suaYvTPbNyWtnjfUa7TX8kyA/DLNr9gzZMCNPNZQ43YFySbwhCnCoPgTYDrVjHNFJm0FisK65kEG2cnjK71U6i956wBlHNl8e3+t3IXbG36aPyJUaAB5UfT7BkkQ7U=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2017 10:53:30.1035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 711e4ccf-2e9b-4bcf-a551-4094005b6194
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0701MB3656
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.41.54
Subject: Re: [Qemu-arm] [RFC v4 10/16] virtio-iommu: Implement probe request
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
Cc: kevin.tian@intel.com, marc.zyngier@arm.com, will.deacon@arm.com,
	drjones@redhat.com, peterx@redhat.com, linuc.decode@gmail.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lg5lkBxDpSed

Hi Eric,

On 19.09.2017 09:46, Eric Auger wrote:
> This patch implements the PROBE request. At the moment,
> no reserved regions are returned.
> 
> At the moment reserved regions are stored per device.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 

[...]

> +
> +static int virtio_iommu_fill_property(int devid, int type,
> +                                      viommu_property_buffer *bufstate)
> +{
> +    int ret = -ENOSPC;
> +
> +    if (bufstate->filled + 4 >= VIOMMU_PROBE_SIZE) {
> +        bufstate->error = true;
> +        goto out;
> +    }
> +
> +    switch (type) {
> +    case VIRTIO_IOMMU_PROBE_T_NONE:
> +        ret = virtio_iommu_fill_none_prop(bufstate);
> +        break;
> +    case VIRTIO_IOMMU_PROBE_T_RESV_MEM:
> +    {
> +        viommu_dev *dev = bufstate->dev;
> +
> +        g_tree_foreach(dev->reserved_regions,
> +                       virtio_iommu_fill_resv_mem_prop,
> +                       bufstate);
> +        if (!bufstate->error) {
> +            ret = 0;
> +        }
> +        break;
> +    }
> +    default:
> +        ret = -ENOENT;
> +        break;
> +    }
> +out:
> +    if (ret) {
> +        error_report("%s property of type=%d could not be filled (%d),"
> +                     " remaining size = 0x%lx",
> +                     __func__, type, ret, bufstate->filled);
> +    }
> +    return ret;
> +}
> +
> +static int virtio_iommu_probe(VirtIOIOMMU *s,
> +                              struct virtio_iommu_req_probe *req,
> +                              uint8_t *buf)
> +{
> +    uint32_t devid = le32_to_cpu(req->device);
> +    int16_t prop_types = SUPPORTED_PROBE_PROPERTIES, type;
> +    viommu_property_buffer bufstate;
> +    viommu_dev *dev;
> +    int ret;
> +
> +    dev = g_tree_lookup(s->devices, GUINT_TO_POINTER(devid));
> +    if (!dev) {
> +        return -EINVAL;
> +    }
> +
> +    bufstate.start = buf;
> +    bufstate.filled = 0;
> +    bufstate.dev = dev;

bufstate.error is not initialized which may cause false alarm in 
virtio_iommu_fill_property()

> +
> +    while ((type = ctz32(prop_types)) != 32) {
> +        ret = virtio_iommu_fill_property(devid, 1 << type, &bufstate);
> +        if (ret) {
> +            break;
> +        }
> +        prop_types &= ~(1 << type);
> +    }
> +    virtio_iommu_fill_property(devid, VIRTIO_IOMMU_PROBE_T_NONE, &bufstate);
> +
> +    return VIRTIO_IOMMU_S_OK;
> +}
> +
>   #define get_payload_size(req) (\
>   sizeof((req)) - sizeof(struct virtio_iommu_req_tail))
>   
> @@ -433,6 +567,24 @@ static int virtio_iommu_handle_unmap(VirtIOIOMMU *s,
>       return virtio_iommu_unmap(s, &req);
>   }

Thanks,
Tomasz
