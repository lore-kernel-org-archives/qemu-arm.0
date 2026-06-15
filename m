Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BFACD98C5
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 12:24:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZ6MO-0005j1-Ar; Mon, 15 Jun 2026 08:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wZ6ML-0005iQ-50
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 08:24:09 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wZ6MJ-0004jO-Ee
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 08:24:08 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4908b92904fso39913725e9.0
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 05:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781526246; x=1782131046; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dki4JKzOiiuY5vu3J6a2tqZsAaeVpvMA/2zinXKN5uo=;
 b=VX0vnJB5PUj+oUeQrt3LsCwUfO1xF3QT25zphmnfFPxOIHRDDzeg3mu56hzyc7xVWo
 kphmxV3daSdxAkg3yUwSGX0pTJ1FcIvlum1hyXKl/LA5mFRSLFULBr2CSBE86rkzlImm
 PXeRAyUcnL0au9x6Qf2Ba+chKL8B4W/h+5JoF+3nH3AfCnD3XcHsUUxHiwy/1bNq/rje
 KWpioZIsp9/BOKQpKG2vvVG9cXyhHNEE6yjysuzgYbOr7AUp31boLc/jrjks1i+ZpwEu
 EDFFEGEyjDRD9r4EMIRhALvlCa35Lgv+SzseZU9xCOC0ROXmg9i3ceFNtq7O1m4ya0lP
 AyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781526246; x=1782131046;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dki4JKzOiiuY5vu3J6a2tqZsAaeVpvMA/2zinXKN5uo=;
 b=hjpNRAhPKgKNwuuA7KcIC9vyfhwk7zBpavWEQZyfGrzAc2lCVfCQJfGlkaXb5zjH5O
 KC+FZyki/zdT84q50e1KJFbcopTfgKE01WT/izJBTiJdCm3iVQP4S9VKphQjpVvLXNw7
 lFBuKJoNgs6dGkPItiBsgEFSsNrMmcj1KadD8Dyw/uEKwzgQHxbU7Bqd0LBKeyi/YHDS
 Je9YReKcM84T4oxZsP4UKsa2EzWOOa5E78Y5cO/Ins9r6ghpS6gQHEf19lJWZw/u/pFk
 8RoA038zJWYAi0i9oneAj2hazKwFznJ9tpGi0pG5VGFRZkUxcHH+n9hItNkfvCE/4lNz
 eikg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+m37IRVM5lvuNt5RKRsybS0xKfNi5AMd3nXyEuzvLr/rAjWLTxbVidQsBlwC3m12GJsKhizxttfw==@nongnu.org
X-Gm-Message-State: AOJu0YyvcYFREnjDJb3eHa3AvTiT1RAJdbM3A+wETA+ZCx78/K9ox/L+
 fOnJN271lSh0quc6GaaU4pK3XzipenMkzV3MhkCBF40id33NfbNa0WFlqLV5icjoARg=
X-Gm-Gg: Acq92OGLaisM57nvZD/6vmepOv5Tw5Fq7bohoV683jjCRcuS4LHfD5nLPq/HJWKKdDo
 OP9DkDF2C2FQ6kxpAHhUHhPneZ/i7tb7xhKBZKc448lwomclqxhXn/HnLK6sskBvMT7MuInQsIv
 vBSYcyTM67nNJWWmrPg6jY3ecRBgXLOrZvB3Iaqk3V1HfP82NMy2/SgO/DHm1wEVZU7X+etccCt
 835xvb/TaLci9E9FS93jZUzUMTMSFzrdQ/vuOK1Zra1XPO181u2+j/ZiWUMUNQAsqJWSPIn03sI
 l862tytjjRxD/mv0MwAdZmku0xjvbh307m4tmFjfj6zbi2/gRvE4U0uzM8KyQfDUnVmyMWheeeN
 rkNRiW6xZdaaNrGKFmx1XKmjn5+gdov9bVgnttHBxBG3rDSwOFZ0tu5EQlzJMxD9YP5E5gcXVMN
 tyRVNyW30CqbOhJjUAA2hqYO8=
X-Received: by 2002:a05:600c:4215:b0:490:bb3e:30b0 with SMTP id
 5b1f17b1804b1-490ec4c0ce3mr110943725e9.4.1781526245655; 
 Mon, 15 Jun 2026 05:24:05 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492203d2449sm234758625e9.14.2026.06.15.05.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 05:24:04 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E6C8C5F857;
 Mon, 15 Jun 2026 13:24:03 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Alexander
 Graf <agraf@csgraf.de>,  Mohamed Mediouni <mohamed@unpredictable.fr>,
 Pedro Barbuda <pbarbuda@microsoft.com>,  qemu-arm@nongnu.org,
 kvm@vger.kernel.org,  Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v7 7/8] target/arm: handle the WFE trap case
In-Reply-To: <CAFEAcA86_a3GfXCDOo2G-R6v3ALwUwNFRkspyTCR0umGiAB2Hw@mail.gmail.com>
 (Peter Maydell's message of "Mon, 15 Jun 2026 12:01:56 +0100")
References: <20260529082948.363931-1-alex.bennee@linaro.org>
 <20260529082948.363931-8-alex.bennee@linaro.org>
 <CAFEAcA8719Q=VCwOm790V6FPA8FyaFZEux=N-7PmOGaaq=O_sw@mail.gmail.com>
 <878q8gjcms.fsf@draig.linaro.org>
 <CAFEAcA86_a3GfXCDOo2G-R6v3ALwUwNFRkspyTCR0umGiAB2Hw@mail.gmail.com>
User-Agent: mu4e 1.14.2-pre1; emacs 30.1
Date: Mon, 15 Jun 2026 13:24:03 +0100
Message-ID: <87wlw0htzw.fsf@draig.linaro.org>
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 15 Jun 2026 at 11:56, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Fri, 29 May 2026 at 09:29, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>> >>
>> >> Now WFE can actually suspend on A-profile we also need to handle when
>> >> its trapped. To do this we need to pass the instruction size so we can
>> >> deal with the is_16bit syndrome encoding.
>> >>
>> >> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> >
>> > Doesn't this need to go earlier in the patchset? Otherwise there's
>> > a point where WFE can go to sleep but doesn't honour the trap bit.
>>
>> Hmm - the way I read the description was we would only trap if we were
>> going to sleep. Pre 6/8 we never sleep so we can't trap.
>
> Yes, that's the point. The guarantee we have to uphold with
> the trap bits is "if the WFE would actually go to sleep, then
> we need to take the trap".
>
> - before this patchset: we never sleep, so never need to trap
> - after patch 6: we can sleep, but we incorrectly won't trap
> - after this patch: we can sleep and will trap
>
> So there's a window in this patchseries (after 6 but before 7)
> where we don't do the right thing.

OK I'll squash the two patches together.

>
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

