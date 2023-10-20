Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1100316ejb;
        Fri, 20 Oct 2023 02:56:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4QIQ814qPydcPk8BEreR3w/tRD256z42J0YZXBr0uJhH/BMP/V0tlE4rIoUZreZQvqSGi
X-Received: by 2002:ac8:5cc7:0:b0:412:1e4c:e858 with SMTP id s7-20020ac85cc7000000b004121e4ce858mr1320860qta.36.1697795778335;
        Fri, 20 Oct 2023 02:56:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697795778; cv=none;
        d=google.com; s=arc-20160816;
        b=A6U5LVXZe5dZ+G4bNgHiT9V8SfamVLtgIUCI4IXXacM3f51Nuof8WWuss/Hh2OzGQr
         Fbf63Z1JhUR2UwLdmg39Z5ACg0FsPJF9ff70XUzvV83YO96dbyonf2minwtCGp3ReuGO
         XfmbJqpXpYQJZB1sHoB3PcjD4goEin3ILhXBwIvcWqx4l9Eixd4+vDvnGC6C820FSz4i
         6LsWA1nwrGdUlDkJtD0RT/fHRC2e9fEfoCQI3avkVW0RhSUzPrvG1Ue+V3mif9MkVL0C
         bZWXHD9pQPZHTW0hN2C3trs5xQLO7pN1aV8Mo4ydei7jAr27xGjusZEA6OVUB61NZ/Pk
         0TMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=uyCQ3JOMjxpTB90xcLbkVwCMiUUrscp7/JhQytkXrCA=;
        fh=qCRfnOedUTyKWvR944ye0PJpcd3Ea9dAM7CTk6O44Vw=;
        b=bikcf343t5zerJiTt5oxoxLJumqHKr0ShyY7qrKKKY46KGAqRKlE7XXT/wAqlaHIig
         4uU+kE+yUVYJtREAIUM2Vnm6164CA+rOM1RoAlgJWvHwcgC4T+kY94cmNUlUMTvcOz1G
         4qHQykm5RtLsqkBoHp/ETmrs80CmkQB/T+D1xKuJeA34Igv7By6Bf4wj42ttHpucMxY8
         26wR4VHDI++nuH0WlvIua7IKHFHJMcZCcwxkaDiqBvq8C01/f2f4ZRTytGMg2+kuYlG/
         qsKRQdvOdzbTGVJnC7kqc4/hq9IDIJBqwUOIsYryktHCDFUbUB5u77WgLfHyTHnm1/91
         nSsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MS5Zcvjc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a9-20020a05622a064900b00417af0ea0c6si988198qtb.358.2023.10.20.02.56.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 02:56:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MS5Zcvjc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtmEm-0005Jj-SY; Fri, 20 Oct 2023 05:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtmEV-0004yc-KJ
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 05:55:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtmEL-0003Rq-Kh
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 05:55:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697795741;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uyCQ3JOMjxpTB90xcLbkVwCMiUUrscp7/JhQytkXrCA=;
 b=MS5ZcvjcjAtdcbMUi77LyB9avsB12LdFKuGJoyLYJPGmYPpgxOLsvns7gMy4vBhesLAJ3R
 A19aJ31aIr41hwlFrPUyPN1KhGCufA0prr/fXz3TRaeJA+nPRLxmEcTghVop2KnT1flMXS
 A/peY8xlZESERTRFV5e9Svzg1WVSrs4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-30AnzSVBNs6WR3gU1_pBHw-1; Fri, 20 Oct 2023 05:55:40 -0400
X-MC-Unique: 30AnzSVBNs6WR3gU1_pBHw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4083fec2c30so4009955e9.1
 for <qemu-arm@nongnu.org>; Fri, 20 Oct 2023 02:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697795739; x=1698400539;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KLMU+I9osao7AtazXCWDbLO2o5vrv5iN8qcDoN2HNVU=;
 b=KMeK+9psR6WJuo7JtyueWPt5nRl43dBQFrHoq0s9zUOtoLf8m/pgX5VPfj+MvhnqRB
 2ymk9WbR6AZFyhR2Icw54lTPBlEtWWYglrfNHXi2TxSxxyLHeFHDUN8QQ+8Mhq/LZHCJ
 8GNGDb4fCGhv+PAZbbtZ5TNaXMjJB8K7tnP0m4r6ke48AxWc0XoH/xxHNeW9TEtk/+kl
 sm2VkqK0ogdJxYzTCJzuxX9X84KAYvfI8VhZl70yeWrOY4OT37sQm9mofcRygn6CVYfe
 IDuDiuj8sAqtljza96VOvpzxtD5oBJGWRS52Bu9TAgfgo5YJZVpL7WOzaCqmwNBEeTw9
 J3AQ==
X-Gm-Message-State: AOJu0Ywftmk8gS4yawAVDVEfnfSSWGAMOnscnuQL436DGB1bL1au9iAk
 q0u/Vd9MNUXkyRL87fKcn0dz5Ta+D/Jv/J9Vsn3jltG8cGm7GwTsAO9h7o/ghDplDamIJoacBH1
 qkt/dStgQfd7R
X-Received: by 2002:a05:600c:4593:b0:401:b504:b6a0 with SMTP id
 r19-20020a05600c459300b00401b504b6a0mr1097884wmo.3.1697795739076; 
 Fri, 20 Oct 2023 02:55:39 -0700 (PDT)
X-Received: by 2002:a05:600c:4593:b0:401:b504:b6a0 with SMTP id
 r19-20020a05600c459300b00401b504b6a0mr1097874wmo.3.1697795738802; 
 Fri, 20 Oct 2023 02:55:38 -0700 (PDT)
Received: from redhat.com (static-151-150-85-188.ipcom.comunitel.net.
 [188.85.150.151]) by smtp.gmail.com with ESMTPSA id
 h14-20020a05600c314e00b003fbe4cecc3bsm6612838wmo.16.2023.10.20.02.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Oct 2023 02:55:38 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org,
 qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,  qemu-block@nongnu.org,
 qemu-s390x@nongnu.org,  Peter Xu <peterx@redhat.com>,  Leonardo Bras
 <leobras@redhat.com>
Subject: Re: [PATCH v2 10/22] qapi: Correct error message for
 'vcpu_dirty_limit' parameter
In-Reply-To: <875y318zgy.fsf@pond.sub.org> (Markus Armbruster's message of
 "Fri, 20 Oct 2023 10:33:49 +0200")
References: <20231005045041.52649-1-philmd@linaro.org>
 <20231005045041.52649-11-philmd@linaro.org>
 <875y318zgy.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Date: Fri, 20 Oct 2023 11:55:37 +0200
Message-ID: <87edhpzkh2.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QYlnAFhyinYS

Markus Armbruster <armbru@redhat.com> wrote:
> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>
>> QERR_INVALID_PARAMETER_VALUE is defined as:
>>
>>   #define QERR_INVALID_PARAMETER_VALUE \
>>       "Parameter '%s' expects %s"
>>
>> The current error is formatted as:
>>
>>   "Parameter 'vcpu_dirty_limit' expects is invalid, it must greater then=
 1 MB/s"
>>
>> Replace by:
>>
>>   "Parameter 'vcpu_dirty_limit' is invalid, it must greater then 1 MB/s"
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> ---
>>  migration/options.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/migration/options.c b/migration/options.c
>> index 1d1e1321b0..79fce0c3a9 100644
>> --- a/migration/options.c
>> +++ b/migration/options.c
>> @@ -1163,9 +1163,8 @@ bool migrate_params_check(MigrationParameters *par=
ams, Error **errp)
>> =20
>>      if (params->has_vcpu_dirty_limit &&
>>          (params->vcpu_dirty_limit < 1)) {
>> -        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
>> -                   "vcpu_dirty_limit",
>> -                   "is invalid, it must greater then 1 MB/s");
>> +        error_setg(errp, "Parameter 'vcpu_dirty_limit' is invalid,"
>> +                         " it must greater then 1 MB/s");
>>          return false;
>>      }
>
> Make that "greater than", please.
>
> Arrgh, the unit is MB/s even in QMP:
>
>     # @vcpu-dirty-limit: Dirtyrate limit (MB/s) during live migration.
>     #     Defaults to 1.  (Since 8.1)
>
> Should be Bytes.  Escaped review, and now it's too late to fix.

I want a Time Machine.
I want a Time Machine.

Wait, if I had a Time Machine I would not be fixing old bugs O:-)

Later, Juan.

