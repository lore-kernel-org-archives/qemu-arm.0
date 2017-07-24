Received: by 10.25.44.15 with SMTP id s15csp4311245lfs;
        Mon, 24 Jul 2017 14:03:24 -0700 (PDT)
X-Received: by 10.55.204.157 with SMTP id n29mr20192434qkl.135.1500930204115;
        Mon, 24 Jul 2017 14:03:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500930204; cv=none;
        d=google.com; s=arc-20160816;
        b=Z0Fr2NJvzuAmMdo7IgiWROP4drFZ0mt+Sjs4UIe+0lv5J5HubdJAGTyGyirhibW901
         SnOzwf3dbthPlF4BH87EdeXfLhxyDuCvB+EsIUweWWHoSt6hHlYoEdz6unXClX0xwv5u
         WRWHTIdvlVpGjfX+tMEJqd0n6k7USy0oXxIVU8B6Tm4QR68ikuL9uaFIW/dQQo4BqaJu
         QcR05Vd+hJEQjPAmyuugDkP5CzaJ1NQLEmWTL8u/D9ffUUNByFUrCuwkZ9/VBQRlZFJr
         +tTJs2eCQmuYx8cNRqTKjEVr/5iDWR6eBlhYxWHTbmcf7gKZQB/yWdMrva0VOMW5JYwc
         HnXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=O+VE5dteh2/fp3a3iUpehO/fFTfopI6pswzEpD+TdKE=;
        b=dEhRy0BRfyGpT0WBUizQI83HhZ4cKhSc3TbBKiq/wvxL+dvhi/7WJVjuxUNzaJrn/k
         Q3DgSZX4OnRYe7UwHJTb3cK86P7o/af1IHBpF3khXMxhwfjgO4ZnVO+R2kA3ZlRh9ggc
         vtE3Xv9odKYYLmXHctrKN98m+t7T1k1+/BCHB2Gi2T+aghm5QOHv9PEsijfvp/CaqeMV
         xD5RlH+A+So9T+rJHB9Qu9yKYHwBm0sNybrEl/LcWn54G+dfO/A1V/epLfdv1452wipH
         LI/iICwO/AAry01vyV3lxBVMouCeE8cdIIWnZw5ZLQKosCHU13OD3kkzsb+w6NX2wZTX
         lA4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=B6qaXET2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j1si9487568qkc.320.2017.07.24.14.03.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Jul 2017 14:03:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=B6qaXET2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57023 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dZkVd-0005Wo-KH
	for alex.bennee@linaro.org; Mon, 24 Jul 2017 17:03:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZkTv-0004Jw-Vj
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 17:01:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZkTv-0001yp-5F
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 17:01:36 -0400
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:36615)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dZkTu-0001xZ-VN
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 17:01:35 -0400
Received: by mail-wm0-x22e.google.com with SMTP id t201so29512939wmt.1
	for <qemu-arm@nongnu.org>; Mon, 24 Jul 2017 14:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=O+VE5dteh2/fp3a3iUpehO/fFTfopI6pswzEpD+TdKE=;
	b=B6qaXET2csYcIt9BcAJyfns41P1LqKtCDF2IPPZ2TLAbl0x71nsJwmD69BwRscIwxp
	X4CvPmpAGy9UJGUqh9DIPFJ4gNk5CHb5AeuMXEzD4vKa3ACIU2JYuD+9/W0AeyB6rU02
	I1JsgE9Onli6YsIvAN/P/BYErCxEyFJu+QtH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=O+VE5dteh2/fp3a3iUpehO/fFTfopI6pswzEpD+TdKE=;
	b=jZ+u9eQywKhQjNoIEIa6ZKQPME0l4MbUPgK3VGS5cSLGFXE+LCFcDw68Nfc8XpGyMk
	+6frOn5I5lKRLFjofui1bcq4mJA5U3lGUsSsgupzX7fNwUHHTWp7q4tmsA/KVWdMTH1m
	3FGIyHeyr0RwnPIL+qmfWaLtur4DFrqogNlA4oE6gQ0rDZx4K8woGbU7UIEFG6kaji8h
	LMjyZP28O1eHGLtJUIwWzlhC+acn3UrViSofITlQAik2Wj1yGDbrP7UdAlqj08YaZGhI
	WufLdO29C96hY84Hzf+sB/aXH15RQpZDhrBkQYWYQ6PpsmIWv/myx+OTXw0yTxc60+gd
	811g==
X-Gm-Message-State: AIVw110miSLmHQcM5aDgPwxLsOb5D1vNoLTulVynpfMJl48XdlSVoRRM
	GPAHIyr6meBtzAfPmbu+MYmVOkDgyVZJ
X-Received: by 10.28.193.138 with SMTP id r132mr6032571wmf.155.1500930092147; 
	Mon, 24 Jul 2017 14:01:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Mon, 24 Jul 2017 14:01:11 -0700 (PDT)
In-Reply-To: <20170724182751.18261-33-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-33-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Jul 2017 22:01:11 +0100
Message-ID: <CAFEAcA9d5SE-+=YxJ_dwjvkpxs2R0QJszESExGoG2y+Bnyk2aA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22e
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for 2.10 32/35] timer/pxa2xx:
 silent warning about out-of-bound memory access
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QZa0/SbKxCNh

On 24 July 2017 at 19:27, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> Unlikely to happen.
>
> hw/timer/pxa2xx_timer.c:145:19: warning: Out of bound memory access (acce=
ssed memory precedes memory block)
>         counter =3D counters[n];
>                   ^~~~~~~~~~~
>
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/timer/pxa2xx_timer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/timer/pxa2xx_timer.c b/hw/timer/pxa2xx_timer.c
> index 68ba5a70b3..d47f463636 100644
> --- a/hw/timer/pxa2xx_timer.c
> +++ b/hw/timer/pxa2xx_timer.c
> @@ -139,7 +139,7 @@ static void pxa2xx_timer_update4(void *opaque, uint64=
_t now_qemu, int n)
>      if (s->tm4[n].control & (1 << 7))
>          counter =3D n;
>      else
> -        counter =3D counters[n];
> +        counter =3D counters[n & 7];
>
>      if (!s->tm4[counter].freq) {
>          timer_del(s->tm4[n].tm.qtimer);
> --

This looks rather odd, because we use a mask to guard
the counters[] array index, but we do an access into
another 8-element array with n both immediately
above and immediately below that.

It's not actually possible to call this function
with n not between 0 and 7 -- if the static
analyser can't figure that out does adding an
assert at the top of the function help it out?

thanks
-- PMM
