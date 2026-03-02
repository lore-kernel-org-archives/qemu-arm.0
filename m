Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8BDE9B342
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 10:30:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vx0Y5-0000Tc-U9; Mon, 02 Mar 2026 05:30:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1vx0Y0-0000S1-73
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 05:30:45 -0500
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1vx0Xy-0000pC-Ii
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 05:30:43 -0500
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-5033b64256dso912511cf.0
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 02:30:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772447441; cv=none;
 d=google.com; s=arc-20240605;
 b=PuAOwipKeLABhURyFp7rVl6tJFBPJmGSFOIe5gcggncdOlzH43v/XvWZyTCKBPggBy
 W8hFCoHkun+Cz61S/ctCw3sK7L9CY6ahkhgJpVWg1BXiOv99ZGlUjxyWJHF21oVjAKh4
 qW0Y/Ocle4FdztTy9PVNXIarD/VVDrSSS60aOi9QxWb6VfjaW5h1vjZk9yobPJANY1oA
 YTKHJEYFhgEYDKstsycD0IKLKSZxuy4CcW/n3/vcS8a9ahPDK/Tudv63cqRmzwtaC1/W
 dibwnhDRQpxwSqT8QWBFFCYMAT3O/4DbRsNS/H7qwqKcH7EdFsS8VJHjC7t31z87rUR1
 tw9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=rfhMUT7KiGMB4MQrlj5m2r1WYWrCliNf5mho226AQmo=;
 fh=VTS6+9ZOG58GXK8f5sHrRIn34cIIPbrXY6JEd0s1kko=;
 b=TzA9v0ZUY7WqgPQfL59QuTIEo8hja/6Lrkw2RWibYt5AbSFnsti59Rn0Z1R6vgRBqG
 GBcBmfZMnJlmrHLhGUIRA5K06zRX0Wa6/7b+9ak+/O1dFy6GVJKHzIAFwyj1IVfilj9g
 pEduqAy72FbE3+fcVQE/8xi3dqv0v390RGaIeMqMmY02Zfr3Ybmin8mJweIdiph7ipK6
 Lsy4HvhZTbExXZH/G/2IdGOLO5JMNzeEOrAa+k0j/ZuOfopsqa2ITd5v9TQTq14OLg0o
 aKij2hARW87OHZkT/ZEnt+bQU7BMHSRdcvpREgwHboqkA4jofUi3/Lh9kUQSO9EGpG/b
 zp0g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772447441; x=1773052241; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rfhMUT7KiGMB4MQrlj5m2r1WYWrCliNf5mho226AQmo=;
 b=CvAHUOOYecBNmG6dcg/5GxhMLkF438HUDr+uZ7kFgl0OtWfXI+p4wW6vR0oJU3/rsp
 4a+PSiAqyb5D/YaygiX8zH6Q5Yc+sHwpaj5/eJ3Zvc9N8/9J14moTO4N2ek8sBrQP6wU
 obmmBWG8IxsLEE8cCznH4bRxbS46ESl00MwXhPhIHx7nO+MW+ncC1RfcEl2Vu3QcXvWj
 AalZg2AUJ5MBdiY640l8/pKu3vxSCTPBqFv1z+cJzpji0smwnwmWouOb4bxlEg+zeGPt
 3R3xMSqzUti/OspCKavGW+2jBRW4x6AIJRna2X9XoFhDUDBuZsrFJWaGNp9UT+en3z2e
 3rtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772447441; x=1773052241;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rfhMUT7KiGMB4MQrlj5m2r1WYWrCliNf5mho226AQmo=;
 b=P+GFcUoorLRvHnDg8YJ12kAre7O+qu7CibdgxbDkQ4IWWGFHp1ses0s9PB1AIeDFhV
 QtJxxcIGKbQ5IvTU8s7vWUL063ghgdAvm1ZPmuI9XbLbrOJ69hJfrkdrz/UkjC6eCLcd
 9TvCGJypTS9DszsiqHTZjXhjtXPekwLSWzWIBM+X7WzZVcnGAW6N+CqJn+y7arQ4LpSx
 ZyLyayghTla3acENt3AcE+panRvZkjNogZAeEj5VTuwjoBszJNv1/r2Dhud58D5BKMmi
 l1mBKg7rYXLLZZgbXCbTgvpOUi32gocJLdMHzhuXVFprls85/g+0zg2fE8IAkfy3jR46
 6Oeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+aeeTGCf3DU2HBRJgbmrOQog2Zy7E9E4QanMiltjgK8acJCQtBwS+T0oyxWi+9zT7Ke7wmQ/Nvw==@nongnu.org
X-Gm-Message-State: AOJu0Yzlqmao32M6JO9ulLD4Y+6mfMJuPA2TXTErKNv91Ijj09eZbkdQ
 b0Z33nYcSki+0CLeciNBYPjqyDIpigEQnJMuudfeuygDYPaBFCseBdRhBRIYk7eSMbJbsRy4SCf
 0fq29+sCjuNQjsrt3dMtrD9jLP2ZOUs09raLyH2x0
X-Gm-Gg: ATEYQzw1CmI0JxykbfnU/DdufCSUtuIMlpMejOJRdepAyjc3PPKHgyC6R7emk0Pb1Pq
 CZAHrjCnjiYag0W+KMxyryJhs9cjGmQKwypr8lIB1/LUzj//0Fdhgri5XyR6gNyJdxwniflSUBi
 MLciKuyxFVQ7WplnYH7z2Zj9yLTupNwkR2B0Xv95kG01U/1IG+h0UH1RmKm9C6HlbLkdgvE8PIR
 9/gHoN0hAMOPzl1/sTcsvUzssNRK4aWgMp4R4ZVTPsaNqlTEMffRj4wFHDs1RFCqzFC0AiJDhbW
 Z0Id2vpzA78CuKjKVct61FQsdmKt/fnizmJ/hi+rTEyLSLS2
X-Received: by 2002:a05:622a:1999:b0:506:1f23:e22c with SMTP id
 d75a77b69052e-5075fcedcc2mr20207881cf.6.1772447440591; Mon, 02 Mar 2026
 02:30:40 -0800 (PST)
MIME-Version: 1.0
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221101640.2993566-1-tangtao1634@phytium.com.cn>
 <aaGuGuevX8HFqx0x@google.com>
 <db70af79-b9ef-4da7-a561-850ad75ccb61@phytium.com.cn>
In-Reply-To: <db70af79-b9ef-4da7-a561-850ad75ccb61@phytium.com.cn>
From: Mostafa Saleh <smostafa@google.com>
Date: Mon, 2 Mar 2026 10:30:29 +0000
X-Gm-Features: AaiRm52hS_F3ZcPsJCdC4nhBinNAxK961Z_ItUqJ1LS5vCwWX17vQD8xPaXdhvg
Message-ID: <CAFgf54rvZQ2q5hbZJyJdix-HxBKJh32VsaG2L36bwxLnrGDffA@mail.gmail.com>
Subject: Re: [RFC v4 13/31] hw/arm/smmu-common: Add sec_sid field to TLB
 entries
To: Tao Tang <tangtao1634@phytium.com.cn>
Cc: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, Chen Baozi <chenbaozi@phytium.com.cn>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Chao Liu <chao.liu.zevorn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=smostafa@google.com; helo=mail-qt1-x834.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Sun, Mar 1, 2026 at 3:08=E2=80=AFPM Tao Tang <tangtao1634@phytium.com.cn=
> wrote:
>
> Hi Mostafa,
>
> On 2026/2/27 PM10:45, Mostafa Saleh wrote:
> > On Sat, Feb 21, 2026 at 06:16:40PM +0800, Tao Tang wrote:
> >> This is a non-functional preparation step that adds storage for
> >> resolved security state in SMMUTLBEntry.
> >>
> > I am not sure about this, when I added stage-2 I re-used the same
> > TLB instance as it might be used for nesting, and we can have
> > end-to-end cached entires.
> > For secure state, I think it=E2=80=99s cleaner to instantiate a new TLB=
, as
> > both states can never mix, and in this case we can re-use the same
> > functions without adding the secure bit in the TLB.
>
>
> Thanks for the suggestion.
>
> I agree that keeping separate TLB instances per security state is
> cleaner and avoids having to carry a sec_sid tag through every cache path=
.
>
> The only downside is a bit more plumbing: we=E2=80=99ll need to make sure=
 the
> translation/PTW paths always pick the right per-bank TLB (otherwise some
> call sites may still default to the NS one). This also means touching
> the common layer since smmu-common currently assumes a single s->iotlb.
>

I see, I will need to think more about this. My initial thought was
that the iotlb seems to be exclusively used in smmu_iotlb_*()
So, I was wondering if we can change those functions to pass the iotlb
as a function argument. We should have enough context from translation
or invalidation paths to pass the correct iotlb instance.
But, I agree, it might not be as simple as I imagine, although I think
that would be cleaner. I will look more into it.

Thanks,
Mostafa

>
> Although some refactoring work is still needed, I=E2=80=99m happy to foll=
ow your
> approach and will rework this in V5.
>
>
> >
> > Thanks,
> > Mostafa
>
>
> Best regards,
>
> Tao
>

