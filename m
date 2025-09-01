Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589ACCA0FF0
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Sep 2025 16:59:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ut7sF-0007K6-7h; Mon, 01 Sep 2025 12:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ut7s6-0007Fi-Pz
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 12:59:11 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ut7s3-0005qT-0b
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 12:59:09 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3d3ff4a4d6fso1286068f8f.0
 for <qemu-arm@nongnu.org>; Mon, 01 Sep 2025 09:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756745945; x=1757350745; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7l8HZaAkkUbjDEn76+TeMp6QXpZ1rQONxjXSSJrM2yU=;
 b=H8koiKSM5ZT0H1m0ChXeGWr6mgeEIfiu4bVo5BAiiQim3pSfSNChKQ3pa++sTVftY7
 bznNPvy3lo1Rprs2Pw1LAbBmTeUhk/iQVeTDEyYRJW1HUwC7sHAX5AJqLroyCbgst9V4
 1XMeFogvP+BEFFC+j9IQifXo76rap4/12vGpWDSgNjMSw+FqhpVqxSZ/GYFpuupIzdcC
 EL5IKjkW6nSV8x2Ts3LhYvlyqZlpxAmyiAi+yHuuHSP6plnRTFDW6CvITkLZb6PFKj/w
 /yqvSM0gJEcGd1lUZI+Ib39piqjn96mrSkfLS+EHyOKshd25067yJrItzGtQqMMJMoZa
 9WzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756745945; x=1757350745;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7l8HZaAkkUbjDEn76+TeMp6QXpZ1rQONxjXSSJrM2yU=;
 b=v20WC1tfn+XH2ltwL+sDnik4CdzowQ0QFRoonn9RN4PqFB6DH0vpc7SgvlVpSjwS8L
 hXOA7vOxMnnPNtxJ1FfzTgxTXu0Oyh/G4gzT9eZH9GgskxgIGhDd5T5eiYngRLjb+Tt2
 e4mJEnv72o93oLV9Mi/rF6OpY3IE2H9eI/ZM3YJ5XcBzlZqf1Bjerv3X3z4kF6LRJ7XG
 EBKKgcS3tq743T6wqsu7Au8+ss+AoZozcM3JK++gI5REuY+ysmbYnI2G/mpBuYJY9eI6
 yp3WFWugzj+UJ/DEsmUxCHrd6LMtrHmV8+AQ6v7c4E+676ISrpSfAJ5jjC3Gryq0QsDI
 gVcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD8DZyDju2CoytwGIXUQWN7h0sMj+8u0IW0z9oU8AFfS2tzIV7EP1ftFEUQgwvbW8oDwR3ChqhZQ==@nongnu.org
X-Gm-Message-State: AOJu0YzfM9m0CbEHkgY1vKL1Nkbce03hwb2KZ4QX8oiIuovyRztgrtMc
 En0C0klFbFK3JjZOIH1li5236j1UzQRoRIVk3ZrUAKpJgFrMy10XPIslfrNCpxBq04M=
X-Gm-Gg: ASbGnct/gVyiirN4t1hgY8Og7aW0eHKvOrDEkaublCVTmPessN0RuflXYCFj//h3qzB
 yJQHyFPVLcDfkn/F5nqNVfmM7t6PeTBDqAYqzc8+xWfA5/T2Qyz2QwAG6TCv3S96PfWAYJTwX9d
 C6F6Z0RvoW49lDOpaVBmreb69AWw8hwIt4PRwX7CnNSqC8LC6vCCMZp+fNtURSOnup/4e4G/Vn9
 ZEh17HI6MCz+AJmrEKmekjQA5AnzcHhY9zRTJj60T+PieU7a++Bv3gZYIquwWNPI0287t6KJH5k
 kOVZZIxRUtYOv36bBNBQa+ZDsyQYmqZPpebYbDNcxrohANWXf5XfIqrj2+W5eGMKpWQVYSm86Z+
 ABRw7dE8cgUSLAZYX9V8CVq2NOqUeht9nhg==
X-Google-Smtp-Source: AGHT+IHyRuO0mrY/kG7dkApBK8leQ+vImpYqBsLxROWZs/r3A83lHpYhyHSa7FSam1DmMj2U09fPUw==
X-Received: by 2002:a05:6000:2f87:b0:3d4:d572:b8e7 with SMTP id
 ffacd0b85a97d-3d4d5820341mr5569562f8f.13.1756745945141; 
 Mon, 01 Sep 2025 09:59:05 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d0f85c287fsm14158596f8f.52.2025.09.01.09.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 09:59:04 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8CDF55F81C;
 Mon, 01 Sep 2025 17:59:03 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>,  qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH] hw/arm/boot: replace fprintf with error_report
In-Reply-To: <CAFEAcA-GpC3ouaXTQ18VhcY7c-jXK_SF0MLiCMFW471U5Cqr9Q@mail.gmail.com>
 (Peter Maydell's message of "Mon, 1 Sep 2025 17:24:28 +0100")
References: <20250823150321.135527-1-osama.abdelkader@gmail.com>
 <CAFEAcA-GpC3ouaXTQ18VhcY7c-jXK_SF0MLiCMFW471U5Cqr9Q@mail.gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Mon, 01 Sep 2025 17:59:03 +0100
Message-ID: <874itm2joo.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Sat, 23 Aug 2025 at 16:03, Osama Abdelkader
> <osama.abdelkader@gmail.com> wrote:
>>
>> Replace direct fprintf(stderr, =E2=80=A6) with QEMU's error_report() API,
>> which ensures consistent formatting and integrates with QEMU's
>> logging infrastructure.
>>
>> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
>> ---
>>  hw/arm/boot.c | 22 +++++++++++-----------
>>  1 file changed, 11 insertions(+), 11 deletions(-)
>
>
>
> Applied to target-arm.next, thanks.

I didn't see this had been posted but I did a more extensive clean-up
here:

  Message-ID: <20250901125304.1047624-1-alex.bennee@linaro.org>
  Date: Mon,  1 Sep 2025 13:53:00 +0100
  Subject: [PATCH 0/4] arm_load_dtb cleanups
  From: =3D?UTF-8?q?Alex=3D20Benn=3DC3=3DA9e?=3D <alex.bennee@linaro.org>

>
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

