Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2175795njb;
        Sun, 20 Oct 2024 23:01:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWfURw9xOD7VsE74KZjogvWkrvku1NfEEn08TMJNLGEsOl4N3PwG5jMNcWamPhgTtiLrWQA6dDar8b9hA==@linaro.org
X-Google-Smtp-Source: AGHT+IH6EYSFQCUkP9tgmTsbwyEL6ZYlfmkMqpAhHGzTx900q4O7YyqGRBH+Mpms/uC9c4zykffK
X-Received: by 2002:a05:6214:54c7:b0:6cc:2c93:b894 with SMTP id 6a1803df08f44-6cde164a9eamr147202506d6.45.1729490494014;
        Sun, 20 Oct 2024 23:01:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729490493; cv=none;
        d=google.com; s=arc-20240605;
        b=DEnRNmMhw3X/cfYO3YQRErS937yl0QMfGmgzxYZWODieI7TZF9Uhzb+isSgUyOKT6i
         jugO+uPz/pUYvsaQ/dTv53LnzbDP4n0tFfqqTDUKIvpqd5Ca+MqsI23CN4qprcA9JLWW
         pcNeYzfdXAMecropcCSKjhVrnKgLsibmNb/+NNaUNruPwBsmTp7zzcN80h4PCpjI0fzJ
         FhHtRtcel0qKTscN26WfSGReI/s4sWpvqPwky4UDw8PvnnJgSYRNw6lu4EdYwIgLWiKb
         x42lB9Y+Fl0LMnKgYDMibocIByg2n3mLKu3Xl0Aptlr5w1qItQJ5Dl3wbTlEtm5Zrkqh
         5KRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=n9FGRL7g4a5XoyEQL8rvQTjKEocxsLblIQiJB9fxyIU=;
        fh=lR5Zr0K0FmF+mQUq2KnyFzx84+ltzkqIw+Pxqf8I6aY=;
        b=fE+wnwoM8b6O1YhDt9cOafruPy6cBKaMYUwjIp5mY6e2Bm/vyFZpB4yYKXSLyCfo0c
         IlMk18j2O/QXIkoI4VXuFnW3nu1yGKlvKzEaXSl+s/Mx1sVbAGA8eAxHLnlax47ROCTv
         +yCp2NSgXgFa3aXRVnmM5auv0y4vnnvCh0+d/QWpBF4j2JT4nAwvLmZ5MG/sIdbNVKJr
         G8hyS4+Z+a6iKjrOVM9bfQ3IQoKVeFmKLf3WvgOejRQmpORi2SyINI6oh4h7bCSFNk1V
         gVUudjkQvPYUQ6vSgp+2AabP8RkAnCVWmVB1sr5ud8WStQjnY5iwsLyRZSY1zbWzV7OA
         zPMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ssgf7D1M;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ce009ceac5si31794726d6.375.2024.10.20.23.01.33
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 23:01:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ssgf7D1M;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729490493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=n9FGRL7g4a5XoyEQL8rvQTjKEocxsLblIQiJB9fxyIU=;
	b=Ssgf7D1M8GrQVDYF4V2ghXOLxQp/lPrX4K630TymVBesUbD+DHyGVF/fsMQzCcyAQgQ/No
	dS+8QDOl8tOguJDDsncIr0jgIleu2cDZFVf9qqciUS2EZznFigg8MHURDcq6uZK2Lh+uP7
	HGyKVajJAE6pP9ksfCojHJcOjuaOzvo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-3Zk8LDZ8NFeKthLatxT51w-1; Mon, 21 Oct 2024 02:01:32 -0400
X-MC-Unique: 3Zk8LDZ8NFeKthLatxT51w-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-37d504759d0so2515425f8f.0
        for <alex.bennee@linaro.org>; Sun, 20 Oct 2024 23:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729490491; x=1730095291;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9FGRL7g4a5XoyEQL8rvQTjKEocxsLblIQiJB9fxyIU=;
        b=liZbrC1fkYkuwtLk9zm5H22sCDes2NWEnjVWLUfSuyot24cYDlvxmZvIefvdA9T/s+
         FIZ2XD0LE/4osMBBlecH9mgtf8MNM7vVa4IMQpPZEeI2Xp8NIQqVY0FOzTqB4ywNpw3D
         Ex2y32UknACZev3YOfU0GNWqRSGRlzPZeP27hYxNNMQ5amuaGN+UfXVUwIibyVTih+/t
         APlCz0p05uVML6xxmtoXB4JPoC/AglnRnhUOpSutt3dfxWDclEPzf1FO+sEgko66Onq4
         BO1KtGYq9ICsrycbHDyCXlrWVOdMuQ/jcDMF0BNXaNXBgZH7n6EMXURMfbrl3/d1H8Aw
         GflA==
X-Forwarded-Encrypted: i=1; AJvYcCX7941fEG4tXinZkksOU2udqyq96WrSHZf93AeH+1MLjWeB73I86itrz5KOCYWsOX/AK3AGCQX4+dMLNQ==@linaro.org
X-Gm-Message-State: AOJu0YxqKMXD3cyKelXHptW6NAOq17OoSKDbdJTDuMOTD62kG7lYmwWH
	N31Yr+sUTeAxDJS/MKPhC3pHaTVpNCeSIjLyJFQgTXDlm7QoVRlEdp7vTPryuK2CPuNZ5TYR5aQ
	8Ybab0xlGxc1PQxmZHPR2jTcjcrhWv/CZeMatelsuPBlJW/RxhwalKg==
X-Received: by 2002:adf:f9d0:0:b0:37c:cfa4:d998 with SMTP id ffacd0b85a97d-37eb4768898mr8690019f8f.49.1729490491030;
        Sun, 20 Oct 2024 23:01:31 -0700 (PDT)
X-Received: by 2002:adf:f9d0:0:b0:37c:cfa4:d998 with SMTP id ffacd0b85a97d-37eb4768898mr8689990f8f.49.1729490490693;
        Sun, 20 Oct 2024 23:01:30 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-50-24.web.vodafone.de. [109.42.50.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9bd6esm3356912f8f.104.2024.10.20.23.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Oct 2024 23:01:30 -0700 (PDT)
Message-ID: <75745c15-feed-45e8-9ba4-93ab103fd832@redhat.com>
Date: Mon, 21 Oct 2024 08:01:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/17] Convert the Avocado tuxrun tests into new
 functional tests
To: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, qemu-arm@nongnu.org
References: <20241011131937.377223-1-thuth@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241011131937.377223-1-thuth@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: TLf5vO9ZplKI

On 11/10/2024 15.19, Thomas Huth wrote:
> This patch series converts the tests/avocado/tuxrun_baselines.py
> to the new functional test framework. While converting the sh4 test,
> I noticed that the Avocado test was completely broken, so I included
> a fix (revert) for that problem in this series, too.
> 
> Thomas Huth (17):
>    tests/functional: Add a base class for the TuxRun tests
>    tests/functional: Convert the Avocado ppc64 tuxrun tests
>    tests/functional: Convert the Avocado aarch64 tuxrun tests
>    tests/functional: Convert the Avocado sparc64 tuxrun test
>    tests/functional: Convert the Avocado s390x tuxrun test
>    tests/functional: Convert the Avocado arm tuxrun tests
>    tests/functional: Convert the Avocado riscv32 tuxrun tests
>    tests/functional: Convert the Avocado riscv64 tuxrun tests
>    tests/functional: Convert the Avocado i386 tuxrun test
>    tests/functional: Convert the Avocado x86_64 tuxrun test
>    tests/functional: Convert the Avocado mips tuxrun test
>    tests/functional: Convert the Avocado mipsel tuxrun test
>    tests/functional: Convert the Avocado mips64 tuxrun test
>    tests/functional: Convert the Avocado mips64el tuxrun test
>    tests/functional: Convert the Avocado ppc32 tuxrun test
>    Revert "hw/sh4/r2d: Realize IDE controller before accessing it"
>    tests/functional: Convert the Avocado sh4 tuxrun test
> 
>   MAINTAINERS                              |   4 +-
>   hw/sh4/r2d.c                             |   2 +-
>   tests/avocado/tuxrun_baselines.py        | 620 -----------------------
>   tests/functional/meson.build             |  28 +
>   tests/functional/qemu_test/tuxruntest.py | 158 ++++++
>   tests/functional/test_aarch64_tuxrun.py  |  50 ++
>   tests/functional/test_arm_tuxrun.py      |  70 +++
>   tests/functional/test_i386_tuxrun.py     |  35 ++
>   tests/functional/test_mips64_tuxrun.py   |  35 ++
>   tests/functional/test_mips64el_tuxrun.py |  35 ++
>   tests/functional/test_mips_tuxrun.py     |  36 ++
>   tests/functional/test_mipsel_tuxrun.py   |  36 ++
>   tests/functional/test_ppc64_tuxrun.py    | 110 ++++
>   tests/functional/test_ppc_tuxrun.py      |  35 ++
>   tests/functional/test_riscv32_tuxrun.py  |  38 ++
>   tests/functional/test_riscv64_tuxrun.py  |  38 ++
>   tests/functional/test_s390x_tuxrun.py    |  34 ++
>   tests/functional/test_sh4_tuxrun.py      |  57 +++
>   tests/functional/test_sparc64_tuxrun.py  |  34 ++
>   tests/functional/test_x86_64_tuxrun.py   |  36 ++
>   20 files changed, 869 insertions(+), 622 deletions(-)
>   delete mode 100644 tests/avocado/tuxrun_baselines.py
>   create mode 100644 tests/functional/qemu_test/tuxruntest.py
>   create mode 100755 tests/functional/test_aarch64_tuxrun.py
>   create mode 100755 tests/functional/test_arm_tuxrun.py
>   create mode 100755 tests/functional/test_i386_tuxrun.py
>   create mode 100755 tests/functional/test_mips64_tuxrun.py
>   create mode 100755 tests/functional/test_mips64el_tuxrun.py
>   create mode 100755 tests/functional/test_mips_tuxrun.py
>   create mode 100755 tests/functional/test_mipsel_tuxrun.py
>   create mode 100755 tests/functional/test_ppc64_tuxrun.py
>   create mode 100755 tests/functional/test_ppc_tuxrun.py
>   create mode 100755 tests/functional/test_riscv32_tuxrun.py
>   create mode 100755 tests/functional/test_riscv64_tuxrun.py
>   create mode 100755 tests/functional/test_s390x_tuxrun.py
>   create mode 100755 tests/functional/test_sh4_tuxrun.py
>   create mode 100755 tests/functional/test_sparc64_tuxrun.py
>   create mode 100755 tests/functional/test_x86_64_tuxrun.py

Ok, if there are no objections, I'll include this patch series in my next 
pull request, with this small fix squashed into the final patch:

diff --git a/MAINTAINERS b/MAINTAINERS
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4071,7 +4071,8 @@ F: scripts/ci/
  F: tests/docker/
  F: tests/vm/
  F: tests/lcitool/
-F: tests/avocado/tuxrun_baselines.py
+F: tests/functional/qemu_test/tuxruntest.py
+F: tests/functional/test_*_tuxrun.py
  F: scripts/archive-source.sh
  F: docs/devel/testing.rst
  W: https://gitlab.com/qemu-project/qemu/pipelines

  Thomas
