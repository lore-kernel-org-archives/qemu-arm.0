Received: by 2002:a05:7022:1303:b0:97:989a:5032 with SMTP id oz3csp202766dlb;
        Fri, 7 Feb 2025 05:06:48 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXTeDdZpk1ufkNWGz4zAUzRZs1jA9HYVqk2Ft4XBzdrN9RNSTznLPd9VlfhNMc5MF2nh8k9SOBriGbBpg==@linaro.org
X-Google-Smtp-Source: AGHT+IGK0ApGW9XckhQnpc+rPUyFeFAV4FyFwyRyiOFfBG9ZbCciFiq/V5R6GoJ7DMJQa6Os+ZlL
X-Received: by 2002:a05:6402:210e:b0:5dc:58c8:3154 with SMTP id 4fb4d7f45d1cf-5de450800a4mr9543428a12.28.1738933608198;
        Fri, 07 Feb 2025 05:06:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738933608; cv=pass;
        d=google.com; s=arc-20240605;
        b=CHBKGWTmdya4wYpXeJfqg2ghR801yhXib0SfaSt9bNbQ6WDO9n04pSDjTlMEELt1XF
         DV/Az1ns9HnSQFymSdjpm2vwJfz44jvyw+7dFr5ldCEZLmJ+wYg6cSl2eduztzFUy8tH
         j/EZ1gHzzuJWbkeWe3i41NrCWxrAB8NI5PaUNd/bBhEtWyBnK6uwvJn+7UMXHbXeXBZ+
         6/RotT/K4t/YQwozKy7wTGcXgacmhiblwo3Lc2MK49gTwncSKS9zFqXfJCcEVCRc9JEt
         JH/33a2iS7Cxb0kcpEeKxqre/m6szitk5Bz1tVmNQEqsXWHf3iF29h36RJOtf8En05gf
         G8eQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :user-agent:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature;
        bh=+/xEHSqNCYLGzlOdpZkl/FdgOJohjnC5Km7HHdqNE1U=;
        fh=S5IeOFiTJ+MXXJMM0GHSTBD0sQpaaYgEZOvaow94V+8=;
        b=abgdOk5ZOzjuywvzYFnvmF926ebh7t2A1EXa+fYRSm982lTi4saFhtZX1HAHuh1aUX
         7dN/lFQhw7q137DXfzihAmxwSM+UMO44RVptSh0wd4AD0dbfUZWZUjUEOPWbX6+8yNW9
         xYQt/7LisMRI1JnZ287BPA729CfKjgAp+tQxMFGh+mB5vVzSJzcYrZ1aA7lJuCJBrT+D
         5dJefOzMCTmUmi2b30Hxb2lTQ1yGlXG8QpXWOmGY4t7B8PhEPIbmqjAkfpJ9UieL7dZa
         IDF8dfRxrtA4aW+v4YDhYYZtW21TmA4QomORguHmQqWAdb0FoC97x5W6q0IxeNbIQMnP
         hlQw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VuB5lGEA;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-37584-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-37584-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-37584-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5dcf9f7c983si2780200a12.565.2025.02.07.05.06.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 05:06:48 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-37584-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VuB5lGEA;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-37584-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-37584-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42FF4188D2A2
	for <alex.bennee@linaro.org>; Fri,  7 Feb 2025 13:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174B11E22FA;
	Fri,  7 Feb 2025 13:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VuB5lGEA"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD951E1A23
	for <kvm@vger.kernel.org>; Fri,  7 Feb 2025 13:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738933603; cv=none; b=HykfLW/A+q7tjPFiS2o7blQ7ZwSgQnV2NzoJ+0qO6kT4cuplQIMwINqyixblBzuek63fw8NowCRJGpjYMB4Siul782FLsvaVOAhzWWNNLDrn17tb3F5Qoq5/Sw+0rYBHfd3jKP7iC+5PNuW2oCGB3Pp0P2H2TgbcWMWhVnB063M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738933603; c=relaxed/simple;
	bh=wt1SYB5V7DjmUIGircBEISdPspOuP76m0S0oGVJ7nlY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TxAKQS4uMwDKjB4H0u872TRyjdVo79yLS1EGToyO+sHeVQmoCDoYqK5Pg8LRgfN2XL85hr8HL4TVKWJGiQ29M2ivnf7BchlWfTesFsqfZ/2oihkOtqvcMvx/DMDIjtu5GK3tZWzyHmNnflWRKa8Zhiv8F3vTTNvVerwMXWqzFp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VuB5lGEA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738933601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+/xEHSqNCYLGzlOdpZkl/FdgOJohjnC5Km7HHdqNE1U=;
	b=VuB5lGEA0FmmHomVuIrqL23vuCqLPmo76JP4jOkZqz5YDv/VBSlmhGQldlKLI9qCDJ4RqZ
	c2+y3jQ0mj368qZO4ZZeW7xohR5Q5QcNxk6amfDSBslb01cdE+brMNf7gV3fiCR6Xd2ZC1
	C+B4RTgIB9vgSXbEisnsP+z5XOknsyE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-345-XBNqVhAqOyyx6wCAtLvc5g-1; Fri,
 07 Feb 2025 08:06:37 -0500
X-MC-Unique: XBNqVhAqOyyx6wCAtLvc5g-1
X-Mimecast-MFC-AGG-ID: XBNqVhAqOyyx6wCAtLvc5g
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 772E71800871;
	Fri,  7 Feb 2025 13:06:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.26])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DAA241800360;
	Fri,  7 Feb 2025 13:06:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 6F65A21E6A28; Fri, 07 Feb 2025 14:06:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Daniel P. =?utf-8?Q?Berrang=EF=BF=BD?= <berrange@redhat.com>,  Paolo
 Bonzini
 <pbonzini@redhat.com>,  Eric Blake <eblake@redhat.com>,  Michael Roth
 <michael.roth@amd.com>,  Eduardo Habkost <eduardo@habkost.net>,  Marcelo
 Tosatti <mtosatti@redhat.com>,  Shaoqin Huang <shahuang@redhat.com>,  Eric
 Auger <eauger@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,
  Laurent Vivier <lvivier@redhat.com>,  Thomas Huth <thuth@redhat.com>,
  Sebastian Ott <sebott@redhat.com>,  Gavin Shan <gshan@redhat.com>,
  qemu-devel@nongnu.org,  kvm@vger.kernel.org,  qemu-arm@nongnu.org,
  Dapeng Mi <dapeng1.mi@intel.com>,  Yi Lai <yi1.lai@intel.com>
Subject: Re: [RFC v2 3/5] i386/kvm: Support event with select & umask format
 in KVM PMU filter
In-Reply-To: <Z6TNMZbonWmsnyM7@intel.com> (Zhao Liu's message of "Thu, 6 Feb
	2025 22:54:41 +0800")
References: <20250122090517.294083-1-zhao1.liu@intel.com>
	<20250122090517.294083-4-zhao1.liu@intel.com>
	<87zfj01z8x.fsf@pond.sub.org> <Z6SG2NLxxhz4adlV@intel.com>
	<Z6SEIqhJEWrMWTU1@redhat.com> <878qqjqskm.fsf@pond.sub.org>
	<Z6TFr49Cnhe1s4/5@intel.com> <Z6TNMZbonWmsnyM7@intel.com>
Date: Fri, 07 Feb 2025 14:06:32 +0100
Message-ID: <87o6zdhpk7.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: w+F678ISpDRE

Zhao Liu <zhao1.liu@intel.com> writes:

>> > Do users need to know how to compute the raw event value from @select
>> > and @umask?
>> 
>> Yes, because it's also a unified calculation. AMD and Intel have
>> differences in bits for supported select field, but this calculation
>> (which follows from the KVM code) makes both compatible.
>> 
>> > If yes, is C code the best way?
>
> Sorry, I missed this line. In this patch, there's macro:
>
> +#define X86_PMU_RAW_EVENT(eventsel, umask) (((eventsel & 0xf00UL) << 24) | \
> +                                            ((eventsel) & 0xff) | \
> +                                            ((umask) & 0xff) << 8)
>
> So could I said something like the following?
>
> +##
> +# @KVMPMUX86SelectUmaskEvent:
> +#
> +# x86 PMU event encoding with select and umask.  Using the X86_PMU_RAW_EVENT
> +# macro, the select and umask fields will be encoded into raw foramt and
> +# delivered to KVM.

Doc comments are for the QMP reference manual, i.e. for users of QMP.
Explaining the QMP interface in terms of its implementation in QEMU is
not nice.

> +#
> +# @select: x86 PMU event select field, which is a 12-bit unsigned
> +#     number.
> +#
> +# @umask: x86 PMU event umask field.
> +#
> +# Since 10.0
> +##
> +{ 'struct': 'KVMPMUX86DefalutEvent',
> +  'data': { 'select': 'uint16',
> +            'umask': 'uint8' } }
> +
>
> Thanks very much!
>
>> > Here's another way:
>> > 
>> >     bits  0..7 : bits 0..7 of @select
>> >     bits  8..15: @umask
>> >     bits 24..27: bits 8..11 of @select
>> >     all other bits: zero
>> >
>> 
>> Thank you! This is what I want.
>> 
>> 
>> 

