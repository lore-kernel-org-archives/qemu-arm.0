Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp409466lfm;
        Tue, 21 Jul 2020 23:55:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyc9+XBQmx75kiBbCnqBa1cWf0V/TLOGu+SCs/0twi6MVXzLqKd8llX83139/g2DEFaCzxM
X-Received: by 2002:a5b:34e:: with SMTP id q14mr46922564ybp.501.1595400947412;
        Tue, 21 Jul 2020 23:55:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595400947; cv=none;
        d=google.com; s=arc-20160816;
        b=mEvAp6Mso/XOJ0TCi1T5HWFfUz1bn4NlRy8b4kNjYE/7BMxAEY1agDFbx56I4n/Kb9
         UwrM2gtFqpSxYDbddq6IKnAPtrJMreqlG0UqOd+6UZjgMx4zoeWhpQuoKJGjLYsPundt
         vTW5FqnCh0/c2rTGFheDT44b1bCeBYHFApYXpWv3vMGchVTrfya1XigTJwgVZq5cWSTq
         I6jOv6eD/zudwSc+j6luqkxvjAqxPAz0HKBDEPajIHC2yMzbZ9y7v/rRf5btUuCP8SMV
         9kqxLxs9rVpNwR9yvuclUP5MvOagbqrWsDQQyi7hSFxodahhiYMHDG8kbGthWCxeEEb8
         VHOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=F6EE/98OqJDs1uHTA88M/+ICntTLO6ujMdXq95SikSA=;
        b=ieloX15ta6cLXrAq+3Y3Y6oXUxNDPIAtqDsIhIvao28lVaFBMyPyESsjd5TRFd4dBF
         58/WbPGkgdi2+raP5ZebvPuEbCOYG5455AjsnwSNW+omLM5QvhcL3HyncnlD7PM72L9k
         x//8s7NxeaHtk2mNqzINwOJZyxU4JV+yg1+jip/nuWz5gSqfKStS7AsXq672eFL5hztG
         +fAGwYskCZE8h5rJFC/JQ49/AZsMMNsoYJQYYmyjtKqNMlFvU/9+rIHrmVSCoPSx2p+L
         3SydvM+9vF712YUzL3MrvaHanYvzjQ/bSxhmA4O+by+gjT0JYqOtKtYB2oScbYAjxGYe
         qGNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i61p2+pQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e67si22090604ybb.305.2020.07.21.23.55.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jul 2020 23:55:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i61p2+pQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jy8fK-0005mp-O4
	for alex.bennee@linaro.org; Wed, 22 Jul 2020 02:55:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jy8f5-0005k7-Lk
 for qemu-arm@nongnu.org; Wed, 22 Jul 2020 02:55:32 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:41905
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jy8f4-0002bw-6t
 for qemu-arm@nongnu.org; Wed, 22 Jul 2020 02:55:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595400929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=F6EE/98OqJDs1uHTA88M/+ICntTLO6ujMdXq95SikSA=;
 b=i61p2+pQZATl+lchJMP+WtfI9LHjf2s5OcaGeoaBbXBVm5cgOVad17e0kygHj5kDgcfpyx
 CFjiNEF9QCmNhb8GDfPY+s9BZSnGbJu8Hq5z0ZYeytYpustR826sGU2o2nQnPukVibTpP/
 DttCsDKhL8hU6CfO4VRP9j63K+hMFhs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-2OrO0v9yMYSctWzUM2OtsA-1; Wed, 22 Jul 2020 02:55:25 -0400
X-MC-Unique: 2OrO0v9yMYSctWzUM2OtsA-1
Received: by mail-ed1-f72.google.com with SMTP id y4so387232edv.17
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2020 23:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=F6EE/98OqJDs1uHTA88M/+ICntTLO6ujMdXq95SikSA=;
 b=Ky5MdBvKDO11Xp2ZIcq6X7S9dxebagMGzs1sCzwZvL46exHGkl4i5X3SV/GJqSFGjP
 TeapCUYL6POFzudXkwXf63bMC6qGJb6NOoar3iVvsbMnrn8OGF12vPMSL5MImgixVEPY
 g47ELuurEDSdYXJOsUVbI3Vrqn04PrESa79mbFaS8S+DGcb2IC8m2uppH+bb3I3G5KBC
 AYgMtj+c+C2pgWp6IDXNzBovTqTvdCByqVazYpu4ONkmulmRtzEW8ZIUcMbnfD1vNXCk
 ML1SS/vPGxtOzvOxxkQI3g0IDrcn0raHuQXzWgZbDB1cbx8H5zAeUw4PCvva8GqmgPLO
 KrOQ==
X-Gm-Message-State: AOAM533ZkQuMdsSQ4jD9pzj+7N7NNItI6Sa0PUJWQJzjW8sg4eCS5zWJ
 k18L2FSuXGhtSf0evt7vH1sqwy6VPo9NIPrrDqy+QAlDHfGZd+kDT2Auj96lQ8UmjId7Zsyjnmh
 P0uft9I37zb58
X-Received: by 2002:a17:906:f20d:: with SMTP id
 gt13mr29200778ejb.117.1595400924163; 
 Tue, 21 Jul 2020 23:55:24 -0700 (PDT)
X-Received: by 2002:a17:906:f20d:: with SMTP id
 gt13mr29200762ejb.117.1595400923994; 
 Tue, 21 Jul 2020 23:55:23 -0700 (PDT)
Received: from [192.168.1.36] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id w18sm18213824ejc.62.2020.07.21.23.55.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 23:55:23 -0700 (PDT)
Subject: Re: [PATCH v2 4/9] ppc/e500: Use start-powered-off CPUState property
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>, qemu-ppc@nongnu.org
References: <20200722035016.469075-1-bauerman@linux.ibm.com>
 <20200722035016.469075-5-bauerman@linux.ibm.com>
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
Message-ID: <29a87d12-ce2a-2d48-2578-860e160565e9@redhat.com>
Date: Wed, 22 Jul 2020 08:55:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200722035016.469075-5-bauerman@linux.ibm.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 23:34:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: amEci90LbsKo

On 7/22/20 5:50 AM, Thiago Jung Bauermann wrote:
> Instead of setting CPUState::halted to 1 in ppce500_cpu_reset_sec(), use
> the start-powered-off property which makes cpu_common_reset() initialize it
> to 1 in common code.
> 
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> ---
>  hw/ppc/e500.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> NB: I was only able to test that this patch builds. I wasn't able to
> run it.
> 
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index ab9884e315..dda71bc05d 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -704,9 +704,6 @@ static void ppce500_cpu_reset_sec(void *opaque)
>  
>      cpu_reset(cs);
>  
> -    /* Secondary CPU starts in halted state for now. Needs to change when
> -       implementing non-kernel boot. */
> -    cs->halted = 1;
>      cs->exception_index = EXCP_HLT;
>  }
>  
> @@ -897,6 +894,13 @@ void ppce500_init(MachineState *machine)
>          } else {
>              /* Secondary CPUs */
>              qemu_register_reset(ppce500_cpu_reset_sec, cpu);
> +
> +            /*
> +             * Secondary CPU starts in halted state for now. Needs to change
> +             * when implementing non-kernel boot.
> +             */
> +            object_property_set_bool(OBJECT(cs), "start-powered-off", true,
> +                                     &error_abort);
>          }
>      }

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

