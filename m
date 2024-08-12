Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp716306njh;
        Mon, 12 Aug 2024 03:10:03 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCU17Ip/ICI/34+jALGfr0gZ/2eWBpkrfdtWqUNMC2Yzlo7GtvKQaUhwDBEzUGWDtJngankQptsC1pM1O8eymbZMIUMY4gmc
X-Google-Smtp-Source: AGHT+IGkxrmZMKRRerpLv/0PWIUpXKzxLwAmpb6Ak2FZGIl9eiDi4AfrJMfv4gXe1QuZ4VRl7eLa
X-Received: by 2002:a05:6214:4699:b0:6b5:34b:8c02 with SMTP id 6a1803df08f44-6bd78db4981mr111306016d6.27.1723457403208;
        Mon, 12 Aug 2024 03:10:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1723457403; cv=pass;
        d=google.com; s=arc-20160816;
        b=cAb/m9t5+ubWkLR+K8fpxTJU/ncHhrOagSnTsSIC4rf76QsGYOIvQMGFi95ABZLXct
         kMh5UXFdJgQS5UYNhCMWDMUdevNTqefeiFkfuA2cF9MZz22h65jOAhnKZ5Ol57C0S7Je
         TInKrJyRgJlrG3yGLjQNXcgqj4b7meVMUvoB9uE7yp/TYSG5KTDzcr37Q2kHAJ4b6/m8
         3Wva92yTWfnntxj8Yul5xjuYG5dwnVMKDnpyYEfeC5kuJIAoBPKU10UfD34YDkH5h+WK
         JLUZ7ue0dpJFa55uxTHjjyxj8J0A7WzVwjw75oEjPlW/KeWyfYiqL9xEiYd1ce7/mQ71
         fr2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version
         :list-unsubscribe:list-subscribe:list-id:precedence:date:message-id
         :dkim-signature;
        bh=hcxDp9vgKIuFFaU8kQG0ynaI4kr+dfXA6004gRSj6ZI=;
        fh=PK7OJvVEArg+D9ZhVFsk5HSKy++ay10PRuolROmNSUE=;
        b=uT6lMaHA2UCb4OCrvJlAD6pCdFBitU8U0UulLDBzu+OhSvqC510/YxqqhoUHZoeBjF
         ttC2KNVIU3/nBoWhfMI7Ik68N0ZHV4vMXfJtceNfG2CTuS6zia35AQy4Fo1n3mpb632K
         q9PIPuJwqvw9atxLGMN8Sd1Yqoa1AbmGi+3/5sz1Q4uTtZdUyPswUO5ExBo+9tP7vW+N
         xmYYQ+BCtlnUVk9Xu7zkngBG/YEJuc9NfmxGT4PgwuWL4G3UKNyR9TdiQxiy4DNMwHD6
         KqNV4afMTq9P9kqAaHbFp70SOhJc89A26tissfgi1VO3h9GFAHNQM46V+b/hMmSqXlcb
         lDJw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DQlkzKos;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-23835-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-23835-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-23835-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bd82c8a043si56241406d6.166.2024.08.12.03.10.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 03:10:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-23835-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DQlkzKos;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-23835-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-23835-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D97E81C21461
	for <alex.bennee@linaro.org>; Mon, 12 Aug 2024 10:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 121D115099B;
	Mon, 12 Aug 2024 10:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DQlkzKos"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DA81876
	for <kvm@vger.kernel.org>; Mon, 12 Aug 2024 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723457397; cv=none; b=lVwKIt0idp+vRIJPaGvW0+v+RNIi1gRzpNmnBQvWjoAzWZ/HnohPhGIP246u4rCpaw50cM3AJLF/k9B0eBhzxO79IuRztCZCoplkF7luMyT5mtfDroGIKyf/rMj1nmqwZlvtOaGqTa92VQiM+V5zPjWsA5IGoI5nHlqgvDdw3D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723457397; c=relaxed/simple;
	bh=sYe+fdI+F4aX+n0KfxR1e5aaeSvUe2gRPi4FpYKbViY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ROlFfHXMaLWXcIBdjD7T8IRsRPHylKNaxzA0V7B3pjnAHstijToJuV1CMrGveyiPP7+M9OeOQkqRGPHo8y/LQHAZvGliyiY13dHiCdXT2nFvhRZeJxHzyCe0dMsTIyGjM0mekLxIWqCLZAWSK1JQsuPNRnCL2u+2EtHqwrq2/Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DQlkzKos; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723457395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hcxDp9vgKIuFFaU8kQG0ynaI4kr+dfXA6004gRSj6ZI=;
	b=DQlkzKosCJUL77d6osQDi0SI4NITyF7RBk/OXQ9XlEyvd59VnBwzMr8d1aa93LHHzBwTm4
	jT1mWiqlXaH+W8vXQA/uBObF/h0LecfVTczs6vzrIRrNOffAtesjKAAzgW9BZi1/YqsZ57
	urR0irsGaqpXnjMkryD01JitvnlSjCs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-uhasZvD2MK-5ggpnasJkXQ-1; Mon, 12 Aug 2024 06:09:54 -0400
X-MC-Unique: uhasZvD2MK-5ggpnasJkXQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4282164fcbcso32578595e9.2
        for <kvm@vger.kernel.org>; Mon, 12 Aug 2024 03:09:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723457393; x=1724062193;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hcxDp9vgKIuFFaU8kQG0ynaI4kr+dfXA6004gRSj6ZI=;
        b=sw92fxO9SEoRNp7/D3rxpEM/wBLKbYYPCRwGyPAlu989jzGsC/JwX96ZPoB+5ssxfS
         TjefxS0B9547l37pzhPQtE5Xbkx51nFtfCBNQM2FkKHPLBlUANrDoQqGanyri7UrkRzj
         qyzSJxatJ804eMdrfO9BU1HdM5lHQPuRYGDm35VYxBiTgi9a+1yKnfz4cVG40DMohOc5
         meSTy4LB/iFQq5GE6RV8LjHAgAvzKnpnXSZkOfXB03vbdNQS5X9wfSpKKaTYTr7ZTmgI
         xixKDFZsAm5gJu7KfJzR8zyMXZaP1CNUseaKlGh4EUa1eJGANXva9mmvIZRyiHSSJHK5
         E/6g==
X-Forwarded-Encrypted: i=1; AJvYcCXLAuX2C3MsNUGjjFGM0lTw4isWh0TPND1zwTXgxJZSl7WBre7JNn0HZTkC42q8HDcqjtAju4PWfINZdpVF/c0U0uV+
X-Gm-Message-State: AOJu0YzXtSblpBE+72fEfXZtfltSSBn315y+ExtFZktD78dLgvNEv0sY
	9S3akL9UY0/9WJ2Zh+XvZjF0uaXm62XsPQf51tk0cxFDOisDDqVEPNr57GUAbs+mOnLbbmhE3Em
	eLDo/tBFFhwWtvnsqTCqP9EOYi9NW+CmFVPlpeh9GckHcUGCO2w==
X-Received: by 2002:a05:600c:4e92:b0:428:17b6:bcf1 with SMTP id 5b1f17b1804b1-429c3a291f9mr64468855e9.22.1723457392852;
        Mon, 12 Aug 2024 03:09:52 -0700 (PDT)
X-Received: by 2002:a05:600c:4e92:b0:428:17b6:bcf1 with SMTP id 5b1f17b1804b1-429c3a291f9mr64468225e9.22.1723457392384;
        Mon, 12 Aug 2024 03:09:52 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-178-125.web.vodafone.de. [109.43.178.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c75042e9sm95625855e9.8.2024.08.12.03.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 03:09:51 -0700 (PDT)
Message-ID: <e01dc474-905a-4096-ad76-3bc4d04b23ed@redhat.com>
Date: Mon, 12 Aug 2024 12:09:48 +0200
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/18] qapi/machine: Rename CpuS390* to S390Cpu, and drop
 'prefix'
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, andrew@codeconstruct.com.au,
 andrew@daynix.com, arei.gonglei@huawei.com, berrange@redhat.com,
 berto@igalia.com, borntraeger@linux.ibm.com, clg@kaod.org, david@redhat.com,
 den@openvz.org, eblake@redhat.com, eduardo@habkost.net,
 farman@linux.ibm.com, farosas@suse.de, hreitz@redhat.com,
 idryomov@gmail.com, iii@linux.ibm.com, jamin_lin@aspeedtech.com,
 jasowang@redhat.com, joel@jms.id.au, jsnow@redhat.com, kwolf@redhat.com,
 leetroy@gmail.com, marcandre.lureau@redhat.com, marcel.apfelbaum@gmail.com,
 michael.roth@amd.com, mst@redhat.com, mtosatti@redhat.com,
 nsg@linux.ibm.com, pasic@linux.ibm.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, peterx@redhat.com, philmd@linaro.org,
 pizhenwei@bytedance.com, pl@dlhnet.de, richard.henderson@linaro.org,
 stefanha@redhat.com, steven_lee@aspeedtech.com, vsementsov@yandex-team.ru,
 wangyanan55@huawei.com, yuri.benditovich@daynix.com, zhao1.liu@intel.com,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 kvm@vger.kernel.org
References: <20240730081032.1246748-1-armbru@redhat.com>
 <20240730081032.1246748-10-armbru@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Content-Language: en-US
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240730081032.1246748-10-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: h+T3zm5LIj54

On 30/07/2024 10.10, Markus Armbruster wrote:
> QAPI's 'prefix' feature can make the connection between enumeration
> type and its constants less than obvious.  It's best used with
> restraint.
> 
> CpuS390Entitlement has a 'prefix' to change the generated enumeration
> constants' prefix from CPU_S390_POLARIZATION to S390_CPU_POLARIZATION.
> Rename the type to S390CpuEntitlement, so that 'prefix' is not needed.
> 
> Likewise change CpuS390Polarization to S390CpuPolarization, and
> CpuS390State to S390CpuState.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---


Acked-by: Thomas Huth <thuth@redhat.com>

