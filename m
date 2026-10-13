Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E6BCA9ED2
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 11:00:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGaEd-0008Ik-3I; Tue, 13 Oct 2026 06:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGaEb-0008HK-9A
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 06:59:53 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGaEZ-0007HC-Qh
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 06:59:53 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-6768ced47aeso2475789d50.1
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 03:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791889190; cv=none;
 d=google.com; s=arc-20260327;
 b=kEqFklkqepCSc4lszVlxU1KcIoKZyMF8QyLP7tFO0yYAkaL3S+k7ctyb0JQU+2hjIs
 /PtlnuCcdJ+jC657WRphmwmKJVU1GfurBPHOKJkM+m90AvfinTqPR2UW5+uswezjRmT+
 CPITVLHP2t9YNFGjclYgBtdhtVJZIi519crUqaGJViPBVa1gVP5MF6TZPG18Be1F8mS0
 5jkpeUuUrhiOYv5vypN5CuXpemD4FbVU8+toYCUMG88dbi0XByEYB2SQHxh6SfRXvVi1
 Fv/3mFdF7yRyyldRP1VnZtSLx05U1cEj6IzfAJ6KHq5EsxfdII+fWFajco5aPNOujzT1
 Zl2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=qXsrDFTSOZH2nnYCYsJwVarfa/N7mphqo6XUSkBiSKQ=;
 fh=bylHTlXKagR60JR6hlKikcBZkjoax/Kz3v/HLA7SjSY=;
 b=OeGwhTMmf5KXLNYpTX8QNWEjxg808hMyctxF8BmTrHPKUfEasFemsMAR0XFNo2OGBP
 Z1ZF96bHKXLhetTnNSlY0+3rTSC5u4AIKTlNnfzbzCytMtmQCEWmnC6P77AbSZnfn+lg
 GFhLSDhU0zKsCB7r0YvVsHQ9f2G9El0AoTyl4K8FiUi7iZCFTMlbgeo15J05llHlKy4b
 AeNNiRA453bemsd3N6FRDnlnrunuJ7Cj54YJuCWwehxuAGRrorgWX+1Q0UV/l3i+zQkN
 1BUPFdQePpHfWQsdf+W4AWlf+r9hdMU0VFYoP273u1favArOqw0OBMyjKNUDuZQjcVsZ
 q93Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791889190; x=1792493990; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=qXsrDFTSOZH2nnYCYsJwVarfa/N7mphqo6XUSkBiSKQ=;
 b=EucvFAdB0KHiOb++BIuc7lIIJAtipW9B9lflTbCHsUZZEhgnCzUWihnL2KpLbsrU3b
 7zJNO2i+3b6pDzW7IczFfq63SGndNujW/VAB5nCo89laWTx3nKuuRoFr8+7kQ/uibkEV
 trFsfbmfvjR88M/ysGj5pXlOZatEXw1TQEB+/1aigmdqpPX4a1HmbuSZ2uPYZSbkzb1Y
 xy5EiTNFg5+xatdcLXLop4tyry3swrcD9wrReTcPe0tzACDxXfEJE2V9TSy1sj/BWm9W
 8eumVgUKAcZ3SNGTXMZeHGGnqRj8IV0x8tvJaPq9O5ttxcxusTUgtilXH5Lzmp2sxZXb
 1O0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791889190; x=1792493990;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=qXsrDFTSOZH2nnYCYsJwVarfa/N7mphqo6XUSkBiSKQ=;
 b=unxta5crqEQvkBXBofsdQ2gq80BSbJaC6fyb6ioktZAWUazpO91wiPfH8K+VGzJ+tL
 D36r9fT9EkL6xWHvHylJh0/C4/JH+IvPKtFeEBX3QZ0BuR2FN42lFZ7N0sFF3T4uqBtC
 DvFrA4udilmq7PcT75MLrteDT9YzD+g8NDkdjoesA1OTUVp4a3NVGkRFOZVJQBechkh3
 GbDz2LyFwmyqHDn0FXO7XFPnRw1IsZ+dhxK5uvAON3LAcaKlzpDa3vzU1PXxVz7u5JWm
 hnnD8SOTWycCUJzdhbkv5FtLOW82YbRyc5RRqoFo8m92BSvkI45WU38CuJgcSJHaP6el
 OETg==
X-Gm-Message-State: AFq9FYIFn+8pTTKKq9AfsyfJo30tXkjmuTrV/cDvhAritLjK9mMy/nC6
 xlYpaVFNrMPw3FlGRu4U0CGhEk3zldCA3FuOyZDoAvLiDwdT7n3y/xQnIE0iF4RhfK3Pdp4Ib3+
 qUCffq2AB1w65eLddeCx32hv+tyRMLD9+YbGEhKo5rA==
X-Gm-Gg: AYBFou1iggyIQTf+sDG9+a9+d+QbiN56Ad6MInkNfIzTVCHjRskt3MnEM81IawwbN54
 n/Wrpo+fHsS1QzRMFFcDE6QYeRZSQedw+H2Yaoogxg/zg2Nv38vxaCZwZ9JmxaoxRbNLWZ6Nqev
 VYBhobxmTtjG0uI74HFlbVJXKf/YU0BbDWo1Zdkby5Sz8JThhxlOJT97an9sJOlCDqlfmYrDjll
 gz56tedukUPmb7/zbs8LZDCW7uIpkC1OmKju6aPlDhx7vrLBqoTB2KG5mu8/BWEMzZyIaq1hklj
 96n33V3r5Zh5n4DCp/6A+XG46M9sCyNu7kep8HMNb4OZ3YOcJ6LX8fColT9X5pTn8Nk8Jooeqeb
 QXmwJ5D2nMPSN+S3Ss/BgCRZHh7dSgjjlZVjHCDQ=
X-Received: by 2002:a05:690e:1382:b0:674:d78:4bd with SMTP id
 956f58d0204a3-67935edbb67mr4663568d50.5.1791889190242; Tue, 13 Oct 2026
 03:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
 <20261013083933.1024405-69-peter.maydell@linaro.org>
 <a693c8e2-5a15-429c-9427-d8dc68096830@oss.qualcomm.com>
In-Reply-To: <a693c8e2-5a15-429c-9427-d8dc68096830@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2026 11:59:38 +0100
X-Gm-Features: AclHuK_ExD1SGWuwIeu__Vzs2Rl_4PS5eDK_QEyJPcMZPE8ClCJr9l19-7Nhb0g
Message-ID: <CAFEAcA-tPmwaNyPnp6Oq27uvhvv5rVVQFEuBdhvv8mTe+dCV1g@mail.gmail.com>
Subject: Re: [PATCH 68/86] hw/intc/arm_gicv5: Implement gicv5_set_resident()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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

On Tue, 13 Oct 2026 at 11:54, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 13/10/26 10:39, Peter Maydell wrote:
> > When the GICv5 CPU interface wants to make a VPE resident, it calls
> > gicv5_set_resident(). Currently that is a do-nothing placeholder;
> > implement the required behaviour of tracking on the IRS side that
> > the VPE is resident on this CPU, and remembering the information
> > about the doorbell interrupt.
> >
> > For each CPU, we keep a note of the current VPE that is resident (if
> > any), so we have an easy way to get to that information given the CPU
> > index in functions like gicv5_set_priority().  Since the only way to
> > make a VPE invalid is to make the entire VM invalid, we only need to
> > set this info in gicv5_set_resident() and then clear it when a VM
> > becomes invalid or the whole VM table is made invalid.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   hw/intc/arm_gicv5.c         | 115 +++++++++++++++++++++++++++++++++++=
-
> >   hw/intc/trace-events        |   2 +
> >   include/hw/intc/arm_gicv5.h |   5 ++
>
> (please enable scripts/git.orderfile to ease mailing list code review)

Done.

> > @@ -1566,6 +1649,8 @@ static void irs_vmt_baser_write(GICv5 *s, GICv5Do=
main domain, uint64_t value)
> >               return;
> >           }
> >           irs_clean_vm_cache(cs, &s->vmt_config[domain]);
> > +        /* No VPE is now resident on any CPU */
> > +        memset(s->res_vpe, 0, sizeof(VPE) * cs->num_cpus);
>
> res_vpe is declared as:
>
>    VPE **res_vpe;
>
> so IIUC we should use sizeof(*VPE), or the sizeof(*s->res_vpe)
> used below to keep the same style.

Yes. I found and fixed this bug in the reset code path, which is why
that part is different, but didn't notice I still had the same bug here.
We should use the same thing we do below (it makes it more obvious that
the type is correct than using "VPE*", I think).

> >           cs->irs_vmt_baser[domain] =3D FIELD_DP64(cs->irs_vmt_baser[do=
main],
> >                                                  IRS_VMT_BASER, VALID, =
valid);
>
>
> > @@ -2884,6 +2985,11 @@ static void gicv5_reset_hold(Object *obj, ResetT=
ype type)
> >               g_hash_table_remove_all(s->vmt_config[i].vm_cache);
> >           }
> >       }
> > +
> > +    if (s->res_vpe) {
> > +        /* No VPE is now resident on any CPU */
> > +        memset(s->res_vpe, 0, sizeof(*s->res_vpe) * cs->num_cpus);
>
> OK.

thanks
-- PMM

