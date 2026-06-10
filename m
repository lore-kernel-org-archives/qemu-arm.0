Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBA0CD8CB9
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 07:24:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXDHx-0007t4-Sf; Wed, 10 Jun 2026 03:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wXDHv-0007sQ-Iw
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 03:23:47 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wXDHs-0005rV-RK
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 03:23:46 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-45ef56d9b67so4956920f8f.2
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 00:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781076221; x=1781681021; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9IcOj5xqFfH6LwjjxsZKsEA79FrufZ1zE7xFNf7tzsQ=;
 b=Dp9S41ITuCjq+2ptIs174orgRNZK3dZDJU9BEHv6FN6/TmHatWcKyqPGDLcB2BLaRQ
 nAnlxoe5g6ogfE2bEcrFJwlxMtG48OLNJffDXCIR36c+2DlNHynYiig1R+mEWynKJ02a
 SlJ8WIxWaoeFMibfjnxWJXxdbtnjpVb4zi1P+vHJ+aAH+A6DOzXHwKBhbm7P7k6OzXVg
 73QepJC4BzrFguao4dYyxlOtTflyQspyK6KGyaENbqcsCNK4RxAKtONdws74Np2WGBbv
 GbpRHT7A6yiettHVmRCreoZ/YCpe8JHH4VO95oT/ejhH0if2ziol8jWi/E4Uz+OnS5HO
 VFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781076221; x=1781681021;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9IcOj5xqFfH6LwjjxsZKsEA79FrufZ1zE7xFNf7tzsQ=;
 b=JlhZSFCt0kbIvvqrgUb3NZy6BwwInN5ZwZ/8ICPLsh9fMnj+DxIbuOMYfM7a/NjsDA
 FG4qozF5b3kum1nmTWkWyvx7RNzWT+1C0nhB8Ooea7HcBIVFt8CuFf8fU10jvZCFAgwn
 16KcbRD4T4TGTYrYzWqiFhnKA3ZehqendB5aIWSukhheFW1lUPGoavipE/g/62Xquj99
 4yZHvLkJEPWHUOyUzdLhvAl0/htJANAL5S25DL6OOBQpNJ+L8/Fb4MTjT2do937Q8HsO
 hGfo4aMaQq3rLlB4DO6nsG3IqG1M2StiR489svWXNfC44XPZiJkpQMAU4WD5OdWJOvqy
 JcMw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+kjyAJjGUUhPy3FvEwdH3HpMq/56YYjEJ4UAMDifMDkVMHGrlUlNyNRu11+5a1slakW1IPLrVmAw==@nongnu.org
X-Gm-Message-State: AOJu0YzkJH2Z1UfUzPnDKjxeET/ZYg10jGr6PCBZBDzHGjGXWkV9QX4+
 a47U6jyWvvYS2LILvLb5q3DgXJUDGRDihDiHgTepCJQ8Xyo5BoG1PDkiKvLG1f6P154=
X-Gm-Gg: Acq92OEuspbKd5/bhZZ5c9n/+sr1Z9f5VhbKhuRtrtbJdfz/IZZI0429bECW89NeGez
 0621niMPNb5Yp8NUPxcTXxJwi6R3OOj13pH01TBAPP8z9hlPn0Eb405n++j7P5yg2ZT2Ny5lrEz
 9g+omvrbUzG9FgIAOXxYCppstpqVpwsgCobQv1IxznaNr32Uptzy7afOiNZBhK54DkvWDuB6vR3
 /vRur2Ro44zS1XMhITWYIj8YVxW9P5iqn3fufDkKCN3wyqnLBCCddIJvgYUEC22sIjNXGx1/0GW
 HeHnmNdzU9aYvTdWALzd/bKDDNHJ++rVJMjK5oEAlya4eAEH4HR6hrAsG2/oPZ/WgxO1CYZgrXI
 72oMNTgJrBAu0e5AsLLOe7B9AGnhSpAbC3Fy9ieHzBjw1TYlcZmUXFT2jjEhUYW4uw5MLYXPDjl
 yX4FDM+AVVaiZXRurop7tfkE/tD8ytzvR3Bdls+7f+dIWaGY6xArKJv+A7YP1KTtRbv4cIExzgJ
 TGnjP2SekekoTwY+os8ADGC6SewUsqgDxhbPrnU2IiqCnznbB2kD33oWPMtmxkt
X-Received: by 2002:adf:fb85:0:b0:45e:e44b:312b with SMTP id
 ffacd0b85a97d-460305061a9mr28865714f8f.18.1781076220915; 
 Wed, 10 Jun 2026 00:23:40 -0700 (PDT)
Received: from meli-email.org (ppp-2-86-144-251.home.otenet.gr. [2.86.144.251])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f344148sm66404201f8f.19.2026.06.10.00.23.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jun 2026 00:23:40 -0700 (PDT)
Date: Wed, 10 Jun 2026 10:23:23 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 "Daniel P . Berrang=?UTF-8?B?w6k=?=" <berrange@redhat.com>,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Benn=?UTF-8?B?w6k=?=e <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>
Subject: Re: [PATCH 13/27] tests/tcg/meson.build: introduce gdb_test
User-Agent: meli/0.8.13
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
 <20260609214745.772536-14-pierrick.bouvier@oss.qualcomm.com>
In-Reply-To: <20260609214745.772536-14-pierrick.bouvier@oss.qualcomm.com>
Message-ID: <tgen7f.2dkbxc5oftbiv@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x431.google.com
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

On Wed, 10 Jun 2026 00:47, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> wrote:
>We can now declare a test requiring gdb interaction, based on
>tests/guest-debug/run-test.py.
>
>Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>---


Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

> tests/tcg/meson.build | 22 ++++++++++++++++++++--
> 1 file changed, 20 insertions(+), 2 deletions(-)
>
>diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
>index 1496cba460c..d0080eb0f9f 100644
>--- a/tests/tcg/meson.build
>+++ b/tests/tcg/meson.build
>@@ -5,6 +5,7 @@ if config_host.has_key('GDB')
>   gdb_progs = [config_host['GDB'], gdb_progs]
> endif
> gdb = find_program(gdb_progs, required: false)
>+prog_gdb_test = find_program('../guest-debug/run-test.py')
> 
> tcg_tests = {}
> # tcg_tests is a dictionary with following structure:
>@@ -22,6 +23,7 @@ tcg_tests = {}
> #           'test_name': ['provide an alternative test name'],
> #           'cflags': ['cflags to compile test', ...],
> #           'qemu_args': ['qemu command line flags', ...],
>+#           'gdb_test': ['gdb test args'],
> #           'env_var': ['VAR=value', ...],
> #           'plugin_test': {
> #             'plugin': 'plugin_name',
>@@ -80,7 +82,7 @@ foreach target, plan: tcg_tests
>     foreach src, setup: t
>       # return a clear error if user mispell a setup entry
>       foreach key, _ : setup
>-        if key not in ['cflags', 'qemu_args',
>+        if key not in ['cflags', 'qemu_args', 'gdb_test',
>                        'exe_name', 'test_name', 'env_var', 'plugin_test',
>                        ]
>           error('unknown tcg setup entry \'' + key + '\' for test ' + src)
>@@ -96,6 +98,10 @@ foreach target, plan: tcg_tests
>         endforeach
>       endif
> 
>+      if 'gdb_test' in setup and gdb_arch not in gdb_arch_supported
>+        continue
>+      endif
>+
>       if 'plugin_test' in setup and not get_option('plugins')
>         continue
>       endif
>@@ -113,7 +119,9 @@ foreach target, plan: tcg_tests
>       if 'test_name' in setup
>         test_name = setup['test_name']
>       endif
>-      if 'plugin_test' in setup
>+      if 'gdb_test' in setup
>+        test_name = 'gdb-' + test_name
>+      elif 'plugin_test' in setup
>         # remove lib prefix
>         plugin = test_plugins[setup['plugin_test']['plugin']]
>         plugin_name = fs.stem(plugin).substring(3)
>@@ -177,6 +185,16 @@ foreach target, plan: tcg_tests
>       exe = built_tests[exe_name]
>       cmd = [qemu, qemu_args, exe]
> 
>+      if 'gdb_test' in setup
>+        cmd = [prog_gdb_test,
>+               '--gdb', gdb,
>+               '--qemu', qemu,
>+               '--qargs', ' '.join(qemu_args),
>+               '--bin', exe,
>+               setup['gdb_test'],
>+              ]
>+      endif
>+
>       # some tests expect QEMU env var to be set
>       cmd = ['QEMU=' + qemu.full_path(), cmd]
> 
>-- 
>2.43.0
>

