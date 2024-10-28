Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp1597569njf;
        Mon, 28 Oct 2024 09:32:34 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUpStylQmsK4wq4f37qYxyBXwPx8KQ/A/r5cx/SkCjsgQOiuc6BkeectraFPtwQdWYSW5WcGvHGm0YCQA==@linaro.org
X-Google-Smtp-Source: AGHT+IHVKnHCK8Idk0OSy5mcI/QnSfXjR/wrEnumc1wpVQshEWBpCyvMQ2pgCblZzDju26pc3MhF
X-Received: by 2002:a17:902:d4c3:b0:20b:b0ab:4fc3 with SMTP id d9443c01a7336-210c6c934c1mr135213425ad.49.1730133154653;
        Mon, 28 Oct 2024 09:32:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1730133154; cv=pass;
        d=google.com; s=arc-20240605;
        b=GmEkUla1rWdCZ+cd5on3414ujmHmgpL1aTrBvUNHnKRfv8bGKf8j/xR2nmjdp5vVvi
         x6KCgX0U+JCKCNXbqsrhDtKqmAGvX7kuos+d4aAbPRifP/YI/e6x6I/wnr6OnqJ0necE
         5grchAVTiKtmnxjEc19uNlDFz7/aHWuOq0HtHYPzu4BWxF+u+FvdTnvqMnWFdXaPISc/
         195B6moxGdZZsI2XonNhSWSsY9+n4qVZA5WmY8akNpLTIy+jsT7fxtayVFzRG1fojRAb
         hsthALVdO7ABr5TdooUzju/glAaURIu+mrg4qZq/vusGz1ewkNaVI1SEmu9RUazxODG+
         McXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :list-unsubscribe:list-subscribe:list-id:precedence:date:message-id
         :dkim-signature;
        bh=gjggvzGWkBwrrwMfWh3JXGSzHIVlrh/OgLv0sI1bRiQ=;
        fh=tdLty3RcaJP7avZQuuycCSI/edFLTz+MbEe2/vUfXaQ=;
        b=M0x4kh+n3l7YUYYqybQl+07Wjejmmfli8NTuppgFfUhr/+fjoD+jylnyzNIcg76X7F
         CCs4CXg3vs7yNqCIds+7kE24Gp7OoK4oiCDq6U9VdSGzSfS+1BGGZnVcMXKlbpaD38wz
         r3U3y1cxVt7SZhRMU5KEsuZMHd5ZlfWqeAOK6pqB96C4LFnc6xEoyzIs1+Fc5EgMnxUo
         TDDLvzkyWYhvGl/+tC8bUkkcCZoN2qV2uxs5QLEScEi5xXhtd4Z1LkFXImDQgh3REeL+
         2N5di4f4YaALOwqQ7tgcOmQfak8iuluAd55odN/x/Lphp613im7LNUjmYK9rVl/MDaCp
         gfOg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cczWJyoY;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-29865-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-29865-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-29865-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d9443c01a7336-210bbf0598esi75454655ad.152.2024.10.28.09.32.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 09:32:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-29865-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cczWJyoY;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-29865-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-29865-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 359D6283EF5
	for <alex.bennee@linaro.org>; Mon, 28 Oct 2024 16:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE321DED59;
	Mon, 28 Oct 2024 16:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cczWJyoY"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FB8188701
	for <kvm@vger.kernel.org>; Mon, 28 Oct 2024 16:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730133150; cv=none; b=rfiU9etsRAo3YMmd0QAh5XTGCrEHEzi1ZELXf6E37jkFq3sl+rkvKXkLArFNl+oC/ScCAlQ5iQ7biA98gVmqkQrwI/gwKZtPWaJxA1jOkroc/z0pY1rXOUGQ2+imhDWGiB6trDyDKPeNomqZXrVlGygW8v7aRr/uCcO+48rrsLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730133150; c=relaxed/simple;
	bh=CUqbEHRp/aGU4YbiXZRV3LYL7rE97ohMOM4Ak9tlEng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aQCnGUAnxmc9um+790DnX3CLpdfbKCbjaViNPJkFtp/3uO9eMpx9K3LHROvrpqADC0Y0cM0ps0xnbRECDNAooI3fPWNts7yT2vtJG7aPBP98F+imkNEwyqGfUfkbDfg9dM2C04qu9DboY+idoa0hp8HdqX8Z81LiKFRM6npIm9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cczWJyoY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730133147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gjggvzGWkBwrrwMfWh3JXGSzHIVlrh/OgLv0sI1bRiQ=;
	b=cczWJyoYdCSgyf3m1ZzvmwPTpFeQ50iAt1MoMfPDUcAszqi6Y6P0wAGGkOS1seV7KANYj2
	VmgNuYpyLMjuC3LxMtSfbuQ6m8SzPyOCFjy2K3yI2EX61fine2SBeTRNpJLpCciv4jONMe
	1guNvNeoUVxWZEOMYajN1ZRAlqUkQQg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-AALFBt3pPwSv08lXxUlu-A-1; Mon, 28 Oct 2024 12:32:26 -0400
X-MC-Unique: AALFBt3pPwSv08lXxUlu-A-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4316300bb15so32430715e9.2
        for <kvm@vger.kernel.org>; Mon, 28 Oct 2024 09:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730133145; x=1730737945;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjggvzGWkBwrrwMfWh3JXGSzHIVlrh/OgLv0sI1bRiQ=;
        b=bicHvptAHXIM+gpc5GCp2IbC07REoFwMcZbXfzlbZ+AYJZwlZduuQy6DkrEJSShgKH
         Ajs50BUyYIg8epO+ZljRTkOcfCMJEMdABS3TAtBl4UnKdskVYkzXk+if8T06RYNHQbzJ
         Chl50JrUGQEa+qZUVBN7624Pj/rLFt2EfiLaXPvpJEDJCrWgumArOmM6QiafZAyZSxh/
         xeS6pOXG206ULkEiH/hWl2rR/uJ9Z+WMF3z1gwUzLZXGY0s+MTGPhNH44LKPx6rK9wbp
         ISYPwHyuMeKE+6TlXXMc6f9amTj0Zg610t2qMWZLsPQIh4fGK+GtG1eYOOSICPjX9Rfg
         QqJg==
X-Gm-Message-State: AOJu0Yw+U7sAIITaXOP9TsVMOYaCvuCzSwh2dH37YQi3dsKkIk6VDfP2
	kbuJrBNuHXp9bnPtzX0DxPeYqS6LlnTBGHlB8BczyV/OUSwCmJPuvD+dLYPl0wOqJz+T+Sx0PZU
	ziahLBRhvn4U9++zXFyj3pyADYljD81qCvNGvxRA1r+eT1UFrGA==
X-Received: by 2002:a05:600c:46d4:b0:427:ff3b:7a20 with SMTP id 5b1f17b1804b1-4319ad049a8mr63761705e9.27.1730133145159;
        Mon, 28 Oct 2024 09:32:25 -0700 (PDT)
X-Received: by 2002:a05:600c:46d4:b0:427:ff3b:7a20 with SMTP id 5b1f17b1804b1-4319ad049a8mr63761545e9.27.1730133144747;
        Mon, 28 Oct 2024 09:32:24 -0700 (PDT)
Received: from ?IPV6:2003:cb:c722:3c00:70fc:90a8:2c65:79b4? (p200300cbc7223c0070fc90a82c6579b4.dip0.t-ipconnect.de. [2003:cb:c722:3c00:70fc:90a8:2c65:79b4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4319360d233sm113285555e9.45.2024.10.28.09.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 09:32:24 -0700 (PDT)
Message-ID: <be678d47-b8f5-4061-9287-adb6a44ad483@redhat.com>
Date: Mon, 28 Oct 2024 17:32:23 +0100
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC RESEND 0/6] hugetlbfs largepage RAS project
To: William Roche <william.roche@oracle.com>, pbonzini@redhat.com,
 peterx@redhat.com, philmd@linaro.org, marcandre.lureau@redhat.com,
 berrange@redhat.com, thuth@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, mtosatti@redhat.com, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org, joao.m.martins@oracle.com
References: <20240910090747.2741475-1-william.roche@oracle.com>
 <20240910100216.2744078-1-william.roche@oracle.com>
 <ec3337f7-3906-4a1b-b153-e3d5b16685b6@redhat.com>
 <9f9a975e-3a04-4923-b8a5-f1edbed945e6@oracle.com>
 <cf587c8b-3894-4589-bfea-be5db70e81f3@redhat.com>
 <966bf4bf-6928-44a3-b452-d2847d06bb25@oracle.com>
 <0ef808b0-839d-4078-90cb-d3d56c1f4a71@oracle.com>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <0ef808b0-839d-4078-90cb-d3d56c1f4a71@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: /fz2Klow6WKj

On 19.09.24 18:52, William Roche wrote:
> Hello David,

Hi William,

sorry for not replying earlier, it somehow fell through the cracks as my 
inbox got flooded :(

> 
> I hope my last week email answered your interrogations about:
>       - retrieving the valid data from the lost hugepage
>       - the need of smaller pages to replace a failed large page
>       - the interaction of memory error and VM migration
>       - the non-symmetrical access to a poisoned memory area after a recovery
>         Qemu would be able to continue to access the still valid data
>         location of the formerly poisoned hugepage, but any other entity
>         mapping the large page would not be allowed to use the location.
> 
> I understand that this last item _is_ some kind of "inconsistency".

That's my biggest concern. Physical memory and its properties are 
described by the QEMU RAMBlock, which includes page size, 
shared/private, and sometimes properties (e.g., uffd).

Adding inconsistent there is really suboptimal :(

> So if I want to make sure that a "shared" memory region (used for vhost-user
> processes, vfio or ivshmem) is not recovered, how can I identify what
> region(s)
> of a guest memory could be used for such a shared location ?
> Is there a way for qemu to identify the memory locations that have been
> shared ?

I'll reply to your other cleanups/improvements, but we can detect if we 
must not discard arbitrary memory (because likely something is relying 
on long-term pinnings) using ram_block_discard_is_disabled().

-- 
Cheers,

David / dhildenb

