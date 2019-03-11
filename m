Received: by 2002:a5d:610e:0:0:0:0:0 with SMTP id v14csp709673wrt;
        Mon, 11 Mar 2019 07:26:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwT8ZPzMRC/CZjbvvp3VIJxnLfcZGcmLqN7geXgVKIkIwntG2FPgMLVF7Mo3YbI4rDL8z9b
X-Received: by 2002:a81:29cc:: with SMTP id p195mr24865567ywp.32.1552314397513;
        Mon, 11 Mar 2019 07:26:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552314397; cv=none;
        d=google.com; s=arc-20160816;
        b=SK5IjJq0XtDi6MQZ84qxarMUmj5f/pQfD8zEmEpGKjLI/eSnxtR6nJvYZLyxZFqzg6
         mYaPhUxeCBA6GNrUsO62fvHbbIXpHwHSweS9kd+AaYwxKNdd90zBJA4PI/mDOjwd7jnB
         mijRgJ8dnilh5M4rE1BuLa0PO6kS1+hL77AghJdY7jG8e7AYJ2evkXTd1y3MMq3tzviN
         0P+GLSdo8YzDAxPXwiGUrVHk16fzGpovDPgEPnMPUA/Tfr6GkIR5Ne5bdQkFQByIp+C7
         DJWEb5/JOlZtNBOvVkhPqsrKwT2z44vkrM9trByp7GjawGFcD7NPsBvjvtmX+qMFOVix
         llKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=swPLWbf9eaf43kuOmXsFiFhzsiUTTmbXBY0c0SxnZb0=;
        b=i1W5kP1dazIQqHEC1PEPO0WipzTF3kB+691jR5UHgprE0MNbm7KF707ubDwwmRUjrM
         xXP24k5vLqTbELTBKmuND81txGx3YqrlGR5remCV8k7zw6jsjJPylFS0CE7jTVnifqBp
         jHW1Reogqm52y/F5x7dltZLr8zCKHdKzuOkPfKUbx0vF+Vcnya7kEmsEW6Faqno4E0Nb
         8rF548leyZchV7hUWD+H+SDVASgGsONug1et18gg3r30LYW6P8xhdEuw5UQM4Y/aFBP+
         6Gqy+9WCx8Gi721Iw3r6JP1XIfK+WsWNmVdBTWEmETQdFB9u6dnKj/TrbUkZ+PrEWSHw
         fSxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=f17D0q7R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w201si3173297ywa.240.2019.03.11.07.26.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Mar 2019 07:26:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=f17D0q7R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:34340 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3Lsy-0004ef-SM
	for alex.bennee@linaro.org; Mon, 11 Mar 2019 10:26:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h3Lo5-0000q1-JY
	for qemu-devel@nongnu.org; Mon, 11 Mar 2019 10:21:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h3Ld0-00007x-L4
	for qemu-devel@nongnu.org; Mon, 11 Mar 2019 10:10:11 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35841)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h3Ld0-000066-Cm
	for qemu-devel@nongnu.org; Mon, 11 Mar 2019 10:10:06 -0400
Received: by mail-ot1-x343.google.com with SMTP id v62so4024411otb.3
	for <qemu-devel@nongnu.org>; Mon, 11 Mar 2019 07:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=swPLWbf9eaf43kuOmXsFiFhzsiUTTmbXBY0c0SxnZb0=;
	b=f17D0q7ROJf+1muTMfUFWSsaM1Ox6/zFPMyyQ4gB+2pDyA1sbiRPUX7SyR7IC6EVar
	5SQ+tYOj60pkImXW9dHHgYSwfxNNTcfWI4vZYtC/XxcfroA+FtZJMLlrXscKWgoUqPw9
	bEA6Kmw6wlzwJT6faiozCmFGvCY9gMLrkSKPaYw0m6UvW7x08GUy3yn3aaJzhf5EqH7Y
	V3fvimc+e3HoFKzeltY0FsR2BrPSGI4EHWW6iDu1pQ1fHBsPd14a1oaYT8zsXVykzKnK
	T4peSW+fzCdEeTC30AGVY9hwAJWFSH75mVO2KpkPhS2xgBezj6BhRr4P10Vj9JpONHGT
	J3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=swPLWbf9eaf43kuOmXsFiFhzsiUTTmbXBY0c0SxnZb0=;
	b=comMq+zu00FHiW2cXnOaLXSsw05aQlGX0yWNtAf0vrI/3wYtkPc69QCEHD1sCGQln4
	hwOQzYqutb3gN1j44NKhEel3jAFAvuipkjsMq2kQeHUVS2enkg/aGOPjrCPn74vzthGA
	1W2A7egJI7Ae/mIjgwBB/AdkojFS530419zQqBLQnQHAFEeqS4J4Aa2puU8DfVr81KFM
	/f3f99ZpsWmySLe+fMw1/zSrL5z5bGJSuAlL1NcMrG3kHeSTV27BnJEHPrUXis1/ybaB
	IqOqk5DLkaEa/PxjrlO7R9NEn6FiAfnIpzJpadouuEAuDCWp6JAheOeGlBHBtob9Ix4l
	F8IQ==
X-Gm-Message-State: APjAAAVfNzp+WZ0Og5PW4amjhdJf0CPATkMeT+VhlN8srohNbGDhL9en
	Bm/kVZObsIgG7KYKP74WMG7xoece5YgPNVGi52wLhQ==
X-Received: by 2002:a9d:6406:: with SMTP id h6mr388661otl.238.1552313405132;
	Mon, 11 Mar 2019 07:10:05 -0700 (PDT)
MIME-Version: 1.0
References: <1552292963-19430-1-git-send-email-gengdongjiu@huawei.com>
In-Reply-To: <1552292963-19430-1-git-send-email-gengdongjiu@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Mar 2019 14:09:54 +0000
Message-ID: <CAFEAcA_awCQTXDMLUVuEtQNAZSU4eJp=6EA1c9QQrDygFfeHyg@mail.gmail.com>
To: gengdongjiu <gengdongjiu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [RESEND PATCH] target/arm: change arch timer
 registers access permission
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7jQMKzlhs4ua

On Mon, 11 Mar 2019 at 08:29, gengdongjiu <gengdongjiu@huawei.com> wrote:
>
> From: Dongjiu Geng <gengdongjiu@huawei.com>
>
> Some generic arch timer registers are Config-RW in the EL0,
> which means the EL0 exception level can have write permission
> if it is appropriately configured.
>
> When VM access registers, it firstly checks whether they have RW
> permission, then check whether it is appropriately configured.
> If they are defined to Ready only in EL0, even though they have been

"read only" ?

> appropriately configured, they still do not have write permission.
> So need to add the write permission according to ARMV8 spec when
> define it.
>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>

Yes, this seems to be a bug which has been present since
I added the generic timer support in commit 55d284af8e31b in 2013.

I'm not sure why the bug is there -- my best guess is that I
incorrectly copied the permission flags from the CNTFRQ register
(which really is RO from PL0 but RW from PL1 and above) to
these other registers which should be fully RW from PL0.

> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 2607d39..3db94c6 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2665,7 +2665,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
>      /* per-timer control */
>      { .name = "CNTP_CTL", .cp = 15, .crn = 14, .crm = 2, .opc1 = 0, .opc2 = 1,
>        .secure = ARM_CP_SECSTATE_NS,
> -      .type = ARM_CP_IO | ARM_CP_ALIAS, .access = PL1_RW | PL0_R,
> +      .type = ARM_CP_IO | ARM_CP_ALIAS, .access = PL1_RW | PL0_RW,

The PLx_{R,W,RW} constants all imply access is also possible from
the higher PLs, so this can just be written ".access = PL0_RW".

thanks
-- PMM
