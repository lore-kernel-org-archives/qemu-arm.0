Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp619682njb;
        Thu, 8 May 2025 11:25:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVX/0maceMiYU7XppPAD/c286Yjy4knV6S4Es9YzhM8O2+Pc+2HRxHr/mF2fjVT6JTGOdST0FneT8rdkQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEesoQNCdlBY2dxQJAG1lenN9xMaKRwPVjKciVtwzESGePyyzX4NJctaAjz/WEyFeAWHPBG
X-Received: by 2002:ac8:5884:0:b0:48f:5a18:1b71 with SMTP id d75a77b69052e-4945275a7c1mr6459081cf.31.1746728745755;
        Thu, 08 May 2025 11:25:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746728745; cv=none;
        d=google.com; s=arc-20240605;
        b=ix4FRonLK50/Oe43BjxpPhpYtN5xfIsAUH5tiWpzChBmbLaL0jVzWwOBXsn2bYgQ+f
         Fmd60ZsGpAMbfMnBKuJWGs+EPJgWLR5Lt9yefCvMONJ24oli5QLEd63V2+EHWiWb7Pis
         hULHccGhjjKBFZQauafSXC6j/DHHQCExO88JlHjV8FkpGoK4fb8ZzqoVnTK3fiLQr955
         rpqsiUDz9kV8VR8X+0RQKfTGR6qUc8Qd6u4nuGTeJaVkRAw/rRH9DH+jyZ5a+z9/vLVm
         UG9mFRZZP1e7q/OC/5NdWTp/DGhl2dSVXSqEhEafu2bQdOqEaj/1YHRYeHbaxo6WU+pm
         hlZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=3jDVNUFhrLatpOLTuzcgY8N5pBHDYVTTXdk+ef3GQxs=;
        fh=ajQYQfqozG9mYw4+PIUYX2P67hNVS+kIpTtOmtNvuWw=;
        b=NQMfPVsZ5zMEqU6Q699oOMOkKcq1rZp8EQ81Do2SMzR/be+xQkwb3ylUOyU3f2Mt2H
         4pj1KkYPGnj0p7c7KzZ5aAT4lykcdKDF8MenzgVJFI4jVA0WTTDMPBr/ijHbGDhJQKwk
         2Miql7zOmS5EA3jh6uC2wlEEGjakc0c+AKm1tF41yoyN0iVftuskq7HHX48Dra6li+3k
         Kec755fYsvszBwSLJudqKtUM1AhIC5E12Z20XGCPj8U7NcHoPaq2nhZnKU77FVhBfOCH
         t5adXfaxhyIkta2ydyI0C6ft5xMz8P69RuFq/zN2Kk3IplK3/GGFd/B5Y43csRSoVj5a
         WFVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BEhvPth5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4945259b8b6si2121341cf.524.2025.05.08.11.25.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 11:25:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BEhvPth5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uD5w1-0006r2-Ew; Thu, 08 May 2025 14:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1uD5vl-0006bU-T2
 for qemu-arm@nongnu.org; Thu, 08 May 2025 14:25:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1uD5vk-0006dA-3u
 for qemu-arm@nongnu.org; Thu, 08 May 2025 14:25:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746728711;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3jDVNUFhrLatpOLTuzcgY8N5pBHDYVTTXdk+ef3GQxs=;
 b=BEhvPth55F3U2Ww67s2vl8qxn9cbQ6f7v9vG/+M/pBHlH7UwK42LKeuVheyPcUKBElkuih
 jfK3pmsO6nCAfdf3FmNuZnZ7lbGV4Ev9dp/hFRPslGo6Z5Ll8hAB2DDsWOysIA1VeNc3r2
 qyFVjr51Jw1+iSI1hzdlN+5C7dDnbwI=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-320-pXoq9xzBOS21H-1Jeh_qGQ-1; Thu,
 08 May 2025 14:25:07 -0400
X-MC-Unique: pXoq9xzBOS21H-1Jeh_qGQ-1
X-Mimecast-MFC-AGG-ID: pXoq9xzBOS21H-1Jeh_qGQ_1746728706
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 62CD81956095; Thu,  8 May 2025 18:25:06 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.138])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2FDAA19560AD; Thu,  8 May 2025 18:25:02 +0000 (UTC)
Date: Thu, 8 May 2025 19:24:59 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Brad Smith <brad@comstyle.com>, qemu-devel@nongnu.org,
 Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 2/5] hw/display/bcm2835_fb: Move inclusion of console.h
 to the .c file
Message-ID: <aBz2--84VeQceAGi@redhat.com>
References: <20250508144120.163009-1-thuth@redhat.com>
 <20250508144120.163009-3-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508144120.163009-3-thuth@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.416,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: VSCKctuJaHzA

On Thu, May 08, 2025 at 04:41:17PM +0200, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> The definitions from console.h are not needed in the bcm2835_fb.h
> header file yet, so let's move it to the place that really needs
> its definitions, i.e. into the bcm2835_fb.c file.
> This way the header can also be used by code that is not compiled
> with the CFLAGS that are required for pixman or OpenGL (in case
> their headers do not reside under /usr/include).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  include/hw/display/bcm2835_fb.h | 1 -
>  hw/display/bcm2835_fb.c         | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)

It references the QemuConsole type, but we get that from typedefs.h
not console.h so

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

