Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D16606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 13:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pbRjE1Hj
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMPtk-0005gM-4Y; Thu, 29 Oct 2026 09:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMPtY-0005eP-RC
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 09:10:22 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMPtX-0005xN-5T
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 09:10:16 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-8565d77c277so18136567b3.0
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 06:10:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793279414; cv=none;
 d=google.com; s=arc-20260327;
 b=jFlHqbhqoFgkypmizYH4J4REZ+5uzZVzfHCSQnd10k7hszTMusolFRf/fAerD8gkua
 pHobg01GCph7FmH+eiposJqm0nfur8E1T/tMV8zbx2pruAIzpjUdg2GNg9h9QjdHm9T8
 E2tsXPim68CKDvjogWlPAjcjyTEUYzClscf/j339wKTOYC6C/mS7gTjWRBTHVeotvXyp
 YLzM5klbvPT+eU0mJGwk1wd6+UJh5mgw1buwl/xdy7KNi8/KPfIxnWjTyql0eV+CoD7D
 fJMqNwOcW3hZgHPjCB702L6M9Kl727gP07CazoNdY6wW4OQUvIWiY74URUJwdCItOyPA
 fuBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=bIaJCNBfi4KmYzBubyQiQSnbguZje7+rK9K8hzJsz4U=;
 fh=YTGzrfYCNbPsjVlkCWUj+KHnLbhJ57TEC4KKQFgtIDw=;
 b=jpQ987a9TrnDaBdIg69k8qAgMMlfiiNonZyeSECdihZUmHu7vpcn4OJSIAnUgjI8Ax
 jCo4shFmMZkjaKs1azYac7ZHNjy3tUsdpMdHtMLjidpPo0Psc7VR1fur1qcFEraanuOA
 R2aykeFY++kHx+XE4CcvnXYJ4Qeap9dgrfulOaLFTJN05h/fFTMY5NYXuZxW1yI5/YX6
 ZmOrnvmQrcjL55Xs0YOcewHiUeTsV4Vb3jSDbbxMuMhy/MouvA/54Fp2RIuBmox5yglU
 fSz6sJ8D00FxpCSeD7fct8H92T827LJ3JqZRboqxaYRRPO3z0OooM9hoNcYu6cguUCQo
 9r7w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793279414; x=1793884214; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=bIaJCNBfi4KmYzBubyQiQSnbguZje7+rK9K8hzJsz4U=;
 b=pbRjE1Hj6q/os2SKOnfx67HE1yz9dXPO5vzII9AAqxKGFKrhLgExqji18Igsq2GnSy
 XrWe7RmvlJ/zBiOYeTkqJbVnazHDJk8oPRAuhf0eUuAZ/6goAOJMVKRUBkw9ckjbQxGV
 wdG1eIGB7RGKgqi1HRKVe3iJwepR+9uzoTI4m1MFmwukxzFN0rHP77aQtXNMxqTfPdBk
 wrBFFLl0mST6nIPrzP/dNBNWsJ3G9N9Xqklo+Nr8eLPGe6UuOc/1umEWYMo3vwM+98vk
 GVG0riVXZW9ZYgBycrwdBh8zJSoJoTvtNZlALgtTUV/FvP2rJs5mxLSNMdKcRV5mUEBi
 kRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793279414; x=1793884214;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=bIaJCNBfi4KmYzBubyQiQSnbguZje7+rK9K8hzJsz4U=;
 b=gDlKFxY/Py651gcDoCDdPU9OeO6jb5VoScCoBTfnAVMlifhisZDktGsHHJ9P25xP8R
 t+aLBx3UDltO1htTM7cSRKsiiSlV6TpVSbKLKyTq3JqR/QxaFeabORmf9dP422HaPAKM
 fPxF0HlPmZpx/u+q/2gWDnWs2MCVADPyMPohGVwImaTeEenHHSxYwCmL51RLvo1TrURP
 mowncqjxYs2+34isZOMAGKoKz3rQdXeyIxc4/QMJOnDGbxTgIlajLmL4TcI2Lde/1VYP
 +F5S9p/8OBT8cYcC1gADi3boLmULACj/ovKNfm3dYzGZtT8T4rn0Up9H/WPfQx0gDy8n
 AaEQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByAlPio2LVy3Li+6JW37hDPwTQL/OSLWMWk7Yt2Nz8vTvsClcMkNHJ2er3MpUgknLWr2wU5Eec1+A==@nongnu.org
X-Gm-Message-State: AFq9FYJzWPZnyoFbVbsHNMDN5M/EGs6B40BorACj3ExPyp1HOIPmhR9o
 c699aCH/w5EB0qSn8cHJOe4wVfQ7Vsuop7iaLBaY00dgHIzB1B9HBZ1BDFVkonoxKGK4Is3RnFO
 jfrevWaKS+qY1wkVcSiPQ3e/OMa9cqljAIn2JSSN9PQ==
X-Gm-Gg: AYBFou3xhp8Nitp2j6PSthPZ9CG3Ov+0UGd2ZqN2h5hK3/FKAlZFUeUzP42irxMSChP
 +c2epf/LyrfDSdO1mN1Y3XHloyYUHTd/g7+tZvTiJ3jHSH/l+3FZmApyAvVK2xIS4whVq97RhwR
 Ax/cXAUGuhsgMlHXu0YuCrWNMPOMIp7YRd5mFGH6iy02YojYTDIZI+o/e2gjPMON77w49RRM0M6
 XNYF6OwUMTVNzgC6TVe4m22VAco6KnEfq4rF+TYa+uw+fExE4Zr2oYZ4uODpsDkPH23qoCAU6Rk
 XSMKb/DAp4k/vvTakEBjMt6NRXWSo9GJd0a5f7rhIBL6XPan0aMysUbX7QOsYKHWgtTcIcRZZdY
 C+0zHfWPMIBRYVCpDV8bRjao1QKWEC7mwVviU0UGw5SPb6sHX8XcweIZoZ03qJSlrKfGQueKEOG
 AkkBHCCHnEwmlNkZ7rYeeGbLNXsyYEL8mAzyrOAZG/Nw==
X-Received: by 2002:a05:690c:fc2:b0:8ac:b167:4877 with SMTP id
 00721157ae682-8b1b5c9ff05mr35361347b3.36.1793279413797; Thu, 29 Oct 2026
 06:10:13 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261026175220.85545-1-philmd@oss.qualcomm.com>
 <7f2fb4fe-887f-449b-9a08-c65375077551@linaro.org>
In-Reply-To: <7f2fb4fe-887f-449b-9a08-c65375077551@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Oct 2026 13:10:02 +0000
X-Gm-Features: AclHuK-3-varx5bWt8ih7prViqxnZ_xC8y4te9XYlRzDSQGlrQtsNA07NVDnreE
Message-ID: <CAFEAcA9Lo63kyMmQqeE_LEzBT5OV-Lm5YoVp05LvPRugrxk_aw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Initialize SMCR_EL1.EZT0 for linux-user
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Samyuktha K <samyu@qti.qualcomm.com>,
 Sritam Paltasingh <spaltasi@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 28 Oct 2026 at 11:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/26/26 12:52, Philippe Mathieu-Daud=C3=A9 wrote:
> > On SME2 systems, Linux sets SMCR_EL1.EZT0 in cpu_enable_sme2()
> > to allow user space to access ZT0.
> >
> > linux-user already initializes SMCR_EL1.LEN and FA64 to match the
> > kernel's setup, but leaves EZT0 clear (see commit 3aad4bc8beb9
> > "target/arm: Add zt0_excp_el to DisasContext"). Set EZT0 when SME2
> > is present to keep the emulated EL1 state consistent with Linux.
> >
> > This has no functional effect because CONFIG_USER_ONLY omits the
> > ZT0 trap checks.
> >
> > Reported-by: Samyuktha K<samyu@qti.qualcomm.com>
> > Suggested-by: Sritam Paltasingh<spaltasi@qti.qualcomm.com>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9<philmd@oss.qualcomm.com>
> > ---
> >   target/arm/cpu.c | 4 ++++
> >   1 file changed, 4 insertions(+)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>



Applied to target-arm.next, thanks.

-- PMM

