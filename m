Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442EFCD8CB9
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 16:12:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXLX8-0007WH-IS; Wed, 10 Jun 2026 12:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wXLX3-0007PR-R4
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 12:11:58 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wXLX1-00059A-6U
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 12:11:57 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-bebac79fff8so748067766b.0
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 09:11:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781107913; cv=none;
 d=google.com; s=arc-20240605;
 b=bcdmFFaqHM1AkWHeSnezfnqVP3g0Ywbin/KJu8KeKh93LXUSlEylFcdLHrz3LPK8Ma
 TrHb6Doeeatwpe2GjE7Y0/L4Tu/bvx1z7ait4K2QMg9sBJ2OLphDTqi31PY4Wth+FJ29
 t6OAdoGjSqp2/+4K6pLXRF/tGvKDPo9f0t0aj2bO+V2834PhSObOorslohMDJgz5CcYk
 sAE4LOLjKeR0pjl9dd/8i4fUrpUAgw+WWeAcpTRoAjQaLvgq13/rbB96UvNOxMacWWwf
 SLImXI1bED/bQnmMezH6cvP9+Ag2/i7T0y3MWpl4Ec4yU85AHj/In+Zl64gLSUsO0G2Q
 mdBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ZZ8zjx9zZtk18xXgGEBK9YE+Y2wE7QAaghjDUbU5LFg=;
 fh=8AJfBZK1FFyl708rUcwLWQvSo45LbAYVaMFoPA02sWM=;
 b=jz7mZ/y0inC0V7Kax3UEKIO8fFNo8BLXUuKsyxICNaJ6iupm9KeGEXNptItDw3WED6
 wm7WzobxwhX2gKsrq+OC0HFepxswZVuPytPcDj7T2DFYKVKRxYPXbYnSBfgwfRf+GaJ9
 gdn6Mna6ZuSO+r11Enb6RW7+gcvBouXOYFoxfvHuYxjHp/17mvGTyBZLDOQ3hA3q5b3+
 F4kpn0Mm0F005rgaqcRB5EVkn448bHZgLbrDHHu41oR6UO2AUbnY+bCzt/rXgClwjQTV
 gnfBz17MdPVMEMfdd2V5gQ3H438icrz5Yk6rsqvOWV2tiDrXJtViR8r4CY+UrbPBVUg9
 IeAg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781107913; x=1781712713; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZZ8zjx9zZtk18xXgGEBK9YE+Y2wE7QAaghjDUbU5LFg=;
 b=xRdkxV3WTgT0nQ3BGChxF1a7ee6Ytt7QHCmK3AYzAYW5BemD8fCBoHF2qOHeb6hswz
 Ystl9pdSjPe5QZipytgKdz9kjqCz4lr2ANrj7Hx//yb3Cp0sNb42HxEoItlFVUoarNti
 tHo5TKLzRadnaPmzarth3jmIHEL+QWyXv+ZUaIdl8snwPAbj96mZm7yWUtSX9xXyds2R
 kE0IbL0izuG8t/D89dL+MIlpydFB4m4uIrIkxfXza1cC27SjGn+uxnacG5s9/bGZC56F
 rmV+ZOd3/7lwTGcU22/BFR3Eutpln2QwujRStENF5V97lRVtMTrCV8FMmvvdGvaolKQi
 vLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781107913; x=1781712713;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZZ8zjx9zZtk18xXgGEBK9YE+Y2wE7QAaghjDUbU5LFg=;
 b=RJfHlcv4FwAjC0rBbZwYew5N81DjRvvgjchpaaY5bneH6RHK+g/SJrWuCrtxtkO0aC
 NyA+NAKOVIdp3K3nlfD7eZ62N4E4qkiYqvjRFk8odCap3jxi3av/7A/OLK2+WTrOhs1i
 N0jCpiRnwn9pm03SmV18OxI8X3HuX39N4eOV5w+Q9iYl7ndv9S9Cu2IYg0Q/6peVoJKx
 OSjsmb7VGB4FVHMsBSVSH3QG2X4KnBBpG0trLPu9KLtnWCxbxXojFdJDH7nENWbGVLJ8
 +/nwlPafmu4BLyRAcbAuu8gX0Qe93wNtD4hSDedgs93HaJz7dlMD6O0iGNbQ6f19GfoP
 Owdw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Ywh94ENhub7HXoLxasmakDuZAGWvWP+VXFTSZcSV05FWabeM3VQJpGQBiuO1Nf2ILv65VAh3ooA==@nongnu.org
X-Gm-Message-State: AOJu0Ywx4gc5/uLiZ3O01pMk4uQeVlCWLDXoXz1y9AAZROafvtjWEOF3
 BMzPqUuGUP9M6Re665TWDLyd0SDXb70ZG1YIiBz/1gorTTOHG1CevpHB/YPHTt0qHbrDVeLuPh7
 UwHpOl6r6O9TZ4eoNB3FRzutcWf8fCTfmhtNIZ08wWw==
X-Gm-Gg: Acq92OHwjcsk1wG/D2QxmBBSpRD5I6xvXdvEISKKszSS11Uef9CMku4qdoffBfGQwO7
 NNkHxJyOWMUuQ93HTIVEPFxgMNqU1BMkFFFfhQU95FEZU5ZnzfIYKBRVAcBfhpsWjy7glD4Jfnv
 SPbKmqsHUHVvyMUuM9zwoosYcgQAZR8lpPpu7Y1xO7Xxqa+cpReYavqkFJrx3dFAmZ0Tg+Xx9jt
 ZzU1sU39uEhev9GxeclbRHpaGa7vUCCLFnMLsGqEijqqJhG5SDu1aqkeiJ/UYVeZFCp1u9gRz/u
 tjAxJGD8lHE/WJnt6aE80q7aXOYSdNLkGg+g+6yxLoBddrqPBAeMBueHSXfFKv9c613C65faF0P
 2Ug==
X-Received: by 2002:a17:907:1c2a:b0:bed:38b8:9b55 with SMTP id
 a640c23a62f3a-bf370e62acfmr1341147466b.4.1781107913368; Wed, 10 Jun 2026
 09:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <aiaDgG26a6TUrKuM@redhat.com>
 <07ca74b4-52a8-4187-a57c-7c3277e574d3@redhat.com>
 <aiky9d9IwACIyKEC@phrdina-thinkpadt14gen4.rmtcz.csb>
 <674d5e21-88fa-4a10-a83c-eb6f7ce7032f@redhat.com>
 <20260610080947-mutt-send-email-mst@kernel.org>
 <eb0f0da1-11dd-4437-94fd-a65af55851e1@redhat.com>
 <20260610082637-mutt-send-email-mst@kernel.org>
 <5d8cbd4b-3725-437e-88a3-e0af32164815@redhat.com>
 <e7cc9f2d-ccb4-442f-a1ed-7c5474395099@redhat.com>
 <20260610095712-mutt-send-email-mst@kernel.org>
 <aimEl9QQ_LTRPLtd@x1.local>
In-Reply-To: <aimEl9QQ_LTRPLtd@x1.local>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Jun 2026 17:11:40 +0100
X-Gm-Features: AVVi8CeCs8w8cPJXBR9CpDH2uXDXW3VSGKThd8cy8WMP5mejkCvbFeeiPi4GKu4
Message-ID: <CAFEAcA8HhC-=KwdbNE5jgqdP+H1VF1aJXdGaME8KsaDHhnBG9Q@mail.gmail.com>
Subject: Re: [PATCH RFCv1] virtio: Inherit max bounce buffer size from bus
 parent if possible
To: Peter Xu <peterx@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Pavel Hrdina <phrdina@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, jugraham@redhat.com, 
 shan.gavin@gmail.com, Alex Williamson <alex@shazbot.org>, 
 David Hildenbrand <david@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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

On Wed, 10 Jun 2026 at 16:37, Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Jun 10, 2026 at 10:06:24AM -0400, Michael S. Tsirkin wrote:
> > This is the change that broke it I think?
> >
> >
> > commit 4a2e242bbb306ef5c16ce9e7bb2da3bd8a4eb098
> > Author: Alex Williamson <alex@shazbot.org>
> > Date:   Mon Oct 31 09:53:03 2016 -0600
> >
> >     memory: Don't use memcpy for ram_device regions
> >
> >
> > Maybe Alex has an opinion on what to do.
>
> I can offer one idea here..
>
> IIUC the major issue was vector ops but the mr ops might be too heavy, then
> another way to fix it is in memory API instead of using memcpy()/memmove(),
> we always use a helper (say, memmove_no_vector()) to do the split and
> properly aligned IOs as what ram_device_mem_ops does right now, this should
> only applies to ram_device.

If the underlying memory needs to be accessed only with specific
alignment/size, as the 4a2e242bbb30 commit message suggests, then
we cannot expose it via address_space_map(), so we must have
a bounce-buffer. The address_space_map() function says
"here's a host pointer to  memory, do what you like to it", and
the caller is entitled to memcpy to/from it or otherwise
access it with any C operations, which are not guaranteed to
respect any kind of alignment or similar restrictions.

My guess from commit 4a2e242bbb30 is that that applied an
overly broad "don't do direct access" hammer to all
vfio assigned devices, and that there needs to be some
concept of "this vfio assigned device's region is OK for
direct access" vs "this other one is not", such that if
this GH100 card's BAR guarantees it can be treated entirely
as RAM then we can have memory_region_supports_direct_access()
return true for it.

thanks
-- PMM

