Received: by 10.25.21.96 with SMTP id l93csp334496lfi;
        Sat, 25 Jun 2016 06:21:04 -0700 (PDT)
X-Received: by 10.237.44.165 with SMTP id g34mr11497565qtd.17.1466860864047;
        Sat, 25 Jun 2016 06:21:04 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x16si8989635qka.279.2016.06.25.06.21.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 25 Jun 2016 06:21:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49937 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGnWB-0006OO-CP
	for alex.bennee@linaro.org; Sat, 25 Jun 2016 09:21:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56152)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1bGnW6-0006GM-0k
	for qemu-arm@nongnu.org; Sat, 25 Jun 2016 09:20:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1bGnW0-00039W-0V
	for qemu-arm@nongnu.org; Sat, 25 Jun 2016 09:20:56 -0400
Received: from chuckie.co.uk ([82.165.15.123]:44550
	helo=s16892447.onlinehome-server.info)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1bGnVz-00034V-Pn; Sat, 25 Jun 2016 09:20:51 -0400
Received: from host86-175-160-51.range86-175.btcentralplus.com
	([86.175.160.51] helo=[192.168.1.65])
	by s16892447.onlinehome-server.info with esmtpsa
	(TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1bGnVo-0002u4-V8; Sat, 25 Jun 2016 14:20:44 +0100
To: Dmitry Osipenko <digetx@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org
References: <20160625123521.16752-1-digetx@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <d626bd7a-c54e-d2c9-10a8-3d8ab572d472@ilande.co.uk>
Date: Sat, 25 Jun 2016 14:20:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <20160625123521.16752-1-digetx@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.175.160.51
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Sun, 08 Jan 2012 02:45:44 +0000)
X-SA-Exim-Scanned: Yes (on s16892447.onlinehome-server.info)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 82.165.15.123
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] hw/ptimer: Don't wrap around
 counter for expired timer that uses tick handler
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JmN4QdGLBXGC

On 25/06/16 13:35, Dmitry Osipenko wrote:

> Software should see timer counter wrap around only after IRQ being triggered.
> Change returned counter value to "1" for the expired timer and avoid returning
> wrapped around counter value in periodic mode for the timer that has bottom-half
> handler setup, assuming it drives timer IRQ.
>
> This fixes regression introduced by the commit 5a50307 ("hw/ptimer: Perform
> counter wrap around if timer already expired") on SPARC emulated machine as
> reported by Mark Cave-Ayland.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  hw/core/ptimer.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
> index 05b0c27..8006442 100644
> --- a/hw/core/ptimer.c
> +++ b/hw/core/ptimer.c
> @@ -93,10 +93,10 @@ uint64_t ptimer_get_count(ptimer_state *s)
>          bool oneshot = (s->enabled == 2);
>
>          /* Figure out the current counter value.  */
> -        if (s->period == 0 || (expired && (oneshot || use_icount))) {
> +        if (expired && (oneshot || use_icount || s->bh != NULL)) {
>              /* Prevent timer underflowing if it should already have
>                 triggered.  */
> -            counter = 0;
> +            counter = 1;
>          } else {
>              uint64_t rem;
>              uint64_t div;
> @@ -143,7 +143,9 @@ uint64_t ptimer_get_count(ptimer_state *s)
>
>              if (expired && counter != 0) {
>                  /* Wrap around periodic counter.  */
> -                counter = s->limit - (counter - 1) % s->limit;
> +                counter = s->delta = s->limit - (counter - 1) % s->limit;
> +                /* Re-arm timer according to the wrapped around value.  */
> +                ptimer_reload(s);
>              }
>          }
>      } else {
>

Hi Dmitry,

I ran through all of my OpenBIOS test images for qemu-system-sparc and 
AFAICT this fixes the issue without introducing any further regressions so:

Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


Many thanks,

Mark.

