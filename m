Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp296305ejc;
        Mon, 25 Sep 2023 04:04:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNbaQLKO1srTH83JN+zpVP1RaI7rqSd7FENbm53nkQiCzjm2GvnONinXARlS0zB3JbN8Lj
X-Received: by 2002:a25:c5cb:0:b0:d89:465f:f800 with SMTP id v194-20020a25c5cb000000b00d89465ff800mr348455ybe.32.1695639870358;
        Mon, 25 Sep 2023 04:04:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695639870; cv=none;
        d=google.com; s=arc-20160816;
        b=LsHWoW++20kfA2cDjDKO9Mt7kQPsTZdjXND1QyhRsUz2Y53aeIIj8wjGfW7PVxuwVK
         DqkIUdZIr5gd6HFBP+bcTp/27EtqgpO6ssS/tj5wwAKhSTJl2ovWzQUKHxReQTBbfdw7
         rjPUvyNcNHqvrgpfFbnU/nM2X/d1KaZ990aOGSSlidY6YoJb3H41D6Bwd13auJ8UFSmE
         5PVQl6R9B8Mi97XeIpMcpMXU5gtxYUUfOJhQEINXkIgh/kjYlcisNvSKmshlOZnkW44P
         yRvNJ0YV0B3qXV6ctVYysC7+ROJxp4Ew5GI74uC4zUC+D7mQim+nsZ9Z8depgayLMcwO
         2mkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=6DxNozPzgF3LGS1IahjfMicaHDWoP65RXmhYqEEHTJ4=;
        fh=LMBeBVbLGygEfuZli0HxdTgAkZJpON49kM3Tvrfh1L8=;
        b=i+ZW4NTS5Ng7vj+OtEQgavd0pv+db638KUTV5+E40RTmlKZXqwvlr1QlITPTl4SquM
         Q8/E289GTGIbT5hBJXE+Eug4pfIfV5Tn/vsT7q6FW69dWwafRd5vSs5k1KHwGtdiOhC0
         8iHmd9ShhV8UYLfw+wpY/4Ixk/6jsPPA+Qx4NCxBWYacSYdtsyBsYxbjTKbjtY5yXk7n
         fXIC93kNH/jRC8P2w+slo0qabp5zptD6VywXCQB5RUL8X08H8fslUQ5LJRGdcYG81Z/1
         1cZgnJy3z9KPhCUGXpSkxsZLIkHZ4/I1hxJSivAJMdjbKInA2ypJVuXUDsQZ3ce2UZgE
         CAXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hUWwga3I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w26-20020a0cb55a000000b0065afce61d91si2199577qvd.546.2023.09.25.04.04.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Sep 2023 04:04:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hUWwga3I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qkjNN-000495-Ip; Mon, 25 Sep 2023 07:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qkjNE-00045j-Iz
 for qemu-arm@nongnu.org; Mon, 25 Sep 2023 07:03:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qkjND-0001eS-9h
 for qemu-arm@nongnu.org; Mon, 25 Sep 2023 07:03:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695639810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6DxNozPzgF3LGS1IahjfMicaHDWoP65RXmhYqEEHTJ4=;
 b=hUWwga3Ih0Q9otnutAhylpTM55l99XVQTNd6SJifkargYm91+Lcfh0V9tdDIMEhAyOP/Fo
 49m0iQ9FMruAyqR44IQ/0Ouch2Hv8yS85/uss1XodKcea74y7j5vStibvWT+jqqMRQIgdC
 hSmV+mSZ+5VlDL/NUJhqMswPsWnvG3M=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-NQ0Oq3qOMVawMN3_IyGUpA-1; Mon, 25 Sep 2023 07:03:24 -0400
X-MC-Unique: NQ0Oq3qOMVawMN3_IyGUpA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6BB9F29AB3EC;
 Mon, 25 Sep 2023 11:03:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 451BB40C2064;
 Mon, 25 Sep 2023 11:03:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D8B1F21E6900; Mon, 25 Sep 2023 13:03:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org,
 qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,  Eduardo Habkost
 <eduardo@habkost.net>,  Gerd Hoffmann <kraxel@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 13/15] hw/qdev: Remove DEFINE_PROP_DMAADDR() and
 'hw/qdev-dma.h'
References: <20230203145536.17585-1-philmd@linaro.org>
 <20230203145536.17585-14-philmd@linaro.org>
 <87zg1a8r5v.fsf@pond.sub.org>
Date: Mon, 25 Sep 2023 13:03:22 +0200
In-Reply-To: <87zg1a8r5v.fsf@pond.sub.org> (Markus Armbruster's message of
 "Mon, 25 Sep 2023 12:48:28 +0200")
Message-ID: <87bkdq8qh1.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: OB2k6zbtTnq6

+David

Markus Armbruster <armbru@redhat.com> writes:

> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>
>> DEFINE_PROP_DMAADDR() is only used once. Since it doesn't
>> add much value, simply remove it, along with the header
>> defining it.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> DEFINE_PROP_DMAADDR() lets you wrap a property around a dma_addr_t
> member without assuming anything about dma_addr_t.
>
> If we use its (trivial) expansion instead, we assume dma_addr_t is
> uint64_t.
>
> Whether that's worth avoiding I can't say.  Depends on how much the
> abstraction leaks in other ways.  Thoughts?

