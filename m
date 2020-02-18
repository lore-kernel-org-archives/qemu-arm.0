Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5937414lfp;
        Tue, 18 Feb 2020 01:42:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqz/OtYVeg3pByJsF86rCRX0DHQV6lANclqlcDr4pUc2EubCFIZ0zi1cCYjJGoPqmzCyMMO8
X-Received: by 2002:a37:2f41:: with SMTP id v62mr13210911qkh.245.1582018939681;
        Tue, 18 Feb 2020 01:42:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582018939; cv=none;
        d=google.com; s=arc-20160816;
        b=Eoxd18pTS+CF6XfmhPY2LNmZlsUDzscgmXKcM3rEsQjChvLQpH6jzUa2DvPDwzd4Ku
         yUoCj9yJ/eb2c5bMhDz7u72jRIJNfP+YGmASD2DNUN1QZyk1sMHumfxATy/aaRQgGV3P
         i1lG5xpdC3qjVS9SJHOaKEpfXDzF1fxHGIB/S3Rt8DjyCNVA4w6WjtEHzzblQfCkNSEH
         HFOu6rDm1I2XuROeGAEe90kmYcOq1ef3U7T/8MfT6r/AZUszteOv/OqOjEh2IsDO10us
         7vjhos+T+T1yuDROh+muhWRdO0uex9TjMklJsK5rrsjWWTDEZ9+rU65Q8HU3znuoH4gS
         8m/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=2lRg00utCoXLvEMHvhnMiAsgpOV7NsemGMGxrPmPJgc=;
        b=YOYDbYYRIgpUIrkeFH923+Ps+XNvij108ZBlJyGFrOt5xyzzm8u5EiNz8ywVVhYXWG
         9PB6543Fo9zKt3PxqohUTBZuY85+utQ/FT2S5FiUIBA/OOV69b/brXqTcehieNdTTvQ4
         cXKPb2i7KNzbtCNhL5whyCbe8C+8W5htqbPg2SZ5HxAC/T+0xBQfF7MjnhO7Xd8YOHxW
         1AjWPW3ACgF/An1+C9dU3YClnbypUzMYQ6Rbks38BzafD96tWTb6Z0Nl0U8V27niVCju
         oWZt6eDYCz+bHTqwf4/wISkmzILXRa76MCIg4q5Pwxh6PP/8VoPcDRkRFoW/JdHkEotg
         wcBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Jsryhc4I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11si1434800qtn.237.2020.02.18.01.42.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 01:42:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Jsryhc4I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zOV-0007sQ-38
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 04:42:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42805)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zOK-0007p7-8O
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:42:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zOI-0004ot-W6
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:42:08 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:58003
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zOI-0004oQ-Sy
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:42:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582018926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2lRg00utCoXLvEMHvhnMiAsgpOV7NsemGMGxrPmPJgc=;
 b=Jsryhc4ITHL/kbxAtkDNy18X1j9G9xfZUUBu+fIxmT7SjbmEmfu37w1UyV2k3kBlLl9s8s
 sgVqqi5SNZc9WyEQGkN6rvs2A3vlLzAsVm4pw/Ve9uZJt6TeQxDb+3Ok5WuQd8xs9v3F9E
 hwVvCFlFOpGY/PMtJDWniJWPLmI5iqo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-qWJh1a65MwOGR6C3BoLQxg-1; Tue, 18 Feb 2020 04:42:02 -0500
Received: by mail-wm1-f69.google.com with SMTP id 7so781415wmf.9
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 01:42:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=66Ntbv0X0m09s77Ux7unmL4nTH6VUea47MP7vHegJxA=;
 b=dcvad6b96J5LA6UVRKoW7UXaHV1zVsnewiIk9X03ojGFvd7M4IP91YdBw4VWvxj2Qc
 H2aIwO96QMoNyEMprHFF2zvKXqnQDe5x7NztFE8sM5bcx4z7lEqDzaQnjfh9w5qnItRk
 w5EPfqqo3xegBjCsx9qwPpW6DNkzbxonAyl1tIsVH4PMeEDecEZ2Dmf+xwEkubnY/yCj
 Vh+f40xOU/XdvzVxkrSQGRTfIPun9IHbT2uZhJcgS0DrXuu8oIF8twwY56NYKkA0fq3I
 zozykY6AK7UHfruyId+0wEqrIngQdUb/j0q9ck3ObsfT8Nq12ob8IcLs52WrmZXB9cIL
 mQaQ==
X-Gm-Message-State: APjAAAUMlpSALC4a6gUIzOZcVk++ZwIFoMwd9cmvB/JUFRBGs8LlxEDN
 vOYK/qRGrjuScW+E1RHJc0XwT8g62CKCvmQd1TVW3v7pau1aQwsfd5NW/DauWDhUe5yxkUSR6xc
 b3uN0HiMfHFR3
X-Received: by 2002:adf:e2cf:: with SMTP id d15mr28157535wrj.225.1582018921241; 
 Tue, 18 Feb 2020 01:42:01 -0800 (PST)
X-Received: by 2002:adf:e2cf:: with SMTP id d15mr28157498wrj.225.1582018921011; 
 Tue, 18 Feb 2020 01:42:01 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id g21sm2788515wmh.17.2020.02.18.01.41.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2020 01:42:00 -0800 (PST)
Subject: Re: [PATCH 00/13] trivial: Detect and remove superfluous semicolons
 in C code
To: qemu-devel@nongnu.org
References: <20200218093720.25640-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f4133050-49ad-f517-740b-1460e88ed79e@redhat.com>
Date: Tue, 18 Feb 2020 10:41:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200218093720.25640-1-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: qWJh1a65MwOGR6C3BoLQxg-1
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
X-TUID: hRPtQknQWTp2

On 2/18/20 10:37 AM, Philippe Mathieu-Daud=C3=A9 wrote:
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

Please ignore this incomplete series, git-send-email aborted again:

Sent [PATCH 00/13] trivial: Detect and remove superfluous semicolons in=20
C code
Sent [PATCH 01/13] scripts/checkpatch.pl: Detect superfluous semicolon=20
in C code
5.5.2 Syntax error. v8sm5146891wrw.2 - gsmtp

Offending recipient is: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gm=
ail.com> which=20
probably needs quoting.

