Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp963001wrt;
        Fri, 4 Jan 2019 11:57:06 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5/pKV3tkjvAUZKVguc3mQECJizZ6RxrmzNmpBc/+gjxJW9/j9FrU7/5J+yedgcnws0KagJ
X-Received: by 2002:a37:6982:: with SMTP id e124mr49695313qkc.50.1546631825981;
        Fri, 04 Jan 2019 11:57:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546631825; cv=none;
        d=google.com; s=arc-20160816;
        b=vyIBKjUopoa5YRGNS7PxBai3PfhpUGoGbKTdf4n9wKUTxtklObVMklIbPdGrmDf89D
         gEOpZxKe+YWnzKscDcSqhuLMemm/pCrz48yJl4h/CfEcEMXcTaWTnYMXoxG7UZxlFNg5
         +9dQv7K2Gujvf7acin2BCY1GGzKEgFfc/uPlgaHSl+C7EhCcOe3Gq15e8WobcJ+uIggi
         ieDeoHYtqdqJgTSDabrrmK5efOyA3D8/yFKSt3ol+8P3uF1qwUv9r/kAJDIxYTs2LvjL
         KfVHeO0Wfg+eUtj1uS6k3o/digS+XQilhpfs3CMbQQTcDG34uZaz2d0HoPBHah5PGheg
         5ypQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=YHCQ8bTFBMZpm1SPI5UomO8HhEYA/wjTyHWjtL9QWqM=;
        b=O1Bk8h21TTmOjs4lQUwP72TUbOHzZoz8REYEliKRwB3BTAIh+WvMW6pWDLyzixeY9z
         jABEzjond2qkIeSHIk4TYCc7KYIcFmxU5ci6S6Y/wgMPsB9rNT79uJeEMC2vJ3stjBIg
         mefHEz6jdXAQOzCr9PO+7hsJGuuXyBTxSvqUPFoDINHV7IawiCaCMUa6l4x+6P4aLiw0
         hgbyVUC+DqINdnP3ehi6JqI+lK3SCWGSIptButTCqytGSasFAfVAaMUqhKQSS8zB0gkV
         25G6/2nZsRXuPFDl9QhpNL73nTonqa2kF8/lxe4B9KSL8XSaTSMMvIwRfNnd5/x3cy46
         b3Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id o27si4545472qto.166.2019.01.04.11.57.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 11:57:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:38514 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfVab-0000Jk-Ig
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 14:57:05 -0500
Received: from eggs.gnu.org ([208.118.235.92]:56523)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1gfVaF-0000JZ-9B
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 14:56:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1gfVaB-00009y-9D
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 14:56:43 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42946)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1gfVaB-00009C-20
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 14:56:39 -0500
Received: by mail-wr1-f65.google.com with SMTP id q18so37542528wrx.9
	for <qemu-devel@nongnu.org>; Fri, 04 Jan 2019 11:56:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YHCQ8bTFBMZpm1SPI5UomO8HhEYA/wjTyHWjtL9QWqM=;
	b=t0TzjUpCM9TP0FP/IeEQzDOOECUWy5ycHPi+8BZ5v7fjilzsNHCW1nulR77+MRCKtC
	JYlTZAH4MWmCnF9057gchEvJwRXExGaM+ad2JDkWowHz6S98rO1NBaPAtu+GYazny9wr
	L41ZkGFO++93uBRaRAOPqER43NP/zM22H5n0xvKk4/5PD7G3SSaK4O9i/MtweRZbcQub
	zBxKUHZY40ZoGe6ZIYfpFAvxeVmK2rJqjFwRvPCNj1DcU4/g0Am8NHUC1dhmNvZItNd9
	2fb99cO344QNSHRtiLUkWkQIihOwHY/TuJhTtW02fPK/+l712xe2rck+JBy6k+uq2OSZ
	MgRg==
X-Gm-Message-State: AJcUukc2112c6WM6Yq29CBRVMU4PDjKjLPZweCLLgtMEwwdSVcIOUqaz
	s8RSU0bHchXsIZEdqj61rLf2Xg==
X-Received: by 2002:a5d:418b:: with SMTP id m11mr41848749wrp.8.1546631797616; 
	Fri, 04 Jan 2019 11:56:37 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:54c4:c62d:27e1:f771?
	([2001:b07:6468:f312:54c4:c62d:27e1:f771])
	by smtp.gmail.com with ESMTPSA id
	y145sm1355676wmd.30.2019.01.04.11.56.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Jan 2019 11:56:37 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190104145018.16950-1-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e075d742-6e09-9e91-d355-62e34b77687d@redhat.com>
Date: Fri, 4 Jan 2019 20:56:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20190104145018.16950-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-devel] [PATCH] tests/hexloader-test: Don't pass
 -nographic to the QEMU under test
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
Cc: Su Hang <suhang16@mails.ucas.ac.cn>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xHaJif/n02Ls

On 04/01/19 15:50, Peter Maydell wrote:
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
> 

Great, I'll put it in my pull request together with the TAP driver
(however, I'll also put in the </dev/null for good measure).

Paolo
