Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp202971ejf;
        Mon, 15 Jan 2024 04:33:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlvepZaBM2Zj8cNObcZHqCHUN4JNPhmuMjyar2HNGdrMB/Uyoj60FTZKfqlezdV0Oc0BJ2
X-Received: by 2002:ac8:7c47:0:b0:429:e321:2749 with SMTP id o7-20020ac87c47000000b00429e3212749mr3526479qtv.79.1705321996376;
        Mon, 15 Jan 2024 04:33:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705321996; cv=none;
        d=google.com; s=arc-20160816;
        b=xoywcaAEFrvNEhHuf+rOiVcLdMUEXFVb1UCXZOa0xtSEhpbft4drbTG+ebmeZ/E9Fe
         9js+2YXFvZEJ7/E2JyorSQaoiZatMdWbzp9+9rfQu/Hjtuhaeb0C8eBOvncYmnCrSfRM
         DkHs/b116gASA/CadydfW5v1t7xDnC9sR/nZTpT+gQu4YdGdcH8K89DkeoDRnEuFPINK
         Iqqia2fnQHsorvsyq6wiWuF4hL5j9yz+yZOIC0gQZO4pYiPduymk3a8XXVjP5TW8QINO
         u7UCq+QcZORnjn7mqcdWCAdXnen+Xu32zdsMzpa6jNZZ7dkTuCCDlZOg9pMsOhM7Ur6w
         C/gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DA+SM8YT8bb9bH6m7D9z0Vg+SA2ASxEDsr/aRYtW9+I=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=BGJyYp6jPeHb+B+vChcaQ++dTmfddlBZ+EP+4aNDDeRbisMAePpEBXOGua93dPi45J
         djaK4y/1kDRmpFFSso2/EdQbai0LDFVyCJP7wCX4m9PtJ5O/LCrDOm69E5kRD0mqdyt1
         OUYQQIUHbHcd0ztJeuHVn+Xd6PEWfPhP9yNc+f4xfVVljbsGYFsK8X4rvJtugKgUxBC+
         F7yKAgz8mWwZ+8+J4ET/U4UFsfvNxu0TQYXSnEB+NJ6MNRCBonEOFL7vrDbxgkEJBXVd
         i/B5XXm46QjxMbyMjTIEALVqthJHvIMoJkTQxHLXVM+MqdAPJcT4KTwiqWQqaJrUgh9N
         iMiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FbeZ+jQu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1-20020ac85941000000b00428151f5496si7960914qtz.723.2024.01.15.04.33.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jan 2024 04:33:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FbeZ+jQu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPM9F-00022n-QJ; Mon, 15 Jan 2024 07:33:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPM9D-0001zX-Je
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 07:32:59 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPM9A-0002Qe-5l
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 07:32:57 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-554fe147ddeso9721482a12.3
 for <qemu-arm@nongnu.org>; Mon, 15 Jan 2024 04:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705321974; x=1705926774; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DA+SM8YT8bb9bH6m7D9z0Vg+SA2ASxEDsr/aRYtW9+I=;
 b=FbeZ+jQuItye86/RQi2YDaf8micyP6nZFHUIMqXadSxxwb+DYSXZruWGfJ2o65mllx
 h3DBr5S2LJsRYEjbeN3c3MzbgM1vxUOzyZ5jgJRkVWSklYeJXDdFlZP9h29KbM1BzwxQ
 MOlF9/OgOwhNhtdbXeftxiyLaia9pd88laiHQPI5S5Q6U3JmPXXBYw58hScfWe3hb6hX
 0gy1ITvKRA2xI152VnFGKQHM0tSrpQ1ELSB+nkqSG41kWtAJyZvwwQZ0ojLlku56/jUr
 0OQUYjIdAbcwP2/kGrn9o0tcdzaHvQXVWuVv0HiATdK0lpjE5C3Nr4vfhcBimMta1esh
 9hsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705321974; x=1705926774;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DA+SM8YT8bb9bH6m7D9z0Vg+SA2ASxEDsr/aRYtW9+I=;
 b=jFnvEQnh4NHmHlgz/efSelqMuvHJNvJgTkLdsmv1ppwWJgtMAwB/+xuXnuxIRuAtdq
 rlWp+WPjxc+AIH1pl99LW0nh+/qFiKnzMhv1k8S5Trf2sRcW3J2xKPgv7Iq/2WCJfPEC
 wNDlu5gyOaspP9/kBnZHpY5FFVRHokN63yqgbU06g7SJmVOqr4TKrvt9Rs6ihrYiFYfI
 GZZt03rMa4TktNotWZgHKNZS5H8kkx9DXd6HiIK0YygRCB/XXsUfmc1biORDSsPEHFD8
 QHCMYML7UjNHYpSVy/surFbEhlnSujkMRihhg6uIZv5ONwXS/akROQF+im6rDKWqH9zV
 mTzw==
X-Gm-Message-State: AOJu0Yxk7GSCgiE4WOdsySfKeC9S93/AbhFn8FbfnqWWd/POvYN1MXY0
 veiDVIGyprVi72GRrsNFlf+eH++Kb15gQg+SgoEgPjYNmnPq/Q==
X-Received: by 2002:aa7:cf19:0:b0:558:f01f:6845 with SMTP id
 a25-20020aa7cf19000000b00558f01f6845mr935066edy.168.1705321973893; Mon, 15
 Jan 2024 04:32:53 -0800 (PST)
MIME-Version: 1.0
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
 <20231208023145.1385775-12-sergey.kambalin@auriga.com>
In-Reply-To: <20231208023145.1385775-12-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2024 12:32:42 +0000
Message-ID: <CAFEAcA-+eoyY2_+21ybA+Q-bkbTooSfdf+Ooti8SG-kHR5osCg@mail.gmail.com>
Subject: Re: [PATCH v4 11/45] Introduce Raspberry PI 4 machine
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: 6268tIltgiIZ

On Fri, 8 Dec 2023 at 02:33, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---

> @@ -329,11 +330,24 @@ void bcm_soc_peripherals_common_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>
> -    if (!object_property_set_uint(OBJECT(&s->fb), "vcram-base",
> -                                  ram_size - vcram_size, errp)) {
> +    vcram_base = object_property_get_uint(OBJECT(s), "vcram-base", &err);
> +    if (err) {
> +        error_propagate(errp, err);
>          return;
>      }
>
> +    if (vcram_base == 0) {
> +        vcram_base = (ram_size > UPPER_RAM_BASE ? UPPER_RAM_BASE : ram_size)
> +            - vcram_size;
> +    } else {
> +        if (vcram_base + vcram_size > UPPER_RAM_BASE) {
> +            vcram_base = UPPER_RAM_BASE - vcram_size;
> +        }
> +    }

I think this might be slightly clearer written as:

   if (vcram_base == 0) {
       vcram_base = ram_size - vcram_size;
   }
   vcram_base = MIN(vcram_base, UPPER_RAM_BASE - vcram_size);

> +    if (!object_property_set_uint(OBJECT(&s->fb), "vcram-base", vcram_base,
> +                                  errp)) {
> +        return;
> +    }
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->fb), errp)) {
>          return;
>      }

> @@ -293,11 +292,20 @@ static void raspi_base_machine_init(MachineState *machine,
>
>      vcram_size = object_property_get_uint(OBJECT(soc), "vcram-size",
>                                            &error_abort);
> +    vcram_base = object_property_get_uint(OBJECT(soc), "vcram-base",
> +                                          &error_abort);
> +    if (!vcram_base) {
> +        boot_ram_size = (ram_size > UPPER_RAM_BASE ? UPPER_RAM_BASE : ram_size)
> +            - vcram_size;
> +    } else {
> +        boot_ram_size = (vcram_base + vcram_size > UPPER_RAM_BASE ?
> +                                UPPER_RAM_BASE - vcram_size : vcram_base);
> +    }

This also could be written

    if (vcram_base == 0) {
        vcram_base = ram_size - vcram_size;
    }
    vcram_base = MIN(vcram_base, UPPER_RAM_BASE - vcram_size);
    boot_ram_size = vcram_base;

>      setup_boot(machine, &soc->cpu[0].core, board_processor_id(board_rev),
> -               machine->ram_size - vcram_size);
> +               boot_ram_size);
> }


> +struct Raspi4bMachineState {
> +    /*< private >*/
> +    RaspiBaseMachineState parent_obj;
> +    /*< public >*/
> +    BCM2838State soc;
> +};

Our coding style no longer requires the 'private' and 'public'
marker comments, so you can drop them.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
