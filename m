Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F95CA0ED1
	for <qemu-arm@archiver.kernel.org>; Mon, 11 Aug 2025 16:25:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulVKL-00089D-KE; Mon, 11 Aug 2025 12:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ulVKI-00087T-8F
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 12:24:46 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ulVKB-0002Y4-3Y
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 12:24:44 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-71a3935fa8dso23695967b3.0
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 09:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754929476; x=1755534276; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=x2nhOFM72FXtB1Xm9aLWEcvVSs+JpphmVSRX9u87CfE=;
 b=kX21WG9WIeorabFxdsTdyqAo+K4KfmbR57d5f4c6Jj36UAqyVg6QEVRduYYgwLObiY
 vijVtTvbTAc9MwneRhuqQDKAlH68CBSXb/RwcX5fHJZsPOGKcr13f+7MC4Fxed/KUyek
 j+jFR8vnQIAtf32MLE2dZDiofO0phruhX24Aus2Vk4l+22IlygSbT0t2p9etgOeCxXTb
 3IoWOK/uF9lbqb4x/HdbGvZ1FEn1WIGdZAWo0e5YAIGgG/OH2ULUnyZHs1u6LH8hNYmL
 dCjqRyURrQ4oam9ZZvwoZICFDUmIF+D0/T23hcSpJSDb91M8dq8LOTCIQDBApBChaFum
 Ji5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754929476; x=1755534276;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x2nhOFM72FXtB1Xm9aLWEcvVSs+JpphmVSRX9u87CfE=;
 b=ICEZMX4r2CQvXkwTkUxyhIfahQJQXYLOP8SHZr1voNS3i82rGI/DxmRvTtbdUGnlV+
 BdDsaa5pPsIBu6n7NNOE1k7ZmJjPXzqUDeefSHB5bAUR6BzkSHnhe2SF+ggauhJSIMVk
 3bCIgrhJw+EZTOgKMn551pHnaISpaBYP+wsVHncO7fHt+69U+SsvDxq01XQqTTkaSl37
 6oMBb4ZfQ4p1h/svfjuno5obvPqllFIGJHHMadUDSihI1WC3Py69KK4CzNQ0hKPLJvWJ
 DQCaQkG7uQSAKZlzFGp567BybvDQxKPuJ8+gserYdEBKhXvsOErMCpWDJLWSIqhhHOj2
 xOnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUodut12qofQVvdYjVA8tUSBIiB+oAlsAHZEzv1vLXwxwsJsu34jmZ9zZL/i9DlclgDOiQb1GWInw==@nongnu.org
X-Gm-Message-State: AOJu0Yzs/mTGDLjNtZTSHBEY2cEFQWURvU18ozBcnwdLMFQ3AszcUhUn
 dT9+EJRIYHW/Mc2iCNFQWct8Tuug102IOJgT8GppUAm7oIeKe3Mce6i7cjI/lD6/EVhWUehxhek
 Z+8ZQ1brvft3b0KgWXzkc13MChRqv8Dz9ptKzjCXudQ==
X-Gm-Gg: ASbGncunlK8UkeXBEbG/ZmgUn16l6VYlrSYtYLo79U5MqKjiPBVH8vtQFWFU6QejmHG
 /xLJ48BB8F9xYuSMIKoNtIX4nV/yAdlK4HohJvTCLyf0DMVeBiCUPruk/6PYOu0ZWlv/q0fIlWd
 Xzorns6VW65XnK/E2RS+NG0iBjKYj6czItcKHVHD6ItyTJlVeJe413xZFR8EbYEzIiQKz7jIRD0
 5Oyf3nJX6SoemJX2kU=
X-Google-Smtp-Source: AGHT+IFIkzGvKbE/zk7pwPi2wl4963ViIfgKg1XUha6fyULrOnOk8oSDu8ckRnlCvSkDbhBiANjywRNQbH7ejpX7F/Y=
X-Received: by 2002:a05:690c:63c7:b0:714:583:6d05 with SMTP id
 00721157ae682-71c42a603f8mr4053087b3.32.1754929475656; Mon, 11 Aug 2025
 09:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250811162315.59997-1-stefanha@redhat.com>
In-Reply-To: <20250811162315.59997-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Aug 2025 17:24:23 +0100
X-Gm-Features: Ac12FXzVSkkepUmgWKuS__iUvj8y9vdiAce_pVYhCo7ze7AQF5P5pAPMKd5QqZk
Message-ID: <CAFEAcA9JdoaeuUhW87LD+=OEh7w12oCWdc9VvWch7y7+PwnT9w@mail.gmail.com>
Subject: Re: [PATCH] tests/functional: fix URLs in PCI hotplug test for aarch64
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Gustavo Romero <gustavo.romero@linaro.org>,
 qemu-arm@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Mon, 11 Aug 2025 at 17:23, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> Debian trixie has been released. The "stable" alias no longer refers to
> the Debian bookworm release, so URLs referring to bookworm artifacts via
> the "stable" alias no longer work.
>
> Switch to explicit release naming ("bookworm") to make a permalink so
> the test passes again.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: 374a245573b8 ("tests/functional: Add PCI hotplug test for aarch64")
> Resolves: #3073 ("PCI hotplug test for aarch64 fails due to broken Debian installer URL")
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  tests/functional/test_aarch64_hotplug_pci.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

