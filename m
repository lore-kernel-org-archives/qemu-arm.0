Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp191181njb;
        Tue, 11 Feb 2025 01:23:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX1i5sBkZfwqFpxCx1YpNOnKxzjTB05SF8Oq3x/gmUs9FJo07hOtiE0XtqSfp9z5DD3CUFTrGR87+F6fA==@linaro.org
X-Google-Smtp-Source: AGHT+IES7gsY6CROtZrD5LVmIVr4uScXRPVphdjSbWUVUisOzPqPFARKUEeut++5jxE4jjr9uktd
X-Received: by 2002:a05:620a:6795:b0:7c0:5efd:1e2f with SMTP id af79cd13be357-7c05efd25c4mr716632885a.46.1739265799889;
        Tue, 11 Feb 2025 01:23:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739265799; cv=none;
        d=google.com; s=arc-20240605;
        b=AtvP307N3rtOaRdZgWar4i/I5atC8RWCDs8hXulnLZGZH+aEI/LDpLenVLbFZwVDeI
         gxYWZt4n8Ao7OY27cXYRv/KnlEhAZ+ENvOoBhzMmNJIQYLflsjDeWY9emlT9/83N2p87
         gOPgGQWJZwGKojgtsbIDc7Ia1BMe3LytvWJA3hsgJ205ImsJYcBl1Jwoqm43RgP2Bmys
         J50JpAFk+clez7ojT/uVGGG0lkF9l2FVxT8P4AhUIOZvu43e1tkzmz0rS+ORknCp4bd4
         mnEfVWjDKEQQk0rS/kPJsgBow54z29eaNcbVH9guku77pS6s2TpYzE8xNdGljLURynFv
         2ofw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sDQKIoAvPAsyL+4G8ZB827EKcWgYbqdiMzHDX46eOA0=;
        fh=bxnmGylb8ECHoyaCcKG+An/Sz3OAPW/1xNj5zgPtrFc=;
        b=KYGpH9lJU+ohfmrTvTToNYm5CEwe0fuuE2VvlHWO+hRJPAhN3JOemLJIewjwZCdQGd
         xfjY24bQAjIvnL96F1cjFKKg5LAJOknzKugARyRBL+gt/Aktkdi0XknAvonSj8gr4r3Q
         0o5jA3tY9s8ujSRSF8ordFMPSnWq/JoYxWm+p84m+T2FnAa0YSlszgnDys9xE8hPmyXB
         X1aOxcXj7O77j3Mv/RDlTfXPkx4lpLZiCggFih126gv8nsfaAv7eHTFBKQfpcFaE1sdy
         xi+fIw2xD8F85t6rDhHUqkeKY/aZx2QROFAwYPD8I0y5WVCfnivTwduL5nskn5Ih2lH1
         e1fw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rvmoePpH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041e0a2besi1134460085a.195.2025.02.11.01.23.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2025 01:23:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rvmoePpH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thmTg-0001rj-M7; Tue, 11 Feb 2025 04:22:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thmTe-0001rI-SH
 for qemu-arm@nongnu.org; Tue, 11 Feb 2025 04:22:46 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thmTZ-0002s1-8K
 for qemu-arm@nongnu.org; Tue, 11 Feb 2025 04:22:46 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-38dc33931d3so2302594f8f.1
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2025 01:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739265759; x=1739870559; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sDQKIoAvPAsyL+4G8ZB827EKcWgYbqdiMzHDX46eOA0=;
 b=rvmoePpHoPUaFAGkTbBQ7Ex39CazeBdqD0UAJoS2BY2ZXWMkESXzXgM/OEOszcXqX2
 7FPgoApOTRoWN26Slvln0K4+W0mYIW5pzbCvfZU/juviV2n8juuC5VsIwFB7anfge2YV
 ZP4BWPM3tao7+UC/bqm3h+HV9S6YEpty2etzswAwb7m3tLqeWfNJSjNEOKVFLRKCQK/W
 ha6PpjkV7bDAxhLXNqHAeT6YOU7x3DqYsUzZCuxBRpynpXtgImWTdmOege6Nlgfvi5ne
 R3hR+Kgm+L3t7bgX7NcCUSpE2I/4qCNFn2ftJFo/5BMwYsSfqggBFYiRxBpH4IIYSit8
 eTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739265759; x=1739870559;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sDQKIoAvPAsyL+4G8ZB827EKcWgYbqdiMzHDX46eOA0=;
 b=iRHHgSYJf0gDmGq9fCvTMCs4JB0MUNKYvt4r1OD0398gej2gvwgrtyxfaURdMcd8pd
 TwKopj8Hr+jzSbrLoVcZmVQ8/Auc6I3MGGDeR6fjavx1LuKlQMpv3u44FmD9C/etyLyI
 tZ92H5NFNxfT7bIz9U/R/1HMlXNROyg1dgwvReLZeFU+Be0lCAW0fgCA0OOH61VZSjpw
 /x25PQITjD7OwxZgoHT5NmE6PizKsHxa8HMOxnzWzAzHfIkyhuqCE9ynnanG32Os6p0Z
 RtrY2z4iCbiH4qQ4zyWaUMz+eEMCGl6m2U3nKI0THAdTnyR0vD1q5g/kNPduIT6AhzhI
 sn7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXrozG/m8jcNNn3fA9Kr/gGySmTkavRyr2vAZnz9auSvlFB29A14RxoGyaiJ02Em4qKDU5WMSJcQ==@nongnu.org
X-Gm-Message-State: AOJu0YwSiSZGqA/KHHnaDuwDs8LHLrKZ7DkEi1mIOCCdl+RMAMKx/moL
 jIkxXgWci6UTByXMuX79FNGRbE9BaBCGSXfHMjODHW+jh9+HzCoN45Awe84ryU0Ybwb7ncNZX1N
 P+iE=
X-Gm-Gg: ASbGnctky/9MTOHFDlXkJ4TcXnN/LYJUvtnuWyN7DqP/+ZzWVCBZUUVZgT0fhtTa+vb
 /nE7K8QppxIwjxEgqQo/QKg1wcCuUB9x/xpnjCQaH3dzMmL0IjZPDFNqKVeO7ZZlPAoHEfjW74b
 bFsgYgbWP3ed+N7FSqJrr61s3xbjqWkcWPGviY3hk4vbFvHB8mQsX+ZqE/Vi6Z2Iwh5agOgJF8G
 62G5gu5RN4Co/HZ7VBS4sRTvOfStaOuxyObhDHR63Y5QdsQdp8cbm7aMknzsWMD6cgipgtJ4WS8
 ByVZtzRIHf2Cuks4b2DfPOXVNYkXVvD2Xv701WgES/zsP7A+6NF5pCTS7YUYp8+4
X-Received: by 2002:a05:6000:154e:b0:38d:e3da:63cd with SMTP id
 ffacd0b85a97d-38de3da6560mr3140306f8f.23.1739265758981; 
 Tue, 11 Feb 2025 01:22:38 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcfd7d153sm10204079f8f.84.2025.02.11.01.22.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 01:22:38 -0800 (PST)
Message-ID: <85539c0c-51e8-43ba-9c99-23e1b684f30e@linaro.org>
Date: Tue, 11 Feb 2025 10:22:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/16] hw/microblaze: Support various endianness for
 s3adsp1800 machines
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Anton Johansson
 <anjo@rev.ng>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20250206131052.30207-1-philmd@linaro.org>
 <20250206131052.30207-12-philmd@linaro.org> <Z6S3Mgt1G7fIjeBB@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <Z6S3Mgt1G7fIjeBB@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SD7GdrLARf94

On 6/2/25 14:20, Daniel P. Berrangé wrote:
> On Thu, Feb 06, 2025 at 02:10:47PM +0100, Philippe Mathieu-Daudé wrote:
>> Introduce an abstract machine parent class which defines
>> the 'little_endian' property. Duplicate the current machine,
>> which endian is tied to the binary endianness, to one big
>> endian and a little endian machine; updating the machine
>> description. Keep the current default machine for each binary.
>>
>> 'petalogix-s3adsp1800' machine is aliased as:
>> - 'petalogix-s3adsp1800-be' on big-endian binary,
>> - 'petalogix-s3adsp1800-le' on little-endian one.
> 
> Does it makes sense to expose these as different machine types ?
> 
> If all the HW is identical in both cases, it feels like the
> endianness could just be a bool property of the machine type,
> rather than a new machine type.

To clarify what we are trying to achieve here:

1/ Current situation:

$ qemu-system-microblaze -M help
Supported machines are:
none                 empty machine
petalogix-ml605      PetaLogix linux refdesign for xilinx ml605 (big 
endian) (deprecated)
petalogix-s3adsp1800 PetaLogix linux refdesign for xilinx Spartan 
3ADSP1800 (default)
xlnx-zynqmp-pmu      Xilinx ZynqMP PMU machine (big endian) (deprecated)
$ qemu-system-microblazeel -M help
Supported machines are:
none                 empty machine
petalogix-ml605      PetaLogix linux refdesign for xilinx ml605 (little 
endian)
petalogix-s3adsp1800 PetaLogix linux refdesign for xilinx Spartan 
3ADSP1800 (default)
xlnx-zynqmp-pmu      Xilinx ZynqMP PMU machine (little endian)

1 architecture declined in 2 binaries, total of 6 machines

2/ With this series:

qemu-system-microblaze -M help
Supported machines are:
none                 empty machine
petalogix-ml605      PetaLogix linux refdesign for xilinx ml605 (big 
endian) (deprecated)
petalogix-s3adsp1800 PetaLogix linux refdesign for xilinx Spartan 
3ADSP1800 (big endian) (alias of petalogix-s3adsp1800-be)
petalogix-s3adsp1800-be PetaLogix linux refdesign for xilinx Spartan 
3ADSP1800 (big endian) (default)
petalogix-s3adsp1800-le PetaLogix linux refdesign for xilinx Spartan 
3ADSP1800 (little endian)
xlnx-zynqmp-pmu      Xilinx ZynqMP PMU machine (big endian) (deprecated)
qemu-system-microblazeel -M help
Supported machines are:
none                 empty machine
petalogix-ml605      PetaLogix linux refdesign for xilinx ml605 (little 
endian)
petalogix-s3adsp1800-be PetaLogix linux refdesign for xilinx Spartan 
3ADSP1800 (big endian)
petalogix-s3adsp1800 PetaLogix linux refdesign for xilinx Spartan 
3ADSP1800 (little endian) (alias of petalogix-s3adsp1800-le)
petalogix-s3adsp1800-le PetaLogix linux refdesign for xilinx Spartan 
3ADSP1800 (little endian) (default)
xlnx-zynqmp-pmu      Xilinx ZynqMP PMU machine (little endian)

1 architecture declined in 2 binaries, total of 10 machines

3/ Once the deprecation period passed and we can merge the 2 binaries:

$ qemu-system-microblaze -M help
Supported machines are:
none                 empty machine
petalogix-ml605      PetaLogix linux refdesign for xilinx ml605 (little 
endian)
petalogix-s3adsp1800-be PetaLogix linux refdesign for xilinx Spartan 
3ADSP1800 (big endian)
petalogix-s3adsp1800-le PetaLogix linux refdesign for xilinx Spartan 
3ADSP1800 (little endian)
xlnx-zynqmp-pmu      Xilinx ZynqMP PMU machine (little endian)

1 architecture, 1 binary, 4 machines (which could be reduced to 3 if
we want a default endianness for the s3adsp1800).

Due to the deprecation policy, step 2/ is necessary to reach 3/.

