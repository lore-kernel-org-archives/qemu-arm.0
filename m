Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3012940lfg;
        Mon, 3 May 2021 14:20:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0dcl1gbeWFvHzcAJ9Z2CKm7kJzhO9ZZVSJiMndrgME+o0LjtEN9hCOwoeTlNllXtqj0Gb
X-Received: by 2002:a05:6402:6cd:: with SMTP id n13mr23173240edy.330.1620076808489;
        Mon, 03 May 2021 14:20:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620076808; cv=none;
        d=google.com; s=arc-20160816;
        b=R0sQtByF7w2xxj6rrKvU3NQEJ7AIBNVdT6mrhrEgno7BpA8Mmvziq3wF0zSJBE52tz
         3ajayl2jX7NgVW2q79OIGMiUbZ52WLu0mZnpr39n8RT8pZ0iudOegScqg6hCofQrODMw
         SiDfZp1kwH0Hy4RHh6ma07V6XAloQ3aXbJYTCOA8bzNUzNxvzMjlDTnZki3lcyBof3y2
         5kT8pQhm3CRlHjSs5CqqEfmqTIk72CTRKOjxfH++0OntR6ElG7Eo7GDQSQwmFvsyNgel
         iRvhGXL5d4yYQw7lrwPze15kpiHeoojCfXba+JebUZ9fqQMcLvZfBjZYPM1FujWCKeOP
         yXEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:cc:to
         :subject:dkim-signature;
        bh=dR4CBL+r+jnt3++PiVcPHFlP8yj0Hn6hMcvOHJtftO4=;
        b=ekFmuV84lnyxYjcgzD9Et3hmc3SExJ1oTZ+P0wPxx1cPGTi5HGgf1eBAe/BDa5JYV1
         BaWw/0wYOSDz35iCZrsAzEtTf1uDyUn50Qeqb5hy/izZiwrhJLzrvIQpicEI5WeYRzdM
         U8ntVX/RJQik9Wu3TqQGIzij0RXbLMxFwZQsDq3aB40VEbrTiDIZSr4KEPZumJF/CL5t
         RcHwyLEJZrc9AC4TsIuaEQNPxhRvDqu6ARIkUqTjQqDN5tqlu4PdR0AHjI0tDX50c+Ug
         gOCfYfcQE0711/ZBtoKATOURH5di8+ckHbWtIGirN6bUk5gjKMgOxrW6fLuHBfOyuBHf
         ny7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QNui+gL5;
       spf=pass (google.com: domain of eblake@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eblake@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id bz20si1036086ejc.368.2021.05.03.14.20.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 May 2021 14:20:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of eblake@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QNui+gL5;
       spf=pass (google.com: domain of eblake@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620076807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dR4CBL+r+jnt3++PiVcPHFlP8yj0Hn6hMcvOHJtftO4=;
	b=QNui+gL5YNoXLbdENABwU56jz57EwQ1VMrStfn4YL/1oGNyXzde2yKXCAqBOlz1gU+ARY6
	jkLmPn8FghOJAiUU1haiOqFjO/2BJjcVIMVKysoiaQsJLE5X8LYOLyaMeaeZyvr677W61O
	iLELwKx/WIqnpPeWbpU0QrGLq9Jf5C8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-uFHWohuOP2OFeqk4NgTPDg-1; Mon, 03 May 2021 17:19:49 -0400
X-MC-Unique: uFHWohuOP2OFeqk4NgTPDg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65B049126B;
	Mon,  3 May 2021 21:19:48 +0000 (UTC)
Received: from [10.3.114.144] (ovpn-114-144.phx2.redhat.com [10.3.114.144])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86E6E5C1C2;
	Mon,  3 May 2021 21:19:44 +0000 (UTC)
Subject: Re: [PATCH v6 11/12] qtest/bios-tables-test: Make test
 build-independent from accelerator
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210503211020.894589-1-philmd@redhat.com>
 <20210503211020.894589-12-philmd@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <8e675e24-fedc-c4df-22d6-b385142e0e4b@redhat.com>
Date: Mon, 3 May 2021 16:19:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503211020.894589-12-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: cin7UYSyqEV/

On 5/3/21 4:10 PM, Philippe Mathieu-Daudé wrote:
> Now than we can probe if the TCG accelerator is available

that

> at runtime with a QMP command, do it once at the beginning
> and only register the tests we can run.
> We can then replace the #ifdef'ry by an assertion.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v5 had:
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 
> v6 is simplified and keeps the same logic, however since
> it is different, I'm not keeping the R-b tags.
> ---
>  tests/qtest/bios-tables-test.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org
