Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp2839719ejb;
        Tue, 30 Apr 2024 03:29:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWMX6TTdtF9Dlxk3gnqrl5X7iqgtfD2k+HoqcVM7kLnKplQ6NWxE0ybTY1t4Qk23y8oZynWGpoeZd8lXF3woL8HLJvhzWzC
X-Google-Smtp-Source: AGHT+IGx+Ua0pcsG3ETH6BeVWgmGJS4N/bhGJsYuOaDxDKYX7MyOnRGL2PzB0/kaRPSabq6ro+qx
X-Received: by 2002:a05:620a:4012:b0:790:98cd:647e with SMTP id h18-20020a05620a401200b0079098cd647emr3024885qko.11.1714472962477;
        Tue, 30 Apr 2024 03:29:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714472962; cv=none;
        d=google.com; s=arc-20160816;
        b=TH/GE+x+go2kpQ+Z3dNCpPcBNbY4WqML/KookfUjtjlSckUMFhxbQ52twoEaAIa3yT
         jiJpvgZVWpMldFDk0QhkR2xZeQuSiaf9mjCV2SmFrk3xO0XQtvm0cPqiqteFzXIsrtbW
         E1OTpRTxFcvQXrpekKbb2/S7aRVhRBfm3/K/u8Ni5cd+v4ika8EjF0sSrHiH9aZy8H2E
         jKIaQAMx6QEvKcE5W+iKQ8pDnOksYxLdCutgA4nNaK48hV03dbo5qM1xhCry9aqV5C2l
         p1vCGJU1396CPNeQGYZf2tYGlzsUD91xD8jtcPSpRCM60Cmhn1y8Ur6a+NGyx+qdiWRu
         2X3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=aW3OTZQEeRLexcIL/yRGaeeXgT2rr2+rfi0/6bm4v8E=;
        fh=Vazjj7y9xZhcG9d7ioVkFtNYb7obhhQCd6pwSXqvDGQ=;
        b=UZQeoui/0TGA3FR8viNqXkmydyNsiyg5SRovbAIwaQwkE/xAOVhTasVWn9ndi5gP57
         Gcgc0PKOSeXvm3mh4ONC3LLlQLKCsvx7fZFlip8o6Yds8DW5S5YfPQTxUV/2jooNEK3K
         BLBcn5p2YdJEvIt4btpRU3E3usBU9mTX3pSHQ7/OKbLZEQva7dlzxQBfasoRyBQwtwUe
         xkTaqbwZyvmaiB5UDk1CpEczuuQtQxG516uyWldUqH8ab1QkL2GAh/dEcKgSkJouWvaq
         LEPUh1kAAoGTi/YCMxifD3woQCDOHoPgzfJLgd839lVb6YYhBjJhJzJLjyxPY2mWZ0Ak
         OVyw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H5INFIEW;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id n1-20020ae9c301000000b0078ef1622a70si27559478qkg.68.2024.04.30.03.29.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 03:29:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H5INFIEW;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714472962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=aW3OTZQEeRLexcIL/yRGaeeXgT2rr2+rfi0/6bm4v8E=;
	b=H5INFIEWLOKLXXzzYcPlZQIxR02Ff0N8nITdJliBpzp3y6hxCceTtMpdK1f8WJuaFOqZpn
	5pVR5+XU5QaFke8o6+38kXqXupyXNSg4K4ow75IIQLH7kG9rqux30AX324bgZA2ZrftHT9
	QdmszvH3OspUEddWo9oA2+jBoLtAh3g=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-iEHcdFXcP6WAHVKh45BPlA-1; Tue, 30 Apr 2024 06:29:20 -0400
X-MC-Unique: iEHcdFXcP6WAHVKh45BPlA-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-79088c219ccso870862985a.2
        for <alex.bennee@linaro.org>; Tue, 30 Apr 2024 03:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714472960; x=1715077760;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aW3OTZQEeRLexcIL/yRGaeeXgT2rr2+rfi0/6bm4v8E=;
        b=ba1q80LDHiBV2k8x2peZanFxRyVXrGEPhpOniGIoz2UsoghrkmsVZasl3wq7k4oGDE
         Y7r0p62eIDQ0DergWJ+049BnYDJqPUFrvIMyZ5fIRd5/oI5tEgF38l8OFNdjWEngfo5M
         0lsjgYFiX7sXsVzczt4Sx+NA0xiuknnzJ6v30i3H3PTLy/CArHlenewPs2ASgv9JvLNU
         16MSC0lJnDnSrRcedEy+xTxnJm0XQ48EVNe5xVjxyrkUcEc5exbYAUAEW+gqbxGrv1rE
         VocYeoqJXQUiYZbICiFklfJepY2g5Bp+RhPEIjUU3/eMK630WcXUoh8T3ApUBYH6EWxj
         rzhw==
X-Forwarded-Encrypted: i=1; AJvYcCXPdSe8s7A6Js9aJWC+EYsV0fJaT9VyWJhJAeZUWy/H5oroAsp+KZg4YKHtEaOs75dyQ/3780fIYHcROOl4dfMSXQmJ+Tx9
X-Gm-Message-State: AOJu0Ywt/yFbu9qSrHylfyG4v5A/ilHoHSzGIyancF2IgJjneZh6zdRb
	hGB0K2KLHyaBxDW+frJ0zVskdd7cqsTHqmBQDbG/7QiWPUV3KFwJw7n0uyFsmaFCWBwbaH1ZE48
	Z//Nf2STPsbNFzqkd1OR15ccZPEpTUe+deoq4jgGob60a7V47wovxgs8dpxpLxA==
X-Received: by 2002:a05:620a:4510:b0:790:ad7a:d147 with SMTP id t16-20020a05620a451000b00790ad7ad147mr2764829qkp.62.1714472960145;
        Tue, 30 Apr 2024 03:29:20 -0700 (PDT)
X-Received: by 2002:a05:620a:4510:b0:790:ad7a:d147 with SMTP id t16-20020a05620a451000b00790ad7ad147mr2764811qkp.62.1714472959852;
        Tue, 30 Apr 2024 03:29:19 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.9] (ip-109-43-179-34.web.vodafone.de. [109.43.179.34])
        by smtp.gmail.com with ESMTPSA id m6-20020ae9e006000000b0078efdcd9aa6sm11295972qkk.127.2024.04.30.03.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 03:29:19 -0700 (PDT)
Message-ID: <05cab8d3-bda0-4452-92d7-061f4719eba7@redhat.com>
Date: Tue, 30 Apr 2024 12:29:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/about: Automatically deprecate versioned machine
 types older than 6 years
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 devel@lists.libvirt.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>
References: <20240430064529.411699-1-thuth@redhat.com>
 <ZjDAGuONZ_Zem3fL@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <ZjDAGuONZ_Zem3fL@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 9i/GDLyT0iGu

On 30/04/2024 11.55, Daniel P. Berrangé wrote:
> On Tue, Apr 30, 2024 at 08:45:29AM +0200, Thomas Huth wrote:
>> Old machine types often have bugs or work-arounds that affect our
>> possibilities to move forward with the QEMU code base (see for example
>> https://gitlab.com/qemu-project/qemu/-/issues/2213 for a bug that likely
>> cannot be fixed without breaking live migration with old machine types,
>> or https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg04516.html or
>> commit ea985d235b86). So instead of going through the process of manually
>> deprecating old machine types again and again, let's rather add an entry
>> that can stay, which declares that machine types older than 6 years are
>> considered as deprecated automatically. Six years should be sufficient to
>> support the release cycles of most Linux distributions.
> 
> Reading this again, I think we're mixing two concepts here.
> 
> With this 6 year cut off, we're declaring the actual *removal* date,
> not the deprecation date.
> 
> A deprecation is something that happens prior to removal normally,
> to give people a warning of /future/ removal, as a suggestion
> that they stop using it.
> 
> If we never set the 'deprecation_reason' on a machine type, then
> unless someone reads this doc, they'll never realize they are on
> a deprecated machine.
> 
> When it comes to machine types, I see deprecation as a way to tell
> people they should not deploy a /new/ VM on a machine type, only
> use it for back compat (incoming migration / restore from saved
> image) with existing deployed VMs.
> 
> If we delete a machine on the 6 year anniversary, then users
> don't want to be deploying /new/ VMs using that on the
> 5 year anniversary as it only gives a 1 year upgrade window.
> 
> So how long far back do we consider it reasonable for a user
> to deploy a /new/ VM on an old machine type ? 1 year, 2 years,
> 3 years ?
> 
> 
> How about picking the half way point ?  3 years ?
> 
> ie, set deprecation_reason for any machine that is 3 years
> old, but declare that our deprecation cycle lasts for
> 3 years, instead of the normal 1 year, when applied to
> machine types.
> 
> This would give a strong hint that users should get off the
> old machine type, several years before its finally deleted.

Sounds like a good idea, too! Since I have to drop this patch here anyway, 
could you maybe write such a new patch? (or do you want me to try to 
formulate this?)

  Thomas
