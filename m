Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp243635ejo;
        Mon, 11 Dec 2023 06:35:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYvwsyBv7t1MARwpT5p+EQFcjXVahZwjA7duIE8+eraCSIvAUjQeR4kuJpAZFSZe0W91kG
X-Received: by 2002:a05:6214:c1:b0:67e:c693:9eff with SMTP id f1-20020a05621400c100b0067ec6939effmr3250887qvs.107.1702305307447;
        Mon, 11 Dec 2023 06:35:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702305307; cv=none;
        d=google.com; s=arc-20160816;
        b=0g39f2KnHoDMCSjIirvCAnp3bctSnIu9nc+cLr6AD8/7UQ8n7QuwgBQvf8u+C3vyLB
         Kj1s6Kih0ZTHuWBKk3O+jMfa9wEDP7tv4QnCmCkNgUbhb28tOWHBiNN9vPfJp0IgayDT
         178vo2N9V8Oo6ogp2o019A3GhsqfR3A+eNiLdYMzKUiJ6UCv0zsT+tVVs6KWTd8Y5Vks
         J7R6fIyV+kaIpjBbb7DmV+m8mwQTJASfcJk6GiF69wtd2X+/CaGtIhVpIiAwfBbAuo6x
         RculTDE6G2z2MhAzehpu2hnmzRLk8p9mT73vZLhVOLtCah5HvoTQYnZNJtJTYYyefOFh
         TW3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=5YdnQkh/WCt/AjLL96JsyZ+K8TtN25z/uzpS0acdy7M=;
        fh=IUvUsTJ3ogbYfkm6mpfi/pqN1juuTBtqWeaB39KBGSc=;
        b=aaIFhv4VMwWB9lxZ9QBQu0fK7CtrF45jmOZO6F8uuofhm0TtqtVqvkgcN7MfUfnPR1
         9vLGID9Zq2F97ppCT+LfaNMP3xcX82+xv7Qwh+1GZcjuPfZUJpje613fsjKxxxzyyzeE
         ebYukmat9ddqzYhdLzdcSKmSDu8xzEoUB+c89pPfMdWO8NA5JRuMYnQgZPjTaHzGOzdP
         2x8HAuwMbdhhMhfEoUVRW40SThYLlqeo5ruzplO8EuUx3cRNs9XHT1IkeOAYCU3BpLj5
         K0AaXndIIrXrOIgIYlQPAdq/tcHud+Kj9/1wT4Vv6cAj2Ibq38z4UXyAlVT5KUostbED
         9Yzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OVAXsrKO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c17-20020a0cfb11000000b0066fcd46cfe4si8370178qvp.567.2023.12.11.06.35.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Dec 2023 06:35:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OVAXsrKO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rChMp-00050W-Qf; Mon, 11 Dec 2023 09:34:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rChMo-00050H-3r
 for qemu-arm@nongnu.org; Mon, 11 Dec 2023 09:34:42 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rChMm-00061K-Hz
 for qemu-arm@nongnu.org; Mon, 11 Dec 2023 09:34:41 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-54cde11d0f4so6360148a12.2
 for <qemu-arm@nongnu.org>; Mon, 11 Dec 2023 06:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702305279; x=1702910079; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5YdnQkh/WCt/AjLL96JsyZ+K8TtN25z/uzpS0acdy7M=;
 b=OVAXsrKOEBcor/48Aqq5Ub0tY/IjbF9QQSeZKxMRC//oQBwCMtYJqe8wqAsm5103i7
 t/5riE/EfOEeoFefIXpNC92hjs3OpY8yd586J2rkGXTuUDG9x/0XVRf/IoNdHtHwmagi
 OZizrAhHzfrOyU0LjTvw9fiQw2ZN4H7P8Kvfn+QyzLbp+EnHo89nJjNwpYWt3ORG+LS9
 /kdcmX1NnBxhjAkjtdv34Xy4ZFKLKiUypq6dQ7rOqyrFtGzZouO8YV50wLbkSEYRYq5E
 1XWiwGbNxeA07N+uAFbB/eMkuyinJA7rdtxdMIIrBNo2dyNZOsFAwqA8P7XA685Be7g3
 Sp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702305279; x=1702910079;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5YdnQkh/WCt/AjLL96JsyZ+K8TtN25z/uzpS0acdy7M=;
 b=hRnWoznhJvR5dhD2iQXhhvyMIoSykX8/RaA1Jau9CzBsDBe6tIFUIT2fgfGkgJfueN
 2z98GZxuVpstRNceWVtNhbGOsHwVbpXKRPg5KsR0blQkGOAjc+i0FOz+pQwKCGb5pJcS
 7BqRBiu2OvZLutVZVjUlpl9fbTjTIsN5J/QIvQF8QdNwmVZkg6TC9vd0nF3yAPPTfmFM
 5p3LzFctDxfDBFMnlNYRPlcDaPtxe1LpoJNp+lY9lPeRmHmJ1JA/LkMznQ1lqjKZoKmV
 UpyTHldlysdczC349b+f8DKpFl2XorvmzJH58ZuWnXmWwIiGFX2MIyEmsQHROSY5T5BC
 Ifgg==
X-Gm-Message-State: AOJu0YxmmNEyHori/hhYUouRLOIboFJ9f1AOuh1n1Ses1s+JwpD8FCYX
 NL/3QIok0FPcP1k/Iry92sKT4EBhPA3lvXYTsYm70Q==
X-Received: by 2002:a50:9992:0:b0:54d:329a:372b with SMTP id
 m18-20020a509992000000b0054d329a372bmr2564336edb.23.1702305278758; Mon, 11
 Dec 2023 06:34:38 -0800 (PST)
MIME-Version: 1.0
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-21-richard.henderson@linaro.org>
 <db8f1d15-121c-4597-8f04-15661c7eaa3b@linaro.org>
In-Reply-To: <db8f1d15-121c-4597-8f04-15661c7eaa3b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Dec 2023 14:34:27 +0000
Message-ID: <CAFEAcA94EdEEcjvTZLYwnuv=ngQz5sD+ihY7ez+soeJMu=aXow@mail.gmail.com>
Subject: Re: [PATCH 20/21] target/arm/kvm: Unexport and tidy
 kvm_arm_sync_mpstate_to_{kvm, qemu}
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: hhhbCcMN6QoA

On Fri, 24 Nov 2023 at 12:06, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 23/11/23 05:42, Richard Henderson wrote:
> > Drop fprintfs and actually use the return values in the callers.
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >   target/arm/kvm_arm.h | 20 --------------------
> >   target/arm/kvm.c     | 23 ++++++-----------------
> >   2 files changed, 6 insertions(+), 37 deletions(-)
>
>
> >   /*
> >    * Sync the KVM MP_STATE into QEMU
> >    */
> > -int kvm_arm_sync_mpstate_to_qemu(ARMCPU *cpu)
> > +static int kvm_arm_sync_mpstate_to_qemu(ARMCPU *cpu)
> >   {
> >       if (cap_has_mp_state) {
> >           struct kvm_mp_state mp_state;
> >           int ret =3D kvm_vcpu_ioctl(CPU(cpu), KVM_GET_MP_STATE, &mp_st=
ate);
> >           if (ret) {
> > -            fprintf(stderr, "%s: failed to get MP_STATE %d/%s\n",
> > -                    __func__, ret, strerror(-ret));
> > -            abort();
>
> I suppose if this abort() had fired, we'd have reworked that code...
> Maybe mention its removal? Otherwise,

Well, it's a "KVM has failed in a way that's fatal for the VM"
kind of error. It's OK to drop the abort() here because since
7191f24c7fcf we will catch error returns from these arch-specific
functions in the accel/kvm generic code. When this was written
before that commit then if we didn't detect and print something
here we'd just have silently dropped the error, I think.

I added a brief note to the commit message to that effect.

-- PMM
