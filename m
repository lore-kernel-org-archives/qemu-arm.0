Received: by 10.25.208.211 with SMTP id h202csp1081703lfg;
        Mon, 22 Feb 2016 01:25:50 -0800 (PST)
X-Received: by 10.140.28.162 with SMTP id 31mr32761822qgz.81.1456133149950;
        Mon, 22 Feb 2016 01:25:49 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o101si17819396qge.95.2016.02.22.01.25.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Feb 2016 01:25:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:47979 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXmkX-0006po-BG
	for alex.bennee@linaro.org; Mon, 22 Feb 2016 04:25:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52034)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aXmjz-0006QY-9D
	for qemu-devel@nongnu.org; Mon, 22 Feb 2016 04:25:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aXmjy-0008EQ-C9
	for qemu-devel@nongnu.org; Mon, 22 Feb 2016 04:25:15 -0500
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:34616)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aXmjx-0008EL-To
	for qemu-devel@nongnu.org; Mon, 22 Feb 2016 04:25:14 -0500
Received: by mail-vk0-x236.google.com with SMTP id e185so123883321vkb.1
	for <qemu-devel@nongnu.org>; Mon, 22 Feb 2016 01:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=NSo/eSnQDML0An6SM81VKXgE/Hdm8LOIIPQXfC5v8pA=;
	b=PXxtxsYUY27elzGOjdu2VxOMKzT3VV4n/FNt23Yg5Sb0x2mG/Cn4z6lGOugU2LpUnL
	PyUHbwvumhxLn6fwODgbUlzo9HknrNOXQomCRel0EUHRP9QSLGCXDYRpN4cdJRMVBcBN
	wryi0wsHmiMJH0ZB9jWroypqp/dBth8tDeTPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=NSo/eSnQDML0An6SM81VKXgE/Hdm8LOIIPQXfC5v8pA=;
	b=YvodaCyZpTH1fP+c8iUTtY5Grd8K3U90BKdSAG4OvrD5YvAOFY59O/NBMzZ1hWqkOy
	ycyJ/GK+UC/Yxcvll9uWtvfOkUqIxLdeYiJ0TN0S0dstKDggltxF7ZKZH1PXvghBFMQf
	HKwZg+W5+tGuO68TWAX00mw1I3EvaRwVAK6WelpYVzvMzicfuaiCv933YIJXMefE59RT
	Zhf+bqPXRevPhtkaWFXyo6wrLC2SJ1LgWJIEh8jhjbmoX0Xwfsshf9LQzAhPQGUDzzn6
	Iof3GL3oRCRd2PDm5FIBNFEPndu6UjQJ6NoC4JZkY3j9t81o9MqtRpr4alAxFwsWooM7
	iizw==
X-Gm-Message-State: AG10YOTeQ0GP45cQdxoK+vQlvvfmX+eE11bamsW09wGOtE3rfwt0VHszUcGGYOOmy20N3cQ0eIhTlisKX9UlEYm3
X-Received: by 10.31.47.207 with SMTP id v198mr22527376vkv.6.1456133113495;
	Mon, 22 Feb 2016 01:25:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Mon, 22 Feb 2016 01:24:54 -0800 (PST)
In-Reply-To: <1456132310-4826-1-git-send-email-zxq_yx_007@163.com>
References: <1456132310-4826-1-git-send-email-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Feb 2016 09:24:54 +0000
Message-ID: <CAFEAcA-sDDj=kKmQnru0nfrjuHSjD8KDzO-PWGd0ia3GMZrEdg@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-devel] [PATCH v4 5/9] hw/timer: QOM'ify m48txx_sysbus
	(pass 2)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YLuuB/iuUecQ

On 22 February 2016 at 09:11, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> assign DeviceClass::vmsd instead of using vmstate_register function
>
> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
> ---
>  hw/timer/m48t59.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/timer/m48t59.c b/hw/timer/m48t59.c
> index 3c683aa..b0cf79d 100644
> --- a/hw/timer/m48t59.c
> +++ b/hw/timer/m48t59.c
> @@ -742,8 +742,6 @@ static void m48t59_realize_common(M48t59State *s, Error **errp)
>          s->wd_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &watchdog_cb, s);
>      }
>      qemu_get_timedate(&s->alarm, 0);
> -
> -    vmstate_register(NULL, -1, &vmstate_m48t59, s);
>  }
>
>  static void m48t59_isa_realize(DeviceState *dev, Error **errp)
> @@ -822,6 +820,7 @@ static void m48txx_isa_class_init(ObjectClass *klass, void *data)
>      dc->realize = m48t59_isa_realize;
>      dc->reset = m48t59_reset_isa;
>      dc->props = m48t59_isa_properties;
> +    dc->vmsd = &vmstate_m48t59;
>      nc->read = m48txx_isa_read;
>      nc->write = m48txx_isa_write;
>      nc->toggle_lock = m48txx_isa_toggle_lock;
> @@ -866,6 +865,7 @@ static void m48txx_sysbus_class_init(ObjectClass *klass, void *data)
>      dc->realize = m48t59_realize;
>      dc->reset = m48t59_reset_sysbus;
>      dc->props = m48t59_sysbus_properties;
> +    dc->vmsd = &vmstate_m48t59;
>      nc->read = m48txx_sysbus_read;
>      nc->write = m48txx_sysbus_write;
>      nc->toggle_lock = m48txx_sysbus_toggle_lock;
> --
> 2.1.4
>

Just noticed this won't work as it is -- the vmstate
struct is for the M48t59State*, but the ISA and
Sysbus wrappers have their own structs which are
what the dc->vmsd will be wanting to operate on.
You'd need extra VMState structs I think and
somebody who knows migration better than me to say
whether that is a migration compat break.

thanks
-- PMM
