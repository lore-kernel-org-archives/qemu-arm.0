Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp896643ejc;
        Mon, 25 Sep 2023 23:51:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjyRL9iqhaBsIUXfnSe6PJX1+T4Iaeo6AZBsg2AiWA2T2UrBF1m+OWri/TfiyJbYvvDIS7
X-Received: by 2002:a05:620a:2587:b0:76f:20df:f038 with SMTP id x7-20020a05620a258700b0076f20dff038mr8814424qko.12.1695711113354;
        Mon, 25 Sep 2023 23:51:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695711113; cv=none;
        d=google.com; s=arc-20160816;
        b=gObVJbmZE35caeBzm2vD1skrUe22HotHn9M2Cw48tmDJj5JO/DJnDuB4Yt2QgbGDi7
         Na6IkgBY7WUPIWfbmdm5onBCmwghH4/g9AtceHNKw8sWE6iXLQmo8VlsOqNnCbu8xc+K
         PXT0Dsr2BpCL0UlGMlZpEvaGv3ep7ZCivUxrrVzFGzyiBKdMdffFPG1xbPQQpshmg4sV
         soiqLQBANTlTijm5cl0VNPBSOvqwUU/m1oYxuvnFsVQWHKRf6jBBREi7EnL5v7cpFMTW
         r5Ek99cehZjycYVXP9hFbKXC3JJnVDt+zglCFj+q90qpi5HBtUnnWDor32nyZF9NQlas
         tQxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=JRnVZH4Xpq9UPqnu+4CjwJAcPIDD7ypTdPecbJ/zx3o=;
        fh=+DebmfRr71YBD54o4IhleMRB/1mRFYnrd8wu1NP/huc=;
        b=lBR6Ohvip0Q0m/n/G6SI0yQTC18Tz6x6e1rdGRdHlbX95emI2TJubtOVxGI1w4izkm
         braQZegxdQJL5GoVeEuRPDInC4Ha+h0vL1J7g7bzOEfCe3KfFVWhO6rxJpcCsJ9s/a5I
         SXOlcUImvXNodtWN683/v+9SaaKH0ye9LKbIuI6Oyg0BYmkW7a09kiL/VgY3c9iq4HTk
         j16VpiUoqeEyVWklYVZ6E/YATKfysCSYwwDxAMBv7Mg3gu65Majvxis5err6jR5zkQq3
         kWUsOBSAN5h9XJVQBgw9ak3pX03JE8FQA1tqInE44HXG9/U9DfspdGHZzhUPyQlCHiEZ
         WLpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VYoGDTP8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10-20020a05620a2a0a00b007742f2abc7esi2466891qkp.781.2023.09.25.23.51.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Sep 2023 23:51:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VYoGDTP8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ql1uq-0008Ie-K4; Tue, 26 Sep 2023 02:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ql1ul-0008Ax-Rt
 for qemu-arm@nongnu.org; Tue, 26 Sep 2023 02:51:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ql1uk-0002II-Gt
 for qemu-arm@nongnu.org; Tue, 26 Sep 2023 02:51:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695711081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JRnVZH4Xpq9UPqnu+4CjwJAcPIDD7ypTdPecbJ/zx3o=;
 b=VYoGDTP8wosvto3vmAvZdMnaAONvAW7QQR6phN8sfI6+X4pc5Vxh3RK78CXQpwSJ8RETYX
 O9oce4CRBVnNhZ1MNu5ojVrvdSCu2g1YPZ9Xol5TZeh0eMf8qh1Agt7ewoOp6yz8DOA8zA
 7Rrn11pxtotkLmnwd9u7P0zijltzQ9o=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-HGpQj9j4PuiAVQca91XXNw-1; Tue, 26 Sep 2023 02:51:17 -0400
X-MC-Unique: HGpQj9j4PuiAVQca91XXNw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 777303C23FCB;
 Tue, 26 Sep 2023 06:51:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51F5740C6EA8;
 Tue, 26 Sep 2023 06:51:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2C92721E6900; Tue, 26 Sep 2023 08:51:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: David Gibson <david@gibson.dropbear.id.au>,  Philippe =?utf-8?Q?Mathie?=
 =?utf-8?Q?u-Daud=C3=A9?=
 <philmd@linaro.org>,  qemu-devel@nongnu.org,  qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org,  Eduardo Habkost <eduardo@habkost.net>,  Gerd
 Hoffmann <kraxel@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 13/15] hw/qdev: Remove DEFINE_PROP_DMAADDR() and
 'hw/qdev-dma.h'
References: <20230203145536.17585-1-philmd@linaro.org>
 <20230203145536.17585-14-philmd@linaro.org>
 <87zg1a8r5v.fsf@pond.sub.org> <87bkdq8qh1.fsf@pond.sub.org>
 <0e258375-e3a0-8b5d-189e-cb2cea913ecb@redhat.com>
Date: Tue, 26 Sep 2023 08:51:14 +0200
In-Reply-To: <0e258375-e3a0-8b5d-189e-cb2cea913ecb@redhat.com> (Paolo
 Bonzini's message of "Mon, 25 Sep 2023 18:41:12 +0200")
Message-ID: <878r8tjul9.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
X-TUID: lIFbkO04K9ai

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 9/25/23 13:03, Markus Armbruster wrote:
>> +David
>> Markus Armbruster <armbru@redhat.com> writes:
>>=20
>>> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>>>
>>>> DEFINE_PROP_DMAADDR() is only used once. Since it doesn't
>>>> add much value, simply remove it, along with the header
>>>> defining it.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>>>
>>> DEFINE_PROP_DMAADDR() lets you wrap a property around a dma_addr_t
>>> member without assuming anything about dma_addr_t.
>>>
>>> Whether that's worth avoiding I can't say.  Depends on how much the
>>> abstraction leaks in other ways.  Thoughts?
>
> I think it's okay to simplify things.  If anybody ever has a reason to ma=
ke dma_addr_t variable sized (probably a bad idea because many of its users=
 are compiled once only) they have one extra place to fix.  Tough luck. :)

Makes sense.

Reviewed-by: Markus Armbruster <armbru@redhat.com>

