Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp558726lfq;
        Tue, 8 Sep 2020 05:28:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8SH2HRVZipvK8XyjmGSqO5snAkeSNwQTrRWWI/aeSRfGXpwhvmS4mekJVoIKROxw4hB8j
X-Received: by 2002:a25:508c:: with SMTP id e134mr36619386ybb.371.1599568132226;
        Tue, 08 Sep 2020 05:28:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599568132; cv=none;
        d=google.com; s=arc-20160816;
        b=D/+jRSX2NjZYFNkLRajhJMWD0ViN7h9v4Zdly5RQUD0slCkpasI1bJsJy2/QnHI0Pk
         cF4feksxfqYa8qd+B4NmtfziSvrdZwT8B27JdcGMBkvchbKAwuMG4B2z95UAIfn6QYx/
         AXjWA6TqDHNoWflVvW6qeP4jk3iTqZ/fZdDmkcDSA2fO51EktBwn/pi0APOcJK7Sm3LN
         9tdmAZqB+srUTUJbb1t0jiLkbj0xVWiLT18JVSlBXw9WRUqD3rMFs2MK3esuujJZ6lpI
         2zudxvMcjUrzP4NWXQ4bYaPAfmlUF75f8f6im+kx+UrFQ+hoz0O5weTcapPN7Qmsp0l2
         Esew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=nI/K+KNcXRjhCn6vAls+PU98bH2Y4FgJg95svMe5dWQ=;
        b=WHH7/J/NQa6gGyscXYEhNiTlcu2vYz8sFgeqXvQNAx4m5a18/bTeMLwx6RcpDutysI
         ekbo/YKraHsJ+neE8m3B/0pBOdSrEKG2E77nm2jJxXZ3Nj0IFelDibvWLyshWd9h0pJ8
         8rQX6fGGa9klCNTUI9LAbZ2ElG3UMj/IrSryjLXPOysjSMHPPizPKckDeZIKlDd4RxY3
         GFYLhrH3YXmIeVnb15cv4xTperBO6oY3b94u/nFAfUwLZqXtlsJT6pbp0l5utByp6hMr
         oWc0nAtivZ4YMciDXowo0A6SuVN65KNe3igzoHepjgUOwqCu3YKVJdjS2srhJxZzkVi6
         Cf1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hSWUblBy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 198si18200534ybe.410.2020.09.08.05.28.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 05:28:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hSWUblBy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFcjz-000424-JB
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 08:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFcZ1-0001bK-7y
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 08:17:31 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:52720
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFcYz-0006S6-Bw
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 08:17:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599567448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nI/K+KNcXRjhCn6vAls+PU98bH2Y4FgJg95svMe5dWQ=;
 b=hSWUblByWE1WiuoY0ihC9lB5G6akFrpsBy4c+YhFeRqGvVARZf4Xe6FMzo07HOA6748e/R
 ZOjjKtmIVnDnqf+2bVP0nEoJIs4TVDd/5Nfx78IK4MwCaMgBwx/7UhPGv4FFrsh15Yqh9D
 k0ge+4crPVo8X+xRT98rvu4BmFtbucY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-pDeaqegqOT69W20urTd3Ig-1; Tue, 08 Sep 2020 08:17:27 -0400
X-MC-Unique: pDeaqegqOT69W20urTd3Ig-1
Received: by mail-wm1-f71.google.com with SMTP id x81so4662692wmg.8
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2020 05:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=nI/K+KNcXRjhCn6vAls+PU98bH2Y4FgJg95svMe5dWQ=;
 b=Bfde6yhK23Uc1qVJf97xImRHmm3RDzNGbfSbQ1ZcTi0V9qbi/ZsfKusdHUDrIGtI6s
 aHLduSDMl6+nbFO85RAOvGv5xuo/wrT3noElJx3CD1zEtYXzeRn5F7yZHA+AG0ma2fUM
 8RFHb7T/qZKwspdiuTazCW845HmRODGylh9aBxR34VW1hJXZv92/ANJccbM2hAooFai8
 lsCeV1aGOzD0A1owFFz2/1Se4wXHYuNHCh7f3Ek/oN+4EI5e5TineTypEDzEj4GZb5rF
 6T2/0FwwU9+H+TQS+1GTPtyS2NVl54SD3YiKSxtV9RYgyeG+A+ouAPJVdB2oiwo4Qnux
 1lXQ==
X-Gm-Message-State: AOAM530ub6pUn9ZN0asiRXNyVXySbAc7p6QfG1pQWQuVlzQGVv0w4Zpa
 vr1+srCbsoEn3QDve6M/yt+peDfUta8zCpbu4TGcr8xYUxntr28i6hwtrhxpe2CdgbaGwdIxfk/
 Ujy7vcxeLHIfb
X-Received: by 2002:a1c:234b:: with SMTP id j72mr4179494wmj.153.1599567445941; 
 Tue, 08 Sep 2020 05:17:25 -0700 (PDT)
X-Received: by 2002:a1c:234b:: with SMTP id j72mr4179481wmj.153.1599567445793; 
 Tue, 08 Sep 2020 05:17:25 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id d2sm14845040wro.34.2020.09.08.05.17.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 05:17:25 -0700 (PDT)
Subject: Re: [PATCH v7 01/21] microvm: name qboot binary qboot.rom
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20200908121050.1162-1-kraxel@redhat.com>
 <20200908121050.1162-2-kraxel@redhat.com>
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
Message-ID: <5c3c4435-e917-b84c-764d-ef86e1ca3153@redhat.com>
Date: Tue, 8 Sep 2020 14:17:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200908121050.1162-2-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 01:08:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.626, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v+03Pf5Pit2U

On 9/8/20 2:10 PM, Gerd Hoffmann wrote:
> qboot isn't a bios and shouldnt be named that way.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Sergio Lopez <slp@redhat.com>
> ---
>  hw/i386/microvm.c                       |   4 ++--
>  pc-bios/meson.build                     |   2 +-
>  pc-bios/{bios-microvm.bin => qboot.rom} | Bin
>  roms/Makefile                           |   6 +++---
>  4 files changed, 6 insertions(+), 6 deletions(-)
>  rename pc-bios/{bios-microvm.bin => qboot.rom} (100%)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

