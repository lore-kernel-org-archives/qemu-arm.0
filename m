Received: by 10.80.166.35 with SMTP id d32csp2673458edc;
        Mon, 24 Oct 2016 07:34:51 -0700 (PDT)
X-Received: by 10.31.2.201 with SMTP id 192mr9377149vkc.171.1477319690955;
        Mon, 24 Oct 2016 07:34:50 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f89si5169430uaf.136.2016.10.24.07.34.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Oct 2016 07:34:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47101 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bygKv-0000ea-KC
	for alex.bennee@linaro.org; Mon, 24 Oct 2016 10:34:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51992)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1byfyx-0007hq-Fm
	for qemu-devel@nongnu.org; Mon, 24 Oct 2016 10:12:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1byfyt-0007bC-PK
	for qemu-devel@nongnu.org; Mon, 24 Oct 2016 10:12:07 -0400
Received: from mail-ua0-x230.google.com ([2607:f8b0:400c:c08::230]:37928)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1byfyt-0007aV-Br
	for qemu-devel@nongnu.org; Mon, 24 Oct 2016 10:12:03 -0400
Received: by mail-ua0-x230.google.com with SMTP id t11so228306uaa.5
	for <qemu-devel@nongnu.org>; Mon, 24 Oct 2016 07:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5B3FCGn/WYTwunV9HOP/rNPUsGs16igLVmiNCmgWDnA=;
	b=CJZ4VuJ7VpnCPq4EUFok4wCINS9ixY5q0spFhwGr8VS1KxS7DnfL8Nw0bFrYpc7DoA
	Gz8D+tCcuqDO2Dv+OQLGd0ahG3NNNhUc03oaXPoZBcOlvJfFcyS9XHYnm0wZIsAAtirp
	EwcCJZf+PxEyVxJ6XyogEMtDGPVEvh43KGg/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5B3FCGn/WYTwunV9HOP/rNPUsGs16igLVmiNCmgWDnA=;
	b=E5bZXfJBLIHwyrHdtw4vw8X1LobQmW39nn1WVr5uFNbRkXCHwOY3yFJrRKG6KullDp
	n4XZ73y6ruFSrpStdU7pz5xotGeVn4wf9qGdcE5o+jFuhx8p2vCFVONkR/SMiwdoblVO
	gMs5/PeBctvi29OQrTXQhtgbPYyGCMlqOzjC+Ld3ajKaoGHgs42KSeBnH51PBTVCz+VO
	z4kifD0Hve+mT607Y1fUfF1ORr4Ybo0/Ig8WOH3zo9PsPS1djRkRsnDVNI5IebWx0zL2
	ZEuKTv/isG5lDT7JEaX0we3Q6Aa2W0qOk1PylNOi41p8r4idYjCPTEwIFVc4yJoJjvRM
	1NhA==
X-Gm-Message-State: ABUngvclWZ7GlZKnF7ABFIwLpscCs9+8Kso3gpURszUiISwgxYC3OB0Cg9NiHFRsgNJVDs2X8G0cwettfU4B49VV
X-Received: by 10.31.216.4 with SMTP id p4mr7923886vkg.51.1477318322204; Mon,
	24 Oct 2016 07:12:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Mon, 24 Oct 2016 07:11:41 -0700 (PDT)
In-Reply-To: <1476800269-31902-1-git-send-email-ppandit@redhat.com>
References: <1476800269-31902-1-git-send-email-ppandit@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Oct 2016 15:11:41 +0100
Message-ID: <CAFEAcA_nDuf8PHeMnNjqxjZ83V-atYTn0HN2=RgBfuNH9G+qjQ@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::230
Subject: Re: [Qemu-devel] [PATCH] timer: stm32f2xx_timer: add check for
 prescaler value
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
Cc: Alistair Francis <alistair23@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Huawei PSIRT <psirt@huawei.com>, Qemu Developers <qemu-devel@nongnu.org>,
	Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tvAuBg/Z8dCj

On 18 October 2016 at 15:17, P J P <ppandit@redhat.com> wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
>
> The STM32F2XX Timer emulator uses a 16 bit prescaler value to
> limit the timer clock rate. It does that by dividing the timer
> frequency. If the prescaler 's->tim_psc' was set to be UINT_MAX,
> it'd lead to divide by zero error. Limit prescaler value to 16
> bits to avoid it.
>
> Reported-by: Huawei PSIRT <psirt@huawei.com>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  hw/timer/stm32f2xx_timer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/timer/stm32f2xx_timer.c b/hw/timer/stm32f2xx_timer.c
> index bf0fb28..2cad36d 100644
> --- a/hw/timer/stm32f2xx_timer.c
> +++ b/hw/timer/stm32f2xx_timer.c
> @@ -208,7 +208,7 @@ static void stm32f2xx_timer_write(void *opaque, hwaddr offset,
>          return;
>      case TIM_PSC:
>          timer_val = stm32f2xx_ns_to_ticks(s, now) - s->tick_offset;
> -        s->tim_psc = value;
> +        s->tim_psc = value & 0xFFFF;
>          value = timer_val;
>          break;
>      case TIM_CNT:

Applied to target-arm.next, thanks.

(That "value = timer_val;" line looks odd as it is dead code,
but that's a different bug I think. Alistair, can you remember
what you meant when you wrote that?)

-- PMM
