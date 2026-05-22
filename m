Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6ECCD5BAC
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 19:02:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQV8d-0004Wv-0q; Fri, 22 May 2026 15:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQV8b-0004W9-2u
 for qemu-arm@nongnu.org; Fri, 22 May 2026 15:02:25 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQV8Z-00043G-DE
 for qemu-arm@nongnu.org; Fri, 22 May 2026 15:02:24 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48e6db3ff7eso40491975e9.0
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 12:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779476541; x=1780081341; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1zmfuMLM/jv+2sAZAYdT/4UiMpv4lo9buBeRT97Ft5Q=;
 b=BbXqukMP7ji+ZOs4jZ2yKYYaR1Cwa05ad0ShBHoSlvtNe2kN6TwwMup7i/EXMX5+t7
 dVXOp5c62ACZU2QlbwmZdmAyrUmp44EuEQSc5eqxq23NFdedUt+KzQMhu/udFxjpvwiB
 mx/tsRdTdWCj3P/xuLTUJXeduQuf5LjxSwfu3OmhGo+GedtuBbTowXeYtYhIaOwWj4pZ
 3z4RsjG0BAShoT9CkxeWbcXrL4DAXwvR83ldjvx/jyztY73jZ+fldPHKLzaR4m3LJeQu
 VlL+fUtxUeWRGbqn2L+KmDjmJAKfR+AcnsnOYmn9PJ2Vquf0SMSr2cNkUOCjr3UCrD//
 MPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779476541; x=1780081341;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1zmfuMLM/jv+2sAZAYdT/4UiMpv4lo9buBeRT97Ft5Q=;
 b=HSbOgSwLrL0/XIs1DqL7zjLsjmB2Op8GRA7mv/0AB+gxI5qjbxQgZzCO7I7iG16ScX
 7+DIS/XNqvNVtAfhZyPG7hVSllQzyR/ryTzceOoPra+jutKAgMB26YcxrKgbG0Dvcacq
 NmLJYfczz/CxfU+yuTYKET4XSNVYMiqbroACqSAG6uWppzbJAMHbl1S0RI/1hAahsnJm
 Oc1CMdkH0VWjoi36LXMqOW8Ex9j+Go0n0o90ZgK8loQSU9VqQE6AptTQ1tc5f3szhEI8
 ewBs1OE/vlA/HyWJyNYTukTM/SdkKpcc6oJJxiR+EiN+LmaBPW6F8h3JFABI4zC58z4G
 Ektw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+z8+CfmuvNbzhXtOKWjW/2jzdDsx8w1bpPZTstHnvTx+gmNhJeB92HVjUQ+iHdxhzR216tKtXSag==@nongnu.org
X-Gm-Message-State: AOJu0YyFzQx+s3ku9r6K/AIaz7VjNJZQj0s7NXe7baTahQUUIDytfseX
 +VKa/bA29OB+aD8UioHT3XKo087xodMChabx6ouBePMy+xM3teCstTenIIqSXYTUEhg=
X-Gm-Gg: Acq92OHU5rPGI/rtiQeBedlF89C8eTV/B7BBp+pXcO1u1GU+J6h2EFwSZadHMpCKDqV
 D9wFHwb0uTVQkDRh2axbr3VrtPD+/QlmrGYx+8KV/6HYQAOcek+gh/i6EXaXo3XDjB3VodqH1R7
 CvzdWvO+xjgOayZiWEB7heBZs0Zl/NX7txsZiPTzndc/PtUqbpatnQOFR+i9BsgBngUy0gNPtz5
 VWVTQQOg57X0rymaCkR3Zn8kuGtm50fbfe31kORX2DE6E4r5RCvD8nDE64uVBagVj+zwcO0ZAnK
 q14AXoNQcqCb64afOcOXlr1CT81kbAV9CFWMjkmoQrp5lW+SyYt3VNv6KFMaNF7KbCKSIU+2MwI
 EOCsistcMKbKXYbQNkW/nk+NjE1Km8lm2rU6w6jh3NA+ByjNtFXKpTHw6YT7Psej5LLM1lX2QZi
 xQxmERv94Ry3gTOwcIwfBnSlw=
X-Received: by 2002:a05:600c:c4a3:b0:488:ac01:72b6 with SMTP id
 5b1f17b1804b1-490426ceed2mr72356495e9.21.1779476540911; 
 Fri, 22 May 2026 12:02:20 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49044f2bad3sm66644315e9.0.2026.05.22.12.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 12:02:20 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 490495F8BA;
 Fri, 22 May 2026 20:02:19 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org,  Peter Xu <peterx@redhat.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Thomas Huth
 <th.huth+qemu@posteo.eu>,
 Song Gao <gaosong@loongson.cn>,  John Snow <jsnow@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Kyle Evans
 <kevans@freebsd.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,  Cleber Rosa
 <crosa@redhat.com>,  Warner Losh <imp@bsdimp.com>,  Brad Smith
 <brad@comstyle.com>,  Thomas Huth <thuth@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Max Filippov <jcmvbkbc@gmail.com>,  Brian Cain
 <brian.cain@oss.qualcomm.com>,  Fabiano Rosas <farosas@suse.de>,  Peter
 Maydell <peter.maydell@linaro.org>,  Richard Henderson
 <richard.henderson@linaro.org>,  qemu-arm@nongnu.org
Subject: Re: [PATCH v2 03/16] tests/Makefile.include: add binary dependency
 to run-tcg-tests-% rules
In-Reply-To: <74e8bc86-cd81-43f9-b5cb-7e3de3bcd3d0@oss.qualcomm.com> (Pierrick
 Bouvier's message of "Fri, 22 May 2026 11:03:46 -0700")
References: <20260521131739.540157-1-alex.bennee@linaro.org>
 <20260521131739.540157-4-alex.bennee@linaro.org>
 <74e8bc86-cd81-43f9-b5cb-7e3de3bcd3d0@oss.qualcomm.com>
User-Agent: mu4e 1.14.1; emacs 30.1
Date: Fri, 22 May 2026 20:02:19 +0100
Message-ID: <87tsrzl138.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:

> On 5/21/2026 6:17 AM, Alex Benn=C3=A9e wrote:
>> Explicitly set the appropriate QEMU binary as a dependency so we can
>> ensure they get built. This is especially important for MacOS which
>> otherwise only builds the unsigned binaries on a normal "make all"
>> run.
>>
>
> I'm not sure to see why it matters. tcg-tests don't make use of hvf, so
> unsigned binaries are plenty for it.
>
> Which other binary is this building that is not built by default?
>
> In general, if something is not included in "all" target, let's make
> sure it's included there (meson.build?) instead of adding a workaround
> here. Not only tests benefit this, but anyone doing a build on a
> platform that might have optional binaries not built by default.

If you have a suggestion on how to make that work I'm all ears.

>
> It's totally ok to build all binaries (even for other targets than one
> tested), people have configure --target-list to restrict what is
> globally built. Better to catch something broken elsewhere instead of
> "oh sorry, my custom test command didn't build this at the time".
>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  tests/Makefile.include | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>=20
>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>> index ce6a0dccaf4..cf6f9e68245 100644
>> --- a/tests/Makefile.include
>> +++ b/tests/Makefile.include
>> @@ -57,6 +57,12 @@ RUN_TCG_TARGET_RULES=3D$(patsubst %,run-tcg-tests-%, =
$(TCG_TESTS_TARGETS))
>>  $(foreach TARGET,$(TCG_TESTS_TARGETS), \
>>          $(eval $(BUILD_DIR)/tests/tcg/config-$(TARGET).mak: config-host=
.mak))
>>=20=20
>> +# $1 =3D the stem (e.g., arm-softmmu or x86_64-linux-user)
>> +get-qemu-bin =3D $(if $(findstring softmmu,$1),qemu-system-$(subst -sof=
tmmu,,$1),qemu-$(subst -linux-user,,$1))
>> +
>> +$(foreach TARGET,$(TCG_TESTS_TARGETS), \
>> +        $(eval .ninja-goals.run-tcg-tests-$(TARGET) +=3D $(call get-qem=
u-bin,$(TARGET))))
>> +
>>  .PHONY: $(TCG_TESTS_TARGETS:%=3Dbuild-tcg-tests-%)
>>  $(TCG_TESTS_TARGETS:%=3Dbuild-tcg-tests-%): build-tcg-tests-%: $(BUILD_=
DIR)/tests/tcg/config-%.mak
>>  	$(call quiet-command, \
>
> Regards,
> Pierrick

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

