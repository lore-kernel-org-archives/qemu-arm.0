Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3550195njk;
        Tue, 3 Dec 2024 01:38:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUCpug6WxOzhdY6dXvy1xuOtHp4I6LmH1M4Q0a6naqkxldY1XPZ6dTUeIEgF21b8qPsY3JxssszOZ2qHg==@linaro.org
X-Google-Smtp-Source: AGHT+IFxEn8GHvvArooFF1425SnEkJ/q98rmuWlkmZqIAskqPXmn7u/kEtqdFKeLWNOIxgZsT7jw
X-Received: by 2002:a05:622a:11cb:b0:466:8a95:d1c9 with SMTP id d75a77b69052e-4670c3dbdfcmr22456201cf.47.1733218723319;
        Tue, 03 Dec 2024 01:38:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733218723; cv=none;
        d=google.com; s=arc-20240605;
        b=ZNAd0dlQNHULMY4e/ljQXze/dME75oRBHcEKW1Iy9Buy7Icp1MLVOQ1E33E4eht+xZ
         y6/W2lahm4B7FQMW73GTU9kw/DC4HVBU19UR0qsDRBWC5AbpdlG2xL6mp03F7Uw37PA9
         55aX64gFio2Z1yJElzsCQLDRvRAAXfzAgukCKqixzOjUu2GMEJcfE05r9eHu0vHgUfrQ
         fgBQaDUpWeGyHscjofZArTyI+n75LESmHVqM1qCy5rwtsyBtmvdNVtnA9gbUXBknkCIv
         MltTt3msnF4MQ8Ct+lu22coFlJrI7UJ6oqJAjnt8Jxf7xTj8GsAraAyC5/MDXqmaCuuT
         UAdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=8ny4xWTBcN9ksCKY3sFHa4wfhsqLLtBnjJ3TxutDRXU=;
        fh=/qEdLwlIXb0q9N9NEMDYid9sN9rzPUN7vHyC6Fvo46U=;
        b=acT1dJTf9RInDCs8XOPzn7LnbzvVHKr6xxDc7D/4+85c3nYMqmKTTSynF0IYOjBOaO
         c1RbF1mOThyOT1RSRPygoU2FTeGPVXprxCez3GNwO9hmvnRBbdEVzYmyGPOYu2mtnfbF
         zCZhaZSMujSvTLChjxU1cw98q8aMAwivuC4t6KH/EKHhkuXhpBUMolUj8/CFbYB8cahu
         fn9XpEVxbLKtr/n/K2ApMU7BmEcW7u/6OM+MOf7ZhDDtnyokwhaSyoeNhvFJMkLQYxao
         88mq/hkyLdL5aHaZouNnnw7Tgpu3YVu2A54SkFi8ndKJ6XTtA63SU3kOUpihbM5/RQEi
         Q02Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L2C1G4sT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c422751csi133305741cf.413.2024.12.03.01.38.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 01:38:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L2C1G4sT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tIPMS-0007bQ-G1; Tue, 03 Dec 2024 04:38:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tIPMQ-0007Za-FD
 for qemu-devel@nongnu.org; Tue, 03 Dec 2024 04:38:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tIPMO-0004Vb-Sx
 for qemu-devel@nongnu.org; Tue, 03 Dec 2024 04:38:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733218704;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ny4xWTBcN9ksCKY3sFHa4wfhsqLLtBnjJ3TxutDRXU=;
 b=L2C1G4sT01kd5upDvOmAo54MAfo8oMtpNhpRfKGfPcWBUNK3PmDK92zTnEWzSPIxlPSxiu
 PQ8tBUI07FYwOH727iyFzZhcO3estSeJrC6+/KDzxeW8wzFhuFnffMm0ELfG7YgXGrhwx7
 yVqMxmljMUeHvxapdGzG6PLG/oy0ksg=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-491-4W2OJDnoPW6sgWszQLdNtg-1; Tue,
 03 Dec 2024 04:38:21 -0500
X-MC-Unique: 4W2OJDnoPW6sgWszQLdNtg-1
X-Mimecast-MFC-AGG-ID: 4W2OJDnoPW6sgWszQLdNtg
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 001021944DD3; Tue,  3 Dec 2024 09:38:20 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.37])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1A4731956064; Tue,  3 Dec 2024 09:38:16 +0000 (UTC)
Date: Tue, 3 Dec 2024 09:38:13 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 4/7] scripts/device-crash-test: Remove legacy '-machine
 foo,accel=bar'
Message-ID: <Z07RhQE8UOdWlzFS@redhat.com>
References: <20241203092153.60590-1-philmd@linaro.org>
 <20241203092153.60590-5-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241203092153.60590-5-philmd@linaro.org>
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sL2z9iScOdsd

On Tue, Dec 03, 2024 at 10:21:50AM +0100, Philippe Mathieu-Daudé wrote:
> Since commit 6f6e1698a68 ("vl: configure accelerators from -accel
> options") we prefer the '-accel bar' command line option.
> 
> Replace '-machine foo,accel=bar' -> '-machine foo -accel bar' in
> the device-crash-test script.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  scripts/device-crash-test | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/device-crash-test b/scripts/device-crash-test
> index da8b56edd99..2b139e29ba0 100755
> --- a/scripts/device-crash-test
> +++ b/scripts/device-crash-test
> @@ -295,7 +295,10 @@ class QemuBinaryInfo(object):
>          self._machine_info = {}
>  
>          dbg("devtype: %r", devtype)
> -        args = ['-S', '-machine', 'none,accel=kvm:tcg']
> +        args = ['-S',
> +                '-machine', 'none',
> +                '-accel', 'kvm:tcg',

-accel doesn't work this way - that is legacy syntax sugar from -machine

You need multiple args:

   -accel kvm -accel tcg

> +               ]
>          dbg("querying info for QEMU binary: %s", binary)
>          vm = QEMUMachine(binary=binary, args=args)
>          vm.launch()
> @@ -358,7 +361,9 @@ def checkOneCase(args, testcase):
>  
>      dbg("will test: %r", testcase)
>  
> -    args = ['-S', '-machine', '%s,accel=%s' % (machine, accel),
> +    args = ['-S',
> +            '-machine', machine,
> +            '-accel', accel,

I've not checked what 'accel' value is - if that's another compound
value like 'kvm:tcg', it'll need to be turned into an array, and
expanded to multiple '-accel' args.

>              '-device', qemuOptsEscape(device)]
>      cmdline = ' '.join([binary] + args)
>      dbg("will launch QEMU: %s", cmdline)
> -- 
> 2.45.2
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

