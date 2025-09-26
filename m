Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AADDCAC5AE
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Sep 2025 08:42:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v242J-0004LZ-TF; Fri, 26 Sep 2025 04:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v242I-0004LL-48
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 04:42:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v242C-0007AI-9I
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 04:42:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758876147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cuDfrREaIhZgDwtTDgn8jE2g55Sr9rMb4XsrldHHH5g=;
 b=gIAAFWHbmD+2RXkTSyjptrmdLQp3zf3viwU4RYUP3tLMdyEbSmb1Ih23WWYIlJAaObSnDz
 YOi90m7wkqbfFzIi3Bdkq/APvafi0aCXh54f+o0yZavuQxuhWg4AHpIhxKCLvh1Gmei+vx
 MyLjRKLG89rkNvd8kUseif1BPSgNuA4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-tgsK-SXEMFCgQkZzr_zjsA-1; Fri, 26 Sep 2025 04:42:25 -0400
X-MC-Unique: tgsK-SXEMFCgQkZzr_zjsA-1
X-Mimecast-MFC-AGG-ID: tgsK-SXEMFCgQkZzr_zjsA_1758876144
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-46e31191379so12394545e9.3
 for <qemu-arm@nongnu.org>; Fri, 26 Sep 2025 01:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758876144; x=1759480944;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cuDfrREaIhZgDwtTDgn8jE2g55Sr9rMb4XsrldHHH5g=;
 b=jR0dyApisuKbU2PemSwNWEFu+fTnEz9P1UvqnlA4/bQPFE5yAHVlWl6E7puxOgLyYS
 ++Uhda2S/TPeRzxv6CQ6KdWWn0YcWklewZ41yIUdlAhEvmet9lJlLWvXflHnSrFQN+by
 EmjOfqv3NPqDW8VBeASHdopkKhf29nh/9EHm5dVfxF+gvk/oR03eZjexOUF35Wfr4+Up
 byuoJtQ8hWFQRVpmvN036tvHsIRVOhAEen3y2NxA9/HE/BAhZ+WITiA4CFhgCswMmexO
 nyMJOJzIjjPkpvrGSAEx3EGm5MaS5chZC32ykiwYDlhf6baeb3ReM41QWY4fqsPFO/HE
 B5FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjrHRw8OQvM9U4cSW44rkFBOixnp7V1aXPiTKzOoV1CwIlfaTZelaJnoCAVLppnELGVPojEYuxEQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx5E6KzYi4bAS7TVb0eJYDp9O2VTMun7HD3D+6zw3IOEcWnqD6k
 FKnNE7WG+3uFrH/fTWdF00rOLTUDVS9x8RZRtQvTA4OOzHps3JiCGaS3kxeCDwJObCoUfVmldEE
 oquvxrhYSl/ZCqGn8ovxi2sf4zpf0T6ttvK0ajTmAPcbHYhYUgKTYZw==
X-Gm-Gg: ASbGncu7Q+sRjyslgFUYGB+3UyvalsFR6MMTJO+hj/75eBem0okVVrx1/DMZtc96+qw
 7eiSOxxMlUOV3viTRaJHs4eoxIyCxSu2kJmJLAn9F8vGO9VRIzDBoCJ5FCR8VKJ7ANGrw1KmcCU
 ZLM4Nh9bcfsab2toXC16CBXF+1mNJUz6979NKSOqN9FHhozh9r6Wh2421YLh/a2vLL3u2RjgAlO
 7KusION5BNQEFuCCtOGwllQh23Rcc9MyOZFEztlSXHTBgrSw84Lria6R2hDoSkN2OJdz7Nj2PNs
 fJWTXWEVRTzMLSem6DwSJKDUcDEm8Pow9/SiOqxA13FlG8GZ0R9ctvGKnaEgT6trjO9bGnlUwhO
 NJPvsiQ==
X-Received: by 2002:a05:600c:444d:b0:468:86e0:de40 with SMTP id
 5b1f17b1804b1-46e3299a5c0mr54753105e9.4.1758876144335; 
 Fri, 26 Sep 2025 01:42:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3idAcB382Nhc5lhO8jtaEahmHe80kvr+1kziltK8IEHDbms/74sxISJXP7dICJQ6M5qx7Tw==
X-Received: by 2002:a05:600c:444d:b0:468:86e0:de40 with SMTP id
 5b1f17b1804b1-46e3299a5c0mr54752855e9.4.1758876143858; 
 Fri, 26 Sep 2025 01:42:23 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-114-212.pools.arcor-ip.net.
 [47.64.114.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc72b0aeesm6350360f8f.49.2025.09.26.01.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 01:42:23 -0700 (PDT)
Message-ID: <1015000c-3f92-429f-84d2-bf496b5776d7@redhat.com>
Date: Fri, 26 Sep 2025 10:42:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] tests/functional: Re-activate the check-venv target
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, qemu-arm@nongnu.org, manos.pitsidianakis@linaro.org,
 peter.maydell@linaro.org
References: <20250926051542.104432-1-gustavo.romero@linaro.org>
 <20250926051542.104432-2-gustavo.romero@linaro.org>
 <5aefdfa3-4b8b-4512-a6a4-1a1684352d0f@redhat.com>
 <aNZQwnBW76LPUgeE@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <aNZQwnBW76LPUgeE@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2QJ7mqs7TnPJQiWPIyHkFsEdWO0afoXteAmljIkkTzU_1758876144
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 26/09/2025 10.37, Daniel P. Berrangé wrote:
> On Fri, Sep 26, 2025 at 10:34:01AM +0200, Thomas Huth wrote:
>> On 26/09/2025 07.15, Gustavo Romero wrote:
>>> Add check-venv target as a dependency for the functional tests. This
>>> causes Python modules listed in pythondeps.toml, under the testdeps
>>> group, to be installed when 'make check-functional' is executed to
>>> prepare and run the functional tests.
>>>
>>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>>> Suggested-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>    tests/Makefile.include | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>>> index 3538c0c740..d012a9b25d 100644
>>> --- a/tests/Makefile.include
>>> +++ b/tests/Makefile.include
>>> @@ -109,7 +109,7 @@ $(FUNCTIONAL_TARGETS):
>>>    	@$(MAKE) SPEED=thorough $(subst -functional,-func,$@)
>>>    .PHONY: check-functional
>>> -check-functional:
>>> +check-functional: check-venv
>>
>> I just noticed that there's still a problem: If you run "make
>> check-functional-aarch64" immediately after configuring + compiling QEMU in
>> a fresh folder for the first time, the functional tests fail with:
>>
>> ModuleNotFoundError: No module named 'pygdbmi'
>>
>> We either need to add dependencies to the check-functional-<arch> targets,
>> too, or we have to make sure that tests still get properly skipped in the
>> case that pygdbmi has not been installed into the venv yet.
> 
> We already have a decorator for skipping tests when modules are missing,
> so we should add usage of that.

Ack ... and the "from .gdb import GDB" in qemu_test/__init__.py likely also 
has to go away, to avoid that each and every test tries to pull in the gdb code.

  Thomas


