Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64793CCF9EB
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 15:55:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDPYf-0008BV-JO; Mon, 27 Oct 2025 11:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDPYe-0008BL-VX
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 11:54:57 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDPYb-0001kE-2m
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 11:54:56 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-7832691f86cso65153287b3.1
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 08:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761580489; x=1762185289; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=534W0gf88r0k0nhqi42TOYPRiaR4x055x+ZUe0CVgKc=;
 b=FFUUWNp3+4DXvFIxZ3nmWGIgIphYmnxT813HFyg3UXKmI7N1+xyepL9rn0VioNXsiR
 mWGL3ZJn1GN1jZBxSIzas1hkDjs0porQx9RDvtjr4u+XlnUCTWrK0aox3yGgQVAxqq1I
 x3k40NOzTcUlId7uHMgq64Kw7VE+Mo7ptbuc637/uAVv0DvFGVlksj2UWFLbwrXbJahz
 K3wKEwFFpUCAL5pi02a/eiyL5+Ty9vzbyor4CCcvLAsazUZgJy8pUGmacAjDCBkcgdkK
 gza3VkUhXHXjDYCzDvTd2Ge+SyY6tDABlw4/UzmRwzY3KiI6lvcKrQqLSBXuO/MFQYXR
 n6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761580489; x=1762185289;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=534W0gf88r0k0nhqi42TOYPRiaR4x055x+ZUe0CVgKc=;
 b=Efbg8U9zoIVD3m48HE5UWbfqH+1KVomi++yzQCcI9l7yfv3QUEWnzTG4IQJiNlAHTY
 WpLYJb7OM7oHO/T+ShuK4aA2EniuJhduuy8wJmI/u6DsrBv4++aFv8IzcNT/bjUWoMVZ
 ny/ftigUP2dGqFy2xe7HKHKaB8VB1a1eW4LPfSMnCLAZbc9mMixDpNhq7vyF/yu6d5J8
 ccPSvUTfPRRUTbXNNq4WXRCL5dQrvysvFkGPustjpf2Dj9gn2HbqewRlqSl6RcBSJMTa
 kuzX+EisNUi6YNH6qdPO0MTb4x19StmRktyW882aUN9qqH1qjp5qM+W0MytQgGbnFRXv
 K3+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXatzRyhGUzs6ia+KBX91RqAxuYDyqTet/pZabSzqzV8rS7yYY7vPFvvt2ckEyI/sbLZ5+THTSs3w==@nongnu.org
X-Gm-Message-State: AOJu0Yy3fpzDsexEeX/oLFwR84OGFec+6A2PQ1MPImToFW8AViTwfAqC
 laPUQgMXgigd3fV3ONnHz1hfNbIkKzV7ibRdGyY0Az39f9SUAjs4y8lHybha4gTx3CY9hXUUONO
 +6EiAFQy1CKp+ZE4k1CQ2SJJR9Uq3yx8uyBwPKHFvRQ==
X-Gm-Gg: ASbGncvJmQ7Q4retKvlakuTBG2QgLMDSUnsIa/sIFk5RddagFOK3C4Nmx3Metn+kQoV
 M/6dC0oCpyg+ODrnZlgHaYLD8Uw0RO8v7z6+iWEff390/YhD9zspXzsJGPRWlDsdzTt2I4DFqlZ
 NKIUlP5/nH/IKCL7G9TAAH1ACQHTpZYGceqSB6GWRpbhb/Mjt2+cWaoaFFGOzwVJF5D5XnClDJP
 2uOe5Oe/zd14pNvSyemf9fq6TtD2+KMeS/2X6JW732NrGSoLCqDN0t7+TzCtQ==
X-Google-Smtp-Source: AGHT+IHwDmrvh1yhQoDkKBtbYbt5ChlKJQtJy7NeC5ljO4ls29LThOtWrX4JzpUrHBD7XNdjZomrvP7qZklUiJweLoU=
X-Received: by 2002:a05:690c:88b:b0:785:ca0f:b357 with SMTP id
 00721157ae682-78617ff8d4emr2864737b3.58.1761580489509; Mon, 27 Oct 2025
 08:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <20251016202044.75261-1-mohamed@unpredictable.fr>
In-Reply-To: <20251016202044.75261-1-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Oct 2025 15:54:38 +0000
X-Gm-Features: AWmQ_bmZk_C6Nd8lpxfl8TluecCBX-hQSvMpYShzqn2w0sod-vN8Db5r7yoXXXk
Message-ID: <CAFEAcA9nTQx-gEjvh-WO5RvS0D+qpMMmbB4UseC1ZhGcwrRgHQ@mail.gmail.com>
Subject: Re: [PATCH v9 00/24] WHPX support for Arm
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Pedro Barbuda <pbarbuda@microsoft.com>,
 qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Phil Dennis-Jordan <phil@philjordan.eu>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Thu, 16 Oct 2025 at 21:20, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> Link to branch: https://github.com/mediouni-m/qemu whpx (tag for this submission: whpx-v9)
>
> Missing features:
> - PSCI state sync with Hyper-V
> - Interrupt controller save-restore
> - SVE register sync
>
> Known bugs:
> - reboots when multiple cores are enabled are currently broken
> - U-Boot still doesn't work (hangs when trying to parse firmware) but EDK2 does.
>
> Known issues (outside of this patchset)
> - Qemu on Windows seems to have regressed at least with the GTK backend in ways that broke
> virtio-gpu and ramfb, but this also affects TCG...
>

FYI, only patches 1 to 10 seem to have made it to the list:

https://lore.kernel.org/qemu-devel/20251016202044.75261-1-mohamed@unpredictable.fr/

thanks
-- PMM

