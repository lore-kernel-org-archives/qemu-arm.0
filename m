Received: by 10.223.172.38 with SMTP id v35csp1967071wrc;
        Tue, 5 Sep 2017 15:53:50 -0700 (PDT)
X-Received: by 10.200.44.173 with SMTP id 42mr938901qtw.94.1504652030742;
        Tue, 05 Sep 2017 15:53:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504652030; cv=none;
        d=google.com; s=arc-20160816;
        b=zPYMJCxbeuQKErdqt8uFK5d/l4uU0QOUJhrNIak7ZQH0GAfEM//pR23l3fdCTJD1bU
         BglEL4RGZVLm1ANQ7zbrftYfWQBxlnHeUwT5CviHnA/9nx1MkxM6k38B9U7VEAC2lPb2
         yHMBCnftmDA+9J4kMLKWbvomVsJvwYERcF1t8ulTxnY90TN7JPV+jZ+In/dhf44lycgk
         eD8WZ+R02+aSnwsiimPIiGTzYIjRKYJlqWCSJqBuKtwQQV6KgjckdhAHu5jDCqTt69sb
         G5C63CGP63mx68T1HeRs1Ea14KaSDdTYImgOY6mptGWRYJVGO2Pw04CUmfkYFzpXT0Dd
         XQpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:dkim-signature
         :arc-authentication-results;
        bh=uZoEvajaRe9e7JtJFNvKICEhdyfGtINybAnTufaRcRQ=;
        b=DZQeZPHScVtP9NVpfRMOqcVEF2EOGJmeSqFE5X3vQGez9KhonaQKiQY31avZRfvmwP
         prdfdO11tqbMVc/reoaW3r8k36JWTua/38oD7j1Ede2sYd1UQ7c+glm8UaHSl4Qp797U
         YvWwQ7z4HRqYtA74Ad86FyqGQDre5iGuzhG6wLwIONJZurn+e5ZW+1M/xU3cXQyeKkxL
         gXd2yTi2RQ+Sayg/bCHuo0pm5tA6Ypgg20ipl5E/Q0rIwrPGhbLplG0Mhyjv7B/vEyit
         U675/vFj6PzjqlOBZG9pV4fSyNNLF/WPCuO+GP4c7AhnQAnVNPAGUzs8H4nvZqCn+T/C
         sXjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kubTdel0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d8si1434725qtd.442.2017.09.05.15.53.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 15:53:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kubTdel0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33451 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpMj6-0001yi-Hj
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 18:53:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60735)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpMiu-0001uh-8y
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 18:53:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpMip-0005M3-NJ
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 18:53:36 -0400
Received: from mail-qt0-x22c.google.com ([2607:f8b0:400d:c0d::22c]:37106)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpMig-0005HT-D7; Tue, 05 Sep 2017 18:53:22 -0400
Received: by mail-qt0-x22c.google.com with SMTP id h15so15892528qta.4;
	Tue, 05 Sep 2017 15:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:from:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=uZoEvajaRe9e7JtJFNvKICEhdyfGtINybAnTufaRcRQ=;
	b=kubTdel0ZJdl9CUgtKkp0Sj1wyk3BsXvs+H+M3IuIqYu1QZfTFLN/l3O5aU/nXRpre
	sXGgbaoKKM5qqhqhXTbnp7iSBPGEKfpIxWcS5GokdhU6vqmrx8PMMp9LEJZ95gfLBmil
	8CxFLjTVNZwGGwpb9tIP3hyvvRKEoyausmfnqk5OWR/ktg+crmmBdnEirNstgaXYEPec
	h+CtsMZp088xhSNFBkDYcrGogfksXEWX2ZjIyPMIKnLkcizlXmfrRCax0AsVJRVcYe18
	4rYCZNSoBECBqmJ7g2767HwPSCJtSMQ+2b/TaKD6yXNwbD9gwgODNc4zDGCJ9ENPe9Ln
	5dUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=uZoEvajaRe9e7JtJFNvKICEhdyfGtINybAnTufaRcRQ=;
	b=VBuw0rbUcy2Mi8lCqCfEMeHXBysGwonUTx8pl88lHrxZN3AstEdvQEpovDrzKSJS7W
	fa0Or0szd5Q1whltdt0zH+Qo6uVoWzHbWejXy8a0geHqDd/rwhblmfxCnq1X1QjTY7B/
	duVDHWTFUVPM/TDyidOh/TB3S+6F4FiIqsLeRkuzqU5v2oehSoD/FNsXKFL3sQvg3zp7
	6t5Rcd5Br3u+Pc6WPpU7s1I0fppu1mjhntxdfUJuewjMWNYfOLsQ6Cxq+qd/fpgUdWcY
	Ed3CTf3JBf9ix5uDH76oCs6HjvBE77KY4ZYnlpZHtQa61WoJaWFX8w8pHOINmOvLDPg6
	eFGw==
X-Gm-Message-State: AHPjjUhdGBkMGTu+ADTtorY5DmujyIqg3/NbqW5c57pNIqC2MN2PQr/C
	Ts/ruDkLto1/fw==
X-Google-Smtp-Source: ADKCNb7V4h4sHZBy67C+frUsPa1KcLGsrYG3+Qd0p0aYWp6yIAMHs29zH+5KCOU+CSm6wc5shVpeJg==
X-Received: by 10.200.22.93 with SMTP id x29mr913975qtk.111.1504652001713;
	Tue, 05 Sep 2017 15:53:21 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	z22sm1128522qti.42.2017.09.05.15.53.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Sep 2017 15:53:21 -0700 (PDT)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-7-git-send-email-peter.maydell@linaro.org>
	<a6b2c6cf-4cd0-cc99-daef-ab85f6a4b1a7@amsat.org>
Message-ID: <58accaee-f69c-e644-9218-6068dd4271ef@amsat.org>
Date: Tue, 5 Sep 2017 19:53:18 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <a6b2c6cf-4cd0-cc99-daef-ab85f6a4b1a7@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22c
Subject: Re: [Qemu-arm] [PATCH 06/20] target/arm: Make BASEPRI register
 banked for v8M
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vTu13dKIEO54

> On 08/22/2017 12:08 PM, Peter Maydell wrote:
>> Make the BASEPRI register banked if v8M security extensions are enabled.
>>
>> Note that we do not yet implement the functionality of the new
>> AIRCR.PRIS bit (which allows the effect of the NS copy of BASEPRI to
>> be restricted).
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

(forgot to add)

Anyway:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
