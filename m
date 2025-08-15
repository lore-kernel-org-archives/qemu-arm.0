Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FDECA0ED1
	for <qemu-arm@archiver.kernel.org>; Fri, 15 Aug 2025 16:30:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umxJY-0000bB-9i; Fri, 15 Aug 2025 12:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1umxJX-0000at-76
 for qemu-arm@nongnu.org; Fri, 15 Aug 2025 12:29:59 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1umxJV-00082T-Jf
 for qemu-arm@nongnu.org; Fri, 15 Aug 2025 12:29:59 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3b9e415a68fso1910652f8f.2
 for <qemu-arm@nongnu.org>; Fri, 15 Aug 2025 09:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755275395; x=1755880195; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aUgZ+KVuNdEYqt+yAn3+wWUDhlf1k1kEZldqgXlJQhE=;
 b=xsrNxJXPWr8tBeJ0K/GyVNj3bpurfA1PKPkMsIJcEP5PHjEo4SGOeUeqd49ktntLIT
 FQimC4DtuQjg6EKoj/OkpZX+bRmwZC6dPsec3oY0M7WNaa/xlmAeZ2iQ6C5pw719h9zt
 F/DYYfh6xXOBg50LP2rOMuztjv7aI9MPJa2CJ5FnqsInzoYKQq0ioW8jjDUFH8XLtkDs
 drO0DkIKdmNiwVn+2fF6lM2QmZFKbwD7o4aGwmciLEbwkgOvy+2HEoCgfHgBcoqEVe64
 MVwhWUBzfj94KNz7Qz7jVBT3DbFC3vQtKhWmmCuXM05R5NGckKXbYzJVTTKoBlFdlIJI
 VJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755275395; x=1755880195;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aUgZ+KVuNdEYqt+yAn3+wWUDhlf1k1kEZldqgXlJQhE=;
 b=k8oex411rIx8B1+jELJE0JdnMVnSy182NKBKEMhyTbH50A6jDzIVM9mw0nS9yDTZdf
 3w1jLlI0hPeSPB2CL7/PI/Znyo9nKg2nN6TKRrmh2dDwC9YncNL6GdlQv6RThMpmwxwu
 3xSNAqKRTI6hjp7EwMo/41xPsoHFXNFwk5eW9Voq7tqjJ5HoI8vKJKkCE85MFbXiOQrm
 sv47ftvzn3d4VdcgiFx6JA6gr74pgYXt7vm4TY2+oeE7+c2wfn8wRfWAeMWy4lvQg5fp
 hffaToGJ5joXYnkeCRPz4E0VdSht7YskFZQj9OpDzsEALk/DGAqPKTJng26/xsRR5KCv
 VCwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzuN2GYcHvtXeXkLKYNC/s30N+jTeA4CzpuORSIMZOmhNvrhcBFXxtinLvnda7LaYexUi357iGhg==@nongnu.org
X-Gm-Message-State: AOJu0YxkTwOICeQxeSU7MO2alQF1DyopwRyCVU3+tpOOVlxuIL+BfE8Q
 TIrzx5TQBPqXhWQAwahlQO7PpmzIRDUYg5ygfodcm1hlAs9dwu4HEbJ8800SDngZaug=
X-Gm-Gg: ASbGncvQvvlayDcFq58GrtOdsV8kv8C7ULs6NdxEp6WM1vQt0pv3p++JKQ882w10RpJ
 /F917f15gOboYJwa0Z0anc5va+3qY5E6+/31xQ0SSNPAq7y6LCD7jOjbMgIsD3Z7AOZZ3RGieKV
 Vb+uwg5rEsKMggVQuDeX2RhfwEgFDpmUJ6a1fgAHLMisq2SllPqit3QVKwKqCy+OzHQv8L8CD6p
 dw9/SXWIcnWkKRw4Sgvgogh8VZL3u/E7bzio/cMbDcDN4nkdMGCel85mhv8ngQw3ye5UQub6h82
 I45OIZ1mowBIBZVFWrKqmIcXyvEdyyR5k3MFblX96ZpIw98O4V3JWvk3VncKSKaTleC6HGD8PnU
 l46io5FQQOZLDykLEm/1Zgjc=
X-Google-Smtp-Source: AGHT+IFAPKe6AQobJBZXbYdwy17crM6EayxdzUF1PXqkuLLrb9Q5eqs2zR8Gx9g8juDGcuYfX1z6Xw==
X-Received: by 2002:a05:6000:24c4:b0:3b7:e3c3:fbb6 with SMTP id
 ffacd0b85a97d-3bb689218e2mr2404622f8f.31.1755275395233; 
 Fri, 15 Aug 2025 09:29:55 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb64d307cfsm2418326f8f.18.2025.08.15.09.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 09:29:53 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 012775F80F;
 Fri, 15 Aug 2025 17:29:53 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Pierrick Bouvier
 <pierrick.bouvier@linaro.org>
Subject: Re: [PATCH v9 2/6] tests/functional/test_aarch64_rme: update image
In-Reply-To: <CAFEAcA_ZQ13qMRUQsieJiEPV=ULrDbz8=EJaW4_kw=yEysob0w@mail.gmail.com>
 (Peter Maydell's message of "Fri, 15 Aug 2025 17:08:16 +0100")
References: <20250727074202.83141-1-richard.henderson@linaro.org>
 <20250727074202.83141-3-richard.henderson@linaro.org>
 <CAFEAcA_ZQ13qMRUQsieJiEPV=ULrDbz8=EJaW4_kw=yEysob0w@mail.gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Fri, 15 Aug 2025 17:29:52 +0100
Message-ID: <87349s4kfz.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Sun, 27 Jul 2025 at 08:42, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>
>> TF-A needs to be patched to enable support for FEAT_TCR2 and
>> FEAT_SCTLR2. This new image contains updated firmware.
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> Message-ID: <20250719035838.2284029-3-pierrick.bouvier@linaro.org>
>
> I see this test failing in local runs of 'make check-functional'
> sometimes, complaining that it can't create the scratch/out/EFI
> directory because it already exists:
>
> stderr:
> Traceback (most recent call last):
>   File "/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/tests/functional/test_=
aarch64_rme_sbsaref.py",
> line 49, in test_aarch64_rme_sbsaref
>     os.mkdir(efi)

  os.makedirs(efi, exist_ok=3DTrue)

would solve that.

> FileExistsError: [Errno 17] File exists:
> '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/functio=
nal/aarch64/test_aarch64_rme_sbsaref.Aarch64RMESbsaRefMachine.test_aarch64_=
rme_sbsaref/scratch/out/EFI'
>
> More information on
> test_aarch64_rme_sbsaref.Aarch64RMESbsaRefMachine.test_aarch64_rme_sbsaref
> could be found here:
>  /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/functio=
nal/aarch64/test_aarch64_rme_sbsaref.Aarch64RMESbsaRefMachine.test_aarch64_=
rme_sbsaref/base.log
>  /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/functio=
nal/aarch64/test_aarch64_rme_sbsaref.Aarch64RMESbsaRefMachine.test_aarch64_=
rme_sbsaref/console.log
>
> (test program exited with status code 1)
>
>
> Is this something where we need to blow away any old output
> directory for robustness ?

Generally scratch is cleaned out once a test finishes (unless you
preserve it via QEMU_TEST_KEEP_SCRATCH=3D1). But I guess there may be
cases when it isn't cleaned out properly - does Ctrl-c get caught?

>
> thanks
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

