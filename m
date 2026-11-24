Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FE8606A327
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Nov 2026 12:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nJHLoUfq
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xVq4t-0002Eu-5t; Tue, 24 Nov 2026 07:56:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xVq4p-0002D1-BV
 for qemu-arm@nongnu.org; Tue, 24 Nov 2026 07:56:52 -0500
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xVq4n-0005tS-GF
 for qemu-arm@nongnu.org; Tue, 24 Nov 2026 07:56:50 -0500
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-679aeeddc6bso4153154d50.2
 for <qemu-arm@nongnu.org>; Tue, 24 Nov 2026 04:56:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795525006; cv=none;
 d=google.com; s=arc-20260327;
 b=Ah+h0itY+TBdRXBR0L6Ss02LI6ti0XdMIGcGnRavdTgxbWUve0ewCXjbgu8BOewDvC
 sveVirbBpV9keoHS2TOa7iTQqjZYsmVqMletzK2LQ2kneMf+Qfin+tawhUAwW6F4GlKk
 3URR56kZy6Jkp03zWcc/LIpj16igq+M8xeNLcnXAraI3db+KUWMEcSAe8Lj7zQ77dezp
 47zMf9g43l/Kcn2fVecxe+DMp+Sg3ordzdSuwSo4bgkMoBf8qXcFV1q+4dghxZkAmTPq
 z7onJOiSGKx2mKgBS1LZl2ML9lgVjDTPmvkFu0qKzpO79y5y/e96JBI8WUoVAz6jVW6a
 ZdCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ptZydUdAO5gMrta7243uYozof6VkAuFmQ5fWWpC/dmA=;
 fh=O++mgtj1HWzedTNx0/xn3C1w0dzlo3sMYaJW1ON9ZsU=;
 b=QDuMyU8P8hMWyq6DlBeC56iqv1n4IQBQyj0AncpBs1vmyYfahCCtS1iHRPZSKRXJZO
 6PQk4MuwGpBHuOgsacUZHTDFGc/i/Rt/r24oXHNt8nHm8dG3lME3atqPT2FSqSRHi0MP
 SCDfCNWqABMcu/s9hheQbPLiicVVe6hxzT93WO1gGsF6C6Bkd/jiUPO1B40ZeK2AWcQ6
 ubs2IWOv8LhzefnRo87e5qRBwLG+MmAOPGcVUpIshWgO9pf18QWCTKkuxUDuUB+iRdlO
 Lg228MFdbFzf3D+olkEtToYJaVWLSJ6EZ3B1hrfGEmCA/OtYwSfXDGXzw5LVCtWBJ4kz
 HECA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795525006; x=1796129806; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ptZydUdAO5gMrta7243uYozof6VkAuFmQ5fWWpC/dmA=;
 b=nJHLoUfq5JAAVeFycs9rqm4pcL/SZJ0wzaG9eyDX1jPLOhMHKuEiidegMFmkQPMkz/
 0zXjkzkNBfkS/VjUBctCGN5EtxK2RFyJfTgpcNBwpyzDvAGQcMbw6sL83iD8x3Gx9WaB
 LbR2mhUp+ZoYvk5aY3OcCcaHEQ8khbrsTGbv+NiC1/Ccsv3aQT+GgKTz4/OF/n6/nW7Q
 CiCFC86fiAqLHAlRItxiz+VZUuJzZfqCFLUNpKYpDDbnl5JVpsmkH1RKPeFuBkTfPkKP
 kQPowekVgI8Y7JvKCoZIwAQe1TmLPMKNN3frwKMrfWL/qkkcFXTMYl9cdGFYLaqAKX0d
 XtcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795525006; x=1796129806;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ptZydUdAO5gMrta7243uYozof6VkAuFmQ5fWWpC/dmA=;
 b=qPiu7aODZUaEOAoziBHJD1Lm7Ofh1SDAROUrtvPgBmqeVQ2wgY90JucYEJ7mSPV9F9
 tbnRUX9Bpwz33PGNKi0yXfi+Fh3v/CzAhX2UfMmAo43mh+Rnrfp1z8Quo23CiZrVcNfS
 bM9D/wuOojvC1mbrkES+hOXQkQ+ZkPls8k5k+4D0/XV+3/Uur/uLCfSBNZSD522WycLP
 0+U3kVmLG3LBmK+3eLlJZJAS26JsriNGKE1bycKqARTm5JzMTFSovxKfNd9GXcmU/ucz
 m697EOg1z3csb/kYcJoWCpvEKKWQHJoiL0EJPHcYp9zopKK+Xb8f+6hSVjQ8Q5eggxGO
 B5TQ==
X-Gm-Message-State: APuU4Z+5q/V+WYhrQH6FbcSO8480Z/jhxQcjGr9pepWa8IMLclqCXwl7
 JBgxAudOPV4nZSGbxRvnJ/drMFdJ2fcw2HGZ3zsy1a99m8q4vTrNAEBbhBCur9OCGz02D/aLLvZ
 A9l+56iUZRUXGJbdRIcmaTKh3imjmqsfHq4G91kt12Q==
X-Gm-Gg: AZFdTZf+k8yu5G2o9rcujVu7iZt4TVu43HWEeorrWt7qps5RdwidrT1QTtBIfhoQ2OC
 MllFozHANnKTgjQmhTGpVOgi1/x6crQqZWMhLLN0c4Knsb2qxyiWGrdoSbkjn6wYNQUUKuiKLpc
 bqLwdFHu7A/yeN/yBL/Kte2Xy1ZHnNy9HYTB/hZRLtGShDQh3/uRxAD5ns4YyLy1vtzmr+sO6O/
 urX5vItJibt396dUahGJ+aL+RzlLE5I2EhYVfpAvRY2Fi5uOyutgHf1G2Wa1THBwCMctH4HjJXd
 QTvRdoCMrqyxoAZk3bS2a+67JeD0W82pWOqneleNViNbZ68raS3CHMdTW9yNKiIbNQNyKynk8Al
 4+4v6DKJUTMBjuW6wy7sYkBJJSPDOKX4+CXAoeH97HlwjJ674srT0ClGNeTMalYvGH6qkWb+JXT
 fb8JvHM5T4A0rPP5YQ0WSxLnbQuwETcBj1r/DkcpFpjQ==
X-Received: by 2002:a05:690e:150b:b0:67d:a73e:2b61 with SMTP id
 956f58d0204a3-67df4515518mr3773279d50.99.1795525006344; Tue, 24 Nov 2026
 04:56:46 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261124120509.19746-1-zenghui.yu@linux.dev>
In-Reply-To: <20261124120509.19746-1-zenghui.yu@linux.dev>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Nov 2026 12:56:34 +0000
X-Gm-Features: Aa3M54qmV3hocHyszUPPNH7EVmVJ8vtrw6upS3drb0PCtF4LVz2-o4_R30eLhww
Message-ID: <CAFEAcA88=3CRBJQ5PSxrsb9F1yaL7ubF_hV8zxTQejKWnayGZA@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gicv5: Fix value of the IRS_DEVARCH register
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 24 Nov 2026 at 12:05, Zenghui Yu <zenghui.yu@linux.dev> wrote:
>
> The GICv5 spec says bits [31:21] of IRS_DEVARCH are 0x23b. We wrongly
> shifted it by 31 instead of 21, so guests read 0x80105a19 rather than
> 0x47705a19.
>
> Fixes: 22232793ecb8 ("hw/intc/arm_gicv5: Implement CoreSight ID registers")
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>

Whoops; thanks for the patch, applied to target-arm.next.

-- PMM

