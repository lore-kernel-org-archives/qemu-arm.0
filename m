Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4726606A319
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Oct 2026 11:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jQO/yW43
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJ7uj-0007Et-Bv; Tue, 20 Oct 2026 07:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xJ7ug-0007DO-GQ
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 07:21:51 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xJ7uZ-0003BD-Vi
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 07:21:48 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a1e477fe16so15519305e9.1
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 04:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792495302; x=1793100102; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=2/y6WVmeqG1OPwYNPz9215YT6b6rVbd6ecgXKvSOZTs=;
 b=jQO/yW43EcYElqG/45L5JwELhTQYdPE+2z/OpDkIGIf4SJx1a+IaGLg/D6uCLNgFUl
 Wdq9DzFsqwstM6sAOQozRCB+2P+SdtK+ySvefYC7uzo+mGH+5uHmpWOXrCdbg3rvXxoe
 eaOu1pbOaG7Ysv06M25UP7kQ7e8JnpOG49tpQZC6rQEHBG9e1C1YGvsG6RhaL9hXVZ8u
 FsRgFvBnnQBHwjzN8EnVvOj2U16VYdOu6DB4XlKDppYFXn2hKYJ0RsT2E25s9Gxx61Eu
 yrZOf/F+iNvMdixMe73wcQIqzqiAwXRROlATYkwEZHv16zuTAboV2huBsVWJO9XdW/eE
 bFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792495302; x=1793100102;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=2/y6WVmeqG1OPwYNPz9215YT6b6rVbd6ecgXKvSOZTs=;
 b=mb18i7jHP9sAUfCyZVQE9oQddxdTvYsa/1GXuQGL1ysQuTMdN+pUucNIJmh9ip102N
 d1YbFSvNvfQdxTVNZCXO4nqOz9LgYm1uy9q9S/OUHRHHgz2/uGPpsbHSjm7MHdq7SNas
 u8a8kuMn1a1tgCXns3aGyrxIqW90slgpI5hMW3pxZPKZZRTJlMra79QjyQOsSOG+V9zV
 ff/2DSosPIu3pdqHVgmsZJ9yrUtm9Qfy2OuH1S4KeDb6kuefAOgrwMCtwszzB7yJ6vh7
 p4eEMfEwy6z4r4+eB14I6e1Gfs2y2ApV3kQjO0Lvk/qqOPGOb1ArH91rSwd8mjeepY+S
 dajw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzfJggB/DXz3u38srh1wFQwy5MkuSydBX0l12cqBvRMGwnPJ9Sb9CndOnIhtJD8/xR95Aey14XdHg==@nongnu.org
X-Gm-Message-State: AFq9FYJwPmfwyXrrm0KZ7JMND1K5+WgTfbOs5X96qO9/YCFN3Ddn38p2
 /dO6LwcCwzHIkXvBVnIXwzK96cO4BIib0VQnXfW98im7u6sLbVoCN8lAc+W1hZftrq4=
X-Gm-Gg: AYBFou2OOzGSTuyybH0vWVOuFnKg1A6B2s6ZWfq4CVwu0w+0Ir3Txk4fsn8nuJ7dGco
 M9gleDRVjKpxHx5FeTE6oOj62bYEy3KU5adhQfW36Q31FOmeUmx2BPXG5NWv03WEcyUYWVQ73ha
 EpZjbkTQkhzkawjAptkw33qGza0LywwpHCHcIzCKI7EsddpbNsqNad5XFcUesafOEY0u6POIbip
 SoC8uV5ZS3vcuwKrGq1PIpxF5P+6ww+LBDwhwLnwLCkhGhAe7rQ0H7Z66TnYQJvXbnfjgaSkSCD
 ha1dUt6+bw6O2I7boF29Ns5J6Ik0wuOe2aPGiNtrpdC88KCkIymzeQYIRunJ7F8mgFvQdLZkO/y
 PE3lrpDWNwD9I6wXJTwSVbpqbCfFbKeQ3IOV0/fj3hVh6tuvan2B1SENkNEEsG1XsBw0xaNzXJb
 fePo4s+VUfqvk8mzKed4NvCGKQCEEaCqjGTzjkNU13RQGJ4UeYKEU3tdGkq9+She6ADb7yHA==
X-Received: by 2002:a05:600c:c166:b0:4a1:f736:79f3 with SMTP id
 5b1f17b1804b1-4a1f7367b83mr24851065e9.5.1792495302093; 
 Tue, 20 Oct 2026 04:21:42 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1f8016c93sm29458585e9.5.2026.10.20.04.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 04:21:41 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7919C5F8DC;
 Tue, 20 Oct 2026 12:21:40 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bibo Mao <maobibo@loongson.cn>,  Christian Borntraeger
 <borntraeger@linux.ibm.com>,  Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Daniel Henrique Barboza
 <daniel.barboza@oss.qualcomm.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,  Song Gao <17746591750@163.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,  David Hildenbrand
 <david@kernel.org>,  Bernhard Beschow <shentey@gmail.com>,  Halil Pasic
 <pasic@linux.ibm.com>,  Nicholas Piggin <npiggin@gmail.com>,  Paul Durrant
 <paul@xen.org>,  =?utf-8?Q?Bj=C3=B6rn?= Walk <bwalk@linux.ibm.com>,  Jiaxun
 Yang <jiaxun.yang@flygoat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>,  Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-s390x@nongnu.org,  David Woodhouse <dwmw2@infradead.org>,  Liu
 Zhiwei <zhiwei_liu@linux.alibaba.com>,  qemu-ppc@nongnu.org,  Marcelo
 Tosatti <mtosatti@redhat.com>,  kvm@vger.kernel.org,  qemu-arm@nongnu.org,
 linux-edac@vger.kernel.org,  Glenn Miles <milesg@linux.ibm.com>,  Chao
 Liu <chao.liu@processmission.com>,  Cornelia Huck <cohuck@redhat.com>,
 Gautam Menghani <gautam@linux.ibm.com>,  Xianglai Li
 <lixianglai@loongson.cn>,  Pierrick Bouvier
 <pierrick.bouvier@oss.qualcomm.com>,  Chinmay Rath <rathc@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,  Matthew Rosato
 <mjrosato@linux.ibm.com>,  Amit Machhiwal <amachhiw@linux.ibm.com>,  Zhao
 Liu <zhao1.liu@intel.com>,  Weiwei Li <liwei1518@gmail.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>,  qemu-riscv@nongnu.org
Subject: Re: [PATCH 00/23] kvm: introduce KVMCPUOps
In-Reply-To: <20261020104320.3686723-1-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?= message of "Tue, 20 Oct 2026 11:42:54 +0100")
References: <20261020104320.3686723-1-alex.bennee@linaro.org>
User-Agent: mu4e 1.14.4; emacs 30.1
Date: Tue, 20 Oct 2026 12:21:40 +0100
Message-ID: <87se2039dn.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> There is a world coming where we can have a KVM interface which
> supports multiple architectures. The old style approach of using
> linking to resolve per arch kvm_arch_foo handlers won't scale and is
> also slightly antithetical to the flexible not-quite object orientated
> way we do things in QEMU.

In case it's not obvious I intended the prefix to be RFC as it needs
discussion ;-)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

