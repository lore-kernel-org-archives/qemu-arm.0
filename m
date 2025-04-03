Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4291338njd;
        Thu, 3 Apr 2025 11:00:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUgaKMB3TP5YoW6BnbhEj2C5XpLvOxHMIBTFrd/6p+ZBjs1aqBCxL+OmSE/+GzrQ8+qNp+zo22JE5H2vA==@linaro.org
X-Google-Smtp-Source: AGHT+IGv+Xp6OTgkzDlgPsCxzstL3L3QCvAcNOIXoTakNGZOSQrHyZqthnkKhx1tmaJkaIU5XQp9
X-Received: by 2002:a05:690c:4493:b0:6fd:3727:6471 with SMTP id 00721157ae682-703e14f803fmr6016587b3.6.1743703241356;
        Thu, 03 Apr 2025 11:00:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743703241; cv=none;
        d=google.com; s=arc-20240605;
        b=S0aHxIpFeBcH9tjtjq1jGnJiM2mHc6u8l6bJ3x8zYmYSbQYw5j2G4opCvyxnCGF0BS
         P1S4+P0bWJJZRldIrExQZUqmjm2zDU49ZRLFzEqwpqAdNPbRCB4uYjvuNRhgzxqA3j19
         F4vQ4Rj45MYaSMjmlG9SMlCMlnc3L2IJKu9SIj5FNGCVgUhrQeJxhrM9Pex5C0NBRutg
         5zTJ/f/0y5+L0pB8MAXCGKlV6fDlTW8efvmRSwQXpsglMt+9YHv4Zch6BTzUqUluirzt
         lr8eO7whtPNxkN7thMB4WphwR9+19e94hM3OCFkhaWARtkfCnFb/wazyQcrQ8IMZfhIA
         zi4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=tDhXga8I+eW/Cyg6XZ6X7k/EkQpsb8wB/HingNiAwaM=;
        fh=aRLuetP9cpDpbYc7f15qmT94D6S+QNK0gjSYxdVoGwQ=;
        b=frfJJjnGZnPKceuxya40TpYgDIAgPo4ZkTsdjH9xAJPm5urdINOpQnnd66rFUY9z4i
         vmbwyLZ3uL5b2K4JVnfcHLsrb8idofBtVQbc1hPSC1cShvv7EdChutKQVzfq5YZGyUXB
         BgjwOMFrzmOvZxLv3Vp5eTsMbE+mq0eiXuEjLpoM9JtmBFTKU8wRQFllfAtgDHwoON81
         8kZ1Tr8g8WTBbFCJc/BbaRI73LCTPUHVz2GJs3mBLPriWwpXjTHvtVzIdPcPE0PhIIGN
         HVrIhlmYW1h+nrZ73TLEOVUw6UZvZ5LH2tzfQKnf6p0VmH7e63CGQ0nEO6dZAIy8guOE
         /34w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KK3IGbld;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 00721157ae682-703d1e43077si24597667b3.72.2025.04.03.11.00.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 11:00:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KK3IGbld;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743703240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tDhXga8I+eW/Cyg6XZ6X7k/EkQpsb8wB/HingNiAwaM=;
	b=KK3IGbldhDioMDE2jYDJS0LuzXn11BrR00KHD3kxjFXGHzYuDDbqvGQfAC4fX6G48Dh5v3
	phnMWIBDfjRfTBInZ8I5THLvbTIIyZH4pOZ7c8BhIZA8WypCK+7DGMnZfMdEzYIXqoKOeJ
	kowaCqktvXgNu6WK74prI75AjOlLmXY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-c5pgtNx1PtKFnU9ngIidug-1; Thu, 03 Apr 2025 14:00:38 -0400
X-MC-Unique: c5pgtNx1PtKFnU9ngIidug-1
X-Mimecast-MFC-AGG-ID: c5pgtNx1PtKFnU9ngIidug_1743703237
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43e9a3d2977so8255945e9.1
        for <alex.bennee@linaro.org>; Thu, 03 Apr 2025 11:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743703236; x=1744308036;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDhXga8I+eW/Cyg6XZ6X7k/EkQpsb8wB/HingNiAwaM=;
        b=ViQJ49Usz0qST3ATtc/o6myrl1Q4ZlTuVuI2UKD4Os0J52jU6mPi7r7O1l4pX06vtI
         ndN84OsPeyOtao8kjFHUxWVRX5tuQCHJCFAxMf4CC2k59UkN/Jj1Xxr6K08QTK/4s3N4
         zQVQnUapg5O0rxphuw0QnlLt0OrCu0ndI+m/Y+N0qM8lasBKysWRK/Em6loqUc9SYDiW
         vwswuomc052g+BDv9XpTpqtk8ib4rcrtZtqQaoB1Jd05tNdqLo2lRwJldVHnKNdBkyhC
         F1C3BMrlkjPVefdo/9t/+639O3U3x1/UhplW7pqtYZt9fONqnS4N13ob1IpDARvYlMy0
         cglA==
X-Forwarded-Encrypted: i=1; AJvYcCWtbrWosE15+7so+EqMl7HZq4h/nYheQvkpEz7CtGlRKScVZ1V7hOzypsdzxjbnDPxQ8VRrGqERSVbPqA==@linaro.org
X-Gm-Message-State: AOJu0YygPwwLqqVnM9YmK8qPxevOO+2XBD5vZMmRUr9/TMLRCTRC5rEC
	zZhueWbGFdl/DPLVcVdMbsyyFnFlAIbi2BOR6VNdslAxDHcfVr7A23lQ3YiMtw4wxg3btqZlipy
	kJHBG6Ta3j63A7z8wNj8J3Iuemh9yXWDcplW9gienHJlRphIvhdb5hA==
X-Gm-Gg: ASbGncv4PazpAUzoe5qy/YS8m/ZH6rdmKgwAer1qaeLyb5ucD4js4DRMgeV+xzU7Fl3
	tUiiY5wih9uI5/E0V1z9GBJNw+HtHmw+KmTdJk59onqWnIRJ+JpCBwrBbVeapA35hd7Dei4aDl3
	rgfey/4Y0MKSFOUFF8c81xZ9jnbZ/QpLU0/na/2gk9nh8ImWJgVN9ydAzC/pyP+0qLt/VFVacp/
	mXEas13qfj+cjwUwxzu2zoy8LoWWc3WkVeLuHOPz24F04/gQkEwGhkfzAvNYxdz9bX8se6fJ/Oi
	fhYx4Efu14+mnc2P17oOQMw9j2MhrAcLuiy6L3F6kTQv
X-Received: by 2002:a05:6000:1acb:b0:390:f6aa:4e7c with SMTP id ffacd0b85a97d-39cba93534emr210744f8f.28.1743703236559;
        Thu, 03 Apr 2025 11:00:36 -0700 (PDT)
X-Received: by 2002:a05:6000:1acb:b0:390:f6aa:4e7c with SMTP id ffacd0b85a97d-39cba93534emr210718f8f.28.1743703236189;
        Thu, 03 Apr 2025 11:00:36 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-51-76.web.vodafone.de. [109.42.51.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301ba2dfsm2396422f8f.60.2025.04.03.11.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 11:00:35 -0700 (PDT)
Message-ID: <4bd6f358-3de7-44f9-9cf2-7c2086a87fca@redhat.com>
Date: Thu, 3 Apr 2025 20:00:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 v2 04/14] tests/qtest: Skip Aarch64 VMapple
 machine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Gustavo Romero <gustavo.romero@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Udo Steinberg <udo@hypervisor.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>
References: <20250403151829.44858-1-philmd@linaro.org>
 <20250403151829.44858-5-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250403151829.44858-5-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: O0rX9qWaqedAS_JLWza113mxVHJReb8YJ4nfLebyU7M_1743703237
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: mixkt7yNnPqK

On 03/04/2025 17.18, Philippe Mathieu-Daudé wrote:
> First, the VMapple machine only works with the ARM 'host' CPU
> type, which isn't accepted for QTest:
> 
>    $ qemu-system-aarch64 -M vmapple -accel qtest
>    qemu-system-aarch64: The 'host' CPU type can only be used with KVM or HVF
> 
> Second, the QTest framework expects machines to be createable
> without specifying optional arguments, however the VMapple
> machine requires few of them:
> 
>    $ qemu-system-aarch64 -M vmapple -accel qtest
>    qemu-system-aarch64: No firmware specified
> 
>    $ qemu-system-aarch64 -M vmapple -accel qtest -bios /dev/null
>    qemu-system-aarch64: No AUX device. Please specify one as pflash drive.
> 
> Restrict this machine with QTest so we can at least run check-qtest,
> otherwise we get:
> 
>    $ make check-qtest-aarch64
>    qemu-system-aarch64: The 'host' CPU type can only be used with KVM or HVF
>    Broken pipe
>    ../tests/qtest/libqtest.c:199: kill_qemu() tried to terminate QEMU process but encountered exit status 1 (expected 0)
>    ...
>     7/26 qemu:qtest+qtest-aarch64 / qtest-aarch64/test-hmp     ERROR      24.71s   killed by signal 6 SIGABRT
>     2/26 qemu:qtest+qtest-aarch64 / qtest-aarch64/qom-test     ERROR      71.23s   killed by signal 6 SIGABRT
> 
> Suggested-by: Fabiano Rosas <farosas@suse.de>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/qtest/libqtest.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 2750067861e..fad307d125a 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -1788,6 +1788,7 @@ void qtest_cb_for_every_machine(void (*cb)(const char *machine),
>           if (!strncmp("xenfv", machines[i].name, 5) ||
>               g_str_equal("xenpv", machines[i].name) ||
>               g_str_equal("xenpvh", machines[i].name) ||
> +            g_str_equal("vmapple", machines[i].name) ||
>               g_str_equal("nitro-enclave", machines[i].name)) {
>               continue;
>           }

Reviewed-by: Thomas Huth <thuth@redhat.com>
