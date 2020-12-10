Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5951578lfb;
        Thu, 10 Dec 2020 06:29:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOakQ4fWzZazWhEXKg3J3dL2iKAF86KBEs7eNukXGBqY5ji8GPq5fYKUouxH/iCfng1/uP
X-Received: by 2002:a02:b607:: with SMTP id h7mr9094938jam.120.1607610558840;
        Thu, 10 Dec 2020 06:29:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607610558; cv=none;
        d=google.com; s=arc-20160816;
        b=nzdbKxQes6g1HFYQ0EfZq039eGB3373rkkz2XaE8KwgTLWVaVnGXzc0wZXe6DBgEhm
         K8DGPwdJ8waO+i4rjz3i4AEM7u8MviBAyeZy5ZwXqtjSGP7Y3B011vSF/Jmhy2yPZVbm
         SfpVHHXT0iosGmnO1V70BnU8qeU+09luamuuNJbXIe0IhBBxSYLLX9ehsk8F4C56lviE
         kcBaKHA5w4VLEd/EamBDMopNC00j1Z7Vbwf9zyx6smmpvYQ9FMSnWsHGK9+84a08yIED
         +HKdclxCnCZnPtPHao1B8URPBMLw1WxZA8jFfBWyMJ8LOjcqnEPtCU+uWbmoGz/SCFQE
         5Bcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:sender:precedence:errors-to:list-subscribe:list-help
         :list-post:list-unsubscribe:list-id;
        bh=H6gmFIInvImD2kayUKLyvQaKlpV11gJ7jcME2e0PUB8=;
        b=SVFNWmze7QonEypFYXOlvqt3+QFtYbqIFOoEBkiJfu1gzNFtCgq7VkL0KVz+7oURji
         cEg5lxjW5vvujNG3ytUmpBvUl0pzJu85zHvkQW239Nz9AIRhX2avaWjA9PLnXEvDihju
         rvLefEV0kJYugUwBOiWyvIXaAZk7PkCsFDBdqUDRKYm4amVSLYrnRiWfrKbNNj/rCYyg
         kwzghxTQBVMScAC0ugL3lz2Odty3EphM1Qdw/nZNG87s2T2u+XaLROsnIynLUEG0t+2A
         olGaD1fIPBoavjLEBc9ZVk2JvVAoHq3PZHK3t0MR5BCVavSRMFp/RGXXUKbzcBL3jAIe
         BlyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hz+/Z64f";
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id f12si1779328ilu.115.2020.12.10.06.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 06:29:18 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hz+/Z64f";
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from list by lists.xenproject.org with outflank-mailman.49349.87274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMvK-0003vp-Ms; Thu, 10 Dec 2020 14:28:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49349.87274; Thu, 10 Dec 2020 14:28:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMvK-0003vh-Jj; Thu, 10 Dec 2020 14:28:02 +0000
Received: by outflank-mailman (input) for mailman id 49349;
 Thu, 10 Dec 2020 14:28:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Anpp=FO=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1knMvJ-0003vR-BN
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 14:28:01 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ef049fca-65dd-42a5-a523-94518638f57f;
 Thu, 10 Dec 2020 14:28:00 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-wJxBrpx2Nc-d0yrBhGMlXA-1; Thu, 10 Dec 2020 09:27:58 -0500
Received: by mail-wr1-f72.google.com with SMTP id g16so698110wrv.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Dec 2020 06:27:58 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id c81sm10499615wmd.6.2020.12.10.06.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 06:27:56 -0800 (PST)
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
X-Inumbo-ID: ef049fca-65dd-42a5-a523-94518638f57f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607610480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H6gmFIInvImD2kayUKLyvQaKlpV11gJ7jcME2e0PUB8=;
	b=hz+/Z64fpHPN+Lnbx9W3iPDGU+MQHJdxRQ+oo26mGExJuL/FV7HqjQK8gTqJUlYTw1G8VN
	U5FRUoxmxLwt39oxykDtFwT7nTw/OxEo+EUlHK4UZm68aMSpjsas7IxCn97hYFWsxS5CA4
	BeB0Oz5RslNAcdEEqta+amALbfGQiRU=
X-MC-Unique: wJxBrpx2Nc-d0yrBhGMlXA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H6gmFIInvImD2kayUKLyvQaKlpV11gJ7jcME2e0PUB8=;
        b=bQqGV0iEbq1GB6QPlntRuZs8t6NrPEWfpkM/KNGeDMNblv8zmvvZC97zw2B7mpfIWz
         okAI7dPKyFObTaj0S1cQ0EKUNQTJlfnh2ID1+BVrNdlxjck2P9597fGfrVtKKdoFpj9G
         T2u4NM+WQSMOtvd+j+sos8Wbe/oVTmMrImZizfWbn5DhD4mZ9ev9Vr9VUv6yi+1WPuA7
         ljQy2S+tPwQQr/O0rfMX3rYE0JB725QHY8L69C0tcMCdQG2RHFjQY37/x0E2/4jgpwfi
         RcUr6IUBgHjJ85K+wkfRWP4nq/dgtcF8m/W1+CXULJIMv1O11GoH9pl093GT57eLESh9
         FAVg==
X-Gm-Message-State: AOAM533qZuioLz0gO9WqN66Ju6pDgPJdu7R0gyQ2wG8UJScj2A88zrpC
	Jbcm8VD0yNbTtUtZXsa06Hgv/a3em28TC19RevVXcJQPfQPQFaZoGU+T1Rhp10DY84Tw7lxNHkJ
	q1gP/Pa/x+hWGMXyCOtMPj9K/qZU=
X-Received: by 2002:a5d:6045:: with SMTP id j5mr1454233wrt.223.1607610477558;
        Thu, 10 Dec 2020 06:27:57 -0800 (PST)
X-Received: by 2002:a5d:6045:: with SMTP id j5mr1454216wrt.223.1607610477406;
        Thu, 10 Dec 2020 06:27:57 -0800 (PST)
Subject: Re: [PATCH v3 12/13] linux-user: remove GNUC check
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-13-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b87fb20f-5b0e-2995-fe03-968391d3dce9@redhat.com>
Date: Thu, 10 Dec 2020 15:27:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201210134752.780923-13-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: EyBLRzZLL1SQ

On 12/10/20 2:47 PM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> QEMU requires Clang or GCC, that define and support __GNUC__ extensions.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  linux-user/strace.c | 4 ----
>  1 file changed, 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

