Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1511215njf;
        Tue, 3 Sep 2024 09:39:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUxOzCGIYRD7MEvu84MJwQiIIoW35ySACuAIQknGv0ylCjr5N9ZqF6qGL1a0bif3/HIN1cMGN+ROk+lcQ==@linaro.org
X-Google-Smtp-Source: AGHT+IExtoAUzSXgLQ6j/84g6Z+9wISnLUgpOcCCd+t+nYXm2c5vB3Nek6tqgrr9/+EphwatcLlF
X-Received: by 2002:a05:622a:1b21:b0:456:7ec1:bdee with SMTP id d75a77b69052e-456966ad8f9mr129315051cf.59.1725381542671;
        Tue, 03 Sep 2024 09:39:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725381542; cv=none;
        d=google.com; s=arc-20160816;
        b=qBDRquLSAtrqswDy3jPIK+zpuxtipKuVnpWYGDIIxms/Br6c2/fNWWBxxa0YCO0lYY
         LvEqOE4GRPZUJ/ri4YWFO9iqXryKiBTmCaWSMvpfU7Klb5m7FT+G+b7zKFnQ4sVXUZt6
         lFBBE3sUYtDgb5tb4Vvqpy9JEdyETPKvekmpe1dCOnGrKHlWS1xjgq5yQLuSgjJn00MM
         iRq32+Voy/VC/yCTa5QJGZlLdN96fkVbPHB+xFXq0gnOwDC3e6ipMAnLJfg0xCbvaSZR
         ldruJCe42gJjC4MiBZWEqVe09ITH2lyhLrKEoHDv/S0Z8RNb6kwVejSytvgnEtzLlUQ2
         27fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=mmHYRpE5cDo3krpudjkkf6vZQqE/rCgFPn3mx8tfzDU=;
        fh=ZAgR3U6XG/OgLZi8XFO4X9BHs/b0qG14WP/2/akdtHc=;
        b=SgBiO/jKZKkf4CQRUAPB34uI7/cYa1rSK98DX0ycZ4ZlF7Hvi2nQjBtnuTF7n39AyL
         26/t8gxqd8wipwtEGUlzjXUWhDyOzHGT7R8SYLLIUS4h94sC78sFYoUpBe4zWWi7RFqU
         KDQPBbAXCBkhRIJ1WeqoHNfRGX58TPb57F8UP88R5qGA+BJjQ4a2c0mcpxLoj8ubIrDQ
         ErKH4MsN2G7aJTvfKSSEJ3jLsGOGxisKnoDzyFP1lwxInYeT3dvc4AMtw5mHDhcZGUBw
         rkg3GRa0WCrl4PWRra+DWRPlYp6NOQ1GgAueMlgs3ty3Gay7jOkoZEuoTLCMX/DSjc3J
         Q8SA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xpJO9DjI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45682d401efsi105539761cf.260.2024.09.03.09.39.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 09:39:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xpJO9DjI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slWYN-0007AC-KV; Tue, 03 Sep 2024 12:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slWYI-0006no-Lc
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:38:46 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slWYG-00078Y-9Z
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:38:45 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-428e0d184b4so46461965e9.2
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 09:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725381521; x=1725986321; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mmHYRpE5cDo3krpudjkkf6vZQqE/rCgFPn3mx8tfzDU=;
 b=xpJO9DjI4EmQaGqIWvddyt+rct1oX19PjHUMVYIFc0xozOR/iFh+6xL2rsxeg24xvw
 b4rYp+ZCR0svXSETkvn/LNZkan+ot4BFaQ23np1MgWnteUMIiFbOOAnLZySloLmFoZUv
 S/dQ8y6X8Hj0LYxFs60sMLp2Y1+Lcx2+FAIm2NtTANRrpF75OySgMGa8+UlcN5EoiiUw
 JRo84qt6bkX6bRO0lIldEZZoDYO5OZNMM4+QSuDxK6hYss5J/ftts+kOdfQbF7xO5ac5
 FDMdRCOtXJay+csi0HJDBa2WvUuZU6BKS2T8RMNxX774eFLfg6AnT33+DckKNyBnERTL
 AOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725381521; x=1725986321;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mmHYRpE5cDo3krpudjkkf6vZQqE/rCgFPn3mx8tfzDU=;
 b=jLevVdcSyJyBSyKWYr/t3J/IDVRgPdEpAAGx2wsFpQiH7a92mw7J+M98S0sHB4T8Ia
 Iv6oKhiyhOPCzgkSMMDM2mYWk6Wk0+lQjyoW21Mdqid4wcZWzRk9JVVOAw0Rpw/MKPHO
 rpPx/620rE4OEia737cEf2pfy2ZEOBa2WOfU1mQDyLKLCNVrlQQs7qLYPAabi8/Nkmia
 wigvUE7dwrBOVJlD3m8azx+gIAIWN38F4QXsCmEUHTD1MjW/NHgmfLHASf0Hi3oQd67g
 QTnp8xbpeHCgqzoQUCC40vYNkz3/lVXk42AnkLDl0W4VtQiG+SgMiqVz9GRuqSWg27cb
 nnHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlXZ7VW3j+Ym+/D2LxsjdDoKFlTJSYp9nRzL27xTen2OOEawLfmz0qZO80Tf7u9oJZOmaOOQ9hOg==@nongnu.org
X-Gm-Message-State: AOJu0YwA+nXqMRWMxICZ8tr+xdHPT+PkQHDZ/vG11B8sSQ7TnW4YSecx
 tN1NfmMZsi2b1JVo+wf9QS6bWjnZoMP4nK1s2lvurnWBjJihSufDJdHIE3ptBA7bz+EOr3nNIP9
 Qr43jDbDPBtEIR5hnkh5xkIQBu9I9+bFOVF7Kfg==
X-Received: by 2002:a5d:4f08:0:b0:371:7e73:eb43 with SMTP id
 ffacd0b85a97d-374bf1c9498mr7075937f8f.42.1725381521357; Tue, 03 Sep 2024
 09:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240903133940.3447430-1-changbin.du@huawei.com>
 <cceb62dd-742c-471b-8b4c-6bfc304d4565@linaro.org>
In-Reply-To: <cceb62dd-742c-471b-8b4c-6bfc304d4565@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Sep 2024 17:38:30 +0100
Message-ID: <CAFEAcA-7FjL0SZzJsJ6WZ-Cccx8W2711_CrkNpknrJgYtJx=iQ@mail.gmail.com>
Subject: Re: [PATCH v3] hw/arm/boot: Report error msg if loading elf/dtb failed
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Changbin Du <changbin.du@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Jp3+kgl9Yt+e

On Tue, 3 Sept 2024 at 14:52, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 3/9/24 15:39, Changbin Du wrote:
> > Print errors before exit. Do not exit silently.
> >
> > Cc: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > Signed-off-by: Changbin Du <changbin.du@huawei.com>
> >
> > ---
> > v3: use load_elf_strerror() to format errno.
> > v2: remove msg for arm_load_dtb.
> > ---
> >   hw/arm/boot.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> > index d480a7da02cf..6c895e05cbc0 100644
> > --- a/hw/arm/boot.c
> > +++ b/hw/arm/boot.c
> > @@ -839,6 +839,8 @@ static ssize_t arm_load_elf(struct arm_boot_info *i=
nfo, uint64_t *pentry,
> >                         1, data_swab, as);
> >       if (ret <=3D 0) {
> >           /* The header loaded but the image didn't */
> > +        error_report("Couldn't load elf '%s': %s",
> > +                     info->kernel_filename, load_elf_strerror(ret));
> >           exit(1);
> >       }
> >
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>



Applied to target-arm.next, thanks.

-- PMM
