Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C781FCD5BCB
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Nov 2025 11:24:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJVQO-0004Us-6z; Thu, 13 Nov 2025 06:23:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vJVQJ-0004Rf-IL
 for qemu-arm@nongnu.org; Thu, 13 Nov 2025 06:23:31 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vJVQI-0004cP-17
 for qemu-arm@nongnu.org; Thu, 13 Nov 2025 06:23:31 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-64320b9bb4bso1571878a12.0
 for <qemu-arm@nongnu.org>; Thu, 13 Nov 2025 03:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763033008; x=1763637808; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=05+zH1ssvO1O4l7BTDYVnannDY+o1C5rvot8EEaz3Yo=;
 b=Dr614GvY4z9Lkvn9mxbuKo3SOvZOTz8Kk8oSYuThB/Z3tfkrhwHICJlZRrnFrhQZZz
 YaUy3D1fxQsakoKawwa61bjTIEzFdWzL1oVouqdQA8xkDJqeCc4UTRolLH5E1FjLvOM+
 Rg8GrXk5qFeWh+uJRJvRsXrfsS1bPDnmIQT17sQnGUYXirdd3lDxHi887U05NPDDGUkJ
 3+p6KlrMIUEqayF6RJha9+mzGdliTo6+wCxSuwDRjD9zDiXHUSv2xZGlPwuaouIqNn1M
 +k6Sm1c0E4cEkgeYzXzzq9Gvy4e6Kg0lB8iBpky8S5p2r2Cmwfo1oGlQydLGNdSYXz3k
 6Klg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763033008; x=1763637808;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=05+zH1ssvO1O4l7BTDYVnannDY+o1C5rvot8EEaz3Yo=;
 b=hTc7Ctb8gFbPQRQDL+20YWu1nCPYKJyEl5Utwoy/f1SUS2UQEQcQBUGb6RqknNzT6C
 m+Mrog8OmzUJu+gUNJCyL1MDlGRPWkzB9zebdnRO9mktYjY7Qb7thsJe74eNEPu7HGVD
 nWMyovpD7pUtwzYYFxdz9QEjOXrAfGNSCH39n62cA4kyimWOf7rh5Htq1tgbH6boPkw2
 KgFWUmDCynMz/0T1Vo9GnRK75q4TX5r1Ywv7XV68s0EyuNBXxYBNpBw0KozFGV3ZFQeT
 EmtWcTlUSxfHFcgR8dY0+e9so3zyMgrM8UpX2eFbjYDlTFvd790ocO2murqqf3mu8TKp
 dkoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFW12xN8/QWH+XxmZGT54s5t7gkCEn4A8MeXpaSp/9SvE+6sPTMZTdg1YrgLP5D8sfWZCoig3UMA==@nongnu.org
X-Gm-Message-State: AOJu0YyrrjYn5IiZtkxxsH7Ccy6twyqDAt0s5wC1ptt8wSvPOK0UfE4D
 GUV9wgMerdDpPf3CHa48N8kkKa7tU+IrubB2xEdu5hicyXrplanhBMZuEk22MKpHSx8=
X-Gm-Gg: ASbGncswQu3mpLCVBqFvBWsHeQ3ixU5QoMdTXBnX359ZNoBGyeu+uMyF1VVimhzKVeV
 VHgOd+A/1VoLcLCxUh05h3tvBgPu1SN7SY283Vab9ALejDHAIjQ7QFtG38nBhnSyjn4HHRhWRcf
 giMNnAu757286McTaQhywG2BSsWpvkPgzc5NxdDkpATm8nc6laZtbsruoDHFTQbWOxmQTZyfhQq
 WZim2Soop6djM4bs+vlA/R0cYlYHtu+VHYUo7ObxYQfEz4f4OrwdfYvyScPlPm9TvZqY5A/XSjN
 8xKPX3X4J0BGxjU6VKIkTvHn3u7KVRPOeq6n6+JD5KZWiSuKFVEngFi+yxtPT5e7KcuRR1SLVqE
 MgOLa+av0I8xchxQ1ESFCVLHDlPn47DRIdbhgWh/vUB9VQnt5cixpxVljX3AewMXZU90bW3nEgg
 UJ
X-Google-Smtp-Source: AGHT+IE04ouxLenDvyOPogzW4nms9jL+EK9ReRY5a/mJUvi+wvjHLtUoazaftmhOloSdVpb0Yxa95A==
X-Received: by 2002:a05:6402:d0d:b0:640:9bed:85a5 with SMTP id
 4fb4d7f45d1cf-64334c9c502mr2497740a12.8.1763033007631; 
 Thu, 13 Nov 2025 03:23:27 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3f8e6dsm1240934a12.10.2025.11.13.03.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 03:23:27 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4E5855F7DF;
 Thu, 13 Nov 2025 11:23:26 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  Paul Durrant <paul@xen.org>,  Dmitry Osipenko
 <dmitry.osipenko@collabora.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Zhao Liu <zhao1.liu@intel.com>,  Kohei Tokunaga
 <ktokunaga.mail@gmail.com>,  Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Thomas Huth <thuth@redhat.com>,  BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>,  qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org,  Li-Wen Hsu <lwhsu@freebsd.org>,  David Woodhouse
 <dwmw2@infradead.org>,  Ed Maste <emaste@freebsd.org>
Subject: Re: [PATCH v2 02/18] libvirt-ci: bump libvirt-ci to latest version
In-Reply-To: <aRW0Lflm37zIrpZT@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 13 Nov 2025 10:34:21 +0000")
References: <20251113102525.1255370-1-alex.bennee@linaro.org>
 <20251113102525.1255370-3-alex.bennee@linaro.org>
 <aRW0Lflm37zIrpZT@redhat.com>
User-Agent: mu4e 1.12.14-dev2; emacs 30.1
Date: Thu, 13 Nov 2025 11:23:26 +0000
Message-ID: <87cy5mqiq9.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x531.google.com
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Nov 13, 2025 at 10:25:08AM +0000, Alex Benn=C3=A9e wrote:
>> We will need the latest version to add coreutils in the next commit.
>> As libvirt has updated the handling of ENV variables this brings a
>> little bit of churn to the docker images.
>>=20
>> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>
> I think 1 r-b is sufficient :-)  One of the later patches has
> the same accident.

Hmm I wander if that was b4 or my old emacs tooling getting confused.

>
>
> With regards,
> Daniel

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

