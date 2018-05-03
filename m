Received: by 10.28.4.212 with SMTP id 203csp2169826wme;
        Thu, 3 May 2018 10:39:34 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZq3+4EM8u0sQk8VuTiUKijg1FHt5HQ44EblUrJsRJh2isObjYoUFvpPCXDHw3VupNnNoQ4d
X-Received: by 2002:ac8:1b18:: with SMTP id y24-v6mr19824489qtj.161.1525369174482;
        Thu, 03 May 2018 10:39:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525369174; cv=none;
        d=google.com; s=arc-20160816;
        b=0OlkY3tJH3rr+QhEl2paapzM+tQFx0EM+7KB6+yb+hz3tFIjEduNcRlMhrxEkMftNv
         PQb6LH8g8g6z7yePkEsgVdRBB11KzCF9zNPYmr/ZeKy59bVRGcvCfTK9gw9vZrbkE9+X
         rtOPfffd1FzCZZzL0ZqLp7jFP1pdHqJyezyuQp3zdSlWbQshBIUGd4jBbsnWPQTgzkXz
         xgvMS5oAvbRKcMGUya86DzHX1KQCECiOODymLB3YPtz/9tePSzavE36y993+hrYyQziT
         im+g86fr8GLbvL7J2fyN17TQptGiETs5ag8YVAHOiDoarF0x7o8tE3AHKPQUKiA2Q2bU
         dbnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=doYTVqaHUExstSEl0w6N31X6O+Czx9BwTcnIurs7njo=;
        b=AAI+rwaN9OV6QM3kMjqzknGgK6VrA6Q9Y96dimAMN09V+LpC6IDyozh3doG2aCq/g/
         1OhjN5KU691iYfQ9StSs+8yJrj0xijh0SGmGjTY/rjiuXjtGfVls/zvpfL9YhcwZSnKa
         45gE9tS1gDKw4S5Svnv9BoG4DsRNtsqC39NgZxnowwyt9VVaDvu5YS5Qn9oT6HN3nTgI
         K09r8meOvkCNv/PCZFXwdyTTwGLYHaiwDGaW3/5rTKlLaejVOMQgm3yA1wvY9L2BTxkZ
         /hekPzpmmM7d2jQ257etZ8L6zYgOOPADOm4Eeg7hYchHpWLRwxl7VG2aqEE6oMvtr7IN
         jwow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DIbFpy/2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 124si211288qkf.342.2018.05.03.10.39.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 10:39:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DIbFpy/2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57980 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEICc-0001ei-1R
	for alex.bennee@linaro.org; Thu, 03 May 2018 13:39:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEICT-0001dc-43
	for qemu-arm@nongnu.org; Thu, 03 May 2018 13:39:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEICQ-0004xi-1q
	for qemu-arm@nongnu.org; Thu, 03 May 2018 13:39:25 -0400
Received: from mail-pf0-x236.google.com ([2607:f8b0:400e:c00::236]:41091)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fEICP-0004xR-SW
	for qemu-arm@nongnu.org; Thu, 03 May 2018 13:39:21 -0400
Received: by mail-pf0-x236.google.com with SMTP id v63so15277556pfk.8
	for <qemu-arm@nongnu.org>; Thu, 03 May 2018 10:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=doYTVqaHUExstSEl0w6N31X6O+Czx9BwTcnIurs7njo=;
	b=DIbFpy/27yI/YZJbS3JOMJMTS9HPx7ENR23hKviCxxqTOIEco4gD8Bfu/UyHaCjqgI
	+M3X9xj2gzG2KuD/zXHpsapnC9tELueKd0tDpxnsWChfzqvAW31PxSzuO9fHrImnTRGc
	apci0C2Is5pJAzqT2mndTKquPs2ywmJPHbe4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=doYTVqaHUExstSEl0w6N31X6O+Czx9BwTcnIurs7njo=;
	b=d8qKKQm8aM+oU6WBpzQT7CZGF5DES2fFffLSZUfKzt8ASuIsR2LiOe1ANcjOnmaiMT
	kIrF4lzzB9qhvx7fFLBKMeOzP2awKySB/iF5Qf/Ov0pdbgaYrbOkHbaIP1lPtRvicS1e
	8xwLxB2C84yMKv2V25sCc7FA5n4EU0VZBk6b7NPIGKt1qcQQC25X/YWdtfJFMa/plNCx
	hM7VKNYSouc680X9gx1O/sVwYkNZjEUu4OqrKi7we8kuHkdEI8wO5ZiGMSs94+mFR0NJ
	g5uHEfAbYqPPPFNz9D8/ZCUDyGrD9SbuS+Sm2qFIlNjtnYTklBR/gRnWfnaQiyQvHCx0
	XlYQ==
X-Gm-Message-State: ALQs6tCC6YarO11s/Gp5m+LnLeuD+1E+KGJyYlyys1rU5ChmyHMtg0e4
	+Z1IxFkzOPXAwvQpLnifzf464f9CD+o=
X-Received: by 2002:a17:902:7446:: with SMTP id
	e6-v6mr5777435plt.369.1525369160625; 
	Thu, 03 May 2018 10:39:20 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	g76sm30814140pfj.102.2018.05.03.10.39.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 May 2018 10:39:19 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180427002651.28356-1-richard.henderson@linaro.org>
	<20180427002651.28356-5-richard.henderson@linaro.org>
	<CAFEAcA-wq3kasUe8pkdUJXNJYNnLABrPgeQE4fokSLL995SFkg@mail.gmail.com>
	<1ad8ffc6-5549-99bf-940f-6734c579e354@linaro.org>
	<CAFEAcA_gPP80BdfhExzHksJyf5KhbQtMH=bGypW4C9uy=fm9jg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <41757507-1fff-e28e-9847-5e1a28d3b7ca@linaro.org>
Date: Thu, 3 May 2018 10:39:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_gPP80BdfhExzHksJyf5KhbQtMH=bGypW4C9uy=fm9jg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::236
Subject: Re: [Qemu-arm] [PATCH 4/9] tcg: Introduce atomic helpers for
 integer min/max
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3K0TXyE0MOQq

On 05/03/2018 10:26 AM, Peter Maydell wrote:
>> It won't be compiled for the 32-bit host.  Translation will not attempt to use
>> this helper and will instead call exit_atomic.
> 
> OK. Can you point me at the code that handles min/max atomics in that case?

exit_atomic raises EXP_ATOMIC, which leads to cpu_exec_step_atomic, which grabs
the exclusive lock and then executes the operation in a serial context.  This
is expanded inline via do_nonatomic_op_i64.


r~
