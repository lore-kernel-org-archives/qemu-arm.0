Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3556125njk;
        Tue, 3 Dec 2024 01:54:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX8UbyoY2AIRTwWLOHpwDXp07lD85tyZdAYdl9bWSGc1vyF/PWoVtld7rptQl5SCCHUMIaS456Dknlypg==@linaro.org
X-Google-Smtp-Source: AGHT+IFrCjKakFBxygga4qiG4jWUQZ/h7ogwPtq7iht+rHAMQ5UNBv3W9xbrdSNLYCUUMx8hS2YQ
X-Received: by 2002:a05:690c:4881:b0:6ef:8c41:dee0 with SMTP id 00721157ae682-6efad1be92fmr29021667b3.20.1733219690766;
        Tue, 03 Dec 2024 01:54:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733219690; cv=none;
        d=google.com; s=arc-20240605;
        b=gL4EAyIWsquCQYMZSjGOkt2YfQvhydhIt7/QSzIYM4wv/stdaHZ2SsEe3+MrR+/lN6
         /rmiZQanCyWIbeWacjnNeTDiO32e1P7GIe9i5L3PlCxVo67xqUtcBFiuBKctPvh5Lfgg
         uAo+oZvYwEphFdmUkMThxeVm3nrXKHfSct7V9TL85Lgc+rOlmNgYHpKkxqhQwiMg67IY
         ytjJiujWvdE3q8l5wPottVl0umtopoMlbk4lLFy2HtlOcVOHVE5B1foKsDsZg1yHj3tb
         1EtRl8GDv8oFaF7P7DAqRyadgOH3lD7p43h7R3EAyY/9KIfT1u4Cz0YEj4tXr8K3h5IP
         r/nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=l3VcSU2FOCO6z2TK0iPyybiLDyV7PIhM+xSHQeNdxLM=;
        fh=/qEdLwlIXb0q9N9NEMDYid9sN9rzPUN7vHyC6Fvo46U=;
        b=dbP7ovdhrZCD4K0fGIW87B2GfhkvuRqhfGtIhz7tB6QayE1yT/NME4wPFeWbi7wUol
         eoz7ikqmwF+aTW1px9R9ZkyXEw4y6neotsRDyAclDlfeCdukrIl/2XuFNmRlzja4XR0i
         pt1F0xQJzhQ4nMFJS4cCV2UtBuQfr1oSlBf5aY/lncQBuckmsNNSQ5U7Ul3iuO8ihYba
         BotFJwbFDnHnVllJh0DDjuJqCAt1VK2jEp6xRvyf9BZNdocUQamS1sKLSytW5eTVGnBX
         ZkzS03wFBYPcfaG4duOJBlCtYPpi2BOOI8tGasm55Rry96G2kN+YBDEE+sIf87UMuOUm
         bQgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Kfp5pq/z";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d875429392si135595746d6.216.2024.12.03.01.54.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 01:54:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Kfp5pq/z";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tIPc0-0005Q8-97; Tue, 03 Dec 2024 04:54:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tIPby-0005Pr-Cz
 for qemu-devel@nongnu.org; Tue, 03 Dec 2024 04:54:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tIPbw-0006QZ-Rw
 for qemu-devel@nongnu.org; Tue, 03 Dec 2024 04:54:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733219667;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l3VcSU2FOCO6z2TK0iPyybiLDyV7PIhM+xSHQeNdxLM=;
 b=Kfp5pq/z9Und/9eafakMYKJVASJ+fPNjrrVG40srUvIQu3atY6J96teyAX1Dx68LfD9DpT
 ykSHo6VdtPKcWSLwdvfEB4wr3Xp6VAmPhSBGB5AzFDog59N+RADYBln9P6TlDqG3Jha48c
 BxOHw1mHJOFydiIqpw6B5UaRkcKXRFc=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-19-YxXr4IOQPeeG_3ecYmygPg-1; Tue,
 03 Dec 2024 04:54:22 -0500
X-MC-Unique: YxXr4IOQPeeG_3ecYmygPg-1
X-Mimecast-MFC-AGG-ID: YxXr4IOQPeeG_3ecYmygPg
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 95DD5195608A; Tue,  3 Dec 2024 09:54:21 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.37])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 39021195608A; Tue,  3 Dec 2024 09:54:18 +0000 (UTC)
Date: Tue, 3 Dec 2024 09:54:15 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 7/7] qemu-options: Remove mentions of legacy '-machine
 foo,accel=bar'
Message-ID: <Z07VR-YvVCxdTua_@redhat.com>
References: <20241203092153.60590-1-philmd@linaro.org>
 <20241203092153.60590-8-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241203092153.60590-8-philmd@linaro.org>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: HDNQSta19BzT

On Tue, Dec 03, 2024 at 10:21:53AM +0100, Philippe Mathieu-Daudé wrote:
> Since commit 6f6e1698a68 ("vl: configure accelerators from -accel
> options") we prefer the '-accel bar' command line option.
> 
> The new form started to be documented in commit 8d4e9146b35 ("tcg:
> add options for enabling MTTCG"); it is safe to remove the mentions
> of the legacy option.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  qemu-options.hx | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index dacc9790a4b..11f0aab1470 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -27,8 +27,6 @@ ERST
>  DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
>      "-machine [type=]name[,prop[=value][,...]]\n"
>      "                selects emulated machine ('-machine help' for list)\n"
> -    "                property accel=accel1[:accel2[:...]] selects accelerator\n"
> -    "                supported accelerators are kvm, xen, hvf, nvmm, whpx or tcg (default: tcg)\n"
>      "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
>      "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
>      "                mem-merge=on|off controls memory merge support (default: on)\n"
> @@ -59,13 +57,6 @@ SRST
>  
>      Supported machine properties are:
>  
> -    ``accel=accels1[:accels2[:...]]``
> -        This is used to enable an accelerator. Depending on the target
> -        architecture, kvm, xen, hvf, nvmm, whpx or tcg can be available.
> -        By default, tcg is used. If there is more than one accelerator
> -        specified, the next one is used if the previous one fails to
> -        initialize.
> -

I'm not convinced we should be removing documentation for options that
currently exist and remain supported.

The documentation should be updated to say that we prefer use of '-accel'
instead at least.

Beyond that, what is our long term intention with '-machine accel=xxx' ?

Is this a case where we are happy to leave '-machine accel=' as syntax
sugar forever ?  Or is this a case where we want to deprecate it and
eventually remove its impl (and thus the documention here)

>      ``vmport=on|off|auto``
>          Enables emulation of VMWare IO port, for vmmouse etc. auto says
>          to select the value based on accel and i8042. For accel=xen or
> -- 
> 2.45.2
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

