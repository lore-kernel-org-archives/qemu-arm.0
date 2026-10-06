Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CFACA5FFF
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 09:06:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xENLB-00044L-Fg; Wed, 07 Oct 2026 04:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xEJqm-0001Lt-Px
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 01:06:21 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xEJqf-00057J-Ti
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 01:05:56 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-7f48c750afcso2509457a34.0
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 22:05:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791349547; cv=none;
 d=google.com; s=arc-20260327;
 b=VBw8fmW0jiS97+ShjNdaA1eBi9OltxE+Gp3RHlFPkPFx+giRoM2A5bDOvlP/PmNUc5
 8J1O4MDEa3u2ra2xDlBEY0s9assDZ5q0HVCGf51exxl3fdpAxd/80QIFlqBS/8m4WoLr
 w/ifustnccDz7Y8VfF4U+72OAkj3CKZ52RNVeOTRJ5vnRTlfUh1uyp9QNzKAl16BzG5l
 anpSFmnOQbSFpJ+Od4d1uUeV7TF2ULg/eEIfEGvppbMfdtk5YxSVehY9jqVWs5gA6N0k
 zRFdu6mJMZnOj9aGghen2X0SJ5iUz7gYouR2baNN2matxkAtSqiHD+/mww96VXKB911W
 hVRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=leiS/eFLLhtGTpDsq+zm5fIE5F8QGWtKOAaevU6AOz4=;
 fh=I4KuYbnnRh/I7LgAe2rJ3xE/KX/swkHtKZQ6faIQj9Q=;
 b=dhruRi5cB3divPrnRfz/bSD54e2mHq2aesZH4ajruHF6gGesJrQLsjJYYRyOOllRth
 Cu4kPLOqpm0/jV2m7x/vEVex5InFhb6yEk4VJaNl+iHVsL4bVn/1Mf5mYydJeSlTHXpR
 e5zRIKNnETXBLUF/qwNugBSmfhP/KSMqd18JkgClNS14qyyxOfalj55b2ZLjhOKxqE98
 7Ow5zHQEbmD4J3K+TSnXl+tQ05U5hRUEI+9enH4iyKN0d3+aDdZuvaCAm8MR+iP3VFkK
 8RTGwKKU6F+ZFGG0iPl1NPJLekwjXsFsr85rcZNfGdq1jKTwz6TjRBH9ZIIbvme02r6T
 DcCA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791349547; x=1791954347; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=leiS/eFLLhtGTpDsq+zm5fIE5F8QGWtKOAaevU6AOz4=;
 b=ytrps6laqiVHP4csu9z3RTsYN5pg7YZVck9FVrgU1XQcv/ihTRzbcRpWhIljjp/LuQ
 rHr/cd2WhI32bjP9knKys6SucOjgsD0eM2RCEQbvBosB1XFOjnpY8cTrsNwC5HHRIjTZ
 /+wbInBXMiaot6ZmAywzzN/OnMrAXXPLRrpGjzgtgaVzgRsMFA6BN+KNlPH1gMIlXZnA
 LQzamWSGshkxUg4z0h133rV1qiYG/gct3vw7D25pVWc8s/C6qEoxf6JE0HNdu0SPj6QY
 cX9c4oC9rCS6O+zbJjId9YoNLwIVnugfmzM7mzCZ/AMnZrovQIr1aBgcwal+/kZLVA4F
 yy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791349547; x=1791954347;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=leiS/eFLLhtGTpDsq+zm5fIE5F8QGWtKOAaevU6AOz4=;
 b=AsUjyzxA18n3efSBhu64AnmO7DNLrCvKbyI7chR1u9aIEqSLCBG8Gy7l51+9leSuwm
 qC22AS9/HqebyXWtPfPviGhZ24vOEtxyuPj5rKibCsE64h0TMKsnd8pUo0DdVZbB9k3n
 p0cruYDAq/K8mFSVWGFdU3nJAyRqzi98LmmI3HCtrjSGfYUh1nB3RlrJmjdr2ulKRcZ6
 wdkfZoZAgQ8WJzvm6dt/OtYCEo7fJjUllpFuVUIQjpli/FlsI0xmI4x6Sk4hnKywiioh
 3+jIv+MnyJPPr9XumhG2oZbG7FnM74DYf0KBfslQSdxOfEKXSET1HUXn0T+gnQy7hDrS
 QWVg==
X-Forwarded-Encrypted: i=1;
 AKwUvByZIvnP7sf5w6VcmIcNkZmv3VGMaZXdRcnk2Ige/aTQg2u54/0zDrAmGrzbcDkK8xwrRurlKjwLVg==@nongnu.org
X-Gm-Message-State: AFuF++nbt1Ghe+vFFnayw6VLAUljXXiGc9NtjZAww6SJxE4rJegHzsG3
 ck+IDdswpj+O9LIRZemDBvWxMSdsw84jkmAjVWtvCkT8yW6LDPgeMYec8zpI3no51ie9RUbWR+M
 T1jj5psMRTdVH0skMhNJpnp3wmVBh8ijJvt+QukXewZpYL4qG44kGIIU=
X-Gm-Gg: AYBFou0FHXn1hSjVkdbpEaApgdEH3pAr5DfE/igqET49t+I3ZbfdXAdSdshVnhQbbJm
 Ss0i1yarSxvdT+eR3nVSc2qV5KobzTOyzYUCvHecuLmVwJmDpd3fa0VJr36AeTlymwrDmeGqUC0
 FomIt/Uf1LLhfdYKq3I1v+8CNc95S0GdHQWS+zHWlOw2paXlEsk/uyx7tGHHdlJTKzwmAO/7oR3
 IBg/uVHFrUGr7FRKwX1E+YPbQveFQo5gvMFVvIBo2Gn8TjTZuKVZZXFWdFrwKwzS1Jx/98liPwl
 UDWTjM7rAS4ZgveNnLlBG4iJvWvpBInuTjBfwKZ259rlwD3PYZF5cJAXVksMlaSuOhDE0mAQTEJ
 MKR0h9589PnORVDXElxvXfvCGjigTitncuZZrNvFvRJI+zAOwpw==
X-Received: by 2002:a05:690c:e681:10b0:8ac:927:f7d1 with SMTP id
 00721157ae682-8ae94cb53d1mr32268947b3.22.1791284703490; Tue, 06 Oct 2026
 04:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260930150257.408020-1-alex.bennee@linaro.org>
In-Reply-To: <20260930150257.408020-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Oct 2026 12:04:51 +0100
X-Gm-Features: AclHuK9PS3ogLaWJEfdvADGi697oGIeItZrf8AY-CpwfGEO9GeBlJg0L2UVhKfw
Message-ID: <CAFEAcA_3rtOLXvr-pFp2SHdbQK+v2oZOCDLxBvYBRWMCGs2SKw@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: fix user-mode emulation of ID_AA64MMFR0_EL1
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x332.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Wed, 30 Sept 2026 at 16:03, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> Since kernel commit b130a8f70cbbf9 (KVM: arm64: Check advertised
> Stage-2 page size capability) the relevant Stage 2 have been pegged at
> 1 f(4KB granule not supported at stage 2) by the kernel. As a result
> the behaviour of the test differs when run on real HW:
>
>   id_aa64mmfr0_el1    : 0x00000111ff000000
>     !!extra bits!!    : 0x0000011100000000
>
> compared to under emulation (neoverse-n1):
>
>   id_aa64mmfr0_el1    : 0x00000000ff000000
>
> Update the test with a new helper to explicitly test for fixed bits
> and update v8_user_idregs to match real systems.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4566
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>



Applied to target-arm.next, thanks.

-- PMM

