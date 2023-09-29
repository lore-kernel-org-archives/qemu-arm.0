Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp3046881ejc;
        Thu, 28 Sep 2023 23:43:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IED0KVH37A17Z7Pk7Hmwn5BkmAOC4QDTrpIoCoudP8AnoY2vX6SdK1+2mw/KMq3WqpTlVHK
X-Received: by 2002:a05:622a:3cd:b0:413:5f30:9995 with SMTP id k13-20020a05622a03cd00b004135f309995mr3817816qtx.36.1695969790263;
        Thu, 28 Sep 2023 23:43:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695969790; cv=none;
        d=google.com; s=arc-20160816;
        b=jgyt1m8jAo76K95/KQXadWJvRB7WXvavEbgaqEeR3AqwROYC4EE7t3bp9yZ4PrpwKx
         X+iMVucYMEFZ2MfRkNyx2jokgyllX56sZPZ9r//gHqB0AlSPLYP4NCKbj3UZKYngrFaX
         uSiOib57mkq8tsWVWezasvOd5uykTsEiJHvGJMia1cjACAkMXBewL4a3D/qSNJ5wQSlz
         mokxchXGP5BIk0y9utGQOPSc/aSaSzGIVVd906+f419okXnlpZw9r/ty6LOfj9ZEqQyc
         JyClZyT4qeiRQpdg7z2VuVRTP1NQs7ICFRDUnxGMlJ84cgKCld/9Oq5D2hrwjDCZUpew
         PXVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=v5IVOGrxtCgexnQZUCH3CtFz8zetzt0dE8VGCt2JscM=;
        fh=XOcsgqAO8FrYO3hPJm4HugBFn4zBt9xdLbPKOU5gUU4=;
        b=rSN5MdjSd0BbthrddAokCh5AT5IB5NacGXLPNhE0CUCb0D7e0uSNvrRnNkJfnWqmXu
         PQ7oi6MTlieeL/zQMwpZ0JmynSHtCh8yTDkw7ZwZc7L3fS55/AN+iLGY1XrmA6cAOaXL
         xc23cIKBYsRMgHhZqZfs4W1AWXGQ1ynIcD1WqBDEk+6KvZo31/nxnB2j2KhvL3iqz1fK
         3+anFbI5y//SwRfkT8fmJqkPFzQmM+KQJzJ3NQKyTtWOpXnKVbFMe++vdlyrfj4hy2Rl
         OL4wqt6QndhMFLerA7b2dhc+VtnU4Rd8Da1I0Eo5fLzaCD2qw2RQcG2Er8zkAhUf5Nvu
         O/Kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a4yXYzPa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d10-20020a05622a05ca00b004195f6ad06dsi2016960qtb.56.2023.09.28.23.43.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Sep 2023 23:43:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a4yXYzPa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qm7Cr-0000tV-5L; Fri, 29 Sep 2023 02:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qm7Cm-0000Qt-8l
 for qemu-arm@nongnu.org; Fri, 29 Sep 2023 02:42:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qm7Cj-0007oc-Ts
 for qemu-arm@nongnu.org; Fri, 29 Sep 2023 02:42:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695969745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v5IVOGrxtCgexnQZUCH3CtFz8zetzt0dE8VGCt2JscM=;
 b=a4yXYzPaFQkGo+d8KH9sQzdGnEpvz0tTXuyn3sxNoNyHGJWqFqeD1+43+mTtK6ETMe7BqX
 ufKnZxB9TF6ddlAmMoFucsV7B8UzQHK9jCyUZGM7V+ZyAdaJLjWPJXahYCq7NOKkGDwFKy
 U08eAGrDo+Q/RdbDqVAYDGQetAkJRcI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-jWkKF_9nNjqU2erIuctTjw-1; Fri, 29 Sep 2023 02:42:20 -0400
X-MC-Unique: jWkKF_9nNjqU2erIuctTjw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9076929AA3B2;
 Fri, 29 Sep 2023 06:42:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CEA9176EA;
 Fri, 29 Sep 2023 06:42:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7E07921E6904; Fri, 29 Sep 2023 08:42:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  qemu-arm@nongnu.org
Subject: Re: [PATCH v2 00/22] (few more) Steps towards enabling -Wshadow
References: <20230904161235.84651-1-philmd@linaro.org>
 <87fs2xlfyj.fsf@pond.sub.org>
Date: Fri, 29 Sep 2023 08:42:19 +0200
In-Reply-To: <87fs2xlfyj.fsf@pond.sub.org> (Markus Armbruster's message of
 "Fri, 29 Sep 2023 07:13:24 +0200")
Message-ID: <87il7tiipg.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: Jgu9iKaZ0pJn

Markus Armbruster <armbru@redhat.com> writes:

> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>
>> Since v1:
>> - Addressed review comments
>> - Added R-b tags
>> - More patches
>>
>> For rational see Markus cover on
>> https://lore.kernel.org/qemu-devel/20230831132546.3525721-1-armbru@redha=
t.com/
>>
>> This series contains few more, my take.
>>
>> Based-on: <20230831132546.3525721-1-armbru@redhat.com>

Correction...

> Queued except for:

  PATCH 10: Clashes with a patch from C=C3=A9dric, picking C=C3=A9dric's

> PATCH 11: I asked for John Snow's opinion on a matter of taste.
> PATCH 18: Review comment from Peter Maydell is pending.
>
> Thanks!

