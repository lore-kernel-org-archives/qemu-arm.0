Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9D6CA5FEF
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 16:25:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDP1v-0001Wf-BU; Sun, 04 Oct 2026 12:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDP1u-0001W3-A4
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:25:38 -0400
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDP1s-00029H-Jz
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:25:38 -0400
Received: by mail-yx2-x11.google.com with SMTP id
 956f58d0204a3-671563fb8beso830634d50.3
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 09:25:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791131135; cv=none;
 d=google.com; s=arc-20260327;
 b=mDe8cNwbdzHT7YVKHe3xiDj4muEMzFOzV8mwdRBjbM80cSokYorjrSNjmEVut5Vhxf
 5hF7OMpau4RokwSpNMgx92BPNNpPLk9gvLFsYg/9lM3/QWD1htOC2BFtcdwDHFUtZXwb
 BIVBos9tZWVnyiu9/6HY3u8trtTqQapLgTi9i74lhuw3QU9QPrZNncWTHYmTWVGjYgr+
 PM8Yj1vapu+S503U6Uqou3rDG3X4qNruMH95ePIVLhBgPTY3FdIUd6Y684w2Wz4rhRdK
 NuLaaxoQAQHVWIWROoU1Jrxj8n5qm7m+Eziw6a1/OjbPOP/Wl4vZbO9lL28nnoDzrN9b
 ctiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=RF3eI+l1bMF+Ouj9aZSTkdGOqq0MZmWEvOan5LPgOdc=;
 fh=UdtVbvroOvlcyJi+BVCoGuU5QJ1Y/05gtT59cG0MJC4=;
 b=BrFCapi8sNQb+nmxsFP0gwhzjHwkyWz50rvv/qMZUJdPfIxoI1k4MeLuSaKggcSphk
 77qVsYVwlb25yGfLowUwubjRFns7i3ODUXbM4ZUM2D4Dcqom9gZjVzbFiZ39ipLhA5FP
 QAZYzo0MZNO7VURG28+vniYauOU/kqWJ8yu/mJqoXXtZ3/JC/ehsI24e7kz4WMeRpQYX
 YKix3od6RB/X4iS1jGwCJkwXUqyMDWi0Y1JwrU9/YBkyD0H1MMec6xEFowIhYh/Wr/RK
 wfgrJiuoqWIqD2oUmrFQTRnPx+Sdi8Cj23MBfbAI1zjUq572/wT+ihZCttxIjFVoOE1O
 10mw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791131135; x=1791735935; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=RF3eI+l1bMF+Ouj9aZSTkdGOqq0MZmWEvOan5LPgOdc=;
 b=QcKVfHuxtbUNB8dyazm3yTXOo6by4eNHtzgECvvLny8Pqaise54vEuA4PdwxZzEqmh
 59CYB3xIDm3iansot1k4WygYdkEOswwT+VhZbPWd2yoJx7xgpMabUZgCRv54C9vxnkry
 MJgTLJYkD4z+7nXQkwBGLOLX56XDmxjIxRKpXoF/yI/UfORK6YiRPvDmSxczST225vvD
 2JxCZguIuwXAYBeelQm+BCK0bIN7QzucgQhh4uTRf3U8965mZETKyQGfbSaqPLLJ9o4w
 AoPT8TY5/AF8bgVVEjViYgDybcVDOLrjpr+e6e183zoFdD0dU93KMXKJVgy1r3aE2doi
 V/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791131135; x=1791735935;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=RF3eI+l1bMF+Ouj9aZSTkdGOqq0MZmWEvOan5LPgOdc=;
 b=Bs8K9Ia5dBayODx6F5MA4st+USxOJYOYcCHJffsUg91I99gWnzFGLv8fjtg434RGLH
 AHVFekX+eKSygDxY3hCeDr5ADOuJ4YTeZxgLiq7mlx6w9sCRjYHPqwnblMT6v9zvDR1+
 aPZZikQ1hVuPCS1Sjl04QeVWW8CNfFZ69BWz26rv+5+Evqb8nkYwi/rvaj4QAoU+p4hW
 tnIoeXkSRwtLqimPQa1GDg28SUXqanyh1NStvwvXLnSQiFVUIwgi5JTokeiKKI3P7RSF
 NMautpPw7Kf0QxZaRD2Vs4Js0NuIeCyslueDEzqv9l6kVIUT9fv+zQizvernvHFP+Ql/
 KebQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByOU7Pjl7jUCAHpV5lyAjfQQw8zSplrjJkZSQblMXr9xxKA8P6JGaaGewSPVaJUOokIJmwmwd+z/g==@nongnu.org
X-Gm-Message-State: AFq9FYLq4kJXZmhhLqc9W4mMf39qDcTXf6NOtJkdGFLAnEFryR4ZzO1M
 Rp8XELyLgBIbj79l+COANVPJ7Uddlb4yzxzK1ZPeuGP4jhuJ1g1zZzlnwOqiqzEJWBKhmRE6HxE
 +sTkkQ/Np1JmqZPm6MlE4lagQQpX6v1c=
X-Gm-Gg: AYBFou1w/HV4EL3lrIom1N6kZSQp5bYVvukMNr0pux7p6uVMDBFw083YwuJsYDa/YGt
 Qgme1AQlYczcaz53Ib/Zy+xSFvX2c+mnAAnou+Cm0VVMJsRRirLchP8yn10yJNah0tohDewgL+T
 ZbH3Ijg2FbLFJU0cfwS1gWbQzqnivXvrBBm2wJYwJgUzGhhFzJyKScXrNaerXBdFTyH0KuMmVws
 TimqIuMFiiUEuUWl1Zw0eVBUvpRmvbLfQtsolg7/jme+TVC39aMo39HeGyOHQGx8jeTHAbng01T
 PwIn4m25gPlcFA2y3snUgWlsfXrBBOmCbbESfK/bZSGjPDicPbbBpIlV/I0ScFG94CS3M/TezeW
 rQ2lze1uWfPbQ0l0=
X-Received: by 2002:a05:690e:118a:b0:677:d1d9:1276 with SMTP id
 956f58d0204a3-677d1d91839mr603193d50.89.1791131135466; Sun, 04 Oct 2026
 09:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20261004122647.3913-1-shentey@gmail.com>
 <20261004122647.3913-30-shentey@gmail.com>
In-Reply-To: <20261004122647.3913-30-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Oct 2026 00:25:23 +0800
X-Gm-Features: AclHuK98IEkVfd8VQP0-LcnzO_f0FLJSMyh1k2_fcfBCUBJEg3f-lrU_nx1k9vQ
Message-ID: <CAEUhbmW_9MKRPW9CXMjAJPkkT-APsbL+Wj5tUegfP6vseSoe1g@mail.gmail.com>
Subject: Re: [PATCH v2 29/30] Kconfig: Remove config IMX
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, 
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Jason Wang <jasowangio@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::11;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sun, Oct 4, 2026 at 8:33=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> The previous changes removed all uses of config IMX. Remove the now
> hollow config item.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/arm/Kconfig  | 7 -------
>  hw/misc/Kconfig | 3 ---
>  2 files changed, 10 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

