Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766B6F44872
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Apr 2026 14:13:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wBCc9-0006KM-Ti; Fri, 10 Apr 2026 10:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wBCc8-0006Jw-Dm
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 10:13:40 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wBCc6-0004F2-LC
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 10:13:40 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-6500040ef83so1598455d50.2
 for <qemu-arm@nongnu.org>; Fri, 10 Apr 2026 07:13:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775830417; cv=none;
 d=google.com; s=arc-20240605;
 b=dlvEeMbBkZVa6LDmgG1NTlqweLGRRMSL2lGq3Pz9Fjsd086nc+9p0Z6J0vZUfdEz+p
 /8U15Z+fVroSXNtFuERpky4D9LeE4YF66rDlbpESylR/T1SFHxU44qzTV3Q5jatU06mW
 PK49j6RAcP14aqCUaLASAd4YP21brpcrMFWAAujyKsqwwGKW2FxQrtLTHXd38ymyMXXZ
 b4KCHjTwjDq1S8CHf8jhml6jtVOz8c/mYDqIG05XOJVsgDLVW/ty99IjjI1jLlrbtD8L
 /GGKisztzzp9qj+YM8lpC+IjU9djLriU7JG5dV5Jyz3EyIuEUmmhxV1ndi3PmlT+D5P1
 /2XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=dcFSwKB/i4h0goNEkkeG2RnmUVWnuiSUwfDCK6YZJxI=;
 fh=JVAIGIzPaht3BKOM6xgl9MP9KsRH7oeGvQppwaxeHjg=;
 b=i81QHkovnVNBdJfQjBiPl107sjx6BvkeWLLKpwQJKes1rElyVSEYgbBUfcx0WDwFwP
 d/NLaKD4Cseaa2r6nrffoSCtrtSOR4RVm6qBkp0rOZUGXzGh8V2ZgZkdir0kG20RZ/ga
 meo+EtLkxZMLL1se/yMl0xoZQpoLsLooyHepUqUa8VE9B4lOLcljP4NFTo5iFzVoLcs3
 74ivtbmQNLgkjVH/f/gvy19ZbOVkf1qAeFT3ZJHg/FA2pW+9fkQ6PuZk1kfoql1Nfbyr
 BJWihEvdT9wZq+0q3JkSYZOOAfnjNfEMNREskdDE7axv1MrdAlwm4yLA7qSfECQJuyRF
 cO3Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775830417; x=1776435217; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dcFSwKB/i4h0goNEkkeG2RnmUVWnuiSUwfDCK6YZJxI=;
 b=WjpNlCmbo66wUjZU7UV1YquMiY0hs86JeTZXeH7HCXxIf0BTnd9L2JyFC8Y5cU/RDI
 6Xzg6spAZ/2/kX81ilj60Gz36J7eFKYJ4viZYXW3H2u82f17gLl/MJ5cJbeC5G7R7wno
 2BFsMmGm1x0111msQw1FnC0dhc/83cu41t214vHThVKYMyrJEVU608qCcCunep70AqdH
 XFXGtUC6D1A50ljX25wbiv53bL3LKKOOo1AX1OO8Jc/UkWZn7yvyfe5CknaZ2X48SjRa
 7zT/noB6OLXrq4z75KesLGO2Cs/CqHegU1YK9y9HrA1bgt8UIYnojK0TysEkO4QUJTCa
 H3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775830417; x=1776435217;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dcFSwKB/i4h0goNEkkeG2RnmUVWnuiSUwfDCK6YZJxI=;
 b=Yg96W/Bg+7vY5bwPNwhqDcNqglh3DXBMfGAVv9S9DR0bk5xM0UgieV19snHwXHckZ/
 jG6Jc3MTtZbHuW6F/utS9tr2tWc2oeUC8ttUxzHYj8Y9m7wDFlsLoNdmb+w/2AXmfu1h
 tUOXRLQZ4dYgF7tF9oHSQFKBCOgFNdqGjHoZup9jViA/CqUVXs14upszS/+Cq3yEy1ee
 HpDRv1SD5sU+8PZEc7ristGSZLYwCLmbl3fYHEO6kedO6y3SneCZ+Mu/3ZIs8eokCdDk
 zAJANiozbFjRwfPZcccYeYVwekULC4ejOkzcjzEyJstZ/bicyx4YxV2FeWziIu/atrKM
 M0Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB62Zi0J4eApRLkTF6xSqYcVOvo3mOwlxFPSi1PPLvI2OTE48oT4FbXepkC3+Ho5n42szSQleBgQ==@nongnu.org
X-Gm-Message-State: AOJu0YwSnPwNWRjMt2nOykSFHFqYlhIYu9NZnHxEH5JFV09C0zI6mmKZ
 RLf6Sd2iyomGQTGGceTBMx6CMbT9Thk5ZY6cqLlWdl/vyGJFxm7Bz4ebdqc2iZoPl2ecoGfegYB
 NxcP+nHOKI/GR+/xTzU76KycS/Uc3Wep2SVPxgodPiw==
X-Gm-Gg: AeBDiesk1SjDwgrabRTix5x06hy6ba4Fia+1w39mZLkBgm6h2ep4FnDmKuy5q9gG23I
 UomnJ2Wc15xwA3HOb+OMNSd0GIZ4zZEXffrw7gTfxyYktzqel06cTEQnz4WbOXiKsKfA9sMEXpb
 MLyufeJ0DBGtNOhVFljo0EEUvSaPmrD7ecxrVO62e7HEWZkR3uQmUXae8ALYbGwiw15JA6izmMr
 rNj/trkIT2hdzcbIjM+FpZmrEYMP4PtSACKER4+waoE+Yjz3a71pXsOUGROfVN9yY7JMn/aUs8v
 gadC+o/Wr/+rEdE6bNAEPXglmZDobqL/jhTZttjDMqgEI3GkJfXg/qMlH3cBFAXLJyk=
X-Received: by 2002:a05:690e:4805:b0:650:11b3:3f4e with SMTP id
 956f58d0204a3-65198b79118mr2156872d50.32.1775830416839; Fri, 10 Apr 2026
 07:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260317175744.32469-1-lucaaamaral@gmail.com>
 <20260409175234.40792-1-lucaaamaral@gmail.com>
 <CAFEAcA8rF3nuUTd7ARkcGpr-sA1DYJEJc-2E_URQt6nr8u6cGQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8rF3nuUTd7ARkcGpr-sA1DYJEJc-2E_URQt6nr8u6cGQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Apr 2026 15:13:25 +0100
X-Gm-Features: AQROBzDDV4jGlHSK8JpeZCg-ImgoIv_V70hqgdKYGugzRrtjquLdfSjIzE6IZEk
Message-ID: <CAFEAcA9587cZ+oOv2t6No6eBJdR9gxow8RFqy-JN=7OH3xk7HA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] hvf: map granule abstraction, configurable IPA,
 and MAP_FIXED alignment fix
To: Lucas Amaral <lucaaamaral@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, agraf@csgraf.de, 
 mohamed@unpredictable.fr, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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

On Thu, 9 Apr 2026 at 20:06, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 9 Apr 2026 at 18:52, Lucas Amaral <lucaaamaral@gmail.com> wrote:
> >
> > Ping.
> >
> > https://patchew.org/QEMU/20260317175744.32469-1-lucaaamaral@gmail.com/
> >
> > Mohamed gave Reviewed-by on v2 (nits addressed in v3/v4). Patches still
> > apply cleanly on current master.
>
> This is on my todo list to look at; I've been prioritizing 11.0
> work while we're in freeze.

None of these patches seem to have reviewed-by tags. Mohamed,
Alex B, would you mind taking a look at them ?

The question that comes to my mind is whether the two places
changed in accel/hvf to look at hvf_get_map_granule() really
are the only two places in the whole of QEMU where we call
qemu_real_host_page_size() and expect it to be also the guest
page size. The general idea of "guest page size might not be
the same as the host page size QEMU itself gets" isn't hvf
specific -- maybe we should have a qemu_guest_page_size()
function ?

thanks
-- PMM

