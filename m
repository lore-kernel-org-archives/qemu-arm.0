Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1909600njb;
        Mon, 7 Oct 2024 05:45:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVybX3djkLhj1bAdV1/eJOnsGrBjJGej7l9A9Dt/EqN6o80r1Z3pt0SxX64csSHlm6VyXfpQvq/TSwziQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF5WGuiLVkiDDo6k4jrHp3bPkAXhcHm/VindBgsR9cDL0CMTPIf5y1hDkCsr25HJ1LKKfds
X-Received: by 2002:a05:620a:198b:b0:7a9:be1b:7a41 with SMTP id af79cd13be357-7ae6fb2e9b1mr1818225985a.4.1728305126802;
        Mon, 07 Oct 2024 05:45:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728305126; cv=none;
        d=google.com; s=arc-20240605;
        b=NfhwEzuEv6mimITYJxuYILCXJYqU0pJYBNuqNFc8LCTpNH3y6ZYdb2Vfy01j1rSr1N
         NeurBbBTPqHaT0E2Hb3bRfn1kQ8ftHZc6L9wlDoenLs0AdZEw+nGvkC9PLlGyaBek2Nu
         2JfzNZPYsIjBGrG8TPqq8ptmdrwPdwoqDiUhv+aKDuz5YvHUOoagdwGayZtWh3TaVBQE
         OpFWU/VsXnfrOepu8g3gUgHdQp5lG0vLu1XZmfS+nhir35b7sphYZutwR/LknADWgTvX
         d0xj9HMTze1XFKgynMTxuNktxIyfsLbKyEuSyVZXUty2X/MHbOjEx8V5WZ4uSO3QGP6H
         pFZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=3XimklviNwoadeALIBpKZ5s2pHbdlyJaEPc4Sg0+99s=;
        fh=BHF1CV8LbB5tiY6GNVH6dWjJ27lniJhCo84Aux8rlWg=;
        b=NABeAyBsQ4Sae276C3vDMu37EUCMY85KicjmrYzcLGI6Uf2ZJBDfqaisSn/3plaE7L
         anHLWS3eQ9sy00vOOoAEpW60lRyBPWR8csxd+W0gH2dtdHHyW/SUWULDNfEy3Shz5rS9
         86bUFfgtG3zYfxb6r1Bho212I8Gg4edzqeaw6JawvJD2aXci9QI3RG1Vg5ubd47qEr2/
         EGKMbf/KhC5kh0OduZ5HS1F40BjoiTwKR+QnIfBN0PUaff4byHKuSUTaeF00FcRCs1PA
         0+sNgjWtZsdcaxXspwQ9CdB4YSC8NC1DwE5DwFY6vfQY/OEjZaRklbkRwd7TOamkkXSX
         f/7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bXk6Cw4j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae75770377si580747385a.566.2024.10.07.05.45.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2024 05:45:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bXk6Cw4j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sxn6h-0002C1-FX; Mon, 07 Oct 2024 08:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sxn6e-0002B9-PG
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 08:44:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sxn6d-0004LU-6y
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 08:44:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728305093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3XimklviNwoadeALIBpKZ5s2pHbdlyJaEPc4Sg0+99s=;
 b=bXk6Cw4jb3RqvMswn3v30O0cbsjhi/Wiw1wO27OhepXoWoLntfT6pTd4auh8lQ8i58BxnR
 mibzZ7ald5OinDFTR3tPogrZXChDnEK84MNtIK2SM+8Aqr6gB/lf43dccwJdDOx6MAbM5g
 lSLRS34p+HR74YfBgAi8kJsF/Om8Y/k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-1HYAIYL9PEG9dqkAw9vJpg-1; Mon, 07 Oct 2024 08:44:52 -0400
X-MC-Unique: 1HYAIYL9PEG9dqkAw9vJpg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42cb22d396cso39348055e9.0
 for <qemu-arm@nongnu.org>; Mon, 07 Oct 2024 05:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728305091; x=1728909891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3XimklviNwoadeALIBpKZ5s2pHbdlyJaEPc4Sg0+99s=;
 b=TUFpwaKPDYgnPaH5MFVv7FsiFqGFb066+H/yDWUyhnn9fhipw4wSDHk5jREr2yzKdv
 R66J+dBGO/jcDMQbq+axJPENzzoijUbR4EcArHall+Jz77+syjpiJXxRAugh61CDsgw9
 EDOdjpfLbD9bnXTg4qb1iUn7RuQjD3XQo42oeA4tk2zTaQIxmpL4vAWHX+FwvkjQ1XnP
 K8ET0x0+SfoeuXCuo307pp9T3w69KHh3UFu8jW0KlEBU6S+jwYlHWctNczByOZcvkVJ2
 DeRn7p6TwpRn9Sj9jUCqNlxJMX3Q8G9BJvg6bM4zWfcIZvnYypJePZ0SUeTF7xcwEE/i
 Wfag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL6xXYPcIJQSF39pxxtx3puFxy9YwGh5yedUYSLf/GmxAifJI5L0+OBOVo6UB1F+E3lox+6dshrg==@nongnu.org
X-Gm-Message-State: AOJu0YxqKeAxwgfCRMSoU4wW160DUCi2BP215XA+0Ggi2vs6H4gLLoLv
 P42CSj1jDVAXrETxuum5dlHJzrZ+hWEhJLM/N3+IR9CGO914+pKgwQ3+riLEc+LXwO5XWKJDF2j
 zY97+v8oiaSI530Us1/oW6+ao6M1bPEMgHvlm5DOr+85lIVYLTQ==
X-Received: by 2002:a7b:c44c:0:b0:42f:6878:a68d with SMTP id
 5b1f17b1804b1-42f8664f3c4mr77076375e9.20.1728305091509; 
 Mon, 07 Oct 2024 05:44:51 -0700 (PDT)
X-Received: by 2002:a7b:c44c:0:b0:42f:6878:a68d with SMTP id
 5b1f17b1804b1-42f8664f3c4mr77075975e9.20.1728305091050; 
 Mon, 07 Oct 2024 05:44:51 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f86a20471sm91063045e9.17.2024.10.07.05.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 05:44:50 -0700 (PDT)
Date: Mon, 7 Oct 2024 14:44:49 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Annie Li <annie.li@oracle.com>
Cc: miguel.luis@oracle.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 dave@treblig.org, mst@redhat.com, anisinha@redhat.com,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 zhao1.liu@intel.com, pbonzini@redhat.com, richard.henderson@linaro.org,
 eblake@redhat.com, armbru@redhat.com
Subject: Re: [RFC V2 PATCH 01/11] acpi: hmp/qmp: Add hmp/qmp support for
 system_sleep
Message-ID: <20241007144449.457d304f@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240927183906.1248-2-annie.li@oracle.com>
References: <20240927183906.1248-1-annie.li@oracle.com>
 <20240927183906.1248-2-annie.li@oracle.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.153,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ymwoRAmzqz0i

On Fri, 27 Sep 2024 14:38:56 -0400
Annie Li <annie.li@oracle.com> wrote:

> Followng hmp/qmp commands are implemented for pressing virtual
> sleep button,
> 
> hmp: system_sleep
> qmp: { "execute": "system_sleep" }
> 
> These commands put the guest into suspend or other power states
> depending on the power settings inside the guest.
> 
> Signed-off-by: Annie Li <annie.li@oracle.com>
> ---
>  hmp-commands.hx            | 14 ++++++++++++++
>  hw/core/machine-hmp-cmds.c |  5 +++++
>  hw/core/machine-qmp-cmds.c |  9 +++++++++
>  include/monitor/hmp.h      |  1 +
>  qapi/machine.json          | 18 ++++++++++++++++++
>  qapi/pragma.json           |  1 +
>  6 files changed, 48 insertions(+)
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 06746f0afc..4c149f403f 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -639,6 +639,20 @@ SRST
>    whether profiling is on or off.
>  ERST
>  
> +    {
> +        .name       = "system_sleep",
> +        .args_type  = "",
> +        .params     = "",
> +        .help       = "send ACPI sleep event",
> +        .cmd = hmp_system_sleep,
> +    },
> +
> +SRST
> +``system_sleep``
> +  Push the virtual sleep button; if supported the system will enter
> +  an ACPI sleep state.

perhaps comma after 'if supported'


> +ERST
> +
>      {
>          .name       = "system_reset",
>          .args_type  = "",
> diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
> index 8701f00cc7..3ee529d8d5 100644
> --- a/hw/core/machine-hmp-cmds.c
> +++ b/hw/core/machine-hmp-cmds.c
> @@ -189,6 +189,11 @@ void hmp_system_reset(Monitor *mon, const QDict *qdict)
>      qmp_system_reset(NULL);
>  }
>  
> +void hmp_system_sleep(Monitor *mon, const QDict *qdict)
> +{
> +    qmp_system_sleep(NULL);
> +}
> +
>  void hmp_system_powerdown(Monitor *mon, const QDict *qdict)
>  {
>      qmp_system_powerdown(NULL);
> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> index 130217da8f..770f8189ba 100644
> --- a/hw/core/machine-qmp-cmds.c
> +++ b/hw/core/machine-qmp-cmds.c
> @@ -276,6 +276,15 @@ void qmp_system_reset(Error **errp)
>      qemu_system_reset_request(SHUTDOWN_CAUSE_HOST_QMP_SYSTEM_RESET);
>  }
>  
> +void qmp_system_sleep(Error **errp)
> +{
> +    if (!qemu_wakeup_suspend_enabled()) {
> +        error_setg(errp,
> +                   "suspend from running is not supported by this guest");

it's machine and not the guest that doesn't support, isn't it?

> +        return;
> +    }

I'd reorder this after 6/11, to avoid adding function that does nothing
and then explaining why it is done this way.

> +}
> +
>  void qmp_system_powerdown(Error **errp)
>  {
>      qemu_system_powerdown_request();
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index ae116d9804..e543eec109 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -43,6 +43,7 @@ void hmp_quit(Monitor *mon, const QDict *qdict);
>  void hmp_stop(Monitor *mon, const QDict *qdict);
>  void hmp_sync_profile(Monitor *mon, const QDict *qdict);
>  void hmp_system_reset(Monitor *mon, const QDict *qdict);
> +void hmp_system_sleep(Monitor *mon, const QDict *qdict);
>  void hmp_system_powerdown(Monitor *mon, const QDict *qdict);
>  void hmp_exit_preconfig(Monitor *mon, const QDict *qdict);
>  void hmp_announce_self(Monitor *mon, const QDict *qdict);
> diff --git a/qapi/machine.json b/qapi/machine.json
> index d4317435e7..b32d231aa9 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -362,6 +362,24 @@
>  ##
>  { 'command': 'system_reset' }
>  
> +##
> +# @system_sleep:
> +#
> +# Requests that a guest perform a ACPI sleep transition by pushing a virtual
> +# sleep button.
> +#
> +# .. note:: A guest may or may not respond to this command. This command
> +#        returning does not indicate that a guest has accepted the request
> +#        or that it has gone to sleep.
> +#
> +# .. qmp-example::
> +#
> +# -> { "execute": "system_sleep" }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'system_sleep' }
> +
>  ##
>  # @system_powerdown:
>  #
> diff --git a/qapi/pragma.json b/qapi/pragma.json
> index 59fbe74b8c..e2c5dcb829 100644
> --- a/qapi/pragma.json
> +++ b/qapi/pragma.json
> @@ -23,6 +23,7 @@
>          'set_password',
>          'system_powerdown',
>          'system_reset',
> +        'system_sleep',
>          'system_wakeup' ],
>      # Commands allowed to return a non-dictionary
>      'command-returns-exceptions': [

