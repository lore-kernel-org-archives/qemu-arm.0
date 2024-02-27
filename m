Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2821985ejf;
        Tue, 27 Feb 2024 09:35:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqRevQmiribC9oQE/z5ibX56m3BLEJ6NwlP99T4IwAL5CQ0SEhyj7ILRJ/pU7nXGT4/Wxe
X-Received: by 2002:a05:620a:370b:b0:785:8c13:bfec with SMTP id de11-20020a05620a370b00b007858c13bfecmr3183025qkb.43.1709055317054;
        Tue, 27 Feb 2024 09:35:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709055317; cv=none;
        d=google.com; s=arc-20160816;
        b=E/GhLPkb7kmDkfotJ4W0VXOOMPJ+eRUWtNofNpvPU4gufAevgpmAESJ8NqQME7okwy
         9eHDmENW8OsvkugJnO8sBYPuRhbSftpFRCc1+xkdManX2B/vfcnM8EDo182QW1S+uYaF
         oIMtqosR4pth0QmcNjoGg0j/BLN3Wjeg8VZKEGhVbx+Jh+rNZyUHegC9RUnNTnPX93Gl
         xe+bwQUMLoP4PqckdHO42Y8PKg+/46wXSdYMdLa184JtWtYIxdH1BmBKUVtngUDHt1JW
         abJh8wYeVj6Rvf3XvVPOGPzMKAHkGRkSvqJKLAMhoS0aCgEJliDLNjTf8LHkP+Rng9q/
         Tu0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=u9Rjeknrs+RY5x8Yrgrerm6euSG7pdM8wNjDsb38uTE=;
        fh=oUNEGq5Jp9A1lVgt6bTHDeBq9b6dLi5c7sj/kZOPvQU=;
        b=Fg3BogiVG/AM3AHkziC4BdZyNeX7VO9+19JbgbsFWsqaEa39PQmgPl56ZfFuL5ryfY
         qBHQMD0gZC3RlXhBJAhz6TogBlv8bwXtaBRSyrRd5d0gIf4AifoLnGbanVUD8TNRNlAs
         yvR/X2zv8aSwtHAIzduphuTumDWyo/O389pMTg0JNiyo42hPfJiFi6U2qk7fICg7p2I+
         Sdypes6IjuQtUuiT9Xtcbn3ByS9fbYbTV1DOBqNIowrFC0DNlV/04tOMZDn3MGPgZVCg
         m48UQcx+nAMWpeI/E25ZdJBpHIAcGJdxZKrh45pxSIsJRUFquuQydE5qWEdz/A7BrTWp
         PNHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EzDnN1Vu;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id u8-20020a05620a454800b00787d6677545si4671514qkp.79.2024.02.27.09.35.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 09:35:17 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EzDnN1Vu;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709055316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=u9Rjeknrs+RY5x8Yrgrerm6euSG7pdM8wNjDsb38uTE=;
	b=EzDnN1VuxXYDw3k+YO/dUvMNApdvnZVZPeDyXb3ypSnmtzYuIOjQm9rGyEkS+30qNUIMMV
	74+IO2z3OXQUL7GkDwGiZCVcRa6rG+3lBIEIBNAV1EnxGJ8HSjVwIJQ+4PaPP1aFcwj/Ps
	05gZ4WBuBOWwk6Nb0jJF1uw0YCdOSQI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-E4xc9-toOHWHLEYkGgpFhg-1; Tue, 27 Feb 2024 12:35:15 -0500
X-MC-Unique: E4xc9-toOHWHLEYkGgpFhg-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-787e18ad224so138287285a.0
        for <alex.bennee@linaro.org>; Tue, 27 Feb 2024 09:35:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709055315; x=1709660115;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u9Rjeknrs+RY5x8Yrgrerm6euSG7pdM8wNjDsb38uTE=;
        b=fxjj8gUrU5odNdq6vQvbifo7OWUacKx7EoiWY3FvtuEHC1I2UC1OC1R3vWVMKVU9iZ
         gmbEh5GkLOrsgL4KyrK7YIBNn5RmWRoSwj76hQG2MVBEMzcU+nYRo0R1VxlRIF5j14xP
         cwLhgEObJbtFGJgEZhJ9KJyWcwpBKrFrnxQApVm3D8fBwAOrR5PyY5ixk6sfALUytxHq
         8RE1Qbccz8kEWdJdG1PEPvKkSowbSb93RQGf31//v/TSc2PFmpdnCVH7icYVQHrjb5Gw
         94PDxXXR/VpQrhldpM9ngRALlE3h6hYqaZMB+hQ09r3ZX7A3sJAsugaqXV3bZID8I3Dw
         5i/g==
X-Gm-Message-State: AOJu0YxejC+x+OY2ubEM7N0WLVub6AO0unS6G/7be1DPTAW5aYVRfCkB
	K0GGhwIk+tZHfka5gP6nNrDUYhvF4CFmsntuWKtMRUIb2r31DWvQCjj4nOV8O4CEY3sD788Xfe3
	8f8MJ4pk2KrmEnxr+FSvpVszRUxngzG8ifRzqvB95rPVJwyXCGhhb3yi4/AmM9FpOyDzqZlUisk
	n+dIXw6SAF/gnAlbAsoxq3MgobDO13L+eeoA==
X-Received: by 2002:a05:620a:2a08:b0:787:76dc:652e with SMTP id o8-20020a05620a2a0800b0078776dc652emr3058693qkp.33.1709055314777;
        Tue, 27 Feb 2024 09:35:14 -0800 (PST)
X-Received: by 2002:a05:620a:2a08:b0:787:76dc:652e with SMTP id o8-20020a05620a2a0800b0078776dc652emr3058626qkp.33.1709055314320;
        Tue, 27 Feb 2024 09:35:14 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.9] (ip-109-43-178-133.web.vodafone.de. [109.43.178.133])
        by smtp.gmail.com with ESMTPSA id y22-20020a05620a09d600b00787a02d31d3sm3792506qky.44.2024.02.27.09.35.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 09:35:14 -0800 (PST)
Message-ID: <731bb838-83be-4057-aa76-4107d45f28e8@redhat.com>
Date: Tue, 27 Feb 2024 18:35:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/29] tests/vm: update openbsd image to 7.4
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-arm@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Michael Rolnik <mrolnik@gmail.com>, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Song Gao <gaosong@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-s390x@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Brad Smith <brad@comstyle.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, John Snow
 <jsnow@redhat.com>, Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brian Cain <bcain@quicinc.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, qemu-riscv@nongnu.org, Bin Meng
 <bin.meng@windriver.com>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>, Weiwei Li <liwei1518@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20240227144335.1196131-1-alex.bennee@linaro.org>
 <20240227144335.1196131-5-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240227144335.1196131-5-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: GZE+lNmDHsKW

On 27/02/2024 15.43, Alex Bennée wrote:
> The old links are dead so even if we have the ISO cached we can't
> finish the install. Update to the current stable and tweak the install
> strings.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2192
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Tested-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/vm/openbsd | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)

FWIW, changes looks sane, so:
Reviewed-by: Thomas Huth <thuth@redhat.com>

