Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C19C61DC4
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 17:43:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wze7t-0006Uv-1H; Thu, 27 Aug 2026 13:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wze7s-0006Tq-Bo
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 13:42:56 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wze7p-0002rv-Dr
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 13:42:56 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-8588583a7c3so1257697b3.2
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 10:42:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787852572; cv=none;
 d=google.com; s=arc-20260327;
 b=njPZuOR4VIv+eCCXs8rQSIYXeKa02Mkp7H+JKrUZUSK3mPsABHqcErW3WsefOvWp/R
 CoIj+vD2hPNHAjLc2HBf6RABYodP3M4fkI2/JKjoHXlpZr3MyDqVx4QV2y9Fg90k4A7e
 rWrxd3sRIzg0oB8G7tElnCb4rbk/URAPrdOwfEjeyLwnrCuYBMQtneyJNOw/9mqAEP8o
 ybLi6EVgU7Ri8MkW8xukYbudPxhZZrZRfK6Dx++tdlpGKz6eF3jVTAWaONF5BuyxyMMr
 uu6XgTnA5J3BuyMheP2+xLNLFlfyN+ZMiC6zso0fxGB6IqsSQYXQlDzJPITA5JcsCmat
 HIMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=mHfCUFStXRQs4Vxp/BYAOOICbf0Ocg/AAwvAD3GsPxg=;
 fh=pWSPSg5ziHsFal1XbGf1PGo5Hd/3x3ME9noW5UPbQtA=;
 b=DzhU54UpVJsGutTJy33B7iCkxm+A6l3n848cqaurp3Dv0bI3oEkPEwFee/bq6mXcvN
 JzvFJISheJ1+sl2QBstggsR4SqOKPjhCS0DhY+3wnvD14Fp95Vd+zqjEu8o5axKseP/W
 E9FHreqJq3iYXZPGeATMMgEVN31wheBL+J8Rkr9B+GPrA3i1jXbyemFJoyu5HqlLpONm
 iz0D14rgzJrXiRLU/lQfTouX6hiyYMxnSGj9Rgqle3JJO7dmJNcfwBio1XgCJlhy19fM
 gbSojF5v5nLxWMm33CwrS6Kg2ueEVgMd8ix57y7khCMLdVlTQDgHA5/MLgxNwWLxdgaR
 CpnA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787852572; x=1788457372; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=mHfCUFStXRQs4Vxp/BYAOOICbf0Ocg/AAwvAD3GsPxg=;
 b=itz+9WjFZKtkaER7vkidlHRZw2QXtUl/GcB1vunzswuqQL6VzL2zC8+Xrz98P51xmY
 dLaNnMzpVduHvZbu6z/XutfBRZ6KHSIJ3m1zxYGBIJo01tKmjiOTD3r9glZQPRCYsmxh
 kq29yQ2xjPFMPUGjZnMKEcxc57WpFvkyFeU1FC0i/G/4FFLNW8ihcG2QHDHJNKXNvjEp
 yRQqV02UsEAioY15YjHyAHRfSrl8H+KJAaG9Y6bv0o7n3jJYGx38DUvv/oDefQqymR3Q
 QG4QXG84N6+ev50vmQ1MY9SSGrXeWvEjeLO8P0V8xn/hGMjAMZhL8AZ1guXPIY7/YBYp
 i60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787852572; x=1788457372;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=mHfCUFStXRQs4Vxp/BYAOOICbf0Ocg/AAwvAD3GsPxg=;
 b=rwOZ7yvyr8DW/Vu6/xiOFeklaGT7c+2gUSbwwbu7fcDSaXiMonwanY+gVNMDkJyej1
 5x5q1z8pvat7qtJayR7Fvl0cHM+vI+NgPVh2iAx2AxVKuKKJKx0wlW2MtP+af8/BcbBm
 VhwNPd5ThnVmDrWp3uo4hh2b37pj9cVuqt9YJYrGEWAUzDL93eNvvB/66RoF23+rnNkF
 rrDVGOc7vsWHG0lkQkqwZyTU7g613UZd0+rMa312glpzjA2mDA4Za3Zlm2MVLE2f6aF3
 Bmwg29/uD9tiBOTG3+xLadmNGVRg8bnqpzCeZpNAjYBrPW8l3jKhkWzEW60QpHxjTHuA
 yJvg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp2goNikMR6rrMKlVJTDgnxHImpXbeLJ7V0QqpuvWbfR8U6955324sojcwnUS+9FiRoBT1sa1Z0Uw==@nongnu.org
X-Gm-Message-State: AFuF++kD1Cfj90kg+SM3GMbTYH8JZLc+iZhU7ri3Rwn8Cz9ka1AS7/Ls
 VxyIoFO4fkgDW8h4vbmqHOJL3A99b15z5af0sbHk/2FphXCDkCKvItyakNd9/Vq9s9sv/M4kl+i
 OjGNRJOvwNGtjJHawKuVMThxmucAtW94wYVWA3RFwTA==
X-Gm-Gg: AR+sD107tstgKr0nLRZWkDeG0hewE7FqyazMOHNgZr9gMhz7Fp35qSeAZKN0Uz7+DMS
 BW/czxsLLrx4XlTPvlBpT1fbgN1hcpfa3487FPi67IkwpbpVudmWUv7YvXFflcq2BvT1gKOeCOC
 o3XhjKjgxWKNTgEkDiPwbsyL3BzuJ7troSzQgRr7mZ64wemtrGxMELh8yQU2+DGkJoCdavypwst
 e7Ryw4V8wZKHeSdZ/8NMD8O4BdXo2hIsHwnlaL5IVxbHZ1IpH7cmvvHef1CDSM+/cwVViGkANSr
 25vkTjEG52dIlYFpKYGN43R4Jv++Q83YEFbrp8s6jNmnK5A231xYArzdxcjlxyOyk8VssQkLk+k
 ZhugDCMk70+ygl0ap72/x9r1/h05qTT5a8fT9IN4=
X-Received: by 2002:a05:690c:f15:b0:857:ba53:5f7 with SMTP id
 00721157ae682-85d69f00dfamr5665747b3.14.1787852571904; Thu, 27 Aug 2026
 10:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260823150731.896-1-luoyonggang@gmail.com>
 <ao7c-FiawF9sMCGj@redhat.com>
 <b2b1d77e-c3e3-4aad-87d2-f5d4834abd1a@oss.qualcomm.com>
 <apAG8JQTnQxRkfip@redhat.com>
 <9e36f8a0-5363-4ce2-accf-62ccf3602344@oss.qualcomm.com>
In-Reply-To: <9e36f8a0-5363-4ce2-accf-62ccf3602344@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2026 18:42:40 +0100
X-Gm-Features: AcwNN1XjP2okfaqDrZv7av6Q836_ff-1z6FvUw2VnaDSVYtGGUC4HG1j_CVuyjI
Message-ID: <CAFEAcA9cmsMG9w32zLAuYNA37J7T6t=gK_4w_pZUVr-FXZna1A@mail.gmail.com>
Subject: Re: [PATCH 00/12] single-binary: link ARM and RISC-V into qemu-system
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org, 
 Xianglai Li <lixianglai@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Chinmay Rath <rathc@linux.ibm.com>, Sunil V L <sunilvl@ventanamicro.com>,
 qemu-riscv@nongnu.org, 
 Alexander Bulekov <alxndr@bu.edu>, Zhao Liu <zhao1.liu@intel.com>,
 Eric Farman <farman@linux.ibm.com>, 
 Laurent Vivier <lvivier@redhat.com>, Chao Liu <chao.liu@processmission.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Song Gao <17746591750@163.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>, 
 Glenn Miles <milesg@linux.ibm.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-s390x@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 David Hildenbrand <david@kernel.org>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aleksandar Rikalo <arikalo@gmail.com>, 
 Nicholas Piggin <npiggin@gmail.com>, Cornelia Huck <cohuck@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, 
 Fabiano Rosas <farosas@suse.de>, Aurelien Jarno <aurelien@aurel32.net>, 
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <anisinha@redhat.com>, 
 Bibo Mao <maobibo@loongson.cn>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Matthew Rosato <mjrosato@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>, 
 Darren Kenny <darren.kenny@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Thu, 27 Aug 2026 at 17:32, Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> On 8/27/2026 2:44 AM, Daniel P. Berrang=C3=A9 wrote:
> > On Wed, Aug 26, 2026 at 11:35:11AM -0700, Pierrick Bouvier wrote:
> >> Seems like the Genius.Artist. in the bottle just need to escape, and y=
ou
> >> can send us a nice series doing all this. Meanwhile, I'll try to find =
a
> >> carpet, a monkey, a princess and a suit to be the next Aladdin.
> >
> > This kind of comment is not productive and disrepectful to the time
> > reviewers in invest in looking at the proposed patches. Please stop
> > this.
> >
>
> The only person wasting everyone's time here is YOU.
> There is not a single person who came on any thread to say "I agree with
> you Daniel", while several posted or commented they were ok with the
> approach here.
>
> Project is QEMU, not Daniel's EMU.
>
> Whether or not you like my joke above does not matter, just focus on the
> first sentence of it. Send a series implementing your view instead of
> long emails "I said so" on other people series. And go back to the lamp
> until it's ready.

Pierrick: please calm down and take a less confrontational attitude
in your mailing list posts. Daniel is reviewing the code, which is part
of the project's process. He hasn't done anything here that merits
the sniping you've been doing in this thread.

This is entirely separate from any technical issues about what the
best approach here is.

-- PMM

