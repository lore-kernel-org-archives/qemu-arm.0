Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp3120762njc;
        Tue, 25 Mar 2025 23:58:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXYbF1J/AsX5djzwTHmiRc1bP2b7tdwKYhXoXL6/rJZb8+Ma7+x4nGC8wgVnMWY/JlcIZQrA8Tk7AtN3Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGuNdfw/ow1MUNXYblkbT2Uzttrsio6eys2Z5h4uHA9ssycRQG2DL6bVaE4+a6rnmxmirVw
X-Received: by 2002:a05:6214:29e9:b0:6d8:9872:adc1 with SMTP id 6a1803df08f44-6eb3f34ef14mr273112896d6.38.1742972309910;
        Tue, 25 Mar 2025 23:58:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742972309; cv=none;
        d=google.com; s=arc-20240605;
        b=XY0mQCoeR01ZHuKhl4tOI/XGccZNHd/IqOmyJvV45pJ5z6C4fvdInPBUxQh9pT9CbI
         Y5SRAm7pj2NXKTNHktG5irq4iZ17JpRQEzNOPcJWUF2Xmi3NrJL3aNzn1QaKoJ54T7rN
         oZuijJmT9JJfOMckS8N0poIIlBwGXK2R4fLw9xK2d8NAnWnGGGD5ZY5Rg5JRr8hyNkmY
         EqOI5URWcGGSl1FZJBTtcC4fHCoHOIN5nNqyi3kVnc6CSIHsmcR70vfPQ7wcbt4LP641
         f1P0qEKqLE1HxJtd7LC18xoeqZTakA75gUUpJ7ET4UADvEiuO8ZnSq/JMdAutrS3lPNL
         2BsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:references:cc:to:from
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=0AzN5xSX6LaAYJWnW+KDdVoFZ+K7nFU8tIcY6uPQyCg=;
        fh=xjIooHVGarNRFXcIuTWKsv/8/GQ+NP/oWEfOjovJxXI=;
        b=Hfp/dB4WRVchRludEDHK/134VhNWL7CcZkmlyfK4ikn4RcGTozX2H+DaN9QHfQoX0H
         Deqyucw2Ym6KgEUAtoG+LA0qbpVeUfrqY2BLbiMjBZ2LkEWCQJsx4YAyRVDj9nloSL3s
         dqIvsfW4/3AdOLgoq4/Yo6B1AsITyb7FM6ym+QV8tCJ03qIAQulrvMPfJO2NkXGpNne7
         1Oo1DlEPypIh6lCPo6xq/sAcLOJRIb9FG+Ths3NMomc2Zlmi6pzCvej/6as1Uuuy2Sak
         Jrfb3YoHHpRPO5MGYZROaO7nCuJRwCZ+jwYPGg4OMpG9njWGISlGFKE89r/J6vKvBogm
         YTmg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=INbczFpX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ecdcaa2da6si102446406d6.335.2025.03.25.23.58.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Mar 2025 23:58:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=INbczFpX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1txKiC-0005vY-BC; Wed, 26 Mar 2025 02:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1txKi2-0005sk-CV
 for qemu-arm@nongnu.org; Wed, 26 Mar 2025 02:57:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1txKi0-00076q-UA
 for qemu-arm@nongnu.org; Wed, 26 Mar 2025 02:57:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742972272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0AzN5xSX6LaAYJWnW+KDdVoFZ+K7nFU8tIcY6uPQyCg=;
 b=INbczFpX1MSH8d4WBZHq7y0xURLbTbgXlssDN8r0yi7QgIgqNLKtidEKfKe9Iv1mx23fJq
 oLYqk9/nQ9ZTYfWTyrTobbdcopho2bh9e7ytjERnF4vCr/JgX07IzfxEqleOSrlVuKrLVO
 bwTGC/fAUxyWtQxhyIigg7zVNuXAKv8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-xqkSplrnMOK9QlGDQXfLww-1; Wed, 26 Mar 2025 02:57:48 -0400
X-MC-Unique: xqkSplrnMOK9QlGDQXfLww-1
X-Mimecast-MFC-AGG-ID: xqkSplrnMOK9QlGDQXfLww_1742972267
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-ac384a889easo55143866b.0
 for <qemu-arm@nongnu.org>; Tue, 25 Mar 2025 23:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742972267; x=1743577067;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0AzN5xSX6LaAYJWnW+KDdVoFZ+K7nFU8tIcY6uPQyCg=;
 b=V/efsbtKAMTR7zoLBnQER6iGV6uUSzRvR1TA4B0fXZYefj8V3of5H/803e9j92em2v
 n93XM0UfmToUA5dN15xSrIaCKD8x1sM6o6cVxfMrTnR589ZPkU3iv0Ab9W5CcqDJMDvC
 8YJzOYdwUZG0RLbp1cv/O8bfRaNkAxc8D9NTQg7s4QzenfgwJkqEaclooxA4kUpFzuw1
 5Ckd61tSSmrU7bV6FrhOg7MBReCt9AnUn92M+82AB44/H651gwI3hvykzWmLgUYnEgiY
 6q+x8tYTHOkA0EuZ6ZgAhnqntBx9Oy5dYlDJfNGlZCsIcaPXvvRG01EY7mhSuGdxaN7u
 14Zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyzLy91eXClvSEYHl+NwNCUyersOjYU5WzGVor6brVB4wJA1+xLa78LtC2kDaO95I9E5aZkwrbCg==@nongnu.org
X-Gm-Message-State: AOJu0YyNiq6XWIIVKPXRNqTjA0wUJJg85/JDbtTkl9271sIpUlsvpJGK
 x8D+8i38hoaDhoR4wfjw+IaQVO9IABdzn3fJDTra7KoiE1MG78DnygSQAEzlui2urIAuCs6q6sM
 1Kw+xkQ12PysXdJsNcl0YhOaloKB4y/BEZLDKZJ8oaXZivlU1NQ==
X-Gm-Gg: ASbGncvA2pbYqcR4yO514RWegUabBj0foI2l9Xw/iLc9RnozsOQKlAW7ckH0bnUtx2h
 6ZnnI5rF0L3CtZjBZO48T2Xg5dRyoVHFG1te0Qa3BUdWLgYpZoto29hVlaSrhJTrWU+v6j3F2bn
 hXc5bkiz4TSI7Wt18zarBYZE7gNVgDdl0HzZabxcwtNrhKOA711CYIGc6SMy0p6Q494xV/9aUCF
 mVc3VcqE5UBXftX5c2wW5xklBwKH65IL+Kg80ubaFV+XMeR8+efLu7TKAfykC1sK5I+7poNgv1F
 51tjg4RJXdVi9a6HC35GZKJ0LkxYaSPzFEeH6s4pK+eequ8=
X-Received: by 2002:a17:907:c7d4:b0:ac3:ed4d:c9a1 with SMTP id
 a640c23a62f3a-ac6e0a73a92mr246435966b.17.1742972266675; 
 Tue, 25 Mar 2025 23:57:46 -0700 (PDT)
X-Received: by 2002:a17:907:c7d4:b0:ac3:ed4d:c9a1 with SMTP id
 a640c23a62f3a-ac6e0a73a92mr246433666b.17.1742972266229; 
 Tue, 25 Mar 2025 23:57:46 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-43-49-206.web.vodafone.de.
 [109.43.49.206]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3ef8e532asm987682966b.56.2025.03.25.23.57.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 23:57:45 -0700 (PDT)
Message-ID: <befafa24-f2a5-4c7c-963d-4ea89e44fb69@redhat.com>
Date: Wed, 26 Mar 2025 07:57:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 01/12] hw/audio/wm8750: Categorize and add
 description
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, =?UTF-8?Q?Herv=C3=A9_Poussineau?=
 <hpoussin@reactos.org>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Glenn Miles <milesg@linux.ibm.com>,
 Samuel Tardieu <sam@rfc1149.net>, qemu-block@nongnu.org,
 Patrick Leis <venture@google.com>, David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Bernhard Beschow <shentey@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Hao Wu <wuhaotsh@google.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
References: <20250325224310.8785-1-philmd@linaro.org>
 <20250325224310.8785-2-philmd@linaro.org>
 <892797b6-8d2f-4234-840f-e36ef94b0701@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <892797b6-8d2f-4234-840f-e36ef94b0701@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DvO-iWfFyHgicqkFQb0Akwsq3nxwwGmM9i5w992dsGQ_1742972267
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: np2eZA1QdeXA

On 26/03/2025 07.47, Thomas Huth wrote:
> On 25/03/2025 23.42, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/audio/wm8750.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/hw/audio/wm8750.c b/hw/audio/wm8750.c
>> index 8d381dbc658..6c1bb20fb75 100644
>> --- a/hw/audio/wm8750.c
>> +++ b/hw/audio/wm8750.c
>> @@ -721,6 +721,8 @@ static void wm8750_class_init(ObjectClass *klass, void 
>> *data)
>>       sc->send = wm8750_tx;
>>       dc->vmsd = &vmstate_wm8750;
>>       device_class_set_props(dc, wm8750_properties);
>> +    set_bit(DEVICE_CATEGORY_SOUND, dc->categories);
>> +    dc->desc = "WM8750 Stereo CODEC";
>>   }
>>   static const TypeInfo wm8750_info = {
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Looking at this twice, I think the patch is not OK in its current shape: The 
wm8750 device now shows up twice in the output of "-device help", once in 
the "Sound" category and once in the "Misc" category (inherited from I2C 
device). That's somewhat ugly. I guess you'd need to remove the MISC bit 
here to clean that up?

  Thomas

