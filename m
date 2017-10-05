Received: by 10.223.197.9 with SMTP id q9csp185255wrf;
        Wed, 4 Oct 2017 21:52:32 -0700 (PDT)
X-Received: by 10.200.37.136 with SMTP id e8mr30986333qte.112.1507179152385;
        Wed, 04 Oct 2017 21:52:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507179152; cv=none;
        d=google.com; s=arc-20160816;
        b=nZAihJiIV+Y7D3cCABZl7UwmK+vorD/jyL14I7nlkJt+YZB36+m+m5HvnRp7GDKoEm
         c1bj1pb54VY645s9If5q2JnvIgtCfZPiZGf2u7ZFsAxedOIZi6EpFvUfTpauSeux2dD6
         uU90VbmQcMf39w1WzWitz24fcMjuT7/RK53b0Xy5xhCeBnUyMNkjfoW3KU92OOiXJsQ3
         lPgobrm/7FaR5xOmfov7RAPOwTgC8rw1G1QdCm9bK0eFd6A46fDGGcU5Y/6Kn3lhxVpt
         cXkF7rrkDofkNG/BqqTx4gyf0bDIaFsThxOO/sCaXADdONPzWhz89DsLYYLBPtXm99BY
         kKIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=u6+zHQhRac56LqIi4mOjnpb4zRioYkBrgd1aKdwtAbU=;
        b=nFyeIhzreF6gFW25GExikzHNCfcCACIHaVcpceMuX5LycQRO8ya6FPNx7f6G2n7V9n
         SxcSZhpykP1GXdRug0JnkTZpUqAZuTj9j+ETKAKpNHQSHe9g6UTKUqR1AJL7S8DKSWda
         4tPAx1xTY78CoJ859ZBz7zKXEEKUiUXF1xf0lN3Dy0Z88qVahmwsUDrCbMRzmOGEScXJ
         8ml4xmjvAkTk7Zuvh/iWImgJeM14W9eoK3WnSrxfSL1JTqFiCi97jhOebpUE4tYD6HMF
         /QG9UUoNpnaxLldVDeFoL8Xpl3M9z+GA9aOn9jmeIgkrRQrFr9X+neyBTPXLt9S26oGv
         va9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NOQnheXX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d5si5923196qtb.132.2017.10.04.21.52.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Oct 2017 21:52:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NOQnheXX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37785 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzy99-00030A-WE
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 00:52:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dzy8J-0002Wo-TL
	for qemu-devel@nongnu.org; Thu, 05 Oct 2017 00:51:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dzy8G-0004Zo-SS
	for qemu-devel@nongnu.org; Thu, 05 Oct 2017 00:51:39 -0400
Received: from mail-qt0-x22e.google.com ([2607:f8b0:400d:c0d::22e]:45065)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dzy8G-0004ZU-Ml; Thu, 05 Oct 2017 00:51:36 -0400
Received: by mail-qt0-x22e.google.com with SMTP id k1so12281391qti.2;
	Wed, 04 Oct 2017 21:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=u6+zHQhRac56LqIi4mOjnpb4zRioYkBrgd1aKdwtAbU=;
	b=NOQnheXXHjJyzZ/XsciWYlTxEuMcJb48WThjAHFRaJtscewAWCWEhjDlYWW0zgJI84
	eWe7uhWs/wc4nHWCiD3VgyERq6ritKXEQ5O5oKu2Ecs6/okmgUZK787aJGsxrq8F6TKW
	mhPYbUMihn5l86BtULtl5SI44zwLAnxPiPM0uUbNTPy5gGo+PsGKqbt7L2FwosOxX9cU
	qBvFv7zURzt6zgKbuXLpx7JCSda5jTJiGG9OUB3ggp3Lt4BVlXQwMheXjl43GSNpq3WN
	nP8zhcbecL/Bw8hT+Ur8svtOa4G08EAFS9R4YG66DuyLIPr4Aw5XVMwxPBi8TjpG1uti
	X5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=u6+zHQhRac56LqIi4mOjnpb4zRioYkBrgd1aKdwtAbU=;
	b=r6MEVAtYClnK4D+nF91LDR+z5ChQjYAaowDVsGv0/v76NXq34Zev2Z6qrQnf+ToZ1x
	M9+i3Mep0yKkm/+Z9Yc1xlRtHWrneLufzQn1GVOBK5EYNqHYizwfJOKs6zoA+SmaQ9mS
	u8ndFjwDUK1EaWVPt8jXn3UdAVPJC/CJmcBJulk4NsLBVylBFO8xKNWGOJ6AWAnxLH9Y
	8iX4csESMo+3vtEGXZ1tgbQBTLjcMmGUI7dUxC4uQZOKrF1ABFBlc8Xu9ov/sp+ZNjqH
	rGOa6KTFHpQxUlfvJGfFJrhJaf6u8ImeYK50SCtCFmjEi/2XdHXti/pralhn8s0voxlc
	HZNA==
X-Gm-Message-State: AMCzsaXUz5F5UJ83OlVnoq4VxQSDot1P3GbxuCooO7wFL5azhYyK3ehe
	ufRZg8fLG61cmpL4gulcRDM=
X-Google-Smtp-Source: AOwi7QAfgiRgkODmDR6xZ2A/RjmOcFK3vwuC7e80IoDPPwksDAwWAF6H6RHIntd1KkpkxZQaJtkwrQ==
X-Received: by 10.237.34.181 with SMTP id p50mr32527373qtc.192.1507179096066; 
	Wed, 04 Oct 2017 21:51:36 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	n45sm6104880qtf.51.2017.10.04.21.51.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Oct 2017 21:51:35 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <c00f7502-c67a-f1b1-2a05-70215be6fa2b@amsat.org>
Date: Thu, 5 Oct 2017 01:51:33 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22e
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 00/20] ARM v8M: exception entry,
 exit and security
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EMh0Es9DN8JQ

On 09/22/2017 11:59 AM, Peter Maydell wrote:
> Another week, another set of v8M patches.
> This lot adds:
>  * v8M and security extension changes in exception entry and exit
>  * the Security Attribution Unit
>  * SG and BLXNS instructions
>  * secure function return
>  * and a couple of fixes for bugs in already-in-master changes
> 
> Most of this is just plodding through fairly obvious implementation,

Heavy stuff still...

> but the handling of the SG instruction is a bit funky (see commit
> messages in those patches for detail).
[...]
