Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1538159wrq;
        Wed, 23 Oct 2019 16:08:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwekMN8AMX6eP93hcjytN7Pl4anRgYAa2HN3pD63+mdzj6MwP8SY8lmfKjlyvfQQA9vqUfa
X-Received: by 2002:ac8:75ca:: with SMTP id z10mr1189846qtq.260.1571872080195;
        Wed, 23 Oct 2019 16:08:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571872080; cv=none;
        d=google.com; s=arc-20160816;
        b=i/b/fjHbSJel1kClrOvzoVbbLtLZFb3bkxtK7WYKgUWDVUtjshGRv+kdDdYV5fyHwq
         VNn/I2HcP08w5WG4jkHBZMc1TH3AHlTPXK3CIads9Nnxv6tWy0lB5HvP4L+8D3J1sJ13
         V0ISEqsg7JPIjweoAQkBPtaACwUuTXG2AztagDXOW9bt5C2GYswhskbpwGWvnqOs8o2v
         uWDi8O6F8zdvll77ZelKL6HZxfmTmoLdllrPdIZOIMwlJJlBQR41BrfhLfeNZnAl6BN0
         wHgdLZXMB3Qkr6J7Q5izuBVR6wh2TcaKjp44r5/y14BPSyAmhltIAA5FgPKEByQe310q
         A7Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=QAjo76a4UBbrFj2wErT73K6tOxe9SVqDxVSMRCo1I9w=;
        b=msnocacYlCOeFFFdeq4WY1t7vADFjs2HVbZmakuSEZOMYj2hZrSghvGL/Emj/YevAZ
         8ZM19J1LDoVp2H0GUAHSRbaWYIOz2lly5SJ80+6SXDQr6B9NTymYF5gnzwc0I6ruDRhi
         Z7fOe7tpfDokWGJ2XJaY3ZS7enR2bX/pA9lbdahSVrP+/GY56vYq7O8lBZBi9zwQwKbU
         hzWZKeITNExhiYoeCQU1QhS7Yxg4OjnBAEg9CCuKNjEb95dMK1ES+HmLjxBoQlBhyEF+
         3JYU4NmWytYcjchiIhDcYW/efbftfte59Oi0WNPWaHIo3caQPzbLQIiIUdHiuFafscJz
         IfvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p26si19527696qkj.97.2019.10.23.16.08.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 16:08:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNPjT-0007Ei-BX
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 19:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33220)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iNPjG-00075l-Mt
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 19:07:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iNPjF-0001uu-IX
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 19:07:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32970)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iNPjF-0001uH-A4
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 19:07:45 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1114859451
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2019 23:07:43 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id k10so2765425wrl.22
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2019 16:07:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yBnIzIRWnC1PwBFYZOLXIfan46JBj2GdcoEJiFRPnSc=;
 b=hz4pP3rkBDpf6xfCEz3JQ/uR+44IwoQRKIGvytaq2dT/4a51EGc86kmLaFA28Hm9Gk
 xHafuWvLHMPfsTLDBa5NE3xV6NZngRV++8cQKQ4KCsI7arYqsXiPgCZig654CCeGhBtf
 Gnn6omcNMl+S/P1zDyWnVgx+f5eZe9FbZCuRTJzejXTc6r2GD0h2T8POLwJjTwGoI/Z8
 3bmV2Hx8xaECe1WT65WmBa5dx1A8k6p8OPhOasCWvvUMaij1a1c2T1hpw1VPAbTs6lCo
 sxMqiDG0OAWpJh4nnsRpJ6yyH96wF0dOGd0LjXoq/A2gYbyywL03REUKfn/NoPyrMEet
 hvMg==
X-Gm-Message-State: APjAAAW8bwi/SktyCgzdSRjS+i7OAeX6GKbKNvnHbJE93UfP8rv62GCM
 rnAc2y3LUuRhYndh+V563VNuwr+BOapK054sRqi1Do6sVqDm18VBlORFVPmRn5vcLwkj8Ag69sG
 OnWAJHbnqjBwa
X-Received: by 2002:a1c:a849:: with SMTP id r70mr1908162wme.59.1571872061821; 
 Wed, 23 Oct 2019 16:07:41 -0700 (PDT)
X-Received: by 2002:a1c:a849:: with SMTP id r70mr1908123wme.59.1571872061501; 
 Wed, 23 Oct 2019 16:07:41 -0700 (PDT)
Received: from [192.168.1.41] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id n1sm27987009wrg.67.2019.10.23.16.07.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2019 16:07:40 -0700 (PDT)
Subject: Re: [PATCH v3 32/33] qdev: remove PROP_MEMORY_REGION
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-33-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <93780bab-1ae4-19e5-7ea8-247803f21cac@redhat.com>
Date: Thu, 24 Oct 2019 01:07:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191023173154.30051-33-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Magnus Damm <magnus.damm@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-ppc@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabien Chouteau <chouteau@adacore.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Burton <pburton@wavecomp.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3Wt4zlDWE8/G

On 10/23/19 7:31 PM, Marc-Andr=C3=A9 Lureau wrote:
> PROP_MEMORY_REGION was a derivative of PROP_PTR, added in commit
> ed03d749f3f513b8fb0287757cfda2cb6825f063 (qdev: add MemoryRegion
> property) and thankfully no longer needed since commit
> 3eff40dbf44896a8180c86c84dbdefb2eb173fbe (hw/misc: Remove
> mmio_interface device).
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/qdev-properties.h | 2 --
>   1 file changed, 2 deletions(-)
>=20
> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.=
h
> index 690ff07ae2..5bba033b7b 100644
> --- a/include/hw/qdev-properties.h
> +++ b/include/hw/qdev-properties.h
> @@ -213,8 +213,6 @@ extern const PropertyInfo qdev_prop_pcie_link_width=
;
>       DEFINE_PROP_UNSIGNED(_n, _s, _f, 0, qdev_prop_blocksize, uint16_t=
)
>   #define DEFINE_PROP_PCI_HOST_DEVADDR(_n, _s, _f) \
>       DEFINE_PROP(_n, _s, _f, qdev_prop_pci_host_devaddr, PCIHostDevice=
Address)
> -#define DEFINE_PROP_MEMORY_REGION(_n, _s, _f)             \
> -    DEFINE_PROP(_n, _s, _f, qdev_prop_ptr, MemoryRegion *)
>   #define DEFINE_PROP_OFF_AUTO_PCIBAR(_n, _s, _f, _d) \
>       DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_off_auto_pcibar, \
>                           OffAutoPCIBAR)
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
