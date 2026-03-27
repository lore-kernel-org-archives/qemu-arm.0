Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077B910AB830
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 14:21:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w682J-0006PJ-CY; Fri, 27 Mar 2026 10:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w682I-0006NK-CX
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 10:19:42 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w682F-0007XP-VJ
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 10:19:42 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-64eee7b83cfso1819336d50.3
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 07:19:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774621179; cv=none;
 d=google.com; s=arc-20240605;
 b=E+QltUGhksqBROPNO4XiGrG/uye3pZpq9RhHBkNBt+dofxZRkUnAKC4/jbKa+fPZoX
 gCTOkBmsChxtAEMUzz8wjt9I6KhGpOr2NGl3Cd13vCXoc8XaOIDiXK9hBZhYynu/wXZS
 UK/587BW4eNmii0peLEG662nUCf7B4lqpWJUJg17ehgrXLhMIPMf3YSkNulSNNbRkDyG
 TyKGd0WkzRURTHDSUt9kPI1QCUOCKaTWVSJBgvrzlCVNo/vo7cOAMfk+y/eILxVTTDZc
 mo9gMOWZ1oznvdGfeUWG2d9klMAc1qBS1fehHY8x39k7OJxl6ZE/LQAHo7z8GGaSoHzO
 J8BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=o0yl5gBevi6k9h6Sa7NsSquy5hajoaTetiMQVol8jXc=;
 fh=zdNarl30ZXQZyksjefsH8WosDWwe9hR8ro9HRXnmEHc=;
 b=RqNmkyWNtqRcBnyDlzecEjII89XerGAfbflD9wHTuKD/xZayUfME4He4R24aR0fxQ4
 l7gnBzR2zJ+uVVhlQ9GCzmp8Ef1OdI5oE1inkpfJnorLgIwcZTvRtH1BCbowOHuEpMck
 iDITIqmIkDcqm6rzo+sFD/FcitByPXl422QuI8dVhFWSLX2+47H3nKxU4ecJwkN1fhVs
 xeBdgY9hJqcD95AIrgxhRXhlce4R77TIU4KPfP88CCRc+/PgFeoM1wi8K+v9wit6lqnX
 ydgLVHTRYK1G/1juAwCUiTlM4jufG8ACvgAnMMocMMvEv++oWyRXz8VLE7O6Sg3NxcZF
 x+qQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774621179; x=1775225979; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o0yl5gBevi6k9h6Sa7NsSquy5hajoaTetiMQVol8jXc=;
 b=VpwC0uw8ccsZOBXAIxvdIluRMfu+0DWREvGZjJF/l78LTCAfTruVmCXE+mcJZ0JB05
 I5l7fmOKgnWZHUxApC7OmumEpYGk4GpuBSkJ1kPPpCb/mlulQEO9IcMapl9fq+nDHSRb
 aoAICPAFWVZSPQtW1lts5NGO6U2g8etRlO4KkXTx/LePL5t0AHGQLfEEFt9TirmXiyXU
 wphHl2aY1cRFTZlC8BNUt7ooUsU/4YsPN0eiKq0fFR+MOA0+FF2m3tHzxyYDe4c8sbGC
 2GHMIsFeBL5SLH9jurIzIsI9Ri4Wc4q83HZHBUCU0H7RTw/hq2rdjE6/3c4M1PawS13X
 W1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774621179; x=1775225979;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o0yl5gBevi6k9h6Sa7NsSquy5hajoaTetiMQVol8jXc=;
 b=K6Sv+6ShWwo+mCLrgHw3ouu15T1RUewSmW8agauxI+PGVcgtG1aXdap3S33RP1Gimz
 +BbJBeV+8ZS1vW29KJzx2Qcwm61ovF41wfEhJKxv93HbJFaTO7zQ44jWt9TlzpmzDQxI
 tb2c9n6T6Ied6MDtsO9qUTGjoHtQL2T7pkVCGZpky+CqMjYrbZBfkp86Qp8IYuYWqiQd
 2249rZHv70xL9CXDrOHQJSpg9Kl/r86b35XbznC4vds6IHCjQayaIw/oDuHxhkmd36MZ
 /6vvzvW+u4wB2qWxNJdBYQASi3O+sZ8jHkarMDULNQ+DxddoaUV2+xixqD4856hGglWL
 LbvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBwCW2xStBZJn6ILAx3wszJ80LG6YBlChA4URfJR6h+9yXKXWeGxNLOzizov/hS070XiQSQUShxA==@nongnu.org
X-Gm-Message-State: AOJu0YwMg/tQJadxKfJGcX6gTHRtZq/d+TPvi53+HiJTib2Vt80x9HPK
 Fr5jubtXSLf7I+qRPTJHHyxgKDeL6rs+xYfM6efuPJ7XXdUxr7uJHn3d0/PSrlLC9ek/yva/LFU
 8MaZ0QippNgKyqLH8aeLvFh+VLrs7EX+iZSpqpP02XA==
X-Gm-Gg: ATEYQzwrPgMDYBTOldMLKYUdnkwRunfxSa3AxB6QkFv1RjZTcKdzt5dlv3lyZppOW8l
 4v3klnifrBGhWJQVBrhoq9FEnMHZ/0Zvmd0OQNj+2Bala8LsAccz0fLIpeRTy8tXnOkX5kpXF1J
 EMUxcJnJSkltftEPmnWC1zAwMYahppxOGltauTyQI1ZHzoVXsszkBKh3y9uiPGO19iYLxf7mhiR
 z+pDwY0cbAZYDbgtmue1hquon2HPyXePRSn2Jy01ByoeFGSN/Kxi038Sb4vPhrGszybQOubZpsa
 ABAciMaEUnyQAH/PztQkkonQrYHkAw6A78JCQIuqo4ozTFJXp3p0/YaFol0FGpWVQOs=
X-Received: by 2002:a05:690e:4801:b0:64c:ec53:4dc2 with SMTP id
 956f58d0204a3-64ff71f7ddfmr2032330d50.18.1774621178891; Fri, 27 Mar 2026
 07:19:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260327134401.270186-1-kkostiuk@redhat.com>
 <20260327134401.270186-13-kkostiuk@redhat.com>
In-Reply-To: <20260327134401.270186-13-kkostiuk@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Mar 2026 14:19:27 +0000
X-Gm-Features: AQROBzD-AGG4_FuWYl8Jf7kw8AaMpvSWoCSg9QpVLJsnXjr7qEvYKJTIbdMJZ1U
Message-ID: <CAFEAcA-+d1pcSRBnLV75AFUFkadfxXsN5156bh8hjW_Re8vD9g@mail.gmail.com>
Subject: Re: [PATCH v2 12/15] util: Remove unused dirent.h
To: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, kvm@vger.kernel.org, qemu-riscv@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Nicholas Piggin <npiggin@gmail.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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

On Fri, 27 Mar 2026 at 13:45, Kostiantyn Kostiuk <kkostiuk@redhat.com> wrote:
>
> This one is OK to drop, because the rewrite of path.c in
> commit f3a8bdc1d5b26 removed the uses of the dirent.h functions.
>
> Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

