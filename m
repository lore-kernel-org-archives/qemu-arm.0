Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1498650lfg;
        Sat, 15 May 2021 12:37:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcaWiEJNU2NSU+t7X1cAc7x2MbWefszLF+U6v2KtuuigUTxeTWKHQu3vAjwKRZgkcycELH
X-Received: by 2002:a92:2a12:: with SMTP id r18mr44882345ile.170.1621107479700;
        Sat, 15 May 2021 12:37:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621107479; cv=none;
        d=google.com; s=arc-20160816;
        b=aa42e8W73ZvE1mPhXGJvLep70eGWDGEoT0GvYcH/CeUV3iVdePkjLNzV1xTC1cXN6B
         LniQmVEVjca1BbWivkiJEBP1UJYfjBurilGPqPK9zBFVEN0tmqrEpX1lN7fPELpioAR6
         ZLh4priDdWM7ic74WHlffdxSJfL9qd1EdRyBH04N2w59Pp03H7VxVgPNxeLPD1j4GOQF
         HBlYAYAtH6UT7+YbRcPvMy72AZpJPfq/p2m0gnK0CbdDvhywyKa9fg3jDapfbPgnpVfS
         4b14i7iR3ESkw3KQX2Sp/uslQkNwe8fFriUWQo7jrSvd6DTYFiQRp0E3eiPUFmOg9kCe
         H5ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:to:from:date;
        bh=K/JVupm7e/OhgzMcWWkk3NtrtGsJ+dTz4wM0r0XNG80=;
        b=XjMKw0LobgwlgJWD+AX41vcvl7VWXZhJxtE08z5tsvcDqqiYzBb/uO/wRyBOAAD9/x
         +wfL+TZOOnTZsESaLBXbNfqAK98EZKD9nLUVIqcDC8yVwC7ME8TsBJTDDJHW+cVrOk4D
         8+Oq6skAssD2c7+qW4RfDnaEtAfi0jG0Fus6ADfrMVljTJexAA/gjkRz1xfqCrUovw42
         /U7wotEQi65kztaL+69J1Vj83MQxrDzOPApGnEnXH2Up25GEb5T8CICYTTgc66VDVZav
         eNansS7ztpFnjnAW6hQxiVLFUOCZxjixa3pGH3dlW9YFIx8AM70SdiEAIztxuJgQTqPg
         Euhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q15si12895391jaj.2.2021.05.15.12.37.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 May 2021 12:37:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1]:40942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1li06p-00048m-38
	for alex.bennee@linaro.org; Sat, 15 May 2021 15:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1li05f-0002bn-Os; Sat, 15 May 2021 15:36:47 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:22144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1li05d-0005ip-Si; Sat, 15 May 2021 15:36:47 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2008374570E;
 Sat, 15 May 2021 21:36:43 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id ECAB8745709; Sat, 15 May 2021 21:36:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id EB53E745708;
 Sat, 15 May 2021 21:36:42 +0200 (CEST)
Date: Sat, 15 May 2021 21:36:42 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 11/12] hw/isa/vt82c686: Add missing Kconfig dependency
 (runtime error)
In-Reply-To: <20210515173716.358295-12-philmd@redhat.com>
Message-ID: <1bb490db-9635-305f-ff8b-34dd7a524cb9@eik.bme.hu>
References: <20210515173716.358295-1-philmd@redhat.com>
 <20210515173716.358295-12-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-273187842-1621107402=:7809"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cMeSlLjdsDo+

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-273187842-1621107402=:7809
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 15 May 2021, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>
> When building the Pegasos2 machine stand-alone we get:
>
>  $ qemu-system-ppc -M pegasos2 -bios pegasos2.rom
>  ERROR:qom/object.c:714:object_new_with_type: assertion failed: (type != NULL)
>  Bail out! ERROR:qom/object.c:714:object_new_with_type: assertion failed: (type != NULL)
>
> Looking at the backtrace:
>
>  Thread 1 "qemu-system-ppc" received signal SIGABRT, Aborted.
>  (gdb) bt
>  #0  0x00007ffff53877d5 in raise () at /lib64/libc.so.6
>  #1  0x00007ffff5370895 in abort () at /lib64/libc.so.6
>  #2  0x00007ffff6dc4b6c in g_assertion_message_expr.cold () at /lib64/libglib-2.0.so.0
>  #3  0x00007ffff6e229ff in g_assertion_message_expr () at /lib64/libglib-2.0.so.0
>  #4  0x0000555555a0c8f4 in object_new_with_type (type=0x0) at qom/object.c:714
>  #5  0x0000555555a0c9d5 in object_new (typename=0x555555c7afe4 "isa-pit") at qom/object.c:747
>  #6  0x0000555555a053b8 in qdev_new (name=0x555555c7afe4 "isa-pit") at hw/core/qdev.c:153
>  #7  0x00005555557cdd05 in isa_new (name=0x555555c7afe4 "isa-pit") at hw/isa/isa-bus.c:160
>  #8  0x00005555557cf518 in i8254_pit_init (bus=0x55555603d140, base=64, isa_irq=0, alt_irq=0x0) at include/hw/timer/i8254.h:54
>  #9  0x00005555557d12f9 in vt8231_realize (d=0x5555563d9770, errp=0x7fffffffcc28) at hw/isa/vt82c686.c:704
>  #10 0x00005555557e1340 in pci_qdev_realize (qdev=0x5555563d9770, errp=0x7fffffffcca0) at hw/pci/pci.c:2116
>  #11 0x0000555555a06a84 in device_set_realized (obj=0x5555563d9770, value=true, errp=0x7fffffffcda8) at hw/core/qdev.c:761
>  #12 0x0000555555a0ff9e in property_set_bool (obj=0x5555563d9770, v=0x5555563da090, name=0x555555cd7881 "realized", opaque=0x5555560acf80, errp=0x7fffffffcda8) at qom/object.c:2257
>  #13 0x0000555555a0e098 in object_property_set (obj=0x5555563d9770, name=0x555555cd7881 "realized", v=0x5555563da090, errp=0x555555fc3fa0 <error_fatal>) at qom/object.c:1402
>  #14 0x0000555555a12271 in object_property_set_qobject (obj=0x5555563d9770, name=0x555555cd7881 "realized", value=0x5555563cf0a0, errp=0x555555fc3fa0 <error_fatal>) at qom/qom-qobject.c:28
>  #15 0x0000555555a0e3fb in object_property_set_bool (obj=0x5555563d9770, name=0x555555cd7881 "realized", value=true, errp=0x555555fc3fa0 <error_fatal>) at qom/object.c:1472
>  #16 0x0000555555a05b15 in qdev_realize (dev=0x5555563d9770, bus=0x5555563d32b0, errp=0x555555fc3fa0 <error_fatal>) at hw/core/qdev.c:389
>  #17 0x0000555555a05b42 in qdev_realize_and_unref (dev=0x5555563d9770, bus=0x5555563d32b0, errp=0x555555fc3fa0 <error_fatal>) at hw/core/qdev.c:396
>  #18 0x00005555557e160f in pci_realize_and_unref (dev=0x5555563d9770, bus=0x5555563d32b0, errp=0x555555fc3fa0 <error_fatal>) at hw/pci/pci.c:2181
>  #19 0x00005555557e165b in pci_create_simple_multifunction (bus=0x5555563d32b0, devfn=96, multifunction=true, name=0x555555c9b63b "vt8231-isa") at hw/pci/pci.c:2189
>  #20 0x0000555555867730 in pegasos2_init (machine=0x5555560427a0) at hw/ppc/pegasos2.c:105
>
> The "isa-pit" type (TYPE_I8254) is missing. Add it.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/isa/Kconfig | 1 +
> 1 file changed, 1 insertion(+)
>
> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
> index 0703512209a..9822a90ce95 100644
> --- a/hw/isa/Kconfig
> +++ b/hw/isa/Kconfig
> @@ -49,6 +49,7 @@ config VT82C686
>     select FDC
>     select USB_UHCI
>     select APM
> +    select I8254
>     select I8257
>     select I8259
>     select MC146818RTC
>
--3866299591-273187842-1621107402=:7809--
