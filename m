Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp190546njb;
        Tue, 4 Feb 2025 05:02:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXu49svc+CuEx138lVX5qht4yLgOprd/Wcy2uVzHFMyM6hm5eZQfvqS5DSbmLQfmK6ciZZyCEwqvistxg==@linaro.org
X-Google-Smtp-Source: AGHT+IGoMxCJDPSyWgQ7Ff/J4L172oMYb7fFxGCXacq/8BlDzLli6fbrP9sXsDi0b7TfTdiwm9Jx
X-Received: by 2002:a05:6000:1fac:b0:38d:af14:cb1 with SMTP id ffacd0b85a97d-38daf140ef5mr1604438f8f.54.1738674146392;
        Tue, 04 Feb 2025 05:02:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738674146; cv=none;
        d=google.com; s=arc-20240605;
        b=TZk4CqIINyhPAFcIR0iAX+sD0xN1sOFtvXDYfeS2QdVtrB9V+r7w7n5rGYCvDrJeYN
         4g1JHx43aOgJDpVOaeATKBr9JC3HP4pUL75lR5pZuRiMN3SrNtXBMwHleuoNcSScQXUv
         PJXGT1FgBmYMMtgrnYuIt4U3lu2ZDx/L1P3LXPtiMdnSvak1zW37Z5LN+h+S1oFeKfNz
         JbDFHV4N8gYURWmlm6uTJ1hUeZ6essY6SUObD9yERwY5pXIArZUwMRefKgc2j3fOubGO
         fgGa7BEYuXCPG+uqLKho0VtAjXeBNqBjYhidg6+VaYHfSYaddzzJBlNkyGwcwvH0W4w+
         MsAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=qCMzk6K9ok6u+iGaB5Dlm0fr7hDIoGpmYq7P/OjM+Bk=;
        fh=PpZ1CCXoZMh/DRvZh+FxXhmYvb7cgaexUeWdx5nsuRU=;
        b=I+V6rJ7L/KNeF6xViVFx9s2aAIvhYtXfqjZ71JxEd3wzraGbPlKixdUk78Xk2+SSaE
         WpkkANmzwcZ1r3U8ONOfpokI7gyzk6nJeKHCKo7o2kdDqwXJEZIQV6lny4kf8hcMAahT
         XFHYB1gbC0R4VxxTGxvmmPach/aYo1Ff/sLW7gOkIo1dKenfWV9NyRVU6jDoLDocwy76
         yLTIOUnWgRlXfCtj2ZoNuahuPu56z61pTFhL47gDKx+Bmiz5x2BpTubHJqtLqXi954WR
         oQ1eF06w4I6TBYJFuw8sebX7DvaIf06ssZoNN8R9uaqrUlAzEIiWh4bd6LC4puiDOGtT
         I/pQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Mt48p2Nd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-38c5c20dc8asi8013772f8f.830.2025.02.04.05.02.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 05:02:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Mt48p2Nd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tfIYa-0001j3-2s; Tue, 04 Feb 2025 08:01:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tfIYI-0001cU-0D
 for qemu-devel@nongnu.org; Tue, 04 Feb 2025 08:01:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tfIYE-0004sy-5e
 for qemu-devel@nongnu.org; Tue, 04 Feb 2025 08:01:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738674071;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qCMzk6K9ok6u+iGaB5Dlm0fr7hDIoGpmYq7P/OjM+Bk=;
 b=Mt48p2NdN3W0j8aoRD6kUw1B4iUt/RZGBW7hwvVt4ICd35cDrSfw8kI+0x7WtnLprUWj5/
 Gs4iobrYru+lAgBcwzmJEFgXcBmFrZdVB3KQiMGICZOvB8WZQpooN6lDuqfU1vTIAEKLxt
 Vl6Of0ikN3oeIo6WFd4IrMdueCNG5RA=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-516-ASaKM-APMZ-VisEQPW6Dww-1; Tue,
 04 Feb 2025 08:01:08 -0500
X-MC-Unique: ASaKM-APMZ-VisEQPW6Dww-1
X-Mimecast-MFC-AGG-ID: ASaKM-APMZ-VisEQPW6Dww
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C8EA11955DDD; Tue,  4 Feb 2025 13:01:06 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.60])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 89CAA1800268; Tue,  4 Feb 2025 13:01:04 +0000 (UTC)
Date: Tue, 4 Feb 2025 13:01:00 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] qemu-options: Deprecate -old-param command line option
Message-ID: <Z6IPjKFsUCWFhBk5@redhat.com>
References: <20250127123113.2947620-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250127123113.2947620-1-peter.maydell@linaro.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: eqI+iPjTrYeq

On Mon, Jan 27, 2025 at 12:31:13PM +0000, Peter Maydell wrote:
> The '-old-param' command line option is specific to Arm targets; it
> is very briefly documented as "old param mode".  What this option
> actually does is change the behaviour when directly booting a guest
> kernel, so that command line arguments are passed to the kernel using
> the extremely old "param_struct" ABI, rather than the newer ATAGS or
> even newer DTB mechanisms.
> 
> This support was added back in 2007 to support an old vendor kernel
> on the akita/terrier board types:
>  https://mail.gnu.org/archive/html/qemu-devel/2007-07/msg00344.html
> Even then, it was an out-of-date mechanism from the kernel's
> point of view -- the kernel has had a comment since 2001 marking
> it as deprecated. As of mid-2024, the kernel only retained
> param_struct support for the RiscPC and Footbridge platforms:
>  https://lore.kernel.org/linux-arm-kernel/2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com/
> 
> None of the board types QEMU supports need param_struct support;
> mark this option as deprecated.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/about/deprecated.rst | 13 +++++++++++++
>  system/vl.c               |  1 +
>  2 files changed, 14 insertions(+)

I think it is reasonable to remove this extreme special case given
the history around it

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 29de49351d1..a4c7d642236 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -68,6 +68,19 @@ configurations (e.g. -smp drawers=1,books=1,clusters=1 for x86 PC machine) is
>  marked deprecated since 9.0, users have to ensure that all the topology members
>  described with -smp are supported by the target machine.
>  
> +``-old-param`` option for booting Arm kernels via param_struct (since 10.0)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +The ``-old-param`` command line option is specific to Arm targets:
> +it is used when directly booting a guest kernel to pass it the
> +command line and other information via the old ``param_struct`` ABI,
> +rather than the newer ATAGS or DTB mechanisms. This option was only
> +ever needed to support ancient kernels on some old board types
> +like the ``akita`` or ``terrier``; it has been deprecated in the
> +kernel since 2001. None of the board types QEMU supports need
> +``param_struct`` support, so this option has been deprecated and will
> +be removed in a future QEMU version.
> +
>  User-mode emulator command line arguments
>  -----------------------------------------
>  
> diff --git a/system/vl.c b/system/vl.c
> index c5678267182..32ee1ce7041 100644
> --- a/system/vl.c
> +++ b/system/vl.c
> @@ -3438,6 +3438,7 @@ void qemu_init(int argc, char **argv)
>                  nb_prom_envs++;
>                  break;
>              case QEMU_OPTION_old_param:
> +                warn_report("-old-param is deprecated");
>                  old_param = 1;
>                  break;
>              case QEMU_OPTION_rtc:
> -- 
> 2.34.1
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

