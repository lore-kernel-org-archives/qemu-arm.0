Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1825606A32F
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Nov 2026 10:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=scUOV1DW
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xStVv-0007Lr-No; Mon, 16 Nov 2026 05:00:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xStVo-0007Kt-OD
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 05:00:35 -0500
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xStVn-0003Jz-3C
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 05:00:32 -0500
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-67be4f2f4d4so3739144d50.2
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 02:00:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794823227; cv=none;
 d=google.com; s=arc-20260327;
 b=aWdgqOSfbC6f+FUs+oa9/53/iWbrFd4KSLSUT9JkZzSlhrVXzNqrJnaHvljfzNkr2x
 pWv7kfC78WECSFCn0fjG0BN5WVIAF/OkrxAHAvBtATRq/qEv1R9q39As3vDgRP/5Kgd5
 vgR92Eb5Q6+rkY1tMU2+82J7fesD+xbhXyubKKVuB08HXBjQPWQ7rpaD75gwFKtr7tLT
 3iZMv+Wd830VdwZO5D6MS4VRYZh9LkyEX8GRD5ydtwyiVVv/49W0f+HchVaY+PiUqxz9
 9J1q1TFeESgEgzgjU4Tz+q8ERkj32vVSLjh40aFbsZmgoI8dORvr2KJxe3tyhxBSIHo+
 fhRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=vTbN92+d0UyOJduI4pijjj9FbjauQy8Fc5BIW6Xhzck=;
 fh=BioSHqRBdZKruxpgntVmXKtrIPuCrqJnoH7hgpmw9FQ=;
 b=JNzzaEIanYt0BgeWBhUHVfjcVBDcvHrd843hLyRDTA5XMhteU8MQEE3QnNqs+GkVXn
 aCdzsvt9eHLV3UjAM7ow4wK8y9kWbEwYbLx/KhzBsBulc4yGe5g5gT9KzrEYFh1MQmAt
 iS2Wlsxzh4ZboPJCHbX7AFWnF+o7Bg7w+FIj2FDxI8+6BZLzzGnosJoCByCl5dZ+g3ip
 J/tUx6S6jvvRWjL3kzyIxVd5kyy3pvLIqOe3YnvRsYCSJ0ARy1HZPbSOW7dYVWavSrR3
 PQHBpjMgXowVBH3ZSUu/bINK1NeVAkHbnBix51WXyLWlWqpgAlcesDTlApx9hyIx4/YE
 pAuQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794823227; x=1795428027; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=vTbN92+d0UyOJduI4pijjj9FbjauQy8Fc5BIW6Xhzck=;
 b=scUOV1DWF+S+OsuOC2oGG5jxneU7vqdu8eGQR7KOmdfAosQgljpXyT5Nq3MyBAhLBA
 yjFvXl07dnPimcBnZrtU0QmBAoFFVT4gpTaITn7xquI3cTZUrx3aXC3rUiOuLHMXgQZx
 0Rqc4wp5DZO4+3caP9jBCNIvdieUjUknv3u4ZxrPvgq7pkVXoYvvy2Nxg+GhJuPBuiiN
 /jYcjypH6GLQFfvdlYr5Yh/RETo/npUG2Zt6iK8mz/Wh9CU+7XDeN19ZNDIteq3fTRGx
 3ygOMhMQ8TUqSqiwXMQHckVpaQIaHxgH7p2EXeXCUyNk/l/nscWf+tbjWhF0J54DYTyP
 qjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794823227; x=1795428027;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=vTbN92+d0UyOJduI4pijjj9FbjauQy8Fc5BIW6Xhzck=;
 b=Y2+7cBrrMWtXUILFJ496My6u7mBDWEtEse5YGnKo8z0zBV7okGV2+hW+5qnY8l0+HO
 uRtml83vjYwGkeCFJMqmBmmKnF0Xl+731mdblGTxIPmzGW6DFkSE714/AKZl8Kub2kvA
 3B/r9zAsde47lexPwuOJSLR7hQjQypD+edQGMN9JoYqHATMRzfQVE6xQl+Uvfa+rpZTJ
 vRH789ynCY1qQgX9jxT1Y6hDKaY6F0jgAhRY/v3LOVA4Qp0XvAkfRU9DGArefizyrR5a
 QlX53e1O78TldOGVAC0PEuUbJo1mTiG6rg70LrsoGOhHIGkxZjWZYNQA95CtbLght81L
 WvGA==
X-Forwarded-Encrypted: i=1;
 AL+hErGGsQoIZRUrV252Gyi3P9gyydds1NpQJVtT7S8iHPWGW2Kj2OLx+NQiIXfxykPTpVNzD7h9FecxOQ==@nongnu.org
X-Gm-Message-State: APuU4Z/hAazNhaK68xWuYXGMPa2Bx5ozuQwOtgxoqJFGXlAXSH/nTMLj
 gEokbnTuyfni/Hqvf6oP4JIP6o/973dGq9FFLTkcrFxzekbh4pB7gfbZBWpHfZTy5IdjlQWQ19C
 1OBEjxCDf2TALp+AETnE491CtX8KLoHAb2BTAupPQ/g==
X-Gm-Gg: AZFdTZeZTh54eav5RUW56H11MNUsU084JFMroXnhEFNSLqoJ3Cxckr37eY1EyMmOpVF
 NhSYGv67zxl4ORnGphcyR0qggOcrNRX9IsmoE7W1fkcS8gBG3UtgeVdklBWzBBGpzO6vs3bqbuI
 ueBTJmjU1iu64LD4UAvxppYCR7iVjo6hlyHbwJgPx2q9s04MChUE4peTGVfg4m7BBQyBlfo4ig6
 T+xvOT7nuMhoiHJpcBAB1Ss9Nk+cppP4IMWIOKRLaHsQEIvdRjSFIXHIT7TpRC3gr6UlFNrvegi
 56cC4RB6y2+mF/etEF7bO3ecjUyntA4XOwX0ttKD5yvgEmjz1peIm3PVzMTAxWvmZ1Fgerm6XUN
 qTZ3vgRLV/rKs3yfZIJyzLbol0woBrP0xf3PVTLIY14N7hCAnePCMPfvOZaZrTiN+EqTtUdUOtE
 +hqJkpde80qw//14bvpwlfYUSwITkPrDERq7G0g9SI4w==
X-Received: by 2002:a05:690e:1916:b0:67d:c309:541d with SMTP id
 956f58d0204a3-67dc3095678mr63518d50.87.1794823226750; Mon, 16 Nov 2026
 02:00:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112180859.85380-1-philmd@oss.qualcomm.com>
 <9b64d3d9-736d-4878-80d7-4caa75eee778@linaro.org>
 <CAFEAcA8La+8TqFY0yCxRsXY2Ad9MA5Uu-sVEbysExZPkUXVawg@mail.gmail.com>
 <ccfcea11-ada8-4753-a71f-f59ed1bcb067@oss.qualcomm.com>
In-Reply-To: <ccfcea11-ada8-4753-a71f-f59ed1bcb067@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Nov 2026 10:00:11 +0000
X-Gm-Features: AclHuK9J25OaKBjG5jH0re4AD4fhrssVTyoM-8tlnENWrsIzhVt3qcLIptP8pgQ
Message-ID: <CAFEAcA9FE_dTUo5s2g7DMw9-ZhbjBUOfF0RJxdT7gMwm-rYuGQ@mail.gmail.com>
Subject: Re: [PATCH-for-12.0 v2 00/12] linux-user/aarch64: Support both
 endianness at runtime
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 devel@lists.libvirt.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 16 Nov 2026 at 08:53, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 13/11/26 19:55, Peter Maydell wrote:
> > As a more general question, is this something we would want
> > for architectures where both endiannesses are relevant (e.g.
> > mips, ppc64)? At the moment we consistently for all targets
> > handle big vs little endian as "it's a separate target with
> > its own executable". That's convenient because you can at
> > compile time hardwire in things like variations in struct
> > layout between the two. We could switch to doing that kind
> > of thing at runtime, but what is the benefit we're aiming
> > for by doing that?
>
> I did the other conversions (Microblaze, Xtensa, PPC, MIPS, SH4)
> and wanted to test the water first where this would get more attention,
> with the series involving less changes.
>
> My motivation is MIPS where we currently have 6 binaries and I'd like
> to add binaries to cover more ABIs without having a combinatory
> explosion and have 18 linux-user MIPS binaries. With this approach I
> reduced the current MIPS set to 3 binaries and add 2 more, ending with
> 5 covering more ABIs instead of currently 6.
>
> In order to get there I need the few core changes introduced in this
> series, which affect all user binaries. I have the idea ARM users are
> the first ones interested by no performance change thus is where
> I started the benchmark to prove this approach have no impact in emulatio=
n.
>
> The TargetInfo structure change (one initializer LTO-protected and
> all accessors via read-only exposed structure) is also what Richard
> was very keen to have (page size support planned) instead of the
> current approach.
>
> I'm thus returning the question as: why would we not want to do this?

Mostly because what we have today works, and the idea of "the
target ABI is known at compile-time" is quite deeply embedded in the
way the linux-user code is written (both in terms of ifdefs and
also C types being defined appropriately for one specific ABI).

The idea of not having to have 18 different MIPS linux-user binaries
is pretty tempting, though.

thanks
-- PMM

