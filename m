Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3137971ejb;
        Tue, 21 Feb 2023 02:56:35 -0800 (PST)
X-Google-Smtp-Source: AK7set8nCtPqmKl0I9LDRmEe9ohJGXuvK+yTdTBA9HYiWI/5WkHRQvH+pCbwB2v3kldWm+U79pwX
X-Received: by 2002:ac8:5cca:0:b0:3b9:bd05:bde1 with SMTP id s10-20020ac85cca000000b003b9bd05bde1mr19664716qta.8.1676976995107;
        Tue, 21 Feb 2023 02:56:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676976995; cv=none;
        d=google.com; s=arc-20160816;
        b=usaT3S8jUVIwpIqaooghUXs2uTldq+3LmqktGdycAeWwI6Pf1HALOBj4CVXCdmxq3K
         6T3GJlML1er256p0U5sscpLemAUPKymQ2whSpI9rSzCYjIUamBVU+sjug+kXX2h0sxcP
         ugVMfSseJbq0dHrdT+a5b2oIh0tPAVgWuWVY19jugCbU/bvshPGFBXgtMG8Ex540iwIG
         kKagzzf5rCoQJ5vw7CxTq3Qb9pGABX7PwBw1HDts8porpsP6QHSjHpdgXQkEHrBt4QCw
         m77xsNUg5xDWzdvaG65J6t8ddcylF9tYRtwnVCU0BPDJDJmdy/Lu6NXo8G0jY6VGTgw4
         g9eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=RUy2vNlZo5xe12js8pkQZQ6aHs7wr2RYdU2j7igV2aQ=;
        b=HEy9CsX1fgwMG7nDBLgI2jJvathGlov5BLfC0PR/6vcbZuyL1IaHehl4OebmnYc+sg
         /xaHuO1h3RspI+ZifT1+1V3NsTOCrT5AzGvYGuPe33KaxmihInIvemz3k43OQA7pd3L4
         rq22Oe/jxUYzKU7hpoSQhCY3Agt3qF24AJEsMexZJt5qdbE2LzjikrrnsnTJ1fPUfAsC
         JfcFMlZoNzYxzEwpbnr4DgycQUPe/mGB2DWYPVM1M+W8l6AS+XsC3JllGCTG/TG/AWue
         GyRIHoylu57Ceow5HhdxWi8Im9jfqmP+OAKG1QvWHGGr4P5CGpO8BxiOlxSlFKEZMGeK
         VcuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GFNsPjiA;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id a6-20020ac86106000000b003b85beb77d0si2856235qtm.462.2023.02.21.02.56.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 02:56:35 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GFNsPjiA;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676976994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RUy2vNlZo5xe12js8pkQZQ6aHs7wr2RYdU2j7igV2aQ=;
	b=GFNsPjiAcl9yGoJJnd0Zi7/pdOo5ZvtqXbRLXwxO/CXizz9/F+NkU3ictfkHoyWcxF4ns8
	uged9UFH2nRr6CVa7tZ94EZAENqevyHB6CV3uGNKet8tMD4PW/lm9/XJrPF9AnnyubW3bG
	k8Ieye96Bt1E4piWklobhZC/L0XYQz8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-153-yXOgKTezOuGd8mzSjCNwLw-1; Tue, 21 Feb 2023 05:56:32 -0500
X-MC-Unique: yXOgKTezOuGd8mzSjCNwLw-1
Received: by mail-wm1-f70.google.com with SMTP id l20-20020a05600c1d1400b003e10d3e1c23so1815153wms.1
        for <alex.bennee@linaro.org>; Tue, 21 Feb 2023 02:56:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RUy2vNlZo5xe12js8pkQZQ6aHs7wr2RYdU2j7igV2aQ=;
        b=gPceLsCY9XavrLnfPS48zeFA51MtbMSFNeoZ1zgyyuKPB/Y56CC7TjGEiTOhfnClNM
         k+jSTRhdQo0zVHC5beKWDM07ZE53McMzdUhrg6ZvOC63UICLeMalqRcljcZCH6spMaVh
         61NDVEzMv34Y8dbtItENiISbC6Wej0TCBKKk0HLjg/7hMcO/9vgKdyWArBMyc1XZxkcO
         QhZvKjHqblp7byMxlxKiWL4DV9fVQS+P1O4KHurdcWsiN+/rQ5oUhA0NU+5JnoSK6F7O
         iJ5shx60dQGpnWn6QViexELb9J+OOo7vHdCWxG4XKpGpHVaFgDSQ1xtEIHCgzubDW+1R
         qaVA==
X-Gm-Message-State: AO0yUKWemNarEy84ErDBIA37g+7pJmVf4JG3iRwC37P4qNiIv45xZcY2
	K2VmFiJIQx5pQmw5av5p1n8aCfR7gD/rIomrVXLKQEgjQ1Q8/C6Rtj4mjKE+DouGt91+nU7xSOP
	jRx0a+AK+zW5NvCq3aJ7W5YUv2NnTq2nbSLE36DZOPN5e7Gh/peimdgPQl7QGsIlI36ELteqR
X-Received: by 2002:adf:df0d:0:b0:2c6:b7e:e4c0 with SMTP id y13-20020adfdf0d000000b002c60b7ee4c0mr2943914wrl.28.1676976991486;
        Tue, 21 Feb 2023 02:56:31 -0800 (PST)
X-Received: by 2002:adf:df0d:0:b0:2c6:b7e:e4c0 with SMTP id y13-20020adfdf0d000000b002c60b7ee4c0mr2943869wrl.28.1676976991185;
        Tue, 21 Feb 2023 02:56:31 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id g17-20020a5d6991000000b002c54911f50bsm4849517wru.84.2023.02.21.02.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 02:56:30 -0800 (PST)
Message-ID: <6b363773-5797-ccb8-1089-0bb924705126@redhat.com>
Date: Tue, 21 Feb 2023 11:56:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 09/14] testing: update ubuntu2004 to ubuntu2204
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Bandan Das <bsd@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, qemu-block@nongnu.org,
 Beraldo Leal <bleal@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-arm@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Alexander Bulekov
 <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20230221094558.2864616-1-alex.bennee@linaro.org>
 <20230221094558.2864616-10-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230221094558.2864616-10-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: RUX6DhtgYEG7

On 21/02/2023 10.45, Alex Bennée wrote:
> The 22.04 LTS release has been out for almost a year now so its time
> to update all the remaining images to the current LTS. We can also
> drop some hacks we need for older clang TSAN support.
> 
> We will keep the ubuntu2004 container around for those who wish to
> test builds on the currently still supported baseline.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: John Snow <jsnow@redhat.com>

Reviewed-by: Thomas Huth <thuth@redhat.com>
