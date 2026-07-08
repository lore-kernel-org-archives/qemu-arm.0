Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B8DC43458
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Jul 2026 15:50:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whUX4-0006NM-Dr; Wed, 08 Jul 2026 11:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1whUX1-0006Ez-LF
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 11:49:51 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1whUX0-00042F-85
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 11:49:51 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-47de008b020so468834f8f.1
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2026 08:49:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783525788; cv=none;
 d=google.com; s=arc-20260327;
 b=WvVlIRRvgXZjVwYxLArYkVUR3Hcynd0Mf0scHfACWIAlyplrtSX+0Ex3O8tjYqS3Ad
 J9QBy/FTvooEVFY2AFk11ltRZ6gefxEGDP/WXnWrTWooxA4cXYJ13L09Iy82ixnkVTQe
 cnzRJD/elYRqru+B4VbmOwuK5NFel8pK3WjDZlAyiS0cikbouLLQhwxU6StdcGiBUVle
 FiWKLmEBX3UxESJiochPux1SiiAmtRp+PDyc4fmDPWoXh9SYxgqkjNTwRKddMGzbMfVs
 JggAeOtJxxIoaXmabZmtZXHs7VBevnjVgWBQGEH/GrMOFCTgrnn+m+2O6ud4+lNrR56P
 C97Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Ks8sfeW0rVHmaUy0zC9BH8wSnlOUhz/l8SRZs+PMBzg=;
 fh=SOqkrjrfhBSe0nMzZ6OodpdVmPFVbdOYj6hvZqAa+nU=;
 b=L2Ok/Bzcc6FRYTjdBOUKWJyWHBcc5eYA5uMdNC1TP6S3yCgc4D98qaGFmuPicBsyxH
 UkRl7vPFgC+XUGKtrQlmkptYJvUb+IqThEJ8f34LzaahdpqlfAgHD2an++dfniCaHwox
 o2d6K/JfAMwKnJLJF3AvRg88bzkEOBn9AQ749VYmEioQreWEtUfWqAw+wS9LHi3qpp/b
 Frs1JbdI3gw5FQumrJgM6jZxOBIm3fQadJ8CnDIKc+fslSz9vmOTnP5KmiB7S0VVDsOl
 AIH6BdxYowjaR2p/nes0ikoZzGFfDgfI4M0Rhbd6ZEN3ORzr30RKPORLJN1Zu1ef4Cr0
 rKQA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783525788; x=1784130588; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Ks8sfeW0rVHmaUy0zC9BH8wSnlOUhz/l8SRZs+PMBzg=;
 b=GZH4iN9ERyJpXNs72wlLY1AC2ZZEezoIDgffO7trGF5kcotXyfom3XZs91Y2GP7Yq9
 +o8+W3lj0qIStHNKaBwA8xkWDvk0EDhA3UKEg0Fawx3Cam+fy10qBEoNMkqJdWc1TcpF
 rq+77KeuLZKLqdt49ZqbpnA6t2lcDtMywJPosVn2SZmJ87sF0KuuVl4qTWjc1DL37q4H
 EiGtd8QAKlM0svJWEf26DY+6/FcSqV/1/uplhCTcrVkfhtSY6BUbay9GugQtGalWVTWf
 9eakbdC8Hcq9Ck0Zo4VcqQpWR846Q6nKnXv7/p9Pb6y+hqqMe9SMnbuF1ZAyzt1Tme65
 f1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783525788; x=1784130588;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Ks8sfeW0rVHmaUy0zC9BH8wSnlOUhz/l8SRZs+PMBzg=;
 b=YXEvqwEG4p1l3pdfs9rf3TkxreWkYGd8kzMmDf97dRwzL5UOCKw2q3tSEPVfZZbmmk
 VxJJxZcjjOQxO3AsSFNPp+VDmv5+2iNLeqyJA+vMcpuhh7GxTjwLgJmX5hHStBiC5euG
 ugUOotYJkEF+MDHO2TtoRLpVdkbUQfhC68DyL8e8g1AD1fSTsMAGr+EIV0LGGauTZNaH
 B8K2M9L550QT3xbN91cv6zQf2hCralNcbWlz/l4y2KUBAHONoQya0UiMeoXfLSxw75ih
 Cd6sIIU9oIGbY1GPGNWhHC0CWs0BHfFg0kMcc2E12sodVEfi6wV8Slnv1BistpFvpH+3
 kRrQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rok1Wk/Xa2mHbAWdGBpuJVll8zOSGaw1ZlKDJOh6jNmBsYVfUAuD+bl/BkQFNSyktnHvdOHFCSidw==@nongnu.org
X-Gm-Message-State: AOJu0YzYiuFiKuJrRYwmcYqr+oM2E5yy8WHaLGVrZvrTU6T39EYqb3tE
 OpKB9bvJLYoLkaDEVSXhaQuSvOJ5qXjLQ7b4Ov7ru0KWk6fKsFY987nv1iCmH4Kjq90WdMvlHg6
 YZ1xRH2ZZB7ylMlKJe5KgynxJIGTM7D0=
X-Gm-Gg: AfdE7clj34Z9kVg5Uq03/hjad7ZqH2Wpo8IUnnS5WDqcXWchWnvZ5r+4ikZKe5AzxSy
 G4QUuoQqqYkgodxadsAzOXwITSS5fgz5FmFSiyLfVo4+Pn+r4QW7z0UpVz+vnWK/ImXqHeSM+qQ
 C6q8q4/8dRR3QCvCoxqzfCZ1Byq0GQOYyxA497+hewBaezDPjoo0vVHx6kozMINBv/NbjzRk7Tr
 WtNY1ZF/czxQJp7KcD3Y0GGj2rIz6JrrwwgKG/4bWoA22F8s/vJE4Pv0v2k2AQwVvmCLc0AI4vU
X-Received: by 2002:a05:6000:4025:b0:473:536b:5d1a with SMTP id
 ffacd0b85a97d-47df024a097mr4042991f8f.7.1783525788390; Wed, 08 Jul 2026
 08:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260627063208.33642-1-bin.meng@processmission.com>
In-Reply-To: <20260627063208.33642-1-bin.meng@processmission.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 8 Jul 2026 23:49:34 +0800
X-Gm-Features: AVVi8CdjG9rpeAMePP8uBpfBtTr70yAs1RvwTQpZqFAjRHEjrCDhVowJ-plYYo4
Message-ID: <CAEUhbmV_BfLT9_F9OPH8VvwCZ_8Th+swHu833E0sjYCkj-k_=w@mail.gmail.com>
Subject: Re: [PATCH] docs/system/arm: Update Nuvoton OpenBMC image guidance
To: Bin Meng <bin.meng@processmission.com>
Cc: qemu-devel@nongnu.org, Hao Wu <wuhaotsh@google.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Sat, Jun 27, 2026 at 8:12=E2=80=AFPM Bin Meng <bin.meng@processmission.c=
om> wrote:
>
> Describe the current OpenBMC target naming and release status for
> Nuvoton machines. The latest 2.18.0 release no longer includes GSJ,
> so point users at older 2.14.0 sources and explain how to find
> Jenkins MTD artifacts.
>
> Signed-off-by: Bin Meng <bin.meng@processmission.com>
>
> ---
>
>  docs/system/arm/nuvoton.rst | 54 +++++++++++++++++++++++++++++++++----
>  1 file changed, 49 insertions(+), 5 deletions(-)
>

Ping?

