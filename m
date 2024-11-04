Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2105803njc;
        Mon, 4 Nov 2024 05:33:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWGm6P3PTCAVTl9ycsUclcIa0kZlXWYrTAOX5B7sutM2TM02a8q9V5gm7MheRIYXmEKwzmPnkgAMckqAQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEXxkXPBDx+cUwD95XTNC3fR4ALDFBcGxXcUIm8B4OEf8jYQxtGHphUT9F1ZVph6kkT71Gb
X-Received: by 2002:a05:6122:1784:b0:50a:cb38:31d5 with SMTP id 71dfb90a1353d-512275606cfmr8262720e0c.12.1730727226481;
        Mon, 04 Nov 2024 05:33:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730727226; cv=none;
        d=google.com; s=arc-20240605;
        b=gfpaTOOJwBaUhZ7107NN/+LHSCcIqUPfTORcuypajx+5kBDBu5bWe+sG3vdkuTTFha
         rUGAdT95yo3Xcu3OMAKcMAmmd0LtQMDbKkUSwFGn1qJqGHmgEV9yrK5Uch+d+Cz58QY9
         G9d2277dSr3zQULnKlF4qE6WI8rNroWuNGcQm1OJW2IHbX174RgQ432hQ7aQDZpCMzdv
         y66DJciapVYAWUrFgbSJUOh/885h3XbW4wzlrRfIB3HNv+bHu+OgpoHVaAOyPJcaPTby
         6abWBBHLEWWb15ftsMXPBQoAN1DthM6b6A+yHJX9fCwUec2XA/Cl0saAHsw6UqQsvaXK
         zE2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=bsKR/ZbSwcHqsurNqiuF+M7XrV5jICI7Kt7LjPLlYkQ=;
        fh=u3iconJjuTyYVzaOv0ERZQXfW1/PLQRYrGPAnUPtfWI=;
        b=Jd6KnmkmgkXxY8Zzblq5fOKGKEUwmB5IbUSNbJnhj5+28fU7IWFmNTxsPBQ52hqeNI
         l4+pciVplkYxwIde429cSLh19nrxfQ389DwwVlzIvp0ORj3c6tlNY3pVFGFBzHdyJgZs
         qOtHah3rHYKNqLW/2CFCDlEQ9G4xgggfjWCrx5bz3HiiF7MkPHDAL5WkEB275BJhKt55
         OP9Gk/4sNTd54e98SD4NTClZCkVHzMAzR88Bk+nCSi+GPoeSJH7t9/qi5tBrc7yw9N2q
         WfCLsj3jW+YgYq/GdU90B6uhSRxrwbJBu7CxHSYnbmevR/dkcp4p+QbHucCE93AaePbW
         LB4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d6UgYyCB;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5139ccffcb3si769199e0c.290.2024.11.04.05.33.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 05:33:46 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d6UgYyCB;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730727226;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bsKR/ZbSwcHqsurNqiuF+M7XrV5jICI7Kt7LjPLlYkQ=;
	b=d6UgYyCBG/mBxH1rpB44hl2g7x5WI4UsMblNyPo+vjEsZkj0urTvMILBTuxLYPbtA9+ktW
	BywHo5iOC7D2604BWytoEZv1BnyrgvmeJobDEmAbPOhBFrd/ws9T/O8/w8mi9bSbmRzWL9
	11RUFZTQr76LxDzOj4UMvGKKmtu9K38=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-F9X1kR_TPnaPTxLOAtf2_Q-1; Mon, 04 Nov 2024 08:33:45 -0500
X-MC-Unique: F9X1kR_TPnaPTxLOAtf2_Q-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-37d4af408dcso1955683f8f.0
        for <alex.bennee@linaro.org>; Mon, 04 Nov 2024 05:33:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730727224; x=1731332024;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bsKR/ZbSwcHqsurNqiuF+M7XrV5jICI7Kt7LjPLlYkQ=;
        b=PdTCWJfQPJsYhLkNOZO+N9X/PERlzYafS0MWJP+5cbVLj/+1cn60pFXx1WGLkIO2EH
         ryi9x32Sw8XTv5QDBOvDwjbyhHlVt2vAeRY6YcHD5N74X5NrMhC/SDv0+KtYbe+Bn7B6
         9fNIj3U+N+Bny4YbLGArwCD8/ttiEMKQ9ggor4cPSrNBchjcHjcl0XhHGhkJ8EFGms5j
         xG4niheYMkcgzvJFIivlYgTV9c+AUqooVNE+U9yCCpO+MstcP9ZCzadhfn78ElHJtENX
         lzvtWd8Md1wUZLz+51Cy5kI43vDkiNvnJMqXFMOkrrZRUoTExv84kKbLdM8X9Xub4NuV
         nuVg==
X-Forwarded-Encrypted: i=1; AJvYcCVvbaowDJ4DG8qazN82ZI6PzORBXsUaYZtmJ34GbDWeeaBqEm1Q9i7i25VGmCQ6/RCiVNPUPCpU2NDGJg==@linaro.org
X-Gm-Message-State: AOJu0YzQ8/+iaxb7EXgxMygFw0sz6gZbOEO51eeou+j5gPbt/DeKWhLL
	/tSjobH8bctpCTxvr2hSseOHCtc2DbjRN87lH+DMOpkJ+DNxVmOE4Li2xaW+3SFAsiDe9nCpUSk
	D0KlP1RbABFMiawUA6wGw7zSclrq9gXLSc5w0mV9oauFiqPsrxAkRRw==
X-Received: by 2002:a5d:4cd0:0:b0:376:37e:2729 with SMTP id ffacd0b85a97d-3806115ae83mr21401259f8f.31.1730727223772;
        Mon, 04 Nov 2024 05:33:43 -0800 (PST)
X-Received: by 2002:a5d:4cd0:0:b0:376:37e:2729 with SMTP id ffacd0b85a97d-3806115ae83mr21401234f8f.31.1730727223376;
        Mon, 04 Nov 2024 05:33:43 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d49dfsm13267277f8f.46.2024.11.04.05.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 05:33:42 -0800 (PST)
Message-ID: <f950f884-f5f7-4985-8825-ed5f2a10509b@redhat.com>
Date: Mon, 4 Nov 2024 14:33:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC 14/21] arm/cpu: Add sysreg generation scripts
To: Marc Zyngier <maz@kernel.org>
Cc: eric.auger.pro@gmail.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-15-eric.auger@redhat.com>
 <86frok2jwg.wl-maz@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <86frok2jwg.wl-maz@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: POlHxJqDSu/q

Hi Marc,
On 10/25/24 19:05, Marc Zyngier wrote:
> On Fri, 25 Oct 2024 11:17:33 +0100,
> Eric Auger <eric.auger@redhat.com> wrote:
>> Introduce scripts that automate the generation of system register
>> definitions from a given linux source tree arch/arm64/tools/sysreg.
>>
>> Invocation of
>> ./update-aarch64-sysreg-code.sh $PATH_TO_LINUX_SOURCE_TREE
>> in scripts directory do generate 2 qemu files:
>> - target/arm/cpu-sysreg-properties.c
>> - target/arm/cpu-sysregs.h
>>
>> cpu-sysregs.h creates defined for all system registers.
>> However cpu-sysreg-properties.c only cares about feature ID registers.
>>
>> update-aarch64-sysreg-code.sh calls two awk scripts.
>> gen-cpu-sysreg-properties.awk is inherited from kernel
>> arch/arm64/tools/gen-sysreg.awk. All credits to Mark Rutland
>> the original author of this script.
Sorry for the delay. I was out of the office last week.
> You really want to be careful with this. Both the script and the
> source file describing the registers are submitted to regular outburst
> of churn (I'm currently sitting on such a series). You really have to
> be prepared to see things breaking on each import.
OK thank you for the warning. It is now understood we cannot fully rely
on them and checks should be done on each run.
>
> That file has also been known to contain annoying mistakes, as it is
> all written by hand.
>
> Ideally, this would be directly generated from the ARM XML, which is a
> public set of files. However, the license attached to this package
> strictly prohibits its use in QEMU (or anywhere else). One day...
;-)

Eric
>
> Thanks,
>
> 	M.
>
