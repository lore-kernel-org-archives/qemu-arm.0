Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp372902lff;
        Wed, 4 Dec 2019 01:09:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqwu/IglCtwiARGAAF5gNIOhBh/QJ3ZJmia9UfW9wOm9WQxNSm3fHvSIVjUIekhSsRP06B+O
X-Received: by 2002:a0c:964f:: with SMTP id 15mr1785553qvy.64.1575450575228;
        Wed, 04 Dec 2019 01:09:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575450575; cv=none;
        d=google.com; s=arc-20160816;
        b=RCo3hWXR3pcuhN752rKfT5V0Lh6iWTBGGbTwn2XTkVHKat5SBOdNguvXt3PkwoF9Gq
         uwgmltDaxj1h7fKxBvhsPZT6aaWGC6Cnnh9x1SdIGCRwUFA2aqQuzOUwELD29ljyyd3R
         NjQW8S91OGkdfo8CWOdVAU05c8v4ktj+eV+ADPjGQQY6aQp4w58lQ0pq7XkmTw+BQgDg
         zl4M6mPDGF9SVCXmEHi1TCwXxjn/iWum5P+zPDcCjSEVx+c7Z+NQ1ZJikhmy+XTuCv5x
         h4BjyU7Iectee29tY4vM8c+o6LjJXppu6Xtaq5wyeepYNVBQC9A3b7cbXAYD5FLLBLfZ
         Uw6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=AunsICv+tc9ByKDHB67N3AR9wBDUA6R0R700dp0nRsM=;
        b=0Unbbsd7DJ/l4NmC1xM2oSX5JBBhMS05ge8sWr8EfqRKMYr8WKvP1/qBGJqTBMVB4v
         a99WT12QPD410CWZmfsgnk1UjK8peHaopX1CVGFNB0WQ4VDJFptdC+BsIDwbA59JCAJt
         zCZkV4GOxNSv3WjAlCKTEecd0WWd2dyJBcvOb0XdCaQJ82k1juIKITnvuzNx2/GLPIi1
         mmlOyxAsoe0FKeiweeIdSUc8VwUyAg3ANSm2dpTcNVdqgwbkDpc/qI2enGptSVxNg+zU
         57yqbHeX9TRnjEK1opuSnvrmnyweeE58oE8cGo10MHj1t8c1qsTMXJXzIIomyJuJ94a/
         BJHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EGMbAMvp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h20si4221611qtc.100.2019.12.04.01.09.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2019 01:09:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EGMbAMvp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1icQf1-0006v3-Lk
	for alex.bennee@linaro.org; Wed, 04 Dec 2019 04:09:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55614)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1icQZf-000546-1n
 for qemu-arm@nongnu.org; Wed, 04 Dec 2019 04:03:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1icQZ1-0003T3-Nn
 for qemu-arm@nongnu.org; Wed, 04 Dec 2019 04:03:17 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23793
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1icQZ1-0003Gb-IY
 for qemu-arm@nongnu.org; Wed, 04 Dec 2019 04:03:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575450192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AunsICv+tc9ByKDHB67N3AR9wBDUA6R0R700dp0nRsM=;
 b=EGMbAMvppCmIwv1ljLX4O//IBwiSUKFK+pTFPBAoOI18E2dZkAKcdT6vmwCtzmGw0azT0L
 58PibU8leCvVT1Gk9nEjhHxLWKnA5l2BtvQZEHMvAMh/wC8A4Wy23wtIAlgDY5A6w0s9uU
 2inse8Mf+/68wn5Kv2ZDiUu0BS8X15o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-4h6D6CPFMNGGCRpIfnCnGQ-1; Wed, 04 Dec 2019 04:03:11 -0500
Received: by mail-wr1-f69.google.com with SMTP id 92so3329036wro.14
 for <qemu-arm@nongnu.org>; Wed, 04 Dec 2019 01:03:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AunsICv+tc9ByKDHB67N3AR9wBDUA6R0R700dp0nRsM=;
 b=SWJuBONDCkNplJHaKhqmqc96DAM3x4kNlx1vVxTyUGr6qEKmsxNv4dMq0BG56gkGI+
 qtqY4H7+ag4bldVWsK3ljqtsoEC7R8LlPYz2ZoGH47ZgrlNe2akoKxWywOEYNjT32dHQ
 B/vJZOBpRGQAjhPeq9CCN1nLBo5lQFcOUmZJ2tq8vDGsCOsdAb/YxjKsnAvbvF62N2Rm
 Wi0nj7NT9/MMfmllNCaFJmqDF80ku/BHQmMG796RtLELlYYy9ytNisZEn98FXCUKu7VK
 WzoQcDwmI3xfNUBKg0/+N0BN3lIGtBnIUSctduqUjN6bBN0MYbA388l2n3WIlS7hcWmP
 i5qg==
X-Gm-Message-State: APjAAAUyTEHVn/uNlbZsXUIIZl/JqrQg9JnOgG3YK9o4PHYXevYhJZd+
 WKKTBWvEIziY9TaIVewCsn4MJkGvXU+IWOik1ZGM089/funengA5Lw9YbuAb+M9JUrfxCJs1uJO
 NowH0tzMpORQs
X-Received: by 2002:a7b:c004:: with SMTP id c4mr37831504wmb.45.1575450189753; 
 Wed, 04 Dec 2019 01:03:09 -0800 (PST)
X-Received: by 2002:a7b:c004:: with SMTP id c4mr37831490wmb.45.1575450189566; 
 Wed, 04 Dec 2019 01:03:09 -0800 (PST)
Received: from [192.168.1.35] (182.red-88-21-103.staticip.rima-tde.net.
 [88.21.103.182])
 by smtp.gmail.com with ESMTPSA id c2sm7263359wrp.46.2019.12.04.01.03.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2019 01:03:08 -0800 (PST)
Subject: Re: [PATCH 02/10] hw: arm: add Xunlong Orange Pi PC machine
To: Niek Linnenbank <nieklinnenbank@gmail.com>
References: <20191202210947.3603-1-nieklinnenbank@gmail.com>
 <20191202210947.3603-3-nieklinnenbank@gmail.com>
 <b14e5a75-ebe3-311e-60a8-3f71b0874a10@redhat.com>
 <CAPan3Woz7+1K9Yth6MfHqLfjcDMh8xGVzTShN7gi3XM8W_BNnw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <239606dc-3545-c3f7-1e11-429f53994147@redhat.com>
Date: Wed, 4 Dec 2019 10:03:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAPan3Woz7+1K9Yth6MfHqLfjcDMh8xGVzTShN7gi3XM8W_BNnw@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: 4h6D6CPFMNGGCRpIfnCnGQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: b.galvani@gmail.com, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LpnF084ndN6i

On 12/3/19 8:33 PM, Niek Linnenbank wrote:
> Hello Philippe,
> 
> Thanks for your quick review comments!
> I'll start working on a v2 of the patches and include the changes you 
> suggested.

Thanks, but I'd suggest to wait few more days to give time to others 
reviewers. Else having multiple versions of a big series reviewed at the 
same time is very confusing.
I have other minor comments on others patches, but need to find the time 
to continue reviewing.

