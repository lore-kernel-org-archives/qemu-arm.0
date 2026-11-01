Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD4D606A324
	for <qemu-arm@archiver.kernel.org>; Sun,  1 Nov 2026 17:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=f2a4v76m
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNZmM-0004FW-7A; Sun, 01 Nov 2026 12:55:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xNZmK-0004Du-4i
 for qemu-arm@nongnu.org; Sun, 01 Nov 2026 12:55:36 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xNZmH-0003qr-Ca
 for qemu-arm@nongnu.org; Sun, 01 Nov 2026 12:55:35 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso23422255e9.3
 for <qemu-arm@nongnu.org>; Sun, 01 Nov 2026 09:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793555731; x=1794160531; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=kbyVS+otGky4UZYa5VNF43sU1BE0orrmhILbibDS1L8=;
 b=f2a4v76mvzysQ8iQws1M2kecWaxbXwMPuHofKyacjsTyf33UrKKSDSDJH+gZBwMqGu
 zOet26VZikZWXxjdv6woYBjPfxE6W0p7pf3ST7saFT1oxVsUOqE+RRIh+To4DpfYaWGF
 kVU7z4OPWwfO21g2xN2zM6qdNEj6SqstDWZJau052QoMNYjvAUIIvEJLVhfEophY+bmD
 jcXAzyBqZ1mxGC+Rb7jFbta0Zquz1yDAADuxu8+J0rKsfflHKSgjbReyY010N4Vn4eOR
 X2pkc3CTA+Nm2R82DbSkz6Wq5BOw4DW+BRDDojIdX07326lLi3i3jLuz9F6OWgQqWTgv
 OSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793555731; x=1794160531;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kbyVS+otGky4UZYa5VNF43sU1BE0orrmhILbibDS1L8=;
 b=02aAHjbBNy/xiRcF3/4VwyIArW+S+cMYI1hJ3rkh+LUnddV5nR7nXlT/fuqA2vm0FP
 wMqpeoQIxMrq9YvwAXxgqoLf5If5fZMzX3EeqMQ4Pilj/h0q05GZmERnyjgIXiP+rIWA
 5e48d3xWsH+tzJg4i4unqtlZebeWbA4OefDNWG6ckGGsofcDjdGI+7ZunOgW6e1lZafU
 CcGAex8wIQs5eibVa/qwfd2efsvhUS4+oCEBrV+q297OgmoM74Q8g6Ok40cxUCvMYetc
 tI0/98duMGSz2O5PPbYm5yuFwD4tMyQqMdmxjP88HX/riIP+uNFf3bn/hAcD0QUMCaGc
 VTaA==
X-Forwarded-Encrypted: i=1;
 AKwUvBx1G64Osm/zCoCXzQAaQ85E20j5/NUeMooM0YjxDbz2tCEPm0Ww8cVAdVc/W/KMHFkBYRSUMka/Hw==@nongnu.org
X-Gm-Message-State: AFq9FYKaIKZMqo6S+ogI+Ygd4Mtyun6MaMmWWY3HXdbK7IMlwnCe26kp
 xpEcMij1o6YN28pM9LAnOhW+7q2PgXMwpE/I5D0/3EcDWVUyFiJ3yL9/NYd8Js1zZNY=
X-Gm-Gg: AYBFou3I8REPvS9Gl7USyMn0HlhAViTtSA+RZmbczne/8VtOxPjJ3AX7fiYbsgrJtvf
 xWet/99V0al23U5IMwmkJBIeQ60QvdKq/+GxCQqFHIInILumd+8cstBqt8lYObb4FLeolIfCmPg
 ZkBDbEAlBQrHfDPz3X3vQnteIGG1T1fbB2ISFdBoYT3/TQFAkZ8Afe9ARO2LEPZog4a80Hbc0JX
 8W4/HvqW3uPjWDTr4SJlBQ+9oLCbT2ZSfIq95TWjOea478GmZoMe3xShGDpOWguxGCw7wxpxR5E
 VR8jqqr7mM+vDvRdOyi9+w+/JpQ8OTF/xUWoN32kvNZSGwkwDUklpax7PqaSTv0D17NTnkz3GwA
 ng6vATSvUN/G6MKKmhkNbIOkemcUFjybLJb+t2z/cFiXHXHRvVsB7d5zcG4IbKIMwR5iPRLggIq
 p6hXY9zDE0LlYRZpT2vUSyY8SEwjk95fz+rQE8CgTWENNzjAHczbz+SoRN95N3dOrFYGUbsbE54
 z/kuhtezh39bGd+nSnVcBE3++9pca+4DHV6n/q3qZRKnETBCI5B7ULZZE6j/Wd20by2JQazfkyT
 dJl9+MaXRqgkf6aJyiOT5er3rsuM
X-Received: by 2002:a05:600c:46ce:b0:4a6:7d6:821f with SMTP id
 5b1f17b1804b1-4ac189928e9mr190176175e9.29.1793555730743; 
 Sun, 01 Nov 2026 09:55:30 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa820492cesm311964355e9.13.2026.11.01.09.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2026 09:55:29 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 29D315F833;
 Sun, 01 Nov 2026 17:55:29 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Lorand Marton <lorandmarton.dev@gmail.com>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,  Richard Henderson
 <richard.henderson@linaro.org>,  qemu-stable@nongnu.org
Subject: Re: [PATCH 1/4] target/arm: hold bql when SEV sets the event_register
In-Reply-To: <20261101172901.873975-1-lorandmarton.dev@gmail.com> (Lorand
 Marton's message of "Sun, 1 Nov 2026 18:29:01 +0100")
References: <20261030141046.2710206-1-alex.bennee@linaro.org>
 <20261030141046.2710206-2-alex.bennee@linaro.org>
 <20261101172901.873975-1-lorandmarton.dev@gmail.com>
User-Agent: mu4e 1.14.4; emacs 30.1
Date: Sun, 01 Nov 2026 17:55:29 +0000
Message-ID: <87ik2g77xq.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Lorand Marton <lorandmarton.dev@gmail.com> writes:

> On Fri, 30 Oct 2026 at 14:10, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>> There is a race in qemu_process_cpu_events and sleeping on halt_cond
>> where we can miss the setting of the event_register which would cause
>> arm_cpu_has_work to report we shouldn't sleep. As by definition the
>> bql has to be held when we go to sleep against halt_cond guard the
>> kicking of the cpus by the SEV helper with the BQL to ensure things
>> are properly serialised.
>
> I hit this race with a bare-metal test in which two CPUs pass a turn
> back and forth 500000 times with WFE and SEV (virt, -smp 2,
> semihosting).
>
> On master (af1179b406) it hangs in 10 of 10 runs with -cpu max and in
> 10 of 10 with cortex-a72 (no result after 20 s; a passing run takes
> 2 s). A second test, in which a CPU waits in WFE for a broadcast TLBI
> and an SEV, hangs in 23 of 100 runs with cortex-a53.
>
> With this series applied on the same master, the first test passes
> 150 of 150 runs (50 each with max, cortex-a72 and cortex-a53) and the
> second 600 of 600 (200 each).
>
> Tested-by: Lorand Marton <lorandmarton.dev@gmail.com>
>
> The series has no test case now; I can post these two as
> tests/tcg/aarch64/system tests if that helps.

Are they hand written? I did include the test cases pulled from one of
the bugs here:

  20261029161310.2065290-1-alex.bennee@linaro.org

but I suspect the violate the current AI policy.

>
> Thanks,
> Lorand

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

