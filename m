Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7D9606A6A2
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Nov 2026 21:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dKsQYTEZ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xUWYl-0001kg-IS; Fri, 20 Nov 2026 16:54:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xUWYk-0001k2-G0
 for qemu-arm@nongnu.org; Fri, 20 Nov 2026 16:54:18 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xUWYh-0001b8-JS
 for qemu-arm@nongnu.org; Fri, 20 Nov 2026 16:54:18 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2e9e53d011eso11283225ad.1
 for <qemu-arm@nongnu.org>; Fri, 20 Nov 2026 13:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795211654; x=1795816454; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=iWSaC+pg/A3a4vuwu14hR5LGl0fhGTephnxBE0x/52U=;
 b=dKsQYTEZ7IihnWqsZ9IYyUHtaQE9YIJO5E+xfYshRZ38A0qGCIhmD0UxLMGVQTPGUS
 FUh1ievwEQ67RNa1ym2y/bjNBUCCMGkpyJprtRO3Org6EpZ/IK+RMvRvCAEPqNG47tI7
 ZnNmHZgvF1zoWRsUAfPpDNHoR23p2zUDA8ULLbf/enazNnH+z7xsZ/US9IZcQE8NACDz
 4ROfmHuQdIBkBrkqv69ZsBrZotl19ZJoU4HFhwSqgj+tSADqFWVvEyx9/FPwwGeleXbG
 Z902YAkwse+Z1NcC5fK0MOVkfCXzzOtbMnRueVscldErCKmdHwZNK2to5wBcYqQrFySF
 zttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795211654; x=1795816454;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iWSaC+pg/A3a4vuwu14hR5LGl0fhGTephnxBE0x/52U=;
 b=OPU9c7E/N1cAWKYTU48xgVrrPKyJyYayALPxOCIA/lpzRwU190OPXl2n7cqL4teTpz
 TKkNzSsTc8sYXq3SdNb0wPn5QY/Qq0yzrgcbWhqDvsjlr1uvcBGq4krg1ipvZhK9MsoJ
 0nyeufA04/q7BSnqeOWp93Q8cB71j1AVnZO5KHco2dKNjiHH9L5l4/1eOuXvGgOo4k3s
 NC8R8qYz3iLYvbUeWo8jor451NkoIKgPi4F38dHrVrvbHps16aAg03oLVjFWdVLabjy4
 24bFTWN1tvbgJcJPNJOlV+oxs+piIIhw2rIltGbx5kXPzbxjarz4LvgeGI1UBwenUbCl
 HcSA==
X-Forwarded-Encrypted: i=1;
 AL+hErF+MxcTs6o9n44ER56JUGS/7Yti5hDAPJfYt2Zub2rX6dsMbgoCBaBRKgZ8DfVlFFa05DNbsVQsLg==@nongnu.org
X-Gm-Message-State: APuU4Z+ASj+PgtOiUZ7IAOoFbWc2l1btegaH8U1aG6bPFfioSawd7Dwd
 7twfnUAPmOX154G3fuNUJYx7vXUQSdxnYUT6OVtbN4gq1HVtwg1JTKvfZRM464+DiDo=
X-Gm-Gg: AZFdTZeH2HTdEMrOJx8pBKSWm277hU/XGD8I/9I+cKi3oKcf5G5oa40X6PdlnAtvXlX
 v8BBoaDEhnEiUUgpBg+L46ydO/lQe+6uJmdxkzt9MDpGuScToVCae1uf7mcu42N9vGvi6adERzj
 qvhegrPTEprnW1bpDVqLxbtPvgYCt5zqhHyI37qXZ3Zd6sR2UPyPcKNKQ0P1O0fJw6Dp/hZ67A5
 VU2iJxFkZcfZtVpcIMnoR18cuSqLIYqq21NyNPos/dR6HxEu6qKaqCdZ2XWm3IDkqlHmih+EFPV
 bZjvBmh9mV43tuwv29vDzR9G7XDPGmarYot/e40SC8ekpqQFwdeMh1oJkxQ0x6KIuHQcF9mCdyz
 ndPQmX/KteHLBIti9gBqPa/eHq9yyj0oO+/dw/ewA00+6O22OajtNgJp4V+AJfnvT3jdRcQDGIV
 Ue4af99FS4zDiFEMl1K7jA5scz6vl6CNRM3bz6lnqTIGUCiAjGq6rK42V8/0zqBO/SrQ/cr0YCQ
 dcHXKg6SQR005BoYuNxqlxKRZ2IaGzC1y6rpqdt0WSLP3g0qOZlC1hdT6R51ANvWEzy+3csm9K2
 tw0D1F8jBVhYmz6XblJJBE0s5z9CQGApcFe3MRhbei8Bs4xjv8ty0B6Wltbg4UL+bjKCJdU=
X-Received: by 2002:a17:902:e845:b0:2ed:379:159f with SMTP id
 d9443c01a7336-2f03f0fcd59mr43071795ad.20.1795211653538; 
 Fri, 20 Nov 2026 13:54:13 -0800 (PST)
Received: from [192.168.0.4] (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2f03f0dc4f2sm19815255ad.30.2026.11.20.13.54.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2026 13:54:12 -0800 (PST)
Message-ID: <114d8912-4aee-4312-9527-69dce1b8d5e0@linaro.org>
Date: Fri, 20 Nov 2026 13:54:10 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] tests/functional: update sha digests for tuxrun
 kernels
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Thomas Huth <th.huth+qemu@posteo.eu>, =?UTF-8?Q?Herv=C3=A9_Poussineau?=
 <hpoussin@reactos.org>, Eric Farman <farman@linux.ibm.com>
References: <20261120121458.3723625-1-berrange@redhat.com>
 <20261120121458.3723625-3-berrange@redhat.com>
 <CAJ+F1C+eBx6qUmtLGw2vSgk+Pp=Zpt92_tokyyGsrCREaE45gQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAJ+F1C+eBx6qUmtLGw2vSgk+Pp=Zpt92_tokyyGsrCREaE45gQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/20/26 04:23, Marc-André Lureau wrote:
> On Fri, Nov 20, 2026 at 4:16 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
>>
>> The images appear to have been regenerated since the recorded
>> digests no longer match
>>
>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> See also
> https://patchew.org/QEMU/20261112133320.418012-2-marcandre.lureau@redhat.com/

Indeed, Marc's use of dated urls should avoid some of the issues, until 
the url is removed due to age.


r~

