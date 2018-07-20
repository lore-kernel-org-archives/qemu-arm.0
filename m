Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2236440wru;
        Thu, 19 Jul 2018 18:22:51 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpff1RIRkKMsZFsbrlq0b5sD6WbHSMgtUejRI4phzymYnKyGMsIKAfA4MRTq1v2uiqIjK8El
X-Received: by 2002:a37:4a8d:: with SMTP id x135-v6mr12865qka.360.1532049771704;
        Thu, 19 Jul 2018 18:22:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532049771; cv=none;
        d=google.com; s=arc-20160816;
        b=B9s681lz75paho7C0+fd3LsZXa9B0D7sQywHFKw2ZFqhgdIzNkrAtT8liFlWsU0dEW
         P9mlWsWqnzK+n7F03FqBfiN3V4r+GBYUcrzmc7FNg88AaWD13Cm9rqJMbqvXoesFW4wr
         L5tiDLn3tzfC95+Fa9sOji0u0ycusWqhjw8HIxsQSwhHmf4T5jWrTphw7g6hjBaJDhbG
         3s7ttUTnL7FFqryDjRVMI1HHWLVPDNoHpHiOIi5algEZ+Ec9nhWuThkp+iwhMyN+5qdl
         nupwMKxVnb1vP6gp9lBeKKmkAm511fXE8A0jvHufs/yF6XTZ7YDV84mPjLvdv7plwP09
         8utw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=MUscP72X3L2g1YnFuL4+pdqwKIBnnzDc0cirk5pGak0=;
        b=fGmuz/FMsB4P3mSH7JPWp2J8e5qs/KxczNp9TE+ruqebH8qF5qnKqYKZG4m7P6a/4Y
         WNq9OYA+cHc3STTl6qKMsQr6aXLbGhZPhOiAAHNF3s4Zxupt1EXXfR0QnhvD2qgzMNO7
         WBlWso1bUKyCG7F3UbntZ6JWrLEjYxmikIeurzMJEeoOvd5s0BU0CIW7Iie+pPfZ7mwC
         VRxZOQvMwnauu3Rz714Kx1sxbOlxPX6yKOhgT7+VbZj13AgW9qm5Hru8Kum/dlzmM+uu
         rqbHyIdmnuRbVq95TDMpSbnknTzDzCTxZGPPIRtlZ1wbzculFe95ZV+JKxdDCyhJVvTB
         1eoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CSOA0kXT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r24-v6si594987qtn.77.2018.07.19.18.22.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Jul 2018 18:22:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CSOA0kXT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45993 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fgK8B-00075z-6X
	for alex.bennee@linaro.org; Thu, 19 Jul 2018 21:22:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hejianet@gmail.com>) id 1fgK82-00074d-2f
	for qemu-arm@nongnu.org; Thu, 19 Jul 2018 21:22:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hejianet@gmail.com>) id 1fgK81-0007tU-57
	for qemu-arm@nongnu.org; Thu, 19 Jul 2018 21:22:42 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:45388)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hejianet@gmail.com>)
	id 1fgK7w-0007jq-PR; Thu, 19 Jul 2018 21:22:36 -0400
Received: by mail-pg1-x543.google.com with SMTP id f1-v6so5302882pgq.12;
	Thu, 19 Jul 2018 18:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=MUscP72X3L2g1YnFuL4+pdqwKIBnnzDc0cirk5pGak0=;
	b=CSOA0kXTVRA9rSn4/MLXyKzXUjyOdMNWRlAOJzeHYABMNUJUCKNrji5PmuAnz3h6Hu
	srEoSrDGnZr67+3ZtVazwxUmoU6dUnPX4GWRw8kuLw/FVLDL+Dm9EZUMxDqqz+OaACZe
	Wmedcsn1bXhrmQ1vxH3tKBM28NMMXDGXk3xJaMyuvdlGv51wmWWdT6JdrFcUD5sss63R
	7ffvJwhc51lN06KJwIg8KLbWcbVhov73agDV1WYPWi41OUSrizdVrJDyhkiv6KI+8IZy
	TvSpFYXo/XVpIzvu3W2ovkdLN99CbFWGatTJanZ0TXoY6LMKuTJTPqU+xAfETY/C00h6
	UknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=MUscP72X3L2g1YnFuL4+pdqwKIBnnzDc0cirk5pGak0=;
	b=KV/mLyKxtQjkSfib5eWfGI0Gg8lLcV2jTcrul6d3E+0A5UlQAc6cdyC+hRh69fR8rv
	cx0KGxsfFVIGIUD/ysITAd419osDF6BlIHnvHAQPR4cqsncLexCJPTJ+tobG9lq1yLkY
	hKXY7tPjYzqZe0HPGbRE8fL0bU+R7W3DBNi3Ouw/+sdSTB6xkXdkD82hXzkspwTMvmEY
	CJH2QiTsL5h+VR+eCLk2Sz5HnrBBmdMS3qA5rND/tSVpAbtTtW7s3TXn2QgOGOMxtfhf
	AHaTNmJ9Vi2ZW9zcCxnOVSNuPrCrceCAAuVcY+uoUp46sHeEkM2/TSRJGtJBUUhS7G/1
	Slgg==
X-Gm-Message-State: AOUpUlFvVBQYidvRQ2423J/eIil5iQazFbHnzz+PaIOkgsBzOJYZwcmK
	BDkiBtnmzOC7PEeegCkuZRE=
X-Received: by 2002:a63:1d22:: with SMTP id d34-v6mr5791pgd.133.1532049755729; 
	Thu, 19 Jul 2018 18:22:35 -0700 (PDT)
Received: from [0.0.0.0] (65.49.234.56.16clouds.com. [65.49.234.56])
	by smtp.gmail.com with ESMTPSA id
	p62-v6sm454229pfb.58.2018.07.19.18.22.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jul 2018 18:22:34 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1531969910-32843-1-git-send-email-jia.he@hxt-semitech.com>
	<CAFEAcA_2t5z1JBWM9o7ygcOwxnQRba0qA8vVjcoZpcGfP9XUtA@mail.gmail.com>
From: Jia He <hejianet@gmail.com>
Message-ID: <055381ef-7f32-1bb3-cae5-df6bfbe2888e@gmail.com>
Date: Fri, 20 Jul 2018 09:22:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_2t5z1JBWM9o7ygcOwxnQRba0qA8vVjcoZpcGfP9XUtA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-arm] [PATCH] hw/intc/arm_gicv3_its: downgrade
 error_report to warn_report in kvm_arm_its_reset
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
Cc: Jia He <jia.he@hxt-semitech.com>, Eric Auger <eric.auger@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EhZB1QsoI/GN

Hi Peter。 Thanks for the comments

On 7/19/2018 8:41 PM, Peter Maydell Wrote:
> On 19 July 2018 at 04:11, Jia He <hejianet@gmail.com> wrote:
>> In scripts/arch-run.bash of kvm-unit-tests, it will check the qemu
>> output log with:
>> if [ -z "$(echo "$errors" | grep -vi warning)" ]; then
>>
>> Thus without the warning prefix, all of the test fail.
>>
>> Since it is not unrecoverable error in kvm_arm_its_reset for
>> current implementation, downgrading the report from error to
>> warn makes sense.
> 
> I think the counterargument would be that this should report
> an error, because you just asked the device to do something
> that it doesn't support (ie to do a clean reset). Since the
> device isn't going to behave correctly, the tests should fail,
> and the way to make them pass is to upgrade to a kernel that
> implements the device correctly (by implementing the necessary
> feature).
> 
> But we could maybe move to warn_report() here -- I'm not
> sure what our rules are for what counts as an error and
> what counts as a warning.
I reviewed the other error_report in qemu. Some of them are followed
by exit(), but the rest are not. So it seems there is no definite
rules for error_report.

IMO, the best resolution is to change the output grep search criteria.
But it is difficult for kvm-unit-tests to identify whether it is an
error without exit() or a warning. The fastest resolution is moving
error_report to warn_report.

-- 
Cheers,
Jia
