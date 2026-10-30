Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F3E606A31A
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 11:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KCZ0J1iE
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMkXq-0007bq-7V; Fri, 30 Oct 2026 07:13:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMkXn-0007b0-QA
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 07:13:11 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMkXl-00020l-OH
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 07:13:11 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-8b09e07e149so4552297b3.1
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 04:13:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793358788; cv=none;
 d=google.com; s=arc-20260327;
 b=Q71BJ7pfWk9m+tXPL9f7ohV8DIzQh29QiH+vQFbc4kX/+cUQ2i/Ved1jkWmcrvrNuK
 zs8ZF2hrCwuPVtfKtbHUbgFPwSAyB+F4WFQ71oBMcq3B7WA60Re+TNBLbpJR7MoIBtj4
 CZa3QTWfQ+nEcme3Wy5Wzn+aqnpdftjrXxwO4fV7Y8jFFwS4nLabPnfimU9ZGQOO0SON
 O5HeJPoZXY0pMRDGHqPqsjkT1OAxd2HGnC5I2HLOH1FLWo2jcYNso+VgMUc1MhjvudxV
 OU0l6nNwLPzRHSip5pILyv5ycNovegIa9SMfCGIpWd/gAkUxdXFKWe6o8ebADTbWkvhD
 nUbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5LUWZT5k5KvOS94ligsCtD+U9+DDcG+IL6eyG0y0saE=;
 fh=u1/EE8pHwLRlkdRk2jrdRdDlN5JGWXfI3zYWdDZXmbU=;
 b=KF1KuL57KiRWWLXsgexk3USRsJJ2UpCx25fSSHSRmNI0MPe+fJjPXq0ODcUGPb+Ps7
 G5gflQmHueyJrs+bYAVygO59VWVPFi60AtCcnZ0VBsSAwT7JTU9fOixUVKODA19L9vvF
 J2oVLAXyPhsbZKUN6G+q3mM/6E+K8NkF3DhAoHcWXNqYkupx5qeE5gnNDj7eQa5v+4uI
 9zfkASGYX9FkYgQzvVFILUrsHjpg3PHhJ5uEyeDL6OXUBze2Accn0+JcJ2PxYDKk+jfW
 KwPPU1pP7Suk0GLDKnRlSfGiHsRMTeDssdITMvzoDU2XuiHHazG7TvtqM3WFTEwqTNJr
 ukFA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793358788; x=1793963588; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=5LUWZT5k5KvOS94ligsCtD+U9+DDcG+IL6eyG0y0saE=;
 b=KCZ0J1iEBmI8J5U6EdjfsvTCeKYjYKMqbztHR6fmahYWSDbfk7V/m+UXiO5TDW3cjB
 v/j6f3cKu2fJ9PypEpP2mzaraqvQe7HDKabCHoJv57/bl+1J0gysIid+bzK5RgKPjAoG
 LQivShEZB77UQGiEuJfYTl4RpYocmqcaoTKtqeNexC5JW+MLG+86LEGUQ47gtHcu10QM
 PBViE69S+DQMAaj6SItPJ2oJrjSSexYCiNnS57QXp6Q59KvepYo6G5k9s4g1yevcxdVs
 wFfoU01+RRuFoXO3SPxCBsnt4BelVxHk8FzFaBROM7WRIcf0BjPqWYifyaSZd8SIHPwK
 ouLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793358788; x=1793963588;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5LUWZT5k5KvOS94ligsCtD+U9+DDcG+IL6eyG0y0saE=;
 b=nacY3dXZWN93pXLzK0O/ZFyrfjfLnR77DHjHP+4+QpqVBNsZp2fDb5Ez6TmxiN4am7
 EaZDvVokeyB8cdaCSivzkGm/+yipkZ8d3sbMCYfVr0AB8znVjQdENY4iMvJbnGpneGQm
 aPlPUgtCzyu8vTzVe3yL2pYkRqjiEkDkSatd1f5uKLOVWPwIIIzt8IYzv0k6EltPko82
 wpIrk1pe6GcgHblwsu+2oOtbk/1c86rylnyBoujvBm5uo7dOwsQ7prXWMXI1o3v3KqXB
 ICchr9JDWDsEuR2g/+nc5BzFp6Tou3ilHKPgpm4/vTiex6XY/RB3W2H5RrN2lycWJSYN
 P7Jw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwMJ80vExVpLF0xpM0Jc3bUAmg1rrg+hoAQDBWLvpLQ5LhCjE5FNxh/xK5mecAgjTEyAEYuQtntRA==@nongnu.org
X-Gm-Message-State: AFq9FYLp8QuPc9+o+d/PQeOWaF/VE+Zxw4F8hg8m0d4Kml7mYRlu9+rT
 Yg70KNwXlF08kmoTkwFCR8Pioz2PErbCTsHODjceXR1SzCeso93L7IIKsntxD8Li1ktSOLciuvc
 rN4Z4OGFTCTYj1d+j8pnqkdX+zUwP+XxFq7gDqG+d+w==
X-Gm-Gg: AYBFou3tJYehcQexeJfUvCPPomOdLqSu8HRLmNZZV3Zi3Ub1YRZbHw/mAberS7beImt
 rsbcr4fcIxmGf9mI7cY8KVeiu3280nNVylrxB5J6FWL0wb9sKszx9D4f7RQ86h4G0wiCLwhEXbe
 afxS0Isl3MTOasXggRbjp2aEvo7zWhlkl07oGhuAcs6HEh2D4oye5brUEoRa1TNrPdHWjWQ1y97
 9prNIukQijzfJNhS1Zts4eJV5Zgdm3GDQYeIkdu9pIHycqLPdLc3gLVBfb+2iiXumcdKw0baKhA
 4Kyy8kEHbRlns9edS2sHYVNkZ8ue2/NvfYitRYlfdggmNUd7ZvvQ3vQjado9Ko5ueZg+lhfxZY6
 eXBPKVgI9Cua/PXx7E84/uumJJlCqPHGeE3DxIUgTYUHKQohWNx2WZRwxhHa3N1GaCYgoTsepDk
 9htD7ptLLRTS/rKpKLBMhMNw==
X-Received: by 2002:a05:690c:e1d9:10b0:8b0:f0cc:db0e with SMTP id
 00721157ae682-8b2b676ba6fmr7498147b3.78.1793358788267; Fri, 30 Oct 2026
 04:13:08 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-10-berrange@redhat.com>
In-Reply-To: <20260911143627.2743803-10-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Oct 2026 11:12:55 +0000
X-Gm-Features: AclHuK8tWRtaAMh4OSG81o0Myk5Bd8TN4g8UgRz9NIr2z73xVEtamgvTgzkRr-c
Message-ID: <CAFEAcA8GwF=EdaqvO7OBNZY1ku8LWNH5giveZYXSVnmk9JWfng@mail.gmail.com>
Subject: Re: [PATCH 09/28] hw/net: mark e1000, e1000e, IGB, rtl8139 & sPAPR
 VLAN as secure
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 11 Sept 2026 at 15:42, Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> Historically most NICs are only interesting for non-virtualization
> use cases and have not been written with malicious guests in mind.
>
> As a general rule either virtio-net or xen-net should be used in
> all virtualized guests requiring a security boundary.
>
> There are a handful of exceptions resulting from historical usage
> in the x86 world, to support virtualized guests lacking virtio
> support.
>
> Thus the rtl8139, e1000, e1000e & IGB NICs are declared to provide
> a security boundary.

You've said in several bugs (e.g.
https://gitlab.com/qemu-project/qemu/-/work_items/3872 )
that igb wasn't covered by the virtualization use case.

I don't care either way, but I wanted to check since I've been
marking igb bugs as non-confidential when triaging on the
basis of that...

thanks
-- PMM

