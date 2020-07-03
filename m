Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2474070lfm;
        Fri, 3 Jul 2020 06:35:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeBwTUKtv3zNUep/q/xwHoZCe5Mq5IRxqqE5vegHorwMNB5CozMg6JdWA5re6rvptVtAGq
X-Received: by 2002:ac8:6a11:: with SMTP id t17mr37847297qtr.272.1593783324682;
        Fri, 03 Jul 2020 06:35:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593783324; cv=none;
        d=google.com; s=arc-20160816;
        b=m5kUwV8b44lUhPsYCG65tBiOO5fWOT44J4LWcZ21VVtwPtzlLL7+Cy36SujFQqe510
         YRPYV5ZsLs3DBsiDaawP7WAG+zREdDi4yIaSJdi/lLjLEL9T8upWNoiNy6QPcuZVyl+z
         rrccGn1DQgSp8mL6CK7NHhl7Smd/0H/YMk0h+xEeqKru1bewEH6fNG4pJTRQrOeQ8ZIp
         enymSCSt0xbleAmXZy40cZ1hWpe3hSA/cza6oO/m3WEwdugvvJiSDvmO3wtt8fuIE0GC
         kAmyqHUvEvCFW4pcgW2Rwe95GOlQaJBp5H6pC7rt9JMRnmIEI6QXFqZFqBx7rUMy46tl
         OUiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=/CQ9zqDg8ltHtM4ewSqe96QwVsTq6Q60kANp4MDHTio=;
        b=TS0XR6fVMOJURIvtxocnM/ziHjbOzmz6K40Pvqd6rcZY22cpQcU2T0w/nYrUeUyjIN
         wJfC9fvmzuzHxGnQOxA7BKzz9HOr345aalKW3gUNBgYIZ+zE2QlTEonfq4CNz90T501h
         puBi9Nu8wXpecK8ZWKKZmeIjOpCJafVVFBfKSq7c0iKU0fPez0hQcWte7hpCFoMObSRn
         IIo8isLxTMhAyv4R/fraNnUMqgHkHz2xnIJJmQsJAmFHpBiXo12/ALC6K9u05FDAlaeO
         EUBuvq3UZyxgnagfsRK8Q16YDLiWGSfSXvu+DKzoyL2WLm3FSpii/f0XonpfAhusrd5/
         lGfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F4Jn3nt9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eb12si7299402qvb.143.2020.07.03.06.35.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jul 2020 06:35:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F4Jn3nt9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrLqe-00087Z-1n
	for alex.bennee@linaro.org; Fri, 03 Jul 2020 09:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrLqX-000876-7b
 for qemu-arm@nongnu.org; Fri, 03 Jul 2020 09:35:17 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:31783
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrLqU-00048C-M2
 for qemu-arm@nongnu.org; Fri, 03 Jul 2020 09:35:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593783313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/CQ9zqDg8ltHtM4ewSqe96QwVsTq6Q60kANp4MDHTio=;
 b=F4Jn3nt9YmTGbvt/zf1HXJYEIXapM8sTg41bG/O0QUy7jByg/DNr1DEysVoOdPzpCvaOGX
 voSFebh7SBqjHu5dcnv4P7CMaYw9b1wfx5547QSMtVUG4LpaLBfZ394Kv4P9p44cgwwa78
 cPtt5XCHyNR0DqVM28M8Qj+HJdgAy8w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-N5TzMYLGNtiwapRDnpLWlQ-1; Fri, 03 Jul 2020 09:35:11 -0400
X-MC-Unique: N5TzMYLGNtiwapRDnpLWlQ-1
Received: by mail-wr1-f72.google.com with SMTP id a18so31617404wrm.14
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2020 06:35:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/CQ9zqDg8ltHtM4ewSqe96QwVsTq6Q60kANp4MDHTio=;
 b=cO0nJveWBVRhsbRIvArbiCQsqNDetUKWHmTfKV8n93t3GuMKW7hcNBagmSZsX3JV1x
 67BKiwTHz92k8KlWdDfoEud0yQHZmslhax12k08ndQgKIEbc5Z9RyuFEG4Hv4w3fQ7Hb
 sewCzKEO8kN1+3oh+RbIEe9q8pk8tylowZaYh3mx1zJUkxphJ+SGoiojRbpLEA4DfmuW
 wBJAUYJq0//tn+wdCn3aJGVzHJWT26eNMOkNnVt2UxEThLuL/kVDYwXlo8BO1+SRuJPQ
 mP82FY8uGGpTTz3Ciu7wimJlZzY82Bv2vVpzrRRm9ckBhXqziGx0Pu0N9Tbs1ugBjy/Z
 YNwg==
X-Gm-Message-State: AOAM532lHhptbAtCsBiBJ5lchUeRmXDTly+3Bqxe6p89zzJMsvCKa4TL
 TznMhJArdJvpcghsBXxa0ugCmbMLNOx/OJ6txTm9hs19qe8Pnizk5z3np330uodY7bHmxni6oU3
 qEhQcHrWEvCf5
X-Received: by 2002:a7b:ca4c:: with SMTP id m12mr37079405wml.33.1593783310289; 
 Fri, 03 Jul 2020 06:35:10 -0700 (PDT)
X-Received: by 2002:a7b:ca4c:: with SMTP id m12mr37079378wml.33.1593783310024; 
 Fri, 03 Jul 2020 06:35:10 -0700 (PDT)
Received: from [192.168.1.39] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id x11sm13025193wmc.26.2020.07.03.06.35.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2020 06:35:09 -0700 (PDT)
Subject: Re: [PATCH v3 00/12] Add Nuvoton NPCM730/NPCM750 SoCs and two BMC
 machines
To: Peter Maydell <peter.maydell@linaro.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20200626235519.591734-1-hskinnemoen@google.com>
 <CAFEAcA_3y3XoF6BsYUt19f2CvyseahSEZWfY0iQxByJKaMA29w@mail.gmail.com>
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
Message-ID: <296f281f-e045-e794-1a1b-4e311b6408b2@redhat.com>
Date: Fri, 3 Jul 2020 15:35:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_3y3XoF6BsYUt19f2CvyseahSEZWfY0iQxByJKaMA29w@mail.gmail.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 01:34:15
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xffhcl0Kpvs+

On 7/3/20 2:27 PM, Peter Maydell wrote:
> On Sat, 27 Jun 2020 at 00:55, Havard Skinnemoen <hskinnemoen@google.com> wrote:
>>
>> Time for another refresh of this patchset. Sorry it took so long -- I've been
>> trying to figure out why the Winbond flash model isn't working with
>> npcm750-evb, and I'm fairly convinced the number of dummy cycles in DIO mode
>> should be 4, not 1. Unfortunately, I don't see any other machines using Winbond
>> flash in DIO mode, so it's hard to prove that it's correct. I'm planning to
>> post a libqos-based test suite separately.
>>
>> I'm also planning to add the vbootrom to qemu as a submodule, similar to the
>> other roms, but not in this pathset (let me know if you do want me to include
>> this in the series).
> 
> Hi; it looks like codewise this patchset is ready to go in
> and it's all been reviewed. I see however that all the
> new files are GPL-v2-only. We usually prefer GPL-v2-or-later
> for new code: is it possible to use that license instead ?

This series has been posted before Markus qdev & error cleanups.
Maybe some newer error patterns should be used now instead?

Phil.

