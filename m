Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1531845wru;
        Mon, 16 Jul 2018 06:54:00 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfYL77ZLnlzEm6YsodZu0j8v2zi9bcDDbD0gAdMXTOm3r69/kIVpqdo3Ph8LLvIkWOPbpAf
X-Received: by 2002:a0c:8797:: with SMTP id 23-v6mr18217331qvj.202.1531749239966;
        Mon, 16 Jul 2018 06:53:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531749239; cv=none;
        d=google.com; s=arc-20160816;
        b=jiHeRGZCF6z1LXu8kNACjM7pfQC4lUSZ5lafHjVdRAbAV4r/MSpTw8nrmcBEfDu7Aj
         oX9Cwy4YePcfXfKgA4q0Xs5lTk6SEO5G3KU4+H+zJmI+k5nhuQ1MGN0F7JkcWT7BkgE4
         5sJsJfxVwPIlfHzTmO8jCeOWofK7NDXARLrSbGxnDd0jla45RORG2rgY+q+Ra4I24bGV
         /FhQHYbfR/mCEU098d3rf5ydJxjV9QjBm8P3ClHVk69NtJ08qyL1p1PN1Z9PD6274gcI
         yAKcqoDkf/U5kMDTd8Ix1H7PiwQuuFji/JCZSaQMRFc/pQQuaWdNC3js1DHlDUX35aUh
         V0Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=3l6TyfAz9zz3vj0FP29i7kaj3q7U8QPAsXfGFoordbk=;
        b=TJpAJciNQGhvvvWvDIeq+xMVjGR8gJL1BjbqXtJxEESdjSEkIHTVIxoFTIC7f0s/aW
         lglMYX3MG6X/x0MqhU0tSDsxA0tTC3RI9+S3tobzC0UOmbTKZzYWkm9HjRRioHzkF24n
         bzGrCWbPFy55m2eNsNnx9/+0r7LpneZxRxwQsbLnBjDxeFZ48h8vqbgrNpr/gvKRXOeK
         TNEv8gafpXBYFNJBQhduhAsxRjB6mwMVVmyM2lGJ2VR052fK9YkvSCgsaKbQlWDLEWd0
         6jwr0+X/sQFeg8Ri0x4uldeRzpy9if0WS20Ky9ZRX4kOMzpjPJG3XfTZu+a/KqlT/m2c
         cYSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qx9pKG2d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m62-v6si8005993qkm.98.2018.07.16.06.53.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 06:53:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qx9pKG2d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51875 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff3wt-0006Tg-EW
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 09:53:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59712)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ff3wF-00069E-9N
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:53:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ff3wE-0003DK-3F
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:53:19 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:45530)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ff3wD-0003Cu-UN
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:53:18 -0400
Received: by mail-oi0-x241.google.com with SMTP id q11-v6so49320540oic.12
	for <qemu-arm@nongnu.org>; Mon, 16 Jul 2018 06:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3l6TyfAz9zz3vj0FP29i7kaj3q7U8QPAsXfGFoordbk=;
	b=Qx9pKG2dRyXqdeBIhbY4ikZSMREGM9VgJTKH9XT0LXTOmkFlB5inWQOykndxM0LMBk
	ijPHOyzMd8oPN6J8ofteZ8WvpFn1hlAu8Nh1N6qhHa46yPRaAhQgWcwlRuyJUiv5GeQC
	kk1aNhuJ9FI0bH4uOTCMBNS296zGJmKHewf8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3l6TyfAz9zz3vj0FP29i7kaj3q7U8QPAsXfGFoordbk=;
	b=QSyvFe8oHLhuk1Kbr2AAW7NrWeA5yoh3DVLpHm6dMEu4OGKv6luHIdRym/Tm5f10WK
	0VXtRFoY4/zlofdeibnRrN8PAPnvf783GGuFdfJkuEvYXiU+wo2nVYR7Sky+Lq9uqOa4
	0EoCFln2QlmxjFb0N9Q8RrDu4ahtAx2u40fDyNoEeZQO0HxavbpvwLV5IMjImykABsxw
	e9xGakyQGeFd0ihVQispi7AjMvv2qyYkFgwORJhA97wIUEX3o3E/tLMyq5ZEKDLp+nVs
	wVk20JE8/A/Is83amSFA6eT/1eZ+BEfFg075DUxDs9IErSFgK0VrUmDXtMnr7WCEzIU1
	xmQw==
X-Gm-Message-State: AOUpUlGps0nu8YA/aWP7/fp4SfylKe2Iol1hEBeNWyC/njUHC7FIN4hJ
	WlIu5bQ6CSnC6s+cM/qaLXKnlmPQeS0WbdJuuvmV9Q==
X-Received: by 2002:aca:7247:: with SMTP id
	p68-v6mr19082809oic.252.1531749197253; 
	Mon, 16 Jul 2018 06:53:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Mon, 16 Jul 2018 06:52:56
	-0700 (PDT)
In-Reply-To: <1531745974-17187-16-git-send-email-thuth@redhat.com>
References: <1531745974-17187-1-git-send-email-thuth@redhat.com>
	<1531745974-17187-16-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Jul 2018 14:52:56 +0100
Message-ID: <CAFEAcA_c+sHPzyDzmh=Np-FYeGQiHcQTX8UeGVrO=DGhAeWskg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v3 15/17] hw/arm/stm32f205_soc: Fix
 introspection problem with 'stm32f205-soc' device
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jAXkwVq+UNXp

On 16 July 2018 at 13:59, Thomas Huth <thuth@redhat.com> wrote:
> Valgrind complains:
>
> echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
>  "'arguments':{'typename':'stm32f205-soc'}}" \
>  "{'execute': 'human-monitor-command', " \
>  "'arguments': {'command-line': 'info qtree'}}" | \
>  valgrind -q aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio
> [...]
> ==28531== Invalid read of size 8
> ==28531==    at 0x6185BA: qdev_print (qdev-monitor.c:686)
> ==28531==    by 0x6185BA: qbus_print (qdev-monitor.c:719)
> ==28531==    by 0x452B38: handle_hmp_command (monitor.c:3446)
> [...]
>
> Fix it with the new sysbus_init_child_obj() function.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
