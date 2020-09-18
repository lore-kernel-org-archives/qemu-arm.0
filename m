Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1734479lfq;
        Fri, 18 Sep 2020 11:00:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPlfzNgiMAf9xFyGL90de7oDhQXw2Js5Ny+GurEz4/w27Bdl82svKsKZuwXJ/sUmiTG55R
X-Received: by 2002:a25:3ce:: with SMTP id 197mr5288508ybd.233.1600452034171;
        Fri, 18 Sep 2020 11:00:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600452034; cv=none;
        d=google.com; s=arc-20160816;
        b=SCquwCR9fizmVrsoFqrGR0M/zj/DLXtrA6ai1hrFFFJZ2kMXjZMpCMOe6Q611qfzZq
         TAjcTSIlXB8B0b4zPUuI1f6P93o5ROgbono64ZR1ojTAulByPVJRnAIsWC8HwOnwzKc5
         TQF2LKQ8viYLG5BuclSQmB/usPUr5l1IxYr9kVInEJ1xq2qUwRBsRADqJGE1vHtvcK6p
         Vcid2iQVtnIDWwzg+ZL9K9Ido0syp9QgAsOLvS8PuINT2aYnneZpvNKciklJwrddTYoK
         5y2lWWZsFK/jBx0pat77YbOJpf3UIVPbgyHNjdlRL0IfBFv6y+lal4gYamBjDy6dXqWm
         AMcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=3F1x7MczDYTNGGFx+fYd5czEPRA32ArBkr30TvxIgkg=;
        b=V84ypmwO14GDsu261OO7Pybg5GwKPwoUx0TbPj/mqEi+Rm5k6A5cXvA8XPYeSypjcl
         lvd+1Z1JU28WtATFYVl29I4FbOuOR9PjLKpzF371MHK6Yc6AdLM111BPmsWuHLG01MEg
         qMw3YOS7Z/YR5Hae3T4IEpWX3WCHSiNqxxKIWHHFKMuD740QKDYPj1z9wxr3SrkkdJv+
         yvH6k3x5j9ocgoDqwRv0wyFtwSbnrF7OZg/LOBn7q6ERGizQ0wrG2JE4HjHv9z+e1x9R
         DmrwWNoGkSOV6FhsjbDzd1ZYp0B2hzj8kwI8eXOxjcfgARNMJDOIZDgpz5kh2zqCtU/y
         LxCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=L9oG8N+j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b130si4153823ybg.60.2020.09.18.11.00.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Sep 2020 11:00:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=L9oG8N+j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kJKgT-00075u-Gg
	for alex.bennee@linaro.org; Fri, 18 Sep 2020 14:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kJKgE-00075Z-M7
 for qemu-arm@nongnu.org; Fri, 18 Sep 2020 14:00:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kJKgC-0002FB-0o
 for qemu-arm@nongnu.org; Fri, 18 Sep 2020 14:00:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600452014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3F1x7MczDYTNGGFx+fYd5czEPRA32ArBkr30TvxIgkg=;
 b=L9oG8N+j/CPgU46OtRx5dP/nLderNlCJK3iFda+0mwRRD/c5myrCGArjhE27T6Z+QFxU2b
 OUQ0FdjBDRsasS/HY5gMo7BjAP9dWkvK50q80PIN2hF+odGQ/8agN4RR/hamMUyiC5/F34
 5CF5uSHgcPNbQtIhm9qr+Uk0UMr+Mdg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-jDN9dpt8M3KLZjv8TqPZjQ-1; Fri, 18 Sep 2020 14:00:13 -0400
X-MC-Unique: jDN9dpt8M3KLZjv8TqPZjQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35FAD192CC46;
 Fri, 18 Sep 2020 18:00:11 +0000 (UTC)
Received: from localhost (ovpn-119-217.rdu2.redhat.com [10.10.119.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86F635D9D5;
 Fri, 18 Sep 2020 18:00:07 +0000 (UTC)
Date: Fri, 18 Sep 2020 14:00:06 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 0/6] qom: Allow object to be aligned
Message-ID: <20200918180006.GC7594@habkost.net>
References: <20200916004638.2444147-1-richard.henderson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20200916004638.2444147-1-richard.henderson@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 01:32:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s/vvzQLEgNMA

On Tue, Sep 15, 2020 at 05:46:32PM -0700, Richard Henderson wrote:
> I've seen some failures on arm and s390x hosts after
> enabling host vector support.  It turns out that the
> malloc for these hosts does not provide 16-byte alignment.
> 
> We already have a function that can alloc with alignment,
> but we need to pass this down from the structure.  We also
> don't want to use this function unconditionally, because
> the windows version does page allocation, which would be
> overkill for the vast majority of the objects allocated.

I'm queueing patches 2-6.  Thanks!

-- 
Eduardo

