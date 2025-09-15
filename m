Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1004ACAC597
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Sep 2025 16:12:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyBoC-0003SS-Ox; Mon, 15 Sep 2025 12:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uyBoB-0003SD-3T
 for qemu-arm@nongnu.org; Mon, 15 Sep 2025 12:12:03 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uyBnw-00039F-DD
 for qemu-arm@nongnu.org; Mon, 15 Sep 2025 12:12:02 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45f2cf99bbbso8624905e9.0
 for <qemu-arm@nongnu.org>; Mon, 15 Sep 2025 09:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757952691; x=1758557491; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l96gdQrF8pYYDiqdxH1DB/7ba2n2Eq4Mj2fHqoGJ+Dw=;
 b=vOoQMTh1GF76V68ILhnD5+OTm5m+C3Y0K8d6pXm5p8V7l1ktozMLnzFVoGwJiZNJZH
 4cgLe9CIy4/MZZOrClIqfWL3p+qY++mMIBwK8UN+UkD7OtLMvE0VZQDUmq5VyBmvVM6h
 2hejifkvdHo4OoOUDqMkR2r8Wkt/e/OYT5tmMNlezSzVUJXFBSUhZRWZzoE1FjUC1upT
 XtpSzMA7qIGlUqGbTYoW+JG4oHiK5xaYS/dPQsLrl6wrrrYaM/YCn9x72TrswXWDGa8p
 9FsBIgPjAACmZVOQ3c9rVBLWf+VdavB71bRWZfjlJngkTBydB83+ruv/zoslAGgH80TL
 ou8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757952691; x=1758557491;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=l96gdQrF8pYYDiqdxH1DB/7ba2n2Eq4Mj2fHqoGJ+Dw=;
 b=fVSHZMNySSytOa3T9XUSl1JMssyMc4GYbXDy86in/77yISLLuM+aICV6O2Qbr5LPdS
 utWZXpXDGymsbOWzv2NrfEK2FcDi2Mf6ISgTy2ZHvZXv9dLPFoc+LF8acGpSyhfSfl6p
 P78/juW2LBpfGPiF/1GUSGzvXkNeepQN90FmcqzCOduqCmoBJvDAkHmhioGvOQGUa1Pv
 /dhaZmMJZfGR4YlCNDPZ8Causn8hghANoAn4L51k6I5iJzONOwuglR5ceUx4fm1wwHwa
 qLt9Y9XpOxzSQYdt0A3b8peCrO+t2KZJ+xnEU7D+44BE0MA/xeqAsaeN/oprBlPy3Lnr
 0obw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFs7ZY+RVrzlenuBkUOnvI8fH7HrXHlas91mbMei05WRz8B9YAprC/FgJ54ftjrxSS4k3Qrynchg==@nongnu.org
X-Gm-Message-State: AOJu0Yy6+CtuUAez9R1ttsggj3/89hQZ0v1wIokXO+k7n6VA0wbw1XmH
 9XrhS3bzC8f/HNo967DDyC34tO6gYE7qTzBrNqYuyhaTS69HGK2qZZRl+NPCAV5oYvE=
X-Gm-Gg: ASbGncsaESZ6LMTG+1n9oY45f7+tDEZAW/HHD8oQ5FA9RoXlT4sy7wD1sEmV+7xstAX
 UmeQ7w0POhOfaWKrG7ooEqloo96sJsUTH/dXYgKptlGrXDceVtjAAxI/SBTH7hnSQvn1Uj3RCl/
 ErjHQdgaNEXX6SvCoId5KutgqFqw5WnV4tf99gEigIOEntp0Apl2OQFMQRbDGGO0QpNCYS0DgRb
 73AmDnjhYIs+Qrjt6sp3Zn4g/qpQ0XCHcTXBgod3ho1LK9h9p0njYEGlxMaJhA09pjsP34AzyCh
 WMRM87QPZtSwh5ij1NhO2T70n4ywGjHgrokY+o2QIir56K0x8QUN0cD0/gA9+sl5MWMHIZ6qEOw
 80xTGvI0VqoTeDqEHqBNtz/UaDOMbNqQWIQ==
X-Google-Smtp-Source: AGHT+IGmRHLXJx9+4JldA2xffnm8w4mgqEugIEG2OBZDDi9L1UTG4i5xzDHV+TLyTGyO4QxtPgGBJw==
X-Received: by 2002:a5d:5d0f:0:b0:3cd:5405:16e7 with SMTP id
 ffacd0b85a97d-3e765a2eed8mr12498230f8f.29.1757952691391; 
 Mon, 15 Sep 2025 09:11:31 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7d369ea3bsm12922872f8f.0.2025.09.15.09.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 09:11:30 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3A5F85F867;
 Mon, 15 Sep 2025 17:11:29 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Gustavo Romero <gustavo.romero@linaro.org>,  qemu-devel@nongnu.org,
 Daniel P . =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org
Subject: Re: [RFC PATCH 1/2] tests/functional: Provide GDB to the functional
 tests
In-Reply-To: <20250915124207.42053-2-thuth@redhat.com> (Thomas Huth's message
 of "Mon, 15 Sep 2025 14:42:06 +0200")
References: <20250915124207.42053-1-thuth@redhat.com>
 <20250915124207.42053-2-thuth@redhat.com>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Mon, 15 Sep 2025 17:11:29 +0100
Message-ID: <87bjnbpufi.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

> From: Gustavo Romero <gustavo.romero@linaro.org>
>
> The probe of gdb is done in 'configure' and the full path is passed
> to meson.build via the -Dgdb=3Doption.
>
> meson then can pass the location of gdb to the test via an environment
> variable.
>
> This patch is based on an earlier patch ("Support tests that require a
> runner") by Gustavo Romero.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
<snip>
>      foreach test : target_tests
>        testname =3D '@0@-@1@'.format(target_base, test)
>        if fs.exists('generic' / 'test_' + test + '.py')
> @@ -121,6 +127,7 @@ foreach speed : ['quick', 'thorough']
>             priority: time_out,
>             suite: suites)
>      endforeach
> +

spare newline?

>    endforeach
>  endforeach

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

