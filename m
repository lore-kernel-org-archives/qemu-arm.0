Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp5104053wrx;
        Tue, 26 Mar 2019 06:39:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxRAmlZfEq60SIEiDmifEc/7X8kL+TGpZARINKjJ+u6Kl5b4eAD/krMV6TUK8uwmmf16+JE
X-Received: by 2002:a25:f20a:: with SMTP id i10mr20479245ybe.171.1553607553769;
        Tue, 26 Mar 2019 06:39:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553607553; cv=none;
        d=google.com; s=arc-20160816;
        b=CZeozSmnSBV8PnuaiB/i31Up9KkdG8/UXBMMnExgCFexHOlsWA2wPtLnXbevxuDk7Y
         zLoPxJjBCoNViGViL2/sHzUqZSACqcCX39jH4g5wkauo4ZVj84zkocOT+1kNH1vFtKlJ
         Ugqtw68+ANpOLsBKFcucCb21MR0bXHFAWJTbO5VarYIffz3CVkB25Q+xAfdJv8AfTDcm
         AJwK8WVNbm3i/wf379vzGri68eBuA/tjU0eUoCS6+9s0U1bXg8tPEqjhm9vCtE5lo1O2
         Exix7+MF3re24x+CYahF3fVvz0SeFuEfwFbXR6J3TI3rdnWiQV838Oz8Qf9Fp30GRKgB
         R4fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZiMREOf+o1k/HpqX7+CHhnOYIScxvwyDk3C7TQVrUO8=;
        b=SAvrnx3dL/ThAVzrCAV+ffrurHuYhZKgwv8CRMLT6X45/WnggLCGdEw1POyx2FULgw
         zcGE/4vJwgeuOWrZBPUbfvn48LCosN5ZRsdTCPAyp8cldSncbcA63ay3yrMkRrw/YlVA
         H/aC9B/mQu/BjNIKxVZM8S4J07kv9FQvgZIVRJvbRKaaa9To+t0s+23XLVe6D0CAefp4
         BovIjKNlpGvh4cGpkXOry8a0CPqp/9epQcshMZGPFQoZQgRQCm4tsDEDDt7eWDdltckR
         tk/yTVr/4IQAgqzmM7fHDH+bYkYb+bXka6q4HsyQtHVRjyCeRISWI/RhOn5lZC/p6Sr8
         mg5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CGHWlY2M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 193si10797164ywd.155.2019.03.26.06.39.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Mar 2019 06:39:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CGHWlY2M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:60193 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8mIL-0005DI-8H
	for alex.bennee@linaro.org; Tue, 26 Mar 2019 09:39:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h8mGN-0004Ks-QE
	for qemu-devel@nongnu.org; Tue, 26 Mar 2019 09:37:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h8mGL-0004rM-Mp
	for qemu-devel@nongnu.org; Tue, 26 Mar 2019 09:37:11 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:45635)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h8mGH-0004nc-Hj
	for qemu-devel@nongnu.org; Tue, 26 Mar 2019 09:37:07 -0400
Received: by mail-oi1-x242.google.com with SMTP id y84so9875161oia.12
	for <qemu-devel@nongnu.org>; Tue, 26 Mar 2019 06:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZiMREOf+o1k/HpqX7+CHhnOYIScxvwyDk3C7TQVrUO8=;
	b=CGHWlY2MjdLtNB+yckLeCJi0XaLC1FKe+0UJ+BF1HhtYshx612CNu5RmLncqA1/g2K
	oGKXMQhCidkZchwoasECic4afEoGIvY4fY97vGKLhR+pU7BFfXRS+z6YzcSLdqmKwV7g
	s3IGCvzW4Lof6uBwOjsigTuyAt5T5zXyJypcZLIS3hssvrOptMV3sbTh8WiejZkCSwZo
	9bEVI/B+t20QD+8wtyvJ9T2vQ8SxVx/9a7a0OVTECb3kSsKZQ+MxtkMwnTFsWhVJSt+i
	GfVVm4rSlec0P204XffBoV3+Ymq3Wz7nvfP9OlQDu7x4cM6vtK7ds5anUFkWJzO2dcj8
	yQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZiMREOf+o1k/HpqX7+CHhnOYIScxvwyDk3C7TQVrUO8=;
	b=GJyZRJibsDqBfWUeEVTiLCKTcSuBemhUsVAy5wv5wRTXDmRoemS39JYp+gOa63jz1Z
	w6EtuVpP0wItgnXJUgdMneDxBfHfxV+ZPNtkQ8vFBkNAC0bFhaF9m5q8AVYhdZHkrl92
	hAPy7ncgyprtNkkmJUQ5ryyKE65DMkm54lliHRfGst5cHhJAnJQWfAWnzdFHvfElzmA3
	Rkv18YQSGujrFKI+sjHA+fYWuV3yUAEJiK5t6WG1sZuZswJF0tO3uiWtJClW8kuhM2YP
	AWtrNc7/dBAItB+G/GfXV7ljYCt8+DumyebibMoMvHQ69uvjvyJ0Nnwp5gelSfWm1KqO
	3hiQ==
X-Gm-Message-State: APjAAAXTrNhSJAjbQOkVzIr3JuNmyIMSjLt6tW4vWjMSC9FuTdRk05Sx
	hsdmJO86CirzP7Xxf9Wg5GiDozVoH1ho5A+JzlBpHQ==
X-Received: by 2002:aca:d409:: with SMTP id l9mr15971594oig.98.1553607424053; 
	Tue, 26 Mar 2019 06:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190307144126.31847-1-richard.henderson@linaro.org>
	<20190307144126.31847-9-richard.henderson@linaro.org>
In-Reply-To: <20190307144126.31847-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Mar 2019 13:36:52 +0000
Message-ID: <CAFEAcA_BhscD=CwAsAUpNHkeq474C5Fw3Mt+8fkmVAZiayBRBg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-devel] [PATCH 8/9] target/arm: Use extract2 for EXTR
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 41lEF3JrWaC6

On Thu, 7 Mar 2019 at 14:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is, after all, how we implement extract2 in tcg/aarc64.

"aarch64".

>
> Cc: qemu-arm@nongnu.org
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 38 ++++++++++++++++++++------------------
>  1 file changed, 20 insertions(+), 18 deletions(-)

otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
