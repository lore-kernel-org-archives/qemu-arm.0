Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3D7C43458
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 13:02:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whoOK-0002aZ-DN; Thu, 09 Jul 2026 09:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1whoNi-00026W-4L
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 09:01:41 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1whoNg-0000L5-Ii
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 09:01:33 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-667627ae83aso2438135d50.0
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 06:01:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783602090; cv=none;
 d=google.com; s=arc-20260327;
 b=SuHN5iGUQQ5ZO+DsqaQYWF2EhSGtbSbRMdxywa/1P84r0iADagJWjT0MVKVCXxGAG+
 pMrxKjEwbDWERjq1g5cJn7UyXnj3NvNEIOLAMSaqgTNtH3aHGsJBGfFQy93wq4hygZvK
 IxzGWWivCP3KdELcvk0wa7xaUfREtbtmFMAmDfDEMjrkRiyApCFUBAUnPvVYgjo1doWl
 EY+k8f0HdYoNKjlNAtufxaLmNcU+AWW4n7iN/18iR1aEFdcJdNlKdBE28w0FDqjIrWdc
 WxyNCs/lca5dIqXD2NYzkCAm22xT02uKeFS3P8ICG3i6bK3KUIgJ55iBp3kL1GCX9RK8
 KW4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=gOxFxPb0fXxfrOTgFJ55wT0DB+UjySCOyk8PXNaDbcw=;
 fh=CdgY2PYPMq0lg/LIw3t8+bqwSu3BpjreZoZUQLr+Hs8=;
 b=mKaC70aIYfkJ6qN+rz3SQfELfckkMVSLdvd6eXdWDkFmUqi1PPyS1HAQ0alrgyXxvv
 f1IpGmg4qynndq1eMbySvHDhokmyIV9hTWVyrl9MXUdOGJnwHgLzB9LR7jxnATTiJfAd
 90hTSgpvR77exhAUDxqdqp9a8gQil4a123fp0/rSwyzjB+JPurYWPdV7LJ/bMZNgQlrj
 AKuzfsgJUb+QGTnnpLoPN3VsKy1o4RVm9ofuJ+g89OmvmiNS0ggfHDaqwSOwWyixN+5p
 3IyWCEhrEVjplCxhUWC8SHaH7YV8Fl9gBgLWF7o2CbMpKE5iFBRPqvv/iiocJNoyb3Rq
 43/Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783602090; x=1784206890; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=gOxFxPb0fXxfrOTgFJ55wT0DB+UjySCOyk8PXNaDbcw=;
 b=ubR4gcJVtEOhI6JmN0lAB1+IMWo3Bgtyz5pl/t08C/I1hH8lwgtObmURtfeSuATr+G
 hFcA19BREmXM7d4idqFbkkVi1VIM5ovvo1CTpMkrc269AP9VNjQH4a6UDownp145BReD
 wqHmmFPbciY6HFBxH+1hrq5od69cljPICfJQ4KQ1ZDSM1cLQCW9IpRqoSWhyCj/9bEOT
 UA9tFP81CK3n/LZwMZCJMKSnULglFT7hpvUGwkv0qRd3HriZ05bRxnNPWJ0AuxYxgqds
 rWc7E+a9NzY68fXRAr6+k5f2L2NPxmR8IKBoqTnRc2O3bXm8sJPOfUmSlINbC5/iF6qZ
 RUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783602090; x=1784206890;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=gOxFxPb0fXxfrOTgFJ55wT0DB+UjySCOyk8PXNaDbcw=;
 b=kYtxkRM+GEB7IgpwXmHaNSj4KZS3x4ktip9mRctrPZ4y9oM+hjDfSYIAHDFt2dtd24
 xCIdV0FW2Ml+qWobwq3znJ8cR+IjLPfaOlZTWoleLeDoERn8+F1CVE5/UPs58Mxh1l6D
 WqaZpnB1Oop/qXodn/AQErQVTt6J5K+rXQ+dZvDlsQdXFxNBSrVmpVnRwy7zGH+u6uS1
 I3RlvHQ9WQjfL+zKboPQpvkn197t/BK8seXXxczbHx9+5VI8m3tS4d86vJyyQBBIJXOG
 GjXXN8qNAubvSSwPN6dfOJFcM9JyQQ/VdaqzqfNobMt9bS9RH4Zq2/V66+6leK+eCRW/
 7Y6A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr2wG2KKENrTpA1UGL6jXFv3T1Kir/DgaV8f0kzJHwQ6mY9i1b1Fc4vgF+5eBkomG12uWn7CWVA8g==@nongnu.org
X-Gm-Message-State: AOJu0YzxXTv+NSeFrXeuVB4pCTE6JuQErXhPPkHxxpeWcHqynF85qwyu
 WGjO4l2MrJiit2+X/INowzYp3QSm1ie3ZuaFUKWDivzesJUH1bRzG3ehtjuj60t43h0ddWBQ5Wf
 qImBBdNzGbg3xaItFLkodbICQwwnzzph0ObrzeAK5uA==
X-Gm-Gg: AfdE7ckzDFG0bejHEVclg7/WNIYVl3arOlGAiUtEH2KtpZI/kkEal9sBPG4vYxHcMl7
 N8QrDh5v2E66vAXZsIiC6eRVr8EzlaqVz6GowCqJG2T9aMB/kynTiQQIifbyGa95O12prucnALw
 CIPayAk9muN5Ys2K5EWvyIJS9YhIiPT97gAcDIdvQ+4kScqNYZ364+GAvE8GRSbUZJXpSHyN7o0
 8JrIaK3XDW6GIfjdEMDYh12APofuUoB8KfG7Zb9HbloGmANs+o9iwfvlDall91rTNUoBOfON7ZQ
 pBe8hU6l94aN2t0KASn2skD5MdhRklQInLNaixELS8GLR2DivjygMP/I
X-Received: by 2002:a53:acc5:0:10b0:667:69c:123f with SMTP id
 956f58d0204a3-6679f1cc478mr4131147d50.79.1783602090048; Thu, 09 Jul 2026
 06:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <87o6gge6b0.fsf@pond.sub.org>
In-Reply-To: <87o6gge6b0.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jul 2026 14:01:19 +0100
X-Gm-Features: AVVi8Cf7N4WCMoBs4AQXOtejW8Wa1_pSR1PM7ntg91TEXe548sunjdMksZ4l28w
Message-ID: <CAFEAcA9goRQuxw3VD7AqUOHHTdOXu8MSfCxdQMBviE3QgGD58w@mail.gmail.com>
Subject: Re: A few Machines crash when "no default audio driver available"
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
 qemu-arm@nongnu.org, 
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-ppc@nongnu.org, 
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Thu, 9 Jul 2026 at 12:44, Markus Armbruster <armbru@redhat.com> wrote:
>
> I stumbled over ARM machine musicpal, PPC machines pegasos1, pegasos2,
> and MIPS machine fuloong2e crashes.
>
> I run them like this:
>
> $ qemu-system-aarch64 -M musicpal -nodefaults -S -display none -monitor stdio

> Died when device_set_realized() tried to propagate a "no default audio
> driver available" error to &error_abort.

Is this something we want to have be a possibility the devices
have to cope with? Can we have the "ignores all audio data"
backend be always available instead?

Otherwise every audio device needs to cope with "there is no
audio backend available" and implement "do nothing with the
audio data" itself.

thanks
-- PMM

