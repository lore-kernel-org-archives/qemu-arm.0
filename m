Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8B3CA5FEF
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 16:24:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDP08-0008A6-Jh; Sun, 04 Oct 2026 12:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDP02-00084Q-6L
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:23:42 -0400
Received: from mail-yx2-x0c.google.com ([2607:f8b0:4864:41::c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDP00-0001uS-KZ
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:23:41 -0400
Received: by mail-yx2-x0c.google.com with SMTP id
 956f58d0204a3-67568357b63so668574d50.1
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 09:23:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791131019; cv=none;
 d=google.com; s=arc-20260327;
 b=iuTdu7nFLyczkLLTOtY5o4+78qa+Lh8sQt798gjExnrsh3hTFtJFNXXVkEUaFTcJkc
 Lp5v1mkIIkZZepfLkDNLAnzVCyyQ3ZkCnuQVoh7jLNEZZL/brM1sViVmuY/76SSpFANs
 AYmYIY+0VgrYpy1WqppHjxSfCC+/w/nNYcMsm8G+xkG+C5yfjVC9jI9gwjdZAs/J1UFZ
 wjdRTDTgqgOdY4cCuJY/nc1h4ENyU/mQWpCzIK58C51qUytEug3+3g0VcaH6pGrHzNv0
 6H98fIA1yp0JeGifUeiayMhvhPIup+Qj9EVjP4VwwDGZcvYIban3EGAaKIWAMH1M04/e
 /ygA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=QvePUYJSZlCAOhsi+yrewZbslyAkmaf0faPw48P0Lp4=;
 fh=uiMPnU9zKllaLXBug8u/zuKEeARwF/ewmBc2e1NF5a4=;
 b=rBLBlrL0Ls1udSzEZXntusvQcIryXqoLGdcZJs3MQs/PA1+xMen5wIPLf24w+71i4o
 4zqzEBuTgAmswl6n8BcOi4m32HbYLWqZlXuq+3EcOlh1KlPaRSXRkIAN0QxnQVr5Ug8d
 P3Pl7QUBl9TRCtBGGPcdxqhTlj2IKVhZfOsauO99bN2OyvghxSCOCJWePoDzOIIRhCjN
 J6+TMf4JZkl9dgz5D3Qe9gbC74NptLu5Gn7MO9zijITHDkielVta3MS6Q43gFNMZ7/Cx
 XUrHzq/FBW7kXtL21+Lr46B+wo6KgJVk3VoVQLTIqPnfwgRQlSbD00Mu+UV3tUIqC7e9
 Aqyg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791131019; x=1791735819; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=QvePUYJSZlCAOhsi+yrewZbslyAkmaf0faPw48P0Lp4=;
 b=oisCxXISF/30w5xs+DNFUmDyz6/leJ1o7ZuUraycpI+aJCkfPU4fWbThEm+RDIj59V
 abWnsuUNykg09o+xySNiCeen8DkZCEBKYWkk8udVZvcH7az5sYyzbVTBACxAQEiuY2rD
 22MVLJrAslBDOnqPeiv7jTKASS40ZoUMdwdVl1wI6A3v5USH1DzWlTkLrA22lF6oETJE
 d15eLabyJHSjtTLjVm9X5xgN0hqIHBrhwffj4iu6Lhrdcd2KtS0EYGKWS5xvvt1DZe3O
 Lfd8SzzSVhdR2h2MHmPCueb75IPJQKLidxyLzgt5FMbH1fQCFVYDLrPTAZcXACorhVxx
 0N9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791131019; x=1791735819;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QvePUYJSZlCAOhsi+yrewZbslyAkmaf0faPw48P0Lp4=;
 b=TaCCVPFBiRJGb1um/Kr37bGu1iRyfTjSSuiFOLLCVwuMotQe9ElQfg3XxD8JMeUBO5
 VhEQZjEs5IpWUMIK4fTF2hae3xqUZVSUrYplCiKEIz+butAqL/p7fw7CT075Fe+qS938
 qQTsqEXfIn7kh7yy5kibohFRiFuu3Uc04Jsp6TDIlkNHLhElv2hbgqk1zWiDqJymp7J8
 Y4Y5Sga3xPsfDKkoPwt+x2Hgx2cnf2ig5dy03e4q07PZsvaWQ+hnePANzj3LNTudJjk4
 mS/EEe3wUP5PxobacYmw8MvKlPyrsbrOAf60dReFnnDAmE5QcCSGwUmVhVF87IbI5eYu
 8Z9A==
X-Forwarded-Encrypted: i=1;
 AKwUvBxHHXhwWpdkepaJ8JRKHT/QXJeaUEhry1if2jusshYo7JsQhT4kd4S3a1SiWRxPjavErK3gYqcxvg==@nongnu.org
X-Gm-Message-State: AFq9FYI6ViRGCq1iB9OPdu+EbUS36o2FpUwOK6ZSkEVf/hyKdiZKVs0S
 tgapLSWPnxEH/eTP+pVqZWphjL4TKLkZHYTLueickEQ5RWf+zKYKEZO7c5WdOFpLEdvf3SxAFJs
 lA9grdhTA38b8PLufo3XmwIWDzxmuPms=
X-Gm-Gg: AYBFou2u9vq8l0nYgbfiP3HpeVYXeN/gQ/ljOy5XXcRPIvmmze08ggfOBbLEfVQcAqt
 Tv7evqckcD8Writ/b8kDo8obHhXVZtI/LGJH367de6gB/5kAkpICArIr2R9RR36Pra2cHjHk08I
 QMVZ+0RYoc1y3wWATZPUtsfCtE1TMr9a9PrKJuLP1SOIWDmB2E/FE2055cDbBL7hq55jDjHPzYG
 Qm+rDWNA/vEYR00kB9CNQeqltPLakcGBiwnyRynOJf9q3r+Rzr7HT5l6EvJf6cdSFJbHNgu9ahK
 25+8NAQxaVO5zbe7qKZs/RQWWMcjFyBpc1a9uNldbMOd7d8qWr7JKI/bWt3U1XnI8MKo/EOZLRC
 pszOP/mKVaUlGevMKTkqmD2aYNw==
X-Received: by 2002:a05:690e:d86:b0:677:b844:c5a0 with SMTP id
 956f58d0204a3-677b844f9ebmr2163632d50.81.1791131019635; Sun, 04 Oct 2026
 09:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20261004122647.3913-1-shentey@gmail.com>
 <20261004122647.3913-26-shentey@gmail.com>
In-Reply-To: <20261004122647.3913-26-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Oct 2026 00:23:26 +0800
X-Gm-Features: AclHuK8C4hYubfVbBYgXsXvN-zZGVXVmc775n-j4eVzSS6vCuLRIo5OxJTiJneM
Message-ID: <CAEUhbmU3+FLnssJrET6bg533JXqg2wo40oxEtL-XL4C02aQeag@mail.gmail.com>
Subject: Re: [PATCH v2 25/30] Kconfig: Extract config IMX_EPIT from config IMX
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
Received-SPF: pass client-ip=2607:f8b0:4864:41::c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx2-x0c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sun, Oct 4, 2026 at 8:32=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> Over time, QEMU has grown a number of i.MX boards and the monolithic
> config IMX drags in unneeded dependencies into each SoC model. Extract
> config IMX_EPIT to eventually eliminate config IMX.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/arm/Kconfig       | 4 ++++
>  hw/misc/Kconfig      | 2 --
>  hw/timer/Kconfig     | 5 +++++
>  hw/timer/meson.build | 2 +-
>  4 files changed, 10 insertions(+), 3 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

