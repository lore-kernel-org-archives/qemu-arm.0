Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3552110njk;
        Tue, 3 Dec 2024 01:43:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW71dpYPTewoUKYROjfqbewSzouaMtbW4b0D/ScRjb++r+dhpLdCFA/SII2mDU/NU3UcJ0hboSKrL+hFw==@linaro.org
X-Google-Smtp-Source: AGHT+IGagcqiH8Ct3y6pdFsl6M5qo8GBU7dW+ydZrnP4L8n3W/Xvp4p4TgEd+YISu3WAiHQOgMj1
X-Received: by 2002:a05:620a:40d4:b0:7b1:453c:56b3 with SMTP id af79cd13be357-7b6a61d8677mr183934285a.38.1733219010732;
        Tue, 03 Dec 2024 01:43:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733219010; cv=none;
        d=google.com; s=arc-20240605;
        b=ZaxyFgKpw1kgujRqHPaQLnxci4CQytzG/35eVr+UkRVai4X90ozFtwZtLtEDPklVbd
         WzYKWASrhNlF71Mf6maxGt4HfRnoXBZ/kIX7rp67cdYF7E9S+Ua53UNoaaSNInWF81FG
         PtDy8pygRpsOjJjCeiZX6ZyFWF37+EraHzJd0IowjtXiCsvWo0scStaNTQdIfRZJtB4a
         RKT+AZlPlRyEU9CkeRqkobeExkmQUrSoBa1VjXabSNeotRQN09NqnNvGAarYrnt8hdWE
         QUMnO078wCSc6AAei0au9nQtn62Rigq7xEjnEnMFH5XQbp9A2hzo9Yjz+QTGWoiC3Cf2
         8hMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=I+JRUYnBGGGQCm69OO+rjh8nq3v9YjWxvZA969LR9Tw=;
        fh=/qEdLwlIXb0q9N9NEMDYid9sN9rzPUN7vHyC6Fvo46U=;
        b=LPiO55K6Jn47C1PfbRX+goMsRayiguvRUFX8ZL0AsrljX7rnHuR3lP7nVery0K84Ec
         Zlyy8raJIPTSpvQvuqIM6tjtQ5XxWxEUbGp0l/2fsUeWGTL36r8I1N6YquPZ/X+qjaOA
         CD2Ksf0ZIqnkReM4oVcuB83f/CBIT00kmCHGUSnbva65uBbh/vleQqXIZVJwBH+zGHuc
         4NsEFpGevxIx4dU0gBkNvt8muIu/Jny5iHfEax643/7PRGV7jm0fGT0gR1tGv04qE8FU
         diTVUsB019TiUe9bd/c1OADw4qCUdC0KIiKIjd+0KIOjuBe4RnrcVzTq2KSl1NGRExr4
         vusA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bSvTOInJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849d72d1si1418145985a.495.2024.12.03.01.43.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 01:43:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bSvTOInJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIPR1-00023a-VY; Tue, 03 Dec 2024 04:43:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tIPQz-0001vC-8K
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 04:43:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tIPQx-00054I-Oe
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 04:43:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733218987;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I+JRUYnBGGGQCm69OO+rjh8nq3v9YjWxvZA969LR9Tw=;
 b=bSvTOInJMRaJVATcnvR5w6P950rAQULYJNM/G0mMxFmjmbxpTHyCWJOMRDLLugpgjSjWMu
 1AuOkfKXIN4U/OYT5LDojwYyS5spJhsUCYLBSkNblp+HNwO+Lp+mY0AvgOjqzEk67gLpPy
 y7XuLO6/nbCQJcWzQE/U7PECg0YZzso=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-365-jUBPHpOAMHWdwhWg_maZJw-1; Tue,
 03 Dec 2024 04:43:01 -0500
X-MC-Unique: jUBPHpOAMHWdwhWg_maZJw-1
X-Mimecast-MFC-AGG-ID: jUBPHpOAMHWdwhWg_maZJw
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C3C591955D45; Tue,  3 Dec 2024 09:43:00 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.37])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8F78A1956089; Tue,  3 Dec 2024 09:42:57 +0000 (UTC)
Date: Tue, 3 Dec 2024 09:42:53 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 6/7] accel/kvm: Remove mentions of legacy '-machine
 foo,accel=bar'
Message-ID: <Z07SnalqtT8hYsSZ@redhat.com>
References: <20241203092153.60590-1-philmd@linaro.org>
 <20241203092153.60590-7-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241203092153.60590-7-philmd@linaro.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: beK43BQ4isjr

On Tue, Dec 03, 2024 at 10:21:52AM +0100, Philippe Mathieu-Daudé wrote:
> Since commit 6f6e1698a68 ("vl: configure accelerators from -accel
> options") we prefer the '-accel bar' command line option.
> 
> Update the documentation when KVM is referred to.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  docs/bypass-iommu.txt            | 3 ++-
>  docs/nvdimm.txt                  | 2 +-
>  docs/specs/tpm.rst               | 2 +-
>  docs/system/arm/cpu-features.rst | 2 +-
>  docs/system/cpu-hotplug.rst      | 2 +-
>  docs/system/ppc/powernv.rst      | 2 +-
>  docs/system/ppc/pseries.rst      | 4 ++--
>  scripts/device-crash-test        | 2 +-
>  8 files changed, 10 insertions(+), 9 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

