Received: by 10.223.172.38 with SMTP id v35csp5112523wrc;
        Tue, 19 Sep 2017 09:13:27 -0700 (PDT)
X-Received: by 10.55.101.23 with SMTP id z23mr2539886qkb.257.1505837607308;
        Tue, 19 Sep 2017 09:13:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505837607; cv=none;
        d=google.com; s=arc-20160816;
        b=ghLmbej1P+nlUkvzr46XjAgK7pXpTHyfZF0IAmvHWIOUp9xu9LNXdeCQ7x8/UIJOmT
         c2N1xiCsTub7Ms1wgxJiltop95HX+VmLPxul2r1VjNSm8LWisFFlgH8oBkKqfsA9ez1M
         xWKejSh0lWrwtTPNjoTpoj1DO3gEIhsvgKSPhBTwJuwQ+a0ZTVfI53H5qrDvNAqTpNXJ
         3NMx55hSm1cMvegQ5pod8Tt69/c7tcnkO4JmcjEN6sH1EpN3QaJlz91QTEOcN6SEolbi
         WWzrTH/5ctXFooniGnAB/sl98J4aLXJBK0E50PglKricrZM/iXQ87vjy/qimMfYNGOLW
         mexg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=hXd6Zgdbz+CYM8YbKT0hj1rOb1Svudq7eQTtUjwZVyc=;
        b=AWmEHuOHe95q5kJcqpZEOzaalJhCFgQ0xOUE7/k4YY3GZDss/vzMJqken7jNETsFAw
         CP0MGY5aymoxpz93La/kyW+LnaLY5sKeMDiE3N1D0HbigwXpxy7Tow3bWG5o6ZsJixwi
         gHFunc6NIK484V8PdNUtwG0Ax32cwLkeb2DMm4sML/ktDFQQQ7M/ugstoXqrXupiWA6Z
         5hmQ3OxlpKfpDYPFVoR8Zw/g4lPwRHUo+7ygR3zMHCnui80IvOg3vpBuwbg0yCiR4w5a
         1AdLeFNEyqE1vjCYjGtmLjYvfecLCkyDxrC2H/rWULDpIju4ERazCfQ0+GYJ2kinR2pA
         wodA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b0C5TfxR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r125si393671qkd.532.2017.09.19.09.13.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 09:13:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b0C5TfxR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43990 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duL9J-0005jJ-0B
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 12:13:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duL94-0005fd-P0
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 12:13:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duL90-0006GD-BJ
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 12:13:10 -0400
Received: from mail-io0-x22a.google.com ([2607:f8b0:4001:c06::22a]:55536)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1duL90-0006Ft-6u
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 12:13:06 -0400
Received: by mail-io0-x22a.google.com with SMTP id z187so209380ioz.12
	for <qemu-arm@nongnu.org>; Tue, 19 Sep 2017 09:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=hXd6Zgdbz+CYM8YbKT0hj1rOb1Svudq7eQTtUjwZVyc=;
	b=b0C5TfxRuMhm6aRRNtBvmglisiha8BTnhshNCvRHbGHRBrNpbg7ReVOYqaYyka+MD4
	8ZLbKrzn7QPZIHAWIKMHMb09cE5Zl9Ubv8iUfk16WgCyzEjoowYC5gItgY74jly9rndi
	ijKSFyyYJI7TCgPf1jlgxZvDjtn/JphUR/XOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=hXd6Zgdbz+CYM8YbKT0hj1rOb1Svudq7eQTtUjwZVyc=;
	b=YeA4Ks3N0orMZyzHsG6tCa/VqtuokzoAyL8Vc5lqQp574i453zRWfMNpprxe+5YVvd
	YaiaUnyt5Ygxb1nfXMNr5e+g5iCHlh/LUgHbibrHKgnnETcezbXUXQbA75z7Fu23DVZf
	xjAOc8iqpjgbafKlozgkUbe+FmeVjZ7Rj0tETIqQghO7bz49VBuR6c6E8F/tTUGPZ5e6
	V3AnAh64a2h+VhYRM11ZQ94eBq2oKOQ76R5+HV9J1Kta9iRBe9HdRZ4LF1d2JuYiwJm5
	Ta8Scf++jxkNZRRXQyNi0yxMGaNJISWnc0Daqiz35ourfnFUavBDR1BBrpTBKhvwxdVb
	y9Pw==
X-Gm-Message-State: AHPjjUg26uULx0wimvKkgZ0xj0ScQcYo0BWBkqxW1uwMKqinWL14z0sW
	0e1II194QUBqnjg7XuCYUloAQw==
X-Google-Smtp-Source: AOwi7QAhFWG9ZPljCFaypK8ZofGcnU5Tokor8yXWri0pJ1YLgFRluOq05ODz5LqZMOSl08kvfWFnjA==
X-Received: by 10.202.72.20 with SMTP id v20mr1956330oia.195.1505837585380;
	Tue, 19 Sep 2017 09:13:05 -0700 (PDT)
Received: from bigtime.twiddle.net (162.189-204-159.bestel.com.mx.
	[189.204.159.162])
	by smtp.gmail.com with ESMTPSA id h63sm432883otb.59.2017.09.19.09.13.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Sep 2017 09:13:04 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@imgtec.com>, qemu-arm@nongnu.org
References: <20170914183516.19537-1-richard.henderson@linaro.org>
	<53de205c-7c24-426c-129a-7cce7ca67210@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0a265b7a-c84f-fefc-41e6-0276dfc131b8@linaro.org>
Date: Tue, 19 Sep 2017 11:13:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <53de205c-7c24-426c-129a-7cce7ca67210@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::22a
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 00/10] Support the Capstone
 disassembler
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T37s1HVVN+7t

[ Just saw this, so missed adding tags to the v2 patch set. ]

On 09/14/2017 11:53 PM, Philippe Mathieu-Daudé wrote:
> At least this msg disappeared:
> 
> "Disassembler disagrees with translator over instruction decoding"

It's back in v2.

> For i386, arm, mips32/64:
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Which patches?  Which mips versions?

Can you, by any chance, test micro-mips?  I'm certain I've got that wrong in
the v1 patch, and thus I dropped the mips patch from v2.  But in theory
capstone supports umips too and should be trivially fixable.


r~
