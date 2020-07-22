Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp408113lfm;
        Tue, 21 Jul 2020 23:53:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0SnWEy65UGAXjYt7JLYXp40WQ4bSPt8yppdNUYtMXBIl0CO3nDkBk93+ydYe8P3sV6PtV
X-Received: by 2002:a25:3484:: with SMTP id b126mr45816374yba.225.1595400789422;
        Tue, 21 Jul 2020 23:53:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595400789; cv=none;
        d=google.com; s=arc-20160816;
        b=zgkmjv65IAS8TmIe6spNxM6KoZV6gfMLSNaiqgX/nxjmexYni4vGDcatANLR98YQyU
         js0uw3/N0nq5YqAJmttwwbLLrTYwgl9eVwERlJ1+LRW5R3na7HXHLXAbLmn/tpQfMtiH
         tJVLRAhSnx9Wt1GeHrhtXmRZlEzPMarN8LBPFFGjSQJFFdISzO/0dfguz7RPI5UAKwrN
         SaCGY64tg5750JkBKokI0K9MJTOX4HFHjq2Bkmri3rQmTP4Vm6A0/NRpvUEosWh3DVUF
         jPJf+UwNdgSIi6ZbCjlzAPImU1hCbVX+jfNJlQRReIkBDD+cp1ZzMIQT8lbnLvee9wmN
         Zdtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=4zNapPqglpUlOvW91e68SDTzXdo/vrAdYBrUV+7sGO8=;
        b=Y8TTbrQEZ0sPQ85ihxPMr0B29UtG9Ba/PbfrE6RtLiS0oaJQzNFdSu/khA/TmMptHp
         wBIYU54Xtv3tyT9WwtD1/LahT/cP5JidFavCam4hmVNU9vtpliczxtbXbjy0qgjyAKvn
         HnIq6QBzQ86FTfUh0JyNecziuyt+pt0Wrq4tV8YSzE+quY+vxhUcw9X+odkAPsMhYiln
         tOLYLgUsZqp88fYafdWXPzUVriJZdzyp73mefI/4H9PArcRtwLLsk39tTjJ8Acs61d19
         hba7zn36sL4I2BuxQ/78URkcYEpYIxD1vZwGy8WkegUqCtk7nitOJz4gO+cRdR+Zg2AG
         +70w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZWt8OFPK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y184si21427522yby.359.2020.07.21.23.53.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jul 2020 23:53:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZWt8OFPK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jy8cm-0003TV-RE
	for alex.bennee@linaro.org; Wed, 22 Jul 2020 02:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jy8cW-0003Sg-5y
 for qemu-arm@nongnu.org; Wed, 22 Jul 2020 02:52:52 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:23195
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jy8cU-0002KD-FT
 for qemu-arm@nongnu.org; Wed, 22 Jul 2020 02:52:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595400769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=4zNapPqglpUlOvW91e68SDTzXdo/vrAdYBrUV+7sGO8=;
 b=ZWt8OFPKgP/T44425BhmopJFXa5rzrPgJP2TwPlRmt/w24y9hu5Ml2mnFK9+WsMVfoR2w5
 B1I6m5z4a2pANoV8opU97izUhQ8ZTfrNoWdQByQvEkbVTCqJfPlf0aRBzIddP4/N4B1tG9
 X1q1mf6WmLPNUHdERfRTIIbtzjSiKyk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-niPy22dYMYafU2fwMQv_qg-1; Wed, 22 Jul 2020 02:52:47 -0400
X-MC-Unique: niPy22dYMYafU2fwMQv_qg-1
Received: by mail-ej1-f70.google.com with SMTP id cf15so622452ejb.6
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2020 23:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4zNapPqglpUlOvW91e68SDTzXdo/vrAdYBrUV+7sGO8=;
 b=gqys4Q2b0dRKKNDH5GYDyjjDkY2WMOqAzZlUUePUfEAjDAX8vbGdE988to7SPC3FS/
 ct4XE/k4sDgMLrTTGA44nrgxqYtPYq/6IlXDFhIqGcafaEpldgDJ3DIfKE4b+jD/J4dy
 L7mydQpb9KAXRMttcK1txxpnrtYr5wt7lYjUzxTUeTGeeX9ZADhIigrrASTzb3tmBI0W
 7HANG9oDJMos4yeZQ8IOeJSQaYJXAFEeKrgKqgr7ESpdH4jIWebEPxQ8B0b/dqzOvqkC
 I9pCv3In8lid/cMPG0iMBdFUVZdTuJn/gmHMsjCcOdsU6Cq6qpFc4tTfyLb3IaGWvpCk
 Q8Mw==
X-Gm-Message-State: AOAM531wumBPyQK5qz0hiTMDMYqU/Xh/W4E6uCMDcdDxwc6BWW62QDV1
 3N9x4AKht+QjMxtRXoyvzSDK65wO69qiEiz+HIDZhsv5N4bJHZb+rqTrJ9pxRHbLDs5wpctmws+
 NNIMtvTnHkNzn
X-Received: by 2002:a05:6402:158d:: with SMTP id
 c13mr29712457edv.103.1595400766545; 
 Tue, 21 Jul 2020 23:52:46 -0700 (PDT)
X-Received: by 2002:a05:6402:158d:: with SMTP id
 c13mr29712433edv.103.1595400766300; 
 Tue, 21 Jul 2020 23:52:46 -0700 (PDT)
Received: from [192.168.1.36] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id y22sm18073051ejj.67.2020.07.21.23.52.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 23:52:45 -0700 (PDT)
Subject: Re: [PATCH v2 1/9] target/arm: Move start-powered-off property to
 generic CPUState
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>, qemu-ppc@nongnu.org
References: <20200722035016.469075-1-bauerman@linux.ibm.com>
 <20200722035016.469075-2-bauerman@linux.ibm.com>
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
Message-ID: <6ca8915c-094e-1880-0e66-618eb354444d@redhat.com>
Date: Wed, 22 Jul 2020 08:52:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200722035016.469075-2-bauerman@linux.ibm.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 21:28:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TEfTvZeJOwNx

Hi Thiago,

On 7/22/20 5:50 AM, Thiago Jung Bauermann wrote:
> There are other platforms which also have CPUs that start powered off, so
> generalize the start-powered-off property so that it can be used by them.
> 
> Note that ARMv7MState also has a property of the same name but this patch
> doesn't change it because that class isn't a subclass of CPUState so it
> wouldn't be a trivial change.
> 
> This change should not cause any change in behavior.
> 
> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>

As I participated in reviewing your v1, I'd have appreciated
being Cc'ed for v2.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  exec.c                | 1 +
>  include/hw/core/cpu.h | 4 ++++
>  target/arm/cpu.c      | 5 ++---
>  target/arm/cpu.h      | 3 ---
>  target/arm/kvm32.c    | 2 +-
>  target/arm/kvm64.c    | 2 +-
>  6 files changed, 9 insertions(+), 8 deletions(-)

