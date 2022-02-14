Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp3980831lfk;
        Sun, 13 Feb 2022 23:34:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJysGuy3VI1ODHCsBzo9idTL4jTJNAx41hfWtzvi6/F3sPQ1eC7fWU6rWrFEXd73ymZLbxd7
X-Received: by 2002:a05:6214:5015:: with SMTP id jo21mr8514497qvb.110.1644824076234;
        Sun, 13 Feb 2022 23:34:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644824076; cv=none;
        d=google.com; s=arc-20160816;
        b=gQJhBsSary6JPKcpwYJ70nddFOtU0cQuM29AKxR2dTkVRbMWD6MSEp5kszkkEwkpgH
         zqdW8U9b89HFwXVcXLS61dDNCwML6m57I9IbjQO4pqajJkB5J0Sf3baHZfkdgqphy2A+
         GP6JaZP2s5AGJE2AXS7ICtJd3k0Ra98DT0zIcGJ1FJX0jFJnpIHWZZjE7Ocg5qwa2lnb
         1YmUWOsBcOevHQQVb4oTP8Tfx7RZNue+fIfAeFKmn/MxWgoJPPMbSGGtUIYf7v0SNwp3
         v8v5uvdWM3JGe44RcRBA9N2eEFRMuYMv59rjg6l4YAhS/gTH9A+UK1pNu2AIgrOH4r53
         X5EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=9nrLGffh7hxewJ3wf2V9945oAQyFordUk5EV6/6iuVw=;
        b=qK3QFdh5ouR3bV265q4iSNWiuTqkBneWn6FpItHFcAzqLUtG0NJ7CdkYz5uSlELBIc
         RqveU411vxP1iUy4HjWSBXvBEUUtvjLEKWb/6Uf8c6rg9CNBw0uPkPQZuAjSrZSspiX5
         FIT/CR11axv1805QlASaIr5DmojEPIlagG2GyKskYg+lPR7sK4tm38ZDU4vTL252Tj/d
         cGVG538KcOmXBlKKDn8KP2utb3///jeuFvbdo6Tw4YBUuoHimgdDNd58ZrkhXZJqljFj
         C8tVRWFK7i82ZoWU6osXSGf4qY3ojbdrUEfBgaOF9ATCNh7Zz0f4OvCbZkQz3c6UgzVJ
         X2mg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ispras.ru
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8si7376284qkn.462.2022.02.13.23.34.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 13 Feb 2022 23:34:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ispras.ru
Received: from localhost ([::1]:47928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nJVsZ-00044J-Ow
	for alex.bennee@linaro.org; Mon, 14 Feb 2022 02:34:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nJVsS-00040d-Hr; Mon, 14 Feb 2022 02:34:28 -0500
Received: from mail.ispras.ru ([83.149.199.84]:36554)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nJVsQ-0008CI-BK; Mon, 14 Feb 2022 02:34:28 -0500
Received: from [10.12.102.111] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 84F0D40755E6;
 Mon, 14 Feb 2022 07:34:15 +0000 (UTC)
Message-ID: <a59bb981-fe68-b75d-0e4c-f888e3e45fa0@ispras.ru>
Date: Mon, 14 Feb 2022 10:34:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] hw/timer: fix a9gtimer vmstate
Content-Language: en-US
To: qemu-devel@nongnu.org, qemu-arm <qemu-arm@nongnu.org>
References: <164422345976.2186660.1104517592452494510.stgit@pasha-ThinkPad-X280>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
In-Reply-To: <164422345976.2186660.1104517592452494510.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5SubnlBnjhRf

ping

On 07.02.2022 11:44, Pavel Dovgalyuk wrote:
> A9 gtimer includes global control field and number of per-cpu fields.
> But only per-cpu ones are migrated. This patch adds a subsection for
> global control field migration.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>   hw/timer/a9gtimer.c |   21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
> index 7233068a37..5e959b6d09 100644
> --- a/hw/timer/a9gtimer.c
> +++ b/hw/timer/a9gtimer.c
> @@ -318,6 +318,12 @@ static void a9_gtimer_realize(DeviceState *dev, Error **errp)
>       }
>   }
>   
> +static bool vmstate_a9_gtimer_control_needed(void *opaque)
> +{
> +    A9GTimerState *s = opaque;
> +    return s->control != 0;
> +}
> +
>   static const VMStateDescription vmstate_a9_gtimer_per_cpu = {
>       .name = "arm.cortex-a9-global-timer.percpu",
>       .version_id = 1,
> @@ -331,6 +337,17 @@ static const VMStateDescription vmstate_a9_gtimer_per_cpu = {
>       }
>   };
>   
> +static const VMStateDescription vmstate_a9_gtimer_control = {
> +    .name = "arm.cortex-a9-global-timer.control",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = vmstate_a9_gtimer_control_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(control, A9GTimerState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>   static const VMStateDescription vmstate_a9_gtimer = {
>       .name = "arm.cortex-a9-global-timer",
>       .version_id = 1,
> @@ -344,6 +361,10 @@ static const VMStateDescription vmstate_a9_gtimer = {
>                                        1, vmstate_a9_gtimer_per_cpu,
>                                        A9GTimerPerCPU),
>           VMSTATE_END_OF_LIST()
> +    },
> +    .subsections = (const VMStateDescription*[]) {
> +        &vmstate_a9_gtimer_control,
> +        NULL
>       }
>   };
>   
> 

