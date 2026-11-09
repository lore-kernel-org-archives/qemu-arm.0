Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28298606A31C
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Nov 2026 10:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KWBSwk8o
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQMcF-0003oW-PQ; Mon, 09 Nov 2026 05:28:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xQMbz-0003mz-66
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 05:28:28 -0500
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xQMbx-0002Ce-MD
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 05:28:26 -0500
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-67bfdab8f20so309095d50.2
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2026 02:28:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794220104; cv=none;
 d=google.com; s=arc-20260327;
 b=HaiTpJOLuFh8nNIQpt4lkpusa0ITbYV6KxIyhHOWwGQt1hi8ZlU1ZGrSMctV8QJRS3
 wgTWhjbLHN6qSJ8SmglJDfTFGVX5hHg40fF7G7B21orMQEcT29iad+beoJElo8BHvna0
 vvVc0khoBwExjTBJ7tFngElwJcHaINIYrkeNADvZA7u5FYZEOrWUkAHpmpZCsQWqa/QV
 ad4tpcFllrMYjtWa6nB4zUqVX/JErJnvzYNIj9DkUaErjqzMD2kca+UHctR4o6a+0s75
 l31qrPJPCqPKUwSb3NU4M6+0alDj5lOd0mFVbN1FUucqth3IOSNts5/rr6EYeZXZusYa
 pAuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=EkbMbvfKxbPpEJofGKP0L5Rx5eYXZ7QObRfE6GwoIAY=;
 fh=Lk1vrqCzdR/2Vw/x+macVnp2oeZ7qD/tZ9eZofFcJBQ=;
 b=FU1CDpsD/iup4WRyCGfkAIWJks3zPDVTzu7stGafM4cKsHOMWNwZ2UihBD/tegzugR
 paJ82cOtOw5+ZMCmXbnH1lIFFckCB6gbL9mhMmlNorP8ZM87CiBUNqwM9QwcrhyhWDMR
 ApKkd4BPFro6kdSiVwOQL4ospD7Hf6o89J/jjKTYzjGS2KNgji8e5kvAMFL+YkEaMdes
 CLXvg3oY0QvVb6Tjk4k+g0cBrn0sQoMHk/5nuVYLchTqEnpWCni87H2XWBZfmsIng7AT
 /MbAqWdcHmeeEJh0iHfU37ZdVIFXBrlkewMXdN8D2UEIrMgUI1bXSzD40+QgaP/OtOLH
 7pSw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794220104; x=1794824904; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=EkbMbvfKxbPpEJofGKP0L5Rx5eYXZ7QObRfE6GwoIAY=;
 b=KWBSwk8oyXT9AOb1whlyPmoPIE1Q1ohEFB1N+owF2o4BAmBKrFrC2sSD8bnZfbzWEc
 p7nD9ldUSw9k8RwFgydCK1iQHJZo5NhZyl0IPgBoC4ebabpxCPc7Py5EWh8Rwz9VFP7e
 u7QmJcwfjQXCiDwfv1LpUVL0x21ePxeb8Sq+ILWdk+eOnejyMFd8ctEM0JSzCuvZNJ1D
 e/1U5n42+qqmpmqn7kK8VMy7Z1DrQ8WteibmeV/9e304G/vrQGXLwFbD9DeK1aR5H6zQ
 +UAZcYjjsBZ8gJvP9QMLrJ4XuePcu7hwsie9EcqxLri4cWgaIyKOZq/SrsheTbxw1tmQ
 XEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794220104; x=1794824904;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=EkbMbvfKxbPpEJofGKP0L5Rx5eYXZ7QObRfE6GwoIAY=;
 b=yu7oV+T7DCh8XlNZTzZa/Mqah/a/Nh+pjz3AEPCF2YEHUtZp3wvw1vQqswZwaeecAh
 92xeIWXBzdXSqCIDe/2JMHmstGrSUM9ojxeNSxzJ1piqvgCtaXxREqj2jiTNp7Dj8aM7
 s8uQl01NV0XdmBDs5/8ARVjNXsWIY4E6XHpoYJvl4obdPISB1h+gtTY8R7+s4sBeceL4
 CWgUA+mZCMy8fcRZot2bDDupkI9yHFD6yUK1o95DzYAzO6RM5j6Th9oCez9vGj7bVlMU
 Az6rz1WNP4mAHbepu5qeTpV0AsFmPRGLpxbPC/xW8D4uFyPKBSmTtTyldp+uL+AOfa2H
 vXSw==
X-Forwarded-Encrypted: i=1;
 AL+hErHfPXKOntt3JBAlgX7lCtEIBNY86lwnHjq8K4MkY2ry/mRoU0VTaXgUwY+moDcxZXBrr0u9n9UWoQ==@nongnu.org
X-Gm-Message-State: APuU4Z+iVtLNZby6bFGauzAu1xR6l6tuDOEoJJB0UOxG/P6xgKDh4vGG
 CdR0JQYl+7WBRz/6Ntsham5/s0dadTxHlI924cDpj3Y+O//y/QHs1ThqHhwoUyBrzL3plLfXyXB
 3sJ7odf8WU3ivnLnLR+z3jOj4OhRSCKV+2nXoZJKqSH/khMdi0KuB0XA=
X-Gm-Gg: AYBFou2ZWePmFgLgiKatnk5+FQkgnxvyLQ0TYnvzg5DYjVWhKe6zx5V37s6B5FWDBwf
 zY5KYd2HCfSY97PvPLfrRzhfQS8cg+k5jjy5zZSojBaEtJyr6zkTUs3UzK5GWXRuMUhqVXp3k5B
 ljo1YE4VpICALMqwuXmBJJi7qWMvLYYvssR16mkRd8IsZHzOoDl0kN4SbqThSGth2dOXKDE9/Hz
 JMvZFicG4MGEvUSElrZV43G4ZKHBtIx8OPyYk+q2G8Kiu4Zc4kVgR82ZMHzf9yMY7IbG6PpZfnX
 XVXkOCYexPfaLaeZ/HogvNtpLwtyMGQHkIyDYuKeuIo01fT94+I5jIxci4twXEdzPEtWE3ap2c1
 KQxwfirMQ4uTa+6Q+3I4pU3Aqd4XTHElCc9BP30GC0JQmbhWK8rVqG+J4CFEia2dS0+gMVaV5HS
 /n1PPqvcwbfpjddIRo1Ip4
X-Received: by 2002:a05:690e:4807:b0:67c:2804:faba with SMTP id
 956f58d0204a3-67c3d96dcbbmr1175686d50.23.1794220104205; Mon, 09 Nov 2026
 02:28:24 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261108-armv8-exception-return-clrex-v1-1-ec11079bf695@chrisnc.net>
In-Reply-To: <20261108-armv8-exception-return-clrex-v1-1-ec11079bf695@chrisnc.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Nov 2026 10:28:12 +0000
X-Gm-Features: AclHuK8ML64z4UUye3-l6-HYcStOD_pRmRhA3dzrpJJ7bNW9JY7ynTW4VaLsK-0
Message-ID: <CAFEAcA_Xnyf8f0szzgZYYqqagEmTffg-E3_v7P20XveSvXWvBw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Clear the local monitor on AArch32 (v8)
 exception returns
To: Chris Copeland <chris@chrisnc.net>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Mon, 9 Nov 2026 at 00:01, Chris Copeland <chris@chrisnc.net> wrote:
>
> A/R-profile exception returns prior to Armv8 do not clear the local
> exclusive monitor, but in Armv8-A/R it is cleared.
>
> From the Arm Architecture Reference Manual for A-profile architecture
> (DDI0487 M.d) =C2=A7E2.10.4 "Context switch support":
>
>     "An exception return clears the local monitor."
>
> The same language appears in the R-profile manual (DDI111353 A.a)
> =C2=A7B2.11.4 "Context switch support".
>
> Signed-off-by: Chris Copeland <chris@chrisnc.net>

Oops, yes; we do this correctly for A64 exception return
but missed that A32 returns need this updated.

Applied to target-arm.next, thanks.

-- PMM

