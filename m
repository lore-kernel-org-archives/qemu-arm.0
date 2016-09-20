Received: by 10.80.163.71 with SMTP id 65csp1137955edn;
        Tue, 20 Sep 2016 10:28:30 -0700 (PDT)
X-Received: by 10.237.36.33 with SMTP id r30mr29548559qtc.99.1474392510646;
        Tue, 20 Sep 2016 10:28:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v186si24871433qkb.278.2016.09.20.10.28.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Sep 2016 10:28:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36935 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bmOqM-0000mp-0A
	for alex.bennee@linaro.org; Tue, 20 Sep 2016 13:28:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48236)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bmOkR-00049i-Cf
	for qemu-arm@nongnu.org; Tue, 20 Sep 2016 13:22:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bmOkP-0004H9-5Z
	for qemu-arm@nongnu.org; Tue, 20 Sep 2016 13:22:22 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:35665)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bmOkP-0004Gv-1t
	for qemu-arm@nongnu.org; Tue, 20 Sep 2016 13:22:21 -0400
Received: by mail-vk0-x22c.google.com with SMTP id g9so34897203vkg.2
	for <qemu-arm@nongnu.org>; Tue, 20 Sep 2016 10:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7LW3c6NBFkh8J4aU4MPJBPRhVjcXEASp/Ft59Xz7lbo=;
	b=h4NcwoexxJ+kZKlRY4SPuZTRf2tj2GBLVaePFpAuyrirtJUiyd9OBfAsD51KP2xapa
	9PLPQkiMeONSaAoIU9/dBHZ8VaniRoqeOUPFIe69CKOWDmHoP1gRo1vb5R0XyStcZi/h
	geDalgstUb9hXtucbRagGoxyBvXJkKsmap+tI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7LW3c6NBFkh8J4aU4MPJBPRhVjcXEASp/Ft59Xz7lbo=;
	b=LAPqdrcGRfUDUD+/eghWHDAKCD7KqF8DwzaFJ/aQETJTGy1LY0JvrD+scnb+ifJkfF
	9AIIT0X7TeuH9W1ALfVzzsuWdFDqgQnJ7/NrcwUgH3XERg31ltM2Az0WWkiSpUeuIv4F
	6OOpvywCpGp/XnyEF4Ulg2G3mxxclPezxCte04upy/yxuVEPZBySE7726i+MSGprU/nw
	YDHLHvsjUnzpMHYrsTVwdY180YjlfHtROvw94yPv8d+qR6PZwpZCp2wXPfCvTv3WKTUD
	rt58zWhCzUBER0D4qruNa4m6PX/9FYrZc3+V8xydLW8J5UwFPpGokyKhzNUPldou+xi5
	yYiQ==
X-Gm-Message-State: AE9vXwMyo62XPMQpNKdOAhF+WYibT//dXRjdAbXF6+g99hmsAfTtGWrglsNh2K85AnGpGfXyRCEzhDHXRYC4U6bS
X-Received: by 10.31.81.2 with SMTP id f2mr5218782vkb.165.1474392136162; Tue,
	20 Sep 2016 10:22:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Tue, 20 Sep 2016 10:21:55 -0700 (PDT)
In-Reply-To: <b485e92cac7725a75f7de9ca6b458ffa4082e099.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
	<b485e92cac7725a75f7de9ca6b458ffa4082e099.1473252818.git.digetx@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2016 18:21:55 +0100
Message-ID: <CAFEAcA_QoFRgBvHTJzpVERJ2y_EiT=w483ep5atbe604U2WByQ@mail.gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Subject: Re: [Qemu-arm] [PATCH v16 07/16] hw/ptimer: Add "continuous
 trigger" policy
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JX9zWkKulsIO

On 7 September 2016 at 14:22, Dmitry Osipenko <digetx@gmail.com> wrote:
> Currently, periodic timer that has load = delta = 0 performs trigger
> on timer reload and stops, printing a "period zero" error message.
> Introduce new policy that makes periodic timer to continuously trigger
> with a period interval in case of load = 0.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  hw/core/ptimer.c    | 18 +++++++++++++++++-
>  include/hw/ptimer.h |  4 ++++
>  2 files changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
> index e9b2e15..97ce8ae 100644
> --- a/hw/core/ptimer.c
> +++ b/hw/core/ptimer.c
> @@ -45,7 +45,8 @@ static void ptimer_reload(ptimer_state *s, int delta_adjust)
>          ptimer_trigger(s);
>          delta = s->delta = s->limit;
>      }
> -    if (delta == 0 || s->period == 0) {
> +
> +    if (s->period == 0) {
>          if (!qtest_enabled()) {
>              fprintf(stderr, "Timer with period zero, disabling\n");
>          }
> @@ -58,6 +59,21 @@ static void ptimer_reload(ptimer_state *s, int delta_adjust)
>          delta += delta_adjust;
>      }
>
> +    if (delta == 0 && (s->policy_mask & PTIMER_POLICY_CONTINUOUS_TRIGGER)) {
> +        if (s->enabled == 1) {
> +            delta = 1;
> +        }
> +    }
> +
> +    if (delta == 0) {
> +        if (!qtest_enabled()) {
> +            fprintf(stderr, "Timer with delta zero, disabling\n");
> +        }
> +        timer_del(s->timer);
> +        s->enabled = 0;
> +        return;
> +    }
> +

Again, this looks like it's affecting behaviour even when the
policy flag isn't set.

thanks
-- PMM
