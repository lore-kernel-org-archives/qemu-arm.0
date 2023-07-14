Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp3989751eje;
        Fri, 14 Jul 2023 05:07:35 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH+A7FOiLeS/SLCOAWZj02+ojodRwckaikFOpkn7cL5JSNIUVmvIpYeuQY4PeUYDrOHmJQX
X-Received: by 2002:a05:620a:408d:b0:767:7980:157 with SMTP id f13-20020a05620a408d00b0076779800157mr5158396qko.51.1689336455691;
        Fri, 14 Jul 2023 05:07:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689336455; cv=none;
        d=google.com; s=arc-20160816;
        b=SZ6GtpT6QvzITtzYR5DYuNMsQi3qtADFHnbA6sq9VhoqSqvQJkC+E3raZLZdoO4ssn
         HvBoeHEjDUiTg4zZxpQ1kYIWFpS3TyvJ8CyyBDudTTuOGBO0ytLvQ7zqItqy8XuMb4iT
         h0CZ5N4+c6T/UMJeOMbMpPOCAY7ebFcB4bGp1y576PwVAK38X+qtr8/v0KEFGYH1cZ92
         xBik/C9DYChIp7pQUSMl53h05C9EIYCC8m55yYJZEf25FJ1MmDnlSVpo2lP9DaQJ00VC
         6yS5oLuGe9lRgaAD7Cm/DKAH7+oPfKL3Ea991MxouMaMIrCB2S5YJwtTYEMk2wts2fJX
         ObYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=jFPRECPM+9/54Lqgnq2iiR5SNRM+ew6AleNkCJt9HZA=;
        fh=c8vW5PCkaRf214jXm9EDxrstE644+gnpXCzouEc1OdI=;
        b=dGe8p76RMZ2sWKWTbldqZKKCYzOAUuFJfu/wcr6TGmdiKsiVwXRRGobHCFY2HuTi6e
         HXN2qmBwySjdoGLFuFWJs59KsBfNBlyrmRcNtHYi29itlHJQ8TjGy6ESmE/Y4sspVSd4
         rzexSizjFW3qVojMUeGRAiuZxrQka3m2av/ye1gXzb+awo/8vThZgK93AaonlCB2iMdC
         i29T5xLScvvQqEKl/dS3oiIDnGSvl4RXj/TQ+3Do9Kt2Kts1KmVmCuHm9GpWCS7/wnsH
         l3QH/PcwzzW2STu9LR5PyoF8McGl3xYNCKNkgKxfhn7Q3dxL/AciKL5DxcssguTDPBcz
         M0Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FIFs1RkH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j3-20020a05620a146300b00763b64c273esi4230213qkl.220.2023.07.14.05.07.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jul 2023 05:07:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FIFs1RkH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qKHZs-00085k-LO; Fri, 14 Jul 2023 08:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qKHZr-00085D-Aj
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 08:07:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qKHZo-0006wN-I9
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 08:07:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689336431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jFPRECPM+9/54Lqgnq2iiR5SNRM+ew6AleNkCJt9HZA=;
 b=FIFs1RkHlDKSk7HGag/O5fTju/99tgQKfHZmrhkHl0HMnHpO44SQZMJX0/EPZRGYEry3zg
 Vi8ZL96LW4gciY3Aqb3vUREoCxoXBbcpxdcbrhjGY7+EuSoDzjrSzO7r+9KPh9QEx/Pk8b
 tCSExLRZ0CwhvGgm3/JTvJj0MKjFSsY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-LgdvhtfpN3is-iDWu1hxGw-1; Fri, 14 Jul 2023 08:07:10 -0400
X-MC-Unique: LgdvhtfpN3is-iDWu1hxGw-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-993d7ca4607so111177766b.1
 for <qemu-arm@nongnu.org>; Fri, 14 Jul 2023 05:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689336429; x=1691928429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jFPRECPM+9/54Lqgnq2iiR5SNRM+ew6AleNkCJt9HZA=;
 b=JatD4LHSI3/dtfoFIQt5eY50EzjT8FncnmKTazPNEFKHKRmoX0MN96MjSmGsY0KqJQ
 5Eq7XBwjbrgTpqwyTKyhZpUzlsyHiuIpb4RrPavmNZh5t8ARePYLU4U7vCmSghsGahZ9
 BXx6YDhmgOS1iXXHJVbN2SJN3vSIoi00EqUEnmBQk9bRpq220VZxoFixnVLfOpplb5xY
 WtnwLFrFeFuVRlnXy4R8c0gx3+Zhg7KawcjcW/2SFB2ZEBphSvjKsJbwKPBvu1QnynU1
 J5ewCDx0PHBu0W3RY1O5c0mNEHJ8KrGz9Fho8lNLoTzoE23tf8E/QblyhE3RPQEQpvJ5
 OZtg==
X-Gm-Message-State: ABy/qLZcYAtF4WlTIxTZhXHCU+qHs3bYDVxUrSBEhiMvdkdwWBnL5ndW
 9uJnNlZj58hqDO0MCytHiys0KcmCMcKIoSwxZEuwr/5XEFO3aq0d8Ss7fwdY9v8mPa+qRx8v7pr
 1mQ2kYdXV+wcS
X-Received: by 2002:a17:906:6495:b0:993:f081:2c5a with SMTP id
 e21-20020a170906649500b00993f0812c5amr4444673ejm.5.1689336429514; 
 Fri, 14 Jul 2023 05:07:09 -0700 (PDT)
X-Received: by 2002:a17:906:6495:b0:993:f081:2c5a with SMTP id
 e21-20020a170906649500b00993f0812c5amr4444652ejm.5.1689336429205; 
 Fri, 14 Jul 2023 05:07:09 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 z2-20020a1709063ac200b009944e955e19sm679729ejd.30.2023.07.14.05.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 05:07:08 -0700 (PDT)
Date: Fri, 14 Jul 2023 14:07:07 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, peter.maydell@linaro.org, marcel.apfelbaum@gmail.com,
 philmd@linaro.org, wangyanan55@huawei.com, shan.gavin@gmail.com
Subject: Re: [PATCH 1/3] machine: Factor CPU type invalidation out into helper
Message-ID: <20230714140707.5c7c2402@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230713054502.410911-2-gshan@redhat.com>
References: <20230713054502.410911-1-gshan@redhat.com>
 <20230713054502.410911-2-gshan@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: RPMc3+Zs6ZxL

On Thu, 13 Jul 2023 15:45:00 +1000
Gavin Shan <gshan@redhat.com> wrote:

> The CPU type invalidation logic in machine_run_board_init() is
> independent enough. Lets factor it out into helper validate_cpu_type().
> Since we're here, the relevant comments are improved a bit.
> 
> No functional change intended.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/core/machine.c | 81 +++++++++++++++++++++++++----------------------
>  1 file changed, 43 insertions(+), 38 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index f0d35c6401..68b866c762 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1349,12 +1349,52 @@ out:
>      return r;
>  }
>  
> +static void validate_cpu_type(MachineState *machine)
s/validate_cpu_type/is_cpu_type_valid or better is_cpu_type_supported

Is it going to be reused elsewhere (otherwise I don't see much reason to move code around)?

> +{
> +    MachineClass *machine_class = MACHINE_GET_CLASS(machine);
> +    ObjectClass *oc = object_class_by_name(machine->cpu_type);
> +    CPUClass *cc = CPU_CLASS(oc);
> +    int i;
> +
> +    /*
> +     * Check if the user-specified CPU type is supported when the valid
> +     * CPU types have been determined. Note that the user-specified CPU
> +     * type is given by '-cpu' option.
> +     */
> +    if (!machine->cpu_type || !machine_class->valid_cpu_types) {
> +        goto out_no_check;
no goto-s please

> +    }
> +
> +    for (i = 0; machine_class->valid_cpu_types[i]; i++) {
> +        if (object_class_dynamic_cast(oc, machine_class->valid_cpu_types[i])) {
> +            break;
> +        }
> +    }
> +
> +    if (!machine_class->valid_cpu_types[i]) {
> +        /* The user-specified CPU type is invalid */
> +        error_report("Invalid CPU type: %s", machine->cpu_type);
> +        error_printf("The valid types are: %s",
> +                     machine_class->valid_cpu_types[0]);
> +        for (i = 1; machine_class->valid_cpu_types[i]; i++) {
> +            error_printf(", %s", machine_class->valid_cpu_types[i]);
> +        }
> +        error_printf("\n");
> +
> +        exit(1);

since you are touching that,
turn it in errp handling, in separate patch 1st
and only then introduce your helper.

> +    }
> +
> +    /* Check if CPU type is deprecated and warn if so */
> +out_no_check:
> +    if (cc && cc->deprecation_note) {
> +        warn_report("CPU model %s is deprecated -- %s",
> +                    machine->cpu_type, cc->deprecation_note);
> +    }
> +}
>  
>  void machine_run_board_init(MachineState *machine, const char *mem_path, Error **errp)
>  {
>      MachineClass *machine_class = MACHINE_GET_CLASS(machine);
> -    ObjectClass *oc = object_class_by_name(machine->cpu_type);
> -    CPUClass *cc;
>  
>      /* This checkpoint is required by replay to separate prior clock
>         reading from the other reads, because timer polling functions query
> @@ -1405,42 +1445,7 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
>          machine->ram = machine_consume_memdev(machine, machine->memdev);
>      }
>  
> -    /* If the machine supports the valid_cpu_types check and the user
> -     * specified a CPU with -cpu check here that the user CPU is supported.
> -     */
> -    if (machine_class->valid_cpu_types && machine->cpu_type) {
> -        int i;
> -
> -        for (i = 0; machine_class->valid_cpu_types[i]; i++) {
> -            if (object_class_dynamic_cast(oc,
> -                                          machine_class->valid_cpu_types[i])) {
> -                /* The user specificed CPU is in the valid field, we are
> -                 * good to go.
> -                 */
> -                break;
> -            }
> -        }
> -
> -        if (!machine_class->valid_cpu_types[i]) {
> -            /* The user specified CPU is not valid */
> -            error_report("Invalid CPU type: %s", machine->cpu_type);
> -            error_printf("The valid types are: %s",
> -                         machine_class->valid_cpu_types[0]);
> -            for (i = 1; machine_class->valid_cpu_types[i]; i++) {
> -                error_printf(", %s", machine_class->valid_cpu_types[i]);
> -            }
> -            error_printf("\n");
> -
> -            exit(1);
> -        }
> -    }
> -
> -    /* Check if CPU type is deprecated and warn if so */
> -    cc = CPU_CLASS(oc);
> -    if (cc && cc->deprecation_note) {
> -        warn_report("CPU model %s is deprecated -- %s", machine->cpu_type,
> -                    cc->deprecation_note);
> -    }
> +    validate_cpu_type(machine);
>  
>      if (machine->cgs) {
>          /*

