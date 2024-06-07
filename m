Received: by 2002:a17:906:acd:b0:a66:557b:2f6e with SMTP id z13csp1217385ejf;
        Fri, 7 Jun 2024 15:25:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXijUat4deYup4hxov60Atnf79Jh/vDiXRYYL+AgpurdZKofWpSsmq2WE38ijHxoGEkJkfrjWhjS4fXcQthrVeop+OcP2tx
X-Google-Smtp-Source: AGHT+IEtW+SwTw/x2zdcWuU+4ofIIlYcXdKhCnbKxrUtL5KsDVur+Ojh0qrhF93qecxCso7WgXCz
X-Received: by 2002:a05:620a:1728:b0:795:1f7c:c6fa with SMTP id af79cd13be357-7952f0b88e8mr1347384285a.4.1717799110928;
        Fri, 07 Jun 2024 15:25:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717799110; cv=none;
        d=google.com; s=arc-20160816;
        b=wmr6YK7ZIu4W2942ZE1LLgbTAIP6+hbRBrUWtv6lgvzdyE5SjgtwyYT0RGvwBbMPNP
         zNGLi3wf8kKRGfk7AK29aTIrCZU9nXqlEIlFT8AFteose+cLBkDV/z4Wv4cQsMMx7fVN
         Gju45Yjmo8A2D5ewxZqxuuvvuZDIcwTuwoqh59CxVCfNQLj9IMRIkz6c229WD7r5iOXe
         DhMJCNfH8YOPRl6kVuSn4ZupZAahgBYMLTtYwEO7znvR/qis1gMPmA+U2vCJLQa3Hzl3
         wlefrZQuQoZnbuJycNtUpbAAiRSHqDjTzU5E3MZ41bjCZtnEa7TDuaf4nIEp0zPjB0Gb
         9hPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=9iiO8GYkFIJ+GAnAOFGz3z816h9B8qrJEcQYavls++E=;
        fh=VQUMc85x8ANizanga/Uk0eVpSOWbPwTPWK+d/C2OKHM=;
        b=xbuqz6V3/DE7QunqHbtHx0uvgqjz89QR/SMbKzHaSlYXA4CIoB2ET7yvwhBf0+2yTz
         JCk//KvCdhnTdHIm8TEkdB3OBtxXi5fDJzDM5BcTseWETrq+08CiNCXPH9ym6OeiSIbX
         /daF3QmjpEsz76GsFAItRiMmEJ5i+Aiu1zgmkhuBHWJqUiCjodR0y3iThAgM/Q29KKq+
         ASMLqYA2n+DVYHwbZdbQq2fwzL2iPXuCEpHfiWft0HaCY72T684KioAaL79PExa5vCZV
         3FA2CNWt/7L0IH41Jf/WzVgzfe1H4j8X/X5J4rdOHwW6qc7QruR44XJvC439DxquXRWA
         7JRw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79539ebc00bsi114741685a.28.2024.06.07.15.25.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2024 15:25:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sFaaM-0003CJ-45; Fri, 07 Jun 2024 10:28:54 -0400
Received: from [2001:470:142:3::10] (helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sFaaK-0003Bu-Dc; Fri, 07 Jun 2024 10:28:52 -0400
Received: from dedi548.your-server.de ([85.10.215.148])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sFaaI-0001o7-8N; Fri, 07 Jun 2024 10:28:52 -0400
Received: from sslproxy07.your-server.de ([78.47.199.104])
 by dedi548.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96.2) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sFaaD-0004K4-0S; Fri, 07 Jun 2024 16:28:45 +0200
Received: from [82.100.198.138] (helo=mail.embedded-brains.de)
 by sslproxy07.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sFaaD-0001sC-1k; Fri, 07 Jun 2024 16:28:45 +0200
Received: from localhost (localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id BC7A84801B2;
 Fri,  7 Jun 2024 16:28:44 +0200 (CEST)
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavis, port 10032)
 with ESMTP id ZzJMNP0hNsLq; Fri,  7 Jun 2024 16:28:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id 782A2480282;
 Fri,  7 Jun 2024 16:28:44 +0200 (CEST)
X-Virus-Scanned: amavis at zimbra.eb.localhost
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 3O3w6ZK6WpYH; Fri,  7 Jun 2024 16:28:44 +0200 (CEST)
Received: from [192.168.96.179] (unknown [192.168.96.179])
 by mail.embedded-brains.de (Postfix) with ESMTPSA id 56F324801B2;
 Fri,  7 Jun 2024 16:28:44 +0200 (CEST)
Message-ID: <cdfed70e-9dd1-4169-a73d-6a6c98c41ac2@embedded-brains.de>
Date: Fri, 7 Jun 2024 16:28:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Zynq 7000 Improvements
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240524120837.10057-1-sebastian.huber@embedded-brains.de>
 <CAFEAcA81fqWKXL_7m6LTi0-zkmtMQC0RY6_ZNP49cdWCVJK+1Q@mail.gmail.com>
Content-Language: en-US
From: Sebastian Huber <sebastian.huber@embedded-brains.de>
In-Reply-To: <CAFEAcA81fqWKXL_7m6LTi0-zkmtMQC0RY6_ZNP49cdWCVJK+1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: smtp-embedded@poldi-networks.de
X-Virus-Scanned: Clear (ClamAV 1.0.3/27299/Fri Jun  7 10:27:20 2024)
Received-SPF: pass client-ip=85.10.215.148;
 envelope-from=sebastian.huber@embedded-brains.de; helo=dedi548.your-server.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vfC4sNvyvJPM

On 30.05.24 12:30, Peter Maydell wrote:
> On Fri, 24 May 2024 at 13:08, Sebastian Huber
> <sebastian.huber@embedded-brains.de> wrote:
>>
>> v2:
>>
>> * Add Kconfig support
>>
>> * Add array of CPUs to ZynqMachineState
>>
>> * Add FIQ support
>>
>> Sebastian Huber (2):
>>    hw/arm/xilinx_zynq: Add cache controller
>>    hw/arm/xilinx_zynq: Support up to two CPU cores
>=20
>=20
>=20
> Applied to target-arm.next, thanks.

Thanks, for the integration. I did some more tests and there is an issue=20
with the IPI support. My test case worked with this change:

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 7f7a3d23fb..8d84eaf070 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -253,9 +253,9 @@ static void zynq_init(MachineState *machine)
      sysbus_create_varargs("l2x0", MPCORE_PERIPHBASE + 0x2000, NULL);
      for (n =3D 0; n < smp_cpus; n++) {
          DeviceState *cpudev =3D DEVICE(zynq_machine->cpu[n]);
-        sysbus_connect_irq(busdev, (2 * n) + 0,
+        sysbus_connect_irq(busdev, n,
                             qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
-        sysbus_connect_irq(busdev, (2 * n) + 1,
+        sysbus_connect_irq(busdev, smp_cpus + n,
                             qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
      }

This is just guess work on my side since I have no idea how the second=20
parameter relates to the pin.

Originally I used the hw/arm/realview.c as a reference, but his target=20
doesn't use the ARM_CPU_FIQ at all.

--=20
embedded brains GmbH & Co. KG
Herr Sebastian HUBER
Dornierstr. 4
82178 Puchheim
Germany
email: sebastian.huber@embedded-brains.de
phone: +49-89-18 94 741 - 16
fax:   +49-89-18 94 741 - 08

Registergericht: Amtsgericht M=C3=BCnchen
Registernummer: HRB 157899
Vertretungsberechtigte Gesch=C3=A4ftsf=C3=BChrer: Peter Rasmussen, Thomas=
 D=C3=B6rfler
Unsere Datenschutzerkl=C3=A4rung finden Sie hier:
https://embedded-brains.de/datenschutzerklaerung/
