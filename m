Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp3665773lfb;
        Mon, 26 Apr 2021 03:04:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzE6CupbZ6qHjkI9hFiJ0cdVlTnnahq6GpM9CiXDRWtYNRSFrSzeCTq0N6b7u75BPObFnRV
X-Received: by 2002:a9f:3f09:: with SMTP id h9mr10892422uaj.139.1619431444354;
        Mon, 26 Apr 2021 03:04:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619431444; cv=none;
        d=google.com; s=arc-20160816;
        b=0lQVGot/1wuMbfLVqVXqyXO5u+G1qsc52LiCl8pSqW00x1Cx00A0V/gbZj0C4ptxI4
         m8JsP5PLYnfRmBou02+V6RqjKG3mmI2MisnJcQ2q9/lOim51bPABwLaYcRuw0bRZ7Ype
         uSezWGo94rVon+ub8XcGLCMvJE+ZyEuaWe5OKWlgi4i8RlqugzSAlBWpV3tha5Y5oYpK
         cxSHHZZSqOo2hCOLzuOKty7KV/nRPpxJhFHm6qWE4s/JEeMPcMJtADs05hZkZ427v4W0
         a8POcN2OcdL2723tXpoqfU38b81a7W1eTFjaejQIhGzHEF9xfpqKl1NlzXk+GJAEyvwK
         is9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=R0436dLk2HndtFQywLtaoVWXMQDmWlHNBJCP/ULvI+0=;
        b=dNn8vI63sMXtkDT0I3irMDfdvCsUWQ3OCA7XnDCNAUr9FSbv3HiNaroSbYVRa3I64O
         zvu2FpFIm1rMsuC3IPW01Hk27TqRXg9pAMhBtQ9q4ghfyQS3HZPz7yHqI6P7wf+Z3SFD
         tclk0TTLr9J0igH6SfDj3dO2ucTifhgGkOBabWTAadtE+FSOkcdquCa6SmgKmfCMS4X+
         QTzg+zpafqL7dx0HtKlQrFEu0G5DSj6W0O85iwrtrFe9DT7MYQ7bE9FeFeEO7c6oTHws
         dbE/Q27KkSilBGAGdrlXCBkkIukP3LvgirQZbDhnMH5fMAIDMgo9fplvgNEezCItCxD1
         t8Sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hAUgKSO+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10si5922437vsc.319.2021.04.26.03.04.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Apr 2021 03:04:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hAUgKSO+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lay5z-0003yl-N5
	for alex.bennee@linaro.org; Mon, 26 Apr 2021 06:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lay3V-0002eQ-W8
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 06:01:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lay3U-0000SB-4M
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 06:01:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619431285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R0436dLk2HndtFQywLtaoVWXMQDmWlHNBJCP/ULvI+0=;
 b=hAUgKSO+X2aRTCwqNdigjNvpVyR6eJHIZqoHK6oj1Xtp26EdEnHMrHrO7oT7FaqOZPBIZM
 7r4n1pl3XUMggf5S05QxQPhFZRBzb7U0M//Fxw5uYFXu6XV0Sow5iXNvaLy0Ay+4897rFF
 V3CI21H+ZQsWOIj3L9JY1WQa9Bk+fXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-KnVnx-X6O9S35f7Yy4TAag-1; Mon, 26 Apr 2021 06:01:21 -0400
X-MC-Unique: KnVnx-X6O9S35f7Yy4TAag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6319318B9F09;
 Mon, 26 Apr 2021 10:01:20 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-150.ams2.redhat.com
 [10.36.113.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BADF6EF50;
 Mon, 26 Apr 2021 10:01:14 +0000 (UTC)
Date: Mon, 26 Apr 2021 12:01:11 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH v5 0/4] accel/tcg: Make sure that tb->size != 0 after
 translation
Message-ID: <20210426120111.425a943a.cohuck@redhat.com>
In-Reply-To: <20210416154939.32404-1-iii@linux.ibm.com>
References: <20210416154939.32404-1-iii@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QnClBf+AiIBb

On Fri, 16 Apr 2021 17:49:35 +0200
Ilya Leoshkevich <iii@linux.ibm.com> wrote:

> If arch-specific code generates a translation block of size 0,
> tb_gen_code() may generate a spurious exception.
> 
> Fix s390x (patch 1), ARM (patch 2) and xtensa (patch 3) and add an
> assertion in order to catch such situations earlier (patch 4).
> 
> v1: https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg02037.html
> v1 -> v2: Fix target/s390x instead of trying to tolerate tb->size == 0
>           in tb_gen_code().
> 
> v2: https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg02101.html
> v2 -> v3: Split the common code change into a separate patch, add the
>           ARM patch in order to fix
>           https://gitlab.com/cohuck/qemu/-/jobs/1178409450
> 
> v3: https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg02332.html
> v3 -> v4: Add the xtensa patch in order to fix
>           https://gitlab.com/cohuck/qemu/-/jobs/1178409540
> 
> v4: https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg02592.html
> v4 -> v5: Handle thumb: the following C code triggers the assertion:
>           typedef void (*funcptr)(void);
>           int main() { funcptr f = (funcptr)0xffff0001; f(); }
> 
> Ilya Leoshkevich (4):
>   target/s390x: Fix translation exception on illegal instruction
>   target/arm: Make sure that commpage's tb->size != 0
>   target/xtensa: Make sure that tb->size != 0
>   accel/tcg: Assert that tb->size != 0 after translation
> 
>  accel/tcg/translate-all.c |  1 +
>  target/arm/translate.c    |  2 ++
>  target/s390x/translate.c  | 16 +++++++++++-----
>  target/xtensa/translate.c |  3 +++
>  4 files changed, 17 insertions(+), 5 deletions(-)
> 

Thanks, queued to s390-next.

