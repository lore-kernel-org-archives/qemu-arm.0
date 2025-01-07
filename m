Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp245165njb;
        Tue, 7 Jan 2025 07:42:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXyVG3ZH+2RyKUWiE5RCTEQZbXaDWBY0LacJTnFW0L9Vzcq38GvN+5iDmJMZagkcEZdHgVViDzwddo6dA==@linaro.org
X-Google-Smtp-Source: AGHT+IHtDGLGY3Qhjx+9s6lk+JfA4waA7NUgve+zVLMzZGHVq62D123Y2hWOaInSZSL+NAuSw8kg
X-Received: by 2002:a05:620a:2991:b0:7b6:cb66:ad74 with SMTP id af79cd13be357-7b9ba7389ddmr9721401385a.18.1736264525132;
        Tue, 07 Jan 2025 07:42:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736264525; cv=none;
        d=google.com; s=arc-20240605;
        b=KLNEHvVLCrLb+EjvOB2eC/ZLcCsgQUd+v+dyYlacPHUAC7gkKIAxnPGEqQBkognW+a
         bX8HUcc5YfBxoL6QSleSc2cHLrxecgo8BlKGJMdih3jiuDetIz8l/ixQSGaQxijsDtgd
         laiXPGfIzc7FngqGaNcOXDkuhPIBMAs9+euzGsT4d65adhda5hy3FN1oTzAoV0db9o7V
         Wm4HtMV1ihoiPAmwYq96dMOVmUkPfXXyVPNV7t0KsS4+Q8h63B7va47/XHkABmnE+gym
         h50mb34mjLbGnm9cu2p5gFBZcKpURbTbHJoOHPafCUOyiFSF7zZFEv1bG2q1qnvBZzYV
         iaaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=y6YahR9G880D2brKMEUhlScNmZ57pYw/CPLwilYgtqI=;
        fh=BfvZw/9bpnLZf0cfXo0FxrIEf6q66Di7cCv6MgwgcfU=;
        b=ZKwlos4bljUGZx2lbm1RUMXbAa+PA3rP+NCJ/senZEabC/ENRub8lpu0wdCUIPBy17
         tiCW3YedBvpUMSzwSrtBSIl+aWXaM9XdYlKRgICe7+4CxLn8+E/sRh8y/nX9uNLfyZBg
         WpWE1BaUwgBseLEiyRlU/agb8GSKUdEgKt2ZyybYou4zkgW7JBhyc1i8F3InZKlP+opB
         ukfTMFadrBwBbIt0NmRgtn0n+GSEKkB9KxMNc7sbQKu/Z3V7NZ94ImwlNIi/DQvnmGkC
         9jZ+Xb8vzbpRBnUMq6s39orv7Ujfx5zZnUyoF6mls3xxrNHWLRmvnyChSbuTFrjcZXwc
         pRbw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QLjJlbUD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dd18356d36si487951826d6.416.2025.01.07.07.42.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jan 2025 07:42:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QLjJlbUD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tVBiB-0003Re-PG; Tue, 07 Jan 2025 10:41:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tVBi9-0003OV-4B
 for qemu-devel@nongnu.org; Tue, 07 Jan 2025 10:41:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tVBi7-00067t-8i
 for qemu-devel@nongnu.org; Tue, 07 Jan 2025 10:41:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736264498;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=y6YahR9G880D2brKMEUhlScNmZ57pYw/CPLwilYgtqI=;
 b=QLjJlbUD0In8CNr4V/pVZb9/7TMytHpYGP7FmePdvkbHV7IGmigkbLfL28QP+dP3zhg07W
 hJusDEK2RtgVdyKpaLdam7DrvCAdVt5UIDEuo4cLu8vSsUR0OqI/POudydxvnk1d5/LFWO
 /tNxGWepG8gjo5p1H6iJEnoASCNDneQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-86-apKv5tb1NnaToOTSppQkmw-1; Tue,
 07 Jan 2025 10:41:35 -0500
X-MC-Unique: apKv5tb1NnaToOTSppQkmw-1
X-Mimecast-MFC-AGG-ID: apKv5tb1NnaToOTSppQkmw
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CA712195608C; Tue,  7 Jan 2025 15:41:33 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.64])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 142D1195606B; Tue,  7 Jan 2025 15:41:29 +0000 (UTC)
Date: Tue, 7 Jan 2025 15:41:26 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, graf@amazon.com,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Eric Blake <eblake@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v2 00/21] hw/uefi: add uefi variable service
Message-ID: <Z31LJr7nKtDFVCPE@redhat.com>
References: <20250107153353.1144978-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250107153353.1144978-1-kraxel@redhat.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.437,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: ybHzgh//BgA3

On Tue, Jan 07, 2025 at 04:33:27PM +0100, Gerd Hoffmann wrote:
> This patch adds a virtual device to qemu which the uefi firmware can use
> to store variables.  This moves the UEFI variable management from
> privileged guest code (managing vars in pflash) to the host.  Main
> advantage is that the need to have privilege separation in the guest
> goes away.
> 
> On x86 privileged guest code runs in SMM.  It's supported by kvm, but
> not liked much by various stakeholders in cloud space due to the
> complexity SMM emulation brings.
> 
> On arm privileged guest code runs in el3 (aka secure world).  This is
> not supported by kvm, which is unlikely to change anytime soon given
> that even el2 support (nested virt) is being worked on for years and is
> not yet in mainline.
> 
> The design idea is to reuse the request serialization protocol edk2 uses
> for communication between SMM and non-SMM code, so large chunks of the
> edk2 variable driver stack can be used unmodified.  Only the driver
> which traps into SMM mode must be replaced by a driver which talks to
> qemu instead.

In the coconut-svsm project there's a likely need for coconut to
provide a UEFI variable store, since we can't store plain text
variables in host context for confidential VMs.

Am I right in thinking that this design approach could be reused
in coconut context with coconut providing the equivalent backend
service, and EDK2 using the same driver to talk to either QEMU
or Coconut's service  ?


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

