Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp626244lfq;
        Wed, 23 Sep 2020 09:47:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzige9KDboNubwUwnZRsf33u+vHPIYvSbW+YHXOwxEscSEYnxF/eSZISBrAnqdxD22qsUen
X-Received: by 2002:a25:c642:: with SMTP id k63mr1115987ybf.111.1600879648006;
        Wed, 23 Sep 2020 09:47:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600879648; cv=none;
        d=google.com; s=arc-20160816;
        b=01u+mWk/BCnLcwdVR4ObvzW4HX66UzAc7THa5op2Qa2au2wgsuo/QxcbLABhy70hx2
         eXDPm7EfAAtPKg9TJXmFwxpbxJoSU87SvKvf1MfmZARckOLdq7xfXRcgApdHIKTFbmyn
         kS52wDjMdcNdHNhPV4TMQL6+0dJ2EUbV5En6lKvZUyGpmo0WBU3QVaY1x1lNtDePDNYY
         rrH+AdOfPkzWapnApLs9d4s6ZmYqKMBBmbZkn9KEn3xPfEaXsm6yA/QKOdjvPBic34bY
         GAMzPxSwhTlGgweyavJAWY3o1KgaGj7ejpAP3e2VS+QfxvzHVzxtRSV46lem2Fqqs2FL
         eeAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=2pulxwzVEOhTbW0sSMqbjneC1e2WfyUa0w0tnHTTIwU=;
        b=I9WnQRodLL5Z7RKZcx+hw7fmX2uvMAaQkL1TI8pS48IWVcngFthPfWQRzex6KcjkYy
         lxn55LjZnjoEzo6YHSQ0aaLI1i2mqn0m/pdVWRJcZaUCN+/9lYLSk6mTu5L7VRaAzVVl
         EjFlKpr47Hr5XeKU3f5E5YQxnpMbonhd+XoF/3GrNIwHhBuphnpH43ntvKAs1pTeyS1V
         MHiUI782o7PAqIq2ycQ7vksXQ2oor/XN2nGtKzCEbvcdGn7FUpW6wowUpUu8ovD1rMTs
         wQdYQpkg6f8Mm33pB4SHBw/W6/ANDVe3VoNhFJ6y/PdfmRWp7xXppvubUVD6dz8g98hm
         C9fQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YlfklcQv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5si441350ybd.38.2020.09.23.09.47.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Sep 2020 09:47:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YlfklcQv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kL7vT-0005GC-Ag
	for alex.bennee@linaro.org; Wed, 23 Sep 2020 12:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kL7us-0005DR-35
 for qemu-arm@nongnu.org; Wed, 23 Sep 2020 12:46:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kL7un-0004l1-BV
 for qemu-arm@nongnu.org; Wed, 23 Sep 2020 12:46:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600879603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2pulxwzVEOhTbW0sSMqbjneC1e2WfyUa0w0tnHTTIwU=;
 b=YlfklcQvdc2xkRXsrJUVy+hr2njNlAheNqGw/EnGpkVacGOZSYnrhtqdI1tg3juytKefGa
 TI178V6TJATMyyyL45SmVYHpVwpm4UcyhFQuEZ+K8Z9yEn0A/wfpzFMfUQmIzkrjv4cq6V
 dtP0P1ZcPuT/S1yUO7sIuaMNWnu50NE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-k9xEqLynNaeGAYU7dNEmCQ-1; Wed, 23 Sep 2020 12:46:39 -0400
X-MC-Unique: k9xEqLynNaeGAYU7dNEmCQ-1
Received: by mail-wr1-f70.google.com with SMTP id 33so59772wrk.12
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2020 09:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=2pulxwzVEOhTbW0sSMqbjneC1e2WfyUa0w0tnHTTIwU=;
 b=CYEWteMUiKAHfAtBoEXYmpPs5j6Jej2Ucfm50P1x14tSeCop3jUZ+ri4jjasqPEU9r
 9PviZpG5sXgjO+NZEcGp/sn2dxwJ9L1Zfd5YFvkZcGrmUVuaWZ6zYyAN4OSORx6ea2t8
 YxDT6D8K7XPXUFjQTA44f0j/qNRS3NdcOjNRb3E2y5dVTSoSqrCBUqNE7HxryzCzd5Kb
 0TZS984r4GcjNXKJZh8/ozXF7ixKU9ZpxjGTbX4GRPgd+8X+ZchCoUVOvQaHK9X0xip1
 6vziLaLCy9pqcAJ+luDTE7+78ei5wiZWTVlKN4UQEi1mOHKy0ra8LnE316nr1Je7cXKi
 eHag==
X-Gm-Message-State: AOAM533GgCrljlppmhVkMvbO+SfvG5NDNJO0PYq1sTr4BypTlEVujfSz
 5/yOU9SbZkl+Hn8kYkNOUebk41xNa2argNk9LRcffFkopmmrVEXcSzwnz0IYfQzIm3Dj6mRLynK
 vsC3GJ5/KxzZF
X-Received: by 2002:a1c:e256:: with SMTP id z83mr450088wmg.137.1600879598525; 
 Wed, 23 Sep 2020 09:46:38 -0700 (PDT)
X-Received: by 2002:a1c:e256:: with SMTP id z83mr450050wmg.137.1600879598261; 
 Wed, 23 Sep 2020 09:46:38 -0700 (PDT)
Received: from [192.168.1.34] (234.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.234])
 by smtp.gmail.com with ESMTPSA id b84sm456871wmd.0.2020.09.23.09.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2020 09:46:37 -0700 (PDT)
Subject: Re: [PATCH 00/13] dma: Let the DMA API take MemTxAttrs argument and
 propagate MemTxResult
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20200904154439.643272-1-philmd@redhat.com>
 <17d09f61-c65f-f248-7f07-e47295540a86@redhat.com>
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
Message-ID: <ce65770a-78f2-9ec7-8c01-1f45f28a116b@redhat.com>
Date: Wed, 23 Sep 2020 18:46:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <17d09f61-c65f-f248-7f07-e47295540a86@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/23 00:53:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laszlo Ersek <lersek@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hv8AAWAoNgh8

On 9/23/20 5:24 PM, John Snow wrote:
> On 9/4/20 11:44 AM, Philippe Mathieu-Daudé wrote:
>> Salvaging cleanups patches from the RFC series "Forbid DMA write
>> accesses to MMIO regions" [*], propagating MemTxResult and
>> adding documentation.
>>
>> [*] https://www.mail-archive.com/qemu-block@nongnu.org/msg72924.html
>>
>> Klaus Jensen (1):
>>    pci: pass along the return value of dma_memory_rw
>>
> 
> Paolo is on PTO. Are we waiting for him to merge this?

I think so. This series now needs a rebase due to a change
in hw/display/virtio-gpu.c. I'll respin when Paolo is back
(or someone willing to queue this).

Regards,

Phil.

