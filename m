Received: by 2002:a17:906:14cc:b0:9b2:89ee:1eb8 with SMTP id y12csp111327ejc;
        Wed, 4 Oct 2023 23:35:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZwgxss+cF6oKDzQAlMlA5aFs8Y1kfxPTAiStwlKlicEmj68tezLH1G3+qchYbjUYEcrnY
X-Received: by 2002:ac8:7f94:0:b0:418:157e:e3af with SMTP id z20-20020ac87f94000000b00418157ee3afmr5410269qtj.14.1696487700544;
        Wed, 04 Oct 2023 23:35:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696487700; cv=none;
        d=google.com; s=arc-20160816;
        b=mromRjBb3kAVdX7SM7WopMgd/YOIVpdYK5G7Kt42ZwVyFTjQ0zOa+KV9wXKbOq86lo
         2iCm1dDZzR7v7hAV5gZhcenuZRV1pGfFgRAo0sqyMQ1+bxUE025B9zGRIZHUNglV+7V3
         cAciz0iLSD3x9JtoiuZViTnpW/AggXA/eMD75j4nB1zqpsQQj2rDrSXqcp7r6LWhun5y
         9NuI+ndlRb7XKDbDfGODc3kQLH8UNP+VEjNE0XrlJlnGZsNzcwjSKUItCqnTJd5LaGT2
         jSfs7LT1Q89TOKzncUAd4Bxrfn0eTEQxoNJmRVj+8AVWjCXkfOBlLxz0ZjrhX19jUBCw
         mjxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=5DDCOHPLbZQzSYOkSAgMFQJ87bpYXNf9EETfNEEqRCk=;
        fh=zTdKRlVOqZDbKQreGSsqmk/7Ec8TKdjpNBvkXzo10IA=;
        b=gU291Tcjup2gPghQjUXDIf9FSJkhrXhpcHhv1q5eZ5zJownoflmaU58+jjLTM+Iju1
         EisNr61MaxAEhs2UaamSRTyTsrdN+YCnc3RzIRo4gQ4qK/cUTckb0YEHIHi8sPewdP5w
         SsaKTxZ/DYVJcdUbuftL7QSzFHMwwVCPGqj4/fkzk6rNuruyOXORAehspL36YcvDJqeV
         EFOTMOnEmaD4PGnxFb3+JQrzmpm87SPuaVoKOd0Wu69JuOKWSAoxv+l+drhHwfVKAUrT
         GvDqq8GkXMNTsb/1SpSkGoIYFZt/IyylDEJ5PFfIhw3Kvpuuwri1WCUACVF2wkZh1+nj
         6nrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hTlSf0cG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3-20020a05622a014300b004197f4977e9si498525qtw.640.2023.10.04.23.35.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 23:35:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hTlSf0cG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qoHwa-0004j8-Hw; Thu, 05 Oct 2023 02:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qoHwO-0004ZV-I8
 for qemu-arm@nongnu.org; Thu, 05 Oct 2023 02:34:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qoHwM-00061k-KY
 for qemu-arm@nongnu.org; Thu, 05 Oct 2023 02:34:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696487669;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5DDCOHPLbZQzSYOkSAgMFQJ87bpYXNf9EETfNEEqRCk=;
 b=hTlSf0cGyR+KZmd7yu0VAks55P4UvC5NH5fPLkqpa69LJ1TuJvSkThd3KLtYEhW5PilWRl
 cIKDCmnZQQO/m2d0/ZY4P8r/JbBNRIliRZmx8TJpZ42bQw/L18LX2M5M7Q+H6mrWrtLC1m
 LV4ESxrH5tK1arBRWkDum1CDETb5kFw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-9rvGKb0NPBiWyytEpzekyA-1; Thu, 05 Oct 2023 02:34:27 -0400
X-MC-Unique: 9rvGKb0NPBiWyytEpzekyA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-323334992fbso550173f8f.1
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 23:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696487666; x=1697092466;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5DDCOHPLbZQzSYOkSAgMFQJ87bpYXNf9EETfNEEqRCk=;
 b=ISdMnPeyCj4I3rhdIeZR1LolujjCLuuIdCrW3I2SSbqHdtPHlUeAkCs+zDfPxTapCY
 DmCC1zxtGDNpd5z0BiT9nPtAaC5hVGtbQlanuvAQ3f0rI8HzouiRPpW4NWFzXIWtiePu
 gZpwrpVAFTglCn+ij2jOhE5Chzt7ZPc/WZrCIfsaRlWrjLxqR+2Eyiq5mcKR0y1hR9tF
 M4bvbw0o2SkAzT39IWkzGWBUwNwmJZDl4U5NOJVpX7ubGtZva2xn0IhsmmGe9d28XKxA
 udxCAkDy9DQYE2/JRtJgbmiOQOPFeYpbwST+8qIfTMCLP+z7UVkIozanf0kTm24e+Ucc
 hsrQ==
X-Gm-Message-State: AOJu0YwnKLz86OB+VmrUxmxB2rPhq0S3B0RaYdfyAmgPC/Q0gFmayEKh
 33zHObdVbBQ2DZapBOpJjedrHHLODDF9tTdbV4r+Qjlouvz/1C+FR9VMUyNVM0ipoGrV8ntXgcw
 ZY66mvbJ4KYNL
X-Received: by 2002:adf:dd82:0:b0:324:84bc:d59e with SMTP id
 x2-20020adfdd82000000b0032484bcd59emr3983352wrl.22.1696487666280; 
 Wed, 04 Oct 2023 23:34:26 -0700 (PDT)
X-Received: by 2002:adf:dd82:0:b0:324:84bc:d59e with SMTP id
 x2-20020adfdd82000000b0032484bcd59emr3983330wrl.22.1696487666025; 
 Wed, 04 Oct 2023 23:34:26 -0700 (PDT)
Received: from redhat.com (static-151-150-85-188.ipcom.comunitel.net.
 [188.85.150.151]) by smtp.gmail.com with ESMTPSA id
 p14-20020a056000018e00b0031984b370f2sm957284wrx.47.2023.10.04.23.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Oct 2023 23:34:25 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,  qemu-block@nongnu.org,
 qemu-s390x@nongnu.org,  "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhenwei Pi <pizhenwei@bytedance.com>,  Laurent Vivier
 <lvivier@redhat.com>,  Amit Shah <amit@kernel.org>,  Alberto Garcia
 <berto@igalia.com>,  Kevin Wolf <kwolf@redhat.com>,  Hanna Reitz
 <hreitz@redhat.com>,  John Snow <jsnow@redhat.com>,  Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,  =?utf-8?Q?Marc-Andr?=
 =?utf-8?Q?=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Gerd
 Hoffmann <kraxel@redhat.com>,  Peter Xu <peterx@redhat.com>,  Leonardo
 Bras <leobras@redhat.com>,  Jason Wang <jasowang@redhat.com>,  Konstantin
 Kostiuk <kkostiuk@redhat.com>,  Michael Roth <michael.roth@amd.com>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Eduardo Habkost
 <eduardo@habkost.net>,  "Michael S. Tsirkin" <mst@redhat.com>,  David
 Hildenbrand <david@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 11/22] qapi: Inline QERR_INVALID_PARAMETER_VALUE
 definition (constant value)
In-Reply-To: <20231005045041.52649-12-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 5 Oct 2023 06:50:28
 +0200")
References: <20231005045041.52649-1-philmd@linaro.org>
 <20231005045041.52649-12-philmd@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Date: Thu, 05 Oct 2023 08:34:24 +0200
Message-ID: <87a5sxr30v.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3wh0jBkWUao2

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> vcpu_dirty_limit
>
> Address the comment added in commit 4629ed1e98
> ("qerror: Finally unused, clean up"), from 2015:
>
>   /*
>    * These macros will go away, please don't use
>    * in new code, and do not add new ones!
>    */
>
> Mechanical transformation using the following
> coccinelle semantic patch:
>
>     @match@
>     expression errp;
>     constant param;
>     constant value;
>     @@
>          error_setg(errp, QERR_INVALID_PARAMETER_VALUE, param, value);
>
>     @script:python strformat depends on match@
>     param << match.param;
>     value << match.value;
>     fixedfmt; // new var
>     @@
>     fixedfmt =3D "\"Parameter '%s' expects %s\"" % (param[1:-1], value[1:=
-1])
>     coccinelle.fixedfmt =3D cocci.make_ident(fixedfmt)
>
>     @replace@
>     expression match.errp;
>     constant match.param;
>     constant match.value;
>     identifier strformat.fixedfmt;
>     @@
>     -    error_setg(errp, QERR_INVALID_PARAMETER_VALUE, param, value);
>     +    error_setg(errp, fixedfmt);
>
> Then manually splitting lines over 90 characters.
>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

