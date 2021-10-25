Received: by 2002:ac2:5bdb:0:0:0:0:0 with SMTP id u27csp230791lfn;
        Mon, 25 Oct 2021 06:46:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyxdwcvLSxbJblcR8o52e755A3xkxEsqCfeOOsPXVsxxAG/ua0pP+somMdXYjhc6+ZV6/Z
X-Received: by 2002:a05:6102:3a56:: with SMTP id c22mr14669026vsu.26.1635169611056;
        Mon, 25 Oct 2021 06:46:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635169611; cv=none;
        d=google.com; s=arc-20160816;
        b=v76DtX1NVbwzDXP/dq3BFWxGHlCFgQmBI55K2hcqj0Si+NIsTVka4lO8DHwFvzO9pz
         s3dWTtCP5Hx9SpxQusSf7ta5zle6vqoLBOAWzhZFZ8/MPBNqoK84wGOECWX1weLMKC/Q
         of5PqEK3J59/kPDu4NI3gzFpRPeUqM820wYBXkXVdjYDoegebS6a+4JGRyDALu6ijxd7
         QuQVfM2nfsCWA8NmdngE0QXZiys0nYzAkIgjhXOpIrYRsrIeE814eZKBxp3EpoG415js
         8bhU6pwJDEQdJUErhvhDTkV8A3zshcWwDahYiBGAy7EkmMkKuPP4wdbhrkhzuIoA8Xla
         qrAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=4r5ESUFk6fj0BmLyk28sgPzkuPAWkSScjkoN3mQuycc=;
        b=VM8TtLeZJ3zk2nLFzBQOVT44x1PGh77yeAtwp5sVdY4lm5KIHw/a9175t6nazcLuCf
         bfNHX9pMARmkfDk6QApArjUQlWBTK5FLv/vZ7IvfoQDz5cufrEC+TCXj46em8EYWYGWc
         aHfeTgyekuAMIOU15JifknODSEMg5/fg/jAdDCmcvYC9FgnR1ntRPOAM472uu8xS1bWa
         usvk+0iUpaMuH+gYe2MRQvxYKe+LYTMdPp4deJlHuBPGewSiP/usM3yqjILvYzvqN5Qa
         OD2LB5r097JQWVZXtb2n1MyNwxGIuij8f8n49kYI4c5QyYXaKK+7VStIyv9ydzU4qfNt
         kEgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=go9enP1A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q2si5149376ual.91.2021.10.25.06.46.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Oct 2021 06:46:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=go9enP1A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mf0JO-0004l0-8L
	for alex.bennee@linaro.org; Mon, 25 Oct 2021 09:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mf0H4-0001yN-W7; Mon, 25 Oct 2021 09:44:27 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:54845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mf0H2-00085r-Lw; Mon, 25 Oct 2021 09:44:26 -0400
Received: by mail-wm1-x32a.google.com with SMTP id g141so10763321wmg.4;
 Mon, 25 Oct 2021 06:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4r5ESUFk6fj0BmLyk28sgPzkuPAWkSScjkoN3mQuycc=;
 b=go9enP1AQmjYd8gAF4mRP2O93WWtMJt7T3+kb1vOyGUsX530GUyQTAE03qkePuTdTI
 FaGAjZe+wHRLu1VMHy31nbNuRW0CbStK9gUOdHQ+oeY2NTjyF1E4l8YZnSwT0Yx24JNC
 dbCvp/n0g3OW8jt6m8I52S34kcPbxBeeRDmp98Tyg30Wvlk7nMBMjxO8ExkwqjrjZ76N
 wNc2zhhHpm66Xqv6tetwcuSxG8cWhlYrrhpH6X4JnoPtGzwcHkZn+hn+xTVoPJbMG2Ue
 MupcG4fw3NIJzJwp8oGODNAlZtSYF6W046ijy4IVNmMwPUMCFtMPvg3S71Gt6bCz9b+S
 jtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4r5ESUFk6fj0BmLyk28sgPzkuPAWkSScjkoN3mQuycc=;
 b=TVSR0Ajha46K0JpVKZ4Js+rRRh6weod6PcCuZ9YXvhOtpJ7es/T2Zk3ptGKtNs1TrP
 NlDXZjuedctJ8KSg4HM1smVbjvRmnRHhMlgBWTCnR+PJHmEQwb5444K6y/OwSTJfJ/iB
 N0U20Wo9jBknMT/QFtJbZIc/WskwiXqTuwDN9QJiM32bGXughOKCwXWDlLjfpGWvtSZn
 3T7T4+fH2EPO9OPnOZJpmKZv4DtRpm1nm4BdWnsuvGoPpqLjvcH1qxKjz4k+t3FSG8Re
 Tn6K66114Szrb8H276NPlGSUoPLVk/L+GS0/OZf2R1SKD7A4KsUJA48aX85l0fsiTMqz
 PYrA==
X-Gm-Message-State: AOAM531Cok02Rot4/RVMYOmkWTPzFc6YxerZXZkRx2/gNU7kNalWvMNe
 64roYw0KYAWkdlArilGlyvB3+kQZHsA=
X-Received: by 2002:a05:600c:20f:: with SMTP id
 15mr19874319wmi.58.1635169462460; 
 Mon, 25 Oct 2021 06:44:22 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f7sm15342590wmg.14.2021.10.25.06.44.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 06:44:21 -0700 (PDT)
Message-ID: <05d74be9-acb6-b682-c869-1f5580580a37@amsat.org>
Date: Mon, 25 Oct 2021 15:44:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 0/6] tests/acceptance: Add bFLT loader linux-user test
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20210927163116.1998349-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210927163116.1998349-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.846,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aD9rp9nZA8QW

Almost one month passed... ping?

(adding Cleber who wasn't Cc'ed)

On 9/27/21 18:31, Philippe Mathieu-Daudé wrote:
> Since v3:
> - rebased
> - addressed Wainer review comments from v2
> - rename avocado_qemu.Test -> QemuSystemTest
> 
> Since v2:
> - rebased tests/acceptance/avocado_qemu/__init__.py patches
> - extract has_cmd() from virtiofs_submounts.py
> - check cpio availability with has_cmd()
> 
> Philippe Mathieu-Daudé (6):
>   tests/acceptance: Extract QemuBaseTest from Test
>   tests/acceptance: Make pick_default_qemu_bin() more generic
>   tests/acceptance: Introduce QemuUserTest base class
>   tests/acceptance: Share useful helpers from virtiofs_submounts test
>   tests/acceptance: Add bFLT loader linux-user test
>   tests/acceptance: Rename avocado_qemu.Test -> QemuSystemTest
> 
>  tests/acceptance/avocado_qemu/__init__.py    | 158 ++++++++++++++-----
>  tests/acceptance/boot_linux_console.py       |   4 +-
>  tests/acceptance/cpu_queries.py              |   4 +-
>  tests/acceptance/empty_cpu_model.py          |   4 +-
>  tests/acceptance/info_usernet.py             |   4 +-
>  tests/acceptance/linux_initrd.py             |   4 +-
>  tests/acceptance/linux_ssh_mips_malta.py     |   5 +-
>  tests/acceptance/load_bflt.py                |  54 +++++++
>  tests/acceptance/machine_arm_canona1100.py   |   4 +-
>  tests/acceptance/machine_arm_integratorcp.py |   4 +-
>  tests/acceptance/machine_arm_n8x0.py         |   4 +-
>  tests/acceptance/machine_avr6.py             |   4 +-
>  tests/acceptance/machine_m68k_nextcube.py    |   4 +-
>  tests/acceptance/machine_microblaze.py       |   4 +-
>  tests/acceptance/machine_mips_fuloong2e.py   |   4 +-
>  tests/acceptance/machine_mips_loongson3v.py  |   4 +-
>  tests/acceptance/machine_mips_malta.py       |   4 +-
>  tests/acceptance/machine_ppc.py              |   4 +-
>  tests/acceptance/machine_rx_gdbsim.py        |   4 +-
>  tests/acceptance/machine_s390_ccw_virtio.py  |   4 +-
>  tests/acceptance/machine_sparc_leon3.py      |   4 +-
>  tests/acceptance/migration.py                |   4 +-
>  tests/acceptance/multiprocess.py             |   4 +-
>  tests/acceptance/pc_cpu_hotplug_props.py     |   4 +-
>  tests/acceptance/ppc_prep_40p.py             |   4 +-
>  tests/acceptance/version.py                  |   4 +-
>  tests/acceptance/virtio-gpu.py               |   4 +-
>  tests/acceptance/virtio_check_params.py      |   4 +-
>  tests/acceptance/virtio_version.py           |   4 +-
>  tests/acceptance/virtiofs_submounts.py       |  59 +------
>  tests/acceptance/vnc.py                      |   4 +-
>  tests/acceptance/x86_cpu_model_versions.py   |   4 +-
>  32 files changed, 235 insertions(+), 153 deletions(-)
>  create mode 100644 tests/acceptance/load_bflt.py
> 
