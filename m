Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp556550lfq;
        Tue, 8 Sep 2020 05:25:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXhq5ltV33xTGFPI98VBpcf44civQptRz1dF1yRapwfaMHggbS/AEVenCapjCnGN7DOVJx
X-Received: by 2002:a5b:508:: with SMTP id o8mr36992864ybp.43.1599567925122;
        Tue, 08 Sep 2020 05:25:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599567925; cv=none;
        d=google.com; s=arc-20160816;
        b=ir8xT6MldOd6qZhmqPY3TruCCIw3pC715vO4Fuu1SoyAVCEjCESeRx3tO2MNg6+1/N
         6b3kz8ylcd1AlHN8oTIgJn4fR3KgwaRQz+69YJJktcA8gBSkioUTtuDBG53qaQdno2L5
         kX2ytCimIb6k30XsZGQDl4GPyWgSrF9ew8vWvluHAfwDmJih1+xwjTaH/og2M7VI/RbE
         JTCH3VzjQ8wJKQJd7DmeLPr8UufOc2NDB7FW7b59qXNWA0tsmUB4JhdglfYAamZYu4Hh
         b8soEhwNcVn1k8VhNobdH5D2g3Qih3p2DcDFjSKmNXNmyLYcFl5n8qjmJF1oupgsajpt
         e+Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=xFFdxUAvqPmalZ41wiAmb2URC8cPpCKyD80nyZ5x7Go=;
        b=dAwrTTydWuFJWgZD62n5exT80R5mkwgtURuE1ZuKkRfc4qh52pXXCvrh2UFdeQ0ZrL
         rjUYm9wnw3Eb71D3+y6nK3oznGyh+6Sq3an8Rv0/Clj5cdxlatC8grFs3AFr6SHpDbd0
         fMXEy9TuLzQHkgHiCHkccxtjokabXv/mwSqiJ8GAzTHl8HLUAzxaxOyN3HQtE969Ln0w
         0hgVQ1SLVYeOcNE01bCpKSeg1a7HcTCflm+sJ2ocupN+NY11LhqMsSGMIQpqm3H7SV96
         WHLauSIVl0lQw/RalO8WOY3HGlC1He7RX87T7/jrT/vAQaHoSuE+/+4ixamdViuTcg1n
         4pkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="drk7TU/B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q132si21576075ybc.128.2020.09.08.05.25.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 05:25:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="drk7TU/B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFcge-0006A3-HK
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 08:25:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFcZc-0001zN-Kl
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 08:18:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57514
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFcZa-0006Uj-7f
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 08:18:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599567482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xFFdxUAvqPmalZ41wiAmb2URC8cPpCKyD80nyZ5x7Go=;
 b=drk7TU/BNv/atnN5w+nb5dm1qmEqll8vRDCuNPkJS/mCjEu/KP+BMUDHcS5+5DSmLRGt8N
 EyR961ZHb2PidBJkmlkTNMERjg8Vobl4hOlzdXvxi11jDZUdrrrsinDSparXNc+2xt7Spf
 IwzzaIQwWj9QhNDVpEIyNqy+QGTqvkU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-OiZorw6qNFyFVWsye_PgsA-1; Tue, 08 Sep 2020 08:17:58 -0400
X-MC-Unique: OiZorw6qNFyFVWsye_PgsA-1
Received: by mail-wm1-f71.google.com with SMTP id u5so4411757wme.3
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2020 05:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=xFFdxUAvqPmalZ41wiAmb2URC8cPpCKyD80nyZ5x7Go=;
 b=m69vx3ukutjBoyegpjs7TO8qXu+U0HffqjHJdz8eSzA4T0oeGtR5/ycyxrvalvRhBR
 3SKEbCmVHcWc+FsK7qsnVhMhp67rN7IhZsLvU9zyAOEaBwWrGvU/DbDn2BN0d6QpVApR
 ypotx5lCIR0BvxMeLNEMmHxJxLr86Ca8pgdXU8+Dyo1HrcuKsjyAfWGgZ3VpWs6tnT6S
 p+tfnUsGmwdvQcP8dDKG+hCvUSZzVYT3x/FZqzZo4JJx6kvFa+lblevIPpvyth1rA2ju
 rf3N/6eZsb4QiBBcN+I/25KewwAb2RMqBWFbAn+43vBfXZQ/q/gy0FZ/EzNIyuOuE1aL
 MP/Q==
X-Gm-Message-State: AOAM532KIrB/t4KtoWbq0yQJffM9IhlUAW3t4VNZfcO9uPw2dfxEoHOm
 Cem8zrbeWphDolmKUE4EyUrjlaXHH1cy3jwjWVXjp0CQdPxcqIOBCPK4HfTh7xchs69fxyTdt9V
 lS/pa4z3J4csr
X-Received: by 2002:a05:600c:2053:: with SMTP id
 p19mr4139034wmg.50.1599567477607; 
 Tue, 08 Sep 2020 05:17:57 -0700 (PDT)
X-Received: by 2002:a05:600c:2053:: with SMTP id
 p19mr4139019wmg.50.1599567477474; 
 Tue, 08 Sep 2020 05:17:57 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id q192sm35576159wme.13.2020.09.08.05.17.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 05:17:56 -0700 (PDT)
Subject: Re: [PATCH v7 13/21] x86: constify x86_machine_is_*_enabled
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20200908121050.1162-1-kraxel@redhat.com>
 <20200908121050.1162-14-kraxel@redhat.com>
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
Message-ID: <27c460f4-252d-6dbf-3628-9a02e963387c@redhat.com>
Date: Tue, 8 Sep 2020 14:17:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200908121050.1162-14-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 00:33:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.626, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I8t+7UagfTcz

On 9/8/20 2:10 PM, Gerd Hoffmann wrote:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Sergio Lopez <slp@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  include/hw/i386/x86.h | 4 ++--
>  hw/i386/x86.c         | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

