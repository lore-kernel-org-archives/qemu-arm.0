Received: by 10.223.161.27 with SMTP id o27csp130396wro;
        Mon, 23 Oct 2017 19:26:14 -0700 (PDT)
X-Received: by 10.37.102.68 with SMTP id z4mr9373955ybm.132.1508811974751;
        Mon, 23 Oct 2017 19:26:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508811974; cv=none;
        d=google.com; s=arc-20160816;
        b=FJXjSTgDOvLKFSw17Oj4QkvnT2vF6EnnK0xX4rdoOiL9SAkAW728ywi58MD/Wak27O
         zjNA8Z24f//AUzEMOp9ThL8mEOW9SclVoIYzaD5AfookDxp8hjauQmeKhNSmHs4ZoXbD
         lVBtqR5enHw1gcqVTUoepasLPRSqXdkgL0SQKwzRGafR+4T4TdDvG/Tw1zPsQrKOgTS6
         Xo65KegM1pwvBA8p0pXoMQiLQYMBKOJ4E7xRiVLwUyT9oTEIPY2QxsDSpj7G5Mxxeomi
         O/EndAqleYeu3F8AG1NROQwywEuQ24WtM4zG3R8/jbsu5kPRiv2v33vjqH+v4lAtPt6G
         opGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=ejxa/iBrUDjf8RGjU3kpaM/AFO57rpN7+5TMbuyLiYQ=;
        b=pUbwyPjFonmzvJvor2MXrYV9UkhfArJCqnINZRXd5ttP+XzmG15AFf0pxqQMJI31eB
         xacl84qwVa+M3odwO5wOzK70CFckRcNkV5zBc7BFo4sLuyrNJM2og/aHCYNdOGsRKE3P
         oT6oosnNt5xNWJcIBRUiDxEKAKK66jld/SKHx3Ds0GSOK1pv0GoA2KUOeAQTDF6MnMKU
         YMh2jah9cSolk4F1YNIzxgdSgZYiLW3Nq3emryehpTxKcAQpDSrhS+z035eArycfJMAk
         oxxUiVKXt5mHr+wRI133dy7HvvFCZkKdYW6Hk3GsWqVKYyahH10ct4sIRpIbWpTWiSTS
         Eg7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Esl0WVdX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 192si593227ybr.24.2017.10.23.19.26.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 19:26:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Esl0WVdX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41374 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6ov0-0003cZ-8K
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 22:26:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6out-0003cS-PI
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 22:26:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6oup-0000lz-9v
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 22:26:07 -0400
Received: from mail-qk0-x229.google.com ([2607:f8b0:400d:c09::229]:46879)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6oup-0000lm-3n; Mon, 23 Oct 2017 22:26:03 -0400
Received: by mail-qk0-x229.google.com with SMTP id k123so24519972qke.3;
	Mon, 23 Oct 2017 19:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ejxa/iBrUDjf8RGjU3kpaM/AFO57rpN7+5TMbuyLiYQ=;
	b=Esl0WVdXmxzPqR3qdweJiq+x6ptJQmvThj9rwV6PwvcWQFj6wa8PKr8u+tTOa0LEg4
	hHh7YmwIPbUmbpVKoLun5kjg46mPj/+os5ma4QcScLmLqmnUQAzlkleijcZTMjPkr9ZZ
	nj9YUrReWYaRFy/tPcty37X0NealFja5IbroJ1CKrG5OLH6rzmmX7gjQGcfvmpglfC/S
	HGu+1pmkUO72aDHkhi2Og1O1xD1x/N0AzjGHQ5uqq7w8aMQ+xAYxqLBzQGqzKYuWP92h
	a8zNjHueFWiYClK5kFhQkN5uD9o9iHqZJMzY3NVqilg6R6Ed4vafifodww3iMswN25LX
	TqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ejxa/iBrUDjf8RGjU3kpaM/AFO57rpN7+5TMbuyLiYQ=;
	b=qLV1OuOkXwXvTwnhTmETbpoM1cI9IZDGRwFb2rRSM2Cbm4BLqGXUZpgCpjOq4a+NaY
	l8h9/iy1J25mBB08CJ8DujjoomfXXmhyhpeg8Vh/DJmfK/ui7dJeZVQTKiyM5u0vcLGB
	bLzhW0Dz6qOtarPbKxmD6mkI/L8MbDHdzEUDhHgeJDsDRR8wwm062JgK+2uQiJgEYYop
	Y/apCFVvQp8wvpPTrEn9C6c9HeHIubyljcBMxpaSWXpKba1s9MnfW+fWYEyVUwuzG6gw
	oJ7HqZgoOGJBbvAaXkh/j17Kh0ExJuQM94U2JnYS+2zNS0aEbQZogjWbIY3aUKkgKKpi
	o65w==
X-Gm-Message-State: AMCzsaUyGVGDuXISC72vYY20NUfSd6w3EhtzcSVCefxE4uX8SnDkYu32
	G7n1iWIfw2lplU0kYfLBaC82oVOe
X-Google-Smtp-Source: ABhQp+Q3N9YPgXuq5KwrDRNon6egIruISxBiZSHmvjtGsWTMNk50kAMMjXNLroSU/dbpz45yPgBcnw==
X-Received: by 10.55.124.198 with SMTP id x189mr21875743qkc.40.1508811962396; 
	Mon, 23 Oct 2017 19:26:02 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	m50sm5968786qtm.31.2017.10.23.19.25.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Oct 2017 19:26:01 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <150860960347.476.5295412873363332990@b58463cdfd5f>
	<alpine.DEB.2.10.1710231352260.574@sstabellini-ThinkPad-X260>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <35a705b8-b90b-d84e-9d2d-5ce983da5fda@amsat.org>
Date: Mon, 23 Oct 2017 23:25:41 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1710231352260.574@sstabellini-ThinkPad-X260>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::229
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] fix WFI/WFE length in
 syndrome register
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, famz@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9ZquQO4X5ATv

On 10/23/2017 05:52 PM, Stefano Stabellini wrote:
> On Sat, 21 Oct 2017, no-reply@patchew.org wrote:
>> Makefile:30: recipe for target 'git-submodule-update' failed
>> make: *** [git-submodule-update] Error 1
>> make: *** Waiting for unfinished jobs....
>> make: *** wait: No child processes.  Stop.
>> === OUTPUT END ===
>>
>> Test command exited with code: 2
> 
> This is a false positive, isn't it?

Yes, it should be now fixed:
http://lists.nongnu.org/archive/html/qemu-devel/2017-10/msg05484.html
