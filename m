Received: by 10.25.159.19 with SMTP id i19csp880037lfe;
        Fri, 12 Feb 2016 07:15:47 -0800 (PST)
X-Received: by 10.55.76.73 with SMTP id z70mr2486257qka.105.1455290147600;
        Fri, 12 Feb 2016 07:15:47 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x145si16156710qka.105.2016.02.12.07.15.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 07:15:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:33509 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aUFRi-000054-Nm
	for alex.bennee@linaro.org; Fri, 12 Feb 2016 10:15:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46891)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aUFRf-0008VN-EI
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 10:15:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aUFRe-00039o-If
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 10:15:43 -0500
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:35728)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aUFRe-00039j-6L
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 10:15:42 -0500
Received: by mail-vk0-x236.google.com with SMTP id e6so62608851vkh.2
	for <qemu-arm@nongnu.org>; Fri, 12 Feb 2016 07:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=97Kigb8fk5lOgNktnXKqv/cGa4WhhRunpYqJv7NVfE0=;
	b=ANCffbaYM9HdBA/u9EtZ0ZnHT1hEuzvbFRmBPkibGymp0kHoZ0R5USkKSyf/8cclt/
	zNJGTzLcuYxWREcNG9Qy0QTjGGNb2Ma8E+M87Pc6LC6E+VznmjX3H6OqrHA7IvF1mh+K
	ajU8qUgr7XL8pKVpgwhEJ0lJoDodm+6z7mu88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=97Kigb8fk5lOgNktnXKqv/cGa4WhhRunpYqJv7NVfE0=;
	b=k/1Gaca42YORnbQykoXy8/+JI6+Ozq52ZRi2l0OpfSZDpHzlseSuPXkhqYvGcJCpr6
	TnkVW/n93b2LO7ADZ8OGQWb6Y1jc95J+uXdIVkHOzQHNG4DFRsYj2rHs+SYKulVx0ATl
	85INRzS5GCn22QR2uWEMyXe8XwF/jJwBJlvDKmXNhCwB6pdNvf4diY2ic5g7yEmf1m3N
	DGUnMTsPcvOnOYdQ6YnjRSwIQDGI5ygWj2GXiv0ln+Ydyq9NyVPXq0KgzA8UtbgaRYqg
	grw9rhzhh7fR55EgNl2v9s9ZiyHsTIbwQB6XLHSOjOnTwI/VGehVwqfYtFgoWU1EbB4g
	X5bA==
X-Gm-Message-State: AG10YOTueaABw1hcZ+Xz5eN0qMCLAVSu9/2ramg4ZoQCjG3oc8HEsK72Cf5C9i6EJXt6cC7kP8BAE1HRHmysPVzr
X-Received: by 10.31.52.147 with SMTP id b141mr1714825vka.82.1455290141757;
	Fri, 12 Feb 2016 07:15:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Fri, 12 Feb 2016 07:15:22 -0800 (PST)
In-Reply-To: <20160212151218.GG31433@toto>
References: <1455217909-28317-1-git-send-email-peter.maydell@linaro.org>
	<1455217909-28317-4-git-send-email-peter.maydell@linaro.org>
	<20160212151218.GG31433@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Feb 2016 15:15:22 +0000
Message-ID: <CAFEAcA_00+sVTot-q5iHKLDiLbPRFsRTBQNE4Dbswt1haaxwGQ@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-arm] [PATCH 3/4] target-arm: Combine user-only and
	softmmu get/set_r13_banked()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: W81sBWqKvvl2

On 12 February 2016 at 15:12, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
> On Thu, Feb 11, 2016 at 07:11:48PM +0000, Peter Maydell wrote:
>> The user-mode versions of get/set_r13_banked() exist just to assert
>> if they're ever called -- the translate time code should never
>> emit calls to them because SRS from user mode always UNDEF.
>> There's no code in the softmmu versions that can't compile in
>> CONFIG_USER_ONLY, so combine the two functions rather than
>> having completely split versions under ifdefs.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Hi Peter,
>
> Do we really need the assert?
> If we keep it, can't we have it for both -user and -softmmu (avoiding the ifdef)?

I would be happy to entirely drop the assert, yes.

thanks
-- PMM
