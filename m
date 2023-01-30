Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp692902ejb;
        Sun, 29 Jan 2023 20:12:13 -0800 (PST)
X-Google-Smtp-Source: AK7set+QyMKoFtIi7k3RYvrXoCCkuBamgDqz+G3KHMSjpm5NXO0DSqP41mBk6kIZMCMR323TBOZb
X-Received: by 2002:a05:6214:3109:b0:537:7402:e781 with SMTP id ks9-20020a056214310900b005377402e781mr23942763qvb.50.1675051932994;
        Sun, 29 Jan 2023 20:12:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675051932; cv=none;
        d=google.com; s=arc-20160816;
        b=yhendVNBliiOaa9e3BWAiuYaSynUOXmnoe+lxD7YLWiBy05zHVrAOVt1a7ikhdYtvT
         v1pHfsIdWLA45KtXeCWXyzgrRwukvT44+C448A9gOVI0NYJhT4U5K/bXDYvsmIwwahZE
         RTrga+fWmNMFa7IQCCWIpBjAbdzBVaCu7p1NkZgZsfnP2bkJfQ5aGfcl1abZ3PVJMxN9
         eX18uBApWdQ0efJ+tMYx5fYRMsO1ordAhZojL0KqAHVtlbJf3uKG3ndlsr4c2djwyFMU
         jl6f4SesDmxCteCToUC2qO+Ivp6auD8DGZge8duDfx52kKLZprCWbLG2ozq22ui5a+ca
         JdLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:user-agent:references:in-reply-to:subject:cc:to
         :from:dkim-signature;
        bh=MGdaT5bvuLQsbnKTmhYEgxvxJGVouGB8/uGbyCZ1Syk=;
        b=NR19y2e7zEdef3qU8ID5FPD4/yHAL8buf4627dbN6nhZlB6YKzJb2SLJBeQznBHbO+
         GESaHOyeQt8zTupzGSKevDt6BiXCwjf+mEuieN8tR7PTeHAIaWlmChFWdvRNzUJquxQa
         DpsGqgmr/LIdLGuTQ1uvJnE4tfeJVo6aEzbZZuVeDyz62jMteeyCT8tY2Ta4EaNWdrTo
         2J4oDNOax+AXxFIS81ip8maFTnX6WBGDFgnXJOWXtxKyZOFM4oqOD3F+IYvm2n2y8fys
         n9dROdkEJmRAiGcCTbdSVt7dqOHQxz5sabwIQMiCbg21x2TqkzdNk1aTrk5AIfK6ZkM0
         JegA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="gXFDob/+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pm5-20020ad446c5000000b005342a4507f8si5962181qvb.419.2023.01.29.20.12.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Jan 2023 20:12:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="gXFDob/+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMLWQ-00075n-K8; Sun, 29 Jan 2023 23:11:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMLWP-00074r-6u
 for qemu-arm@nongnu.org; Sun, 29 Jan 2023 23:11:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMLWM-00014O-UC
 for qemu-arm@nongnu.org; Sun, 29 Jan 2023 23:11:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675051912;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=MGdaT5bvuLQsbnKTmhYEgxvxJGVouGB8/uGbyCZ1Syk=;
 b=gXFDob/+ms3ifJV8Kk5KlIzk6Z3SlWZKcTxgmzCNUdUv8m9pQ42cNIoq6+U6qBDp6wc/Sk
 jaKyNGXk7O6qHLxSgj5wF2uWT7HMuIg3OqS6dKYpv5YZbvSQmt08EcQvPtW6CYP0pscs1k
 97vYvSlOwkZrqtfg8tBKWVxbHLljW+w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-463-gNSkPjt7NfqHOelrSnTq-g-1; Sun, 29 Jan 2023 23:11:51 -0500
X-MC-Unique: gNSkPjt7NfqHOelrSnTq-g-1
Received: by mail-wm1-f69.google.com with SMTP id
 k34-20020a05600c1ca200b003db30c3ed63so6558748wms.2
 for <qemu-arm@nongnu.org>; Sun, 29 Jan 2023 20:11:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MGdaT5bvuLQsbnKTmhYEgxvxJGVouGB8/uGbyCZ1Syk=;
 b=sxKfamJoctTq629PoXUH1vIVV8YsMIMe98qhc8l3zdMvkTcOkWiHCGxzKztqT/inQc
 Kimx4qCLOklFtyv7PET4RZQPFwYezFJQFJOpKoO9Jj9xRnJy4+d+TiqrRbZYDA68Bbs2
 axpS5SwXJFXYnew/ZJtu0ZxeBu8LEdYrBa0gfYColcDxksFn1cY3m1zOwqbuKWrTZOmb
 Je0Zzz3LY7hbBgMgMrCY5iYtR1FzSudnXMK5XdAOfM+v1DF00ccMiAVvvKJ78rI44BP0
 lY0JbYwOlwQQ6bk+kHA3TZTGARsZkR+tZ0ExFVq8Fr/tQm6ae+0+TY142NUe5J70WCNd
 aBfw==
X-Gm-Message-State: AO0yUKVEnYTPYlmTiclvscBdxlJOKM7ggwsLe7KYMcVbjFlmGLGQBss1
 UChCjYiP3y1NDnmTDH7/9b0zp9Q1aAew6xk/D8kJrdC6mhMM2+xL9+3yZLroF/BNa5ntudIp+Ag
 AkTXphzjM9Z5d
X-Received: by 2002:a05:600c:1c9f:b0:3dc:5aa8:952e with SMTP id
 k31-20020a05600c1c9f00b003dc5aa8952emr1331282wms.21.1675051910150; 
 Sun, 29 Jan 2023 20:11:50 -0800 (PST)
X-Received: by 2002:a05:600c:1c9f:b0:3dc:5aa8:952e with SMTP id
 k31-20020a05600c1c9f00b003dc5aa8952emr1331245wms.21.1675051909833; 
 Sun, 29 Jan 2023 20:11:49 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 l4-20020a7bc444000000b003db03725e86sm11403628wmi.8.2023.01.29.20.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:11:49 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  qemu-devel@nongnu.org,
 richard.henderson@linaro.org,  pbonzini@redhat.com,  kwolf@redhat.com,
 hreitz@redhat.com,  imp@bsdimp.com,  kevans@freebsd.org,
 berrange@redhat.com,  groug@kaod.org,  qemu_oss@crudebyte.com,
 mst@redhat.com,  philmd@linaro.org,  peter.maydell@linaro.org,
 alistair@alistair23.me,  jasowang@redhat.com,
 jonathan.cameron@huawei.com,  kbastian@mail.uni-paderborn.de,
 michael.roth@amd.com,  kkostiuk@redhat.com,  tsimpson@quicinc.com,
 palmer@dabbelt.com,  bin.meng@windriver.com,  qemu-block@nongnu.org,
 qemu-arm@nongnu.org,  qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 10/19] migration: Clean up includes
In-Reply-To: <87wn5hoeqf.fsf@pond.sub.org> (Markus Armbruster's message of
 "Fri, 20 Jan 2023 08:19:04 +0100")
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-11-armbru@redhat.com>
 <Y8kOj6m4jhtUVg+A@work-vm> <87wn5ivmru.fsf@pond.sub.org>
 <Y8ktYMfKahtAZ83A@work-vm> <87wn5hoeqf.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 05:11:48 +0100
Message-ID: <87bkmgpsor.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: SZkLybNQMXad

Markus Armbruster <armbru@redhat.com> wrote:
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:
>
>> * Markus Armbruster (armbru@redhat.com) wrote:
>>> "Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:
>>> 
>>> > * Markus Armbruster (armbru@redhat.com) wrote:
>>> >> Clean up includes so that osdep.h is included first and headers
>>> >> which it implies are not included manually.
>>> >
>>> > That change doesn't seem to match the message; the patch is removing the
>>> > osdep.h include.
>>> 
>>> It's the commit message scripts/clean-includes creates :)
>>> 
>>> I can throw in another patch to the script so it mentions it also
>>> removes qemu/osdep.h from headers.
>>
>> Oh hmm it would be clearer;
>
> What about
>
>     $GITSUBJ: Clean up includes
>
>     Clean up includes so that osdep.h is included first in .c and not in
>     .h, and headers which it implies are not included manually.
>
>     This commit was created with scripts/clean-includes.
>
>
>>                             but OK then, so 
>>
>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Sounds ok to me.

Reviewed-by: Juan Quintela <quintela@redhat.com>

