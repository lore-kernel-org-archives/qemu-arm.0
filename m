Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1011693wrm;
        Fri, 18 Oct 2019 07:44:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwncszlyNjIZSQkGFCuCDd31OKEE0nSRifPBZ/8GBuZbVvAGP9udK/kotEmGAyArbBGWHyw
X-Received: by 2002:a37:de0e:: with SMTP id h14mr9071280qkj.45.1571409859108;
        Fri, 18 Oct 2019 07:44:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571409859; cv=none;
        d=google.com; s=arc-20160816;
        b=K8ok15m6s8d62EBU6s+r5XtNR8gQui1a1zbtNz4TfHWUHDdxPLKpHCOc7hLY9On5nJ
         cBlkOqAUG70h4Xb53RQqfNDzx2XTlJlwTyuRwmPbkhavvACqypkO65YFl/9nqbM56A1Q
         C7DhFTdrhkwOgZ1rmKhK231NLpKsYJJW3w/Ez47lPEl7ce6hwCSyVaUMWXlCJM/qi3Do
         L9drJrSQ/Y9qp2SolexivTCsLjkeO5hwwyeksXDVTlf/o95WAk4loJpcbvQ9JhYg7685
         6pNxV8ZWflsysYt+vgb15NzquZwdnjWS+WQCbVDHnYZgxiwgK3gQba9DhRQn+/6Qd40Q
         YHbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=y44R6NG+agF8VVfYHxrSqxwM5/55QeT1Cf2DRBB2rCM=;
        b=DZMA3iELL2aeZo8oAqDMVIXzfKMhRBBbiRfR35CMFQRABBXZxyL/fC9T5BfKEYUKqB
         MuNZbGpNRk0TrmMeSkAtU7WnbWbanduDCC8vpMfER2mMCh+jXavkW34W3+r0U09lOnZU
         JG5n0OOLUnlsDkoLDP2S1GGRBzPsdTuQmM2OeEDMtOxRhe1dzl22jqfgrrJVZjfychCz
         8vkLTGZ1OasvhhUo6p77x4jcmwKgFggk/qD2BdNfntc4vBE47jw5z9xcovrhiwI07ufw
         4+bbbA3RHKtvWO92ldv5YGlM7nIkH19a4EMHevxFIh8i4elYcU9ROUyjpdB/jFWcHQ3q
         DZVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B30NTeYu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k22si5228850qkg.87.2019.10.18.07.44.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 07:44:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B30NTeYu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLTUG-00031i-OR
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 10:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35888)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iLTTx-00031T-4M
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 10:43:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iLTTv-0007N1-R8
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 10:43:57 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:24179
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iLTTv-0007Mh-9M
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 10:43:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571409834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y44R6NG+agF8VVfYHxrSqxwM5/55QeT1Cf2DRBB2rCM=;
 b=B30NTeYuvqnsfMXluY5LVs2kPRXu/IB65lQZJK5Lwvxzbo0fWtdea2ahZ1BwuxxBjOBKhZ
 jxt792qMUlzsbrstRoOezvl7OYyrsNz9nLA2es+GAQPVV1MpzmVWc/Gh3WRB9l8qaxVHzg
 acArFM4DvlM6rEDSbFHh3yTtWffhCXQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-_l5dmBInNgC5dsMfNQOOEQ-1; Fri, 18 Oct 2019 10:43:51 -0400
Received: by mail-wr1-f71.google.com with SMTP id m14so2768816wru.17
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 07:43:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oxTaWJF+E2pYjJeQevf8fSzAvW9kkJ7FLXGSFd8B/aQ=;
 b=DLnUJY0VDMeWx1/hJdvZB7GdpdM6XxKrAKTYezQsaX4/46D381xLbr6QjB3LdorBeP
 auVuKJwZ3bLHTsdumg3JvAei7KLfhvZBH7V4yiPdRJvse+dqDHOoxI4A5yTGXti8de+p
 S4+zjTZ65qyz4X61Ixa+k+2Eg0K6eqi+ofjdFup3MBn0vii0CBocfEHaMbGeO71lnlwP
 jGuH/ar5urL4Y9fV+ONjfgBjUjhu2tY5qSDnn4DE9FCdjHn4rE+bJNGf72EM5wEK/uE5
 ho/tDlJkPzQqs1FL7IbezIIYaVehealSxZW2GtS7dVsW0BuEK6k1RoKcbBQYZnVG86ff
 C1sQ==
X-Gm-Message-State: APjAAAUPGzKGFLL38s2mo5VCg7O7dYhrpRPQ9ANqFSoDTx1L7N7zGj1A
 WjHF3iDhUeJ0vXXlftU2SftplavOnEzHi0r2/ndFFN9RPnBPlEuiv+a1pPSPf+CwwNo+RaQ1fNE
 m5bXUTrD181wm
X-Received: by 2002:a1c:f305:: with SMTP id q5mr7902550wmq.137.1571409829932; 
 Fri, 18 Oct 2019 07:43:49 -0700 (PDT)
X-Received: by 2002:a1c:f305:: with SMTP id q5mr7902532wmq.137.1571409829662; 
 Fri, 18 Oct 2019 07:43:49 -0700 (PDT)
Received: from [192.168.1.36] (14.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.14])
 by smtp.gmail.com with ESMTPSA id y11sm5218116wrp.44.2019.10.18.07.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Oct 2019 07:43:48 -0700 (PDT)
Subject: Re: [PATCH] hw/timer/exynos4210_mct: Initialize ptimer before
 starting it
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191018143149.9216-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c2afaaa1-16e7-b13a-285d-c995f4011a26@redhat.com>
Date: Fri, 18 Oct 2019 16:43:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191018143149.9216-1-peter.maydell@linaro.org>
Content-Language: en-US
X-MC-Unique: _l5dmBInNgC5dsMfNQOOEQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s0Zee9jUejYZ

On 10/18/19 4:31 PM, Peter Maydell wrote:
> From: Guenter Roeck <linux@roeck-us.net>
>=20
> When booting a recent Linux kernel, the qemu message "Timer with delta
> zero, disabling" is seen, apparently because a ptimer is started before
> being initialized.  Fix the problem by initializing the offending ptimer
> before starting it.
>=20
> The bug is effectively harmless in the old QEMUBH setup
> because the sequence of events is:
>   * the delta zero means the timer expires immediately
>   * ptimer_reload() arranges for exynos4210_gfrc_event() to be called
>   * ptimer_reload() notices the zero delta and disables the timer
>   * later, the QEMUBH runs, and exynos4210_gfrc_event() correctly
>     configures the timer and restarts it
>=20
> In the new transaction based API the bug is still harmless,
> but differences of when the callback function runs mean the
> message is not printed any more:
>   * ptimer_run() does nothing as it's inside a transaction block
>   * ptimer_transaction_commit() sees it has work to do and
>     calls ptimer_reload()
>   * the zero delta means the timer expires immediately
>   * ptimer_reload() calls exynos4210_gfrc_event() directly
>   * exynos4210_gfrc_event() configures the timer
>   * the delta is no longer zero so ptimer_reload() doesn't complain
>     (the zero-delta test is after the trigger-callback in
>     the ptimer_reload() function)
>=20
> Regardless, the behaviour here was not intentional, and we should
> just program the ptimer correctly to start with.
>=20
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> [PMM: Expansion/clarification of the commit message:
>   the message is about a zero delta, not a zero period;
>   added detail to the commit message of the analysis of what

Thanks for the details!

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

>   is happening and why the kernel boots even with the message;
>   added note that the message goes away with the new ptimer API]
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Philippe pointed me at this bugfix from Guenter. At one point
> in my working on the ptimer API changes I thought this bugfix
> would be necessary as a prerequisite, but in fact the issue
> was in my ptimer changes, and it just happened that fixing
> the MCT bug was a workaround for my bug. Even though the
> ptimer API changes actually coincidentally now suppress the
> annoying message about a zero delta, the behaviour is definitely
> not intentional, and since I spent the time working through the
> analysis of what was actually going on here I don't want
> to waste it :-)
> ---
>   hw/timer/exynos4210_mct.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
> index 72257584145..944120aea59 100644
> --- a/hw/timer/exynos4210_mct.c
> +++ b/hw/timer/exynos4210_mct.c
> @@ -1254,7 +1254,7 @@ static void exynos4210_mct_write(void *opaque, hwad=
dr offset,
>           /* Start FRC if transition from disabled to enabled */
>           if ((value & G_TCON_TIMER_ENABLE) > (old_val &
>                   G_TCON_TIMER_ENABLE)) {
> -            exynos4210_gfrc_start(&s->g_timer);
> +            exynos4210_gfrc_restart(s);
>           }
>           if ((value & G_TCON_TIMER_ENABLE) < (old_val &
>                   G_TCON_TIMER_ENABLE)) {
>=20

