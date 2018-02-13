Received: by 10.28.71.27 with SMTP id u27csp1264884wma;
        Tue, 13 Feb 2018 05:18:11 -0800 (PST)
X-Google-Smtp-Source: AH8x226m53wondQWI7THqMrUV2VrBT73cOTXv4Oxz4/Ci90meg3tS593xzSj4BHf7N5BHD/GI1y7
X-Received: by 10.37.100.3 with SMTP id y3mr708846ybb.180.1518527891630;
        Tue, 13 Feb 2018 05:18:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518527891; cv=none;
        d=google.com; s=arc-20160816;
        b=rkIPMnNhoBH1JMQYYUsztGnRqjkcLM3IrovMw7m9YHuXns+URlYDP/6xdGoZYc3DDa
         IdzWV35tB8dJULQy0oMzIulLWHXAssB6WfCxoZCnWuNHPU7PAAL8hBxqP7VHTbyi+HrU
         +r/4kyYTvUPf/6fJj7VKH4lErsItrzPZX1lrCEpt70kWy+zP+LtMyiqY4WEeC0d/x4/o
         wbA3yFxUocf3xkWgB/LnnGN+w43xR58WhHaUqP+tfG6sFYo6zLhxiXmAf2WTXoCj3gAC
         tGIZRKILgFo2Nw63xHX5T/SRsnZAjzHv+lv3CvrdjChPiBuJG+ZjTGLgrvFc94otHZax
         KMrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=/Q3SjziH/1fYUr0vdcFV6GbKFG2jVdRN+3/mpA6Jy44=;
        b=GLoAJduJEkbzQ2gSrHjJJoOqSY8juRmhWFC1YiHFyuaBdTlkIff4chQlREXxCm3cyu
         m/VlfWuqyZ36/RNMiQhJgkhyIq/Eg4Dol2YNflSnk7g1eA4jFLBgYR9Z9+WF7WPmoN9l
         x0o2IDpK8ZdpAUrq39OaYVavfltaVAF4iFtegpdLEK9j6Xg7hp508szuj2GfaVD9mO7R
         PJO1oIJYj/gHCLKtlSfrbVmlp+S4bu5cwcUEBZ9Xqvn358RSDb4N0RDwfFRoYIcYq+CX
         7rs5XYJeCXojWye7R8vM8arCHTuNrLhJIAajx+AXtXlVISN6f+3xpQ1qyi6IjexdZaib
         P1wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H+groc+L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m62si948651ywe.448.2018.02.13.05.18.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Feb 2018 05:18:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H+groc+L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57092 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elaTL-0003J9-2r
	for alex.bennee@linaro.org; Tue, 13 Feb 2018 08:18:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1elaMf-0006BD-4T
	for qemu-arm@nongnu.org; Tue, 13 Feb 2018 08:11:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1elaMd-0003LP-OX
	for qemu-arm@nongnu.org; Tue, 13 Feb 2018 08:11:17 -0500
Received: from mail-ot0-x235.google.com ([2607:f8b0:4003:c0f::235]:42421)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1elaMd-0003Ku-Ii
	for qemu-arm@nongnu.org; Tue, 13 Feb 2018 08:11:15 -0500
Received: by mail-ot0-x235.google.com with SMTP id a7so17242847otk.9
	for <qemu-arm@nongnu.org>; Tue, 13 Feb 2018 05:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/Q3SjziH/1fYUr0vdcFV6GbKFG2jVdRN+3/mpA6Jy44=;
	b=H+groc+L2x7hCQB67ytuqC+vOagyzOr9QykhPMQIC23xnZOZKsp+IDbGHGtzD3OO0i
	LpUtoA01/v0Ybrio/FX4BQJ+zM5VZS89Hxw1OCs/JbwtAq0TAJ1d1Ge4FOc1/s0ELrZf
	ubrxJyLmfhAwIKAQVzbkIRBruUW6OUPFrYQo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/Q3SjziH/1fYUr0vdcFV6GbKFG2jVdRN+3/mpA6Jy44=;
	b=BeAS40x29HIVnDy77qaOF+zy8vJtx6CHaFueubS8tqUG2O/qm+Cps3LGhswTaLvWIx
	ClEWEWb9M3doVeHwZfCyzBg5mzny1cTu9NhIIgk8QbE7Dn5oq3XNqlxnWGXzQYNqVKIq
	n5V/7Nj6xkWkwuxxA3pyAIcmYX3zm49ZM8l//Qu8jqv6Yr9sfGfWi6+fKSmBh0vbx3Tf
	hp99S76PtX8I8FJXxOY1eY1ZFtuL9BnOX/OjtLsrhLnW4qpl0CytaIG837Es8h7Qp/vO
	yQjfoiMs71PlRgrXqH9bMTIeEwAOtZnXSQj2a7/+VuSgOojRMWjWrBQik6jIYN+WBBxP
	rfqA==
X-Gm-Message-State: APf1xPBngjiwfsd/K1IK571yj0pbd7ueomu83K3IvPdf/3ntgw5lsjFL
	5fXYrTYj6W5p0oVHV1Yr7V5KCm4eMfsfhZa/FdSMdA==
X-Received: by 10.157.13.72 with SMTP id 66mr774545oti.116.1518527474927; Tue,
	13 Feb 2018 05:11:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.3.23 with HTTP; Tue, 13 Feb 2018 05:10:54 -0800 (PST)
In-Reply-To: <2f4fd465-ab3a-d75d-ca91-86417b84ba9c@lauterbach.com>
References: <d23a2730-a103-6336-0658-e12fa9b0193f@lauterbach.com>
	<CAFEAcA-tc+-+KLcMPB=BV0zCmO6t7tuKHM4=kyRf_Xx0aCCidA@mail.gmail.com>
	<2f4fd465-ab3a-d75d-ca91-86417b84ba9c@lauterbach.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Feb 2018 13:10:54 +0000
Message-ID: <CAFEAcA8ZMjCVgWTVLkExSK78s7yYfUS4iRUq-aLEeSWJnqngCA@mail.gmail.com>
To: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::235
Subject: Re: [Qemu-arm] [PATCH V2] target-arm:Add a dynamic XML-description
 of the cp-registers to GDB
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
Cc: Khaled Jmal <khaled.jmal@lauterbach.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +wKM3piX1KKl

On 13 February 2018 at 12:51, Abdallah Bouassida
<abdallah.bouassida@lauterbach.com> wrote:

>> Hi. I tried applying this patch to review it, but unfortunately your
>> email client has made a complete mess of it. In particular:
>>   * it is wrapping long lines
>>   * it is converting all the leading space characters to unicode
>>     non-breaking space characters
>>
>> which means that it won't apply. Can you resend using something that
>> doesn't mangle plaintext, please?
>
> Hi Peter,
>
> Thanks for the review!
> I'm sorry, I wasn't aware of such a wrapping problem. So, here it is the
> patch as
> a plain text email.
>
>
> Best regards,
> Abdallah
>
>  gdbstub.c              | 18 +++++++++++
>  include/qom/cpu.h      |  3 ++
>  target/arm/cpu.c       |  3 ++
>  target/arm/cpu.h       | 18 +++++++++++
>  target/arm/gdbstub.c   | 87
> ++++++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/gdbstub64.c | 25 +++++++++++++++
>  target/arm/helper.c    |  3 +-
>  7 files changed, 155 insertions(+), 2 deletions(-)
>
> diff --git a/gdbstub.c b/gdbstub.c
> index f1d5148..f54053f 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -670,10 +670,20 @@ static const char *get_feature_xml(const char *p,
> const char **newp,

I'm afraid your email client is still wrapping long lines, as you can
see here. It is also doing the space-to-unicode-non-breaking-space
transformation.

It looks like you're using Thunderbird, in which case this might help:
https://www.kernel.org/doc/html/v4.11/process/email-clients.html#thunderbird-gui

It suggests disabling sending of format=flowed and wrapping of
long lines for patch emails.

Alternatively if you plan to send more patch mails in future
you might look into configuring the git-send-email command.

thanks
-- PMM
