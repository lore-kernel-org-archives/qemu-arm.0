Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2197734wrq;
        Thu, 7 Jun 2018 07:52:33 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKKKxm2uHipxFLlII+lJK5liNXapfkZ8dppebs/07lYTsfkmbMPgcIB4ja89bgj9reuwLIZ
X-Received: by 2002:a37:a08b:: with SMTP id j133-v6mr1821613qke.74.1528383153648;
        Thu, 07 Jun 2018 07:52:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528383153; cv=none;
        d=google.com; s=arc-20160816;
        b=ZYbbPuIczGtoLh/hCGxdAcNRZQgiDtb0GCxg1JmFw8/hhzkDkoe/PRgAQc5Xp2DS6u
         7ESa1atgVQipvs9mKnDYYKn0Bs5EvsUJbGFHydvfkn0+qkOZmciCJPZiPPlcNwUmPsAV
         gvlyY58/gbOml/dQAm/DdlCBpjLD6dTPZoGOCU+ooWtIydOy8dMDb7Zi+rzoUrHBnqoI
         78zwnZ3komJyusZlPGDo1WSpGJAP4SxtUfJLODZYW6GAC8yfiqph6D/w6q3XmxwFa7bH
         n50UHOBy9jcsBi7vau0od6BxxnMd9WT8uDAkGUHyVzxVicSDetQzmC8DiNctnt0IXYpa
         C7+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=8yosc8bkYgjYCdAvOKLKjJdfv7g5HSUZSsTg8KjSt8U=;
        b=I/RGpJDDIfF4z/3pX242b2ruHCGSUgmboBgezfWNQig/HYfsG6EpV7nLZV4skDeN4c
         zyrAIqtiZCf3VEMmztzRHrL2bZ1P70S3Lozb8UhqUemtla+TE7cRbXZVv6KY26VjdhwV
         JHbzkXogfMV7oXNnHLF4OiTd3oM/HfCqG8D37y7f862WYlLyMAghCG4SS0LJXR1QhYCL
         3w47Z3PfcUdh5FAN95dA+IRVV227jt5E+F6V7kQeQySsUAy5ZZrBExlopHAVYSTTlF9U
         0d6qLQawukKpv6Rxf0tPWOrHcarhetbFuxvKoQpJlqH83qUECruU72jMnXpL/tuo7W1C
         fMYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=moEd4rBv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d30-v6si1173244qtd.302.2018.06.07.07.52.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 07:52:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=moEd4rBv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58391 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQwHB-0004jX-6G
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 10:52:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQwEu-00036x-3a
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 10:50:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQwEr-0000wP-2A
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 10:50:12 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:40580)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQwEp-0000vq-0L; Thu, 07 Jun 2018 10:50:07 -0400
Received: by mail-qk0-x243.google.com with SMTP id r66-v6so6713477qkr.7;
	Thu, 07 Jun 2018 07:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8yosc8bkYgjYCdAvOKLKjJdfv7g5HSUZSsTg8KjSt8U=;
	b=moEd4rBvNm0D8wVygEsjiBhEy+GlD0KDejzRfJ7ecIuf4l59ccePTNPYeC5r/l3x3O
	YiKMrkTOXQedQj2eE44onZRZYCpt2hzbgvlzm/SuqxeeDkQsinmNvJCJGijTSy+qWaSt
	9D2W1Ux9p25JfLAHQkJOGvHf25+vYeI7/wqb3bUlJi8Dqhj9XDIX+iqJ9wlKwgNYpxg/
	fM1HUaiDkddRmowuD0TEo8NIxK9FWafQCn8yiVYQ9cFbHIimAi9oPQ8bWP7qZkHjyNmX
	fHzu0EVI0EYCmQKKx1EkX9r1oDiyCKSRWhIiphvTprkKm5BrihF3O/TzFcMlbQYv7vav
	7O2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=8yosc8bkYgjYCdAvOKLKjJdfv7g5HSUZSsTg8KjSt8U=;
	b=DXgiA5OLUDXidfsprJfny7SugwoXq6JejWSr0XRtXdNg0d7FNS6FOQE9ubH/TEHptS
	piXb62RYBCAuqRirf+RJrZzxlM4nv6lKs+ELgDtEVf9YiV+NpqsSaiOp6qOWg6M8o883
	eIe9+UfVDP+7a6BRKcqUmGMrchhj/IboJFUm6D+gvTHRMLRAJdJ/KMoTPPp0av1O48rc
	+iDG9Py0aQRbhMp8Eb0yZ1XO2d7+PfVU9BmnWIACeZ5cE63xRqQ0atFNaYetjbmFdhhU
	gOAI1Z0IhilUcQDpXEecJyPmjGvWk9zpvlUkGl4J4n8B/70G0mJW6enFIslJrl47Ha7K
	p1yA==
X-Gm-Message-State: APt69E3jJE9a3UXuYw8n+U/pudlK248BBnaUr6NQf1oXqtmKXe2+T8Js
	Zi2WjZdp3CeBliyaB50XxUE=
X-Received: by 2002:a37:3095:: with SMTP id
	w143-v6mr1799294qkw.362.1528383006415; 
	Thu, 07 Jun 2018 07:50:06 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	x4-v6sm20160644qti.7.2018.06.07.07.50.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jun 2018 07:50:05 -0700 (PDT)
To: Markus Armbruster <armbru@redhat.com>
References: <20180529174821.19964-1-f4bug@amsat.org>
	<87lgbqvha8.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <4294f0f1-3b40-c886-dda8-a5638ddf1b94@amsat.org>
Date: Thu, 7 Jun 2018 11:49:58 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <87lgbqvha8.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/4] qapi/error: converts
 error_setg(&error_fatal) to error_report() + exit()
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FiLEKrQlOZgh

On 06/07/2018 10:48 AM, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> Hi,
>>
>> This series converts error_setg(&error_fatal) to error_report() + exit() as
>> suggested by the "qapi/error.h" documentation.
> 
> Appreciated!
> 
> The series actually converts two anti-patterns.
> 
> 1. From
> 
>     if (COND) {
>         error_setg(&error_fatal, ...);
>     }
> 
> to
> 
>     if (COND) {
>         error_report(...);
>         exit(1);
>     }
> 
> This is exactly what error.h asks for.
> 
> 2. From
> 
>     if (COND) {
>         error_setg(&error_abort, ...);
>     }
> to
> 
>     if (COND) {
>         error_report(...);
>         abort();
>     }
> 
> error.h asks for
> 
>     assert(!COND);
> 
> instead.  See my reply to PATCH 1 for why.

My bad, I misread your "error.h" explanation.

These patterns are now cleaned from the codebase.

Your examples are clearer and might be added in the header comments if
we keep using the bad patterns.

Regards,

Phil.
