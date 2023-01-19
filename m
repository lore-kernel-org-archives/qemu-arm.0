Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp196676ejc;
        Thu, 19 Jan 2023 01:29:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsosW2OzRCBr+0DqpxiNJClHO/+UsDGUgmAZas9tTZxGfQTg4oYN3JlWCJvQvnWb/rNQm0d
X-Received: by 2002:ac8:4f16:0:b0:3b6:2bbd:1785 with SMTP id b22-20020ac84f16000000b003b62bbd1785mr15061850qte.45.1674120594202;
        Thu, 19 Jan 2023 01:29:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674120594; cv=none;
        d=google.com; s=arc-20160816;
        b=ko2xxg6nHyU5RVfy1cLBdzMcqLI/E3rq0TGOykt3gWxIMGYMgLNmI6JGzAvrYQp8cw
         A53AHIHTksE8vrlsWspBHZn6+G30MM1E8fB1BerGxiu4xs178NpNLYjxLMLMFRJqAPe/
         r/Z6hjJfCk6wn123bl1/gYjuQF2sgtdDgZ3q0DPX6poZZxAo7o4K3VyF24JYJvfmurMF
         wFwco9807/CqPmJFu9gvdsUvaVToRtVIAovs3Dspz95pkQCTzkxN7WXXIQCp6HK+ef2p
         t29uzeiVApjSsBBXL89/xXoG0t7rkqcjDW8f/Zu+kGpbjQZjqMGb9SgCh4iMjlV6ItVr
         t0vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:cc:to:from
         :dkim-signature;
        bh=AJAH+PtgDJ2Ku6bGCKJxTD3hj9E448yvnHDUAJu5nvg=;
        b=PTwTiLReqajKPHdzSvrEBHaGTzipPzg4bSkp70WAeBpgjYMDuY/n4u6VChLqtlR7Bm
         2OjzkjiL7WQ/kL0Fmmj8TLognYF+x7cOU4oQEOS7L6hkOjR2a1vM+bI7BivZiax6VYI8
         fQCxIAiu/BIw8XuvjNL7MkQdTckUrzkKiHt+4vvIrlIwWq1cyfF0eLUzATs/3xZ0aYrg
         ltrLEqniRt7G4KS1FkAqksEMLXYPmHN3nsBpAY/wNACpvvG4DOBgWPOiBMu/zBN2vtW+
         I2Sq/mdyNAOk3FvDnMg4nkDTfbvDv0QiNp4TiJ3qvzsY4m3gylJMDZJL7E0WQOQEKvhK
         PDiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KSN0owcr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cj19-20020a05622a259300b0035d43b31782si6192783qtb.389.2023.01.19.01.29.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 01:29:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KSN0owcr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIR5y-0003Tt-2b; Thu, 19 Jan 2023 04:20:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIR5u-0003SI-Qu
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 04:20:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIR5s-0005gm-63
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 04:20:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674120023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AJAH+PtgDJ2Ku6bGCKJxTD3hj9E448yvnHDUAJu5nvg=;
 b=KSN0owcrhr+Xr6WuO0WwlP6UEhu+KzpjrCos3O8EmsPSCoAlW2IcOtmrdlCTwQ65VMAYc2
 Er/lH2hxsDuQqekNV9c4uEbcnQiGASiB7RhVjgfl29FUZNWUJXNN3EBFWNStnj8tuhcdAo
 d1ooi13VWs0w/VMoYzF4T/huzC+MJmE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-oR98r5VaNw2EJ9lf181YHA-1; Thu, 19 Jan 2023 04:20:19 -0500
X-MC-Unique: oR98r5VaNw2EJ9lf181YHA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CCD0185A78B;
 Thu, 19 Jan 2023 09:20:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 587FB1121315;
 Thu, 19 Jan 2023 09:20:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2612321E6A28; Thu, 19 Jan 2023 10:20:16 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  richard.henderson@linaro.org,
 pbonzini@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 imp@bsdimp.com,  kevans@freebsd.org,  berrange@redhat.com,
 groug@kaod.org,  qemu_oss@crudebyte.com,  mst@redhat.com,
 philmd@linaro.org,  peter.maydell@linaro.org,  alistair@alistair23.me,
 jasowang@redhat.com,  jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de,  quintela@redhat.com,
 dgilbert@redhat.com,  michael.roth@amd.com,  kkostiuk@redhat.com,
 tsimpson@quicinc.com,  palmer@dabbelt.com,  bin.meng@windriver.com,
 qemu-block@nongnu.org,  qemu-arm@nongnu.org,  qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 00/19] Clean up includes
References: <20230119065959.3104012-1-armbru@redhat.com>
Date: Thu, 19 Jan 2023 10:20:16 +0100
In-Reply-To: <20230119065959.3104012-1-armbru@redhat.com> (Markus Armbruster's
 message of "Thu, 19 Jan 2023 07:59:40 +0100")
Message-ID: <87k01ix4mn.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ca5qIbPeyhCN

Markus Armbruster <armbru@redhat.com> writes:

> Back in 2016, we discussed[1] rules for headers, and these were
> generally liked:
>
> 1. Have a carefully curated header that's included everywhere first.  We
>    got that already thanks to Peter: osdep.h.
>
> 2. Headers should normally include everything they need beyond osdep.h.
>    If exceptions are needed for some reason, they must be documented in
>    the header.  If all that's needed from a header is typedefs, put
>    those into qemu/typedefs.h instead of including the header.
>
> 3. Cyclic inclusion is forbidden.
>
> This series fixes violations of rule 2.  I may have split patches too
> aggressively.  Let me know if you want some squashed together.
>
> v4:
> * PATCH 01-03: New
> * PATCH 04-15: Previous version redone with scripts/clean-includes,
>   	       result split up for review

Copying the R-bys for v3 to these patches is tempting.  But I didn't.

> * PATCH 16-19: New
>
> v3:
> * Rebased, old PATCH 1+2+4 are in master as commit
>   881e019770..f07ceffdf5
> * PATCH 1: Fix bsd-user
>
> v2:
> * Rebased
> * PATCH 3: v1 posted separately
> * PATCH 4: New
>
> [1] Message-ID: <87h9g8j57d.fsf@blackfin.pond.sub.org>
>     https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg03345.html

