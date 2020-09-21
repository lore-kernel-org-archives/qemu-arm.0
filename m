Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4263178lfq;
        Mon, 21 Sep 2020 12:57:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmwU6ly1gv68lTLgfHLub+320KX0p52o5+rzQAZx3jheFLvqY02B+9KixZUP+71EahY56d
X-Received: by 2002:a25:7154:: with SMTP id m81mr1743809ybc.155.1600718258998;
        Mon, 21 Sep 2020 12:57:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600718258; cv=none;
        d=google.com; s=arc-20160816;
        b=cRP1orxSGNcnbpRtRnFTLxqS58pCov4bZbrdyiDrZJoXKFAlZCKJoWK9DcjNOSyAAl
         TPv3AxArN3JB+LrrCMoFRzfzo6FGeHtNwF5SajUWbB97pD9wWJatqyMq1yoobTSof5UL
         cvuGkcuvJY7Olb25vNFLnIwbBWZ9YJsFEACpu1GXhqMQAp3z9kWBCoC8JhI0pALEgj4N
         R7LufWqoDNhqgSuWErIRh1Wn4TN+ifoLoAs4oLjKl3jqi5GXLcGM+vU+wLblJBs4O1vk
         fkvaIdJ3d/BF7GTsgCF+NaZrfWFDxz1WhBbcYRWKbAWGREqoaSQu3XZ6VpVgk9/8MY6v
         ogHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=+XVbwrUEvUKZdJ79HWuQzHiiHHBy19dq2igKd7smsJo=;
        b=RHiGkLzGaZwSTFugnm61VoWLuMZQGtjEfcd5aoN8O67Ak/6Ub1KYzCEiLe5VHz2vkC
         l+xjAN4Blu3Ue3/I0dk4xxm/3Arhzp9n0JMwMuZt0YIxXskSn4DBxP2xmEux0/Glsvte
         etv4zmriQ87DRpLKJ65yN0Ftde5b/MVvpsEOo2DR7Kq55+5v7IH5Q/R0GB1rkn4rM1t3
         vdErIvmO8/aX7v2WzHVvaxFH9QEQrQv1ypwMSCkEuSsICiyEV7OgCu/lCYmFOXjWBY5J
         6xIa85Ambg2hJgurEQ9y3TuH6g+YAdDcjxs/N24ASaS967Jh+10zzYHtQpgww6gQexK2
         F7Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=vDmsE2gZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d68si2513638ybh.286.2020.09.21.12.57.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Sep 2020 12:57:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=vDmsE2gZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kKRwP-0001jv-Jw
	for alex.bennee@linaro.org; Mon, 21 Sep 2020 15:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kKRt7-000801-Fn; Mon, 21 Sep 2020 15:54:13 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:41298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kKRt5-0001JH-QC; Mon, 21 Sep 2020 15:54:13 -0400
Received: from [172.17.10.14] (unknown [172.17.10.14])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 7710221CC5;
 Mon, 21 Sep 2020 19:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1600718049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+XVbwrUEvUKZdJ79HWuQzHiiHHBy19dq2igKd7smsJo=;
 b=vDmsE2gZofSdG4pQk4hYS7h8nf5XTSO27W3JyoHmaLqFMAOPWtXoUk2PxPjsd+3Qu9zpvy
 Y68/5ZVPbGjFEmzARygyaHmGPVRGAK8BUfK3mKSBeb/1K1QBr147ZLvJDc36PLDva0PcGr
 3xgUtvi19737+OUYzKzzezBZCpl042c=
Subject: Re: [PATCH v3 2/8] hw/arm/raspi: Load the firmware on the first core
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200921075628.466506-1-f4bug@amsat.org>
 <20200921075628.466506-3-f4bug@amsat.org>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <7aaea771-0dae-6bac-c1c0-2325e035f484@greensocs.com>
Date: Mon, 21 Sep 2020 21:55:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200921075628.466506-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 15:38:48
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lCDlMtGu9rmn

On 9/21/20 9:56 AM, Philippe Mathieu-Daudé wrote:
> The 'first_cpu' is more a QEMU accelerator-related concept
> than a variable the machine requires to use.
> Since the machine is aware of its CPUs, directly use the
> first one to load the firmware.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>   hw/arm/raspi.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 46d9ed7f054..8716a80a75e 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -205,6 +205,7 @@ static void reset_secondary(ARMCPU *cpu, const struct arm_boot_info *info)
>   
>   static void setup_boot(MachineState *machine, int version, size_t ram_size)
>   {
> +    RaspiMachineState *s = RASPI_MACHINE(machine);
>       static struct arm_boot_info binfo;
>       int r;
>   
> @@ -253,7 +254,7 @@ static void setup_boot(MachineState *machine, int version, size_t ram_size)
>           binfo.firmware_loaded = true;
>       }
>   
> -    arm_load_kernel(ARM_CPU(first_cpu), machine, &binfo);
> +    arm_load_kernel(&s->soc.cpu[0].core, machine, &binfo);
>   }
>   
>   static void raspi_machine_init(MachineState *machine)
> 
