Received: by 10.28.71.27 with SMTP id u27csp4847961wma;
        Tue, 27 Feb 2018 05:56:01 -0800 (PST)
X-Google-Smtp-Source: AG47ELvzl1NFkGaww8bcA2E3BVUETws1E88qmvDY6eISYDZmxosX7lRpYxRdOHLSmzG5In6o+KdK
X-Received: by 10.129.101.139 with SMTP id z133mr9143172ywb.49.1519739761454;
        Tue, 27 Feb 2018 05:56:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519739761; cv=none;
        d=google.com; s=arc-20160816;
        b=l55vBR1EefRt0y4DagWoYRe05rM4AsZTNJhPYBypwIMTU4gyrZbGsME6iYSlvkwF+e
         edDx+9LbPQN7A8X22B8aUmb/OFaeezkbznsX+wSe0Oem0+Uykbrbn5ELEU5JISE8yvPe
         qYrVfarpbcU0L58qAN5j/k/Bb6BCJ6daS8wHzuvAWZAzOhlD3YmltfhWXzrWLeOk3wCy
         4rH4NYCL9KS2hLV4lmabApesuRgItEVz8bpkAOkReVmf3am1sp7rJnklOEp7qn9JK87a
         S4I9W0kAHftR1hwyUF46PwcV0c++YOdCCyCNCfSQQvl24Y2xxMSDVwlg9H79BUhsTq49
         fy8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Qujjqk3mNNk/gumJUBVd69yF/ER5FKjrwPtzFa7ThLI=;
        b=FNtvPS4gFVVS0w/lTSa8zaGZOweRiieDZ2w0aTtrN6vH7vG3YtiWq88V10EUrKiMLp
         lYQugvFkALr39FsPcJzD5rjg+R2EdKkH6jpl4PhCP4zYVReHr4tXl0iSnWCcZr2LsGm7
         H7ShkCJVX+0lnEzMZtSZPi+hxxqWqiz2ekH/v8Ei9ayp8SjQtxImjG01cKbhtjDNYDWp
         rjZ45wBlxP1XVf+FvwrxzLaAFZH0LT/KVQSvcjs7/bdHqYFOCC1MZyad4JfJRUvR6xlV
         aSgG1+Piu1eoi1cLy7X0y5NeZ5K/khgk8UnuTTGFaJnWLBw3eeixUzWClavgaBQALfIq
         fiCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CikDibWS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g12-v6si920634ybk.580.2018.02.27.05.56.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 05:56:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CikDibWS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37307 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqfjc-0008Ro-QH
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 08:56:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqfiM-0007Qp-Re
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 08:54:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqfiM-0005Md-5w
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 08:54:42 -0500
Received: from mail-ot0-x235.google.com ([2607:f8b0:4003:c0f::235]:37094)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqfiM-0005MG-1J
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 08:54:42 -0500
Received: by mail-ot0-x235.google.com with SMTP id t2so3826822otj.4
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 05:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Qujjqk3mNNk/gumJUBVd69yF/ER5FKjrwPtzFa7ThLI=;
	b=CikDibWS3GaaW33VtNiX6mvvAZTWW1fi1psQkffbLoZ/z6C5AZfNkP1tdjVCzQNg+w
	ToIgbArT1miY88+kJd0zV44pPwL9FSi6ED74HdlIQUOcSj+E5k7Z4LIJVr6lynsfoYZ9
	qlhJBpIL5cGYVkGZDfkXzfSbkymO2H4rGBHS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Qujjqk3mNNk/gumJUBVd69yF/ER5FKjrwPtzFa7ThLI=;
	b=BYfUwTizUTwoOdZKAdRMLFzYdJ87gFJTF10B8cYOECOmUzTq8/dRHINPfyM5ptm0dQ
	jZhHmtFtkWLLV4RS4ZfvHuHL7VM7VpkL1IEjNIGtO2jCKhlQ2k+SKpQPnPOAEZa/Pcam
	C3gEqnWX64+1r9DWsY1H/X05iaWa62pVmNWjQn8eOyXnkuDOpOA0P/NQlE81OzS4e/9O
	/W37S56pIIOLx6VLSbcOdr5MNkNE0kWWrGD6q+rBVz7Sk3ZDi6I81hiEkPFnmmBJMgTO
	W9bldmEptoM0OtoCzm2iq31ImPHxyo6GlZVaQ6udWSsYeX+L9UsvTs/QsP+mRdGFd2mg
	X9QA==
X-Gm-Message-State: APf1xPAaRIIemWCHfIfK4/hUZS2zn559zz+C41icrupaKx64rlSI6LMG
	j5zONLu6ohzybGG8eCeurmLbcCinCAESZl65Z4QTHw==
X-Received: by 10.157.34.2 with SMTP id o2mr10738504ota.316.1519739681265;
	Tue, 27 Feb 2018 05:54:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 05:54:20 -0800 (PST)
In-Reply-To: <20180217182323.25885-50-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-50-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 13:54:20 +0000
Message-ID: <CAFEAcA8AJTKy750C+Gy0Lhz0Wrr_4H7Miu84nzCeE-Ex68EuqQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::235
Subject: Re: [Qemu-arm] [PATCH v2 49/67] target/arm: Implement SVE FP
 Multiply-Add Group
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
X-TUID: m0ltVp3YLHqN

On 17 February 2018 at 18:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 16 ++++++++++++++
>  target/arm/sve_helper.c    | 53 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 41 +++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      | 17 +++++++++++++++
>  4 files changed, 127 insertions(+)
>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
