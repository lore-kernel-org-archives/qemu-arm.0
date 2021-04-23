Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1216952lfb;
        Fri, 23 Apr 2021 03:31:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWsqUwaVG1E+bNUubHtAzpxTfHgs3pT2RH+3mxBOvGTIDdq6W48rwiZ9bLYHCmPixVTY/L
X-Received: by 2002:a67:483:: with SMTP id 125mr2559143vse.51.1619173913118;
        Fri, 23 Apr 2021 03:31:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619173913; cv=none;
        d=google.com; s=arc-20160816;
        b=aynVw6RoNXtLHRpUVil8c+9EJ5SLvUZVxaOtK9Dxf2tPyxbdM0T0lqcf5e93yR2GsM
         AA9IBb7lYcbyat60K1MhQt2cbOnefNVniSIOvZ6h34bHyVYsfljxdT3kEj3Pugb7EPxx
         MPFvpbZ2RYji7IUizn2o04Wqpr3OD+Gzkpwy3N1qID+ksls8Eu32Y8frgy8h2R1KpwBo
         LN0SUtBdugbRVzLPLAg2C7mgeLC7Tnv3RGVZmiQKe+Nys0zyrAXhn4eq0aPE4zayLgv5
         lBzParx40xtP8kgEoqbZywrSlb11fVy5L19/nurN5IXSdCYY5WpJvHZaeEOTN/KNKQs4
         Iuqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=4CzG5FikExKyJ3KZeuGJMNLB8X6KOSfGNoI+Q2FaI6Y=;
        b=lrsiVf2gtqJajgBBz15sqWNtTruNoud4i5jWsGDOzdnTmUq6h8CRsJYoicwqhXPvXg
         lY5L1DLh/HWqDHG4WwrF0QD805PB8/OKTH/PD+LvTtdqYp86Bx03yQz+TSU70PsCw0rP
         1NO/OvsAObhTeoJDL7R4jBaXp5a4yMcl1xYkath9ATqxRx+XKlwGj//QjREpoKrMgxcx
         M6JN+sUv18pFmD63E/XWk5BhJmcrveoCEwabzfg5bZgqjZkv17Z/imZ3E0liYVIFMELr
         XM7WNH0zOfxvHuLCdUm1YvcQY3kpwgbgWQ10Bg9YiNd0hZRECOl8tlLwQlSnlAGGKhVs
         PFlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bo9ibgGq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r10si3056770vke.18.2021.04.23.03.31.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Apr 2021 03:31:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bo9ibgGq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZt6G-0004sE-Dz
	for alex.bennee@linaro.org; Fri, 23 Apr 2021 06:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lZt5t-0004op-Cv
 for qemu-arm@nongnu.org; Fri, 23 Apr 2021 06:31:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lZt5q-0003nt-L5
 for qemu-arm@nongnu.org; Fri, 23 Apr 2021 06:31:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619173885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4CzG5FikExKyJ3KZeuGJMNLB8X6KOSfGNoI+Q2FaI6Y=;
 b=bo9ibgGqeJrte0nG3V4oR6eMm+oYK2mnJtnjoUKgWmusFUlYwQpm3X2tTodUjStuFSC7/N
 K7sAoUOl95jTlSQzadqurHOXD2e4N/TmAc1x+uoFRmuWR1cYf9aogGX6nOA4S3f7irh5IC
 5ACFxeoMB8MDvR2MBua++5rzTiz7A2c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-XPh2Utw9N6u4K6BCxF9urw-1; Fri, 23 Apr 2021 06:31:22 -0400
X-MC-Unique: XPh2Utw9N6u4K6BCxF9urw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C912F107ACCA;
 Fri, 23 Apr 2021 10:31:20 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-167.ams2.redhat.com
 [10.36.113.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A29B1865D;
 Fri, 23 Apr 2021 10:31:14 +0000 (UTC)
Date: Fri, 23 Apr 2021 12:31:11 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH v5 0/4] accel/tcg: Make sure that tb->size != 0 after
 translation
Message-ID: <20210423123111.0575608e.cohuck@redhat.com>
In-Reply-To: <20210416154939.32404-1-iii@linux.ibm.com>
References: <20210416154939.32404-1-iii@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MVMi8VPUhVv5

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

So, what's the way forward here? I can pick this if I get an ack for
the arm patch. If someone else wants to take this, I'll just ack the
s390x patch.

