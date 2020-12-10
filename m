Received: by 2002:a0c:db0e:0:0:0:0:0 with SMTP id d14csp1075086qvk;
        Thu, 10 Dec 2020 05:51:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxnVUQxP46VpoOfOCCo4FKtVtZrdTVfT+8/cjn4jYQIO3IcAtxjOR37G2ADE6/8SBVpMJvI
X-Received: by 2002:a92:d11:: with SMTP id 17mr9322264iln.84.1607608271979;
        Thu, 10 Dec 2020 05:51:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607608271; cv=none;
        d=google.com; s=arc-20160816;
        b=hwFN1u5hAL1W0LgW915psDWqdpmugPjUr6CTlklFLtYRZ4NYyRm1koOBj7DRlFnPyj
         G2LZHTP7MFVVLZL/w8Xo8KWFA75C/gwBE/UTLgU3L54o1bDmkQh0gnQAeLeuvtNK4OeD
         1dXdMy6hZfFrh+iLMPxifH68XAacfh9UnfFeVFgUsVZfsu0iqa8uQbJim5CZn2EKl5o8
         yqz/CaYESq6LZ/v6dr3bxsnTaHXtclKlGQOcT6fbLbL5OaH5XedEbU4P5WJBss+QSsp6
         Ksr4eMftRrkyrXl7RarjI4G4az36lranK3HYI9MHc6R7yXFHY0D2rmhd4EINIvo1vpx3
         cJjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:sender:precedence
         :errors-to:list-subscribe:list-help:list-post:list-unsubscribe
         :list-id;
        bh=Rg+dFk1r7xme4f47B/YxXkkc3kBVbh72BAEdLMuhlFg=;
        b=eEjQgR7XkPbdG30/Oh6pH4pg763YgUtLzenoeMNfZl2LLW8KWy0D5QcUL6lcpR48IY
         utsxrMrHqWXc0wYr9bDVZKyPeSlTVp2wPG4XMO5H1CnOQJC5ZFuDeSwKEATuXYDou16r
         puG1OZgf7ezjCcPIfKI0xxrvQv+ZZjfFSc/2gL/BMfLMfrf5KQl3TNL9Eu4FRHau52xm
         1L3Fm8ikKyLtBcbIWUjoMtELBIWlb76cvx5jSLeTP32W78c3+/ch5iyle018HGtUWCV1
         Z3EJ0Kn4X9tqtj1tpSCVtxHUX4nX9wtDI1yF+RvdvRp0TSG5ARPk7eA4eQOOK+/WE+6k
         eciw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MyCLFZ5m;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id u126si4043116ilc.142.2020.12.10.05.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 05:51:11 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MyCLFZ5m;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from list by lists.xenproject.org with outflank-mailman.49272.87139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMKd-0007kf-NH; Thu, 10 Dec 2020 13:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49272.87139; Thu, 10 Dec 2020 13:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMKd-0007kW-IQ; Thu, 10 Dec 2020 13:50:07 +0000
Received: by outflank-mailman (input) for mailman id 49272;
 Thu, 10 Dec 2020 13:50:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nlUt=FO=redhat.com=marcandre.lureau@srs-us1.protection.inumbo.net>)
 id 1knMKc-0007eY-8u
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 13:50:06 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f74f169f-0d51-4107-a1f7-730d4fb9165f;
 Thu, 10 Dec 2020 13:50:05 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-Qm-VJHcVP8OwZ_U7FJZpnQ-1; Thu, 10 Dec 2020 08:50:03 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45D0D190A7A3;
 Thu, 10 Dec 2020 13:50:01 +0000 (UTC)
Received: from localhost (unknown [10.36.110.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FED810016F6;
 Thu, 10 Dec 2020 13:49:59 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: f74f169f-0d51-4107-a1f7-730d4fb9165f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607608205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rg+dFk1r7xme4f47B/YxXkkc3kBVbh72BAEdLMuhlFg=;
	b=MyCLFZ5mPV16BHIKGjZi16KUjk9GOcHOpogD2KHLOjkFManAxW7WQ5BwdvmQuzc5FrB42/
	yHV+2xeHKlqe1i5KuZitXIJL8i3LVpaRVd+5tUWU3+WorA3Mwi93TSDek9/190kYgVISdH
	wrdhJsAszpoIB28AkUJ4crTGSWtxFJ4=
X-MC-Unique: Qm-VJHcVP8OwZ_U7FJZpnQ-1
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: philmd@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 08/13] audio: remove GNUC & MSVC check
Date: Thu, 10 Dec 2020 17:47:47 +0400
Message-Id: <20201210134752.780923-9-marcandre.lureau@redhat.com>
In-Reply-To: <20201210134752.780923-1-marcandre.lureau@redhat.com>
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: NB6zsizPnW2h

From: Marc-André Lureau <marcandre.lureau@redhat.com>

QEMU requires either GCC or Clang, which both advertize __GNUC__.
Drop MSVC fallback path.

Note: I intentionally left further cleanups for a later work.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 audio/audio.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 46578e4a58..d7a00294de 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -122,13 +122,7 @@ int audio_bug (const char *funcname, int cond)
 
 #if defined AUDIO_BREAKPOINT_ON_BUG
 #  if defined HOST_I386
-#    if defined __GNUC__
-        __asm__ ("int3");
-#    elif defined _MSC_VER
-        _asm _emit 0xcc;
-#    else
-        abort ();
-#    endif
+      __asm__ ("int3");
 #  else
         abort ();
 #  endif
-- 
2.29.0

