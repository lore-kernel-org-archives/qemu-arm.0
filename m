Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0087D606A31A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 19:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qkI4wql6
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMVZK-0006cO-UD; Thu, 29 Oct 2026 15:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMVZH-0006bf-7i
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 15:13:43 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMVZD-00052z-Dm
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 15:13:41 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-8ac9d666d4eso23599127b3.3
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 12:13:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793301218; cv=none;
 d=google.com; s=arc-20260327;
 b=JOWl3hQ1lnVGe19lznh/cSARUafWZq9xbiLC/QuuQsnxkDJbvRr+OyC1Ka3LjCfvRE
 mfmmFkDuI0sRYAXWdiNh0S7MQKHMFvMqY/4gtKMcnmRuGtw6DIdlLr7lfMdm8vq1H21R
 8wlgpRBlB35UMQ94BNGuLRJnrfEXVhOkWpeYyX29aTeXSff8k3VYEFQ7O0Hj/x86F0TM
 Vp2hIAqCBapHoOE0pYvn1pB74OPwr04PLsA9kydMyv8WrfTK9nWvZFcGsIZQibP5V6mQ
 gnIacDJ6JuwIzzKpelRbAZ+ehzcWon1R6dC/oS4r+Ip4cqWjFWDbvc3rDBznR34LTg0j
 yqLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=SZEu8mV7OojmVUJlqjYu6aT+DwSudMCQUB6YEP4qbfs=;
 fh=vkhjPQd0qhxXW9ttOW19PAMuiAHnX73/h9IqEPSMzy8=;
 b=PpTduVNSlHVKMjPLbfWpAlhkBgG9Loj8DIG8gxe4TXbHtiKtFpxLBLqqldHJkXjLMN
 twg5dUQ+ijqD0CCmOd0sEPpAGcGhVtsnHH94DKglqQvyl0Kcq0kh7JxXUiRczzB70BkL
 Hb03WCM2aa56iryJtfSwKXYITfq1BfSEH53NsTJ2NJn1AhrWBlAhlijcB7L2RllIwlx+
 JUhyEf6eqiFL+qtoEdpv1TFlsQSqDpsxreyPqyDuxkaiEaicOAz13VM0YPOTcCF+ZfNE
 8BIlfpEa9TPliKAG3Iq1CZFi7pr74kurS9sAAqct5c2mRejZaUUqgtv2eZG8QIWlAOY2
 YEqw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793301218; x=1793906018; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=SZEu8mV7OojmVUJlqjYu6aT+DwSudMCQUB6YEP4qbfs=;
 b=qkI4wql6xRsrqEwtMjbhS4k+OqD/PSH3SoipQ72F2ok20eyhhu5PbfJWDa+aDhursL
 beXT3zazwM1w15iPIZ0+oW5BN8s9K9orv1mvQdo1FvWLgwGi+zpZm0SlfyhE3lAM2i09
 4OgbFv2gdE/pEdDCcrCEQ6+Ec5ISIh2Akyl9GFiT3w9oIGkUOz5GigLFfj+E5afM043H
 R+dSMxcW4pU+uoj3qEQhiZQxcqZ9BN2TcIr+YNUhTTD8RCJSmz5K6VPMcgaIrurisn2N
 875N88bSjVmqw1BVvXAPG+7PO0HjD5tjRLm7I3ZaL50o/6ojizaYweexL5Qy3jylWafw
 mLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793301218; x=1793906018;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=SZEu8mV7OojmVUJlqjYu6aT+DwSudMCQUB6YEP4qbfs=;
 b=ihYu0DZNju40xIpV5QeoZCToiZLsLD3yhLk/AI4eXmkoZGELvuYEzHwij3y1Fs/bA/
 iW/WcjJOJ08IARMG+rRngbKsv4syVVLQ8kk0R7ZflWnc+7wMxVcA9UpqdLU5qsoj7108
 rDABFtrnp0JW6jj1CYqGI8mu9G82U04r5OAmpn15ZLiiL2CYsexrjXH9JeIELweHIivR
 zE3+HV2xddi7CAbUUdJvsPyjtCTBjMU9QJNkWR68koscpSZ9/J1xGFBJBQ6Vkl6G8Qg1
 E5bfWv+52xp5l6oOCD9+48MIZw8pQjnNIslcmyIPDrrlvzwOT7n3e3KNEhggcUaTzneq
 y7vg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxKKEKH1yWJJLcRLiL4cDtRtaR7zbthXpWiWNfZR2YUAsUk1ClcDw5qlz/U36v7zlMbwi4crMcAHQ==@nongnu.org
X-Gm-Message-State: AFq9FYL/NKGTI1EYQbJ4d0/XemgIUMgV5bY0gBZH9ut0r1pr8SzBgLo3
 VBpusAUmfVXQ//oRKeheqk7NHkOK7H6MDVIYday5G6847yy114wISXr+7vqpFVjfDaLnj2uJBZA
 +xX43/PH5fBCIhix6Oni2s3qWK3xm1tw1EntiW1GpvA==
X-Gm-Gg: AYBFou0XTt84/vqK7+MlVelxTDY2XuZbkEQihkGFyjjOKVRHvDlDnu68tS8Kolt/eFK
 nH8eqE+TXfKA+5Cos7dN3kg3XpkE9m+c1eKjzNtbBAyRrHrz1fgzoTTHHEQGO1Mq7pcqYeMgPxD
 KVnSUC5a0juDMWoN+aJw6Xmt9sYpcCOFxbhLbIt+CJpIIuqNwcdmqgQW19G6slQgjqiTbDMmRhg
 grlm+jNSoG7P5CKheOlC0WK6CGOALiFW9gS/Y2Jc4Ku4GZIHAdWcxrKwdNG4cqDYgm0CCHmWHLb
 aPWNWFq1reZ8fX7Dixucn3N+ofLH+SdnYLSRdKq4XQTLRhNRDvh8qiSqoUXiB1RbAF59Z/cDA/Y
 2xHavO4I1lLubu1DS3JQpE8YLpxIUF+0JXfZTJibhAs9pEiYeKBxPL310CH1luuWCojls/aXAIR
 WmvcEvfIjW/eBoVJYZ79JQ
X-Received: by 2002:a05:690c:660d:b0:8af:e4ee:a91c with SMTP id
 00721157ae682-8b1b5bf6460mr35119367b3.41.1793301217835; Thu, 29 Oct 2026
 12:13:37 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027120135.53048-1-mohamed@unpredictable.fr>
 <CAFEAcA-=bOxmonNOYC2_1MHDrdof6eciYrehJRDfWx_7kYsJmA@mail.gmail.com>
 <1016C70E-8B1C-4F3F-A19E-59D7A0E66A33@unpredictable.fr>
 <CAFEAcA8Ywq6MZxO5jt4AKay8wjWGLQYxnJ1rMkFjzoF1ppUJ3w@mail.gmail.com>
 <49C40F6F-EE09-4237-83B8-1CE18292DE3C@unpredictable.fr>
In-Reply-To: <49C40F6F-EE09-4237-83B8-1CE18292DE3C@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Oct 2026 19:13:26 +0000
X-Gm-Features: AclHuK_ukK5xHPQhT3re5FDOimXNL34x7bT0bR_4OnbyOJLBgKNV4MEce3dgtog
Message-ID: <CAFEAcA9sXa2DvJqP8VViesX72viaVa2bBqMekG1ZwFswnJ9UvA@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] hvf: arm: fixes for QEMU 11.2
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 29 Oct 2026 at 17:33, Mohamed Mediouni <mohamed@unpredictable.fr> w=
rote:
> On 29. Oct 2026, at 18:13, Peter Maydell <peter.maydell@linaro.org> wrote=
:
> > Do you think we should deprecate the "vmapple" machine type, or do
> > you hope to resurrect it still?

> I do hope to get it resurrected as an optional feature still, but
> the issue is that it=E2=80=99ll stay (by design) a reverse-engineered mod=
el.
>
> I need to spin a new revision of the patches for that though.
>
> It will break from time to time and cannot come with an expectation
> of short-term (as in, anything past 6 months) stability/build-ability.

Hmm. If it's going to break every six months or so then I'm not
sure it's really a good fit for upstream QEMU. As we've seen,
we haven't really in practice been able to get updates to it
into the tree particularly quickly, and most downstreams will
be operating on a slower cadence. If we had a larger group of
people interested in cooperating on maintaining it upstream
then that would help, but we don't really seem to have that.

thanks
-- PMM

