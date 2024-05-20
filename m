Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1441796ejb;
        Mon, 20 May 2024 06:27:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVsaFkU5dtmx3q31b65nm6LIPMQYkuaE3AWzYY5S7R/5yiT7UB/5mT+P71BVlLQgMf3n6ooXk/O9I34QUUhPVYd4k1219OO
X-Google-Smtp-Source: AGHT+IGRaUaZjjowPF0lUzg20PCwe1VtC+6iXR/enBT71q1WwtD47BkKSPvTLJ7i84/YOcCWrZrw
X-Received: by 2002:a05:6214:2f92:b0:6a0:b4ec:cda0 with SMTP id 6a1803df08f44-6a1681612fdmr370206856d6.26.1716211661652;
        Mon, 20 May 2024 06:27:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716211661; cv=none;
        d=google.com; s=arc-20160816;
        b=i0Z0NzBsBL4Oyj8vnz/RffiQSKbTPbRGXUd/u4q1elSYREVbL/bEt4b8lAhkCxy47w
         J2F2PIvY/Lv+idvGvHLamwKva5/fYOMkpyDcs1WwePH9iCbonTBC/jS8LujF8yJWu9Id
         Ol5PRVFmPTS8btX9yIFIyGSEypt7xou5zKaHZx4mYudRRjcNKoaZMf8hg2v4WzkFlykW
         GuO9s6uQrReCyMegDRY1fjWgUof+D1W1FCYTQXD/ueENzngX+4+GODeebmbrLd3I+VoJ
         LJ1lP+aTU+LPC39RP176iSgKBeUSxj3I2b2j3pvboEoNyD2v1CWaHymgSfjv7Rc2gC5D
         gseQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/NlaVpdiQZap65Ll3md9sApNb4qyW0eEV07FMYaw3jk=;
        fh=jt9WyA5S+0wO5//f2kClh7ihONdU/ZRvtR8jIFwrYjg=;
        b=Pu883cgppKXrh2+d8qpMb5E16qEQ+YeA3bDUsMIF9WyATHC2MGAwxUW0Jkgt614jYS
         +XvRD4dAqw2CFdTPCU7g3Y7i19gH67LdI3G8qwMkDtIC2KsQkwwon/R8+HaFZN2b8Axx
         odEEGx2+kR2pNHkvfemO94btb/gtC4cfJKqf5iqpDwtZZRtNrEmSTFyXjAX8g+jybD64
         zRNZJhFjiyp6uLGKNVXPFGwY819eVXgmrJ4p9A9tUJCAgYZmiua/mMFHTRD3WKkOxj9J
         09uPULfd0QsvNAOupfzDb7rdumj6vzdDg1SZRbzdCMN+HMsMVgy5xssgM9QvoOCG9+56
         XinA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aKLaFpCl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ab26fa154asi14829566d6.506.2024.05.20.06.27.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2024 06:27:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aKLaFpCl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s9330-0004fw-K7; Mon, 20 May 2024 09:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s932x-0004fU-Hn
 for qemu-arm@nongnu.org; Mon, 20 May 2024 09:27:23 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s932s-00039t-CH
 for qemu-arm@nongnu.org; Mon, 20 May 2024 09:27:23 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56e56ee8d5cso8244958a12.2
 for <qemu-arm@nongnu.org>; Mon, 20 May 2024 06:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716211636; x=1716816436; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/NlaVpdiQZap65Ll3md9sApNb4qyW0eEV07FMYaw3jk=;
 b=aKLaFpClVVwu/2NdHX/LgPVAy4jej7bZVEgz/uQLR9pDLg6l+hAQ/44ndcypL1rOLX
 8wUIKoah+iUvzsnrVpN/BucyqeZgFTa7+j3qx/D7gmmaHdIdcZ86Ucm4Nkbz0gG9dcF3
 MB6q6s+WNcBfGk+q6+o5V9SPukyK8XzqONYFafwWRHS8uWixwA40MyD9fDW5xYpF28cG
 mB1iy4expKmunpJBs/SpghtdJLHRbHIpScjbB1TyLE76t0wDTiYPt/MNQJy7DnliQ+Hk
 JW720fXLP54MfrPV4/HttOD1qDYFAKbYrnUVQzQHERPhELEKBXSITX0N65QcW8XuJ4ng
 9+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716211636; x=1716816436;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/NlaVpdiQZap65Ll3md9sApNb4qyW0eEV07FMYaw3jk=;
 b=JD1P7ituJE/RDwDBcaFV654ACLBxbp4chX6za4dQowCfca9eFykwYYd7a7X1K1XcNd
 IAp7sjN6t6YNxclL06h4R4gkAI4rr8BfSPv8ntBdKF8WRhI9qcAxVNhJxJSyzwCJWdF/
 vg71LNiWAf4V7V350+PW6cCS1Ngu5oNsKJb4Nsack/X64ffoKAKzFFRXqrgLstPW9L4a
 NjPh5BRnW6GXihniTFDqbxV1wJWhIPkP5apjBh2JDVK7QoDCwdg5MLl6mTay8domd5z0
 6TK3+GNfjfM5ZvYpjIeJK9cERrQ0jtsZBGNoDVOWLqluMAEutEJcEkF3hd53upULWcam
 MzXg==
X-Gm-Message-State: AOJu0YxgTsuj1qxOHp8VPP2zVjTDVQRZ4D1EeN22BPb4LD5o2EswaxQ1
 kARg/CmJzsJ0h8CKp8cBLU40LzqZjFdM2tYxoij2Bv6T0IdoVog164P+jcdi9pD1eLN/vMxFq0b
 8Z+tV2OBk2/cZWZBgX2uO1URn7D0qDTFWscXSDA==
X-Received: by 2002:a50:d5dc:0:b0:572:7319:ab83 with SMTP id
 4fb4d7f45d1cf-5734d5904c1mr21658500a12.6.1716211636514; Mon, 20 May 2024
 06:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA8DAt+o-XZepg8xtj4i3xLW_yChwPnDZVM0O=rW8+9qJQ@mail.gmail.com>
 <20240507130038.86787-1-sebastian.huber@embedded-brains.de>
In-Reply-To: <20240507130038.86787-1-sebastian.huber@embedded-brains.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 May 2024 14:27:05 +0100
Message-ID: <CAFEAcA-gHrmp2F2CpXRTZbox1KUXGbKs=E5pLZ1obu3BCChS1Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/intc/arm_gic: Fix set pending of PPIs
To: Sebastian Huber <sebastian.huber@embedded-brains.de>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Luc Michel <luc@lmichel.fr>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: ZRlXlJfuP89Z

On Tue, 7 May 2024 at 14:00, Sebastian Huber
<sebastian.huber@embedded-brains.de> wrote:
>
> According to the GICv2 specification section 4.3.7, "Interrupt Set-Pending
> Registers, GICD_ISPENDRn":
>
> "In a multiprocessor implementation, GICD_ISPENDR0 is banked for each connected
> processor. This register holds the Set-pending bits for interrupts 0-31."

The commit message says it's only changing the handling of
setting the pending bit for a PPI, but...

> Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
> ---
>  hw/intc/arm_gic.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 4da5326ed6..20b3f701e0 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -1296,12 +1296,14 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
>
>          for (i = 0; i < 8; i++) {
>              if (value & (1 << i)) {
> +                int cm = (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_MASK;
> +
>                  if (s->security_extn && !attrs.secure &&
>                      !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
>                      continue; /* Ignore Non-secure access of Group0 IRQ */
>                  }
>
> -                GIC_DIST_SET_PENDING(irq + i, GIC_DIST_TARGET(irq + i));
> +                GIC_DIST_SET_PENDING(irq + i, cm);

... the patch changes also the handling of set-pending for
SPIs (which previously were marked pending on the target CPU
and are now marked pending on all CPUs).

Looking back at the thread from your 2021 patch this was also
noted in that version as being wrong:
https://lore.kernel.org/qemu-devel/20210725080817.ivlkutnow7sojoyd@sekoia-pc.home.lmichel.fr/

PS: for multi-patch patches please can you send also a cover
letter? Our automated tooling gets confused if there isn't one.
It looks also like you sent these respins of these patches as
followups to the thread of the original patch you sent back in
2021. Can you send new versions of patches as their own threads,
please (and with a "PATCH v2" (v3, etc) tag if they're respins?

thanks
-- PMM
