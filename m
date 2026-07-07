Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A566C43458
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 14:19:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wh6e4-0005T9-Rn; Tue, 07 Jul 2026 10:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wh6e3-0005ST-AD
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 10:19:31 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wh6e1-0005je-Ep
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 10:19:31 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-c125bce2294so473379866b.3
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 07:19:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783433968; cv=none;
 d=google.com; s=arc-20260327;
 b=eZt05Iv4Z+VuGZ8gqykGqXfmHDDNPKu1joYH8MtMeBnyxP0VI/2+tzcWoG043tjGII
 IH6Afao+Ccoh3G6yb6vAvzBOdsnkuEji/zzdWkz7/642L2VMfIvMIrGC0YwU27j2QPJ4
 eg1GHIJCyrcQkkn/7xuzxqfvVZH+N7cYbfSj+AScsRfU0L6KEU0OyYtsrTruoat3axpC
 pAabciWjSRUlQwi7ANgWsdbV+nlQD7CTTm0eP2Z6JhM1EakziMyT1vGuLhn0iXlNqIS2
 ajf2CznbGqRR3tAUqoMHU8VO0JXKadWGjgswDnHF1xVnYDShGudU+E2ummj9jQBIs/oT
 J+NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=1Buv0oKvcb7fYhWzCmM2FlZsOK0hbcWx3zkwyyKMA7M=;
 fh=vNi2CTTZO2QVDdeFXQ2W3yltjJFUWP3n8PmGxjFn/EY=;
 b=O/zfKRS/HPPbV0lrLW2kH74GzvS+Nx4HqBy06d6HLX5CvJCZryLU/svmqawK0uvCaA
 iqdTXedhzWevDyvaCF1lclMWyQ4O8VHmoF1Zn9I9mC7A4LUE6JV7wxezOFD5Av3bD7ow
 JepEgIZh+HxdtgTMiGVhTzF2sQV1AgdWmdbCOCyMamIy11atItiUwRyvYqIT9cjTdbg7
 RHhl86yPgRgmRwqExD24KGrpewNKa2hg1mBcv+r8SM5Lhn4kz8Q1qgw0TjmJvJF+pZox
 0Omp2xLuhvXGWm5birkBAZzgTgu0oVshuM2EkhOWmuHz+9xy0wNc2AVAQju/33V5gDqh
 x08Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783433968; x=1784038768; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=1Buv0oKvcb7fYhWzCmM2FlZsOK0hbcWx3zkwyyKMA7M=;
 b=F/nvkW71y4j8nfpNC0r5WcohHXAh2eq9Dk2UfiWd95U3VokK+MnPhgFfDdAD3taHKX
 P+AeyjCxyXSO97mM1MDUUWGEbKy0Kn9YlTNweohZgSmSyRkhx8S2INpXUaogJ3yiqQNe
 fx6TNs06XTw7UiqMd+hJyJUpSDnyUCdCg9GCbSPiJPw9ZZn7/KjXOTTeSexlZaVeM47K
 oTC2aiam/g6osA28iOxXjJVICkbXNgQu7otmLRU+XBB08V/XDpEVwFiLW89tty+vhLM/
 QG8dG5IB6iS/E23nEGIJ/0Ee7EEhLvxy8a0aiYRiNB82bUB/uBcoI/0E4MLi99iIZcOQ
 ropw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783433968; x=1784038768;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=1Buv0oKvcb7fYhWzCmM2FlZsOK0hbcWx3zkwyyKMA7M=;
 b=BwZsaUlHDpDXinJI6pOF8dw4T/G4d0NgvyV7HAg3UaEDbUnIDxt20NdEl/DL80HTnI
 J75egttsRho5tazCl3rH2vjFmV5Btyof9ANee9FAPgN/j0EgmAgG/2Zzp23OEv8SbkeT
 82hqkPjuZtWUpTCOo8ensIa2mjWyuju+XIIhf2Jdf8SgRa2MxGSjo2V63crKAbKTAw9o
 5EXBHtRzAASKeo+EhF44B6T8T4JSf8MVvY7Trc8Z2Ve74W5bo8K4BxtprTJ8Hfc/16ah
 XkPjK2SyDpHekUlaQxYIWpZoK/feK9bG1s2qKaQMKUYPOagwoLxggm5Sv+p6tFX4KUS+
 i9hg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqrbCT0Mm3hrxKL5RFXLpYyEybbRDg2WYa3KhqS2i5qqXM6tLLdwVH4ubanLWvMbA4cU8Znk/A+0A==@nongnu.org
X-Gm-Message-State: AOJu0YwB23y7y6Dv4iIJY+L0k4979OXM9G1ZRGZP0O+MZ5urAMfB73+r
 WZRi0qkZ5OckgpXuXFQlopxDjbWFBqaW2uaBsYBOWextZ1Gj2NwY6hH0Hsn2YiexPqfvUlt73WN
 mz2myXVa0kLTxBLLA0fh0jGacgeLSXK0P6VSDR5IuFw==
X-Gm-Gg: AfdE7cm83wXvU4uyvp1NJ9jLYtvBstiFwJ10HKPqDrbP3u8tvjqqDiNIp9LGh+P/SM9
 HKYJdrNe7UE20idOCOhg0Q3QxxteYHhub23gDYDWQsz/zPJAla32n7K2hfZP+pBVNaAJjmq+MVY
 4JFpRbD465Q2Jw8Arn0FBGuYyQ+GZKPqT1Th4KijMGJfyYmINgpF1JJVGmobtOTkJtxzKKx/LE6
 HhDJkbheJD2zNVziQ2tWrCFj882iRMD/TD5dp34TeKPsvMBfOnIHDUYIzUCO9BU5eg6bR9ZIF5c
 dLyvxMU4PYfAwqp92r3HKj46gB03VonmbtehS2Wp3GxLg41MSwlyUPFm
X-Received: by 2002:a17:907:787:b0:c15:8fb4:e600 with SMTP id
 a640c23a62f3a-c15a66f68f5mr327995266b.20.1783433967763; Tue, 07 Jul 2026
 07:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260703135512.3213964-1-mark.caveayland@nutanix.com>
 <20260703135512.3213964-2-mark.caveayland@nutanix.com>
 <akzrbOKbBwZAKK8D@redhat.com>
 <40fcfa42-ff8a-49a7-bc69-6a3c2ae03e38@nutanix.com>
In-Reply-To: <40fcfa42-ff8a-49a7-bc69-6a3c2ae03e38@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jul 2026 15:19:14 +0100
X-Gm-Features: AVVi8CeE7MRu0L39dpl-NoAczGJPxBQzD95FWQN32i1K0SU5anSXw4AEAsLGB4A
Message-ID: <CAFEAcA_kvoyrUUUL=1b6xd6=aO-XKvkhmMyrmd33d0OwSGHkQQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] qom/object.c: rename
 object_class_property_uint*_ptr()
 to object_class_static_property_uint*_ptr()
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com, philmd@mailo.com, 
 aurelien@aurel32.net, pbonzini@redhat.com, richard.henderson@linaro.org, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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

On Tue, 7 Jul 2026 at 14:08, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> On 07/07/2026 13:05, Daniel P. Berrang=C3=A9 wrote:
>
> > On Fri, Jul 03, 2026 at 02:53:03PM +0100, Mark Cave-Ayland wrote:
> > I wonder why "line_size" isn't merely a field in the machine class ?
> > External code ought to be able to fetch the current machine and read
> > a line_size struct field, surely ?
>
> It certainly looks odd from here: one of things I wanted to discuss on
> the call was how to approach the conversion.
>
> My current thinking is that the aim should be simply to convert
> everything as-is, and avoid attempting any refactorings or converting to
> a device class prop via device_class_set_props() if possible.

Oh yeah, I was going to ask how device_class_set_props() fits in here.
That is a much nicer API for the cases where it fits. I would like
any QOM-level API for setting up class properties to be as easy
and convenient to use as that is for the basic "there is a property
and it just sets a field in the object structure" common case.
(Obviously the more oddball stuff will need finer control.)

-- PMM

