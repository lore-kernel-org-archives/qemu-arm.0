Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp2821510ejb;
        Tue, 30 Apr 2024 02:58:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUPwkgR6TgjalmKpSKui7dHGvEHSwpEgyHOcbl597iwVSzzHiiqqINqLRY0SG4WzUZKFMG+ftxBgH8IQFBXXfJUdwWHPjUo
X-Google-Smtp-Source: AGHT+IG2Th2yd10yPFeayUD0l0cLNPShZxA5DrmXPBPzAbsmGFgKwro3dWZCZiE2UrOuMDBcTqa9
X-Received: by 2002:a05:620a:24d0:b0:790:f3de:8603 with SMTP id m16-20020a05620a24d000b00790f3de8603mr8208359qkn.73.1714471131966;
        Tue, 30 Apr 2024 02:58:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714471131; cv=none;
        d=google.com; s=arc-20160816;
        b=d05n0CJPM+Zwa9It5Bfs20hxTw9ga+POWaZq1sD+MhNeZ7X/8l5Vm3oL6BXqEQITxc
         ecFqOD5gvJjKwbiU4oJgQ/nF2f5lhzolIFtObWUs8Pz/0p3lSR9duNQRc6KE1a8M/27/
         LAFOVbjTfC8ZZynyhFC1UKPSOuIaeh3wnpZlF3652rarJTFRepI1yBJkPNatk+NcV8VA
         gGZs023oDySe5fB452ifSFhxe6L9JnxBG51JvWZ8BM5bj9FpiqLqhaySRydny1Ou90fX
         dOww+2S3ESBLeNtYxkjVLnETT3QEKGT89NF9L2aexuhsNq9wFAIpoC1aArFYkJA1cfT6
         w93g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6cBnzzzlDIOctZ9G2uIAPDYD23rGj/55LiEytbG1k+4=;
        fh=SzJ9IetYR1Ajh6xbGc/uBmkezeNId4PU0+yo0KFfGxU=;
        b=X2f2mK1b3JkJXOgVexVQoqpHhWOp0xDlZOVRfpLrZFbNUIqawL6UbfqGftb7y2Oef5
         nwMxi6lMstjIkh15niQulTLoONm1CLlfNnZj/+LMVkU4TlmD3yyKBXOlMN023R6HG+aY
         bqE2Mv6no5rb2ltpej0WIAJDmJvooSzTcHVUbkqpeVgkXK+HYyO0XS1rsEglGnZYvFV4
         6+liibM40zA9HgIvYx6XCq2zkP4IVqIZrtVRZrVh9nyxZsnGxQqTiKFPVaRt0d5jUBaW
         pcNcYJeEEII1faBaIQbT4faG9/ICYsTAodwUHk+ptrUnzj9JY9ibMq7+gv/k7wcig57+
         0Hpg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Wy2FzFTW;
       spf=pass (google.com: domain of clegoate@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=clegoate@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <clegoate@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 5-20020a05620a048500b00790f6ef8617si3961087qkr.210.2024.04.30.02.58.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 02:58:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of clegoate@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Wy2FzFTW;
       spf=pass (google.com: domain of clegoate@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=clegoate@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714471131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6cBnzzzlDIOctZ9G2uIAPDYD23rGj/55LiEytbG1k+4=;
	b=Wy2FzFTWbeNmPN9aFRKzTKbyxQI0fZsPbYIZinj8Jsmu+Zdmzf08D899BcJzDUy/QbZZZc
	vPvc5c7zTm9bFXNI7pJRAu3q1SgSP21OJH2ZIUuGZZf5N4+cd1/eVnFXo/mqg4bHd9wJql
	MDiEU5VcUFCsNQnN0MQ6w3VmKLBsJzQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-0lrw_hhYNZqTeiBm7ql9CQ-1; Tue, 30 Apr 2024 05:58:48 -0400
X-MC-Unique: 0lrw_hhYNZqTeiBm7ql9CQ-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5729ec37366so209370a12.0
        for <alex.bennee@linaro.org>; Tue, 30 Apr 2024 02:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714471127; x=1715075927;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6cBnzzzlDIOctZ9G2uIAPDYD23rGj/55LiEytbG1k+4=;
        b=H8R9HlCx2y7yjQkZ0BpmiLbPYGQeIL5WQoqca6D9osldjYtUfP/q34G1WRC40uc/Sq
         /0bt/0iD9FePpBz/PypXbMEXgan8AGprsMv5C0HvVZsXxHIPQoFVkvMeic5PEZayC2PD
         J84lD8Ykk/DBn9K5GVO5hikN3stGaxbCWqAxTDEM2dTEx3h78lD4LHtyO3fV8jZtUbqK
         ge752p6sqhnH7XHjDsUDTCz41+q7ISe4X6iT74qhYNERIM/MeEkMarSHFtLxx35HfwAU
         KyB5XTie24cuBAKjNHXve2SeiYJZfbzpBMKvNZ9tEqBgFaXhyoQppIgyJh+LIV1U29gD
         Uy+w==
X-Forwarded-Encrypted: i=1; AJvYcCUNNs0NQBXAC+xuiJDMzRYcveUYCFIfTxDIdwrqYHn5XVH7uvSrjuDzkhvdx//22acZNQW+yOGcOQutoIZq+pU5y0RnDeTf
X-Gm-Message-State: AOJu0Yy2HFQCUkEn15aMv8mEzaMgW7B4DvTDJquffkIWlg50ak5T5Y3T
	s345ee0zlEcSK4QxRNm3Seh6Z6lnfZz+N9Pk438D/LaBdBPwk8RkDXVcrNxxeZSH8Gm6tcI9FED
	eYGf6NGRmllp2URi3UJW2lg0KlcZkpiT2bQ4NVmFwzXhZ+kBq4tpQ8A==
X-Received: by 2002:a50:c314:0:b0:56e:232b:95cd with SMTP id a20-20020a50c314000000b0056e232b95cdmr7831940edb.41.1714471127658;
        Tue, 30 Apr 2024 02:58:47 -0700 (PDT)
X-Received: by 2002:a50:c314:0:b0:56e:232b:95cd with SMTP id a20-20020a50c314000000b0056e232b95cdmr7831927edb.41.1714471127361;
        Tue, 30 Apr 2024 02:58:47 -0700 (PDT)
Return-Path: <clegoate@redhat.com>
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c? ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
        by smtp.gmail.com with ESMTPSA id i32-20020a0564020f2000b005723bcad44bsm6098909eda.41.2024.04.30.02.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 02:58:46 -0700 (PDT)
Message-ID: <53cf0994-4798-4b53-a706-77f47cb136bd@redhat.com>
Date: Tue, 30 Apr 2024 11:58:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/about: Automatically deprecate versioned machine
 types older than 6 years
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 devel@lists.libvirt.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>
References: <20240430064529.411699-1-thuth@redhat.com>
 <ZjC9w0A_VQlsY46p@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clegoate@redhat.com>
In-Reply-To: <ZjC9w0A_VQlsY46p@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: FAQaHhgVP179

On 4/30/24 11:45, Daniel P. Berrangé wrote:
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
> If anyone thinks 6 years is not very long, consider that this implies
> QEMU will be maintaining *18* versions for each versioned machine type.
> 
> So across aarch64 'virt', x86 'pc' & 'q35', ppc 'spapr', s390x 'ccw',
> and m68k 'virt', that's upto 108 machines we're keeping ABI preserved
> for in the worst case...

We will probably have RISC-V machines to support also. Anyhow, 6 years
looks good to me.

Thanks,

C.

