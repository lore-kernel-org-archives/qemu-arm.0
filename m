Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3433460lfm;
        Sat, 4 Jul 2020 08:57:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9+OVuTNuPzuwijPN9CXt9ob1CkamBqhls3IoSdYxC97rx4uhWm+zVX8knbyBSYBIQVu0p
X-Received: by 2002:a25:2882:: with SMTP id o124mr19848613ybo.10.1593878222800;
        Sat, 04 Jul 2020 08:57:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593878222; cv=none;
        d=google.com; s=arc-20160816;
        b=j2ekd4SxhW+/EmqPDHYSlRyBjfBUDEvRiXtvfcKsc8gTlgnvkIYkBchlkwF/aOze6e
         SlmBc4ao4B7E+Ht6a3xE0J/Sr9aX3QsWYkfltzG/fc4MGUAq4l+Q9kZpLYMxwaTiyaQ/
         /b/fvPCzbaJsKGHDYQhrKZ4lMNEPNg4anxAk5fdC25fgAKgxIBfPZZqqbNmn9byl5Tt3
         9cDyCslRTgb0llPtIjDz2W+kqMMMLsOlNSuO10bq9t1fPgA5F49LqCpW1qWZzfWSskq5
         9gwYb8AGtpTqcvHiLDVBDOT3m3DJH3CJ7a7WERi0gl/B3JBOJ34iGRuFWl567h+3Bskf
         kTUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=xzmpYsBISGOvG5zZYT272uJF1IEN1usCaslKq9c+AuI=;
        b=yM8k1Rd7sCx5v09X2hRyBnLuZXe6SVxOq+wEmvXgSH5LioYVnh/kNLl/7mg6aJ+SJG
         ACYtCjLg72voZH/nT99j5c49bqfUZKksJ5web8IYhYgtGvsfMe3I/wLh6fnURrcfEw6Z
         qWabr0PUq6Y4kXJnZIe0LLaOwEYUllAEjiBUnZBOR43nAahe7OF/YMU1f4OBcxK6h5QV
         kYfMtKLzKI4ydrjkeEuaaTya9oPAsht4nqzXzaCzW2RAM61Jm5D8bJMeG0XgHucJ46Mf
         MHL6Npyx/IawB2WA+WtUxH/pQWAeZ0kxugxRPxT6v8+FNkD+Cyzco6ebKA0TGfjQbhds
         5w5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="cZZ9e/EO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12si21646541ybt.242.2020.07.04.08.57.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 08:57:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="cZZ9e/EO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrkXG-00060Y-4q
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 11:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkOQ-0007zF-BL
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:47:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36581
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkON-0000yz-BG
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:47:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xzmpYsBISGOvG5zZYT272uJF1IEN1usCaslKq9c+AuI=;
 b=cZZ9e/EOfTiskKmc4IhCeMcI3tFtfgDTUyaYRAi8KICQFfJVlm5Vh78kDQkvSmHTlzJ61i
 bSIAWsf5PK0BiQjiwCwqIXtdbnsBoedsxV+ioJtvKsi+ukac/cN0ep5ruWV+uCcNll3QG5
 hX6dTY29iwFcSBQWOnsTksEFZ2kgq50=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-plFAaKs8NoafnynyBNZi8w-1; Sat, 04 Jul 2020 11:47:46 -0400
X-MC-Unique: plFAaKs8NoafnynyBNZi8w-1
Received: by mail-wr1-f72.google.com with SMTP id y18so16366859wrq.4
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2020 08:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=xzmpYsBISGOvG5zZYT272uJF1IEN1usCaslKq9c+AuI=;
 b=IJogQ2E5Vbrz7T9LrONN39X6JZncHKytWSP/DzlCslD8GCoHt2AsYSMX+qWUiVBxuD
 t2jQmoWl0iSjYqnFEYkNOlOJFBRADPUr6o3uZjTbAu7hV6qFgt4NeT/IDPyoM7eDeX/V
 olFM397aUDVlkqMLZj8I9Bl/aKK1PVVyRcMp00MATht033EUN665wm2Xf4Rz2MsywR6L
 PrjlXiCrQcRr21qNkIC0Y0dHlu4ERrKf7HmZbGBypVSL2t85o7xa7VzCHMDwn0mwa++k
 e3nIcKY+3fZc+3j1AVhMmRSStORsIohyOFm0E3fcIKDhV71YJekBVxFUh83Z/4nZ/1VM
 p3Ng==
X-Gm-Message-State: AOAM531bG3vmI5kWU2IDUFr0TvlhyrUqPtemX3VHqQQZRmjdewUj/fGR
 +1ZAI+FdTso/E4w5hXE3/2d4iLDH9a0LGw+vSfdqKbVMfhs8M2CEBNCulQlsh2asKeqRVJ+FRUR
 82ejKNDEDhZAH
X-Received: by 2002:a1c:f203:: with SMTP id s3mr40227353wmc.126.1593877665681; 
 Sat, 04 Jul 2020 08:47:45 -0700 (PDT)
X-Received: by 2002:a1c:f203:: with SMTP id s3mr40227327wmc.126.1593877665497; 
 Sat, 04 Jul 2020 08:47:45 -0700 (PDT)
Received: from [192.168.1.39] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id d28sm18697107wrc.50.2020.07.04.08.47.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Jul 2020 08:47:44 -0700 (PDT)
Subject: Re: [RFC PATCH v2 18/23] hw/openrisc/cputimer: Emit warning when old
 code is used
To: qemu-devel@nongnu.org
References: <20200704153908.12118-1-philmd@redhat.com>
 <20200704153908.12118-19-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <8cd142f9-9a31-cb42-8021-f47a47054f6d@redhat.com>
Date: Sat, 4 Jul 2020 17:47:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200704153908.12118-19-philmd@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zBxiwdi6IFvZ

On 7/4/20 5:39 PM, Philippe Mathieu-Daudé wrote:
> This code hasn't been QOM'ified yet. Warn the user.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/openrisc/cputimer.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/openrisc/cputimer.c b/hw/openrisc/cputimer.c
> index 93268815d8..60f2c9667f 100644
> --- a/hw/openrisc/cputimer.c
> +++ b/hw/openrisc/cputimer.c
> @@ -22,6 +22,7 @@
>  #include "cpu.h"
>  #include "migration/vmstate.h"
>  #include "qemu/timer.h"
> +#include "hw/qdev-deprecated.h"
>  
>  #define TIMER_PERIOD 50 /* 50 ns period for 20 MHz timer */
>  
> @@ -135,6 +136,8 @@ static const VMStateDescription vmstate_or1k_timer = {
>  
>  void cpu_openrisc_clock_init(OpenRISCCPU *cpu)
>  {
> +    qdev_warn_deprecated_function_used();

Please disregard this patch, I forgot to address Paolo's comment:
https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg02202.html

> +
>      cpu->env.timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &openrisc_timer_cb, cpu);
>      cpu->env.ttmr = 0x00000000;
>  
> 

