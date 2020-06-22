Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3498121lfm;
        Mon, 22 Jun 2020 13:11:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmj2JTdw1GpBjB6zPJfceOKnAy/g2en8bOgcQrg2BFlqKjiK+JK5Bv/GH26g505fLXBt5U
X-Received: by 2002:a05:6402:3135:: with SMTP id dd21mr17955582edb.110.1592856689433;
        Mon, 22 Jun 2020 13:11:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592856689; cv=none;
        d=google.com; s=arc-20160816;
        b=T5/EBHB0748qqP65BqwynrY3HeqNnPYyo0EffXrmQp9qnHUKE59sApuPYawkjQu9Lu
         34lTeyYD+LKIiaSHJTmmllPVJnu5knvhhSWNINYDY0W+vKrGdfWPXQalKTyAnf8lFm3O
         XfPDURlxEJ3q9imiReOlpyxGXJjJr6n+VUerB11H990sLuGhyZvImPFPPOkGSRUoax0h
         YGcupdcJOg102NpoOTcLHif7CBT5e6liINBXGrmf6Y2vk3hfXrfAg3IEhYBIAlyvPsOl
         UDxti/DrQ+cDX9RpDcvZ5sC4kog7kznYPJwc8JIZbUpGjQxxlQSkNySOmSqZWqB9wmZC
         fp3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=mTc3nTuv3+E95YWblrZ4womgAmwm01Da22NV/Nv8VAA=;
        b=zwA2YoXzvlPqUbkzIiKVDo993Baoh7MQCt256LpYpZ9dMK4hkORA0YOM+yJ4cUr0LV
         2hU91pSOwytCMpdkmkxLwkdr0FXQ65/JXoXTd6N5/yrpO3FoJ50OiCHzY4ly+h4zOIV1
         pgZJs+GaOdSY59pUKTIObm0i7AGdGTNkCv2JX+nzbEiI7zBXMNavs/L3Uhgtzbfg1XUW
         /WkiQCbg3YsNIcANDn8VJMYmv1B+tpW4roGhh+mmGAg3iNeyvnmfylk/upa1QUDR2Apk
         ADquW+urtG/1bjSuW+oJf20viBABPqi8+GjOF6GpwGk8tqhkqBXrKmHQfdyOhQ6FKCCM
         Sftw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DC+4koDz;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id f20si9942991edr.380.2020.06.22.13.11.29;
        Mon, 22 Jun 2020 13:11:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DC+4koDz;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730927AbgFVUL1 (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Mon, 22 Jun 2020 16:11:27 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:60812 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730896AbgFVULX (ORCPT
        <rfc822;kvm@vger.kernel.org>); Mon, 22 Jun 2020 16:11:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592856682;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mTc3nTuv3+E95YWblrZ4womgAmwm01Da22NV/Nv8VAA=;
        b=DC+4koDzFcJe0nNOLUQ1Q5FPi0tsMeX0a/azwFR4bJV8STGtRi0h3Z6pU+UbGSIAYEe/n4
        tq2VB4N8OFsdZ+7Yre/iUESvTdphcjXIE9WPHju4dVm2L7a8AT3JC5VwXghTXZ63MpyX65
        69s62s450kjYsJHZybiJ6wsD77aDxVQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-plwrIt9uN_G2waASGBkpag-1; Mon, 22 Jun 2020 16:11:20 -0400
X-MC-Unique: plwrIt9uN_G2waASGBkpag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF0D0804004;
        Mon, 22 Jun 2020 20:11:18 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.126])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id CA1E619D61;
        Mon, 22 Jun 2020 20:11:16 +0000 (UTC)
Date:   Mon, 22 Jun 2020 22:11:13 +0200
From:   Andrew Jones <drjones@redhat.com>
To:     Peter Maydell <peter.maydell@linaro.org>
Cc:     kvm-devel <kvm@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
        qemu-arm <qemu-arm@nongnu.org>, Haibo Xu <haibo.xu@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2] target/arm: Check supported KVM features globally
 (not per vCPU)
Message-ID: <20200622201113.o7uqsgiuyyvfgmgm@kamzik.brq.redhat.com>
References: <20200619095542.2095-1-philmd@redhat.com>
 <20200619114123.7nhuehm76iwhsw5i@kamzik.brq.redhat.com>
 <CAFEAcA-3keThbaWccv+Rzh4dmnLquSwXMyEOmbMMHgQHM=c-8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-3keThbaWccv+Rzh4dmnLquSwXMyEOmbMMHgQHM=c-8Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Ch7nzcaKZ8vM

On Mon, Jun 22, 2020 at 08:57:51PM +0100, Peter Maydell wrote:
> On Fri, 19 Jun 2020 at 12:41, Andrew Jones <drjones@redhat.com> wrote:
> > Can you also post the attached patch with this one (a two patch series)?
> 
> This would be easier to review if you'd just posted it as
> a patch with a Based-on: and a note that it needed to be

OK, will do.

> applied after the bugfix patch. Anyway:
> 
> +    /* Enabling and disabling kvm-no-adjvtime should always work. */
>      assert_has_feature_disabled(qts, "host", "kvm-no-adjvtime");
> +    assert_set_feature(qts, "host", "kvm-no-adjvtime", true);
> +    assert_set_feature(qts, "host", "kvm-no-adjvtime", false);
> 
>      if (g_str_equal(qtest_get_arch(), "aarch64")) {
>          bool kvm_supports_sve;
> @@ -475,7 +497,11 @@ static void
> test_query_cpu_model_expansion_kvm(const void *data)
>          char *error;
> 
>          assert_has_feature_enabled(qts, "host", "aarch64");
> +
> +        /* Enabling and disabling pmu should always work. */
>          assert_has_feature_enabled(qts, "host", "pmu");
> +        assert_set_feature(qts, "host", "pmu", true);
> +        assert_set_feature(qts, "host", "pmu", false);
> 
> It seems a bit odd that we do the same "set true, then
> set false" sequence whether the feature is enabled or not.
> Shouldn't the second one be "set false, then set true" ?

That would be better. Will do.

Thanks,
drew
