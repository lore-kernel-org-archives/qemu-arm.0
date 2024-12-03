Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3551802njk;
        Tue, 3 Dec 2024 01:42:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU373beMFggkDM8olslnSMAHpIRB+z92zR0zpMsm5HaiJsFtFX5ueiVeY/eUMDaDnnwFMCSEBdBQgi5tA==@linaro.org
X-Google-Smtp-Source: AGHT+IGAb9TUbQQ9O2lPHiBxFCVhKzZ9KOLKZlcQeT0JgI7fecusXmm5D1st9v/jfLAqUWLhK/Ox
X-Received: by 2002:a05:622a:20f:b0:458:3884:9aef with SMTP id d75a77b69052e-4670c0bcbe8mr31091151cf.27.1733218961476;
        Tue, 03 Dec 2024 01:42:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733218961; cv=none;
        d=google.com; s=arc-20240605;
        b=P5cgfzaE4gNqVL7bzVlipUKY9PU3xoI7dM3q2OKM+S9o0y6ainXfcufwNL+mEx0r0d
         3dmtBb5UdS3sEsO/LcIl1TyO9FldFeJs2lbVm6tjELryz2PWlQLMoH5iB2wrxL7/Wt7R
         JOz7iNIQc401/XoSg7IQVwB856Eq+TcFLw9TO+Eolpa0Kc2FI3QwBAsZt1KYwMpsBwZX
         tnaxi0/JmbLm3lOiAlOaRiSHrcvYzQwMdKEfmIRlZ5kZvzsk5L8zXZTOp9jUZHFEw0rC
         br/5lL8PlQ2nudhhYdD5RxlQPWhwmHtav23PKxcRchHFR3h/rAEkNfx4BZErA/9Pf7Gs
         PAMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=FdOP4qqzg77tZ2HjGa/4x5tiYEmReqUm0KhFF1X4Y1Y=;
        fh=/qEdLwlIXb0q9N9NEMDYid9sN9rzPUN7vHyC6Fvo46U=;
        b=i9Enn1hJ6GBe0VZeb3vajEAnu9gZYQNTNEbH+4sO8Tank+bXLF42gV7oOMDoCZOtA2
         7E/P5H4CfHeXmH4/JCjpF0t5xJNdy/kKk/3Fwey5+hDRbWOaF2xx/wuA8Ih1pLpjc4af
         XqTBCvG508FaehMQh3gMC6kLHFDRn1stW6ntYolQqeeRa+A1ynymQoGmMZMCrbXmvTHl
         mZtBjYM/95ynYuzDp51pVszg0hPOYe0ho+BWeVi+G0pM7IYH+gDmWvEJAQvFc9O9tera
         CB9z8vr0BlI3v2U/9dWXWvGn1zKQlWmiXDlU1AA7ehVDoNfYRzCGi9CsEHsD3SUtuOTl
         jXIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ftPuQnoQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c4109be5si133152101cf.271.2024.12.03.01.42.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 01:42:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ftPuQnoQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIPQH-0001gg-Hu; Tue, 03 Dec 2024 04:42:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tIPQG-0001gP-Rv
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 04:42:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tIPQF-00051f-7l
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 04:42:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733218941;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FdOP4qqzg77tZ2HjGa/4x5tiYEmReqUm0KhFF1X4Y1Y=;
 b=ftPuQnoQLTe8DIBLxbRawKIlnsf2/p9aJOxyVfFWzqWo3ZjB1wzdDe+nLaqSP716znjYcD
 0aML+ceIv+1OM8Hb+wozlCdhfvpYFbDu046CW+6y8Bo8ju6KB8K+8wIx28hVDlKbFD8J51
 DgWH3VWJOJPgYAI27rkkSAiR++GABsk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-615-u3we_1XyN_2_r62U9GpjIQ-1; Tue,
 03 Dec 2024 04:42:20 -0500
X-MC-Unique: u3we_1XyN_2_r62U9GpjIQ-1
X-Mimecast-MFC-AGG-ID: u3we_1XyN_2_r62U9GpjIQ
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EE12F1954220; Tue,  3 Dec 2024 09:42:17 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.37])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CFF6719560A3; Tue,  3 Dec 2024 09:42:13 +0000 (UTC)
Date: Tue, 3 Dec 2024 09:42:09 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 5/7] accel/tcg: Remove mentions of legacy '-machine
 foo,accel=bar'
Message-ID: <Z07ScV2K3NsAgyyY@redhat.com>
References: <20241203092153.60590-1-philmd@linaro.org>
 <20241203092153.60590-6-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241203092153.60590-6-philmd@linaro.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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
X-TUID: 1Q/yETjQXEdY

On Tue, Dec 03, 2024 at 10:21:51AM +0100, Philippe Mathieu-Daudé wrote:
> Since commit 6f6e1698a68 ("vl: configure accelerators from -accel
> options") we prefer the '-accel bar' command line option.
> 
> Update the documentation when TCG is referred to.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  docs/about/removed-features.rst | 2 +-
>  linux-user/s390x/target_proc.h  | 2 +-
>  accel/tcg/monitor.c             | 4 ++--
>  system/vl.c                     | 2 +-
>  tests/qtest/qmp-cmd-test.c      | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)

> diff --git a/system/vl.c b/system/vl.c
> index 54998fdbc7e..c056fcb740c 100644
> --- a/system/vl.c
> +++ b/system/vl.c
> @@ -2385,7 +2385,7 @@ static void configure_accelerators(const char *progname)
>          for (tmp = accel_list; *tmp; tmp++) {
>              /*
>               * Filter invalid accelerators here, to prevent obscenities
> -             * such as "-machine accel=tcg,,thread=single".
> +             * such as "-accel tcg,,thread=single".
>               */

I'm not sure I understand what the old message was trying to archive, but
at the same time I'm even less convinced it makes sense to change the
comment.

>              if (accel_find(*tmp)) {
>                  qemu_opts_parse_noisily(qemu_find_opts("accel"), *tmp, true);

For all of the patch, except for that chunk above:

  Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

