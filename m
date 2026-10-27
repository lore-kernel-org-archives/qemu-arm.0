Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0039C606A31A
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Oct 2026 15:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yUYhb+9p
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLips-0003fc-FD; Tue, 27 Oct 2026 11:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xLipV-0003dj-O9
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 11:11:15 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xLipS-00011Z-Fk
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 11:11:11 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c2e8c710847so519939366b.0
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 08:11:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793113867; cv=none;
 d=google.com; s=arc-20260327;
 b=aMW0Au19KCJX7Y44nN3AtiJtjTuGswOn0M0zIa/ZzRpwpomGNe4P53Z0H4xnw9dVU5
 q0e/vQGu0D3TnLfz+jbkoLA0bb6487ef89j79E0+3WRa8oHSjk7ZWvvQxIt2M+ixiT68
 FEl6tVjQWUNK/rr0N66QGPquCfSApyVYbnk7wfjyMGQ/YGCJJCgNTRcm9fgw2L65/OA4
 o56Z/1A4+pbwS16JszIIp7LAFLBVRBHOZeCLJm7E4DfrtKP3ZiIqV5oidsEDc4xEwHwG
 /Oijef44ETHEWmIfXOpbBpevTcWU8wBBdvOB6b4RRHrWKLx/xGrnzPPWL09KrBSiOtyg
 FZ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=fds9GDMUn83ZlV72S6fMtPsNs76zFy5TRTrEwZS5ZfY=;
 fh=kE2hm6+CyeyxxZbdGFid4BxKMw+0h9WkBOGqcPkLI1o=;
 b=CDKCzc3sUhuCu67BpMggwM9EB98WwYwvL2Lu2Hq8NTrDeKma73qKxFrEvJ3iGoEbfQ
 vQI4wbD7VOsufNuqYNtoBvLJv51mq0/2GJbr4Ao383vIUdFj2gZXlteecmbOUEHCfL0N
 ioKti/WnVI6OBiWNIrBVZOhtO0G8xvTGpoyEil/hhNW2Ogcq9wOBDdjsR4ovy9ZKVd7y
 lJ183qwP2VgFND5we2FLvjdq6pgunSDbPiF+TzBfUX/ANMYjfaGx+zIxLuKRnhtMVUaY
 UXUQCrvrhsCKJc8kAsR5+WkuIf3C0jdFKqEOa/S3Z8doBFGqda4WDi14g9+MRJzyGxnG
 NUqA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793113867; x=1793718667; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=fds9GDMUn83ZlV72S6fMtPsNs76zFy5TRTrEwZS5ZfY=;
 b=yUYhb+9piHrqNQIOq/U2EYKYM5XGTan9WfPsGbDeHva5uexRBcD6BhTuZiJay7OkE1
 Ap7sxGEPhfUa2Lgf7iZge9M5w7sKgDtzTwo6DkSjVv24fJFa8QFph1Zi4RXxhF0cKgcf
 C3DPCTcJ+DGJfnS5M0ltaErD2+4zWzTovnqdr7Cb9vdCUbKYZgwRy8/YdbyREZHVbCky
 gbjNiplI6apDHMJ+9S/r3zSpG7OunWANtpqbj6755awkSshJyKNFCoaQl29eFVZ2nhnZ
 m0dIFVwtJbYqhTF2YslzWGmQTho7nPjHJ6hm1+50qMNhlFEPm32Gygf+hmDgEsbaiEKf
 T2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793113867; x=1793718667;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=fds9GDMUn83ZlV72S6fMtPsNs76zFy5TRTrEwZS5ZfY=;
 b=HOE7U7Alh1jo7OlIEqmcB0Bf8LmUXZ0fGRZah8S3Tio7pTeEXGV94+sYV3jaRWYNWV
 D1yfN/VHqNGgj1h6LwYYtWRzIJs2ymgAW0giAwzYoWd7g2kUY9KuFpxb8uFpdzTLwK5z
 mv18/TSFJLcSMNOREp3bxKBUYPB+i4xuyd9Q9GZGEJAQJMpNzEOKki5WDDaEpD7ArcSr
 tvdRVf2O0e15lxSOyllIv8EUtzjKZWBIBYQPwSoC/WebSSC1OOrQrwG78AVciGL9rGmf
 ACVxF5hS1+FmikF/sKjENGNPJkkWK1F6gXWrD7Qa82+IeaFuNGxiPGpkOFFX0A/Bhmax
 /nbg==
X-Forwarded-Encrypted: i=1;
 AKwUvByf32B/ze7RgL6A4dWORKm7qklLYwv+I7rIfZ624uYzltFojdS2K/6cV5a96QQL2FN4m/wj/CLGJQ==@nongnu.org
X-Gm-Message-State: AFq9FYLPrNsIy1n3cyUxZSLjRF8ToEMzBCT5ZDc92TD1qS69CLNWGNMN
 QIKkGmX5jqncMOuI4xXmm1GLCT9nWTK2h7k2eCUJQisMSX81ZjUGK1X9aXpJCOVDqnajqn9+0IZ
 eyav1v8F3byxrTe3u+FOSbp4sN+QSorL11AQLJkn5CQ==
X-Gm-Gg: AYBFou3RzvGnOOz75qN9nwEGG7ewgppH4ht4DI1AGSsmZDaEen/dDeQPO9yidnBHDuE
 Kpq3aFCeDdqXqdwp/UcXPlKO8fVc68mb1zjtkDGWlclcqNNU1OjDGCd/lTbmxG5BRyfL7Grp3uv
 ensytkofnpVo4jDSLveKGB8HcfNk6/W7fRHJxwCaVReXVLIO9uS2zKahb4hqBtaVFbeIOMrvzBz
 uASEtG/Vdvgmw3KWVc6t556KdMEsvZdH0C/QQg2h6fUqC0AGhnRXCIqoQkm7TFcHBdyXL8O6bkw
 Dk6m1TXMK6xCfAm4NJrwrD8owvxf/I9S5CGdews+CWanwQiuxNs3VgMJ6enUfOoXXhtNOevL9uU
 /XjsPF/vHEUon3FMhpSQqBB8yz1feXZtWltAGnuXv184wSyMmiScWvZvwvHoPoZprdbZkD5n4rw
 dcXyBXwsUyTYIrCTiv2o3v
X-Received: by 2002:a17:907:3fa5:b0:c29:5340:182e with SMTP id
 a640c23a62f3a-c46bdac64a2mr1116029866b.2.1793113867264; Tue, 27 Oct 2026
 08:11:07 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261006083445.30362-1-shentey@gmail.com>
 <2FD6FED6-EBED-47A4-9096-D4FDF2F17406@gmail.com>
 <735a348c-3eb4-4a9c-bc41-6d347d4330ec@oss.qualcomm.com>
In-Reply-To: <735a348c-3eb4-4a9c-bc41-6d347d4330ec@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Oct 2026 15:10:52 +0000
X-Gm-Features: AclHuK8vjiayc19tHooowV3NSNSc6rrFF8pq0wvXg--_cBIczOb-_GJydei8Q7U
Message-ID: <CAFEAcA-J8qFpD4yVwoH2tYaUUa1RyhY_Bdj=EppK908czPk1tA@mail.gmail.com>
Subject: Re: [PATCH v4 00/31] i.MX fixes and cleanup
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, qemu-arm@nongnu.org, 
 Jason Wang <jasowangio@gmail.com>, Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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

On Tue, 27 Oct 2026 at 14:21, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 27/10/26 12:22, Bernhard Beschow wrote:
> >
> >
> > Am 6. Oktober 2026 08:34:12 UTC schrieb Bernhard Beschow <shentey@gmail=
.com>:
> >> This series fixes various issues in i.MX device emulation, cleans up i=
.MX
> >>
> >> Kconfig handling, and improves some code. Functional console tests for=
 the
> >>
> >> remaining i.MX boards are added where images are publicly available, e=
xcept for
> >>
> >> imx6ul which is taken care of in a different series [1]. Fixes which a=
ppear safe
> >>
> >> for backporting are cc'd to qemu-stable.
>
>
> > Ping
> >
> > All patches reviewed. One may need improved commit message. Am I suppos=
ed to resubmit the series or will this be done inline?
>
> I'll take care of it, thanks for the ping ;)
>
> Peter: I'm queuing this series (simpler for both of us I think).

Thanks, that's great.

-- PMM

