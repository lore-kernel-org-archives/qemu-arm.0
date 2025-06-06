Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp738595njc;
        Fri, 6 Jun 2025 00:00:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWavg2X0CGTjDfOqDVmVW5A/B3JIeeVzUvSX2mProuzzJ+3yuGKNYkVTmVPP8MiWqt5ldVpdjL14IpHYg==@linaro.org
X-Google-Smtp-Source: AGHT+IFxmAAWJRPRRhvTOsMPAmWZyEwe5JsIuUj5UhxbtJ85CNWbnCMzuV0K5utf31wHqBzZb/Vf
X-Received: by 2002:ad4:5dca:0:b0:6fa:c0ca:c75c with SMTP id 6a1803df08f44-6fb08f90e97mr33439556d6.42.1749193229190;
        Fri, 06 Jun 2025 00:00:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749193229; cv=none;
        d=google.com; s=arc-20240605;
        b=Q5bGlS/2yVuIs8tMtB+IktYsCV9JHtlFCxD48U+/D0hiDjl4Cr6xkHXKd8j4A+Nq5x
         LYc9cj9qeVD6yXDSZkM89KkJkTjaQcl1f4IajGlf0llnClZsjRFvaU0k7HUNj/bs2OlS
         VoLDRIr67NUoa7dK61wvCgxAJhy6HQGp784uhDH6LICJJKI+u/xJkMP0S0m/rJUIaxih
         umLvBp8zLLJzkzf0hCy9tqz2Axr7uWHzkTH/nxYomq51Yp3QspztcWT9+zK6i+BElvXA
         de8+Is/FKLtrixDgyLMF4hvXf+YJX4NNLzEKB5SP3OqIlbN/DAS7I7g1P40p6LZgtdq/
         CnTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8C5TBCJwHwY36Xj9VQOxwa2yf2nZuqRSc98GM5TUFB0=;
        fh=u1uexw1E/5FfUDsiUnng4DwTQGT1zedlZTTMktSAkiM=;
        b=IIKqaqrB9xDXOsFV//c8yD2ui/vJjdzjUpXWCL6OtobZSQbEroyFSzaaNgOuChIxx2
         iz8OwV1j4VWw4xSWpot9er+SZxfTj59icSGG1sE24tvR3GqVRP8GD9EuAA2gYdRtcsFC
         rR/RBv/JpoWG9Fde6T6qRs9xt1+A5A/SHrvJk2Dg5PEIloDsfR0tODSeL0GzkHNivyTw
         8Y5uRZNfSjnSpyD3W4DLyN6SMpjTg17YES2dhM7ucL3Yb20/2j3TbWLEClrwGwVMH7aG
         d/q2hlIq7oPWaE9Uh2OzebLrhaDy7bBiNYr9p4TwfR1EMrYYtpy/bzwhr4eTYfCYE5Hg
         t7Hg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F7zyfV8r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb09b16ed5si10369656d6.183.2025.06.06.00.00.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Jun 2025 00:00:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F7zyfV8r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNR3V-0002qv-1y; Fri, 06 Jun 2025 02:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uNR3T-0002q8-JN
 for qemu-arm@nongnu.org; Fri, 06 Jun 2025 02:59:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uNR3R-0003ML-Mo
 for qemu-arm@nongnu.org; Fri, 06 Jun 2025 02:59:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749193189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8C5TBCJwHwY36Xj9VQOxwa2yf2nZuqRSc98GM5TUFB0=;
 b=F7zyfV8rKe+jRAQ3tyd2iiRJpaMvICNgGlvzdVnZxSbuT6OS28wkSGQv/ITfwgupW/Fp3T
 lgdUJACXRIKMHuJbdOWKxcLN+IeJX87V4Bkq/1uEGXpTEb8yT+WVss3RfHlNaMSXsFfhu9
 GYCK1Pd86G9Az5J9akz2S+1p/XRz6t8=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-dgfZXisbOPaa9x_7FHJCIg-1; Fri, 06 Jun 2025 02:59:48 -0400
X-MC-Unique: dgfZXisbOPaa9x_7FHJCIg-1
X-Mimecast-MFC-AGG-ID: dgfZXisbOPaa9x_7FHJCIg_1749193187
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-747cebffd4eso1535826b3a.2
 for <qemu-arm@nongnu.org>; Thu, 05 Jun 2025 23:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749193187; x=1749797987;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8C5TBCJwHwY36Xj9VQOxwa2yf2nZuqRSc98GM5TUFB0=;
 b=OlGaDo4rOsg6e4lG9hiUy3klf0xcrj72ScM7LahDY3Wvgx4/UASdicjQfjzyhS9yYz
 5pgAYn+8taqwn1WzD608/HxN65cJkWxI81gbl4c8mVy7waHICC8BTAgB01M7rX8c3yIn
 8LMoTviQFVg1sXqoDByAyfpRP03fccJpO60EBx5QLjvuJ2QJ9IGwCYq1ymMY8KzH690f
 vgWRNXav6dMeTOokiSp1mTkdmgZEEbrj7GOFzBpGy3rdodK9iup1wfvTTW2OAjfzhdX6
 U7Pupe2LgagOF9oZeytjJFT5EaqG2pvHFc9c3wXNnotF+QQItgLHvkOWCZNfw7KWWQIy
 eayQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2SLBrLvI+WQo7jVrHGUy1vSzX1+O8XWKveZCWbbOJE6VCB7jP1thjDklmg4i+iP5yGABvhwA/jw==@nongnu.org
X-Gm-Message-State: AOJu0YxqsdrlrOf1fVB4NcBm2temjOt5PPa0KijzcbRN0/UcRjjmadcc
 xu3rVCAcBgrqwNbSR/2zTzip9u6IxFCSFp58KpF4J4SjqtVkUB20g/iJtB0wX5EcNQDr2FACqvr
 q2QpLOTEkxFEk3d4TsbfEXSQHcaUBHfs+Ep27h9pU10vlWwvv1/lwvA==
X-Gm-Gg: ASbGncsNxPgIlOsf4yW6MDrsEoaDl3c4Tpgd+Bu1MTowIr0/Crqa9E+mpu2krVNqgIy
 3cDarv9iNB5isyge83NttDrfx2cmOxcB2kb4tVZGPEafnDmWFdr9y0hyRVHlaFez8sB8Ck2Lmhw
 K3yJJS9Tvcbwde80P3xLIOH4rorT6ceGfr8q3Deekn1232JnBdHXp3W8YLr8n6SDnCCzzI942Sl
 UslERNy4E30vmaeKAt9fLszn4UnsAGeD36WPwxUwtqODlOFXFv6F3FjJeKr4+YlWXTM38NVADwo
 SZ6ZC3OPrZYVtxcKWeGxBX1eeA==
X-Received: by 2002:a05:6a00:3d0f:b0:740:aa31:fe66 with SMTP id
 d2e1a72fcca58-74827e4e9bamr3543283b3a.4.1749193187344; 
 Thu, 05 Jun 2025 23:59:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d0f:b0:740:aa31:fe66 with SMTP id
 d2e1a72fcca58-74827e4e9bamr3543260b3a.4.1749193187041; 
 Thu, 05 Jun 2025 23:59:47 -0700 (PDT)
Received: from [10.72.116.52] ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482af383f9sm664553b3a.25.2025.06.05.23.59.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 23:59:46 -0700 (PDT)
Message-ID: <618a4880-4bf5-43b6-afc7-8279fe2c080d@redhat.com>
Date: Fri, 6 Jun 2025 14:59:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ramfb: Add property to control if load the romfile
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Eric Auger <eauger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org
References: <20250605030351.2056571-1-shahuang@redhat.com>
 <746b078e-bd06-4361-aec7-2301412abb18@linaro.org>
 <kep5frpl24d74evoyf367pqkyoj6xez2pirk7xlzcoompyzq4c@ouxab77sdm55>
 <2030db73-4f1e-46ed-98ea-c469e8b0ecea@redhat.com>
 <aEGsbkhdT_k5JErg@redhat.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <aEGsbkhdT_k5JErg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H0PgNtcW8YVzdhjxe9tsuG5U3Q55SviqRBBCscvsiv0_1749193187
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=shahuang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.132,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: du5g/9sCdW0G

Hi Daniel,

On 6/5/25 10:40 PM, Daniel P. Berrangé wrote:
> On Thu, Jun 05, 2025 at 04:24:07PM +0200, Cédric Le Goater wrote:
>> On 6/5/25 14:21, Gerd Hoffmann wrote:
>>>     Hi,
>>>
>>>>> Now the ramfb will load the vgabios-ramfb.bin unconditionally, but only
>>>>> the x86 need the vgabios-ramfb.bin, this can cause that when use the
>>>>> release package on arm64 it can't find the vgabios-ramfb.bin.
>>>
>>>> Simpler to directly pass the ROM path instead of using a boolean,
>>>> so board (or CLI) could pass path to non-x86 rom.
>>>
>>> The rom is loaded into a fw_cfg file which only seabios will look at.
>>> So this rom logic is x86-specific.
>>>
>>> edk2 ships an EFI driver for ramfb, that is how ramfb is used on !x86
>>> platforms today, and I don't expect that to change.
>>
>> Should we also set the vfio-pci::ramfb-romfile property to false in
>> a compat property for ARM machines then ? I don't know for RISC-V and
>> PPC.
> 
> Sounds like we'd be better setting the property to false by default,
> and then special case x86 machine types to set it to true.

I want to do that setting the property to false by default, and only the 
x86 machine types to set it to true.

But I didn't find the similar things on x86 with the arm_virt_compat[] 
in the hw/arm/virt.c which can set the compat global in one arch.

Thanks,
Shaoqin

> 
> With regards,
> Daniel

-- 
Shaoqin

