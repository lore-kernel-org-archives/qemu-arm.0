Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1478235ejc;
        Fri, 13 Oct 2023 05:42:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7Otl97MfKcsMTqtlV35JR1vhjpchOY/RQ/kpERX4IU7WPFKi59092oEAaULao1V/co+xo
X-Received: by 2002:a05:6808:202a:b0:3af:9848:db19 with SMTP id q42-20020a056808202a00b003af9848db19mr34521082oiw.10.1697200975081;
        Fri, 13 Oct 2023 05:42:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697200975; cv=none;
        d=google.com; s=arc-20160816;
        b=OgPEwgXHU5Xd5aoQ786Sx+F8XfH/NRreHyiqdBkcS7Tpm+v5sRxHvXuWaWtMcHbZGP
         it1FaGlS6AiG0gEy7ZzNhSWUXdgn5yVTBQStEuxRiTCAEO7InZ+h/mxivpjV6sBSF+F5
         fXCQ7Wx/pTyXPslUbKj34dvcpX3Qhn51FHYbIhy3QPfyN1nSn0vnFvGBBgExC5asXWCj
         Hb/6zDCpQQV/BetYVH/m3UKabKYSc1SRLMvGrDvW+LfQYDIXpxipEyeyOhihbNRLiu/q
         jzxOxNdL9ooeQcqj0km5p+HAY3jE2b91yd8Jcr4COiQ2VlKv5IIDgnbciaoAbA1KmNK2
         WP1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:cc:to:from
         :dkim-signature;
        bh=mYGKlFKk2qCdI5bNLR4/PeedFlKJXNpjGwbRxMhZf5c=;
        fh=WqFkrZKGvMj0jGEvOALcjVPt/SUTOjrHROxU/nT+zJg=;
        b=OXMJnRkwD18dOn3IZcxad1ySg3CMthRCLlOZzZDAHVmJ5WKfqd/uPQmk/7C7pxw1t3
         +/cj3x03tiGxawpYLaJmCA1osKRQAZhmzJ2fP6a8jeLrC37Rg02JpjjP3HWTjcSfzLzp
         cKI9DZfL07UsW/mT9fgWV7XzTiG4LaZts0UFjNM7h+lhN//7135tXLqp1GHrVvMYQwC4
         mzTA99JNwFNhXnydBvZ2z+bs9UIDZjExktDLU1k19RkLNGMwhL9ssxVAYBZMux4cC2vo
         u07NFCHAPxZxXgRhCsobDbzaoAQ0JRNv90x6XElUiQ5xy2JFcHPTE7ytZUiFlEpXOyIg
         qtUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VqE8dypI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3-20020a05622a180300b00419393d311dsi1132548qtc.218.2023.10.13.05.42.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 05:42:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VqE8dypI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrHUa-0006UF-M8; Fri, 13 Oct 2023 08:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qrHUZ-0006Tm-Cf
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 08:42:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qrHUX-0007HU-Ql
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 08:42:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697200929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mYGKlFKk2qCdI5bNLR4/PeedFlKJXNpjGwbRxMhZf5c=;
 b=VqE8dypIwsgGcZ3uc6n2DEAtyMVpWaH2YxPG05Dyuyyi/3wtcJz8mYzY2qMloXJqYXsZBH
 EWfIG+h/H5LpdoYNaaqmJzqw3sKKK4Y5fmKe8OUzE3JP6CEas/wIo8hmizgUfx0DVM2Y33
 PTTJA3hWOhvJ1KCPttMga32thsiuHxk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347--_VMAzSePjmVqTZRX_4oFg-1; Fri, 13 Oct 2023 08:41:55 -0400
X-MC-Unique: -_VMAzSePjmVqTZRX_4oFg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 829F1185A79C;
 Fri, 13 Oct 2023 12:41:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 607C71C060DF;
 Fri, 13 Oct 2023 12:41:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7068F21E6A21; Fri, 13 Oct 2023 14:41:54 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-block@nongnu.org
Subject: Re: [RFC PATCH 00/78] Strict disable implicit fallthrough
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
Date: Fri, 13 Oct 2023 14:41:54 +0200
In-Reply-To: <cover.1697183081.git.manos.pitsidianakis@linaro.org> (Emmanouil
 Pitsidianakis's message of "Fri, 13 Oct 2023 10:47:04 +0300")
Message-ID: <87o7h2hey5.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8uGJOJKsBtUt

Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org> writes:

> Hello,
>
> This RFC is inspired by the kernel's move to -Wimplicit-fallthrough=3
> back in 2019.[0]
> We take one step (or two) further by increasing it to 5 which rejects
> fall through comments and requires an attribute statement.
>
> [0]:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a035d552a93b
>
> The line differences are not many, but they spread all over different
> subsystems, architectures and devices. An attempt has been made to split
> them in cohesive patches to aid post-RFC review. Part of the RFC is to
> determine whether these patch divisions needs improvement.
>
> Main questions this RFC poses
> =============================
>
> - Is this change desirable and net-positive.

Unwanted fallthrough is an easy mistake to make, and
-Wimplicit-fallthrough=N helps avoid it.  The question is how far up we
need to push N.  Right now we're at N=2.  Has unwanted fallthrough been
a problem?

> - Should the `fallthrough;` pseudo-keyword be defined like in the Linux
>   kernel, or use glib's G_GNUC_FALLTHROUGH, or keep the already existing
>   QEMU_FALLTHROUGH macro.
> - Should fallthrough comments be removed if they do not include extra
>   information.

Valid questions, but they don't need answers until after picking our N.

[...]

