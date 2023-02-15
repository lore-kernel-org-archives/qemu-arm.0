Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp390438ejb;
        Wed, 15 Feb 2023 02:59:35 -0800 (PST)
X-Google-Smtp-Source: AK7set9rIlZbHt4i0FUyzux73ACSY/W9w2qGeXEOOnQMNKF4jBGr5Zad/HRXbkYiT3ykcWLREsFT
X-Received: by 2002:ac8:5f91:0:b0:3b8:6836:f96 with SMTP id j17-20020ac85f91000000b003b868360f96mr2323262qta.42.1676458775657;
        Wed, 15 Feb 2023 02:59:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676458775; cv=none;
        d=google.com; s=arc-20160816;
        b=pqi164dJKSaqogAk1C0sUHi4EZ3k52l8w6q4gWG1b1z0zK/K8kJZmnLVQSwAhh6cyY
         MF79NqJWxSxgFOOo+47mJriclOHSKHHC/CAj4SskHRJZb9+IO0HH1f6S+QL/rG/sfjzI
         k8z1n9vF+GUrPA9oav7AhW45mvZzOHrFYwXLniCipCP3TdeLXaJObvKHrgCCjgsMTS7J
         WIfvbneZXHKafQN3Cc94PedNJNC7tR8e69p1QPooKSaBnhpAk6Gm82Bl1tn5tXHJQmob
         QopZYHV1y+SGOi0apPnTdPHf12hfqpH/Qmrudgz4IV8j0t6UBm9SNhi9yYbVUqfU5QwP
         VZyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=Z1vm4rRSwi9q0BCc8utZUgURv9fQkg9JJyOqtW+jBlQ=;
        b=NPKNQqMjNCmu6gqPAjUW1Yyw849p1obF8i5JeQRqfBbDpy72pyVbyZ4weh8OZAmpRX
         YGdqOnEYxDyuScAoBrLC9W4TxUZQrukEb/eXIOROjuHqdfxqUewVHB4V4qdmc5OyDTwx
         MY53GoJs82n2CJi5xTGcPaWR1H26lYRViQ3ANQN5+8jERNSZirrFTzICfA1oxtknyweY
         INC/Rw1qKA/Q1piTtOnJZxMWqc/1ZQ5sFH6MNT05hUJRfyBw0THBIzTF2NRGygzPanxu
         I3bDRP+Ou+4ogOcZbK2SaBE7LPzdn+S7uIlGUxan2KtZQLYtHwmINpX8FmKIq6tRVcIJ
         bz4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SgGdr2S0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9-20020ac858c9000000b003b9bcfd81ccsi14472486qta.302.2023.02.15.02.59.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 02:59:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SgGdr2S0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSFVR-0007LR-7r; Wed, 15 Feb 2023 05:59:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pSFVO-0007L0-VQ
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 05:59:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pSFVN-0000eP-9q
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 05:59:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676458756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z1vm4rRSwi9q0BCc8utZUgURv9fQkg9JJyOqtW+jBlQ=;
 b=SgGdr2S0yAsSqQxwvHsL1y1P7k3NUTYt5lp4Vbr5SHzpLerec4fqtivgCPK7qtkNNiwlg0
 pAU686rgYcq1cscAr1uSFJe2QPAJjXh9IZRR2Qnhs4T3inSkfX3wge6hsRM/TTBuxylks1
 M79fQMJzYIX66AlN7NZPPByNYaEnaRk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-DGET8La2Nii-4pQFBs3PVA-1; Wed, 15 Feb 2023 05:59:12 -0500
X-MC-Unique: DGET8La2Nii-4pQFBs3PVA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 635AA85CCE4;
 Wed, 15 Feb 2023 10:59:11 +0000 (UTC)
Received: from localhost (unknown [10.39.192.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F3CFB2166B30;
 Wed, 15 Feb 2023 10:59:10 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Auger <eauger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 3/3] qtests/arm: add some mte tests
In-Reply-To: <a7904d6e-c8e5-055b-34f7-8ea2956ec65f@redhat.com>
Organization: Red Hat GmbH
References: <20230203134433.31513-1-cohuck@redhat.com>
 <20230203134433.31513-4-cohuck@redhat.com>
 <a7904d6e-c8e5-055b-34f7-8ea2956ec65f@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 15 Feb 2023 11:59:09 +0100
Message-ID: <874jrndwjm.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: R7bSAGQtIYov

On Mon, Feb 06 2023, Eric Auger <eauger@redhat.com> wrote:

> Hi,
>
> On 2/3/23 14:44, Cornelia Huck wrote:
>> @@ -517,6 +583,13 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>>          assert_set_feature(qts, "host", "pmu", false);
>>          assert_set_feature(qts, "host", "pmu", true);
>>  
>> +        /*
>> +         * Unfortunately, there's no easy way to test whether this instance
>> +         * of KVM supports MTE. So we can only assert that the feature
>> +         * is present, but not whether it can be toggled.
>> +         */
>> +        assert_has_feature(qts, "host", "mte");
> I know you replied in v4 but I am still confused:
> What does
>       (QEMU) query-cpu-model-expansion type=full model={"name":"host"}
> return on a MTE capable host and and on a non MTE capable host?

FWIW, it's "auto" in both cases, but the main problem is actually
something else...

>
> If I remember correctly qmp_query_cpu_model_expansion loops over the
> advertised features and try to set them explicitly so if the host does
> not support it this should fail and the result should be different from
> the case where the host supports it (even if it is off by default)
>
> Does assert_has_feature_enabled() returns false?

I poked around a bit with qmp on a system (well, model) with MTE where
starting a guest with MTE works just fine. I used the minimal setup
described in docs/devel/writing-monitor-commands.rst, and trying to do a
cpu model expansion with mte=on fails because the KVM ioctl fails with
-EINVAL (as we haven't set up proper memory mappings). The qtest setup
doesn't do any proper setup either AFAICS, so enabling MTE won't work
even if KVM and the host support it. (Trying to enable MTE on a host
that doesn't support it would also report an error, but a different one,
as KVM would not support the MTE cap at all.) We don't really know
beforehand what to expect ("auto" is not yet expanded, see above), so
I'm not sure how to test this in a meaningful way, even if we did set up
memory mappings (which seems like overkill for a feature test.)

The comment describing this could be improved, though :)

