Received: by 10.25.21.96 with SMTP id l93csp1607183lfi;
        Mon, 20 Jun 2016 12:51:18 -0700 (PDT)
X-Received: by 10.194.107.10 with SMTP id gy10mr15744011wjb.14.1466452278242;
        Mon, 20 Jun 2016 12:51:18 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id uk8si31354038wjb.66.2016.06.20.12.51.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Jun 2016 12:51:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46082 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bF5E5-0004aP-0X
	for alex.bennee@linaro.org; Mon, 20 Jun 2016 15:51:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35187)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bF5E0-0004Wg-Cl
	for qemu-arm@nongnu.org; Mon, 20 Jun 2016 15:51:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bF5Dw-0006O3-7Z
	for qemu-arm@nongnu.org; Mon, 20 Jun 2016 15:51:11 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:34456)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bF5Dv-0006Nx-Th; Mon, 20 Jun 2016 15:51:08 -0400
Received: by mail-lf0-x241.google.com with SMTP id l184so6428484lfl.1;
	Mon, 20 Jun 2016 12:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:to:references:cc:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=AJO8TYKmGcI2VrYVg41oyFVzCQ52ph+Ata11fY9vIKE=;
	b=b4sNoZbk07Ls00CwXvElygTa3/HbHu91WONvuArR+qzxtHtRDu7DlkhkluuQFNVfsV
	PuN7kaRwVV+iZadHtAGN+btAO2jZznEGsAITxIviTYfcJ1xTOJoibC6EVz9kPHb7fDcS
	HBq0K4mJ3Fa6VUans4Y+chHfzo0r04Hfkknlzj2cWyt9ITB1ImvB/BkY8f0FPcMcE5R+
	N2/Yh1igybpvdCFXrHSRn6zU68RgSGJ+4dfiaqS/O/awFAzBO1xQO+gtMSVRrNE2T0ET
	sE0Hn4SGKF/Y2deQ2w1e345gZ2Nz60eoedWaMjSk7ncJI2UHa1SZyNqhJqVAiK79LNOu
	uGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:subject:to:references:cc:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=AJO8TYKmGcI2VrYVg41oyFVzCQ52ph+Ata11fY9vIKE=;
	b=biEjZNA9wSNPRpEhAzJLqOanpobSfmD0JC35+kK+YCrAS62xz5Pp810P0jh6EOOgT8
	KCm76vz1RQ6s324BrzpO1VAgivVo96/x4gBMp5efa/bN48At5COVZ8Ard/pj8VyX2rV8
	ybGCewWhrRkKr7Fh+IgkB5bT7dzXgQlUs8wd6sS7ZTlNvwLqq+5rRjJUBd4EWcSJeAdY
	wrXth2qNgt7rlD5PANXtPWclF4w1ntWRm9FvkCJHjsQnoa5JRjM1RTV9pxZYRIY9sT9Q
	Eo6Xqy8yw6jlXixjzfrFlH5GIDazoFicdEj0qpeMKhsPL0+W1bWV9JwOD7PMEB+b7qyU
	qUDQ==
X-Gm-Message-State: ALyK8tJ2BQfRVtMCTJoOPM9QTgfQbTkut5SdVf0LGEohWTen3W9PpFtLTQXVoc9HOvpm8Q==
X-Received: by 10.25.88.146 with SMTP id m140mr1794866lfb.217.1466452266399;
	Mon, 20 Jun 2016 12:51:06 -0700 (PDT)
Received: from [192.168.1.145] (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30]) by smtp.googlemail.com with ESMTPSA id
	134sm5577894ljj.48.2016.06.20.12.51.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Jun 2016 12:51:05 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org
References: <cover.1466167530.git.digetx@gmail.com>
	<bf8a11d66b68c0d0738428bf6dd18d1a532b3eb3.1466167530.git.digetx@gmail.com>
Message-ID: <0d9c8874-9a16-8521-ed24-e1ec14134544@gmail.com>
Date: Mon, 20 Jun 2016 22:51:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <bf8a11d66b68c0d0738428bf6dd18d1a532b3eb3.1466167530.git.digetx@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-arm] [PATCH v14 2/3] hw/ptimer: Fix counter - 1 returned
 by ptimer_get_count for the active timer
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
X-TUID: 5PHzlKcoc+hZ

I started to port MPTimer tests to QTest that allows precise VM clock control. 
It helped to find out that the last period of the periodic timer is getting 
lost, i.e. when counter = 0 (before wrap around). So the counter should be 
loaded with limit + 1 after wrapping around. This worked before because we are 
returning counter = 0 for the expired timer, that expiration doesn't happen 
under QTest and some of the tests fail. I'll send new revision of the patch 
after receiving feedback to the "policy" patch and once QTests would be ready.

On 17.06.2016 16:17, Dmitry Osipenko wrote:
> Due to rounding down performed by ptimer_get_count, it returns counter - 1 for
> the active timer. That's incorrect because counter should decrement only after
> period been expired, not before. I.e. if running timer has been loaded with
> value X, then timer counter should stay with X until period expired and
> decrement after. Fix this by adding 1 to the counter value for the active and
> unexpired timer.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  hw/core/ptimer.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
> index 289e23e..7f89001 100644
> --- a/hw/core/ptimer.c
> +++ b/hw/core/ptimer.c
> @@ -89,10 +89,10 @@ static void ptimer_tick(void *opaque)
>
>  uint64_t ptimer_get_count(ptimer_state *s)
>  {
> +    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>      uint64_t counter;
>
> -    if (s->enabled && s->delta != 0) {
> -        int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    if (s->enabled && s->delta != 0 && now != s->last_event) {
>          int64_t next = s->next_event;
>          bool expired = (now - next >= 0);
>          bool oneshot = (s->enabled == 2);
> @@ -144,7 +144,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
>                  if ((uint32_t)(period_frac << shift))
>                      div += 1;
>              }
> -            counter = rem / div;
> +            counter = rem / div + (expired ? 0 : 1);
>
>              if (expired && counter != 0) {
>                  /* Wrap around periodic counter.  */
>


-- 
Dmitry
