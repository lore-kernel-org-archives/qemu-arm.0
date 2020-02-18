Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5935651lfp;
        Tue, 18 Feb 2020 01:39:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqwcqUCbJ0HSgJATZ2XckOTykwBPr73JfOQOwHIXZOIDT48m6T69W6lv/dOi4M0iZNgFu90O
X-Received: by 2002:ac8:1415:: with SMTP id k21mr16885817qtj.300.1582018793702;
        Tue, 18 Feb 2020 01:39:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582018793; cv=none;
        d=google.com; s=arc-20160816;
        b=C2zabBn8sdw58TgGhkzCvpVx1E87HeSR2xGWUFD4I6raoEXIogHKDxcIj+nOM0vxXy
         AANT7o/HRTqXxR9hSyGszSB2yxKw5MzPeu34apVfMq3NI3G77toG9/m/NU2PEc9vTPOJ
         lbZEISISeCaWnpuuRvFAKd83+p45bLtlia5FuW70iYVgwbVU6i8SDcbOscWCtO5LPJVh
         jSTYNSlrJvVE14xJGWyXFMOW2Sol2abhmVzJaKQ2lw36eoFf17QKXFig6dkSRzslvbrO
         Sfi5L2saB4WydrmDdaobWSRPpQlV2WLbDMY8O5kVnb8UoXhawHQkq65ICJDeA29fuycc
         tUXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=SDpZh9t8LLET6RXRGhAckHvfEVt6l0LA4TOOOjdMTRY=;
        b=ZrAe7Kk4TU7xsxqTIubzlk6G3Ah/EOymDFqb9JbjrmYPqjxOvVymPbo47cf53Anina
         YNCg06M4BAx0ruHbIw4AyYDK6urSg98nVy8QDyY5jWgkUM7DeSIWOynr3VoG3aY9NKaX
         pvMGB7hr3qT0jN+tDZeDJIMoM6Axwf3/D2eHtHMBbiDq5Pqga5Z3hjM3CLNj7bLltzby
         BPPGFCcmhMN279VXXchO16PzVQ8R26dTyUOpCtA5Y7sA+IvlQcRsZ7QRqAVgoW/TSmb1
         NZu64OZFq88zCLdC/slVZ0JMcGJbof5TI5RpKudSd7EWxlcG0ICUx/87MjH7T5cpKER8
         6KKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Fspnfxs3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3si1465010qtv.203.2020.02.18.01.39.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 01:39:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Fspnfxs3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zM9-0005Fe-5E
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 04:39:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42481)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zM0-0005FQ-67
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:39:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zLz-0003nL-4F
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:39:44 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:26813
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zLz-0003mu-0h
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:39:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582018782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SDpZh9t8LLET6RXRGhAckHvfEVt6l0LA4TOOOjdMTRY=;
 b=Fspnfxs31zPemJqZcLbCCEUiK4iMqizuQvoY9YcMUtNYs4YO21YCkQzjHvZFd95vbu44ND
 vCaTU8d721l1bFT81LNtfaOsHH2Ddqi/XgZAFsWp3LB1D5bILl4NT0vijdXlpiMALHYv40
 3GljM5fD8gvgyCjuKdC6WxvlGrxoeKo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-A56LjojGPgeJR7-iR2gW4g-1; Tue, 18 Feb 2020 04:39:40 -0500
Received: by mail-wm1-f69.google.com with SMTP id m4so873992wmi.5
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 01:39:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1g/C6QYaKp+orHyEvN3jLzhLeWKUCNsgpCmrU0OhnIk=;
 b=hivI/zJXa6TBE4vu+T190Odcl8Dv7A2G2Khn6yaj9jlfNMHEAb+xHh484iIpFwVLoB
 MRcxOnf2Vyvqh0poL2bb7knVe3Ot8pj675IvtmEwddKnn5w4/Gy0F/PcBD8+u0ClNvr/
 lT4bRBUrZCqsqQXps/Uxd64aC9IpQaqigrjs4ZPgcYBmSBNqUmi5Hx6jit6H1QVUBrTa
 rcDQ4nd9lVKvO6OZL/Vmsd3MOa/Q5sFgjlLHc8aeSgAacidccO85yM6DNYZAb2HDt7pA
 B++p9l99FHQnCwJLQBEd+/ifo9J5fitIBCdoVfzEb2lDwdw3C/ZY+kobMRkfKaB4T7hS
 WIHw==
X-Gm-Message-State: APjAAAWyjhEiN6baNuW4npUmKlLHHZ/OZt2X+KPzgq3vXNSFmKufWvMs
 4dNQoLLlpvZBvNSbWrRE3XJQ9QLwIrduJe90gelHOArXTcTU3lGlwS8qN7vmkCDfsbbcVkcicTy
 3o2ZshWnTyOVB
X-Received: by 2002:adf:e3cd:: with SMTP id k13mr1489912wrm.302.1582018779810; 
 Tue, 18 Feb 2020 01:39:39 -0800 (PST)
X-Received: by 2002:adf:e3cd:: with SMTP id k13mr1489862wrm.302.1582018779527; 
 Tue, 18 Feb 2020 01:39:39 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id k10sm5362253wrd.68.2020.02.18.01.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2020 01:39:39 -0800 (PST)
Subject: Re: [PATCH 00/13] trivial: Detect and remove superfluous semicolons
 in C code
To: qemu-devel@nongnu.org
References: <20200218093217.25156-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <11b9a381-b0c2-1817-bed5-d00f000b5af5@redhat.com>
Date: Tue, 18 Feb 2020 10:39:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200218093217.25156-1-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: A56LjojGPgeJR7-iR2gW4g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Julia Suvorova <jusual@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sLQWhy5Pa59E

On 2/18/20 10:32 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Luc noticed a superfluous trailing semicolon:
> https://lists.gnu.org/archive/html/qemu-devel/2020-02/msg04593.html
>=20
> Prevent that by modifying checkpatch.pl and clean the codebase.
>=20
> Philippe Mathieu-Daud=C3=A9 (13):
>    scripts/checkpatch.pl: Detect superfluous semicolon in C code
>    audio/alsaaudio: Remove superfluous semicolons
>    block: Remove superfluous semicolons
>    block/io_uring: Remove superfluous semicolon
>    hw/arm/xlnx-versal: Remove superfluous semicolon
>    hw/m68k/next-cube: Remove superfluous semicolon
>    hw/scsi/esp: Remove superfluous semicolon
>    hw/vfio/display: Remove superfluous semicolon
>    migration/multifd: Remove superfluous semicolon
>    ui/input-barrier: Remove superfluous semicolon
>    target/i386/whpx: Remove superfluous semicolon
>    tests/qtest/libqos/qgraph: Remove superfluous semicolons
>    contrib/rdmacm-mux: Remove superfluous semicolon

Series incomplete, git-send-email aborted:

Sent [PATCH 00/13] trivial: Detect and remove superfluous semicolons in=20
C code
Sent [PATCH 01/13] scripts/checkpatch.pl: Detect superfluous semicolon=20
in C code
5.5.2 Syntax error. v8sm5146891wrw.2 - gsmtp

