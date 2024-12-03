Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3549371njk;
        Tue, 3 Dec 2024 01:36:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUEJlnG/Lvnc4et+96LFZJ57o/OQlcWXgWL0nqGTB7TRywnTeO0ZvyLABAr6dcb31ZFU5mYecrTM83Q6g==@linaro.org
X-Google-Smtp-Source: AGHT+IEizh0prNCTHRHacLtJlEfVenOnmvNwkDvJH2wd9UzgLh5UO3ucnrfkRkDSMyc7Edv+/Wl/
X-Received: by 2002:a05:6902:20c7:b0:e38:b889:7eff with SMTP id 3f1490d57ef6-e39d39e66aemr1803762276.6.1733218593375;
        Tue, 03 Dec 2024 01:36:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733218593; cv=none;
        d=google.com; s=arc-20240605;
        b=Pjhopnkc63vHuB57yvSRVsCJmRf5JH6lCBm8p0VSlzQs8bUMgMLfq9iQmh29wM7fuW
         cz8jFf6xdsr1zs6pnVe/ZtAtgx70w1Ujj75sV+eJZmtVz+8T/gemJYjI3t2dJeka67On
         FmLeYkkdUkn2LKviQLtOcwTyCf0g3DKJVWUExf0KvjYhIYIJq0J9+fuxNE091uJPHMMc
         EM1q6mLqcY09meNUByJ/E2BF8JfVBl71CWkh7DxkGfRAeBF7QCZZU1GQAYfmnztwnm9q
         8wbSha1rN2kjCkgYXWrsi/nawVTIXnK68oz4WNoHzFJ07DWmLte+eJkMgHO1kOppFwlZ
         p7pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=rQBKPg7kKSDKtUpdcDIPkN150R6XVQZ1n4vXmPnwve0=;
        fh=/qEdLwlIXb0q9N9NEMDYid9sN9rzPUN7vHyC6Fvo46U=;
        b=I6iS321+OQihJZt8ie2H2Ol5reHvDdC2GOPedatLMIOIGJOHhDyRqf+Q6TjUgtA3l8
         9LZ3Xpo5NGTJXa7N4e/O/DmwrCRgmllAWlFWDxxtNPJ3jTXLv8qzeKNwLjF5Cx1Ys526
         qA0R5gg6BWLyx4K2mfl6vMPEia+30gYQJ2WOAlB0S3KIHf5wgAJK3/JY13r5fCeXXvCS
         JNk0UWXhN9yBgDRu5YpdTuSv3Jbet6H0C/rOZqF8oILmnmvKNcsZwQyqYolKAggs9Ate
         Hs37QhkJOYECZ/5YUsy8vCL+Ht1STZnQSBf9ArJHSnkkDOe6eRaW9/aVJjZfpcvSrFV9
         61rw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CQ6bjcr7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c40542e1si135517081cf.96.2024.12.03.01.36.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 01:36:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CQ6bjcr7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIPKE-0006pd-Vw; Tue, 03 Dec 2024 04:36:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tIPKA-0006ol-G4
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 04:36:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tIPK8-0004OI-WD
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 04:36:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733218564;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQBKPg7kKSDKtUpdcDIPkN150R6XVQZ1n4vXmPnwve0=;
 b=CQ6bjcr7gKW3fj33fsbqRZB6oEJJyqhaq2pyDE5x6GtRcSdn+wLshVViAcOJKSf8l1nyvJ
 Gk4e9lNclrWcb3GOrVE0No+KAenSZQLmPt7Cge8D+TrSS+bZ5E0N7TgBUmDyERald/Nkmb
 YOZmF7PBL7yatyUVPULDARZG19EaO/8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-183-EJopHmXxOcyvUwsuY-hNew-1; Tue,
 03 Dec 2024 04:36:01 -0500
X-MC-Unique: EJopHmXxOcyvUwsuY-hNew-1
X-Mimecast-MFC-AGG-ID: EJopHmXxOcyvUwsuY-hNew
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id F1FBD19560AA; Tue,  3 Dec 2024 09:35:59 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.37])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DF25A1956054; Tue,  3 Dec 2024 09:35:57 +0000 (UTC)
Date: Tue, 3 Dec 2024 09:35:54 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/7] tests/qtest/fuzz: Remove legacy '-machine
 foo,accel=bar'
Message-ID: <Z07Q-vB8Ia6Aypee@redhat.com>
References: <20241203092153.60590-1-philmd@linaro.org>
 <20241203092153.60590-4-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241203092153.60590-4-philmd@linaro.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: VBqsNuV4daG4

On Tue, Dec 03, 2024 at 10:21:49AM +0100, Philippe Mathieu-Daudé wrote:
> Since commit 6f6e1698a68 ("vl: configure accelerators from -accel
> options") we prefer the '-accel bar' command line option.
> 
> Replace '-machine foo,accel=bar' -> '-machine foo -accel bar' in
> fuzzer scripts and tests.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  tests/qtest/fuzz/generic_fuzz.c                | 2 +-
>  tests/qtest/fuzz/i440fx_fuzz.c                 | 2 +-
>  tests/qtest/fuzz/qos_fuzz.c                    | 2 +-
>  scripts/oss-fuzz/output_reproducer.py          | 2 --
>  scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py | 6 +++---
>  5 files changed, 6 insertions(+), 8 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

