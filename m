Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1987521lfc;
        Mon, 25 May 2020 05:26:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsuV2QVRXycNjSFapJfTh1VIqCKbSGqXLjix9Zgwsh5V/JMi7X5Lv9xFcC3MdGiXT1iKYM
X-Received: by 2002:a05:620a:995:: with SMTP id x21mr1320988qkx.418.1590409594561;
        Mon, 25 May 2020 05:26:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590409594; cv=none;
        d=google.com; s=arc-20160816;
        b=owbq+Iy3uxCXbr9r1YnXjTpSyZkSLQ53oeE25EiaRPqC/FtQ0WTwQu3xvPureKk1Ht
         Kq/VucPNkkOaq/gvOQhDCWdbQplhunXWdip4vDDgS+CS0RNw+7jqCt+6NrAUvsAqvS14
         xMiVVgl0DwiCvH0V02v+RLX5EK/JfLn7+ssx6+YMnUL4w3P0jyILbAyUcnpj8+Y3ODdS
         XlXNkfTxDuQWHcCRrv6HHvugXQEKBnq8Gw135eVMln+CaHrCh/YUqO6eJRK34F293bXe
         kCCreIWrp9KgdcCLQqzzl80DYv3M1gV7Q/r7XHOjCx96u9iKfGmjbY8Hc5RXj+i+SLIq
         cSNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=OTIl+ekkPLKdO4cj3VLhqIuhsiSWInFiQX5LoGhptUk=;
        b=xj14UtVJij1kLPCEze6EpsMg7+Z3/MFIfFbicaL4mfA4Kn/lmCGdMCpWq9qUEvU3BU
         z/2xjXhfP3LF2Tpiv2nPJx8DEmNZCeunkCsxOIG0YdYQAyB7a8pwsU2AzKEA4j3mKPNp
         Fu8QPwhPrZ9/v53yKfL80YeOxyY4Lk6l9RFhi1XJXjUrQm3CvLoW7PBSKXANX/5bXMSR
         +HukC0QkE2MTpazT5cohxU4nkvK3Iwe7qlQOhNT74e39o5c1DMUV3l86yv3KuJrGgPB/
         uCFfjke7gDiCpTo/wSjHMibsQp7+ZKM+6nIOWI9/QmxddMSA0rYDPcAm6+vtLnyOfSct
         RPCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Xietymdz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j7si3584869qki.133.2020.05.25.05.26.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 May 2020 05:26:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Xietymdz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdCBd-0003EZ-WE
	for alex.bennee@linaro.org; Mon, 25 May 2020 08:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jdCBV-0003EB-7e
 for qemu-arm@nongnu.org; Mon, 25 May 2020 08:26:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40171
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jdCBT-0003jI-7N
 for qemu-arm@nongnu.org; Mon, 25 May 2020 08:26:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590409581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OTIl+ekkPLKdO4cj3VLhqIuhsiSWInFiQX5LoGhptUk=;
 b=XietymdzuWDcYiFKTCVf1NE1E31y9lG5rPzhSUL0Znd+reAhyQpsnN78/Z2wNy1fRS/q+w
 G88vY1K8NDNG0BtAjAkV9FLywZap18+OKI820XKQ0zzLBDOQHK3K1QftLk+DJ91KZ40uho
 OZazClWSQ0SLGSyMcyF1/ExMeT0wVeA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-F9dufHmDNem5vhN4-m0GDg-1; Mon, 25 May 2020 08:26:20 -0400
X-MC-Unique: F9dufHmDNem5vhN4-m0GDg-1
Received: by mail-wm1-f69.google.com with SMTP id f62so6655264wme.3
 for <qemu-arm@nongnu.org>; Mon, 25 May 2020 05:26:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=OTIl+ekkPLKdO4cj3VLhqIuhsiSWInFiQX5LoGhptUk=;
 b=sJwaxdTnoJDDoZDu7MOYjFYCKbsAp5pZJ0vbBgFqBK5CXxAjOwD6KWOlf++oGlBTIs
 0X6gexRtkWDF09ggLQmBEcXOEdTWQXHPjM6b1Q1vzjpOFZ/UgN08y68mKCRxdU9+QvDh
 FVDZRUsZ8hFG91jkzWaF/RuIowXLw9V3V18vQC+UUh1rndMTtqmyx+F06oCQe/X7a/WO
 +zy+VT9abay6x52c7gaV+cjCRxGaUi3nveda0HU6m3cMue8XNOc5iwuDYLsN1e8TI/Nh
 skyfuDCXTsfkR8wDLPcApHlJAcGLqQxOFSZABH+mOVeLLyJSeq3fuokbFC8wJBbgB0vW
 c4cw==
X-Gm-Message-State: AOAM531WC2o3ZusE6VsOkATZkUBfiMkg71m6L5AU0aThsGXoF4+Eqe8Y
 D+09FBz1by48TYvtzJb60myTH4PQd2btUE4B71AuEsxKTPiVqR9SfPbwwAST0gVxS6Ii8HqQ07T
 M941pDm3KBzGo
X-Received: by 2002:a1c:a905:: with SMTP id s5mr3129185wme.120.1590409579191; 
 Mon, 25 May 2020 05:26:19 -0700 (PDT)
X-Received: by 2002:a1c:a905:: with SMTP id s5mr3129164wme.120.1590409579013; 
 Mon, 25 May 2020 05:26:19 -0700 (PDT)
Received: from [192.168.1.36] (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id y3sm17776580wrm.64.2020.05.25.05.26.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 May 2020 05:26:18 -0700 (PDT)
Subject: Re: [PATCH v3 01/22] microvm: name qboot binary qboot.bin
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20200520132003.9492-1-kraxel@redhat.com>
 <20200520132003.9492-2-kraxel@redhat.com>
 <2a9e8f07-a1eb-9c3b-5070-51d5a87d76d5@redhat.com>
 <20200525110254.ikq6anobblj4uo5a@sirius.home.kraxel.org>
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
Message-ID: <a2e1f20a-8d99-02c1-4442-3043a8ae6fd3@redhat.com>
Date: Mon, 25 May 2020 14:26:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200525110254.ikq6anobblj4uo5a@sirius.home.kraxel.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/25 01:44:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /zQXUry/SD1i

On 5/25/20 1:02 PM, Gerd Hoffmann wrote:
> On Wed, May 20, 2020 at 03:25:53PM +0200, Philippe Mathieu-DaudÃ© wrote:
>> Hi Gerd,
>>
>> On 5/20/20 3:19 PM, Gerd Hoffmann wrote:
>>> qboot isn't a bios and shouldnt be named that way.
>>
>> Still it resides in a directory named pc-bios =)
> 
> Yep, that should be named "firmware" but changing that is beyond the
> scope of this patch ;)
> 
>> It is used later in x86_bios_rom_init() as:
>>
>>     bios = g_malloc(sizeof(*bios));
>>     memory_region_init_ram(bios, NULL, "pc.bios", bios_size, &error_fatal);
>>     if (!isapc_ram_fw) {
>>         memory_region_set_readonly(bios, true);
>>     }
>>     ret = rom_add_file_fixed(bios_name, (uint32_t)(-bios_size), -1);
>>     if (ret != 0) {
>>     bios_error:
>>         fprintf(stderr, "qemu: could not load PC BIOS '%s'\n", bios_name);
>>         exit(1);
>>     }
>>     g_free(filename);
>>
>> Many 'bios' occurrences.
>>
>> Should it be called 'qboot.rom' instead?
> 
> I don't care much, I only want bios*.bin for seabios which actually is a
> complete bios implementation ...

OK.

Preferably named 'qboot.rom':
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

