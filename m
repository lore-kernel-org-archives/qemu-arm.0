Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EE6CAC5B8
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Oct 2025 10:14:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v5iDV-0001hn-Gr; Mon, 06 Oct 2025 06:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v5iDR-0001f7-IE
 for qemu-arm@nongnu.org; Mon, 06 Oct 2025 06:13:13 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v5iDP-0006PV-EG
 for qemu-arm@nongnu.org; Mon, 06 Oct 2025 06:13:13 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e2826d5c6so36960775e9.1
 for <qemu-arm@nongnu.org>; Mon, 06 Oct 2025 03:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759745589; x=1760350389; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S27uLFqdarRJAqBGQLSekBvokGakda90uhNSpOUGR/g=;
 b=DmCvCQxDM+M+r6l7JqauO2jcJd58WoWIKViRxY4vTlObobhBonAj0qHQXX3Fkq2ZQ/
 9N2uh7u1zA3Jqyxz2f8YfCEFcbAjhvXEPU89RgBnUN7dHRu0+y/7sYh3sdPtdHrOsAvA
 UgdQ7b+Zj1N9c6NFByUx3mlOj08xfDtSLacvuNkKSxcpur0Ovo5sTChCFBpgGOZ7EEAu
 PoZ9cJ/eInVDz6igQUkCixHIo0m+ZvmyzyvVKJBiumTzedSPawWXXneOrCHndkeTKCJ1
 KT2xk/jG3GpYu5Tb/Rmxx7DYBXTvJRYQMTuJnet/i+FUAaUD2KC31UXaHHHK1kwzoH5W
 DGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759745589; x=1760350389;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=S27uLFqdarRJAqBGQLSekBvokGakda90uhNSpOUGR/g=;
 b=HfCmhuSmABCqrc1lvrE568/hkAnF49AZH4bQrdPdO0i7Sj6dEkEy620VXTNJXoHtHv
 ZJL8yPK/k+v406VzUrH0UUXrFaSJH5oeD3c8dAd7K9YvdNVth9ColC8KRUbUaVxWLNjF
 td2qXCcDhgRCOMZL8kASfampQlkHfhIlAdAu6/Av/ICJI8YgkHNte6BfSEGws2XL9uq9
 52+OPfYgZfGMFFu7zoNslK/l8uBmZqQarxQ5t59ScUpNi9ak9pF/6V0pceljo4JcOyaa
 WQlGJzkUc+q5GS6x5OEByFlvQUvbRflaQhO+jqRwA3sA7Of2TOmuOMZgrAc6+AfMcygX
 pZyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDtIpkQ7au50NMK4iS2SYuER7WFM0oKNn60QrKpnIVQNITIn9OkUFCpr/OD5Uvmzhv+ysiYyGsZg==@nongnu.org
X-Gm-Message-State: AOJu0YyoepuX5J5rXB/tkWpuHr4t+pgUm3byFSH8ltXH7tWHhuAZZUAB
 i4y4tTakcuA3zEssiIFwZ0zOA6emjaQfMl+WkcI9IOjTCVmHCGO76bcsfbsKe8Fj11I=
X-Gm-Gg: ASbGncuelUWJomY/71Zd+6D++kLJyDNlrxsReuQwDWQ804f++9poZvvAUebwqdEHtzq
 y+2oRkk1dl/0icxF04UE463Hq4/9x1k21DX/DxN72s4cbZXa5oL8ar6zXu6JtNDSMFZKmoxCMfV
 CXrIqHLcUxApZgL6QqdEmVrXZ5UpREZ886lk8ucU89cIuFN1cP1ree91n4Lm0HhE5d2O8RSWNof
 29XNOsZVSq5fSDkcmaHxIVIaHGznmY7ZzBW+YEFnOlk2GhebtzapN31bmmiyR2/D+GHcL8x63x9
 GbIz/zcbuAolDl5+xZUbC3HxBjcBGnZ4wfXDu/HC/02NQUJVS8rDlQEpk8IR0A5T6fsfdKGWiTB
 QCUfnfvTtuTRRnXECx4+C7f1XkzQnRU7QKf3372iqzb3974QRgSA=
X-Google-Smtp-Source: AGHT+IHZzw8T+o7XFBCLrtC2yDC0uCOTN/vo2Dfr+4IlZyWhuIwPlXwRo7vqBL+Ce6FNEuvV7aYMhg==
X-Received: by 2002:a05:600c:19d0:b0:46e:3709:d88a with SMTP id
 5b1f17b1804b1-46e7115b0bcmr78471135e9.33.1759745588882; 
 Mon, 06 Oct 2025 03:13:08 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e723614c9sm150018855e9.14.2025.10.06.03.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 03:13:07 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B10C95F845;
 Mon, 06 Oct 2025 11:13:06 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Gustavo Romero <gustavo.romero@linaro.org>,  qemu-devel@nongnu.org,
 berrange@redhat.com,  qemu-arm@nongnu.org
Subject: Re: [PATCH v6 4/9] tests/functional: Add GDB class
In-Reply-To: <7aae5daa-5e07-463c-bc3a-6581050688af@redhat.com> (Thomas Huth's
 message of "Mon, 6 Oct 2025 08:30:30 +0200")
References: <20251003141820.85278-1-gustavo.romero@linaro.org>
 <20251003141820.85278-5-gustavo.romero@linaro.org>
 <7aae5daa-5e07-463c-bc3a-6581050688af@redhat.com>
User-Agent: mu4e 1.12.14-dev1; emacs 30.1
Date: Mon, 06 Oct 2025 11:13:06 +0100
Message-ID: <87frbw1gp9.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

Thomas Huth <thuth@redhat.com> writes:

> On 03/10/2025 16.18, Gustavo Romero wrote:
>> Add GDB class, which provides methods to run GDB commands and capture
>> their output. The GDB class is a wrapper around the pygdbmi module and
>> interacts with GDB via GDB's machine interface (MI).
>> Acked-by: Thomas Huth <thuth@redhat.com>
>> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>> ---
>>   tests/functional/qemu_test/__init__.py |  1 +
>>   tests/functional/qemu_test/gdb.py      | 88 ++++++++++++++++++++++++++
>>   2 files changed, 89 insertions(+)
>>   create mode 100644 tests/functional/qemu_test/gdb.py
>> diff --git a/tests/functional/qemu_test/__init__.py
>> b/tests/functional/qemu_test/__init__.py
>> index 6e666a059f..60d19891bf 100644
>> --- a/tests/functional/qemu_test/__init__.py
>> +++ b/tests/functional/qemu_test/__init__.py
>> @@ -18,3 +18,4 @@
>>       skipIfMissingImports, skipIfOperatingSystem, skipLockedMemoryTest
>>   from .archive import archive_extract
>>   from .uncompress import uncompress
>> +from .gdb import GDB
>> diff --git a/tests/functional/qemu_test/gdb.py b/tests/functional/qemu_t=
est/gdb.py
>> new file mode 100644
>> index 0000000000..05e4c29c2a
>> --- /dev/null
>> +++ b/tests/functional/qemu_test/gdb.py
>> @@ -0,0 +1,88 @@
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +#
>> +# A simple interface module built around pygdbmi for handling GDB comma=
nds.
>> +#
>> +# Copyright (c) 2025 Linaro Limited
>> +#
>> +# Author:
>> +#  Gustavo Romero <gustavo.romero@linaro.org>
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2 or
>> +# later.  See the COPYING file in the top-level directory.
>
>  Hi,
>
> just as a reminder, this still needs the change requested by Daniel:
>
> https://lore.kernel.org/qemu-devel/aN56GkbIFxs5IDRR@redhat.com/

I've fixed that up in my current PR branch:

  https://gitlab.com/stsquad/qemu/-/commits/pr/031025-10.2-maintainer-1
=20=20
>
>  Thomas

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

