Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp16458wrt;
        Wed, 3 Oct 2018 12:50:56 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60ZjbMRESaHBHqgfCSb2mJNrFsoXJViGKC1jb1bT27asunANNJwZKlyFWwQETbabbznFpuC
X-Received: by 2002:ac8:6b07:: with SMTP id w7-v6mr2532240qts.287.1538596255934;
        Wed, 03 Oct 2018 12:50:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538596255; cv=none;
        d=google.com; s=arc-20160816;
        b=xB9ZsnYCVIZ5BhQRYLLK8vLSroPnrkug5oOSaPEDB4j8e4Ct9QZfVHZmb7jG9l3Kv+
         ND1UoCYzYgLv5Et1c8HgfVi8FkNEJ5MNcMLOBISfjs81snbiWHq3cyyRVg7hea4eHGLK
         cbvCllXFWy8++LqoTj7M0+KW61oQtz4saqKK3vWX35sU8h3oPChrCnfo7jcPGBmUMH10
         CpSTBb9WVOGAu5fSHYj2I8fD4PqENESOu5w8a+4yUl0JeRvzwswOlIS8qQn2tTwHAQwW
         masr816S7WqtSgrSVHJqBbguUJ4Aa/drqcqv19QFdryf+MoD/uwipOl/xpJyiFi1dtP3
         b2OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=g9VS0pjZ8aujeV8uIYPjS4XdVB4wFDROk0bI/Mjq0VA=;
        b=yNftMtIXBJUP5oQfdrNa/dfiMw0kq6isajP/GE6fJ+a0leed8VwjIkvX3LgoSRzhsN
         kHFWleTDx72YZnxPe5RNm/EXoNWpz34dfBCs6N5RkU10xYerHgcbwdjMwTz+mvYRrNVW
         QIPWjt0lNvJyDqUsy/a1hlkHnUzf3NPi5+W4Ko7ScTcqkXtXjIySawjxXZfEs9fdblAo
         O1e/gCp4/FM3LavNRceKkPlNeAb9SH4bUsIbShBHeTNenleCXXl5RPRPuI98ZxQLgFMD
         YlLq6v+eAFpNduaHPFVSAWnJXYwM5bAq/yAtXOgMjTDgofFDl4lGIjHU4+O9SA6Q67nm
         Piaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JEoANSPu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k12-v6si875767qvh.10.2018.10.03.12.50.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 12:50:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JEoANSPu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52696 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7nAd-0001xj-Ec
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 15:50:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7n7l-00089z-1i
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 15:48:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7n7c-0006aW-GG
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 15:47:53 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:34980)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1g7n7b-0006ZZ-Sj
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 15:47:48 -0400
Received: by mail-ot1-x343.google.com with SMTP id j9-v6so6814218otl.2
	for <qemu-arm@nongnu.org>; Wed, 03 Oct 2018 12:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=g9VS0pjZ8aujeV8uIYPjS4XdVB4wFDROk0bI/Mjq0VA=;
	b=JEoANSPujeV2uGHgHTpYkGlnPKcGurDojmxdCRKZQpOBalh6dcA9+4cts8Or0vrDN0
	hqWhkr//RA/sU+pLxki0FVuqD/5coiH2f1+ovoWRGkQkQ4vqyy3ZD6mnDhon4FJZNn4f
	KpOT46PnF4Y+VpyXSwFO8mrd4CJr4alC+JQuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=g9VS0pjZ8aujeV8uIYPjS4XdVB4wFDROk0bI/Mjq0VA=;
	b=sI4l+NqDLJ4zQ1jaJOVZIA0nQxUd3XGNTGPncQqCi3cAtAHu6lm+Fwj/+1hQmbpN/9
	B5HeyCVsovthXZEOK6PWcmNHf5VMMYVZ1d/YWSxPtgCyjs+e3lr4jIJd5f27Q55qd3Ib
	1YOjDp8yHWH/udfaZZGla3bqWyPb+s96oOHVKXzRxRA9H1KSNuBpKRdrGSPFQU5qRYVR
	+UIjlT6OXXGkYwo0q8ow2uM/6Is1ZeZ73lag0h8Su2CKVt8C0HrPMPHQSFojn+XFd17q
	NBibid3u/kydhy5xpowkOgbgL6q5FvFc1DxfRxKbIuDmLcYfTVWHa5SQKvtiBJBjv7O2
	1wvA==
X-Gm-Message-State: ABuFfojlJrj+ZC07Tz6HnHUtzbQiR0k5bXKMYEeR+qi1byqKst/GQhbs
	AICe4zuhjz22eRfw5N6b+BurAw==
X-Received: by 2002:a9d:32c3:: with SMTP id
	u61-v6mr1655642otb.173.1538596066917; 
	Wed, 03 Oct 2018 12:47:46 -0700 (PDT)
Received: from cloudburst.twiddle.net ([172.56.13.153])
	by smtp.gmail.com with ESMTPSA id
	r16-v6sm738080ote.36.2018.10.03.12.47.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 12:47:46 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181002150304.2287-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8aa572b9-e354-e610-030c-d8f5cfde509c@linaro.org>
Date: Wed, 3 Oct 2018 14:47:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002150304.2287-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target/arm: Don't read r4 from
 v8M exception stackframe twice
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
X-TUID: zovge4wc6KVA

On 10/2/18 10:03 AM, Peter Maydell wrote:
> A cut-and-paste error meant we were reading r4 from the v8M
> callee-saves exception stack frame twice. This is harmless
> since it just meant we did two memory accesses to the same
> location, but it's unnecessary. Delete it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

