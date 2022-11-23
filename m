Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp4039941ejx;
        Wed, 23 Nov 2022 02:03:48 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7rfGG9vt0/3uZgzzL4/8oZM+GgItKpUb7fgbnvYDutndK9FNbj54Dcm6nrke+VDGSvf0nr
X-Received: by 2002:ac8:7401:0:b0:3a5:310c:1cbf with SMTP id p1-20020ac87401000000b003a5310c1cbfmr10365567qtq.607.1669197828132;
        Wed, 23 Nov 2022 02:03:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669197828; cv=none;
        d=google.com; s=arc-20160816;
        b=XsUzJyY/jmM6VugJAUaT15Hs+SPawStvTcOpyzuJ123PtG9lJsThAMxKLywQEuoh1c
         NOa6nV64W80QVUfKaZ6lU59JFREYNChS5ASgsInndyamuZWxuOr6/L4mPOIy7JYMbZpH
         KSx04JiurWA+QiZcVy6bOdDk/LYX5F3olzpIq3FtdOnYjbPipWm1tqXCdliqIEPkpeYp
         V34xBLnNna1MZ+2F/XK/a/Rke+R2tl2480k7XLV+fwDsVYZLgnMepPhBcgowIF9ceJqp
         UzNbdalj/i4TFwkvDU40QVste7JP3mj7D07BqWrzO+w+5MwTys0lPVOkxu+XSleNFr4p
         geaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1g0mKQvhCpHnfnN34ZTyUbpWKMU8G1Dtpgz2dfM5pro=;
        b=xZCiXcbLpR+LLtA8Wc3gKdZZHlejBYYBVUHlVILfAIR49E909dv7YnQrLO02M0WIm4
         iBXsHFdLlPCR7JwK9iaKfA41l7sgN9OwLG4mmAypS3kZp2HxwmplCWUgjv783Ny9Pt3z
         vSCHMixKou8E87Lo4K5bMw+W9EXuQ6J+KmbOLeYUr3THweE183JG2HCJ+k2QwEg3Uoxc
         aPS6xg5C2YxSBUsBEJtjgqQyizgu62zYdgaAqNo4JlFogNY5EHGopOPXHogN2L+PWbPK
         XBkKtmc3y6peya9ca8hM5w8lbUSYW2sfchIB4aSgFGfJ0kgQlEKslqLtPbu47mnmiIti
         d/Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iP1vpDtm;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id cn13-20020a05622a248d00b00343a6e631c4si9739001qtb.764.2022.11.23.02.03.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 02:03:48 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iP1vpDtm;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669197827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1g0mKQvhCpHnfnN34ZTyUbpWKMU8G1Dtpgz2dfM5pro=;
	b=iP1vpDtmc+hTogZyY9Nq31AkMNdJWVMRk+19xOS0nyoQUQcHwYRAAdE+ZBofREhA6DszL/
	wOENobhQtzSYCmCxUzFx4Lam+6R7vf65QYxw0TCRMxkhiP0vIaqzHdUmalPIf/pn/bmF+f
	wIqim6ASfkqafQBK7gNqdmd0nQGtRpU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-423-hyaEPhLDN36lqNToego-VQ-1; Wed, 23 Nov 2022 05:03:46 -0500
X-MC-Unique: hyaEPhLDN36lqNToego-VQ-1
Received: by mail-wr1-f69.google.com with SMTP id o10-20020adfa10a000000b00241f603af8dso128786wro.11
        for <alex.bennee@linaro.org>; Wed, 23 Nov 2022 02:03:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1g0mKQvhCpHnfnN34ZTyUbpWKMU8G1Dtpgz2dfM5pro=;
        b=AeLlP/ImPHvHN/2qm3Tx/DASSOUKMhLGzj2TuyYaos+amLVbVu9jK9RoKIQENbBf/9
         PMx1fdMVP6MtBkln6hk3ZkdCyM7JxePcs62xHXHmBvBtfvvvU6KUzzejM5TcChb6PViN
         Q8gf35vQYg56TWEqR2ODkx/Cg2ENFhDtT7XCw0Lmwi9Im4u51F2EHaBRfuQ1a4wSPKaQ
         ovUzRnpe57CYB2AD6JYlnf68OK0/dZDdjpSYLrZuMR6VMkYMUxAgZjo/VazphgMIVw8j
         lYG0TaNwrYSbkgYcHrxxiymMjcKB+4EApg7uC1iFbSWm3BVL1JP+VLR7tzNvdfj2aWjO
         sBlQ==
X-Gm-Message-State: ANoB5pkfGjGTyku5Fdwqd6uuxOeXkifP8P3/m1C6yKVKbgT6qVpLypB+
	CxFhpOcHZiExnTd+3ud0cr0CqB32ESJwNUyrrv1JjukEzrOPDQGDmdYASl/aCnV3jg2zI1cFJQJ
	wlVRHfm5cwxv4ynfy7sYZGStf+LryvY3t/jQodoKmC41D7noxZcvTG+iZx2j144WH
X-Received: by 2002:adf:d08c:0:b0:236:783e:5947 with SMTP id y12-20020adfd08c000000b00236783e5947mr16537108wrh.168.1669197825432;
        Wed, 23 Nov 2022 02:03:45 -0800 (PST)
X-Received: by 2002:adf:d08c:0:b0:236:783e:5947 with SMTP id y12-20020adfd08c000000b00236783e5947mr16537081wrh.168.1669197825064;
        Wed, 23 Nov 2022 02:03:45 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.5] (ip-109-43-178-58.web.vodafone.de. [109.43.178.58])
        by smtp.gmail.com with ESMTPSA id e21-20020a05600c439500b003c6bd91caa5sm1659793wmn.17.2022.11.23.02.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 02:03:44 -0800 (PST)
Message-ID: <c2120c20-8105-bb78-8e11-6d7ab201f777@redhat.com>
Date: Wed, 23 Nov 2022 11:03:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH] tests/avocado: use new rootfs for orangepi test
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, philmd@linaro.org, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221118113309.1057790-1-alex.bennee@linaro.org>
 <0dc256bb-d163-66de-a448-389e52c908d3@redhat.com>
In-Reply-To: <0dc256bb-d163-66de-a448-389e52c908d3@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 1KJ/yp8cXyGy

On 18/11/2022 15.18, Thomas Huth wrote:
> On 18/11/2022 12.33, Alex Bennée wrote:
>> The old URL wasn't stable. I suspect the current URL will only be
>> stable for a few months so maybe we need another strategy for hosting
>> rootfs snapshots?
> 
> Looking at 
> http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/ 
> there are only images for the very last month available - so the new URL 
> will likely be invalid in one month already. That's not usable. I think 
> you've got to find another solution or remove the test.

Looking at that folder again, it seems there wasn't any more change within 
the last week ... so maybe it's not rotating so fast as I was thinking 
initially ... thus I guess we could give the patch a try, and if the current 
image finally disappears again, we still can think of a different solution.

Reviewed-by: Thomas Huth <thuth@redhat.com>


