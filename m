Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3548719njk;
        Tue, 3 Dec 2024 01:34:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCULCSHUUFhZ9oAIUB6Bk/6anaSE+6NLYUlr1wkJKyqrfCVYkq14Wc1bOM3HjdpYd0lcEoz31HbFrpom/g==@linaro.org
X-Google-Smtp-Source: AGHT+IGrYF1ZgxrcabCeAL/qjN0rZPZ8rGC96NAW/RUri4V0eSsQtvMbBV+KGMCLuDQ3KqI9ZSTK
X-Received: by 2002:a05:6214:5093:b0:6d8:7ccf:b692 with SMTP id 6a1803df08f44-6d8b73574f4mr22420826d6.11.1733218496261;
        Tue, 03 Dec 2024 01:34:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733218496; cv=none;
        d=google.com; s=arc-20240605;
        b=ViWu3RFAaiOAXwbWjhmDz8C0+kDkAUm3vXd3AJz/TqaEh9fbIYFFDZbVATtlIzp0pD
         BCchDv6C4iRM9bETKLkMNVdKczIjknS/CxVt9HNfZw0+OMG7DKh22enj1KGTp/aEyWMQ
         ey5MT8dMElPOahWuBi9/g4F9CseBlmj+NMQOADBSAXt4N7muxf3gLSC59S62v/BxLTlh
         bxLG5XAL9GIEKgbUMrpyZUnsoyYK8F5kbkoxOkBegIBwyY35DYOt7eg8zmb17TKvP4wl
         sfJ8s0ESTRYFCv6HuUTs2DXAK0Fl+fQfUldorvfcxFTnBf4LFaAVfpohzgaTfIfuHhMD
         j/qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=IfaFyjHUCv5c9jS6dqEqYzXGE/sktBXnwnslhm1P5GU=;
        fh=/qEdLwlIXb0q9N9NEMDYid9sN9rzPUN7vHyC6Fvo46U=;
        b=DO9j9KZA42IRfzkaQHg4Zbka8bS4BKOivQYdYVZaNYsTybum9B4PPvx+ln+wfoPuNy
         hff+yzGan9AR3lfCGO43epUYkYhiV3KMA/pj1iFbcsUCpyhaOyLX6mE0noX008VsZu0R
         a+meM/VMhPs4eLsfbgAb2NYGi0+hKjw5IXKoeshy+p8Lg+KLIiypSD+yxxjrl1WJd7Al
         24j68ye2MtvTSpN1It80666Arz+CIy9XHxxvvudg/HPBIMrqjc4nxydvwb+WKpLt6ZKy
         1ZiLrTw2g368HOEF1M7r+v1bM1tQ/5XdHqQ4WL5VZNjCBhFSnCM8r4A8CtjPtMiV0sXe
         cvcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BTplj7Pe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849fb044si1375709185a.692.2024.12.03.01.34.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 01:34:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BTplj7Pe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIPIg-0005Kf-5D; Tue, 03 Dec 2024 04:34:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tIPId-0005Ir-C3
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 04:34:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tIPIb-00045E-QG
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 04:34:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733218469;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IfaFyjHUCv5c9jS6dqEqYzXGE/sktBXnwnslhm1P5GU=;
 b=BTplj7Penr9yGfidmiC/wOQnRSb0GFQEYqIVLxI9ofyIok33If29nC9YOhI47Ov6o6odB9
 cp4nCeuP2u6s/UMKJrewRYoG6j6uzZ3ds1kfQz4DIqBzz+zLEVQ3FNRaiZ3carEAjVgg+0
 nwim1ECvs1NMMffE92xgJ8tZqq9JyJM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-621-Felw6C6uNPC6Oa_d6tQmDA-1; Tue,
 03 Dec 2024 04:34:26 -0500
X-MC-Unique: Felw6C6uNPC6Oa_d6tQmDA-1
X-Mimecast-MFC-AGG-ID: Felw6C6uNPC6Oa_d6tQmDA
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B497B1945CB2; Tue,  3 Dec 2024 09:34:23 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.37])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 10BCE1956054; Tue,  3 Dec 2024 09:34:19 +0000 (UTC)
Date: Tue, 3 Dec 2024 09:34:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/7] tests/functional/test_ppc64_hv: Remove legacy
 '-machine foo,accel=bar'
Message-ID: <Z07QmFh3EP_qoB8R@redhat.com>
References: <20241203092153.60590-1-philmd@linaro.org>
 <20241203092153.60590-2-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241203092153.60590-2-philmd@linaro.org>
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
X-TUID: NmYxIkkqF3Q2

On Tue, Dec 03, 2024 at 10:21:47AM +0100, Philippe Mathieu-Daudé wrote:
> Since commit 6f6e1698a68 ("vl: configure accelerators from -accel
> options") we prefer the '-accel bar' command line option.
> 
> Replace '-machine foo,accel=bar' -> '-machine foo -accel bar' in
> functional tests.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  tests/functional/test_ppc64_hv.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

