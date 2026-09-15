Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31BFC88E75
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 21:16:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6aWA-0002Ki-SM; Tue, 15 Sep 2026 17:16:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6aW4-00025I-NW
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 17:16:39 -0400
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6aW2-00030H-Vn
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 17:16:36 -0400
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49cd38e0e5dso2670275e9.2
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 14:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789506993; x=1790111793; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=D4s9I2l5K+Ic4DPNniVrroN+CqH1anV3868EM0I0pQQ=;
 b=sThlO+fHTYIjS6IcoWMPMvI8iSZ4KiSREBBMvJ6jcnxqKNsJtcZI7hyvUO5B1TLKbY
 1+XNx7f8+6BybqqDNSoYnQi9oJjyqrBbUP6AUaXIVE6Yp3DB/cDZC1W1GewEpntoXFLm
 6LKwARKixYdB4mWa+CekTN8Q2oXUHUhsxIyuBvbhm8qIHjuyxeGDe5ZZOjEfXRGJ1Inb
 2EZtX6JBQkc+asoXhGlwKPOSDEX2nA86EMWP42BfpjiC8bb9JrqXZUJmSzqp2kSXA7oI
 dHRvny46SNvZjZPAe9OTaCbK8avO0d1oicKSrIXaFPx/SfPS9+p5sk/3dnj3aJ+0W8CH
 vXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789506993; x=1790111793;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=D4s9I2l5K+Ic4DPNniVrroN+CqH1anV3868EM0I0pQQ=;
 b=aLXAiogWsUDPfbDV1LUhZGrmtYo2BHrdnNMG8UN9XLGkwIk+zoqHlm6a2BED9I6WTT
 UCfaXkYXyHrDt1S6ghVUfop8067luhR739eArZ0xZ7T7MAzo+uI+kdAFS4v0fb1V1P/s
 zD0dBeKjAcoiJvQfsqraGNXBUf4QsqKowhsFvru89Ihagh2GIQOdwPI+ygQNwzSvZpeT
 9NdQdA9cSXtvdXc47UzUE/75K0kTYfxmtoDNst9BdB/swKQn87l8MxAjj2vYKLYAKHar
 t8porvC2Y4PVvDUU+8gso9MdLEGkxgtx84Agtf2XlDAO9VXv/WaH/lUHmMSafCep1aBu
 f+LQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxGOpMsimAlcbqJ3Tplhs8Lzgtqq5bKTx67ZQGLTEUPe65+LnHpqD1I+gt8qkipSwOLExjrkbY1Hw==@nongnu.org
X-Gm-Message-State: AFuF++lQipJ+TJUFnzMAQiysXnrJhsF+XoGxhYeYS4oAVo43IoAyIcqt
 +1q8UrFWJ0/UdUcWfarOYy9+d6v//LtjIlNOxahtZpl2bbY2haQrkqzaXEYEnvu+msM=
X-Gm-Gg: AYBFou1wMRWueh2zdHehoQFynGoNx/Hkzq7oETTZJsaiGD1jNXf3948g7iyqlMU6tr1
 ZQ6p9Yw8JnxEfPoO0BrgDSK14pY64W2otrJj56eZD5hKktvUCSXM/ybSuEGUqrrwfC7Ec4Dr35h
 PmdjKrnkWt1XYDzHG8VlqKhsC7GBC70H0fg4m0OktXC/5VFrH2xmYYA6pIkzoEET5LcKPQlX4uN
 z0WzF+oUqLtei3l5/Dp3pWI7g/XpQTcPbydVaFrzmB1KW3PzIQJFySxsNuImbi2ndJtoNOsLUOr
 Z8UPHDKMNUpjDD6Fva2/JcFAB+TTmntOkG6K8vbSJkt566/u9P8/nJlvmfjUsWnRcMYAS3QTo6d
 5g5W5VpqhXNzEd2XfK3zwBdGm7zI6Bwp3YJX9lrAKz67d62amVI3OhXBMcfrB4SBbhWak5G6HmW
 lV1ZlVvc68aI+DAFC+zz/+YT0k2oSCLr/1RlBsc+MW8YNm/h0c+8dfiP5xslbb/Vg+zlkWq0Y=
X-Received: by 2002:a05:600c:3487:b0:49d:1cc7:5ec3 with SMTP id
 5b1f17b1804b1-49e7a66af92mr242422225e9.9.1789506993151; 
 Tue, 15 Sep 2026 14:16:33 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e83aeae01sm25085425e9.6.2026.09.15.14.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 14:16:32 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 45CE55F825;
 Tue, 15 Sep 2026 22:16:31 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org,  Cornelia Huck <cohuck@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,
 Helge Deller <deller@gmx.de>,  Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Song Gao <gaosong@loongson.cn>,  Thomas Huth <th.huth+qemu@posteo.eu>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,  Laurent
 Vivier <laurent@vivier.eu>,  Warner Losh <imp@bsdimp.com>,  Brian Cain
 <brian.cain@oss.qualcomm.com>,  Kyle Evans <kevans@freebsd.org>,  Pierrick
 Bouvier <pierrick.bouvier@oss.qualcomm.com>,  Cleber Rosa
 <crosa@redhat.com>,  qemu-arm@nongnu.org,  Fabiano Rosas
 <farosas@suse.de>,  Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>,  Brad Smith <brad@comstyle.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Ilya Leoshkevich
 <iii@linux.ibm.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@mailo.com>
Subject: Re: [PATCH v2 03/15] Revert "tests/tcg/meson.build: implement
 ./configure containers options"
In-Reply-To: <f40f80f3-ab57-4564-8e7e-47ef8f3baffb@linux.ibm.com> (Eric
 Farman's message of "Tue, 15 Sep 2026 16:45:14 -0400")
References: <20260915201601.1207839-1-alex.bennee@linaro.org>
 <20260915201601.1207839-4-alex.bennee@linaro.org>
 <f40f80f3-ab57-4564-8e7e-47ef8f3baffb@linux.ibm.com>
User-Agent: mu4e 1.14.4-pre3; emacs 30.1
Date: Tue, 15 Sep 2026 22:16:31 +0100
Message-ID: <87o6dy9pw0.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:31::10;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm2-x10.google.com
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

Eric Farman <farman@linux.ibm.com> writes:

> On 9/15/26 4:15 PM, Alex Benn=C3=A9e wrote:
>> We want to keep the container configuration inside configure for the
>> firmware builds.
>> This reverts commit 522b299ca4316d8cad57f9496ffcba87dcc20719.
>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>> [AJB: untangle changes since]
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   configure             | 11 ++++++++---
>>   meson_options.txt     |  4 ----
>>   tests/tcg/meson.build | 25 ++++---------------------
>>   3 files changed, 12 insertions(+), 28 deletions(-)
>
> The first revert addresses my problems, but configure throws some
> unexpected messages. Those messages don't appear to cause any
> problems, per se, but regardless those are resolved by the time this
> patch gets applied.

What messages did you get?

>
> Thank you for the dedicated untangling!
>
> Tested-by: Eric Farman <farman@linux.ibm.com>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

