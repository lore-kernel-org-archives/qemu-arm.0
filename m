Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2010679njb;
        Mon, 10 Feb 2025 07:20:45 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWjmT2WdMaqOR3fStZM0Sg0j7Hmdz+24m/oEOPijsYAihu1Ud3eiAq70VnGaoct9jdGeZmFBeRpInI74Q==@linaro.org
X-Google-Smtp-Source: AGHT+IF2puW639Qlc5SdLRTsoLfe4lx2wHgue5rJdVE9N69D0gZ3xMcN2ip4qdmTx9BVig/mtBJD
X-Received: by 2002:a05:6102:8082:b0:4b2:5ecf:d124 with SMTP id ada2fe7eead31-4ba85e4b9d2mr9455962137.14.1739200845421;
        Mon, 10 Feb 2025 07:20:45 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1739200845; cv=pass;
        d=google.com; s=arc-20240605;
        b=UPiZQE3ouBAmHGgnvb3wkuGDhXo3sit9BUWKOGZWWlA/K7ASQdfZXYOzRjVn3amzIE
         0x1gEMT1xC0wgNGk6LI4e6+luCGORYJK06bthkXBL+Vu+aLZIDuLQ5NIiXTnpnagd66U
         YhOca8yId5PsivG/ayNHup+czdmiJ83BO2iJJmYmJ6yEMHIpbajh5JoaAe03QgeApRw0
         w5stPWIJu28+iR16ltcDB08/uXHiobFd2y9ZSpnk6xIr7HoLwUScrjaS+mvmf/8K43V8
         mOJ9OInzTOrdlRltk/qNbYiGavNolAG8reU1bHiTh4YZrG98sez5hjSSBnwcBXtjo/BJ
         ZzIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :message-id:date:user-agent:references:organization:in-reply-to
         :subject:to:from:dkim-signature;
        bh=l+1vKWq8tav0v5vOrEs4bMdzd3ftwt2N0noMcIDxK+A=;
        fh=IhIF/oSww6zpX9UNFwS/PhZR+m2PBKW7LmeGATUQyj8=;
        b=LNAhpvBfhwCtCNDuXyn3h8GMuE98BUN57nyLhJ/tDT+sMThmTnw1/lvVv3lEx2tis2
         q7nUewE6fejyJybPzkXIPEMreXmQlePmumT6HuvKg0JRpmladsGnqjOHC9BY7NDf9GNx
         BzErz692CVWjp27Iu0ID4OA4bO7Qnf2D09lL0G6rCGZvaTdVe35xK9gSGiYcffnJ3+w/
         gjXHWCiaFnNkz2K7vwe7qFnv6tzC4469Pd3u3EO6vHoVYIv/rE+WYt4gydWgDXBqohiU
         JxUX968P490qyf9IF0O2PcjPC5YK47Jqgr4Xq6hlmeEIyivk+ogAbwcBGvIQQ22Rfgcq
         Er5A==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EQiTcuHC;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvmarm+bounces-19065-alex.bennee=linaro.org@lists.linux.dev designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvmarm+bounces-19065-alex.bennee=linaro.org@lists.linux.dev";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm+bounces-19065-alex.bennee=linaro.org@lists.linux.dev>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id ada2fe7eead31-4bbc6512a6bsi515006137.134.2025.02.10.07.20.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:20:45 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm+bounces-19065-alex.bennee=linaro.org@lists.linux.dev designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EQiTcuHC;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvmarm+bounces-19065-alex.bennee=linaro.org@lists.linux.dev designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvmarm+bounces-19065-alex.bennee=linaro.org@lists.linux.dev";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F4AF16286D
	for <alex.bennee@linaro.org>; Mon, 10 Feb 2025 15:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1782528E1;
	Mon, 10 Feb 2025 15:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EQiTcuHC"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3414935972
	for <kvmarm@lists.linux.dev>; Mon, 10 Feb 2025 15:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739200842; cv=none; b=j5xU6bLgpH2cvz+tN1ee3iddx01rzwuZPxaGfZ4Ny/ry1/BMa7akCG+hbwj90itxIIV0XhwOQx/gG/dQ1tcs71SKoVq9lesJxnavhjYXYOD3LeToPyNg35xjFgU9jtchmd6crOwX44zZb0KiZp90EkB4sMknIdaHnxIY6JqLM1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739200842; c=relaxed/simple;
	bh=L5OT+59C3iT4MQ/lC2n03E8ed7rGkqDhCwJBIDscTR8=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bn5VFj8ORB4BfnVY5vUceDEwLOQ75X87efpoSttI/Xef3k6UVHgQD5qOiuPDUjQCLeSRz6ED+E4aDfPoOOKph+3KB/1a0YG5YkQ+fzsMlhs1GeUIz7ZEwpNviimTk1Ahx6VNhcnrhJ8ewriGLL7dK0AyezoSQF3lMpHkcRaj3gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EQiTcuHC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739200840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l+1vKWq8tav0v5vOrEs4bMdzd3ftwt2N0noMcIDxK+A=;
	b=EQiTcuHCGLK2iUoaOgNxAp6gav4BRR7x1Tlu8F1KwWKsEyttULskewPpEXhQnUlCgPMkLL
	VZw3zmeHrzpIG964Y1k7fuZ33bXwbl3ej/x2UV3iMFcSz+nuYb67C81CI87Bh7T9HVBgPc
	ll52WZKZCxnDyetkSIw2XJ0jewSkG1A=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-523-dgWwLAmSMn2f19JyAWRGdQ-1; Mon,
 10 Feb 2025 10:20:36 -0500
X-MC-Unique: dgWwLAmSMn2f19JyAWRGdQ-1
X-Mimecast-MFC-AGG-ID: dgWwLAmSMn2f19JyAWRGdQ
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BA59D19560B1;
	Mon, 10 Feb 2025 15:20:31 +0000 (UTC)
Received: from localhost (unknown [10.45.225.231])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F032D30001AB;
	Mon, 10 Feb 2025 15:20:30 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH 15/15] arm/cpu: Add generated files
In-Reply-To: <f5878231-79b8-4e29-bfb0-f9a57ac3f6a4@linaro.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250207110248.1580465-1-cohuck@redhat.com>
 <20250207110248.1580465-16-cohuck@redhat.com>
 <f5878231-79b8-4e29-bfb0-f9a57ac3f6a4@linaro.org>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Mon, 10 Feb 2025 16:20:28 +0100
Message-ID: <874j117rnn.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: kvmarm@lists.linux.dev
List-Id: <kvmarm.lists.linux.dev>
List-Subscribe: <mailto:kvmarm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kvmarm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: 36tjIBxP8kkH

On Fri, Feb 07 2025, Richard Henderson <richard.henderson@linaro.org> wrote:

> On 2/7/25 03:02, Cornelia Huck wrote:
>> And switch to using the generated definitions.
>> 
>> Generated against Linux 6.14-rc1.
>> 
>> Signed-off-by: Cornelia Huck<cohuck@redhat.com>
>> ---
>>   target/arm/cpu-sysreg-properties.c | 716 ++++++++++++++++++++++++++++-
>>   target/arm/cpu-sysregs.h           | 116 +----
>>   target/arm/cpu-sysregs.h.inc       | 164 +++++++
>>   3 files changed, 860 insertions(+), 136 deletions(-)
>>   create mode 100644 target/arm/cpu-sysregs.h.inc
>
> Why are we committing generated files and not generating them at build-time?

We'd either have to carry a copy of Linux' sysregs file, or generate a
build dependency on Linux. I think we should handle this similar to the
Linux headers update, where we do an explicit update and check for
anything unexpected that might have crept in. (Same applies if we switch
to any other external source for register definitions.)

