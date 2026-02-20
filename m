Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D0FC55ABE
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Feb 2026 11:55:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vtP6N-0003ex-2e; Fri, 20 Feb 2026 06:55:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vtP6L-0003eR-Ed
 for qemu-arm@nongnu.org; Fri, 20 Feb 2026 06:55:17 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vtP6J-0001VL-Re
 for qemu-arm@nongnu.org; Fri, 20 Feb 2026 06:55:17 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-65a36c8bcabso3127135a12.1
 for <qemu-arm@nongnu.org>; Fri, 20 Feb 2026 03:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771588514; x=1772193314; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z+ea69BD6Zx9C+7ujIFRrVS1k1IdY+Arhg1wnLwoi7E=;
 b=REpYRBww3LZIPh0FEia5Kzu1JhNonbB8J/dbRiGOkw1UflJXXIIBnM8tDafi5cwvLT
 odVLD4jhImW6FmyQ98oANSk/zG2IdvAp6Q+RB5YM/Qsgz2RYmcXF+y9UCeDW9S0YH6GR
 P8lQR1TUQ1LxL+O45LVcoM4lCoa1junSvWWaAml0gatsMMWTt5rSFiD+eg2H0xBOXBSa
 w0RuudqdcbWkABaMmeWpyPEcfflWF94F/lLQBYeQEvgz6HWBEk0FDj6giLI93fMhiplQ
 2g6qIcvr23slNDMG2e0BxhGqzw+9dO18apDGbBqF0tMXJRt/+fJEBJMRJd0YHgUv54hC
 xAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771588514; x=1772193314;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z+ea69BD6Zx9C+7ujIFRrVS1k1IdY+Arhg1wnLwoi7E=;
 b=t6xpkWCJsjbHMxefJLAmLoDR7LqIgXCjAQMsH+l29PhxP20NBEMvNY169ABuJkS7Fu
 A9bblClf3DyQburjZJh7yIba41PW3QW/GQy4hkQlFfv95AzNJM4YMOx4UAdf2HACtPqB
 3vkk7MUW9fzqEW1wZ3zOA2Z4YR+Y/ZuAo+S3cvuu+U9kMs2o4su6IXIDWLDvQ5JKz9FE
 2jyXbOFCIhjYxvIFwCxV+KRxH8fJCMEAhbWJY9iaj4sY74gcAuLyMlHGJX5mW2U7E0Bc
 DRU5LkyXe4Xrh3K01sqSLjVxxRVKM9gqgxpbDE2ATdRN+vsDZoRzO9zOqG1e/yrjylQr
 kQNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8Kq3i4Q2HCsADuJBI/N5m1T8IU6c1DVczLlVwNj5I9vgUGIDI08YWMNxUbaO2O2vdHkcbHRlzGQ==@nongnu.org
X-Gm-Message-State: AOJu0YzyWO5gV2/Q7pkk++iWTNM6fndrAMwfdCx1KGM9Di8v59L8jY7g
 5Rj0KgDfa44+UJ7/O2LW80/CJrLK8voWbl+FvdOzwzNGP5CgiS66gjE5wWA+fnyxfTQ=
X-Gm-Gg: AZuq6aKhXnD+X3jAG9OYXn2Q1hh3nfVuUEnpjlz3ye7hJYvKvQlfOrYnvlxbuxh+DCr
 8mUFjqoQRYgQUDOuNiDZCJMEugqAuFX3gaSQ7d5/KEDpgVSR/WoT5BEx5oJm8M6E6LMS1mV1aGC
 NvL265Qhs4d050sPxacG3E/A67IwHVtNxTBp8HiaxIVFb5feEAwfOUJf31VXO+MsQis9nxJP+Rx
 PBdJ1bLDUIJTNAGmd0nLYEqBwwUj/ascmHPwMkVrV4+JlxV2XKNqtBrrhRM8gmRAsADAultQC9L
 LODJNcN89p1GFJXnT1PhynV1CsnGL+l8LDJSLW9i560RQWYzDt9wQIxkL1zrVgCgZWuqCKz6VOk
 yEwRefzmePTRT6Mqe+xYtaL24jytuPtuOlug8eisC2J50Vpi/zyaXSzImxaL6EzZsZjw+IZ1DeQ
 DM8DGklkGkiPprK7OXzxlSyR8=
X-Received: by 2002:a05:6402:3506:b0:658:d1b0:9970 with SMTP id
 4fb4d7f45d1cf-65e80499ce6mr1003597a12.5.1771588513514; 
 Fri, 20 Feb 2026 03:55:13 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65bad3e356asm4719563a12.16.2026.02.20.03.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 03:55:11 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 97C925F838;
 Fri, 20 Feb 2026 11:55:09 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Yoshinori Sato <yoshinori.sato@nifty.com>,
 qemu-arm@nongnu.org,  Laurent Vivier <laurent@vivier.eu>,  Thomas Huth
 <huth@tuxfamily.org>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,  Aurelien Jarno
 <aurelien@aurel32.net>,  Jim MacArthur <jim.macarthur@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,  Peter Maydell
 <peter.maydell@linaro.org>,  Bastian Koppelmann <kbastian@rumtueddeln.de>,
 Aleksandar Rikalo <arikalo@gmail.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Zhao Liu <zhao1.liu@intel.com>,  Jiaxun
 Yang <jiaxun.yang@flygoat.com>,  Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 09/14] target/tricore: move cpu_reset from
 tricore_cpu_realizefn
In-Reply-To: <6e90ab90-f726-4fe3-83ba-cf3aa799062c@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 20 Feb 2026 11:56:11
 +0100")
References: <20260219171810.602667-1-alex.bennee@linaro.org>
 <20260219171810.602667-10-alex.bennee@linaro.org>
 <6e90ab90-f726-4fe3-83ba-cf3aa799062c@linaro.org>
User-Agent: mu4e 1.14.0-pre1; emacs 30.1
Date: Fri, 20 Feb 2026 11:55:09 +0000
Message-ID: <87y0kn634y.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 19/2/26 18:18, Alex Benn=C3=A9e wrote:
>> Implement a proper cpu reset handler for tricore cpus.
>> Message-ID: <20260108143423.1378674-11-alex.bennee@linaro.org>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   target/tricore/cpu.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>
>
>>   static bool tricore_cpu_has_work(CPUState *cs)
>>   {
>>       return true;
>> @@ -120,8 +127,8 @@ static void tricore_cpu_realizefn(DeviceState *dev, =
Error **errp)
>>       if (tricore_has_feature(env, TRICORE_FEATURE_131)) {
>>           set_feature(env, TRICORE_FEATURE_13);
>>       }
>> -    cpu_reset(cs);
>>       qemu_init_vcpu(cs);
>> +    qemu_register_reset(tricore_cpu_reset, cs);
>
> Per commit 9f1c70a2543 ("hw/core: Add documentation and license comments
> to reset.h"):
>
> "In general this function should not be used in new code where possible"
>
> Shouldn't we use qemu_register_resettable()?

Yes - I thought I checked them all but I must of missed tricore - will
fix on next iteration.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

