Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC3ECAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Sep 2025 16:14:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyBqE-00040x-2p; Mon, 15 Sep 2025 12:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uyBqB-00040K-BL
 for qemu-arm@nongnu.org; Mon, 15 Sep 2025 12:14:07 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uyBpr-0003b5-04
 for qemu-arm@nongnu.org; Mon, 15 Sep 2025 12:14:02 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45f2cf99bbbso8644295e9.0
 for <qemu-arm@nongnu.org>; Mon, 15 Sep 2025 09:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757952821; x=1758557621; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eO/ldWjErKpfl976r4mFLe5HyjWQ1Qm8Aiwr3AGIXXw=;
 b=qW2dFHOCsduvxIWNt/4kC5wnkdbNWtK1qlFhA/SL2M5oLWy12bjKfLTRmIAX5A4AUK
 JJWzW6tq+WJ5Yku2EMQ7wFMQpaIwovRzyhfBjdjJhZ1zr7VV5aOSLZgfk95FBIkai9sc
 2NGF8qYkBlyO2cScN1RoJd7rPVXCFtHa9JfR3Stgt5l4BlH7qRh7Li3Z58PZaN5UPT+w
 2suYOtouF2sn+abkYMQv0zrrKzxPCUvLbu3dcSPMgxkj/UBwsFNJGKRvlTEsXcseIHBC
 8FoBGqCRsszXA2/Uifdov/zoy6SdS2RrytIp39+JcUjTvWSCJD45hHWSuu6PzN5tWpbW
 aOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757952821; x=1758557621;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eO/ldWjErKpfl976r4mFLe5HyjWQ1Qm8Aiwr3AGIXXw=;
 b=Z3XNOe+BHKyUTGCHFlxgyvoMCRhDB1ySacI5fTa8c17K1aB4I9Sm1ylc+Z6xtbDNaN
 QiejQ+UqJXcoZ3/RIBSMpoYHsC/ElBKujIJoTDq32VyUrcRPktJ8NObNW6BsubkT9ZJ1
 JI/SFf2/5L/Sie/vQ9zuykHkc6GI2lZtLWXg68GNXWptM4psB41779MWF/r+Z3gO6baY
 NxJZQO+5V37fLtOB/3YxDiXChWMugHb5lLGbkMVXU+e7theOyKcGk+zWkoXcl68hYTDT
 jCYHE9JyrpTaveUyTW8GOaxWHEHLvmdj+0xrvdXtvzrXwHalHR+nM2ltwHKnwZayFwpo
 VYKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUln4+N3Ap18mEoSCA2YFKinknLFHd/GrRJMeXu6S4d679mdLCLfRmN+PtxEBvMyFfDNElj9qo/dw==@nongnu.org
X-Gm-Message-State: AOJu0Yz6NKExLkMHlXgFex9MAFoy37ma0DCNK5z+HvsELAAAW2PJiY+6
 bFQbb6DwkOeyZIDlHSGL9QT06fdVR3ytxZfZbi+Z12IdICrEv2I0MORyG+VpXg/uAME=
X-Gm-Gg: ASbGncvnLhPIlFYOcSfmklqRs7xRyJ1dHkYSi6PDhiz65iNFuH/x46AAxHXb8+kCfzd
 Xbhsb5yfOn69+PBDxKMXe4zGiFrkz5GTdPXgpmQ9Yn3PWC39pgNqodAk4KTHIwID/wo4nXxVrb1
 TxVhwhwCjnbN8vtbehl4+klydKnei6B3iN6YUtl8qPIYTX7jiP0jUUnm8sC2jxsZrgrQRV/ZqwB
 sMBxOvLsZ2Qo5qZgGEHwlVVbIlqQoYGLMex7z2s5agtX2hl9PKN3ZDLBqOTAl3F/dPVtU7Ljen4
 9X7RtBFwKsjIp8CeLL+8aA4VZk/385KkRWQWOlabAGdlgtBE6DlI8u/bRaSQNtsXh3BOueFPED3
 jHZ7fRSA4yckQxyTjquHx/mPI6l2FR8kyew==
X-Google-Smtp-Source: AGHT+IHJemgtGHz0vInWrPJBlhVWvOOYwIcRhwDG46HEyOvN5sz+DvlNL67V6g/7iKYNvfya7NPi/g==
X-Received: by 2002:a05:600c:4fd6:b0:45b:76c6:cfb8 with SMTP id
 5b1f17b1804b1-45f211d5d7bmr113392055e9.9.1757952820854; 
 Mon, 15 Sep 2025 09:13:40 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45f2a13bdefsm87276125e9.14.2025.09.15.09.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 09:13:39 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 1506C5F867;
 Mon, 15 Sep 2025 17:13:38 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Gustavo Romero <gustavo.romero@linaro.org>,  qemu-devel@nongnu.org,
 Daniel P . =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org
Subject: Re: [RFC PATCH 0/2] tests/functional: Adapt reverse_debugging to
 run w/o Avocado (yet another try)
In-Reply-To: <20250915124207.42053-1-thuth@redhat.com> (Thomas Huth's message
 of "Mon, 15 Sep 2025 14:42:05 +0200")
References: <20250915124207.42053-1-thuth@redhat.com>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Mon, 15 Sep 2025 17:13:38 +0100
Message-ID: <875xdjpubx.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Thomas Huth <thuth@redhat.com> writes:

> Here's yet another attempt to remove the avocado dependency from the
> reverse debugging tests: I basically took Gustavo's patches to rework
> tests/functional/reverse_debugging.py, but instead of calling that
> through tests/guest-debug/run-test.py and adding the cumbersome code
> to support additional test execution logic, I kept our normal way of
> running tests via pycotap.

Hmm I was getting:

  2025-09-15 17:10:50,798 - INFO: GDB CMD: /home/alex/src/tools/binutils-gd=
b.git/builds/all/install/bin/gdb -q -n -batch -ex 'set pagination off' -ex =
'set confirm off' -ex "py sys.argv=3D['/home/alex/lsrc/qemu.git/tests/funct=
ional/reverse_debugging.py']" -x /home/alex/lsrc/qemu.git/tests/functional/=
reverse_debugging.py
  2025-09-15 17:10:50,803 - DEBUG: Using cached asset /home/alex/.cache/qem=
u/download/7e1430b81c26bdd0da025eeb8fbd77b5dc961da4364af26e771bd39f379cbbf7=
 for https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/2=
9/Everything/aarch64/os/images/pxeboot/vmlinuz
  2025-09-15 17:10:50,891 - INFO: gdb output:
   Python Exception <class 'ModuleNotFoundError'>: No module named 'pycotap'
  Error occurred in Python: No module named 'pycotap'

which asserted. Should gdb be seeing the pyenv PYTHONPATH or should we
add a check for python3-pycotap in configure?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

