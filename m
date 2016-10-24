Received: by 10.80.166.35 with SMTP id d32csp2620702edc;
        Mon, 24 Oct 2016 05:49:15 -0700 (PDT)
X-Received: by 10.55.17.143 with SMTP id 15mr13846236qkr.297.1477313355364;
        Mon, 24 Oct 2016 05:49:15 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u87si10848521qki.135.2016.10.24.05.49.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Oct 2016 05:49:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46522 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1byegk-0001AY-9o
	for alex.bennee@linaro.org; Mon, 24 Oct 2016 08:49:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58838)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1byefF-0000fZ-MN
	for qemu-devel@nongnu.org; Mon, 24 Oct 2016 08:47:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1byefD-0003dO-S4
	for qemu-devel@nongnu.org; Mon, 24 Oct 2016 08:47:41 -0400
Received: from mail-ua0-x22b.google.com ([2607:f8b0:400c:c08::22b]:36317)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1byefD-0003d0-E2
	for qemu-devel@nongnu.org; Mon, 24 Oct 2016 08:47:39 -0400
Received: by mail-ua0-x22b.google.com with SMTP id m11so40736003uab.3
	for <qemu-devel@nongnu.org>; Mon, 24 Oct 2016 05:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zlTQOPUXmp2tIcrA53Cw9kc6omGbD5RCbwDRWBdtBzc=;
	b=CAPaYxKWxNGyhp7wiVg/qpMuvhyE8WxH0uaIvy5oUmSwmaArYQNBoRYi/tefVbo/v2
	5NOPiw6/c8ccpgypE8n+HeEqvRK2rh4O3q1OtGIKakfWtcsNryQMAuNBEDnuyIfQaV3A
	rZMzxcXE62RBZ69e+uA4wHN7OwOLC5Se7k66Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zlTQOPUXmp2tIcrA53Cw9kc6omGbD5RCbwDRWBdtBzc=;
	b=JdrJMAj42rru8k0apGXKKy1Gg9H9lEqHrfIbnCD/+WBNiELM0OKJ7G4ZQxFPZGIUxd
	vYlQKFfcgh50rjyhIlQbAJbb87VxzC3wk371ruoQZ7NOriHdwsGioLzrOqodaC22Towd
	OwauYTcdfSjXHtuAcwdST2ZjjuAG2wKPPTZu5u2pWgTGcdh4kVPPhSI5gt7l2NdtSRc8
	/T4F1dCHDuF2Rq8welCUxxAZ4o/c+wSAr2CYJSA2qmsuGlMNJOFiB4J9kxclb4VH5k6P
	XBEyx4mv3mYs7pm//tYoxP79ruLl5ZlxSYXAuiTPopHL2wbTWM1RO1Ta0PEnXpZj7D6U
	XClA==
X-Gm-Message-State: ABUngvf2iOHpI8YEzUS28bVKomzZMGJlt5s1FvJwrd11fwLobrDab5WvRXx9iDfodnAAfLU78txgjBwf/aL9mwpO
X-Received: by 10.31.65.195 with SMTP id o186mr7612505vka.3.1477313258289;
	Mon, 24 Oct 2016 05:47:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Mon, 24 Oct 2016 05:47:17 -0700 (PDT)
In-Reply-To: <1476733226-11635-1-git-send-email-ppandit@redhat.com>
References: <1476733226-11635-1-git-send-email-ppandit@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Oct 2016 13:47:17 +0100
Message-ID: <CAFEAcA8g97rsH+9_-AnN=qZX4rubP3MWBwrnE_1E1P5RoOMY1Q@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22b
Subject: Re: [Qemu-devel] [PATCH v7] timer: a9gtimer: remove loop to
 auto-increment comparator
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Li Qiang <liqiang6-s@360.cn>,
	Qemu Developers <qemu-devel@nongnu.org>,
	Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ly82GD/UPuOC

On 17 October 2016 at 20:40, P J P <ppandit@redhat.com> wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
>
> ARM A9MP processor has a peripheral timer with an auto-increment
> register, which holds an increment step value. A user could set
> this value to zero. When auto-increment control bit is enabled,
> it leads to an infinite loop in 'a9_gtimer_update' while
> updating comparator value. Remove this loop incrementing the
> comparator value.
>
> Reported-by: Li Qiang <liqiang6-s@360.cn>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  hw/timer/a9gtimer.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> Use QEMU_ALIGN_UP instead of QEMU_ALIGN_DOWN
>   -> https://lists.gnu.org/archive/html/qemu-devel/2016-10/msg03788.html



Applied to target-arm.next, thanks.

-- PMM
