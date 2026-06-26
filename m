Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BF9CDE008
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 08:39:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd25R-000743-NY; Fri, 26 Jun 2026 04:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd25N-00073c-Qk
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 04:38:55 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd25M-0004fR-C2
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 04:38:53 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-7fe4808741eso8727187b3.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 01:38:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782463131; cv=none;
 d=google.com; s=arc-20260327;
 b=VLVXPHBcyfzIuZPoMJ+lhq0ZHWgKYdPxMZg2bVsZA3yVY1YkG3NR2+7s6jfsRK4OvG
 6KffEDAJ/dJFIEJoq2EpbJ8jvcVB/2K3VegMVgYSoY/sKDbMRgDOnwW8Y6FamIsOErnP
 A/fqXPzgzlGMzlexkaYtM1mjqo3pNXypM/BZ4JH6Lcfy83V48FLN1ov9Oy7wq9h8vhkP
 io0TrCDD3bv/stln7+hFQSr5XRyDDvspyF22GMaCaiXMmccgpBmszqR2Ir4Fk7rXSogV
 rR0kHLqj3jYUW6wOJm8nenO9L8sHUMF1on8A/oaYaz7rSxMLToQmSUBPARZz2h5A3D4Z
 GT0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=J9m28pkmgly5HZUFVl0v0aZiBwYxGjHzVdJkK/0kMhg=;
 fh=xsx98rmb2QGVr1zVmiWxDVVmi8QKF4lYgTNfHScfskE=;
 b=ZgCFuQbQ3VSUzO91biwk6enUCh7pLNqzPOtgjj3S8s6Wg2MmDkz0LNJD0P3WjynE6l
 sGzF0Y1Qio/zyRfIwpCUtLEVHbJeKy43w4E7y+zpKjkG4CxonNlVV9RqrQI6/QfrK098
 FheVQlrWKGoIx/YMuP2XACCVABZoXgaaIIrwHt2U/ciGatRFNCZrdT/ZfXjmu5QqpAYk
 Si0jH9QPptZUhbxsPCCj4qIHnGTZSMkJBpDWOzqYtaRKRlsTlhuCg4SJ9wKU/n2Ttgh1
 FyNgbaT3eYcJN0uqAGZB4GJWvmCEV/aAJqn+fjW3xi9WZi7SIu9fm5M/vScc3dpyvgxw
 JWSw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782463131; x=1783067931; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J9m28pkmgly5HZUFVl0v0aZiBwYxGjHzVdJkK/0kMhg=;
 b=kKI2VS5aSm60r8e5f+q1a7wDFYlJngcU0ibzhiGAxl1gOTwy54+X6EfdQ5VYpW73U9
 I5vRG9bEx1IIauy06GLf3F9cGTRgQYsgn/vwqTRhrqkbd7mFYSmPKFdtcWJHAvg+OctG
 /aHIm6WMT/LXEi/lSVYS/ajoj1PW24T0ujAmR00v9FGR56+BMfCJckLxApDAzvtbCio2
 +Sy98Cmvn+SCX7gkRhZNIzkIjFloN5v7wYzSx6Hh97RQ23ZF6iiyC+rwakd9Bk8k4F6x
 dqMBUG9mXSkBmReULs3uIPCGK15MO/GzxMxHU7odz7iRrmY2F2lKlTjBVDpWLoF/B/R7
 xPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782463131; x=1783067931;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=J9m28pkmgly5HZUFVl0v0aZiBwYxGjHzVdJkK/0kMhg=;
 b=i9AUlktqZ5j/s7u7D9ArPJuaCJVRxn/0XQUMDwlKssfeeTX8RgfxGgn/DSdy6WgG/l
 kXU/+ZqS+0Bop/zSjkaA5iJLwIKFbTPly+h2hyX8nEGBDa2oNPXxLBwef1kNnPrrvvd4
 0w11gG9/oIdzb+rgnXL3Byoho/qI3MV3WpnaUW3PEfeH2/FKDHXuLJK4LYmJ4yhkyywj
 kTmIPqHHC4KC6A3/mRfx6z3crK9Fn1gkj6VvdzTebu7eyopQueW2tPqo22j8pSKov3PV
 5rajFB9oiRtc9Hup6A23cz/TXWYqIDc2tTsjWCNtHzEt6ZYUuc6cBaGbSbfAndh7BbID
 sISQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoqXbCq/ggoo3ljaq1Hbaazw0RvbBqjnD2i7F8dXEsCpaRuagHQ2hAKerqvRgjMqoDJ9DHk6Th98w==@nongnu.org
X-Gm-Message-State: AOJu0Yyzma1yCsLF4qP9noIR5ssWRXocyZsL80Vqec1YIQspr8LP0CFo
 HQa/QtTgHLqMKgOm8/fiQP4JOuXoEpaktdzvXMHA5xKHigEcjdz/VvXxCmBqiW5ZLKZ6rcCsG/P
 JYpe3v7uIuZO6Pf5gAb55cRIeL4zXCXWMLn42bRxiKQ==
X-Gm-Gg: AfdE7cnNSzkMNa6oimJj1rHmyjOfv0M6v86aQA5ILxhtQM58pZo2L3rmNlDrFZn5gU7
 YAbcEW67fbftKA53pknNpJWahTlR02WLH7pdI7IMejgGy0JBzIsBH2+Mca+pZKLmivZDoMp62dY
 abGUwTFZMYT9HhdXOfuF8k6oVTd8jx8P5G6uJGbWjlM9l2zeNJ6Gme6MfM9ggM1rGW3B7NVd1zG
 WrbN4ow1i7Toz6hdZ0VBSczaauXlLbl8j1IEYcJX1df7KcDLS4f7c4WDNIQN4Ct/Eh+HY2Uch+I
 P9L+OJg6STQXH2Drngwx9kzz6BIEr0hIhgqwI1IvjTy+za93zV40TWQH
X-Received: by 2002:a05:690c:47c6:b0:80b:5a9d:99d5 with SMTP id
 00721157ae682-80b5a9da340mr27332217b3.40.1782463130780; Fri, 26 Jun 2026
 01:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260624124527.1018912-1-alex.bennee@linaro.org>
In-Reply-To: <20260624124527.1018912-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2026 09:38:39 +0100
X-Gm-Features: AVVi8CemtiFs0k5hsvwV9phHA9M-jrD0h7dd3wyYfQl_opgY4-z4qYm8dQDJddc
Message-ID: <CAFEAcA8n_Y7teA_mznSkjhraXfH-9v6fKY8Pz1QswMHz6H_mkQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] target/arm: a few timer fixes while checking
 FEAT_ECV_POFF
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Wed, 24 Jun 2026 at 13:45, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> While I was checking what was needed for FEAT_ECV_POFF I discovered a
> few potential correctness issues. We had actually already done the
> work for the feature so the final patch is just documentation.
>
> v3
>   - tweaked the FEATURE_EL3 check per Richard
>



Applied to target-arm.next, thanks.

-- PMM

