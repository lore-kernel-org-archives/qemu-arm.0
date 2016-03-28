Received: by 10.25.208.211 with SMTP id h202csp1664770lfg;
        Mon, 28 Mar 2016 14:36:30 -0700 (PDT)
X-Received: by 10.141.2.11 with SMTP id e11mr41019163qhd.69.1459200990390;
        Mon, 28 Mar 2016 14:36:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v39si1513027qge.105.2016.03.28.14.36.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Mar 2016 14:36:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42992 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1akepp-0002tP-Ul
	for alex.bennee@linaro.org; Mon, 28 Mar 2016 17:36:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1akepn-0002qB-HF
	for qemu-arm@nongnu.org; Mon, 28 Mar 2016 17:36:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1akepm-0000ql-Gu
	for qemu-arm@nongnu.org; Mon, 28 Mar 2016 17:36:27 -0400
Received: from mail-io0-x243.google.com ([2607:f8b0:4001:c06::243]:36320)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1akepi-0000oR-3Q; Mon, 28 Mar 2016 17:36:22 -0400
Received: by mail-io0-x243.google.com with SMTP id e3so10265441ioa.3;
	Mon, 28 Mar 2016 14:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=5iRoTJ7m1uvRKCgtWtSOCPsNWR13CDRTWRkWfEQtcME=;
	b=BUbQph2SE2UyRI2YZTcBJ3MJYORuu2OkYSRz1UwrSMN+zgA6G+BbOvuv11vuHlp2dQ
	YdP9SUNrZp+i32y0YCOGyEEh0paoIJGrXk5J6dX5X5Bfsg8lmvLEGFhxsxgHGqMnf9Mm
	ouP9jRlhnTlzVEuJa2tuD8jY68eihxdHiU2L6RRDxYURII2ANOdJAxmwGEQFDA/ctmt7
	Yi1nOcCYtVo0x67/Osn6Z6cMgKO0egTKh52Gfun2LtpL/pdIeJHyE25RPdp7X+4z1rR5
	I1qyqTTsISmBdyd6ND0BrkzGCkt5TBBhFeQOPdxls5HqwhWcVIXeHBtuMzjrpGYSQR//
	hAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=5iRoTJ7m1uvRKCgtWtSOCPsNWR13CDRTWRkWfEQtcME=;
	b=k5s+hY2mRMkq2l7tt0erebLv40Fl/64ezH19TR4/A4DGhZjFQq8ldf7OwBVGbc+FR1
	nBOnwRVyB2oArnEwH7mF3BFWjtwGA45+yLoqDXIOB3h6I2rNKJ/DAaU6lwihj9EB2R16
	eKi99w5ACJEzOYPvoG33MZZ/SsZXMrdxC2LZipNAAn9mZ/eXQVgFeQoBBKIKOHox8SPa
	wo/ZkgKFXSC6zOWxUhiJJj84UOwQBiIq61Gm78L1nOuvNvgE8MFsQB2AoKz9s0CI3FcG
	ODcjJ1bIwwa79L3mu0C03fQvO+RHoZ9jdd2ZSlV/RIXPqzTUyk+F+eVuLgQCbbuFA2Vr
	k9zw==
X-Gm-Message-State: AD7BkJJiXq3pVpm+/raglPso9/jcbnV/tYu1onlDJOrytIlHkILKQN2zNLmf0OsYuKHeHg==
X-Received: by 10.107.39.139 with SMTP id n133mr28857013ion.57.1459200981316; 
	Mon, 28 Mar 2016 14:36:21 -0700 (PDT)
Received: from bigtime.twiddle.net
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by smtp.googlemail.com with ESMTPSA id
	pi4sm4843351igb.2.2016.03.28.14.36.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Mar 2016 14:36:20 -0700 (PDT)
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>, qemu-devel@nongnu.org
References: <1458910214-12239-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1458910214-12239-2-git-send-email-aleksandar.markovic@rt-rk.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <56F9A3D1.2050402@twiddle.net>
Date: Mon, 28 Mar 2016 14:36:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1458910214-12239-2-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::243
Cc: peter.maydell@linaro.org, ehabkost@redhat.com,
	kbastian@mail.uni-paderborn.de, mark.cave-ayland@ilande.co.uk,
	agraf@suse.de, petar.jovanovic@imgtec.com, blauwirbel@gmail.com,
	jcmvbkbc@gmail.com, miodrag.dinic@imgtec.com,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com,
	gxt@mprc.pku.edu.cn, leon.alrae@imgtec.com, afaerber@suse.de,
	aurelien@aurel32.net, proljc@gmail.com
Subject: Re: [Qemu-arm] [PATCH 1/2] softfloat: Enable run-time-configurable
 meaning of signaling NaN bit
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
X-TUID: B0tKT86oVHgS

On 03/25/2016 05:50 AM, Aleksandar Markovic wrote:
> +float16 float16_default_nan(float_status *status) {

{ on the next line.

> +        return const_float64(LIT64( 0xFFF8000000000000 ));

Let's please fix the horrible formatting in this file as we touch the lines, 
please.

> -#define floatx80_default_nan_high 0x7FFF
> -#define floatx80_default_nan_low  LIT64(0xBFFFFFFFFFFFFFFF)
> -#else
> -#define floatx80_default_nan_high 0xFFFF
> -#define floatx80_default_nan_low  LIT64( 0xC000000000000000 )
> -#endif
> +uint16_t floatx80_default_nan_high(float_status *status) {
> +uint64_t floatx80_default_nan_low(float_status *status) {

Why do you need two separate functions for this?

> +floatx80 floatx80_default_nan(float_status *status) {

Seems to me this one is good enough, and indeed preferable.

> -#define float128_default_nan_high LIT64(0x7FFF7FFFFFFFFFFF)
> -#define float128_default_nan_low  LIT64(0xFFFFFFFFFFFFFFFF)
...
> +float128 float128_default_nan(float_status *status) {

Likewise.


> diff --git a/target-alpha/cpu.c b/target-alpha/cpu.c
> index 2eab060..1714387 100644
> --- a/target-alpha/cpu.c
> +++ b/target-alpha/cpu.c
> @@ -277,6 +277,8 @@ static void alpha_cpu_initfn(Object *obj)
>   #endif
>       env->lock_addr = -1;
>       env->fen = 1;
> +
> +    set_snan_bit_is_one(0, &env->fp_status);

We've just done a memset of (most of) the entire cpu struct.  We don't need to 
re-initialize this field to zero here.  Same with most of the other cpus.


r~
