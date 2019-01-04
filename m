Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp717935wrt;
        Fri, 4 Jan 2019 07:26:44 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XGwnUDKX/YKerK47ABO/t+x7DoSlNkhBlq72orn79SIov2YsgcoqUbPKxucVHetxVrplrk
X-Received: by 2002:ac8:7250:: with SMTP id l16mr49420057qtp.348.1546615604413;
        Fri, 04 Jan 2019 07:26:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546615604; cv=none;
        d=google.com; s=arc-20160816;
        b=fnDfXEqaM4TfcKXnGzf9jQi5cBRl3SYD1w3zXC8vBu78MwAN5y+7tjYC/Ij4h3Gwfu
         c9jyET3zMalX4+DA7RVmj7p+1jsgD88TpCqhqN8LvA2D+so5l2bF8aQ5zVwCIPvqYTN9
         m5HGbF1Fdy0pXVMhmzSU9Cjk13ea51N8tkn7jfBQTInS8w00H1slqqbx+KZwBdmavKSc
         E9WZi5YlDttByR7sHdTH3lwx/8DcRfkju+JaJdZbD4VzNqOp1MoOidXk4D7P5V3rv9+F
         H2keau4QQa18ePwN9kBvW18bfsXQ+AjkJZQwVnZJ0SxQwVijUJoqTg6LQGy3Cz5cXhzd
         qMAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=+MAdHooOzxgFzW3qqdE+d53O9kQ/sgkJJuokTfLd4Bw=;
        b=YZmSpLMenrrFaOvktZMFmTkw8icvenVQnt7t5sQrBBi0lrWLuEAACPfbDnKxfAjgW0
         xMK+s1Br9vtQNq1gdt6D6D9Xlh5EgMpObVRWAcwdCq1Ot2MUfQeJr2MLlAUvknIv6pUQ
         YDDm6uVOwKxalue+jgVhIE0U9VheUltYCf4+9ORW/buz3/4pIPqrGgv9qcn+J5un9hQG
         J729vPV73KG2W8Qws7d22nkTudSgpIRDBfWMbk0wJpvPGoSRMunpF1vgIiYT2aMDuNl6
         oJUVnXXwng+Mjh632mejOw9ZAuao2WGDZJXsDzCw4LxVLvSlyBVYivWnu8jStNw0F3Uj
         SbUw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from listsout.gnu.org (listsout.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t64si47414qka.35.2019.01.04.07.26.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 07:26:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:36286 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfRMx-0003LM-Rq
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 10:26:43 -0500
Received: from eggs.gnu.org ([208.118.235.92]:56713)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gfRMo-0003LE-R4
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 10:26:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gfRMl-00084c-Np
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 10:26:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52210)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gfRMl-00083n-EM; Fri, 04 Jan 2019 10:26:31 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8399D142C0A;
	Fri,  4 Jan 2019 15:26:30 +0000 (UTC)
Received: from thuth.remote.csb (dhcp-200-199.str.redhat.com [10.33.200.199])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 16DFF6013C;
	Fri,  4 Jan 2019 15:26:19 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190104145018.16950-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <f550c850-1b97-6c51-acb4-26762429536e@redhat.com>
Date: Fri, 4 Jan 2019 16:26:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190104145018.16950-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 04 Jan 2019 15:26:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] tests/hexloader-test: Don't
 pass -nographic to the QEMU under test
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Su Hang <suhang16@mails.ucas.ac.cn>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EJyTUPU+UkAL

On 2019-01-04 15:50, Peter Maydell wrote:
> The hexloader test invokes QEMU with the -nographic argument. This
> is unnecessary, because the qtest_initf() function will pass it
> -display none, which suffices to disable the graphical window.
> It also means that the QEMU process will make the stdin/stdout
> O_NONBLOCK. Since O_NONBLOCK is not per-file descriptor but per
> "file description", this non-blocking behaviour is then shared
> with any other process that's using the stdin/stdout of the
> 'make check' run, including make itself. This can result in make
> falling over with "make: write error: stdout" because it got
> an unexpected EINTR trying to write output messages to the terminal.
> This is particularly noticable if running 'make check' in a loop with
>   while make check; do true; done
> (It does not affect single make check runs so much because the
> shell will remove the O_NONBLOCK status before it reads the
> terminal for interactive input.)
> 
> Remove the unwanted -nographic argument.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This seems to be sufficient to resolve my "make falls over"
> issues with the current test harness and a build done for
> arm targets; I haven't checked whether other test cases which
> are specific to other target architectures might have similar
> accidental O_NONBLOCK behaviour.
> 
>  tests/hexloader-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/hexloader-test.c b/tests/hexloader-test.c
> index 834ed52c22b..8b7aa2d72d0 100644
> --- a/tests/hexloader-test.c
> +++ b/tests/hexloader-test.c
> @@ -23,7 +23,7 @@ static void hex_loader_test(void)
>      const unsigned int base_addr = 0x00010000;
>  
>      QTestState *s = qtest_initf(
> -        "-M vexpress-a9 -nographic -device loader,file=tests/data/hex-loader/test.hex");
> +        "-M vexpress-a9 -device loader,file=tests/data/hex-loader/test.hex");
>  
>      for (i = 0; i < 256; ++i) {
>          uint8_t val = qtest_readb(s, base_addr + i);

Reviewed-by: Thomas Huth <thuth@redhat.com>
