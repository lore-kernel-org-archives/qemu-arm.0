Received: by 10.25.208.211 with SMTP id h202csp1319464lfg;
        Mon, 22 Feb 2016 10:07:04 -0800 (PST)
X-Received: by 10.140.134.144 with SMTP id 138mr38485195qhg.63.1456164424602;
        Mon, 22 Feb 2016 10:07:04 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y9si30406946qhb.39.2016.02.22.10.07.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Feb 2016 10:07:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51010 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXust-0003mN-M6
	for alex.bennee@linaro.org; Mon, 22 Feb 2016 13:06:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aXusr-0003kd-6T
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 13:06:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aXusq-0003y9-9I
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 13:06:57 -0500
Received: from mail-ob0-x22a.google.com ([2607:f8b0:4003:c01::22a]:33787)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1aXusm-0003wr-4T; Mon, 22 Feb 2016 13:06:56 -0500
Received: by mail-ob0-x22a.google.com with SMTP id jq7so172652820obb.0;
	Mon, 22 Feb 2016 10:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=E51JjFcGu1/c3GBkZewlyDhG93pTImraAAR6+/aHNKs=;
	b=Ob2/DqiIuT/bae6uQnt/hRAyJVSUhZENBYTcMLEpPgun2Z852wHtXzJG7mN4nHAR6L
	ijL4kzha3foeTnFmKhIr0OPZtemYmZ+NxlEb5R8lDoZcUucTb8F7bZb9XS6IDPTgXcqn
	gaA3bCr/mh1AO62+KcIf5Xtx7G0NcI+CqHjAr5XFCP6oCoCKmkSV+LfYHCOxQIjS+K0a
	TrNDyC/awWWEuKsIfDEG78OlUJuYAGRwhNHAcsxrRsjnO/0zPh/QuBzj+nsvY7zcWvho
	Plip6MtIuumwjKkk+FcY5gYAcoERMT7n01u6bIqzNTAqxnwAFZUNzDEeqaQy0f6gucHo
	TtDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=E51JjFcGu1/c3GBkZewlyDhG93pTImraAAR6+/aHNKs=;
	b=FUEFUnh3CiMnSCUixZ7c5493AtBfqmHYahN0E/LoRou5qAAF6SCnk0IZpZFpiup5Zy
	R2Abu83Yq4QsljhlKU1YeB3PMFtVuc6LSz/OckcA1nYkr2zGmrMsomCttrjTBO66sGAo
	qcsrkhgOf9k8Pe4m8Nge60b1d0n4XyyTlDw8S1XG31evbIousDCv9oM14JZrKAMvFRM7
	C9gbfL1YkNn8V6ehKh4bK8VFwsZHWrBQB4T/LogYY1h+VUjSolxkYxi1ZDT07HWFMVnY
	tBMMfVbt/I5qrrkZZRpCpr0MMdqPqAQNd76NhuuSQaUD1RPo96GVYahuH874VTWNQ83r
	JRKw==
X-Gm-Message-State: AG10YOTT4ZGnjD9dvFIjkX69SSiWh2R4h+ndmnXVRHs7M3HzdeGyS0V3RbQ+wx9swFd3p5UnZYRGit1JLodLoA==
X-Received: by 10.182.61.38 with SMTP id m6mr24757018obr.32.1456164410628;
	Mon, 22 Feb 2016 10:06:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.49.199 with HTTP; Mon, 22 Feb 2016 10:06:21 -0800 (PST)
In-Reply-To: <CAFEAcA8_oJZU_mHBbmSk0XvJPaevAri6A-UwBkMHCBh2op9h+A@mail.gmail.com>
References: <1455892784-11328-1-git-send-email-peter.maydell@linaro.org>
	<1455892784-11328-3-git-send-email-peter.maydell@linaro.org>
	<CAKmqyKNy79b8_k2wOO_v0DgXc3OCwhcHv7zVkcEPe_Fft6-Gpw@mail.gmail.com>
	<CAFEAcA8_oJZU_mHBbmSk0XvJPaevAri6A-UwBkMHCBh2op9h+A@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Feb 2016 10:06:21 -0800
Message-ID: <CAKmqyKPBjqDX+nZ79k1z5zr0AXx5jV2eJCGbqVosPaymZgGFrw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::22a
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/2] target-arm: Implement
 MDCR_EL3.TPM and MDCR_EL2.TPM traps
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
X-TUID: 0RywJ9KUPQ0w

On Sat, Feb 20, 2016 at 3:28 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 19 February 2016 at 19:38, Alistair Francis <alistair23@gmail.com> wrote:
>> On Fri, Feb 19, 2016 at 6:39 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> +/* Check for traps to performance monitor registers, which are controlled
>>> + * by MDCR_EL2.TPM for EL2 and MDCR_EL3.TPM for EL3.
>>> + */
>>> +static CPAccessResult access_tpm(CPUARMState *env, const ARMCPRegInfo *ri,
>>> +                                 bool isread)
>>> +{
>>> +    int el = arm_current_el(env);
>>> +
>>> +    if (el < 2 && (env->cp15.mdcr_el2 & MDCR_TPM)
>>> +        && !arm_is_secure_below_el3(env)) {
>>> +        return CP_ACCESS_TRAP_EL2;
>>> +    }
>>> +    if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TPM)) {
>>> +        return CP_ACCESS_TRAP_EL3;
>>> +    }
>>
>> Hey Peter,
>>
>> Why not use else if?
>
> I generally tend not to use else-if ladders if the thing
> in the conditional returns unconditionally, just as a
> personal style preference. "if () { X } else if () { Y } Z"
> implies a possible control flow path of "take the if
> branch so run X, then skip Y, and continue after to run Z",
> and if X returns unconditionally that can't happen.
> It also matches up with the usual approach of
>    if (something) {
>        early return;
>    }
>    main body of function;
>
> which you wouldn't want to write as
>    if (something) {
>       early return;
>    } else {
>       main body;
>    }

Fair point. I always thought of it the other way around. If you can't
go into the other branches then it should be if () { return } else if
() { return } to make it more explict.

It doesn't matter though.

Acked-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

>
> thanks
> -- PMM
