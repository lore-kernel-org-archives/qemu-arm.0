Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp729720lfp;
        Thu, 23 Jan 2020 06:34:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqxoaWDCICD8i4VYHzuEBqFAyU/Bs5zpigkWt19YLQgCmdi59QrAb0SuHEVn57k53VnQx/i0
X-Received: by 2002:a37:48c4:: with SMTP id v187mr16241606qka.198.1579790078826;
        Thu, 23 Jan 2020 06:34:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579790078; cv=none;
        d=google.com; s=arc-20160816;
        b=kMX3tM4lfEdZWDW6ETGc7AQGWSxwhmMKS5ZY3FtjbEoK6jEwI88DSEqdEP66DFHOCc
         0anWQQqNmFGuA6yuowSqlmHUIJ4GYpxzLQQRziubrM599vqjPz9Fp3bjgkwqUweNzo7U
         hkWxbzkaf3O3s7bH8OCh61gVNr4wmyPPvT8+dHfkA/QRkgCeF7rQ9dG5iyaJ5w/w8rqf
         4wKpX3sS0qDK5x4rk9W/7Uxk3HhWL4IDIw0i9psuE4xJaMVs9288vZ1PziBF5n7YADEu
         DysQ+bw0XO1nL/UdEZG29Z6gDlEz8KDdwtQUsO2vEQZ0R6oU5IltEHtHcJQcAivAas89
         DmvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=x1zPMPRwH8V1NuBAfOtzpPIFwMe/8BZ49osDpSQatNM=;
        b=meKkncAwNMJsgCcPNYXzC8n5NuSY/I3RXE9buDVK0LOTHqcw3JYk30PARQ9NOhG10J
         ZpGfVXE0QzljqXtCkhO0s++WuN3UwYEvDT3tSAzGnB5yx5QaVi9ba3Abt5sS47OJ+WUK
         Y9ZsJvmV92lmbHAlju+W+yJaSerGPWpFiuS45qW+xWGYpzw9lcgcczY+usgL2G1RKetS
         oP8vLrOkfOVnpIRzk5sE7/c7ZPmgc+O5J4DWRp60t1zgCFFIK4PkRr8rSyZfS8lZBcBt
         0LIpqEeq2UxIYgG5dZW8ngTdUmRfkWTECf//pFw56rqOJ+QR3hAzhoamjHDpcGnmP2nQ
         ms4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b="KgS9T9d/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j74si1701206qke.111.2020.01.23.06.34.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 06:34:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b="KgS9T9d/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iudZ7-0004cV-HH
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 09:34:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43561)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iubHx-0004S8-BX
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 07:08:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iubHv-0003mF-4X
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 07:08:45 -0500
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:34234)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iubHr-0003ju-U7; Thu, 23 Jan 2020 07:08:40 -0500
Received: by mail-qk1-x741.google.com with SMTP id d10so3157571qke.1;
 Thu, 23 Jan 2020 04:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=x1zPMPRwH8V1NuBAfOtzpPIFwMe/8BZ49osDpSQatNM=;
 b=KgS9T9d/GluJ10UYL+oo5SyszfczX1DhWYTHmnoORj1vZG7ic5EWgKq69S2tT4ccMK
 L4LaKxfWnCr+lghuE56yGl2oH6jnhiekEF0wLNmbxl3MV9EYIJjHF8MPHzwLuE+n8smC
 +9Nh7sGNHTOmvOMyK4by8Cssddje3XudMm4vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=x1zPMPRwH8V1NuBAfOtzpPIFwMe/8BZ49osDpSQatNM=;
 b=fb4JhPB5g/B/5GEUQt0vHaE0f6aWlwn6Z2laMLQYYPuwbNXPShIYxx2iYIxGxoBbBJ
 nqJ881p2RTEC5hKfJ07shanMYH086rE99nauJP6dE5YBxEeO3COp14uRRbSXMJs/WeR2
 ebGd6zPVKepFPYHnnDiVcehbjqGQUaao35D/3RVunzue5pUbwIX0vEOlunOnY56Yz6h0
 SCf40NkDJG38Zy69jEkFqZmH/Yps0R0+ivTCdZBnQrDOBzZNRZx2YE/o7dnYDGm7VXMK
 oAMObRewoeJLCEQ3YXA2LZ8zRefGqX6tWrr+kBQt8IEeHTKMLRi8+dEGzp+aOBGgBm+v
 KSqw==
X-Gm-Message-State: APjAAAVDapHJFkSP9quCPyyi4hgq4VUvl+5I8cmBKTTIc4/3OPHa3wvj
 YdYCW9eGnn81jTXl37W6I+dpRKH4sg72uYxkjnc=
X-Received: by 2002:ae9:e702:: with SMTP id m2mr15282686qka.208.1579781317185; 
 Thu, 23 Jan 2020 04:08:37 -0800 (PST)
MIME-Version: 1.0
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
 <1579779525-20065-9-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-9-git-send-email-imammedo@redhat.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 23 Jan 2020 12:08:25 +0000
Message-ID: <CACPK8XfpFrpRgP6LyWv8AxJdjYTGLGRfzgDNxommBLNfV3mtHQ@mail.gmail.com>
Subject: Re: [PATCH REPOST v3 08/80] arm/aspeed: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::741
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8BozLAYaAVUb

On Thu, 23 Jan 2020 at 11:41, Igor Mammedov <imammedo@redhat.com> wrote:
>
> memory_region_allocate_system_memory() API is going away, so
> replace it with memdev allocated MemoryRegion. The later is
> initialized by generic code, so board only needs to opt in
> to memdev scheme by providing
>   MachineClass::default_ram_id
> and using MachineState::ram instead of manually initializing
> RAM memory region.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Acked-by: Joel Stanley <joel@jms.id.au>
