Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C843CA0EE4
	for <qemu-arm@archiver.kernel.org>; Fri, 15 Aug 2025 16:08:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umwyn-0005Fi-P8; Fri, 15 Aug 2025 12:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1umwyl-0005FK-DW
 for qemu-arm@nongnu.org; Fri, 15 Aug 2025 12:08:32 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1umwyj-0002Tj-OD
 for qemu-arm@nongnu.org; Fri, 15 Aug 2025 12:08:31 -0400
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e933460ee86so420716276.2
 for <qemu-arm@nongnu.org>; Fri, 15 Aug 2025 09:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755274108; x=1755878908; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eY/Xd9SoGmOBtP6Y4PhgcXLlQ3bEJqzFHMhcJISIziA=;
 b=zAwbZWtu80s/46I8qUXqTl6OQkjLa+kcThVo3wilwhuCMGlNDt7owHaOuUOYffmqmv
 iU5KZclbXLhYF0aNQCMhSjJxWAG/eKsZ8k2KP/CLOLr6Io9Zk5TpJFiHq4uLucjYjc+N
 H3v2NVn+OiiVL6ZjZ7pRaR1ufQJ3OiDxqCTKFxA6OOruZuZaoGi6lz9vrjFZ74+ehBqj
 ZsYtB3V5QAfaYKCoek3ovoLUtPgTx9GTKNSj54Q4eojIzc22Xv+2tQYuDkXhcgXsvU5p
 LRnN7O4I6RXeyrPXpO6uwUiy1qin8DzfzK6yB42E4q7++FLTawAhLpEX0sms8g42mpDk
 zJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755274108; x=1755878908;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eY/Xd9SoGmOBtP6Y4PhgcXLlQ3bEJqzFHMhcJISIziA=;
 b=eZ+lKDNsyhpD2+lbMOI1tAigBUoFpW0eUVuiD4XZwkUVSCkcgOjsOE9WQa2it2dzdJ
 cz8ay/j5iqZJ7CQGjvvpLcZi2SEBfYhP5FMJqUE72amLxcVmtbCei6RGMhUelf9scJLX
 2flS3wjtyFM0R5XQ3TUbb3jjMCG9CZy0XAWY0UzCm2Aneie8fJMYPW0Byp+MmWE/LbQW
 oURTFa83wLQoWmuZrvDq/E3AzrUvtAY8ivsAwNjEHC2/38xyblKgrBZe40HF1ltd2FJ7
 XcLagjuzBX0Gwawycpx4cOM9h4jGIOEdmhwcpDxaX4AEb84ZxOB9j4aAKvhLkGHiBYK4
 llPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEe76eX7QxdGWSyxnapdF60vdC2LqywM69Ef25fpszRHNyYzZzixa3AYulQfRFvyJyjTKJ1aWJZQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzt9aavSSIH6Vk+EKV6il31xkgQHZiRVyMXN4VRTkpQNJH6yVsB
 jDbjPwxfaN24j7Nvf/8siJcCn1z/o7FEPFqj4TFQUU4Qu0otvFVWG3XusiuXZeZrMe8BLoyfIj7
 ERq8cCCVZsmuDkcsYAzXM9hybGQEen2LUngjGC/lqk/DBUaanZHc2
X-Gm-Gg: ASbGncsiQGreMJy1h4xA6CKsZzeiupDe9N4ABHoCHa6JGS0LuNS00fh6NMleP263I+v
 /oBoN5jIwprCLUuFv7MGuo14deahPKC0Nom/maIr8XZUoxocoHL8dR/+9SESmiE1nyheFgjp2gA
 nUePF1+c/1aRwPEZd9mijww0Um+JmmmPZxPD+sZp+ms7SsS1ahYYYKkECCiPYSNUXUeyi0qD8p8
 p1idtQA
X-Google-Smtp-Source: AGHT+IHfWpKPqRSRXqpJGPyX+nNHM0+P8djUk1isJBydpoiMLJjjiuwVc0DkjZMo08V6MOMxY50XWvlOw2sn7DV5mK0=
X-Received: by 2002:a05:6902:f86:b0:e8f:d7fc:dc with SMTP id
 3f1490d57ef6-e933237378emr3507765276.6.1755274108495; Fri, 15 Aug 2025
 09:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250727074202.83141-1-richard.henderson@linaro.org>
 <20250727074202.83141-3-richard.henderson@linaro.org>
In-Reply-To: <20250727074202.83141-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Aug 2025 17:08:16 +0100
X-Gm-Features: Ac12FXxz3d56QEg4n0O5yvltQsoDgMvagSO7AHlsiDYGBd_6oGsShLmgMcLx5DE
Message-ID: <CAFEAcA_ZQ13qMRUQsieJiEPV=ULrDbz8=EJaW4_kw=yEysob0w@mail.gmail.com>
Subject: Re: [PATCH v9 2/6] tests/functional/test_aarch64_rme: update image
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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

On Sun, 27 Jul 2025 at 08:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>
> TF-A needs to be patched to enable support for FEAT_TCR2 and
> FEAT_SCTLR2. This new image contains updated firmware.
>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-ID: <20250719035838.2284029-3-pierrick.bouvier@linaro.org>

I see this test failing in local runs of 'make check-functional'
sometimes, complaining that it can't create the scratch/out/EFI
directory because it already exists:

stderr:
Traceback (most recent call last):
  File "/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/tests/functional/test_aarch64_rme_sbsaref.py",
line 49, in test_aarch64_rme_sbsaref
    os.mkdir(efi)
FileExistsError: [Errno 17] File exists:
'/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/functional/aarch64/test_aarch64_rme_sbsaref.Aarch64RMESbsaRefMachine.test_aarch64_rme_sbsaref/scratch/out/EFI'

More information on
test_aarch64_rme_sbsaref.Aarch64RMESbsaRefMachine.test_aarch64_rme_sbsaref
could be found here:
 /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/functional/aarch64/test_aarch64_rme_sbsaref.Aarch64RMESbsaRefMachine.test_aarch64_rme_sbsaref/base.log
 /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/functional/aarch64/test_aarch64_rme_sbsaref.Aarch64RMESbsaRefMachine.test_aarch64_rme_sbsaref/console.log

(test program exited with status code 1)


Is this something where we need to blow away any old output
directory for robustness ?

thanks
-- PMM

