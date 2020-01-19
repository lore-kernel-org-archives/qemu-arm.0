Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1752448lff;
        Sun, 19 Jan 2020 11:01:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqx5d04r9j+KNnVmEe9cHed2ecYtMU4Tj81RFo5kwNwSyLqm64TnYmuYSmsoZhwvoBT8I6aw
X-Received: by 2002:a81:788f:: with SMTP id t137mr36169977ywc.159.1579460517385;
        Sun, 19 Jan 2020 11:01:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579460517; cv=none;
        d=google.com; s=arc-20160816;
        b=HD6yplGtd34Q6D7NzKBjJlYxVlbqW9jkOS8ItGrTKFqvTt/om9M+D3AqfwwScXaTk1
         B8p2j9iXzkXPb9SXl5LeNIU0PR2FedxIn/VGiYaOrC2MV73A8SEuFzoSk3Q9ROVFEueh
         KeGx9qWk05+0UobY1b/55IRXPzD6DFHpwP47fkgCN5diLVeo49jFY5RE7nufwnYZ64aO
         TlVI6Bbq4tEJ4VUPj6V7rgBWdmFGDNh0uDGb400zYgWwDrzgAxuCgBXOZTfpVppzDR49
         czCR61E8YO+H5iQkoRJR/rrpghMycu6YlKr58A8Zb7iqZAbo0oAuGd9NFt+1tJaJ4qIp
         t6Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=IzTTHVQqgsptuvAIgaz11UGzYkZ0gYHctxJHwZrm4LE=;
        b=BMUofo++ExjKlpwJuGcneowJcBMI2U1lEQ3jlfF4dbPibsU3VePSV7MlYsdmjrJ3CV
         KanAKeD6sNEuCDikFXMLyWHrR9jzgZJ+U5elbp3CmERaSqSeaqLTqq6ETsfYw0JUUoyM
         o0Bm11msuKj1SRUTMVvK4eliR5C4WYWjkpvIEKOgfSQFXT7MukQv5nCgY25iI/wcOcMO
         bMpb76/U6IloZ3mPC7q7gLmg2RSFv/Rn+7vwwitg3PTF9hmbPKd4lDM7vt3XzvOBF4aJ
         noiBAD06vkKTN7hLL3ygEHjB7mocW3rxMH4YZhi8BPYI05OEaSgO0Ykw1PJcfO2XjNGr
         aSSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ftXaqM5k;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id k6si2596800ybo.382.2020.01.19.11.01.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 Jan 2020 11:01:57 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ftXaqM5k;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579460516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IzTTHVQqgsptuvAIgaz11UGzYkZ0gYHctxJHwZrm4LE=;
	b=ftXaqM5kmJDVlX6EL62IN+Yi+h2CSo8GtPMqKM8q0oIX8bSS9rPrdq4dhBIBPbG2eJMYgJ
	24mkD6uooOo8c/NOU/RviUgFaaZdBNOfb5eDjIFt1Nkq5FSi67AXOJ8/iyJ2vh/uUKsd8K
	2LMgds9s7E6Lqyy3/QNx9eTYIJ20O/8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-Hh1LOXKDMcudRJwxKsCJFg-1; Sun, 19 Jan 2020 14:01:55 -0500
Received: by mail-wr1-f71.google.com with SMTP id y7so13113140wrm.3
        for <alex.bennee@linaro.org>; Sun, 19 Jan 2020 11:01:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YzVnPmTQlEX2jbH2xwE0zJpBepDUB8pA2HIxAP69GOk=;
        b=WR4gYrBz/Wre48RsfnQTqWkKCvDPx/dL2cJzXPJ0zbFL4jZw4n/Zp49drbxguCDUqO
         sbN9Rc9Ft3JshA2R8MwWiTET+B76QhSHmU1zwz6YQz7Yqad2Kv7Sz6qunQ4B33M3vY29
         W76PujUWaRioVDqFUkehzvpyAw0OCVsv+bqW29al+/OncMJKggqWvAuTmi0hW0v7nWkT
         8iVw7+A0AZxeML1Aam6CabhIIR1+lcYAEJTc2cnlm8KKmpm6ffoUXKqVFrDm4aYjt/KV
         8FxO47/fEDJJcnPkIYwpzowkJ/CItF7vH74VIGDRRpV7WiAur/dfIWzN/PSbDaOvXG9A
         zHFw==
X-Gm-Message-State: APjAAAWycF8/eOA2JEpTJAvoxLRpYnSVtMpOxUBHFykGlh+MShLVdQm8
	cF5MACFRH3rX+XiImQrMwTcyXAKp6z9mEQfu+6CzjvHj/MnlWTT0sUS0NbrWkTBLn5geZQdeGlz
	XaMDTEKHk+6e273Mc
X-Received: by 2002:a5d:484d:: with SMTP id n13mr14162011wrs.420.1579460514296;
        Sun, 19 Jan 2020 11:01:54 -0800 (PST)
X-Received: by 2002:a5d:484d:: with SMTP id n13mr14162004wrs.420.1579460514105;
        Sun, 19 Jan 2020 11:01:54 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.113])
        by smtp.gmail.com with ESMTPSA id e16sm44263684wrs.73.2020.01.19.11.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jan 2020 11:01:53 -0800 (PST)
Subject: Re: [PATCH v4 08/20] hw/arm/allwinner: add SD/MMC host controller
To: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, b.galvani@gmail.com,
 jasowang@redhat.com, alex.bennee@linaro.org, imammedo@redhat.com
References: <20200119005102.3847-1-nieklinnenbank@gmail.com>
 <20200119005102.3847-9-nieklinnenbank@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e9c31386-d471-159a-6cb0-7e621cb3bc83@redhat.com>
Date: Sun, 19 Jan 2020 20:01:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200119005102.3847-9-nieklinnenbank@gmail.com>
Content-Language: en-US
X-MC-Unique: Hh1LOXKDMcudRJwxKsCJFg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: bOboj/itm/cF

On 1/19/20 1:50 AM, Niek Linnenbank wrote:
> The Allwinner System on Chip families sun4i and above contain
> an integrated storage controller for Secure Digital (SD) and
> Multi Media Card (MMC) interfaces. This commit adds support
> for the Allwinner SD/MMC storage controller with the following
> emulated features:
>=20
>   * DMA transfers
>   * Direct FIFO I/O
>   * Short/Long format command responses
>   * Auto-Stop command (CMD12)
>   * Insert & remove card detection
>=20
> The following boards are extended with the SD host controller:
>=20
>   * Cubieboard (hw/arm/cubieboard.c)
>   * Orange Pi PC (hw/arm/orangepi.c)
>=20
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>   include/hw/arm/allwinner-a10.h   |   2 +
>   include/hw/arm/allwinner-h3.h    |   3 +
>   include/hw/sd/allwinner-sdhost.h | 135 +++++
>   hw/arm/allwinner-a10.c           |  11 +
>   hw/arm/allwinner-h3.c            |  15 +-
>   hw/arm/cubieboard.c              |  15 +
>   hw/arm/orangepi.c                |  16 +
>   hw/sd/allwinner-sdhost.c         | 848 +++++++++++++++++++++++++++++++
>   hw/sd/Makefile.objs              |   1 +
>   hw/sd/trace-events               |   7 +
>   10 files changed, 1052 insertions(+), 1 deletion(-)
>   create mode 100644 include/hw/sd/allwinner-sdhost.h
>   create mode 100644 hw/sd/allwinner-sdhost.c

Failure at build if configured with --without-default-devices:

   CC      arm-softmmu/hw/sd/allwinner-sdhost.o
   CC      arm-softmmu/hw/arm/orangepi.o
   CC      arm-softmmu/hw/arm/allwinner-h3.o
   LINK    arm-softmmu/qemu-system-arm
/usr/bin/ld: hw/sd/allwinner-sdhost.o: in function=20
`allwinner_sdhost_send_command':
hw/sd/allwinner-sdhost.c:239: undefined reference to `sdbus_do_command'
/usr/bin/ld: hw/sd/allwinner-sdhost.o: in function `allwinner_sdhost_read':
hw/sd/allwinner-sdhost.c:517: undefined reference to `sdbus_data_ready'
/usr/bin/ld: hw/sd/allwinner-sdhost.c:518: undefined reference to=20
`sdbus_read_data'
/usr/bin/ld: hw/sd/allwinner-sdhost.c:519: undefined reference to=20
`sdbus_read_data'
/usr/bin/ld: hw/sd/allwinner-sdhost.c:520: undefined reference to=20
`sdbus_read_data'
/usr/bin/ld: hw/sd/allwinner-sdhost.c:521: undefined reference to=20
`sdbus_read_data'
/usr/bin/ld: hw/sd/allwinner-sdhost.o: in function=20
`allwinner_sdhost_process_desc':
hw/sd/allwinner-sdhost.c:340: undefined reference to `sdbus_read_data'
/usr/bin/ld: hw/sd/allwinner-sdhost.c:334: undefined reference to=20
`sdbus_write_data'
/usr/bin/ld: hw/sd/allwinner-sdhost.o: in function `allwinner_sdhost_write'=
:
hw/sd/allwinner-sdhost.c:651: undefined reference to `sdbus_write_data'
/usr/bin/ld: hw/sd/allwinner-sdhost.c:652: undefined reference to=20
`sdbus_write_data'
/usr/bin/ld: hw/sd/allwinner-sdhost.c:653: undefined reference to=20
`sdbus_write_data'
/usr/bin/ld: hw/sd/allwinner-sdhost.c:654: undefined reference to=20
`sdbus_write_data'
/usr/bin/ld: hw/sd/allwinner-sdhost.o: in function `allwinner_sdhost_dma':
hw/sd/allwinner-sdhost.c:372: undefined reference to `sdbus_data_ready'
collect2: error: ld returned 1 exit status
make[1]: *** [Makefile:206: qemu-system-arm] Error 1

Fixed by:

-- >8 --
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index bb75c1de17..086241354c 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -302,6 +302,9 @@ config ALLWINNER_H3
      select ARM_TIMER
      select ARM_GIC
      select UNIMP
      select USB_OHCI
      select USB_EHCI_SYSBUS
+    select SD

  config RASPI
      bool
---
