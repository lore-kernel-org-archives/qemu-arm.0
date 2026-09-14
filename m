Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3757C88E64
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 11:27:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x64q7-0006Dn-5R; Mon, 14 Sep 2026 07:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x64q5-0006DB-NZ
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 07:27:09 -0400
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x64q4-0007vF-6v
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 07:27:09 -0400
Received: by mail-yx2-x11.google.com with SMTP id
 956f58d0204a3-66e4aa8d881so1304946d50.1
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 04:27:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789385227; cv=none;
 d=google.com; s=arc-20260327;
 b=e7cVZuqxWaCD2NuSlqV7ZYoteNBt0TKYgkpFR8WENfsi28e9IRKjGAHvxK7aQf/rz1
 WW4vmAUmRL8GNFx2pJBmqGJX3J5tbwxL5ASiJIkYkW7Plxw3kpoe51gOZP7ZGnHOXsFr
 uvxXQkYk5KpKkHvETxBUO89+YHNQP1eZL9293sKHyvglRZm0LXwSZQLA1bxsjPBXkakM
 Yxmu7gKYoWxPHIwm63LQDVx1GKh2lrbFebqGLmS9adAxKmvQ6YUgnotpUp+Z8e8LeiXh
 bRm5hIQg0qDdXzVfXI7gHyNjzwn2VKtKv1Q9HhawJSl2RQG8iaSdTQgRf4Xt7XDVd58s
 /ngg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=QQNw9jEF4RWvV57juX1m3+edMRoIpw5ThRRrmoNT37k=;
 fh=tvAW4xvYaAhHNDdD2tKbZsgVzM5I1s/bj5W88FquLuU=;
 b=Bsf3byP5dhnCLufv24cNZmfTrlAJbtVi02Ix6e0VTK0p5JhPwtvIue3ZQ/NgEz2PJF
 CiuPAMz7DyZo98swywYtGJlWUSRRVPOEd1CxIDjbzzWh4stPSd5PQn7OhFasyypJ4qpz
 5Y+iRhUqqvGHwquyo6GPYzch4/PRlhcDgfwPHqXWRStyHJ+5yqa7GwIk+FPYcnJXHgJH
 g6SnFz+vPSucgRrHZWG1oM8jcIPsS7mPZxcCI4gZUZOFXZeL2nGBAMUWdiJJnScUAShz
 DavNiTqn8Bm4H/KjwqM7ad6Q8josE2e6nqYAWM8NGDQxe5C+ZrtmWY/OQpDN3r5/LBw5
 nVlg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789385227; x=1789990027; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=QQNw9jEF4RWvV57juX1m3+edMRoIpw5ThRRrmoNT37k=;
 b=wBMcH21luBJj+7BARpU9LGjGLiUDqgAbAFKpTy5zHtwhpqdGTbk5OL6ZwFlukhvtGx
 4yRnqdITrRjdX7M+mgSQdtJ92K3F8pEz94H5Ov6tkkxouq4OE0JDPQVg7kl5E/W0VR+b
 2xwLpdTpWlezBuioRrqL1Vt+I+0HSs/ebepfEAmi/54xot9ZwZBqSqWjC8h6M6veNCqO
 HIgfTckMJcY1BJdbmSvDmBcTicfaVAOwwCo1B7/5IYCsxaKEXQXj+SsPtis4yEjpXaKv
 ZyILdKKxM9kvgRJ2mOC8DM9nzMMZbOswvhiAJp5Oa+MjtTAxFlvFzbB3X4kenlyLD7o/
 fqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789385227; x=1789990027;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QQNw9jEF4RWvV57juX1m3+edMRoIpw5ThRRrmoNT37k=;
 b=g+UOM+1pGfpQu7AvVdvU1QL8npuQnsJGvfcZJmufeQ0bw+y5lMt2eUucGqteTf2ykW
 dIjLYkZMLXkQKaTcKH+txk4DSJ//2/lRTESwzkbJTOhHk9fvbr0t6nDfidBp2uV3DxMG
 aawaxIcgA+b+EVTFJlNlV1beRvJdD7Gm4n837O/cW3Vabhagv/9zbPDa9v/Z//iMCtPX
 cHwWaLO9aoaVBisUy2fpDplqJ9lPjez3ZRCJYKp36IN+TcvPxRS3zHGM7jSW6GP9C1DL
 SfEk5kBt/iZFcqnixIH0IUI3sdXrSRK7nOCvTA8OW9Ojkz/HAAsbm+pLwLJvGQ8OCtON
 w/+w==
X-Forwarded-Encrypted: i=1;
 AKwUvBwPmNbZdYxsKtgn/l2NTy94Ed66PEfrYwugkVwIF0cJCnXticQQqObxJMF4DJ65NgK0Na42pR0rUw==@nongnu.org
X-Gm-Message-State: AFuF++m+b0bl62JC3HLo0UgYC/IeInC8Fx1LFBhYAP9QzFQQH7Fm7GOL
 h0V6B5LZnvza0fNW+TYSLQNY/dY5sLBY8iGcZcSAc2SxOJTQAUv69CjN/LkhE6JHQTEA+01xKth
 2VFC+jUqK3mthi4PqkpK+ZwFyQBEz/tUaRjEBMcWZIA==
X-Gm-Gg: AYBFou1SV5oy0M4ElccxG8IrDcXkgd9FWm1wvl/J9ZPhWsWqXtx/VwMhp3WdnyBWPve
 HR6D84hbf9L6MqsDfUZ5DfP6HwLYbrV9ltzldxFI2BrxmX80ms/Hut+539t3zxgR4rEIArqTNI1
 nEcTo6wDkMVpbZ8ZAKP+tkHx9Wtn7z1lgXWkL5TVLhbfud8CZHKOe/hkjcWQs/TqhdMZyTTYYCP
 f2vgy9beryiIJeHiNH7l20zgjGDYivcf7jEiIkUVkEmUhHpHSzZe7fjzLiGncQkufBiQF8908hP
 PEzh0BmpumhL2hQSgvSHaTdtdb/V/xR3YW9vsuZMRPzf8ZrE9ekWSWeelCuBiCR92B49UOjIdGO
 piydxzyhYoO/XTiHvEpa7ZKbz+9hic9g2kV0Gel4=
X-Received: by 2002:a05:690e:4419:b0:671:4b8f:e8f5 with SMTP id
 956f58d0204a3-6714dff9729mr275501d50.35.1789385227080; Mon, 14 Sep 2026
 04:27:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260906-nohmp-next-v1-0-2b21e63974f3@redhat.com>
 <20260906-nohmp-next-v1-4-2b21e63974f3@redhat.com>
In-Reply-To: <20260906-nohmp-next-v1-4-2b21e63974f3@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Sep 2026 12:26:55 +0100
X-Gm-Features: AcwNN1XW3MUngEO8Shspfe-7Zi7uvOVyTbxK8AJYJzUa824KrIy1alSeaQHFkxE
Message-ID: <CAFEAcA9ZHGY2Wj_8z9Vq01Oz+Dx8xtfh6H28FsYepAM4szogYA@mail.gmail.com>
Subject: Re: [PATCH 4/9] tests/launchupdate-test: correct g_auto usage
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, Brian Cain <brian.cain@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-arm@nongnu.org, Ani Sinha <anisinha@redhat.com>,
 Gerd Hoffman <kraxel@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Jared Rossi <jrossi@linux.ibm.com>, Zhuoying Cai <zycai@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Jason Herne <jjherne@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>, 
 Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::11;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Sun, 6 Sept 2026 at 09:54, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> g_free() isn't the appropriate way to release those types.
>
> Fixes: 0b70c6ce7b31 ("Add functional and unit tests for the vm-launch-upd=
ate device")
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  tests/qtest/launchupdate-test.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/tests/qtest/launchupdate-test.c b/tests/qtest/launchupdate-t=
est.c
> index 225c843df5b9..ed007cdce29f 100644
> --- a/tests/qtest/launchupdate-test.c
> +++ b/tests/qtest/launchupdate-test.c
> @@ -192,8 +192,8 @@ static guint32 match_string(char *serial_f, const cha=
r *exp_out)
>  {
>      GError *error =3D NULL;
>      g_autofree gchar *f_contents =3D NULL;
> -    g_autofree GRegex *regex =3D NULL;
> -    g_autofree GMatchInfo *match_info =3D NULL;
> +    g_autoptr(GRegex) regex =3D NULL;
> +    g_autoptr(GMatchInfo) match_info =3D NULL;
>      gsize len;
>      guint32 count =3D 0;
>      gboolean ret;
> @@ -214,7 +214,6 @@ static guint32 match_string(char *serial_f, const cha=
r *exp_out)
>          g_match_info_next(match_info, &error);
>          count++;
>      }
> -    g_regex_unref(regex);
>      return count;
>  }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

