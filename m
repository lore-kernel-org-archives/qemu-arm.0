Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp488548lfq;
        Wed, 16 Sep 2020 06:48:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0pQgbZeVSyM7+nSKR7gIf/WEsh5azd5xD17cMeE2ME+HHkz0q5lcOd3g4B2W8z8IQ57wE
X-Received: by 2002:a25:5106:: with SMTP id f6mr35106399ybb.335.1600264114855;
        Wed, 16 Sep 2020 06:48:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600264114; cv=none;
        d=google.com; s=arc-20160816;
        b=h6JLEkcFsxJYUbFCGpVlY0dLB8+Gz4G92tSmfM4i8DLIBzmxBnHkZ1NT3IGcRYJ5zZ
         CKnWl/xYfCczjoBUl2jfGbl4f9Wa0g1Qsd6aRlOfZK9If1Ui3heKgzn+0ynxC3CSkak5
         WQCWFslkwofwTJWEhymFn/4MVouxKfyDPPlBjUpF3NIvy8CmcTS0S1QbMo2Jdx518HJk
         dd7/Vock1kPiwDOtdp0b7R4E4M+TH1UABIU6lYZec3lDTdcH7sYiREJEtgDSJktC9oBP
         DD2Va7xGgk+v6KI7dcRhxyOc2wWF5+BiKKtbkDlkwV8UVFcqeUALIiNJ9XWlhMPSdtBb
         GaPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=evvBeJVEOdHEf1c47iFzEnVNgSaC8Vwr5xUfh5Vnf08=;
        b=zeWYsEzLrwUEvI3c7TUmI5eCyQ0glYmbKwUsyZ7VE1063U2EC3pyOgaivlCHEsn/fI
         1G9PJFAG7/i29jgpPvhIrDp+RGtvYaeapOucp2D91gi0xuQ5YaRa4n8cJxT3SauOnDc0
         2btl+zMnFvT2IavIVSaxf9gLUqJbL6WojGYOfSyB6xx3xZvlThYHI00WOHXQumNzUTbm
         2X7hgyLyMdbw315TEkUZu2Yq7Ti3at0q6UpIfg3Axb/p1ar/5D6OxRFDmEt6jbC5UfH8
         vpgBsedqWZXiJDNIHnl6eTqS7AtbrDZF1PGvwE/6e2Ad46JVFUjFw2AvlK1hSEaJmx37
         dHjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eSXrpHRX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4si15012435ybt.454.2020.09.16.06.48.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Sep 2020 06:48:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eSXrpHRX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIXnU-000107-28
	for alex.bennee@linaro.org; Wed, 16 Sep 2020 09:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kIXnD-0000yc-Kk
 for qemu-arm@nongnu.org; Wed, 16 Sep 2020 09:48:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kIXnA-00081K-Qn
 for qemu-arm@nongnu.org; Wed, 16 Sep 2020 09:48:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600264088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=evvBeJVEOdHEf1c47iFzEnVNgSaC8Vwr5xUfh5Vnf08=;
 b=eSXrpHRXETIghT1tVyJKvQPvBivdHQFDfrFFA1D53rgBrC17Xjgqf20bgZeqyMQ5O1xQ6I
 Yp5Bg97nBppx/15ZTvnXKEbILbdghBXKqknlyDA59iOQPBap4C1M1iQYAZgS7Km7zdnCTG
 ZTHTEWWv6FTOisP55yxQX6eC4WRuvdA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-di1HePX8OyalArl6LYoUHg-1; Wed, 16 Sep 2020 09:48:05 -0400
X-MC-Unique: di1HePX8OyalArl6LYoUHg-1
Received: by mail-wr1-f69.google.com with SMTP id d9so2566142wrv.16
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2020 06:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=evvBeJVEOdHEf1c47iFzEnVNgSaC8Vwr5xUfh5Vnf08=;
 b=NskYEldOeVlqzapAUKAKXrC0+AOVViiVb1vtlPFlH2sNjM0afRhaFja53FoNz7PBFj
 svEQuRE3KEyvge7yaVw1rlXU2WFsrKnCWeh0Q8ru3LDBab+NPjOfbLS9163XMNrP8kVb
 FhNy2y5HaFS2+4o9ghdruC2qha/DiSqBldsrk3r+tO4jSu/0JWv4aP1VMPM17gaGVhoo
 g7lssdQAGQvnKbj2OlidEhlSER3R8kaZaru9ansK+qrmdjOTt/V6wrXeqc5Kn7G/GWjg
 wR0qigcS7sDW9+9oZ9l2aagl9lK9Gh3SPpI87VLECi2vjr4UMYE8Yz1f6UJ8lyzi61s6
 SGoA==
X-Gm-Message-State: AOAM533sez4S6J3drpQtPLBhe8e8UtkSqh8qZkbDWzyKuQw+61ukekx3
 8qmpJxqLklTIao6MjIQY4Fb/ndHP8gbQOc6RZzhRynA6lscFURAs3LFXpHMao4xPxbXjMuONMQT
 MFUyF2OXS6V1C
X-Received: by 2002:a1c:e4c5:: with SMTP id b188mr4007541wmh.67.1600264083908; 
 Wed, 16 Sep 2020 06:48:03 -0700 (PDT)
X-Received: by 2002:a1c:e4c5:: with SMTP id b188mr4007513wmh.67.1600264083666; 
 Wed, 16 Sep 2020 06:48:03 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id a81sm5881245wmf.32.2020.09.16.06.48.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2020 06:48:02 -0700 (PDT)
Subject: Re: [PATCH 00/13] dma: Let the DMA API take MemTxAttrs argument and
 propagate MemTxResult
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 Eric Auger <eric.auger@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20200904154439.643272-1-philmd@redhat.com>
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
Message-ID: <69f3f4d6-de7d-9535-03b3-a57ca8f041d6@redhat.com>
Date: Wed, 16 Sep 2020 15:48:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200904154439.643272-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 02:16:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.062, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Peter Chubb <peter.chubb@nicta.com.au>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Li Qiang <liq3ea@gmail.com>, Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Joel Stanley <joel@jms.id.au>, Peter Xu <peterx@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qaOXJV7EY1Xp

On 9/4/20 5:44 PM, Philippe Mathieu-Daudé wrote:
> Salvaging cleanups patches from the RFC series "Forbid DMA write
> accesses to MMIO regions" [*], propagating MemTxResult and
> adding documentation.
> 
> Philippe Mathieu-Daudé (12):
>   dma: Let dma_memory_valid() take MemTxAttrs argument
>   dma: Let dma_memory_set() take MemTxAttrs argument
>   dma: Let dma_memory_rw_relaxed() take MemTxAttrs argument
>   dma: Let dma_memory_rw() take MemTxAttrs argument
>   dma: Let dma_memory_read/write() take MemTxAttrs argument
>   dma: Let dma_memory_map() take MemTxAttrs argument

Talking with Laszlo, he wonders if we shouldn't enforce setting
MemTxAttrs attrs.secure = 0 in these calls.

Is there a concept of "secure DMA controller" in QEMU?

Thanks,

Phil.

