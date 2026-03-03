Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F329EC0480
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 09:58:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxMWb-0004mu-QI; Tue, 03 Mar 2026 04:58:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxMWZ-0004lC-9e
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 04:58:43 -0500
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxMWX-0002wK-Rt
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 04:58:43 -0500
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-64ae222d87dso4920690d50.2
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 01:58:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772531920; cv=none;
 d=google.com; s=arc-20240605;
 b=ELBFw/PBvynfXd3cIlbNstALmF0sEmq0R8xz3GAHUQmSzBqWYn+JV8ryTfzFxRS5KC
 hfqzxzt9QRutegj6csFoa7Vut6Of2a/WVXWWmWv5dQKaZCq+81BO8/Vg1aUHjsrpQV+g
 Wi8objySw08DNRq80cH2VzfuXqDKD1daLHhZtPcB/UtN+Ap+Ei7sYCKJJQMZXHHJPk40
 JKrKotbbri0XW5SSBmxXbh/Lts5EBHOyvrViJL1k+xP0MRBqdOSo/jsfoITXQ0ny5pbE
 93xD67fFHuvw6yPwuZhC71ys5iUelFYv53rzcAUN96Q9dOtUZFrNceP4sPsl7OrQmKCA
 Fjjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=5pCey5Ubv1AsOAyW3sQYFrNaoha+uFbjbH8c/Hsyb5Y=;
 fh=ViqI1nqh8K/bN+wONQbf1b2+gI6hdjfviEXqy+ADSPI=;
 b=ABm2bBYtIPbEYJR3ylp5q1YxjtrkNyQzK1ai72PTxqHyXODJIn9Nrw2kKnMFRIj1nv
 g1hElWcCM9LmUkhg0wcpfC3L27MruoCjrSnheA90BhoKzt7KdyR4zl7XTV5LUnfk21N+
 lrvI80/8hygrKfHWePrciyefEQ5WPeFvibvNEm+H60JRMhsxExysiUBFYyZ7dsbsebvA
 QTtZio/FzEpM0VyT0KRCtOTZlFodwjlBtoiSeV2zqkWvb4L3tqPm3/LZ2pf+3qrAeXNq
 Dd7DCnPFSnruOVIwlt38Qm/xjP5M/6OzsGa043rFee3YG3l+3tye5z8GnXYPS+UpexGR
 KuHA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772531920; x=1773136720; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5pCey5Ubv1AsOAyW3sQYFrNaoha+uFbjbH8c/Hsyb5Y=;
 b=tC8yaGpoVNflvmaGm8TiZa7hkfetGL0XTq5qyW/k6UbRzA4xvWQtCOoM+zXfW65Lnp
 +Ya82mnDzHaRrEufUY8Sp3KVX3+MWGCXsNxxknkJcFby5GKXt+bbj/SNddlnRycexlSk
 TSJlbpYbIBqcxKD5iqg2U/1i5vwj3/2htlb0FUiOk1TNWmaKakzVGbufItirhv1UIS3m
 Gu6l6rUChyeLVUXwGy7qVPkxs8zsC/ib1aXOlMzwiXGsbPcJDc+q7twEpEMiqbnIGmkC
 NFS8CwuruYYKflZg2fENS1GA+3vr2mcpaABlgo8hlRYbHf4No1guDRwqjJxPWAqB8IiQ
 Nf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772531920; x=1773136720;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5pCey5Ubv1AsOAyW3sQYFrNaoha+uFbjbH8c/Hsyb5Y=;
 b=XqvqvhzxfiHMJaD2mhNsblYDSVhG+2bwACXqLQjoF+Hbi9qZmqVd3jZJI/PRjxaBvm
 C4pfnDQJn7rEoTMoOOZU2x8as1oWhhk6DVlilGtVW5GRO2Pthg03pgfxQq36mt4gqwXq
 zYX9SA6x2MpG2YvvCXkK4MctF3QCUgV+cUZFxheGyH8PwIeX8gx9CkXza1D23uxzvH2H
 VBLxyfwVzSI/MPhFZnuultKybDcuNQnZwEIknLnQTl5JcoordG3yNvfkGj8UQ+uGDLAs
 z4qbgBsYnEf8atvkGNY3fQRrBoW9Ngz5S/5f7mzMnxq3SgW8x6/Bz1RlmRZgbhbTo6LW
 Wq0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6MBiw2CK60MKmMPA4g/ck6+nH4Ob4RvkZfDnXhUpjjE2FGbaxf9dN+ZC/sLGxYlJZakEw9QVz1Q==@nongnu.org
X-Gm-Message-State: AOJu0YzF6kApmYC89KyVK8TN1KvMSp6LZTy0tksr7cTKly3LCJTfBTKr
 cso6JtV55O731OpHBpcnXm8qwCCAi4WU4pYQJGLVL64QOIZ+fcMCuCbGHw2+tH/TtnfQ7oegKab
 PySv2jmfEMd/FLvnZuzRJlY0Oh++JckRrx6dIQsq0Fw==
X-Gm-Gg: ATEYQzwQ2ZAtqLIviqeon/ujgoFkD1JjUznMOPMgndJozEy3i1JZmRqehe7/daDCzly
 EP7m0Y6tbaexUxdfrTFabU4g701jifbYGDsDNmwAOieSa1j8ldp6m0P1/r+iBVopShfX+UEKQng
 upnbMoOYP1yNaNrc4QcXrKfy7iApBhqpivkJQH1xb6vU9WTDFYJAJtCrENIPuOv8XlSLkHOCwhH
 3duRKzrrRsSBftcKoUUJQMgmzeX1tZotrYxhgUQlbi4NOMgNoyQjmygxe57XMs2V5NQFDJz7nQ0
 816kCx/ik8ksWEe7qLl9jipH0PHGk0Lp57Hu2773BLlhbSpLOjIex0xw3GbYfhWYPKg=
X-Received: by 2002:a05:690e:4243:b0:64a:cf34:d9ac with SMTP id
 956f58d0204a3-64cc20d2d3dmr9976130d50.29.1772531920594; Tue, 03 Mar 2026
 01:58:40 -0800 (PST)
MIME-Version: 1.0
References: <20260226090704.27699-1-thuth@redhat.com>
In-Reply-To: <20260226090704.27699-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2026 09:58:29 +0000
X-Gm-Features: AaiRm523zjLlYy9NV7-yZRbLKlTTYbBOfz4UahSJx23BXmZLJYD284RlkqIet0E
Message-ID: <CAFEAcA9g+S7Z4O6VsdH3tQ_zxJLwFq8Usipm5grVvzTMp45d+Q@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Remove the deprecated "highbank" and "midway"
 machines
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Rob Herring <robh@kernel.org>, qemu-arm@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000007aff98064c1bbffb"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--0000000000007aff98064c1bbffb
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Feb 2026 at 09:07, Thomas Huth <thuth@redhat.com> wrote:
>
> From: Thomas Huth <thuth@redhat.com>
>
> These machines have been marked as deprecated two releases ago,
> and so far nobody complained that they are still useful, so it's
> time to remove these now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>



Applied to target-arm.next, thanks.

-- PMM

--0000000000007aff98064c1bbffb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Thu, 26 Feb 2026 at 09:07, Thomas Huth &lt;<a h=
ref=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wrote:<br>&gt;<br>=
&gt; From: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat=
.com</a>&gt;<br>&gt;<br>&gt; These machines have been marked as deprecated =
two releases ago,<br>&gt; and so far nobody complained that they are still =
useful, so it&#39;s<br>&gt; time to remove these now.<br>&gt;<br><div>&gt; =
Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@re=
dhat.com</a>&gt;</div><div><br></div><div><br>
<br>
Applied to target-arm.next, thanks.<br>
<br>
-- PMM<br>
<br></div></div>

--0000000000007aff98064c1bbffb--

