Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7168187njc;
        Tue, 12 Nov 2024 00:03:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXvK4jbJKRfKEhRZ0jrg7B6v5fSCyfP9GRTkI7a7Qm6pzR27j2cpArzida0Bo4UoikMW9s9fKryVZCX0w==@linaro.org
X-Google-Smtp-Source: AGHT+IEuA5GsrALyt2hM6HJJ/239vPhEGe0VlSFIrrJ6pHSDOjlMLGqCwwv1pGuIvswvULpUpNWL
X-Received: by 2002:ac8:59c7:0:b0:460:95b7:bb0e with SMTP id d75a77b69052e-463093f0012mr194172151cf.34.1731398597423;
        Tue, 12 Nov 2024 00:03:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731398597; cv=none;
        d=google.com; s=arc-20240605;
        b=i1ezNrnMdIk9uL9igGXOQtRS/Rvm2v+uTLwmOmalW5NVQwpKsAD4gyM7ObX14m700r
         pPFnHEK1/5GRNumyZ4F4tahgqcjaid0MK3dNUIeIHeXRQyYmRG1cncLWSD2Ng1gxnxFg
         Bs02Xc9PuYDG7lW2nA8Y1JGew2sfC0k/OxEpoPBVqHGAIGxc0Mxv55J4BNhCuvWpJ2XL
         ZG+zWp3KC6JlZxQQ6GTtVwEOgC3H83o2XX4AManrZDReoL67J5g77og2WFFhkW5dO2jg
         kOSQL4XOXtUId+IYbQmczjtglocwpqMROKpmmjk38HFKYEuezFqYWo2r8S/nEYNmEhck
         u7aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=OLXm3dM9IWRmjC5GqP6gJvlm5hVvCX41HwRzZBIJpPA=;
        fh=nelKLULPFemx8fHhHwxnc8hG++fFVZT/WTcugqB2MhA=;
        b=Wee9j5FIWkxW4YVVxhqT4zMZbhxB30PboQEKCSO4YDdgVnaype0BClt3JxOOgWMPhr
         v3u/FrgERusKFw5Cp61crVC+sxS7swWdNGWEqs1+fMZnnVTPj5u0c5dbNubiG/GAzzzL
         LFx14uC0E0EHYDfCoUpTqffQ4+Fa8NlnvF5a2PIV7wQO5Mn4+QeaaSL/OoTG1ao5xXaY
         S30vnXjbztJCBuU1Q5+CzLPz1wCMrdpLnIdUtEHlYaYsyNwXeEy6zyyClM7k46HnJUMa
         q+uK2ipbKKEgMLuWCXvuZppOy0rdAs2cTqmKdSLkAkl/d+KdAgkYXbAC7SH+IXgr0vDu
         AyKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LwS7Gf0I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff45af55si139559531cf.175.2024.11.12.00.03.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 00:03:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LwS7Gf0I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAlrh-0002iP-Gq; Tue, 12 Nov 2024 03:03:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tAlrf-0002e2-9W
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 03:03:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tAlrd-0006xE-FW
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 03:03:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731398584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OLXm3dM9IWRmjC5GqP6gJvlm5hVvCX41HwRzZBIJpPA=;
 b=LwS7Gf0IWp7pPHxs8Tl9UJW7junJtK+K/e82X/R5+rKdZY3G2hXs7jQwVNSR0+aOW7Y+eL
 aWmrCqD/tYnXYcWjyb0JpVM4DuvY3GJKi0vbhy8xVgmRk0LryJnMywqSPEGUUsWeWgVOTf
 QbM9p1KQS3HKQ/nlB4zphD6+sjqneAI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-11wAxgmBMeugHpvC4z3S8A-1; Tue, 12 Nov 2024 03:03:03 -0500
X-MC-Unique: 11wAxgmBMeugHpvC4z3S8A-1
X-Mimecast-MFC-AGG-ID: 11wAxgmBMeugHpvC4z3S8A
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7b1581d41dcso798015685a.2
 for <qemu-arm@nongnu.org>; Tue, 12 Nov 2024 00:03:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731398583; x=1732003383;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OLXm3dM9IWRmjC5GqP6gJvlm5hVvCX41HwRzZBIJpPA=;
 b=kcKu/bKdjsgEo/jhP4CVIODt8WY0meD2g1d0u94GYLAVxL+9of2VAoEj0qbjwmzLFM
 TvlWpxxq9l7hRtLYTut9w3aafccQV5lCgVQm9eOcdDdoUvMXCAMy9AHJh4L9kilVIhBV
 f3DjBipsy7/I9l8avS49ALDNgYDgT0+U1CGprBGVeQQhH47WbX2ESuZSsPE3QPYASBow
 ZB9mwP0BlazMV6zlUOA5sJitEzi6vR3v92mMsec+VDj1za/R7j/YcW4N4LIr0hPCFJpx
 2TZ7pC3nv1xSwXSzPZGmfogGLpM2zQfqp6xTQG77CrpDshL4ayranDjEuRvFscBYCNe1
 RSDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6vrqUfBAF/HLL/Sx61wRebo2GIrDfUA66lOW+EVrbxPXUi2fLrrPPytvbgvjrVUmuKGh6fi4fsQ==@nongnu.org
X-Gm-Message-State: AOJu0YxiMA8a9A5HxvdOAEDfF2//q/PqMU7TLxQ6Tq1dmvMBzq/Ho/jA
 EWoRDfjMlzRvSWAn7mQali1J4TDl3Eo3MeVGGlYy0/CT2Mf6BwPSMsoG9JMMFMHZcVpM0p0QLGX
 3L5nCyexFx/iGSB/hoy79vEaoUX6qzTuoQ84Bo6QtoSMCTtVKG9tTgKiEYw==
X-Received: by 2002:a05:620a:3704:b0:7b1:4fcc:5483 with SMTP id
 af79cd13be357-7b331ebfcfcmr2443665785a.27.1731398582956; 
 Tue, 12 Nov 2024 00:03:02 -0800 (PST)
X-Received: by 2002:a05:620a:3704:b0:7b1:4fcc:5483 with SMTP id
 af79cd13be357-7b331ebfcfcmr2443663485a.27.1731398582696; 
 Tue, 12 Nov 2024 00:03:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b32ac427dasm568506185a.27.2024.11.12.00.03.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 00:03:02 -0800 (PST)
Message-ID: <c30daec1-b897-4190-a8d1-d07561d78778@redhat.com>
Date: Tue, 12 Nov 2024 09:03:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] tests/functional: Remove sleep workarounds from
 Aspeed tests
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20241112062806.838717-1-clg@redhat.com>
 <20241112062806.838717-5-clg@redhat.com>
 <f97df212-9094-4ea4-ab9a-3ca3f88a0c81@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <f97df212-9094-4ea4-ab9a-3ca3f88a0c81@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y-9gQkpirBaTZpayVLtslDOoH4lJwKgrIn2SAw44x5o_1731398583
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.122,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Ck+kYqH0bxNq

On 11/12/24 08:14, Thomas Huth wrote:
> On 12/11/2024 07.28, Cédric Le Goater wrote:
>> These were introduced in the avocado tests to workaround read issues
>> when interacting with console. They are no longer necessary.
>>
>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>> ---
>>   tests/functional/test_arm_aspeed.py | 7 ++-----
>>   1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/functional/test_arm_aspeed.py b/tests/functional/test_arm_aspeed.py
>> index bdd5771a794e..07a8905e2365 100755
>> --- a/tests/functional/test_arm_aspeed.py
>> +++ b/tests/functional/test_arm_aspeed.py
>> @@ -136,10 +136,8 @@ def do_test_arm_aspeed_buildroot_start(self, image, cpu_id, pattern='Aspeed EVB'
>>           self.wait_for_console_pattern('lease of 10.0.2.15')
>>           # the line before login:
>>           self.wait_for_console_pattern(pattern)
> 
> Could we please wait for the "login:" string now instead, to make sure that there is no race between detecting the previous line and the real login prompt?

Yes. I have done that in other tests. I should do it in this test also.

Thanks,

C.

