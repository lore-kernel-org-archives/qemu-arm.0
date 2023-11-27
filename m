Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp754379ejt;
        Sun, 26 Nov 2023 20:33:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTUzTZerahAAqFw5YFDQgGxIVkGPYDCGwu65lm2ZV79Mg/uX2bFnhEwz4dmQNENe+/Obe6
X-Received: by 2002:a05:620a:1722:b0:77d:a688:543d with SMTP id az34-20020a05620a172200b0077da688543dmr3677689qkb.48.1701059603120;
        Sun, 26 Nov 2023 20:33:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701059603; cv=none;
        d=google.com; s=arc-20160816;
        b=hTvwV+KcKvPRKriOD3d4YwZEL7LgxR0UTnpfFeS7N8nnXQQknanDKOxJ3miaCBYwFr
         XQKa9Q3fx2alzRxZ0FYpFbt4sIvCkK8p3536NPCLlMZVsTnPlY0O1Teg5uZAi+ZQByFp
         kv1tyXYIfR2OO88HxjV84U+/hr48VnMK+3F0ZMVAgQaDBOxmEn8IZfR1qz4Fdq1C0cxk
         VsYKSAbn3BXsT3x4JCIy2Ns4lCilblM61hSqjeU91iF8FQ0VeatcgipvZSRe7iWEw8c+
         +M9fw64+peJZEIqY7ITD6M2mVE+ZXY2SCBtOj7qW36StZ1X0Dt9gtAyCOZJU0CguEaqM
         lY0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=oHPnN7jOaxBckPN1TMsb7lbSpEfJL8WREqjjpAz2omM=;
        fh=YIs6fi4xux502Hus2tOT+Pch2Mum+BNamOXX0MbPDX4=;
        b=Ro1D2BnQ6/Gnq34ogDFwMfLCqOYJC/mbf8kbMo39kNsi0N7kyDIOll5Ist6LLRIGNS
         YMLxXnEg48OXeLVercaHXBkboa8IUwwlqKmyiVomCUr8RprLVqOqTnIhx9rR65164lmF
         Oz9vY3gOnNSQzw7XGdZPtXLa0jGO374ReitCJlnyN/PNmeOm74LMSkgWIoE3mEvbpOug
         lBqpeljksl8JOin4aoTGjgkrA+Os0xXwTEvU2BV0mkShcwNRQmkh1YQzLfwLL4FWZLn4
         drmP1HZV5RIKQTxj04Yn0z3KsmdKaI2B/Mkc9QKV+n6HVh+HQXrwlRHKSfUwWHRDLStK
         z7Lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MCaUDmX5;
       spf=pass (google.com: domain of kvm+bounces-2481-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-2481-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-2481-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id z32-20020a05620a262000b0077d7b24220esi7229471qko.670.2023.11.26.20.33.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 20:33:23 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-2481-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MCaUDmX5;
       spf=pass (google.com: domain of kvm+bounces-2481-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-2481-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A95501C208DF
	for <alex.bennee@linaro.org>; Mon, 27 Nov 2023 04:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C013DD28F;
	Mon, 27 Nov 2023 04:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MCaUDmX5"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 553CC111
	for <kvm@vger.kernel.org>; Sun, 26 Nov 2023 20:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701059598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oHPnN7jOaxBckPN1TMsb7lbSpEfJL8WREqjjpAz2omM=;
	b=MCaUDmX58HU3cIzhxa5tcOmrcw9fLNs4VOEXt609aFavJgIjwgfXKZH8qKhPHMT+cCzQ4q
	sTPHmQa6cMnCjzRq6Bg7jkHbZJ8y09Iy5Z4w1RixmwufvUMqBnr03miuOvZUnnTqOvt5aB
	gAjmuOI7etI4t3etjQLuwY+UJwyt0po=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-toW7RtvcMHC2nY29dcJtmA-1; Sun, 26 Nov 2023 23:33:17 -0500
X-MC-Unique: toW7RtvcMHC2nY29dcJtmA-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-5cf4696e202so18542347b3.2
        for <kvm@vger.kernel.org>; Sun, 26 Nov 2023 20:33:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701059596; x=1701664396;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oHPnN7jOaxBckPN1TMsb7lbSpEfJL8WREqjjpAz2omM=;
        b=JVCqZ5WYM1cNkpByZyXx0KnAxtaEH7qPAju1vp4qpeX+0nRVVY11CrVHwhis+i2Fta
         mA0Nv7xUZjMLmy/D8rTIkOp5hjHUePx1wXlf8trlq79US7gigxTcMuKwRDkEUuGp5KRk
         wb+YrFrlN3wuQamsshmQM/oih3lOuUUcAHgbHX8n4PRGChxaNtQyEczeXBo+3uGpcVVb
         U7oJ1KeXyjV0nX1MQHmPEnEFh9oDsvUsnFiOZ6GDEqgXeuDVp0EhZvdB8nlOQyn5gl8O
         tw7bmSZcFViWyLK56OBGwouih1q6nwuCEE6QPgyRaURmWiu9srXtJH9vXfchIB7H0Wl+
         QGdA==
X-Gm-Message-State: AOJu0Yz45Vir/z6LXEMxbd9uwGNTiTs2g2DYmEUOJL8/z2dmUdKu8tYo
	SWZGhwAf+anFpBWKxtSm9KM2kh3RQxya0e+t7vsC4W6ABl7hyEoYRFT4LBT/2MrMTmITC+sfbHS
	xt9Ex+m33iSd9HmOF+678
X-Received: by 2002:a05:690c:886:b0:5cf:2d42:a61a with SMTP id cd6-20020a05690c088600b005cf2d42a61amr5226722ywb.29.1701059596629;
        Sun, 26 Nov 2023 20:33:16 -0800 (PST)
X-Received: by 2002:a05:690c:886:b0:5cf:2d42:a61a with SMTP id cd6-20020a05690c088600b005cf2d42a61amr5226712ywb.29.1701059596383;
        Sun, 26 Nov 2023 20:33:16 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
        by smtp.gmail.com with ESMTPSA id s13-20020a62e70d000000b006cb8e394574sm6373833pfh.21.2023.11.26.20.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Nov 2023 20:33:16 -0800 (PST)
Message-ID: <6d71859f-e519-4afa-881a-f1db8ec8ca90@redhat.com>
Date: Mon, 27 Nov 2023 15:33:13 +1100
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 14/16] target/arm/kvm: Have
 kvm_arm_handle_dabt_nisv take a ARMCPU argument
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20231123183518.64569-1-philmd@linaro.org>
 <20231123183518.64569-15-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231123183518.64569-15-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 8XjzEi/tzGGA

On 11/24/23 05:35, Philippe Mathieu-Daudé wrote:
> Unify the "kvm_arm.h" API: All functions related to ARM vCPUs
> take a ARMCPU* argument. Use the CPU() QOM cast macro When
> calling the generic vCPU API from "sysemu/kvm.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/kvm.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

