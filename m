Received: by 10.182.158.201 with SMTP id ww9csp392265obb;
        Thu, 10 Dec 2015 02:45:31 -0800 (PST)
X-Received: by 10.140.250.70 with SMTP id v67mr5594698qhc.43.1449744331955;
        Thu, 10 Dec 2015 02:45:31 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j78si14183206qge.116.2015.12.10.02.45.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Dec 2015 02:45:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:40400 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a6yj5-0006vw-Ji
	for alex.bennee@linaro.org; Thu, 10 Dec 2015 05:45:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46283)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a6yj2-0006vE-PV
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 05:45:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a6yj1-0003i0-Qh
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 05:45:28 -0500
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:33864)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a6yj1-0003hr-Kg
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 05:45:27 -0500
Received: by vkbs1 with SMTP id s1so77239460vkb.1
	for <qemu-arm@nongnu.org>; Thu, 10 Dec 2015 02:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=jBt3ck2quuI4uzdtgleKnScdPoG1njlkFTxS05QatIk=;
	b=lY8PZZ8rN6TzD3mP3KBPRBJLYlhV9a7ZADbgag/eixyjAp8xHJZIku5th3LynPpW8P
	Yps3Scsc7Rtik4Y1szSsn+JS+Y7XEQjQWEz2JAO3ShYotQ5KKszoGxgue7UOCyyF83AW
	K1gNQzTbBCa3qTXyWfQdB9mlifIbVLNuTUyeo3hIMAOy7UJ3WpsTycwq0NOtx/Rz7jAO
	m0Jn1zvvuiXPML/KGHKyJ8eebqKh7E+f26Un/zjdqZsxi9BwtSRUZS5bmSbbbxKFOSlg
	NA3thfe1ZfZsOwNSye8mh99OuLvfjIQh9qoaZ3LQoDzjYwiN71JakbD8LNe0ww/fcMsa
	jBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jBt3ck2quuI4uzdtgleKnScdPoG1njlkFTxS05QatIk=;
	b=l8nk8MJ4EDodJpWH9qeU6bobxkLl/Lz81XomclryB2J0JOmPVlypxxXAu+EFBMN6Kn
	hflMkY7RPgqyBB9YmWuOTndZ/aqcc+eKnujbYdox0Z5S6Eb8CgHfvlrkwmvS1wRYkSng
	XakbS3v2IIavaRlNTJ2Ifm2gaFKLlvDMQ+2Yfdij21n2ws3ih0O0fC5YhLF6cbezNh4I
	dRORZol1vnHCZEzc7DHciEgu0xP9H5WTB1lXaGxCRg6P79mKq5BNOyu3yFFnJ8+lyT7Q
	7eRxJTGA7N8Hfyg/CM5px3g5eHxmMFdMT+7EGFpITZGYMIE/ghWSPp0+rkZ31ydrnEKU
	NSYA==
X-Gm-Message-State: ALoCoQlM1qMzT9R+bL9KLlDsTMZ68BnXGl146q5hsdBhhQbHmKo+sv6zS0GpfLXPxcRlMggjlXltuQnA3fFSDnHsTbThZToDXyc6YSH83MaqD7OZqxj2apc=
X-Received: by 10.31.16.214 with SMTP id 83mr8386327vkq.139.1449744327278;
	Thu, 10 Dec 2015 02:45:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 10 Dec 2015 02:45:07 -0800 (PST)
In-Reply-To: <1449743372-17169-2-git-send-email-armbru@redhat.com>
References: <1449743372-17169-1-git-send-email-armbru@redhat.com>
	<1449743372-17169-2-git-send-email-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Dec 2015 10:45:07 +0000
Message-ID: <CAFEAcA9hqTM64qH2dsUudp=1a5W5WJMwX0QDnPku9APCnMJPcw@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [PATCH 01/12] hw: Don't use hw_error() for machine
 initialization errors
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
X-TUID: gGOwbCV18WAT

On 10 December 2015 at 10:29, Markus Armbruster <armbru@redhat.com> wrote:
> Printing CPU registers is not helpful during machine initialization.
> Moreover, these are straightforward configuration or "can get
> resources" errors, so dumping core isn't appropriate either.  Replace
> hw_error() by error_report(); exit(1).  Matches how we report these
> errors in other machine initializations.
>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-ppc@nongnu.org
> Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
