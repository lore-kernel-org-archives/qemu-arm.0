Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9693FCC05A
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 18:36:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vya1y-0000JJ-2j; Fri, 06 Mar 2026 13:36:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vya1w-0000IT-0V
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 13:36:08 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vya1s-0005oY-5u
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 13:36:07 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4837f27cf2dso89392245e9.2
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 10:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772822162; x=1773426962; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YiCX6ga24zD3RmkJYcZJqji3xTxNrBSaoqg/AAeKEyw=;
 b=PXnzf6E1GD9few5ZJtd6FwYTsBh9c6zmvVRm0LTbsFUmCnhapUyBpiLirYnn73B/PQ
 zDJB9YCJKSsaTDUeWIqTk4AUWQAzxyO4tTZjJm8m24BwGRS65aCYFZFzAZzMILt0NS+0
 zh38E4dnX73skXa8hXUFohrEEhUWRcylgtLxa2E9QRMT0cFZ0GRh1NNha4NGYaiWZXok
 AlApnZGyvuhhOWrlkTwZ/Xe2o4k3wr3OZYwykMROTE/XoUwQntvUZASZUp4UHlvDOlVr
 SBozjyBupv/WC1EP6tKJOArLKjgxqwMweH3Mf4Eku6zoP4gfZ4ZHN122rHC0o0Ta/zZp
 k7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772822162; x=1773426962;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YiCX6ga24zD3RmkJYcZJqji3xTxNrBSaoqg/AAeKEyw=;
 b=Wgee8qxHskvRunpYWJ/hxHQPM8QdgyniYA84aHvwEoA7GOV+Kt15NnOqYOxUTsxQOR
 TODiV4ooD3oUHN/DdCtAR+UiR9dkJ8wMJ6Yhx2T7E2eHDKj0dxxZNaREGMTRlcuRWcAb
 TASobQ4cFcVOLM2TkCTfq2afNQUKNP6wOo6F7na+JvjCv/yVsQsVcIFHI+nL24/EakLl
 aqfs9rMKzt1jZbcZJVz2O9GLVj7S+t0OkdNmqPUw9TFVuhhIc278k3byApvRMR9PhNqg
 HbH+yv6pC+LbQXAjayCMf0KwIYGjCPvPaU7F4FRlV443xf5r5xac6hZ8h6lgTPCHqNg0
 WrMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeflQ0pNJfcz7oYDxb88FE9SXcctYCy5ebeO51aJfKhTG48hlRlp/QV+kZkvvqJjwTy2IlqCY1YA==@nongnu.org
X-Gm-Message-State: AOJu0YzSYIL3/+hNAkUUnNiH/qY7rv+t9xMg8169cHs7Q1PbFqQWfgVG
 faILCEFY/37veedksYeZZiR+IodXBKeKyTTUDlbTXBExlXvRBlx8ilTaVrzwjjdsUbE=
X-Gm-Gg: ATEYQzw7jSVp6Tx2rcG3pXy5wVwdlSRCvC23qv31Sbu3KS/BPUcV1EosfPdBrU+wA6Y
 o6L+dQptWx28jULg4KGm86eR/7u0LPD86OKSd+wUQ2otiscbg2k/nsPwyDEcsQYevcirJUX1ZpG
 o/I9AqG1ZeYdrv1zX0dho7cuXFsjgfGM4NsbMDxpT52wISUuMU3xKC2Be6jo4pAwJcbOFc7A40V
 YrHr8afwGewPCba750j2hu9zdbalK/G0wN20sisELcjd21ux58NTBQEDgNEYCaH9M+m7F/Z6IVR
 x+PlOD6aSXRX/9zTHetAKHMEO3PzxXYfKeF5is1e9PIocjojUq2RlH10kOcbVdkQ/JBjgB4niur
 DEW2J9gqHMc16mBSAOktlS24xfIu/In5syazaQyCvJxu9pWECYYfu9R222xkMahGfHcEaQTVySg
 XZ5U6ZS/i0bz+nvT8JhPW8cgumdR4e4AeVBg==
X-Received: by 2002:a05:600c:698d:b0:483:acd9:bd18 with SMTP id
 5b1f17b1804b1-48526917263mr59113965e9.1.1772822162237; 
 Fri, 06 Mar 2026 10:36:02 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48527681a3esm118051075e9.4.2026.03.06.10.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 10:36:01 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9DA34689CF;
 Fri, 06 Mar 2026 18:36:00 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org,  Brad Smith <brad@comstyle.com>,
 qemu-arm@nongnu.org,  Kyle Evans <kevans@freebsd.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Peter
 Maydell <peter.maydell@linaro.org>,  Thomas Huth <thuth@redhat.com>,
 Warner Losh <imp@bsdimp.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH 2/7] tests/tcg: allow filtering of TCG tests
In-Reply-To: <5342a38e-ee34-4d52-928c-e60028848e2b@linaro.org> (Pierrick
 Bouvier's message of "Fri, 6 Mar 2026 09:34:44 -0800")
References: <20260306161728.2657486-1-alex.bennee@linaro.org>
 <20260306161728.2657486-3-alex.bennee@linaro.org>
 <5342a38e-ee34-4d52-928c-e60028848e2b@linaro.org>
User-Agent: mu4e 1.14.0-pre2; emacs 30.1
Date: Fri, 06 Mar 2026 18:36:00 +0000
Message-ID: <87v7f8n6un.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:

> On 3/6/26 8:17 AM, Alex Benn=C3=A9e wrote:
>> We have a lot of TCG tests now which can be fiddly if we just want to
>> check one particular test type across the targets. Introduce
>> TCG_TEST_FILTER to allow this:
>>    make check-tcg TCG_TEST_FILTER=3Dgdb
>> to run all the gdb tests across the suites.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   tests/Makefile.include    |  8 +++++---
>>   tests/tcg/Makefile.target | 12 +++++++++++-
>>   2 files changed, 16 insertions(+), 4 deletions(-)
>>=20
>
> Ideally, we should have a list command available also, so we don't
> have to guess what magic pattern names follow.
>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

If you run "make help" in one of the TCG test dirs you will get a list:

  =E2=9E=9C  cd tests/tcg/aarch64-softmmu/
  =F0=9F=95=9918:35:48 alex@draig:tests/tcg/aarch64-softmmu  on =EE=82=A0 p=
r/060326-11.0-virtio-gpu-updates-1:master [$?=E2=87=A1]=20
  =E2=9E=9C  make help
  tests/tcg/aarch64-softmmu: -march=3Darmv8.3-a detected
  tests/tcg/aarch64-softmmu: -march=3Darmv8.5-a+memtag detected
  TCG tests help aarch64
  Built with aarch64-linux-gnu-gcc
  Available tests:
    run-asid2
    run-feat-xs
    run-pauth-3
    run-semiconsole
    run-semiheap
    run-vtimer
    run-mte
    run-hello
    run-interrupt
    run-memory-sve
    run-plugin-hello-with-libdiscons.so
    run-plugin-interrupt-with-libempty.so
    run-gdbstub-memory
    run-gdbstub-interrupt
    run-gdbstub-untimely-packet
    run-gdbstub-registers
    run-memory-replay
    run-gdbstub-mte
    run-plugin-memory-with-libmem.so

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

