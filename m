Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp30210lfk;
        Fri, 3 Dec 2021 01:15:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKEZr+xZeDX05cwckhkYxbUt/yJQ53/wpqHdfkbLK4ktsEeGD9y7GlBji60MDI3bojpxz/
X-Received: by 2002:a0c:e98a:: with SMTP id z10mr18061489qvn.43.1638522909521;
        Fri, 03 Dec 2021 01:15:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638522909; cv=none;
        d=google.com; s=arc-20160816;
        b=zNSGUkQRing2KkOGzgrjt18ZnrSXHnlBwt/IYnvGiQJLY9xAlbuHg+QgwEjfKotBg6
         xhsYRqjwxW4tEoK8UCWAK54vm0LGjL1c7ZJG+GWTenPWfvHdmTufAgR3PThp+jn9bA0s
         Sr+ryWvbtP39xQZQUn4Si38BmlGywyS8ZfYGiy2d/1t0yErKnSfeLWXSM1TQum7hK6Dt
         VY1GC5zY3NGIS8rVSdEIXXIRArJuDCnsrmo4lp/ykSstVc9Id9gfPnDcZt9KMDN85gTs
         fmUB4iHvYyep5dgsxxRvWMJFTOFfBVrXYuWVBojSV9s55uL4Jga2Fn7z0Kk3QBJCZYjy
         ZDcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=3nc4Ey+X4kWRDPDWq5nVY1VbND+pTe+vz1ZtHVDIYUk=;
        b=uwK9K30drYUcfLh6AOjOqKUqlUwoE0yM+jTWblkzZYtbVSEannI+8/wYcCAoETW8ta
         OSi4r9bPF4GmB2PSQeK2rG3ru6I2Io3QimSS2/1MxOdrE0lXK54Z4xf/UdbOSvH6f//U
         RzszA/2YPOoUa4WdNvAD2E7fisuohM42xfFSfWbjw1bkQUqhFfggKicPU/PRPk1divuB
         0jhgfm6pyZgELXh/sKFyjOrpqpcVq9B0gEwGaM3v96ZbgArtB5PcjDLaCYEX0G02HR2z
         dH+JMiaJGuxraXa1nTQ15LoNa7BFj6sMqDAYJ+VrPE/YNMEvk6OvTmOxuYYJ8CWuJwLM
         sUeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pp6aOdl7;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id s15si2547349qvs.399.2021.12.03.01.15.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Dec 2021 01:15:09 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pp6aOdl7;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638522909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3nc4Ey+X4kWRDPDWq5nVY1VbND+pTe+vz1ZtHVDIYUk=;
	b=Pp6aOdl7hyC8M8F8mZK7cdaXL8g8QxtEBngB3t95P2uey3RfQZCQCuYCytdj5iHAGpdNn0
	60cZALlkFSbtV3N78YcLu4lo0GnrXYDfKwTqz0dP/G/t87JrkJTgnGoUZeVFWjcvuz7Xvp
	AkTWl8apqQBlV4pPCmiGpP1YN3QlR/Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-vBvF2hwtOg24YaXs-L990Q-1; Fri, 03 Dec 2021 04:15:06 -0500
X-MC-Unique: vBvF2hwtOg24YaXs-L990Q-1
Received: by mail-wr1-f69.google.com with SMTP id h13-20020adfa4cd000000b001883fd029e8so452678wrb.11
        for <alex.bennee@linaro.org>; Fri, 03 Dec 2021 01:15:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3nc4Ey+X4kWRDPDWq5nVY1VbND+pTe+vz1ZtHVDIYUk=;
        b=wlvnjLB2Mn0PqbeAMhyucrKMoNis17Q4ugX456oyec+2yDHsHuDJbvLjlGYl3zuSQI
         f/Mwd0BfRZzJXAI0w3FdOb3x8z8Wwo0zveQ5jiALylTWxdZAnkOSD7obeuNLxR57E2eR
         f0dLsqZk21Q8tU6exSD5UdZpTmYpdl39+h7DYtPWTkAcXnGLBCx5KSv/2oL+2UKA0560
         4OdfNc1U/e0BodiJkdvK/BSxWx2swoKoyvk3XDdeyVym2CKoKaH2wI3mVGzEOHeA+8CJ
         1D9FoSV63uWIIC+YMwQWPPNR1kVwPiovYqEAtMi0JuUvoA5uFAmuiiTnz3GUF9homu57
         RbMg==
X-Gm-Message-State: AOAM533U/I8uJq+z46Y60AdaQ4PkVPVvL9ZjudHfON2JNZ+pxXNAakXD
	q9aWQ5aLvmJcLxJtOZ6YNpXAMEzcPcrFukMKKUFkBMxJ0LL4hMPfB537YVcGr9ej5eQxz9k1Hbp
	CG91/d8F79Iz7x7nvgCscvHJ9RijM7jqtl8luZu8/1Kp8FYxlIpcS6W7MCKT/pZqw
X-Received: by 2002:a05:600c:3b28:: with SMTP id m40mr13509621wms.100.1638522905728;
        Fri, 03 Dec 2021 01:15:05 -0800 (PST)
X-Received: by 2002:a05:600c:3b28:: with SMTP id m40mr13509581wms.100.1638522905487;
        Fri, 03 Dec 2021 01:15:05 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id i17sm2157588wmq.48.2021.12.03.01.15.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Dec 2021 01:15:05 -0800 (PST)
Message-ID: <2163c5df-0068-b66d-18d1-3b3cf72aa805@redhat.com>
Date: Fri, 3 Dec 2021 10:15:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [kvm-unit-tests PATCH v9 4/9] lib: add isaac prng library from
 CCAN
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 pbonzini@redhat.com, drjones@redhat.com
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 christoffer.dall@arm.com, maz@kernel.org,
 "Timothy B . Terriberry" <tterribe@xiph.org>
References: <20211202115352.951548-1-alex.bennee@linaro.org>
 <20211202115352.951548-5-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211202115352.951548-5-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: h1SqmXBxoJoA

On 02/12/2021 12.53, Alex Bennée wrote:
> It's often useful to introduce some sort of random variation when
> testing several racing CPU conditions. Instead of each test implementing
> some half-arsed PRNG bring in a a decent one which has good statistical
> randomness. Obviously it is deterministic for a given seed value which
> is likely the behaviour you want.
> 
> I've pulled in the ISAAC library from CCAN:
> 
>      http://ccodearchive.net/info/isaac.html
> 
> I shaved off the float related stuff which is less useful for unit
> testing and re-indented to fit the style. The original license was
> CC0 (Public Domain) which is compatible with the LGPL v2 of
> kvm-unit-tests.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> CC: Timothy B. Terriberry <tterribe@xiph.org>
> Acked-by: Andrew Jones <drjones@redhat.com>
> Message-Id: <20211118184650.661575-6-alex.bennee@linaro.org>
> ---
>   arm/Makefile.common |   1 +
>   lib/prng.h          |  82 ++++++++++++++++++++++
>   lib/prng.c          | 162 ++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 245 insertions(+)
>   create mode 100644 lib/prng.h
>   create mode 100644 lib/prng.c
Acked-by: Thomas Huth <thuth@redhat.com>
