Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1319023lfg;
        Thu, 6 May 2021 07:26:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCAT10gqSLH3n9xvEuw4D58OwoIQZqbH7ef1BJy1+BfxAPgVF4Uv1aCaZPtKX8IebfjZIl
X-Received: by 2002:a50:da88:: with SMTP id q8mr5662094edj.256.1620311167708;
        Thu, 06 May 2021 07:26:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620311167; cv=none;
        d=google.com; s=arc-20160816;
        b=XRFebVsF/Q9GwVoU7xTmnx+vTZYlr4a7U65uaYyfhtQafIgCnQm/QeAomZFbbCk9TU
         wPBfiiAtVAAkXzXcDx6YbkBp+a5TKGHg7yuoh9eeYM+vzy3vtd87uHQfJ6S02Z0/XQcH
         7TZhSKj0GvSdqJi7kAIAJ0H6FMTHOvSBPc/oZ45d1sqVaF/AWi6tOEHYegEGPhq+s/PO
         4t5aglVRKNWCegNVVYBGHdMMM3+o4Qbsj9MajomHPxM8A0erDZuzCMzvZW0I/Gc4wkEO
         XBAiEtt7gMyPno2B9EBy4tr+Oru28tG0iuciYX74Y7J4bao9x9A1Y4fzadDPWoBUZbql
         caxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:cc:to
         :subject:dkim-signature;
        bh=4iuE6eCW+gTRiFvl6fzIAuVjIl3+LmZF9xYYjhbaPYk=;
        b=QQIse0KM1zdQ4DNQZPFMs4XrlA0O/1/DH/4SfGhmVE7tcirGjeJ53ZU8irdnvz69IA
         VFTK2UHTZbJpwygCyLAZK+AezeKOr3nqk2qCkLG6buD8QszNtlD1ibDSyc3YmdKTauqr
         LWuuzXa8D2dok6rbKEkvrXBcgvDzTO7jYq1cWXYrH7NdqItl7QLffcJ/gcC0BVJM3jzt
         5OHn4NOBHowDwjb7nPe+kMh+HAb1gi+yT4PnRRO974GdPzSJj1fGrUlF75kuh8csIkxI
         t7eq3sgE4SYehD3bfz11lWu1zaByz0PeJYlYatXcAKtwH1wQKtholoy29zQtb461/H0q
         jm5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cD5QFNST;
       spf=pass (google.com: domain of eblake@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eblake@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id dy4si2421724edb.544.2021.05.06.07.26.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 May 2021 07:26:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of eblake@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cD5QFNST;
       spf=pass (google.com: domain of eblake@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620311166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4iuE6eCW+gTRiFvl6fzIAuVjIl3+LmZF9xYYjhbaPYk=;
	b=cD5QFNSTFCvkokRTwxBs4W8HJFqGplf1b7ogA1Of6sky2l+WiT4BxOPzU4ccNmrMBE6gQL
	L9+49Sh+rmmIUEqLU7rrl/73lrqyS4yejL/h9Cuhb7jz8aeI40bHaUW4W+UaBbO/YRRb38
	cbp101FHqSoEs6ksH/rpvul9keKJl+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-VUj96t0uOsKt2Yn_3ajXeQ-1; Thu, 06 May 2021 10:25:57 -0400
X-MC-Unique: VUj96t0uOsKt2Yn_3ajXeQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4465818BA281;
	Thu,  6 May 2021 14:25:56 +0000 (UTC)
Received: from [10.3.113.56] (ovpn-113-56.phx2.redhat.com [10.3.113.56])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E70A95D6D7;
	Thu,  6 May 2021 14:25:51 +0000 (UTC)
Subject: Re: [PATCH v2 4/9] bsd-user/syscall: Replace alloca() by g_new()
To: Warner Losh <imp@bsdimp.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
Cc: kvm@vger.kernel.org, Kyle Evans <kevans@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210506133758.1749233-1-philmd@redhat.com>
 <20210506133758.1749233-5-philmd@redhat.com>
 <CANCZdfoJWEbPFvZ0605riUfnpVRAeC6Feem5_ahC7FUfO71-AA@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <39f12704-af5c-2e4f-d872-a860d9a870d7@redhat.com>
Date: Thu, 6 May 2021 09:25:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CANCZdfoJWEbPFvZ0605riUfnpVRAeC6Feem5_ahC7FUfO71-AA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-TUID: 5v5rRHSvcxe7

On 5/6/21 9:16 AM, Warner Losh wrote:
> On Thu, May 6, 2021, 7:38 AM Philippe Mathieu-Daudé <philmd@redhat.com>
> wrote:
> 
>> The ALLOCA(3) man-page mentions its "use is discouraged".
>>
>> Replace it by a g_new() call.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  bsd-user/syscall.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
>> index 4abff796c76..dbee0385ceb 100644
>> --- a/bsd-user/syscall.c
>> +++ b/bsd-user/syscall.c
>> @@ -355,9 +355,8 @@ abi_long do_freebsd_syscall(void *cpu_env, int num,
>> abi_long arg1,
>>      case TARGET_FREEBSD_NR_writev:
>>          {
>>              int count = arg3;
>> -            struct iovec *vec;
>> +            g_autofree struct iovec *vec = g_new(struct iovec, count);
>>
> 
> Where is this freed? Also, alloca just moves a stack pointer, where malloc
> has complex interactions. Are you sure that's a safe change here?

It's freed any time the g_autofree variable goes out of scope (that's
what the g_autofree macro is for).  Yes, the change is safe, although
you are right that switching to malloc is going to be a bit more
heavyweight than what alloca used.  What's more, it adds safety: if
count was under user control, a user could pass a value that could cause
alloca to allocate more than 4k and accidentally mess up stack guard
pages, while malloc() uses the heap and therefore cannot cause stack bugs.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org
