Received: by 10.80.166.35 with SMTP id d32csp1141307edc;
        Fri, 28 Oct 2016 05:27:16 -0700 (PDT)
X-Received: by 10.55.141.65 with SMTP id p62mr10464158qkd.301.1477657636697;
        Fri, 28 Oct 2016 05:27:16 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w7si8194291qkc.77.2016.10.28.05.27.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Oct 2016 05:27:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48874 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c06Ff-0006nj-EU
	for alex.bennee@linaro.org; Fri, 28 Oct 2016 08:27:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c06EN-0005OP-Ie
	for qemu-arm@nongnu.org; Fri, 28 Oct 2016 08:25:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c06EM-0002mL-4L
	for qemu-arm@nongnu.org; Fri, 28 Oct 2016 08:25:55 -0400
Received: from mail-ua0-x22a.google.com ([2607:f8b0:400c:c08::22a]:34223)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1c06EL-0002lq-R7
	for qemu-arm@nongnu.org; Fri, 28 Oct 2016 08:25:54 -0400
Received: by mail-ua0-x22a.google.com with SMTP id 51so35227311uai.1
	for <qemu-arm@nongnu.org>; Fri, 28 Oct 2016 05:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CYZWxCUQpQZ4pnmjaTBFNLlDTy8c8sTvPVXf9NU874E=;
	b=cPekSwgXjO/qs7Mg1jJcK0TOmv+6sd1I6Ved5JIoahno15PVU51R1TTbC1wMbA7LLM
	ujpc28dOTWuwnnl436PRqo1HuEQ/oTSt1md6inzhspgNIt8BUVjcNjH04A8NTFkqXCYj
	w/GvASeohStBke+MO2qXET+X+LrIjvrOP02Lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CYZWxCUQpQZ4pnmjaTBFNLlDTy8c8sTvPVXf9NU874E=;
	b=OsaVQwWjQQfrT6B8oqOkCipNeMsgsh/3irAsrbOXtZ4urSNqI9fmuQlTjS++bl2Eze
	AR0nLdoRCHPyS2yVAZZqDMOyux0+Abh2ueg/9DqQpyrkg0tgqudIVdz9XN4tgdhjzxfH
	1Yow/df7m923MK5ngZDp4dywf+kI10Ap+OXyExnxlIop47gugi/GVJC2GiJGx/lvgW0w
	Fnxta2VNP03ZtodUdZPMtXSKlTEusnxwzsRZEhZNMzdVhiUDWQ+o0EMtdfxYVg5rZwBn
	chdD2OqhN2q1t+/KEwnUwEaiLS6pfvIgmssC5BZvr6ZZXmmN+x1mislZbqSIEHNv75v4
	Je/A==
X-Gm-Message-State: ABUngveX0OJwLFJPTCMYJMpxaoG4PzC72600M70TvgZnH1n1d3L/I0n2iXdYgErY6j+PT9sZRIAF0DpmQfpUUIAl
X-Received: by 10.176.2.50 with SMTP id 47mr11948956uas.8.1477657552638; Fri,
	28 Oct 2016 05:25:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Fri, 28 Oct 2016 05:25:32 -0700 (PDT)
In-Reply-To: <1477597646-24111-1-git-send-email-linux@roeck-us.net>
References: <1477597646-24111-1-git-send-email-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Oct 2016 13:25:32 +0100
Message-ID: <CAFEAcA8ZVVo-o2dk=joPki-3+USmcucuFR4M89Aq_HVZ+9MShQ@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22a
Subject: Re: [Qemu-arm] [PATCH 1/2] hw/arm/spitz: Fix reset handling
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Andrzej Zaborowski <balrogg@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EEV/bunYgH0r

On 27 October 2016 at 20:47, Guenter Roeck <linux@roeck-us.net> wrote:
> Using the CPU reset handler for resets triggered by writing into
> gpio pins other than GPIO01 is not appropriate and does not work,
> since the reset triggered by writing into GPIO01 is configurable.
> Use a separate reset handler for spitz to reset the entire system
> and not just the CPU.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Thanks; I've applied this and 2/2 to target-arm.next.

-- PMM
