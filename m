Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1457816ejb;
        Mon, 4 Sep 2023 09:38:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT5sKIKmsMj0N+YwbAoE2WPCOgq6I46qwyga8xI82FWKvigHRAEV0/R2gjEIa6eejdaUXM
X-Received: by 2002:a0c:f508:0:b0:641:8e1a:d23b with SMTP id j8-20020a0cf508000000b006418e1ad23bmr10889438qvm.31.1693845533562;
        Mon, 04 Sep 2023 09:38:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693845533; cv=none;
        d=google.com; s=arc-20160816;
        b=Mu6wcdRbPvao16C0HhtgI+cG5iSY5Nv+JTnEz+YJl2rYd/CWfeFL2Tl+q2l5OYIBdN
         /9UYozqF/AK/LSDJfqyBKcIMU1emk/M7lfb/T0I8DfOYdVSdafhnyVbNG8mMtzqaJ5rZ
         EEQ7SVF826slzutqQHJFA0rqphP4VHji+R6KqKMgNteZum8Uy4EJtXe2tlVkXY2wZTdN
         WZq0+enaTvV9VnUtT6x0YcTQ1bzfKJfhlyf9Z/9At2ZVn7eQa78NtPbZLGgGQBHXrLVh
         nyIb6ZuejwNsTSJw7kMCDqL6rJ87dul+Qj6+druRV2oMYrGS1Sn4AuGZxYFg4kHZRTJh
         M5vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date;
        bh=pAG0Ccf3uocDZIAd4OZehYdDKmhXYc511r7H8+eb0bA=;
        fh=A96KMU0INX3MBXxB7hfzMNcxD9JyFEVlv8RBlGfnFaE=;
        b=X3F6N6j0KS5w7R6n7Hj+KSuUFLQIOYmw9CUe+fV1QxbbHyq7FrZdvC8DaI+NhHmUIU
         FmDBWoJe1aaXFeh82jX28bDmABZI4xxS5PaqNzBLrLUJiURZ/5QkWZSQd9jfAFWaoKVL
         OIOcOFKQmgf+GBzgyJY5+t12W2eqGUgDuAB76Z9UNiW5GupmlcoOBsLghKWvA3zKkM2q
         9kiBJasr1JiE3ppwB+moQPp4QgEGluO0WQtqednfWHxSZA5e7zKEqG4KcGRdzHXy/hXw
         xbHIGoHrCh5frS8xAyJxCJHnOQr26WIKTJhhU/MUy6VAXQVBEbXo7Tg0ySLbsvcrAg0g
         nMYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4-20020a0c9d44000000b0064f5adbd41asi6505096qvf.546.2023.09.04.09.38.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 09:38:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdCb9-00041B-Uc; Mon, 04 Sep 2023 12:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qdCb7-00040J-QY
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:38:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qdCb2-000501-VT
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:38:45 -0400
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-n2ioqOH0PF-NBkmIyU_qkQ-1; Mon, 04 Sep 2023 12:38:35 -0400
X-MC-Unique: n2ioqOH0PF-NBkmIyU_qkQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44A721C05AD0;
 Mon,  4 Sep 2023 16:38:34 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 583A740C206F;
 Mon,  4 Sep 2023 16:38:31 +0000 (UTC)
Date: Mon, 4 Sep 2023 17:38:29 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: William Tsai <williamtsai1111@gmail.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Lieven <pl@kamp.de>, Fam Zheng <fam@euphon.net>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v2] qdict: Preserve order for iterating qdict elements
Message-ID: <ZPYIBVtUgDGhj3TQ@redhat.com>
References: <20230902094041.8626-1-williamtsai1111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230902094041.8626-1-williamtsai1111@gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Ozy1nlmcZqQE

On Sat, Sep 02, 2023 at 05:40:40PM +0800, William Tsai wrote:
> Changing the structure of qdict so that it can preserve order when
> iterating qdict. This will fix array_properties as it relies on `len-`
> prefixed argument to be set first.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1090
> Signed-off-by: William Tsai <williamtsai1111@gmail.com>

This is a variation of what Markus illustrated a year ago

  https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg00758.html

I wasn't a particular fan of that approach at the time.

I've made an alternative proposal here which avoids the broader
impact of this QDict change:

  https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg00652.html

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

