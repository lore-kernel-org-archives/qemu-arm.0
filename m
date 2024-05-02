Received: by 2002:a17:906:a205:b0:a52:4db9:938b with SMTP id r5csp1030568ejy;
        Thu, 2 May 2024 02:19:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX37IkmvR5O86eTYMZ1B8dZyr0Al7H7FVoxFvvNFPdwBNDWCtBpUr1HIX2VP3/TdU633jZd33nrI1Z9nWJldYZ21IZzLvBX
X-Google-Smtp-Source: AGHT+IGeUCXqU0P0DIvwpXK9k0cArjWasS2/aFz+zfUBPZUj/Y7GDCcVLpMrkplZ87xz0Inzs98M
X-Received: by 2002:ad4:5dcf:0:b0:6a0:cd69:374d with SMTP id m15-20020ad45dcf000000b006a0cd69374dmr4324356qvh.50.1714641570113;
        Thu, 02 May 2024 02:19:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714641570; cv=none;
        d=google.com; s=arc-20160816;
        b=KyBjNX2IH7EY4I6P1by84pCA5sASdzHPYvO+dY2/pIGvDDkayOfuvdp4mWsVU4S8NF
         JukBZAhGMJWhFGhCFMG/WZWJyVfjDP/MDt0VUFu/XWYEkbor2/zd98OFQpNkhxqs1pvH
         pOTX/Cmxs9XZB1zJxpBP4Mb3ITHejmAaJfTAXq7ef1nl3FOyDEjWEVN9xfdvwzYxD2Ik
         gdKLkxyfv7vXpAYYyb9CZYhX7oVBuuzo0dVVsDPrfJc3O+sQEoTV0mBIOXwwhs5V6Fw7
         ed4vsXKpTrrs/OePHAtzznw52fa6d9MqWzJ8dTYfXWLDI1fmGk6SmnV/sjLtS9pVxIoI
         nZPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=lMTlOuXw/w8ul+1mfZsUesTfYYUEXYhKpfU4N/4QUK8=;
        fh=bi1OVxRcffvVyi2FYmZrSUxmzly48l15x+qX9Rdno7A=;
        b=HGYfs31AoRQJZkOd/5LIosy7DiPiVPsD8mwsWAq+VG+rT0CXMIw+1mvET7ifDXV/hN
         ZuJyrmYyeJZ23HoDqW/oFltmesjO4f/l0Z39xDvqM/BEa81x0xaSCjLtnFzAnc0gXIfy
         JCjg+FjuehdZu8t2KicP46tNswrMWNxCeEPtKZy+zbCqucefOcqI5xllVQZREPkiQbNe
         Du5uUeI8L2C63N9Op9/q+eun36sxmoL7P6Qq+erkFlMb0reaWkOvhNeSN1DwjYbz/rik
         Y1N+3tIX6wcUjcRpaPr/fwHEGdhxT9Q4xTWROkKZ/tFYS/5FFMukUrXZx0JEuHOstyOe
         qZ4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M2xL8Wjz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020a05621420c300b006a0c81215aesi536257qve.45.2024.05.02.02.19.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2024 02:19:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M2xL8Wjz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s2Sam-0006es-Jm; Thu, 02 May 2024 05:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s2Saf-0006dG-5w
 for qemu-arm@nongnu.org; Thu, 02 May 2024 05:18:57 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s2Sad-0002vu-G4
 for qemu-arm@nongnu.org; Thu, 02 May 2024 05:18:56 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5726ccca4c8so6062190a12.3
 for <qemu-arm@nongnu.org>; Thu, 02 May 2024 02:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714641534; x=1715246334; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lMTlOuXw/w8ul+1mfZsUesTfYYUEXYhKpfU4N/4QUK8=;
 b=M2xL8WjzBFjGnDsPgNM/LRdblGzORr8dvFd4VVZHYnepN4ehDJkMqN0MjGW4j9HtM9
 YzJBgSzxgdg29U8xE5/xUF4P+aDsRUo3h+99DJ5C8S8rblyNBU42t9mlTeyI+mfmirUb
 snvqLTioY3TguX8ADXwkH4P9yNEwIStHS1hXhdMZm3G/PJvIkZV+YoqQV4dYpcTo+yM3
 otbHODtRnDHcdsPKQWj6nMR5lI9/Lcw22jAaqgVCxILUCG6wtGX7A1tBdktCQBuhBI1g
 lt/SV/zRFDT6ffzrC+wER0MXyRRuyW90JVfZd7v8FjQRqInJ1mhObDeFKNi3DVfjbr3h
 916w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714641534; x=1715246334;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lMTlOuXw/w8ul+1mfZsUesTfYYUEXYhKpfU4N/4QUK8=;
 b=AzX5ySa+wkA1f19MdvheN8b2mAukVZ0BDGYJI778mFDzzudVvONRCCc04WjgyiGD5P
 i3uNv3INCH6I9ST3zs0RRDUqmWC33dY8cmmYRDgHMhDbsLlrAFSlXXXNhz+jJ2OA3kCD
 3QINEXqVJuu/6jI0N7rm2HDHz7tVmrfIii3Gm4jBghXvoLSxqRsOd15UOxMwfJKBJH7q
 m2oQU36apX9+9y3a3sx2zQmA3PbXBahSYEFyxVx8UoLfRSuYCf9PbmVdCEKZLAGB8hTg
 abuO92a54gA9tKvH2rZglStknQa3heHw3fVdupPVg8QcEWumq3FmkaQXvweQoOttjBQp
 Hpdg==
X-Gm-Message-State: AOJu0YwvNNR6q8n+uBXvKP4s7kt0eqpOpmtFQYNzg52TZfyhS1l2CF8f
 eIV8RoZReATZ3yejkc4Gz8GnLXgFjKaf5pzBN1PucQujh+vAX63dIL5zl79l2kIawVdZ0fe1x4w
 zuIm1IIaKqO4MLIsX9hsa9Gpb9aFUNESKdugZKg==
X-Received: by 2002:a50:cd15:0:b0:568:1882:651f with SMTP id
 z21-20020a50cd15000000b005681882651fmr998821edi.25.1714641533837; Thu, 02 May
 2024 02:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240502051233.50749-1-jeeheng.sia@starfivetech.com>
In-Reply-To: <20240502051233.50749-1-jeeheng.sia@starfivetech.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 May 2024 10:18:43 +0100
Message-ID: <CAFEAcA_FO7BvUDbnJdUTkuatFse7bWR2mjL2OQ_vsB_dLdKbow@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Upgrade ACPI SPCR table to support SPCR table
 version 4 format
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com, 
 shannon.zhaosl@gmail.com, sunilvl@ventanamicro.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: V6CNLkl4Si8+

On Thu, 2 May 2024 at 06:12, Sia Jee Heng <jeeheng.sia@starfivetech.com> wrote:
>
> Update the SPCR table to accommodate the SPCR Table version 4 [1].
> The SPCR table has been modified to adhere to the version 4 format [2].
>
> Meanwhile, the virt SPCR golden reference files have been updated to
> accommodate the SPCR Table version 4.
>
> [1]: https://learn.microsoft.com/en-us/windows-hardware/drivers/serports/serial-port-console-redirection-table
> [2]: https://github.com/acpica/acpica/pull/931
>
> Sia Jee Heng (2):
>   tests/qtest/bios-tables-test: Update virt SPCR golden references
>   hw/acpi: Upgrade ACPI SPCR table to support SPCR table version 4
>     format

This isn't the right way to make a change that requires
updates to the bios-tables-test reference files, because
"make check" will fail after patch 1 but before patch 2.

You need a three-patch approach. How to do that is documented
in the comment at the top of bios-tables-test.c. The resulting
three patches should look like:
 * patch 1 updates bios-tables-test-allowed-diff.h to
   mark the affected test or tests as "OK to fail"
 * patch 2 makes the changes to QEMU that alter the
   required table output
 * patch 3 updates the reference files and removes the
   tests from the allowed-diff file

See for instance commits 6c1c2e912fcf9, 1ec896fe7ca938,
ea2fde5bccc514 as an example.

Side note: if riscv virt has APCI tables now, maybe we
should add testing of them to the bios-tables-test ?

thanks
-- PMM
