Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285A7CAC597
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Sep 2025 18:28:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyDvX-0004Cs-Hq; Mon, 15 Sep 2025 14:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uyDvT-0004CD-OE
 for qemu-arm@nongnu.org; Mon, 15 Sep 2025 14:27:44 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uyDvC-0001fk-B6
 for qemu-arm@nongnu.org; Mon, 15 Sep 2025 14:27:43 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45dd513f4ecso27895805e9.3
 for <qemu-arm@nongnu.org>; Mon, 15 Sep 2025 11:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757960838; x=1758565638; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EGm/bhCmfi0gAsnFJoiK0zZcJF0GbW+s5NjoEbldvDY=;
 b=ArUy3n9eXUrMBlEBamsOnpC5Xh6+B6+jishFVp0Gr8v+jEY8V6a7Djz6//AhQH+mMn
 8loi1Orz1lk0+CNzY6R3MHp3TNGuXG2dlWWZVVRZuTAMj83bw5AfLe4t0d2tE0aksipy
 uTeo/bYeJc5Xu+II1O3jFEdm1lTUj6ClZeZfsRbrXM7pClVhfdxRexgYz3HBXA5hEK5e
 O3WkLYYyeUR57LrUQFmCIEZ3NMASmyAfCluAW1KkFo/+nbwVz4vjMJlES0Xy7T8PT6MV
 9VotXLq71/y/zgUCGx31BCiX0yLg5vCIPcpqUBKqmvCLdjC2+3mnYE4nVk4N/0sqshS6
 yA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757960838; x=1758565638;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EGm/bhCmfi0gAsnFJoiK0zZcJF0GbW+s5NjoEbldvDY=;
 b=bF4Q4Y/dqOKWabFpEs9VMdn6lhaQsjQaGR+BG+8zFtdU7FOZXI/GGs8VSXNM/Ycc19
 1zmKv5WGiKc61+c6ASH271KbUb9JLKW3ViZRauDe01rB8Hge4qYc15BGjfiANR7iiYgG
 nkrK5Hj3ePhGJY7x6MkFIpmV2iTnoT6pky8G2xZHnCrtXvekJHjC7QXyQybpkTynWmZk
 7t2iBSsX7xP9b2tdGOyOzgi6nLb0NBw66Ld4YG9zPuTUjYEPlZaUGXcgX1hwzAERcTuq
 ntGgN7V7IkYP70xRb3m6w/zbkjALkq92reL2XWb1/WLG1MxecqSnzJjbItDH6U0iSTLf
 xBLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyun6qH32ClaZcYDqXW3D0ucQkdQVxCtcF/pFiKKZLi+Z986iWvhfIEnlgSbtZVe3C5jf64wQSSg==@nongnu.org
X-Gm-Message-State: AOJu0YxRU9c1X227cb9Y71SUG11GFuvgaiKhD6Sh2wEQurBHAOr9FEdm
 yZMyjUanT8yVAJikP56kc3tZolw8bzhFu3qZbTx0LNbT0iOaPbnNpfknXee4mwDOnbw=
X-Gm-Gg: ASbGncve9ZFpVfNeRLG8psxCZXRQ8UR2Qy0Jp0SB7IP0fV/1i0cIbWy7tt3rbrrzgit
 fUnCu2GqPzG16oH+kiT4Lpq6NwpnwPtAArkDbAwiZcDIc8NJS1Bk8YlqMGkviX6WuXP5qWHgdZN
 VvyRRe79k5y46/cj0mL/NwfGZtAedRW161KXATOKvNjk57D9/OA9D5aeVmBElzTSv0C/vuARqzJ
 mp++oQYqmRtjDfqlQ02crvsbwhjVmjDP9yFP7QInStMjXSDNB/FX7/h3UCKK+0e5HR2Z8ZLPvAJ
 FyNxtU7iLqtS4kbGkVp6/DG8IDpucWc8yFm78rhQ8Sic4xvxflba5Tdo/MKyKTpxnrl1ArqtYyo
 3INOdNfb5RftEUa1fxZuPFksjRS/pJbEjrg==
X-Google-Smtp-Source: AGHT+IFugVKKICtOD9pfM7hk8BKEfOXp3bHQH3mFfTbwBJUrg0s6M6yFWSIgA+9ROJ/IRghf4QkDKw==
X-Received: by 2002:a05:6000:270e:b0:3e7:9d76:beb5 with SMTP id
 ffacd0b85a97d-3e79d76c25emr6942960f8f.14.1757960838138; 
 Mon, 15 Sep 2025 11:27:18 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e86602a7d5sm11182914f8f.62.2025.09.15.11.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 11:27:15 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6BBC35F867;
 Mon, 15 Sep 2025 19:27:13 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Gustavo Romero <gustavo.romero@linaro.org>,  qemu-devel@nongnu.org,
 Daniel =?utf-8?Q?P=2EBerrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org
Subject: Re: [RFC PATCH 0/2] tests/functional: Adapt reverse_debugging to
 run w/o Avocado (yet another try)
In-Reply-To: <d735ec67-dc45-438c-9151-6ced6ff49b77@redhat.com> (Thomas Huth's
 message of "Mon, 15 Sep 2025 18:18:22 +0200")
References: <20250915124207.42053-1-thuth@redhat.com>
 <875xdjpubx.fsf@draig.linaro.org>
 <d735ec67-dc45-438c-9151-6ced6ff49b77@redhat.com>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Mon, 15 Sep 2025 19:27:13 +0100
Message-ID: <87tt13o9ku.fsf@draig.linaro.org>
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
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

> On 15/09/2025 18.13, Alex Benn=C3=A9e wrote:
>> Thomas Huth <thuth@redhat.com> writes:
>>=20
>>> Here's yet another attempt to remove the avocado dependency from the
>>> reverse debugging tests: I basically took Gustavo's patches to rework
>>> tests/functional/reverse_debugging.py, but instead of calling that
>>> through tests/guest-debug/run-test.py and adding the cumbersome code
>>> to support additional test execution logic, I kept our normal way of
>>> running tests via pycotap.
>> Hmm I was getting:
>>    2025-09-15 17:10:50,798 - INFO: GDB CMD:
>> /home/alex/src/tools/binutils-gdb.git/builds/all/install/bin/gdb -q
>> -n -batch -ex 'set pagination off' -ex 'set confirm off' -ex "py
>> sys.argv=3D['/home/alex/lsrc/qemu.git/tests/functional/reverse_debugging=
.py']"
>> -x /home/alex/lsrc/qemu.git/tests/functional/reverse_debugging.py
>>    2025-09-15 17:10:50,803 - DEBUG: Using cached asset /home/alex/.cache=
/qemu/download/7e1430b81c26bdd0da025eeb8fbd77b5dc961da4364af26e771bd39f379c=
bbf7 for https://archives.fedoraproject.org/pub/archive/fedora/linux/releas=
es/29/Everything/aarch64/os/images/pxeboot/vmlinuz
>>    2025-09-15 17:10:50,891 - INFO: gdb output:
>>     Python Exception <class 'ModuleNotFoundError'>: No module named 'pyc=
otap'
>>    Error occurred in Python: No module named 'pycotap'
>
> Ah, sorry, I have it installed pycotap system-wide, too, so I did not
> notice it... I'll fix it in the next version if we decide to proceed
> with this approach instead of using one of the others.

FWIW I prefer this approach.

>
>  Thomas

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

