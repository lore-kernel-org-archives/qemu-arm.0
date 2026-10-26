Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5379A606A323
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Oct 2026 15:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gBANzwqV
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLN1I-00072T-2s; Mon, 26 Oct 2026 11:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1xLN1G-00072C-2Q
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 11:53:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1xLN1E-0005te-IC
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 11:53:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793030030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=blX6pw/i6Lh2miqN/ThCCzDAkXlVW6VkbPCR4LHq7gY=;
 b=gBANzwqVbmo5e6fHVYLAPUpuALxFh7hnSO+SiIgLg7eCX/fnhANYq6pupWzJdksLQKvBgZ
 W3qMmG82IV9O3NYBmDCbil8bjrR84nyyD9rdWQ6MQrQ51QFDbRHFiYh+vB3c9RWQ6EF0eI
 1RYUrmyZw1/t0vYYf2JS9k5Kgn/cTmg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-S-lmaQr6ObqedDMjgTD-AA-1; Mon, 26 Oct 2026 11:53:49 -0400
X-MC-Unique: S-lmaQr6ObqedDMjgTD-AA-1
X-Mimecast-MFC-AGG-ID: S-lmaQr6ObqedDMjgTD-AA_1793030028
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4a35db2d6b3so13550075e9.3
 for <qemu-arm@nongnu.org>; Mon, 26 Oct 2026 08:53:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793030028; x=1793634828;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=blX6pw/i6Lh2miqN/ThCCzDAkXlVW6VkbPCR4LHq7gY=;
 b=a3NJbbTd3eCqguikhPsG4XyhMRBsekjy92JFBM/7eIw3uMW0FbIV85LaGVmEQd5pO2
 glxpGzFOFomSZzROqYtdPX2+ZIAN63Foe2JUEqbLvcT74iHQ3u8hVzkjyILzFMtkMObA
 1CuX7Tp6VKapwW4MTZOPsXVGTy29DK2ksn/wOTOyxsuzxbAd/9tkOSfUi0rLm+V41r1V
 O0EPtgH0j+TjK16HLDBs0SVJ8IVPMVVEzAf/v+dmnm/e/pNAxSmEghgikp3BPrTMk53Z
 4XqVgmHD4LGo7g4yMD58sWaLnX4h7I5xQQ8YnaCvRIaWpgzjjsRtFmqQZs49xbNiIDMJ
 lwOQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxlMvLzdcDOfamT2aOLW+C8eKx5RHf4ClCbmaBeeQ/b7/cJLxsIm0YcriwBFD7RZ4g7DOUAz1juZg==@nongnu.org
X-Gm-Message-State: AFq9FYIl2pm51QCgu2JmZuaYSnkJHLNkVHMP0jEZUo/E5l9chXBGLlE+
 rRL5HpA9Cpa8L93R2Au18Mr5waUAf8orh24MtyjpqHaGdasGKKqd3ecO9z2hSkILDR2c5hEKpRB
 tYA3iMCm4vwdvYVOQnR1f7DNn302Iypka32c7nIPUG3NHAIM/YDPe/g==
X-Gm-Gg: AYBFou3Kk0D4IWdJFLm0vinBX5cXP1pBalrWMokwDbS8YAi9IXXKHAhSxr0SjBnQX3+
 2G1RdMSXk0OmpG6/R4qszilNkSCSVSbaeS9TOdDGumM5Ql44qh6bWHoAqZe2ObmXwA2YAHipVh1
 1zPuHXYS/cYy0FiqlycRsWJRfYaRmuwqUT21MEWU5wzQ2sfKjkQooWymX/+2kfW9Au2FxpyiT40
 jdAw82muh7jBmJDPY6gbmWgvuF2VEVR1xSXaZnQT8uef5FADXHiu94aPTHuyI2yLElkwUVEOPoZ
 n48Ly5RpcRcLl+F2/mLdHvE0yPlnYvCbJIRs19UW6BhdnqbnhAeK8FR6KjOPTta2qU8HS6gH
X-Received: by 2002:a05:600c:4e4b:b0:4a2:e0c:2b0a with SMTP id
 5b1f17b1804b1-4a35aca5bd3mr122507545e9.16.1793030027798; 
 Mon, 26 Oct 2026 08:53:47 -0700 (PDT)
X-Received: by 2002:a05:600c:4e4b:b0:4a2:e0c:2b0a with SMTP id
 5b1f17b1804b1-4a35aca5bd3mr122507265e9.16.1793030027380; 
 Mon, 26 Oct 2026 08:53:47 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.112.93]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebc3cfasm17386387f8f.17.2026.10.26.08.53.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 08:53:45 -0700 (PDT)
Message-ID: <ae52ca61-b178-48bc-a456-27c6f3393b13@redhat.com>
Date: Mon, 26 Oct 2026 16:53:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/7] target/arm: enable WFE sleeping for A-profile
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: kvm@vger.kernel.org, Troy Lee <leetroy@gmail.com>,
 Hao Wu <wuhaotsh@google.com>, Kane Chen <kane_chen@aspeedtech.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Steven Lee <steven_lee@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Pedro Barbuda
 <pbarbuda@microsoft.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-arm@nongnu.org,
 Alexander Graf <agraf@csgraf.de>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Richard Henderson <richard.henderson@linaro.org>
References: <20260624103049.884930-1-alex.bennee@linaro.org>
 <20260624103049.884930-7-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260624103049.884930-7-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EC7Ks-fgon-PO0p14iR8A34f89NGGdP7sZSV7sl3s1U_1793030028
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.339,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24/06/2026 12.30, Alex Bennée wrote:
> To enable full architectural behaviour for A-profile we need to do a
> number of things:
> 
>    - add support for the event stream to wake things up
>    - add support for potential trap on sleep
>    - handle the global monitor's interactions with WFE
>    - remove the M-profile specific gates
  Hi Alex,

this patch broke the test_arm_quanta_gsj test in 
tests/functional/arm/test_quanta_gsj.py. The test is not run by default, so 
nobody noticed. But if you run it like this:

  QEMU_TEST_ALLOW_SLOW=1 QEMU_TEST_QEMU_BINARY=./qemu-system-arm ./run \
   ~/devel/qemu/tests/functional/arm/test_quanta_gsj.py

you'll notice that the test never finishes on the current master branch. 
When switching back to the commit before the "enable WFE" patch, the test 
works fine again and finishes within a minute or two here.

Could you please have a look when you've got some spare time?

  Thanks,
   Thomas


