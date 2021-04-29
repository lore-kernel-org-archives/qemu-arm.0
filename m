Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1631510lfb;
        Thu, 29 Apr 2021 05:57:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZh8hHZRd0p/Z7kThldxNDjr0RSdbxyduaWTpez3TRtJHlIbdxrI94mCEfCNHquw/4zJ41
X-Received: by 2002:a17:907:399:: with SMTP id ss25mr12756569ejb.134.1619701040793;
        Thu, 29 Apr 2021 05:57:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619701040; cv=none;
        d=google.com; s=arc-20160816;
        b=Pa1SsYpuqjOpDXrjGm6o0l10wlYlF5gP/+zoH0os628eid12wQWOqgjxVfs+sWBTcI
         WRLdQRcIcE7HXh9hxKospiYGf+0uPJdCk/O9RWzU/OqlQAK4WjePyTNRYWhqr+La8OvN
         hgEa+OmTP59WWNK9Rsg2tH4TNc3nQISPpbWhffrfIWcAf8tgwuoyNsPrl7jV1ozCT4TA
         m5ILlablDM0tdjqikOVBjLS7GRXVyy9QypHQoSq1rYmjBabFGzRCDE1v9Ey83uRQjcws
         J0cl/tn8UPA53ZZShYz8jjgOcSHQd3HzXy/qabOEJJFFeoZJILV0penAwn+P0b8f+csG
         6O2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject
         :dkim-signature;
        bh=Oti8ATbYq8Jbp2hVZiDT2qJSdqRp1r/F01P/IkBwRLM=;
        b=Gd1Wic7UmvVe88wjHZEyEl46ANfKtMJvSanRBYkRMF8TAF9OIsSMi1SgW2+xjGh5+g
         VYMSjvO+7GfeygTy8lXn55QViJcMZFTuUE0la6Sa5TK+yFauKraGQG4DgDqAAVelXA1u
         WdIixEoPZohNmL6BWxBRgOYBVdG1iNXfmN0/ihQvIbMq5TLK32dNTdBLahpieLHYNvCJ
         Ft+hWbKqyalvA8mu1exWELsmAuWQQCXTK05jj9BDdmmAwNtr2vuA5f1ADfZ7x+qbC6Lw
         IyMgTXiPbP5X4gBO4UE3CiR6G/KvlITuBkg8Sr61H5qyds88dSyiNHZFxFK8Akq0inUT
         TYog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JfQj0lRY;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id gn17si2852072ejc.324.2021.04.29.05.57.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Apr 2021 05:57:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JfQj0lRY;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619701039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oti8ATbYq8Jbp2hVZiDT2qJSdqRp1r/F01P/IkBwRLM=;
	b=JfQj0lRYnrQdrL4P7QDFb/W3MQ5LzcVX9YuxbgCgrIkj3lv7JCba3Nx9HgKChZtAcmGW6K
	xXClRoko1a+lkcLLE9wA7lAeHCwdfbwV89tvQPncvGA1qEyqLrUKu8082a8dnggJtRHLYb
	rPFFCsTnNphhysQWkARB040jtP2Yyks=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-RXcGKBueMweiOPMkyEbSXw-1; Thu, 29 Apr 2021 08:57:16 -0400
X-MC-Unique: RXcGKBueMweiOPMkyEbSXw-1
Received: by mail-wm1-f72.google.com with SMTP id j3-20020a1c55030000b029012e7c06101aso6986199wmb.5
        for <alex.bennee@linaro.org>; Thu, 29 Apr 2021 05:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Oti8ATbYq8Jbp2hVZiDT2qJSdqRp1r/F01P/IkBwRLM=;
        b=WQG0rTu32Rnkq8PSJbBeVvflh+LmM+cwEIuJbcNxBAVZXdJrc6uG+bR7w3MG6xO+sW
         uo6lEqi6iigcIICPVnYzzWFVKDWxGM2eEPtQDlhTy9/BEyQV+IrxnrFuGk5w56O5UErX
         ZyiDIXWMcS9WV9rN3tX+bLtfn+bDLtdnX/lIlO9I78OmeV8zfnfrWwLaLd25bvF56Hhl
         ol5bydC2vs7lf14eVywg+26CGWDNnDDbrrMMAG5/HHfYM+KyfnZmmJpLRwx6K3PMzNGp
         YEuhg0IhXyCX0GcD3//LVhI77Fq40WZYB5G/5y91mUfBvaUaaua6hINzaayEmNUJNX1C
         6JbQ==
X-Gm-Message-State: AOAM533dzin463K8Vziw3nGVjgAmbareUvRVwMrwcs7jGisfieKxLs2k
	CvuLEtN/4G6FhVAaY3sFEuLzteqWEQSWEmaYWd50UiBORyIRhqrgO8MwHlhWHzaViBdK517EItF
	LCxNLq09C6PIjGo3e
X-Received: by 2002:a1c:35c6:: with SMTP id c189mr10038492wma.127.1619701035740;
        Thu, 29 Apr 2021 05:57:15 -0700 (PDT)
X-Received: by 2002:a1c:35c6:: with SMTP id c189mr10038461wma.127.1619701035543;
        Thu, 29 Apr 2021 05:57:15 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
        by smtp.gmail.com with ESMTPSA id t17sm3538717wmq.12.2021.04.29.05.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Apr 2021 05:57:15 -0700 (PDT)
Subject: Re: [PATCH v4 12/12] tests/meson: Only build softfloat objects if TCG
 is selected
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Emilio G . Cota" <cota@braap.org>
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-13-philmd@redhat.com>
 <03eed9c3-0670-f262-a2fa-172639b8ad77@redhat.com> <874kfqs5gl.fsf@linaro.org>
 <763dbed9-35e9-0f85-3b94-01bffc7fcbf8@redhat.com> <871raus00j.fsf@linaro.org>
 <97b2e23c-bbb2-f2cc-bddd-6047d0cbe0be@redhat.com>
Message-ID: <9a4dfc32-91a7-df14-2601-f175c97a1dd5@redhat.com>
Date: Thu, 29 Apr 2021 14:57:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <97b2e23c-bbb2-f2cc-bddd-6047d0cbe0be@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Dke0Si8taMMZ

On 4/28/21 9:12 PM, Philippe Mathieu-Daudé wrote:
> On 4/28/21 9:04 PM, Alex Bennée wrote:
>>
>> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>>
>>> On 4/28/21 7:06 PM, Alex Bennée wrote:
>>>> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>>>>
>>>>> Alex, Richard, do you mind reviewing this one please?
>>>>
>>>> Isn't it already merged (with my r-b tag no less ;-)
>>>>
>>>>   f77147cd4de8c726f89b2702f7a9d0c9711d8875
>>>
>>> See ...
>>>
>>>>   Author:     Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>   AuthorDate: Fri Jan 22 21:44:31 2021 +0100
>>>>   Commit:     Paolo Bonzini <pbonzini@redhat.com>
>>>>   CommitDate: Mon Feb 8 14:43:55 2021 +0100
>>>>
>>>>>
>>>>> On 4/15/21 6:33 PM, Philippe Mathieu-Daudé wrote:
>>>>>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>>>
>>>>>> The previous attempt (commit f77147cd4de) doesn't work as
>>>
>>> ... ^ this comment :(
>>
>> Ahh - my tooling was confused having searched by the subject title ;-)
> 
> Oh I see, I'll rename as:
> "tests/meson: Only build softfloat objects if TCG is selected (again)".

BTW you indeed reviewed/tested v1 of this patch:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg793900.html
but after addressing Paolo's comments I preferred to remove your tags.
