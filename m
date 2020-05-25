Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1989025lfc;
        Mon, 25 May 2020 05:29:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxK7NwZ2Q67yyhPMCEC0y3Qx6wcnYjM7+2+22PVXDSZWjOQQt+w8FbiQBqbaozcza1Ipvan
X-Received: by 2002:aed:3b56:: with SMTP id q22mr27404807qte.345.1590409743031;
        Mon, 25 May 2020 05:29:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590409743; cv=none;
        d=google.com; s=arc-20160816;
        b=EMmSCevPHCI5on/ID4K+O+omyjrmJ7cm10aYHhJSxy1fczFapSaVDyuD5yE5qu9Lhu
         e+6tgmTKwLPCWq/u843cOvXr9BvmEVjzU0pqN0S47/3stmO1izosg0CO/n0qhiPWCY7l
         uLMbTwhg8GmR85WgWJ+Vupw/32nOCW+x/gGdfNkm2mtL4KhH2573kJzrG3M4SRS7PUNV
         CDwg3/fPHQGUzTTxLoq8Amw614PGDy+dl843k+vI8ubNZVKRLMBSbhiuUh6Q+hOCdQze
         sAnsnF5B9MUiWDtE3E28+Nv6H9pQ2s7RSnsHgSILkZfsQqvgb3nGiJ3YsiydlT9soIWs
         4IVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=ET1vOPjbo0umRF7Qk+Zm/dRolTdxt0oIXTEqOMzcCbg=;
        b=iUxsYEs3etXr+gsRZYYaxIBaEzX22WyxY6KaWGBkwUcUvdz4VsvoyjYX+lU7/Ezrdj
         FgWEVzxgciDGR22ZgRqAzbpbux+ElY1KsaMAwyr0doKkBV8lMBsvs9EmfOr8ZL4mmoJv
         xkVBQ03Wg7kwIhdC1XEbph6YKbCjg7wikzASiTkPIxhqKZZW6tbCEZUP2Up1AH5psH0h
         BdDrRvScnqeTngrzWX1SVIBN40Kkx/ELOk66LQ0qIkUpW2Vjxe81KzXtPJFRCckYLAZs
         MYFdH9Ad/A83OUVmXxoCjQO21KXwYpS5lJH8n7eGaudVId3youI3lQh81S6S5+/rcS8I
         k57A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Y2yDpvpt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d11si8545942qtn.351.2020.05.25.05.29.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 May 2020 05:29:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Y2yDpvpt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdCE2-00054s-HW
	for alex.bennee@linaro.org; Mon, 25 May 2020 08:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jdCCP-0003xA-2e
 for qemu-devel@nongnu.org; Mon, 25 May 2020 08:27:21 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:42873
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jdCCO-0003oM-9C
 for qemu-devel@nongnu.org; Mon, 25 May 2020 08:27:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590409639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ET1vOPjbo0umRF7Qk+Zm/dRolTdxt0oIXTEqOMzcCbg=;
 b=Y2yDpvptEMupddffatmQZ0IZ868a9AFzwbGGUQPIdl9381wSDJhWk0VgEYBNVslJzISIcK
 GUkWy/r/F81Izaq4Qepykw7tKUJEQ8akWaGbD1kLo8IZbvW7+GPba6OrCvbYpxoMwDkXhV
 bCZynO14zPr111YjYkzSyrCsCFs/NPg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-MBUZK4oTPl6Vg3lgY4pEKg-1; Mon, 25 May 2020 08:27:17 -0400
X-MC-Unique: MBUZK4oTPl6Vg3lgY4pEKg-1
Received: by mail-wr1-f72.google.com with SMTP id l18so3053768wrm.0
 for <qemu-devel@nongnu.org>; Mon, 25 May 2020 05:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ET1vOPjbo0umRF7Qk+Zm/dRolTdxt0oIXTEqOMzcCbg=;
 b=T4HwquDbiamSHq1Xqvs+Y2lZE7BBIwb05dhWES7JpSumGlXee6SBC3fFAtfiEI0hy2
 XXiHeTymxQageJvR9xfa6MUNRzBTA6kSlU+i9E87oN8sc+Vi3oCnwkILwy/qEYdLBARi
 XHr0rPY3mbnJb0EF7svTtjNeXz1DSpLNVwJUJK6oDlqyZc3Y6zyuJVJVBQmJQ1Gpi91O
 jNKWMauv+DI0sLKuyB2P8wH8aqfk2xiBCSExneW4sLzDyd4AJxxfKn52wWl2Cu9P63SB
 Q6c018uw5st68guyx0CfbQrIwkAoqQniS5FEy7Po2EwkW/C/7hKwE5FMHziw7oqN8eni
 mXtQ==
X-Gm-Message-State: AOAM533YCgb2KkHaL7YmZvLKyva5frT8fE+hvaYVQ2ZjkrxZRs80MwgD
 3wzVoQxrMzOZs/neTcLYts0rP50ZPGCha+Zei2F/DJPp/KyB0IGg2eDb9o0Yc0jjYl1jv79pjxV
 HTyBjnwRdEc4QKFc=
X-Received: by 2002:a05:6000:1009:: with SMTP id
 a9mr16260202wrx.403.1590409635687; 
 Mon, 25 May 2020 05:27:15 -0700 (PDT)
X-Received: by 2002:a05:6000:1009:: with SMTP id
 a9mr16260175wrx.403.1590409635402; 
 Mon, 25 May 2020 05:27:15 -0700 (PDT)
Received: from [192.168.1.36] (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id l5sm10104037wml.27.2020.05.25.05.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 May 2020 05:27:14 -0700 (PDT)
Subject: Re: [PATCH v3 15/22] microvm: make virtio irq base runtime
 configurable
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20200520132003.9492-1-kraxel@redhat.com>
 <20200520132003.9492-16-kraxel@redhat.com>
 <3e0451d7-5692-10b3-ac01-90128765643e@redhat.com>
 <20200525114928.lxfqu2uo5xfhtywx@sirius.home.kraxel.org>
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
Message-ID: <101618ac-a1ed-6f5c-df4e-5238ce9e31f2@redhat.com>
Date: Mon, 25 May 2020 14:27:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200525114928.lxfqu2uo5xfhtywx@sirius.home.kraxel.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/25 06:55:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 22iJm9TsfcAe

On 5/25/20 1:49 PM, Gerd Hoffmann wrote:
>   Hi,
> 
>>> -#define VIRTIO_IRQ_BASE       5
> 
>>> +    mms->virtio_irq_base = 8;
>>
>> Hmm you made it runtime configurable indeed, but you also changed it from 5
>> to 8. Worth a different patch, or at least mentioning in commit description.
> 
> Oops, that wasn't intentional.  I'll change it back to 5.

OK. Using 5:

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

