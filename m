Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp524105lfp;
        Fri, 31 Jan 2020 03:42:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqwENYmTLOfmEPFxa3cnEDnQPGg7LfIthDZO6AR4vYiTKfnKbHx9lkUVBbD3fSnP/hJzzsye
X-Received: by 2002:a05:620a:133a:: with SMTP id p26mr10284862qkj.50.1580470924536;
        Fri, 31 Jan 2020 03:42:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580470924; cv=none;
        d=google.com; s=arc-20160816;
        b=ssrN/LDhWKdPghrI2q6EQyiolvmwGE2ekM8v6zRL6SV0FV5JRlX+9WJx31Ad/4CCcD
         70rADoU6j3rTk+bV9NFal7rQMSPXm42Yio36lAVtrlNElHNQjt6dzHytUXWhLX1B3tdb
         kBhewwSWmEbMq9AR6P2gwg5wiSfVXrDxG5WutK03gX11JN75w7AM0hMsd3Czg9vfVkT9
         ZifVsWrPqHmN2QxQfpgzZcv0l2RZqrlCugekBHZTLrQFApFr6II+k1m+HYus3UHsXyVe
         RyV7O8EZKGv40lrJPkhCSFevVh7zS7fqavOE8OAnx/rXaY39rG/iYtiM9isVq7e0yqAY
         5OGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:references:in-reply-to:date:to:from:subject
         :message-id:dkim-signature;
        bh=t8tDBCjJBco83ksOotYK8srqaxzDB8cXdtJ9GQR4swQ=;
        b=WGoZ9UgWkY+nuQ2x15uUrZTmrIOhnBzFg/Xnp3E7mTt2rkGk6MYK6IPvPKWsRraZl9
         EIMuRRIaUxNGbSxSIg7oUeqPYnNkWXSvmfQDpcklXkYXr4ceqPWHRGSJGI9D6PWjWzyj
         qU6Y6/ErJjjIbxm6uJhrXLVxJTRNpbUBRv64083nq4iBYogJB7zIsK5ax8LJbsW07E4u
         P0Z68VLvgU+btTbeaFincApf4etbwovH8sAZztu6pFUTEJ2YmwwmK9A0fb+ojeJXz63/
         2XTWPbNm/jFEq/cUdJzxbxnrTlV62U9f1q8QlT68O+br+IaGdSa2dAL0atgiVTp6o4Pj
         XZbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MAXzBQSf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y20si5820160qtn.3.2020.01.31.03.42.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jan 2020 03:42:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MAXzBQSf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ixUgW-0005W6-0c
	for alex.bennee@linaro.org; Fri, 31 Jan 2020 06:42:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45101)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <abologna@redhat.com>) id 1ixUfH-0004ZI-BX
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 06:40:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <abologna@redhat.com>) id 1ixUfE-0004Tu-TP
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 06:40:45 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55572
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <abologna@redhat.com>) id 1ixUfE-0004Qq-3k
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 06:40:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580470843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t8tDBCjJBco83ksOotYK8srqaxzDB8cXdtJ9GQR4swQ=;
 b=MAXzBQSfLUnb4d7OqRz2pnUZ6YpI9T6SVcm4q0K3tn7or0eilxOsy2P3PFVDwc82MTcueh
 DrKj4Ms6SGO62VX5SYG97+VnEc1/JPPXNeagkiP/9bNOXJ2J8BeAvyFe6SO45z3u5d0yeI
 0AZIXx3vGx8PngilFXyAIa4yb5sy7NQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-ZWPPLWf0Oz-iExVfW4SY4Q-1; Fri, 31 Jan 2020 06:40:39 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6616108442A;
 Fri, 31 Jan 2020 11:40:37 +0000 (UTC)
Received: from kinshicho.usersys.redhat.com (unknown [10.43.2.246])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B2565C1B2;
 Fri, 31 Jan 2020 11:40:35 +0000 (UTC)
Message-ID: <a978727290d97ee9b91719ed6173f892991e62b5.camel@redhat.com>
Subject: Re: [RFC PATCH v3 0/6] target/arm/kvm: Adjust virtual time
From: Andrea Bolognani <abologna@redhat.com>
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Date: Fri, 31 Jan 2020 12:40:34 +0100
In-Reply-To: <20200120101023.16030-1-drjones@redhat.com>
References: <20200120101023.16030-1-drjones@redhat.com>
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: ZWPPLWf0Oz-iExVfW4SY4Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, bijan.mottahedeh@oracle.com, maz@kernel.org,
 richard.henderson@linaro.org, guoheyi@huawei.com, msys.mizuma@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sPAu3aoYj9Us

On Mon, 2020-01-20 at 11:10 +0100, Andrew Jones wrote:
> v3:
>  - Added a target/arm/kvm_arm.h comment cleanup patch (1/6)
>  - Minor refactoring of assert_has_feature_enabled/disabled in 4/6,
>    kept Richard's r-b.
>  - Rewrote kvm-no-adjvtime documentation in 6/6.
>  - Reworked approach in 5/6 to properly deal with migration and to
>    track running vs. !running, rather than running vs. paused states.

Probably too late since Peter already queued the series, but FWIW

  Tested-by: Andrea Bolognani <abologna@redhat.com>

-- 
Andrea Bolognani / Red Hat / Virtualization

