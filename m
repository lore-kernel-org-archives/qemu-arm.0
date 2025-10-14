Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F430CCD184
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 17:29:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8iq4-0004aI-Mc; Tue, 14 Oct 2025 13:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v8iq2-0004ZC-Gr
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 13:29:30 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v8ipz-0000UB-Vs
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 13:29:30 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b3e9d633b78so21955766b.1
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 10:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760462962; x=1761067762; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2cDlCTMlkSKTqP9Yi/cWsxZcU+AELcaJhI3cOf1BkoQ=;
 b=tMfMyhcNGxQ0nGerA9WiyPaI/GwXetRfnc6ykCoIsOFll5cYmHUAVp7skQwSeQANWF
 IOQzWfDRBHbQahX3T+qzQExm7mEphGH8PKRpXm5tapFZd0mmj2MfgZ11BwJr0hNuSRXK
 n6GiJv+XFPZ56IDmPQt3pBR1+sJ7GH7kZY0/zrOrB9jTtgLApgcGUQVcIdQqWsWSRwX6
 BY7XHm2v3F1vS5pUTlK9JN7hf4ZxzW3QoY/fshDrfT7CD78tRZb0jFm3a8brpVN/c8MJ
 iqMnK70paKYPWzikLw6ta0hwFUHj81fTG3rEMStQ1W8QgDzjVKL4w3L+4xXoXHzD+QoC
 BRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760462962; x=1761067762;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2cDlCTMlkSKTqP9Yi/cWsxZcU+AELcaJhI3cOf1BkoQ=;
 b=N/AUSZkDxQxEdekP9tJlXkE6/rodMuRL4fw9O38FDc8hDlOxT7jedCRYKbxoU70poA
 CEj1jots4Uqxq4m+RWS2ybnLJGmCCgYD/LUqdf6TxWMjMQsPL9l8+b42xYnDpYi0Xu0A
 +ALWx7KuN6ga8+mvINpGpmcUAR9jaLQXy8aRJhBkT9YDcfw0IBx6wg2OuZXlobOjbJGe
 dNftBZGhaxW9aLq1kX3YuTNOvubW6bbGloPNX0OH3UYjqTNvdBYUyB1o3tbtmkFCMOXQ
 NLDksmDC9ibog+gPuud9MnxQdFClRA474ykb3z29HGfOrvU6NUScWyj7c6bXOkjhFgX4
 poWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjj+F6WYEJDPVF+P2xGnLJD+N+zTTASu0FltECz1Lj+LxIOPsME6iA1IN4OTA80yXJOg+I67A/7g==@nongnu.org
X-Gm-Message-State: AOJu0YyHO+l96Y7yXzfEKo0xEDCmYa9ogKZBfcd4ucbx3QgHwdJVRrkY
 q8Dj6oUpC3gCbtSoHjwRkMMrPG0BIXvsilSJ2xgVI4CfMueWxB1cmCLAmuGXujoyUOU=
X-Gm-Gg: ASbGnctp+WA7GG+RqSIBGknNerBL5QOq41B60f6+qQrTp8QfGS6kLg53TEbZsuSxd1Q
 cLn++3FSZOARq5Xo108ZEml0PSlCjULlpltsoBeZ2pAy6kGxsXALaAibYcX/gHdiVzdO+hSCgVe
 Jw4TF1hmLKiEP3BsuWOP8ldgtx1GMng/nhZrS3kIh3oNbddDrCqYuQnCz2oZTSDZL0chok7tNNd
 wiHTA7tt/fjkgjQqWbL1qk32aYBlnUvON4TlHtnYTinx4VqOJ8c5g7vQok8RwIWsxm+DrancldR
 GD1Aynp98JFX7DIKSY8fRCXGNAv7c1SjKnKFiRT9QiItQCdNLofyKs7M7EpRtYErF95SDlTCG3I
 lLfcntvDARiDPrzpOvVP8EFGnJz6nqPkx4ULk4CMWNYnq1A==
X-Google-Smtp-Source: AGHT+IEhot8C6ArcF/aUW2PW+HByz4/sSmvWg7O1f1gNWOhsoq24dg36oW/1RBHD76akBbH8tlKdIg==
X-Received: by 2002:a17:906:114f:b0:b5c:6e0b:3706 with SMTP id
 a640c23a62f3a-b5c6e0b3754mr111011166b.13.1760462962107; 
 Tue, 14 Oct 2025 10:29:22 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b5ccd6b03f3sm23425066b.74.2025.10.14.10.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 10:29:21 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 724865F812;
 Tue, 14 Oct 2025 18:29:20 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org,  Gustavo Romero <gustavo.romero@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  BALATON
 Zoltan <balaton@eik.bme.hu>,  qemu-s390x@nongnu.org
Subject: Re: [PATCH 0/5] testing/next - arm custom runner tweaks
In-Reply-To: <c5003498-7914-4d94-bb79-0851c49c47a1@redhat.com> (Thomas Huth's
 message of "Tue, 14 Oct 2025 12:47:01 +0200")
References: <20251014104323.3023714-1-alex.bennee@linaro.org>
 <c5003498-7914-4d94-bb79-0851c49c47a1@redhat.com>
User-Agent: mu4e 1.12.14-dev1; emacs 30.1
Date: Tue, 14 Oct 2025 18:29:20 +0100
Message-ID: <874is1l7db.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
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

> On 14/10/2025 12.43, Alex Benn=C3=A9e wrote:
>> This isn't quite ready yet as there is an in-flight MR for libvirt-ci
>> and the final patch has to manually drop a couple of packages which
>> don't cleanly install. I don't know if we should deal with that
>> upstream or in the lcitool metadata. For reference the two packages
>> are:
>>    libcurl4-gnutls-dev:armhf
>>    libglusterfs-dev:armhf
>
> FYI, glusterfs is deprecated in QEMU since a while:
>
>  https://gitlab.com/qemu-project/qemu/-/commit/b873463821343c6f702c4195f2=
168790b09cf44e
>
> ... so you could also add a patch that removes it from QEMU now, I
> guess.

I can do that.


Richard and Phillipe reminded me that we are due to drop 32 bit hosts
real soon now so maybe I should just remove the runner and the hacks
needed to get it working?

>
>  Thomas

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

