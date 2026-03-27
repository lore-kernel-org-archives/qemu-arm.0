Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D8710ED674
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 14:20:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w682w-0007FD-7z; Fri, 27 Mar 2026 10:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w682t-00074G-CK
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 10:20:19 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w682r-0007sG-47
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 10:20:19 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-65005a8840dso43779d50.0
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 07:20:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774621216; cv=none;
 d=google.com; s=arc-20240605;
 b=JWisIWHLqru6II/sd5yTiKzXErifD/JuesxnpLSKu/0PRTIsy8FmWoHQC28ZTgN22Q
 jcUO4yNDom2xW9aZEeVW2QJHOlQF4QWMDganHpsPPrXfADOVCbdBwSr0f8MItyNPYhDx
 VUOeAxmMOxkyG+Bu/urcA3Y3lk8rYx0PfhUgDXyhBBm6t9j410b7hyXDcJUxr2pl7rkp
 QH18b/JwAjb4zlDF+YvTeNH61k19fsTqhUaKr6/OQlyWcxi1UOPEQdAXSDQaLpyqDM8a
 yZIL4sdgevEzqB9w9z9q/QhNPQC1WfKTl31e29XX4beUzaBvW262pFTKPPluxho48F20
 WblQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=h4EmkHMn9ibIoN2/Jf+eFFYHaBZUJUVQrG0xettR+is=;
 fh=f3SSYaz7FiyNHQ+hvcd8h3Nx+YfZBUpV3Z+hQj/dWrE=;
 b=asLNKwCND9yKKNl4rwRK66DcfnF20FAnz2rslvf9Vc3dM4BziG9h/w/Ga0S7t114Ve
 8wxClR4qvfDmxiRKrsBDvPc97DRgW8rJwr6QPhID0kyzZM5OBuTFXLRGXkMVbRbgU1g6
 b8h6A6RDYxUpitU0KQ7h+fbmkHqurlCGAF94OJxD8t3G5rnCSjXiwbULO5GEbbua6f7f
 1kJTtuK0sLgQNiJmO6I/g7J0ReaIYLbUxG3dfekJzoqiigce8GIE6j0PUyVGsWVc4A0y
 0a6GLFWAAQhzull5xoCHDtlfqNs+KQy/+y1ZkPYg9VimB4SJwXOu8WEp2oj4S4JpOaXz
 HUow==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774621216; x=1775226016; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=h4EmkHMn9ibIoN2/Jf+eFFYHaBZUJUVQrG0xettR+is=;
 b=xTgfCjTbYihpd1RNACURld87BixgNhJIGo/ot94Xk7xkpGVs2YVvwO4ythP92a07Y3
 CCsVi59aznA2Rk2JN85Qr6eY/eeVEsnstpLGGvcNXL5wDAcToAVJrOK0fHd5hKwHWMpS
 3FsBWhIjBI+5OmvSDN8DBv+eDlxbMhv8DD29ln+RfNDg+C39g47UloVQTTd6pnqnEdvd
 zaFxfEr/l/idInhybxIBJA7k++fvuVLHJ0u4lKhXFwdcJZ2B5eMdLipzmIeRV7fG5OsH
 6QqmOALTcKARQ2JOmvkUGpKdao2o48LoLrDG3bZeu1vrbt/Woe0jYhJRzCodkgRTdvAr
 nGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774621216; x=1775226016;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h4EmkHMn9ibIoN2/Jf+eFFYHaBZUJUVQrG0xettR+is=;
 b=XPQf8kRibe8n1wfljtKqZ6nKeerKD76+LcaO37knbtHomxwp3w6W2JmVii+ro9AeV5
 B/iFU6dlb9XzuWaOPmYYgQFsUE8EOodbJVAcRUMG1Yt8Tv2zvMHDl9GaPSF2Zr0T+F3d
 DNLm/RDU4vrMpPWRPTGKUHxeEw3MmAfJVEBW5nNkuXgQRTh2kPssvCfxZHVrP3Us6pA3
 O+c/Y/625mnRr4gD1w5fKUiVuEElboO/VhsHD0JthQVOmIZscupQfySHcydMYStiJgKq
 MWXhU6YtbcUZzgsDbGoqPzfTIbfkIyrNnVb8kbWPECdyl5xjCmyhFMC7lNJRM2xQMBLs
 XcpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAAQ6VuZHjIvoxO4NxsnahVCNOhQ3MjVUyIUHbu60EN4NWNphMJekcD8n0CkbI5x/D+bFOwLcRiw==@nongnu.org
X-Gm-Message-State: AOJu0YyrtxCS/Gna7mO4kXwdYEHPRQXKTlAu1mbEIWq+POQvFJ3KkzVD
 F7J2GcTuYjCwPw6hTIqx3PIY9AIgR00ya3pLZR5wDeIkp4QcWTp48Ht7CrZr9vMZUfNEqIi0V6u
 lwFwIZEgv1rG1l5ETbtw5BBPV001vy9mV0okK5yVI/g==
X-Gm-Gg: ATEYQzzY2m+X8GTHUDmN5xuER5XvjWbZBrr6w0aBa/hlgjHfY63uFQ8naa+WmbpkzE6
 nZcP/hYmRUjOO3fe2f4cw9umymh9JDGfO48s4gOKTYmRnO9SoJJI5lAFFv6RgT8FQP/YKIhlCzc
 +QPNe5kNhxpRr/QYsqboAkd1BkX0M3s954DNfKfU4GVlCejnfKOijwnKS0ZWfbOtdRc+hkwd2w6
 zwPrbCdMN1JnFNheZv1UVVUbwOY50qrQyZQSwnl1zr+RW5HLKyvRBf/yQxa3EYocIfu79BsX677
 SgowhbfQ8max04b7sqn3qgIU/g2avRN0vVlfr7UpAybtOS9ZihmkBf5GY37sCdC+BTh48+V8qr8
 Ymw==
X-Received: by 2002:a53:d60d:0:b0:64e:f106:60e5 with SMTP id
 956f58d0204a3-64ff73b6081mr1959808d50.52.1774621215306; Fri, 27 Mar 2026
 07:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260327134401.270186-1-kkostiuk@redhat.com>
 <20260327134401.270186-14-kkostiuk@redhat.com>
In-Reply-To: <20260327134401.270186-14-kkostiuk@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Mar 2026 14:20:03 +0000
X-Gm-Features: AQROBzBFRtQAiDsGDqgRuOyZis6C54lKjmWtnXZGQUZFVhOVaki8E6WZtmCjCXU
Message-ID: <CAFEAcA_B7hU2+YXEem-9-avrz64cvz6X=NB+bb8hfdMu9PdgGQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] util: Remove unused sys/param.h
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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
> We dropped the use of PATH_MAX in commit f3a8bdc1d5b26 (which
> basically completely rewrote the path handling).
> Now we don't need any sys/param.h defines.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(If you need to do a v3 for some reason you could merge this
with the previous patch; but it's not worth respinning just
to do that.)

thanks
-- PMM

