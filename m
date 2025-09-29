Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C73ECAC5B0
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Sep 2025 06:27:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v37Lb-00079D-Ul; Mon, 29 Sep 2025 02:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v37La-00078i-3n
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 02:26:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v37LS-00041w-7B
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 02:26:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759127196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=X3tX04K/XYn/NkJKn6o6GO1ekrmrzLcVfothhwv5THQ=;
 b=Qsd3vfm8bnoDFtRo2A5P7YRou0fWrUXS8JIEkkWeUrmLWwULiSvEzJ9pbYqwzUcl5Yvjqv
 fZtlF9hmjBLugAHz+fyh1cEk3GiZyuwS4lGRjvCD0SO4JTLUPS10AZKHgQKxEq65oXDM12
 z+Xsii6suoOQ3AKZwHyO524/7gRhJEQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-ierZuo76OMGSuTW3Ya3U9w-1; Mon, 29 Sep 2025 02:26:35 -0400
X-MC-Unique: ierZuo76OMGSuTW3Ya3U9w-1
X-Mimecast-MFC-AGG-ID: ierZuo76OMGSuTW3Ya3U9w_1759127194
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-b3b5be5d250so138481066b.2
 for <qemu-arm@nongnu.org>; Sun, 28 Sep 2025 23:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759127194; x=1759731994;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X3tX04K/XYn/NkJKn6o6GO1ekrmrzLcVfothhwv5THQ=;
 b=nYLMrC2egz33yYgkIkDJGjVa185bCduIcU0+UyUmF47qLJAgxnfyCLiE0qFB/3RNjW
 Hc8eFqJvY5cfvJi9Yk7SGck49bRCTFZmILfZvfn7uVoqQKG7e9tPjwovycdMrluepJRJ
 45onj5tEUWqIUX0JAv1ptSAnntA/yWBJ5En9yHFVIj/sMX2H/IQW2u4gsxnLVpOCXDG4
 BO9WNq/a3j1UshdwwZDbYmnpuq2LUkkF8dljCnxdD5kEREZrloRMRpwHBnZnGq4cFE4W
 OGSze4Ur+ZRJvDWru38L4x1P8uCEDn/XVkJ3iXrS51Vak/PkWnioPkd0X12MMc/lKLDi
 igsQ==
X-Gm-Message-State: AOJu0YwsFy61C9elk3ozP/bOfbA90BP+69P2GbIJBPRb/dFQ0GBPZxHI
 E8HowYyzF/RtJmCKRS0Z6YrLIbLiBBGyljjAg9p49aG4zs90MeggFyCrJNGM4ePoCDFvJ2rstUJ
 PDu1n7rHJyh0yBMeHBiidMsc7v9ZGAhDxlqTgUpsFrmLeWyyH7DCc3A==
X-Gm-Gg: ASbGnct0pJePtALVLjrHczH46eEWw6TY+tgD0NybCeaEzNfHNZ31oRRBfFPsTJVlCTD
 LvUXYHlwt+Q3RLi1Iu0DBUj4qi6Mby7gi1x9lbjwsH0rN/wVz2qn18WtFiOr0J0dFBOPxMZpoX1
 27RlxYp+lfEgxPdGudv73vI4O0PGHX2ABsAC+hLn8G7s1NCYG+uQY7zR8bdNaURjCRqDbg1PY1g
 pmi/yEL5/mZq6pk/0H2+C5J5e+ztmDAkX/e7Y+uXtYgS7kgnIyW1d15PisL2u1ZHdc4tZB9ncGY
 WjkUYjtNnk1gFrznKs5yryFYdsr5bW0Dh7uQf8henZbOvk9EEehO48OYp+Yr1jur7DeIfXzKoiH
 EpKD7+w==
X-Received: by 2002:a17:907:da1:b0:b3e:dbbc:4e16 with SMTP id
 a640c23a62f3a-b3edbbc4f90mr267344866b.41.1759127193869; 
 Sun, 28 Sep 2025 23:26:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQ4bbGpJWr4gkXXT7QeLix5IvUjdxOCMNCnG7tOpTQ7vx4i69JHlxiIXUSsio+tucRD2ZurA==
X-Received: by 2002:a17:907:da1:b0:b3e:dbbc:4e16 with SMTP id
 a640c23a62f3a-b3edbbc4f90mr267341966b.41.1759127193477; 
 Sun, 28 Sep 2025 23:26:33 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-114-212.pools.arcor-ip.net.
 [47.64.114.212]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3a835ca898sm430195766b.60.2025.09.28.23.26.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Sep 2025 23:26:33 -0700 (PDT)
Message-ID: <66ea9c0e-14c6-465d-b473-2d750effff4c@redhat.com>
Date: Mon, 29 Sep 2025 08:26:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] tests/functional: Re-activate the check-venv target
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, berrange@redhat.com
Cc: qemu-arm@nongnu.org, manos.pitsidianakis@linaro.org,
 peter.maydell@linaro.org
References: <20250926051542.104432-1-gustavo.romero@linaro.org>
 <20250926051542.104432-2-gustavo.romero@linaro.org>
 <5aefdfa3-4b8b-4512-a6a4-1a1684352d0f@redhat.com>
 <34599995-fe56-436d-82c2-3837037a58a8@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <34599995-fe56-436d-82c2-3837037a58a8@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mjtznp2CP0U5BpIoRo0Y5RQNPeO1R0UP1WX3SbhoIbY_1759127194
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 26/09/2025 17.43, Gustavo Romero wrote:
> Hi Thomas!
> 
> On 9/26/25 05:34, Thomas Huth wrote:
>> On 26/09/2025 07.15, Gustavo Romero wrote:
>>> Add check-venv target as a dependency for the functional tests. This
>>> causes Python modules listed in pythondeps.toml, under the testdeps
>>> group, to be installed when 'make check-functional' is executed to
>>> prepare and run the functional tests.
>>>
>>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>>> Suggested-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   tests/Makefile.include | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>>> index 3538c0c740..d012a9b25d 100644
>>> --- a/tests/Makefile.include
>>> +++ b/tests/Makefile.include
>>> @@ -109,7 +109,7 @@ $(FUNCTIONAL_TARGETS):
>>>       @$(MAKE) SPEED=thorough $(subst -functional,-func,$@)
>>>   .PHONY: check-functional
>>> -check-functional:
>>> +check-functional: check-venv
>>
>> I just noticed that there's still a problem: If you run "make check- 
>> functional-aarch64" immediately after configuring + compiling QEMU in a 
>> fresh folder for the first time, the functional tests fail with:
>>
>> ModuleNotFoundError: No module named 'pygdbmi'
>>
>> We either need to add dependencies to the check-functional-<arch> targets, 
>> too, or we have to make sure that tests still get properly skipped in the 
>> case that pygdbmi has not been installed into the venv yet.
> 
> Isn't it inconsistent that check-functional runs the test and
> check-functional-<arch> doesn't? I think it's a good idea to
> skip if the module is not available, yeah, I'll add it in v6,
> but would it be ok to add check-venv to the check-functional-<arch>
> targets too?

I think so... so please try to change this patch to add the "check-venv" 
dependency to the "$(FUNCTIONAL_TARGETS):" line instead.

  Thomas


