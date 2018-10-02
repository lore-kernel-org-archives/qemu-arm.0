Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5598728wrt;
        Tue, 2 Oct 2018 15:43:06 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61BoygdsbV/1H70d/6HPqpbrrqrPc8wq9zP1xeqFZRT/oXKf/HEN90n2eyfugC9ehZdvoyf
X-Received: by 2002:a0c:e60e:: with SMTP id z14-v6mr9064779qvm.6.1538520186306;
        Tue, 02 Oct 2018 15:43:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538520186; cv=none;
        d=google.com; s=arc-20160816;
        b=MJX6w1DRV+4/heJPPz3OXKscyYMKrVzh8/ILhSJomI0J3BKpF6/7ucBBCV9qwAliqS
         fZL9DCjk40umjtDjI+oXS98hCC9W0D+rjlzV5wWx+C9XTxTVUpIglZeBgppGVJuJV6xu
         Iq+lO8/UZS1R/cWaN9AvcclUGJbVs2Wpbmjhh/Tzi4JAVIjtEgupA/HC7uOqPVNeNDfn
         JWacqegWGq+PdVjxQj6oLc0sy003xUd0kMd9a3AC0FIcv2bIyJuUGO8Wx7tjNXNfdBsS
         Dd+rDn/R/G9SGDYCpYtPqPbIL5zFOzz8SOivkJks9LAKZnSdCEcI76Uyynmh7bHoCfjy
         1vEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=iogEeSsSMZmoqlYwZGephI0Z9vp1q85LhZ/lYErX2o0=;
        b=eva+g1T4Q7fsTfM1jZDZCLI0jsYZzIpX/754PDmMU5H8lK78oXggPuY++jmQ19esAa
         1HSh/Lj/V0vDcEFSfLFw07259hI612TKENRk+oJQYjYdvGs6wffHxXkGID8BVtmKD/P7
         iIhuJxbqpjO0gNH6KzuB2nXqF9/9WgH9tTUrwhxUZ/V6XtjjWWi7hroZa/mb/jC8Li1/
         lWgQo6Mnnu9lHU1clmxNlH222IH/0GbiYg2lOv1i8BjZU0FTB1de5WpAT1nzMgUIwuV9
         GdSogZAaKbalXdlECooBlEjVDakv6J7/Kmef7jkQi4farMTIh+7vlThVZ0Fy0ZUw+kGq
         oe5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t2-v6si4264414qth.214.2018.10.02.15.43.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 15:43:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45972 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7TNh-0000nF-5g
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 18:43:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33050)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7TNG-0000n4-Bm
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 18:42:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7TNC-00022f-8c
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 18:42:38 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48]:40915)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g7TNC-00022D-0I
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 18:42:34 -0400
Received: by mail-wr1-f48.google.com with SMTP id y8-v6so3969307wrh.7
	for <qemu-devel@nongnu.org>; Tue, 02 Oct 2018 15:42:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=iogEeSsSMZmoqlYwZGephI0Z9vp1q85LhZ/lYErX2o0=;
	b=PeGlxkvQg2yYeDuMp8dtxyipR7kiOKxsBL1wKTln4UFzpns8qBt3HO2XY+fUH+Zm55
	tfHeIYk/QvuTA3vZJEKQd9lXsVyFLbylZ7MpiHoSIT5VwMwICfq0Ql1naEeyhD4h6sHm
	YgJp6EG47hBaRFsaf2244EC0vHwVykIWG9h4vP506gUhedG32nQDUtgLROnn78LDZatI
	iECwii29y8p8gmGtXq6pYrcMz153/QXRUNq6nnTROvYncDncpPrVJafGEzi2dY6cD2vu
	d5CTql7XXDmCbkt9h7QGMLGQO/Fyx2GTaJ9MgXmX2YMHFN25ROZnuBLaIcjbBbJlmuNd
	gR4g==
X-Gm-Message-State: ABuFfogwKmQKUwM4m7M60NTF9PG/jCmeTwjQN98R1Icsrr2WfMPRXqsp
	tk9d2YVIXz7PWpAIYjG7XkSvaQ==
X-Received: by 2002:adf:9483:: with SMTP id 3-v6mr11091025wrr.98.1538520152908;
	Tue, 02 Oct 2018 15:42:32 -0700 (PDT)
Received: from [192.168.2.51] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	u4-v6sm11899021wro.47.2018.10.02.15.42.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Oct 2018 15:42:32 -0700 (PDT)
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20181002142443.30976-1-damien.hedde@greensocs.com>
	<20181002142443.30976-4-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2478a2c0-7f5f-556c-09c3-1fa503984f38@redhat.com>
Date: Wed, 3 Oct 2018 00:42:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002142443.30976-4-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.48
Subject: Re: [Qemu-devel] [PATCH v5 3/9] qdev-monitor: print the device's
 clock with info qtree
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, konrad@adacore.com,
	luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HG2F7vWPJcxG

Hi Damien,

On 10/2/18 4:24 PM, Damien Hedde wrote:
> This prints the clocks attached to a DeviceState when using "info qtree" monitor
> command. For every clock, it displays the direction, the name and if the
> clock is forwarded. For input clock, it displays also the frequency.

What would also be really useful (during development mostly)
is a "info clktree" monitor command.

> 
> This is based on the original work of Frederic Konrad.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  qdev-monitor.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/qdev-monitor.c b/qdev-monitor.c
> index 61e0300991..8c39a3a65b 100644
> --- a/qdev-monitor.c
> +++ b/qdev-monitor.c
> @@ -682,6 +682,7 @@ static void qdev_print(Monitor *mon, DeviceState *dev, int indent)
>      ObjectClass *class;
>      BusState *child;
>      NamedGPIOList *ngl;
> +    NamedClockList *clk;
>  
>      qdev_printf("dev: %s, id \"%s\"\n", object_get_typename(OBJECT(dev)),
>                  dev->id ? dev->id : "");
> @@ -696,6 +697,17 @@ static void qdev_print(Monitor *mon, DeviceState *dev, int indent)
>                          ngl->num_out);
>          }
>      }
> +    QLIST_FOREACH(clk, &dev->clocks, node) {
> +        if (clk->out) {
> +            qdev_printf("clock-out%s \"%s\"\n",
> +                        clk->forward ? " (fw)" : "",
> +                        clk->name);
> +        } else {
> +            qdev_printf("clock-in%s \"%s\" freq=%" PRIu64 "Hz\n",

IMHO 'freq_hz=%" PRIu64 "\n"' is easier to read.

However if we plan to add/use a qemu_strtohz() similar to
qemu_strtosz_metric(), that would be fine.

> +                        clk->forward ? " (fw)" : "",
> +                        clk->name, clock_get_frequency(clk->in));
> +        }
> +    }
>      class = object_get_class(OBJECT(dev));
>      do {
>          qdev_print_props(mon, dev, DEVICE_CLASS(class)->props, indent);
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
