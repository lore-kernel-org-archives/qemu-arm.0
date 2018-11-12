Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3015473wrw;
        Mon, 12 Nov 2018 03:39:45 -0800 (PST)
X-Google-Smtp-Source: AJdET5f3MknqfgfUObPk6SFpCQK+DC+Ik9GXdIcq8ib8ajZb8hh7VYtf5E8+i4fDr3GX5/iZDuvd
X-Received: by 2002:a0c:eaca:: with SMTP id y10mr516584qvp.176.1542022785638;
        Mon, 12 Nov 2018 03:39:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542022785; cv=none;
        d=google.com; s=arc-20160816;
        b=BTtNvp4UtlA/b2wWZXgyAOKhNv/HyZ4qdhXnw2naRbpb/XriXZo4boUgj2ja9qE9HU
         WzojKw5r0vO3mDgmT7NDMxSV1fFOGbUZhAXAvPRDhcEt8ptYUOKcN9tOvdTOoHBVHURF
         itWP0FgbP+SDxwDzB4zRmC4wzuei31Xa88AMx8nvsD3kHDAr+JxncPukI16BiIEDmTgx
         auZ83t2riwIcXws+59eW8WbfZI8Tu3WDgPpyxoEaDdKLcREoaOgan4d3ohJ9fyCeAF74
         2IZGHPaNdqQj5ka0bNM7+L1uzOSDa49LbWXdvJa3CTleEq66dC9b2d9lcEFOXocmnpvV
         rkcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=H6aFTKNpi9RszjGp05wPh8gds8mcM85XfRQ5KNdh1ps=;
        b=qrJU68zV2FU3qTHfUbwhOb5mhvmd8mnJU34sTGXR40NSB/wQ81m9c5dv+IlVk/LU5D
         ShoqyyszlT3M+TlOJ+AEqi4gEi9ICYTbFVCQGT66Tf9ZyCF+noBUr0RhNuoJTkkpvD2r
         kWkSaRwB8spsBec0TpRdv1r5NitcL6AHrKeoa/fP7gH8z+6xssZucnL+tixujppng8Z9
         u5MyPZ8DS73Z+zsdjGS6C8XaVJM/m4Wv/0AdrnrkvqMPD7sXvNFBwct4yMTjYM0wdAMF
         KaLGqDEIamWk+3UGxxrz7dT7OHNwrSGQ3DdX4h5RJV9/5UYhCm+WvLQlneiBcX/Rz6Iw
         mz3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NwjOFvsw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n9si8680909qvg.147.2018.11.12.03.39.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Nov 2018 03:39:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NwjOFvsw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48069 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMAZE-0008Vo-Vg
	for alex.bennee@linaro.org; Mon, 12 Nov 2018 06:39:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gMAYy-0008TX-At
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 06:39:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gMAYx-0006R5-F6
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 06:39:28 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:34094)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gMAYx-0006Ot-7S
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 06:39:27 -0500
Received: by mail-ot1-x344.google.com with SMTP id t5so7689279otk.1
	for <qemu-arm@nongnu.org>; Mon, 12 Nov 2018 03:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H6aFTKNpi9RszjGp05wPh8gds8mcM85XfRQ5KNdh1ps=;
	b=NwjOFvswubYSSro8xdjAOiMtTjOyA9sA/gjsbFgxsyVNWZAbWzqYXFipFp6pl4Ohcb
	4TNCWLLkvy/a7i7zxiQTmBnTJjMoFz6vsbwpylidBX3v6Vpt6uhhKIJqLUTjr6FGax4h
	6v8cHbLD0O39XnZb5ZskJuzsLWgkJLH/BDbCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H6aFTKNpi9RszjGp05wPh8gds8mcM85XfRQ5KNdh1ps=;
	b=NfKK8+SZMOc7/bpDOi8qHAqvzGqj/6HkLpioc+SuUYWJVktyTmDXViiOc3/xlcBz2m
	4JQlQEIXZNDn4UjwUetQXivgYTsHe/0H45gATUoYspTnjHfdt8l8I+hItP+rYT+r0N6U
	F7X6JPibcCjVNchkkva88ssP1JoOB1VJtbIUj98MfWIteZF1pM9s7w/0tdwtPYJNvzuu
	yIlQuqhK1C073yn+VJaVg1dBBHOGyq7j/Ob9qSF1E2VVXYcGt5aYGCYw2ZE3HPk97RXs
	a7657REZLNJPdHJOQNj356wTIF9wzjU1O9quQrUUxkrLbDsohwHUdKZ9C5PW7DrbauJq
	jU8g==
X-Gm-Message-State: AGRZ1gJEwoXwB8YH3cJQ8V1R33oWOg+wv3jOML0/DB/RDS0nqfnrFK27
	ScIJNsP6eBUACc5LmrwbB/ZES7qv7K37h2GLSslMvg==
X-Received: by 2002:a9d:156d:: with SMTP id z42mr335381otz.201.1542022766360; 
	Mon, 12 Nov 2018 03:39:26 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Mon, 12 Nov 2018 03:39:06
	-0800 (PST)
In-Reply-To: <20181108175246.13416-5-richard.henderson@linaro.org>
References: <20181108175246.13416-1-richard.henderson@linaro.org>
	<20181108175246.13416-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Nov 2018 11:39:06 +0000
Message-ID: <CAFEAcA9LFEkE7YQ9q0DJrWii25VhuL6hodyG+gxYWQRVU-hDhA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH v3 4/5] target/arm: Fill in ARMISARegisters
 for kvm32
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
X-TUID: nRGpi/v8Bblg

On 8 November 2018 at 17:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/kvm32.c | 33 ++++++++++++++++++++++++++++-----
>  1 file changed, 28 insertions(+), 5 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
