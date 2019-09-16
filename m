Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4067695wrp;
        Mon, 16 Sep 2019 07:15:47 -0700 (PDT)
X-Received: by 2002:a05:6000:50:: with SMTP id k16mr15416929wrx.161.1568643347402;
        Mon, 16 Sep 2019 07:15:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568643347; cv=none;
        d=google.com; s=arc-20160816;
        b=LxAyzrfwSq2OF7SHmRupasLQyN+C233VeXxcX3H6h3L0FPpi4OVssJiD0V7wHEdE6u
         nhi5RQxzVuEfF0F8zcUCfIow9Fp7py7WgMDTZAI4DiDs4X7A3Mml9BUpezXEoCYdVqk7
         55Rw+57szKvZwaQmiEa4bLDMKGPd36ZYUFAj+yN1uc49B+7r5OcZhYPIa+TrVnAD5foA
         qHPycTNkx8hZHDWTpjAp0hhIA3IPZW3s/tjp2XiIVDnXTj2ssTdWjvd4igjRp0g/bo4Q
         jKXLcIna/mdzmphvGFMzRoWQ0H1x2A4l/c7R1SLJovKg+ajNybpdDhkpddCeLZh8rOkN
         je5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=trF4PUeQYqIN1FaA3mMgwum5hWySICsncWehaFgqsF0=;
        b=E4rSyzT5ccw8i4Inkock5eG8RXqtamyqmZQhatRgOWWuafSJRirmQff47MbndnfVx9
         7jyzynlX4nyt1LsK261b5F2Kxy5VkCuBcOH24uWiePEZLEcQo3U+wxLefcfpCQpEJ0hF
         kAMLWuxdA9yOONOK010XDlx39b0R0k/2FCjR4mFHWutd2hx1GrAnG1ncOFshckF6Xhj6
         WRZhS0GLZkKzg6Zb+5b57i0qwO/RUP63YM4y1gyRZX/sJJXrN1FZKobuUOqm6CXTH9wW
         n0eDytXMSqfXpiBRD60tX/vxCZqi20q+49fRCyc2vhfifrWKgfXmMaoJJFY8wSy0A/5q
         zcmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fe+NE2JR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x1sor29478077wro.7.2019.09.16.07.15.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Sep 2019 07:15:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fe+NE2JR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=trF4PUeQYqIN1FaA3mMgwum5hWySICsncWehaFgqsF0=;
        b=fe+NE2JRwk7ME04uMCeHLKURUF8VQtDaXScJmfSDYzUIRbXuZDPCNWoPV4znRNN723
         GXUdkrARL3+SSeTkN0iXY8r5Qu3uZmK+N5PiSbibE07D7TjF5f41Iutumxsnbbl87A+D
         L+QXPhk5vOfN1qpW8TQmkW5Ut78n2SNR2Eac0TEWbHxF9kXeucT3ank/R3hwM5ZPvGQx
         oMYjD6VYv6Rh61neHNh3aX7W2sYP3clq1M//Dgedn6JQtQQ4u1ejV7xCO9Ws/j2nMeaO
         JFxnuBJ/L9yPCZfVKj364fblcfIF4Iab2oYnRTZk0/TLQg8hRzGChN5aZ+rGnkIHUaZt
         2acA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=trF4PUeQYqIN1FaA3mMgwum5hWySICsncWehaFgqsF0=;
        b=T7QCa3x2kngLBCQ/VYxYmWNgUZn7rFC3+mADPmCzhQ6abHzzvMw3g2i5vaVcJwwPDc
         6zpEctThXajGs+fIKtdLYVYraKAXq6WM9MWXaYy6RiRunwSQQ7jyIZU5oVUzQR/2WxY/
         H6JuGSo3UF2sH8SFo3WuNgpXwHVBQk8LQxjVsCH7vkZPC/MGJmy6mWI1bhf2TdOk/bSg
         mpBKKGKHfakQ5ZYnM/pSl9gwdu++fswox4ztA/QplUF7NxiPfTTQjqDvO++xRYUV2+tt
         dKWxIV0nZIFGsRMfLxXGlq0Q2qo/OXwKtZOQHlJKI/YaPBBF6NIzTg+RLS1BAlqeLwsp
         wkEg==
X-Gm-Message-State: APjAAAWCQykC92vCgGkJMEwYQrTvdXUVZk8YR5r38Bn8kKrLFnt/OwHO
	eE7wUzDtWnMGJumWRcO0tcVOidtlsprksQov
X-Google-Smtp-Source: APXvYqxXcqmQ0C0cBkjxxg7JJa4GfbhXsKLD60dWAK9lZxZsybh9XArNgJw/YjoLdoucVQPS6v2h3Q==
X-Received: by 2002:adf:f1d1:: with SMTP id z17mr11580wro.330.1568643346931;
        Mon, 16 Sep 2019 07:15:46 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id s9sm15185884wme.36.2019.09.16.07.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 07:15:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 00/15] target/arm: Implement semihosting v2.0
Date: Mon, 16 Sep 2019 15:15:29 +0100
Message-Id: <20190916141544.17540-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Wc7po6UpIQ5Z

This patchset implements support in QEMU for v2.0 of the
Arm semihosting specification:
 https://developer.arm.com/docs/100863/latest/preface

Specifically, v2.0 has:
 * a mechanism for detection of optional extra features,
   which works by allowing the guest to open a magic file
   named ":semihosting-features" and read some feature
   flags from it
 * two defined extensions:
  - STDOUT_STDERR lets the guest separately open stdout and
    stderr via the ":tt" magic filename (v1.0 only allowed
    access to stdout)
  - EXIT_EXTENDED lets A32/T32 guests exit with a specified
    exit status (otherwise only available to A64 guests).
    This is something that people have been complaining
    about for a long time.

(Technically some of the things we already support, like
having an A64 semihosting interface at all, are also part of
the v2.0 spec.)

This patchset:
 * fixes some bugs relating to errnos in some cases
 * makes semihosting hand out its own filedescriptors rather
   than just passing out host fd numbers
 * abstracts out the fd-related semihosting calls so they
   indirect via a function table based on the type of the fd
 * adds a new type of fd representing the magic file
   ":semihosting-features" which is used for feature-detection
 * implements both of the extensions defined by the v2.0 spec

I've tested this by improving my semihosting test suite:
 https://git.linaro.org/people/peter.maydell/semihosting-tests.git/
(if people have other guest binaries that make much use of
semihosting then testing would certainly be welcome.)

Changes v1->v2:
 * Added a patch which corrects misunderstanding in a FIXME
   comment about the when the callback function is called
   for arm_gdb_syscall()
 * in patch 4, if the SYS_open is going via the gdbstub, we
   must do the associate_guestfd() work in the gdbstub callback
   function. This is because in softmmu mode the callback will
   not be called until after do_arm_semihosting() returns.
   (The v1 series effectively broke SYS_open in the gdbstub
   + softmmu config)
 * Pass CPUARMState* to set_swi_errno(), rather than creating
   an odd local-to-this-file typedef of TaskState for the
   softmmu compilation
 * New patch: avoid ifdeffery in gdb callback fns by
   using set_swi_errno() rather than doing it by-hand
 * The various 'factor out SYS_foo' patches are basically
   unchanged, but all the functions no longer need to take
   a TaskState*. This seemed kind of borderline as to whether
   to retain Alex's reviewed-by tags, so I dropped them.
 * Since we need 'env' for set_swi_errno(), we don't need
   to put the variable declaration inside ifdefs any more
   in the host_readfn() etc.

I do plan to have a go at fixing the odd FIXME surrounding
arm_gdb_syscall() which patch 3 clarifies/states in a comment.
But I thought it better to not tangle that up with this
patchset, which is already pretty long.

thanks
-- PMM


Peter Maydell (15):
  target/arm/arm-semi: Capture errno in softmmu version of
    set_swi_errno()
  target/arm/arm-semi: Always set some kind of errno for failed calls
  target/arm/arm-semi: Correct comment about gdb syscall races
  target/arm/arm-semi: Make semihosting code hand out its own file
    descriptors
  target/arm/arm-semi: Restrict use of TaskState*
  target/arm/arm-semi: Use set_swi_errno() in gdbstub callback functions
  target/arm/arm-semi: Factor out implementation of SYS_CLOSE
  target/arm/arm-semi: Factor out implementation of SYS_WRITE
  target/arm/arm-semi: Factor out implementation of SYS_READ
  target/arm/arm-semi: Factor out implementation of SYS_ISTTY
  target/arm/arm-semi: Factor out implementation of SYS_SEEK
  target/arm/arm-semi: Factor out implementation of SYS_FLEN
  target/arm/arm-semi: Implement support for semihosting feature
    detection
  target/arm/arm-semi: Implement SH_EXT_EXIT_EXTENDED extension
  target/arm/arm-semi: Implement SH_EXT_STDOUT_STDERR extension

 target/arm/arm-semi.c | 707 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 577 insertions(+), 130 deletions(-)

-- 
2.20.1
