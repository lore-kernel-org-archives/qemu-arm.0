Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp622375lfb;
        Thu, 26 Aug 2021 06:39:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6dewRfxqUIBnwvSFXIqMktT73JCn2puuCqcoS4eLY94w+NuvDdaBJZWb+qpfvLhfOZdUB
X-Received: by 2002:adf:fdd2:: with SMTP id i18mr4106480wrs.406.1629985191019;
        Thu, 26 Aug 2021 06:39:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629985191; cv=none;
        d=google.com; s=arc-20160816;
        b=eJ8O7GKGpfRAoa+GRlXAZpUt63q47nRk+2O2WR9huu5QG4Cb7W1v70ltrKstXLvCPu
         zsNkYhgKRt+euzOtKK74NxNnH394/7GFu2atwvdsH2C1WHcRp1HYdBuskgPR93sGqfWx
         hPe/39YzecVtTcHBSws+/aV1C8d3cZ+eakZIuWd120KaR2iWVDJ9yJqu2x2EZIqJGN8i
         DZkqGWgY67OQelOkzR7MtfJ5zd6f1afKG0Yx++jVgIOmYUMJ7SJ2trPWtY37l7Htx6K/
         +3O5g0ZplTuQEI2/n/utPjCHiuPgsCByPMFfiw0tvtsE0+j3rdpRZ/7U8xGGKP0+GErw
         HfAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=QIkmguGk5Ur8kPzbCJ2653Kcvq5uHWpeziEE5g5qXDw=;
        b=ANv9IcqK14eXywqgcNou/Y412CYfQAAReZGWOoF4tGJ/n46BibS1JkMJioNUax7i68
         z/0ayWWtIOh7YI8WcHh3YUgJ9LRP69p1fi8prIM0QJGLEYtCESwl3pOlyDQ2yRuVOF19
         WQJNUTsDKQWPvbN3eWGvzuneoCifCUfbEWBjbPiB0l99HKPEJAXv1aTLSEUT2hRwEeQ3
         NKV/8bQm7L/mz4LubWB0NN3y0jjEo40rrg9HtIpm2xrZwHuLLyWJqKSrX0D2QgHBJn+I
         YZbg+k02HLLW3DStaahH15GpwASIN+JzPZNOTbmx/rKVlh0wGNCoF+JFo7LypgyVSxcp
         eGhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b+0lDQgF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7si570235wrs.501.2021.08.26.06.39.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Aug 2021 06:39:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b+0lDQgF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJFbh-0006Kd-Uo
	for alex.bennee@linaro.org; Thu, 26 Aug 2021 09:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFK9-0005LP-Ho
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 09:21:41 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:40496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFK6-0007sd-SK
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 09:21:41 -0400
Received: by mail-ed1-x530.google.com with SMTP id d6so4622247edt.7
 for <qemu-arm@nongnu.org>; Thu, 26 Aug 2021 06:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QIkmguGk5Ur8kPzbCJ2653Kcvq5uHWpeziEE5g5qXDw=;
 b=b+0lDQgFoImsjgR7i/mXhZ5R1kffCi3MGAfa8leySHHm/SueR0YgfWLY1BxogP/8KE
 OcpQWSG3ADJTVu4793Qg6ipBUb1qxYaIzp12MC8td+XDRTFbjpSPCRSlNw0xDrnKC65I
 t2DBp17EP4ha3S2Z94dwR8Sjj4efbeSxoYUKD3CkCu1wJ/1QwGJvbM9out2KatLcR72W
 HCDGgjBcAChX8+3gI3kl7HgP4XJ0A1zL5CBllV9SYkKPeq/Nr6iloPbz0B78XJR0bQt1
 jdii/adWkMCeiY5VtqhYm3esY3rzwDAvlGvgdy/Bbh8WeONzfM3xG/I89WfCKMuwD5ZL
 Pcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QIkmguGk5Ur8kPzbCJ2653Kcvq5uHWpeziEE5g5qXDw=;
 b=etw6i5WLT+RCVBemHwUAAUg2Ep0I0nfH6vAFQl49+A9dMHmI+kW8KyMlq/h/UfMzMF
 JC/dcOCkCg61jDLEYaHVlnjWQlzAe9PBqbV83onCfb51+0D/X0gq13Zq4tjvDysxeH6F
 tZZKFVYjK9Lb+aWaZS3MSbCWDLjaX3ZcDA2jpCxm+WKiocWqoJ715/VdYBMgb1nwK+at
 3PwYdMw8Me31NA6oOhof+Za7sFohGS6WB76nipvWqrd8VlYO86pqJQjvbWU5L1HcWER/
 7byk6cRhL7ata5ZVaTnd8RMcXcU/5q9mG0U69PpSJvjHRVgYkGsZfEuCimCjWmfRGJvy
 NQxQ==
X-Gm-Message-State: AOAM531It+U4FrtctF8LIWrfJPE8nzybgM6alYqJLSokOyHdTL4IK/8n
 v+8d/IoSge8Uke83IrGpwVdqS5zro09sPDH19t4QKQ==
X-Received: by 2002:aa7:dd48:: with SMTP id o8mr4184326edw.44.1629984097322;
 Thu, 26 Aug 2021 06:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210819162637.518507-1-ani@anisinha.ca>
In-Reply-To: <20210819162637.518507-1-ani@anisinha.ca>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 14:20:49 +0100
Message-ID: <CAFEAcA_oAkE5UV+KASVj5xo4BR_t6hdtfxj1Z1wJfUCsytd5Tw@mail.gmail.com>
Subject: Re: [PATCH v3] hw/arm/Kconfig: no need to enable
 ACPI_MEMORY_HOTPLUG/ACPI_NVDIMM explicitly
To: Ani Sinha <ani@anisinha.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +oXopimR2YuY

On Thu, 19 Aug 2021 at 17:26, Ani Sinha <ani@anisinha.ca> wrote:
>
> Since commit
> 36b79e3219d ("hw/acpi/Kconfig: Add missing Kconfig dependencies (build er=
ror)"),
> ACPI_MEMORY_HOTPLUG and ACPI_NVDIMM is implicitly turned on when
> ACPI_HW_REDUCED is selected. ACPI_HW_REDUCED is already enabled. No need =
to
> turn on ACPI_MEMORY_HOTPLUG or ACPI_NVDIMM explicitly. This is a minor cl=
eanup.
>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>



Applied to target-arm.next, thanks.

-- PMM
