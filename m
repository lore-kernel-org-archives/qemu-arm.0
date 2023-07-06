Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp4406122ejy;
        Thu, 6 Jul 2023 09:22:26 -0700 (PDT)
X-Google-Smtp-Source: APBJJlExTCIULl/6i5JCQceRQlzDZ19ZLmuCQYZH5ij0FWMioQn1yGqU6AMnwBCLbfXs7kHTUkEY
X-Received: by 2002:a1f:5f89:0:b0:471:b111:4557 with SMTP id t131-20020a1f5f89000000b00471b1114557mr1867776vkb.12.1688660546217;
        Thu, 06 Jul 2023 09:22:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688660546; cv=none;
        d=google.com; s=arc-20160816;
        b=FAsppF1UIYxDp/Pcuk1HF3Gqy8vgqNSk74Q4zHJY7W9bhhm+3Ux/BJnSeCyPG4V/JK
         R0VHAiH2jehrsES272oRNdmcXjb6LdJwXnzOHxk5pf+REPCVjj0R1xFXExULuQttjN5t
         uhhftHIPyN6RHICtJYU8p0Yfytwa/lMroU8IWv1Nr0qgckJdWs9paSZYeYJ42BojV2kH
         rvHhL6LrOoi1SbE9b/SyNMN03318Tabb8Sx+H2fhyY+qNIrRfs2q/AMhJnEFj+jVipy0
         RQw+OpD/dBwwyPPCbbCAE/s2MjMYrr/0YXzd6Zvg/BFQMte48Ow5MiSUK1Ff39rgGvhY
         NElw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=60VnKutnwUJ/tJULxRdIf7si6nQAVpGcUbqvFWN9TWU=;
        fh=CEa3UdY0L+UQ/2T/5R8rkDkdq4jlW1F1hWJjDNQD42w=;
        b=qQCur7MuQ6hE2lpxYXCGJ6Gc63LDr2rtId3RjjBeTGs1T110ciphfuBOOrS9P0uwag
         ZOxvoDslxeGB3eeoqteEetyHgZp+yLLRswA8a60foRv4pjE+qpTPC2SCpUvAupXRXE5t
         7TPwQhTLCApe/nTBv/IaZJ1myTiXU+QdRC2/5OENHiYUig+SGEpa1WNKtrqn+KuCbV2a
         Hr+KIHa5dPGVcCxv6R00bBg6o5t55DLOH0obyky4Gw8xfh7UJNmJDpaovHIGJl6cBqTN
         Ujape6lPhu/Eghr1wA02Z3cpBS5z4ei/xy8MnZu0aO3tz/A1zkHtumTddyNuxo8r2xWq
         rFaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jnCc4yoG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o14-20020a0cf4ce000000b0063755ec6a6fsi1149696qvm.260.2023.07.06.09.22.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jul 2023 09:22:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jnCc4yoG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qHRkB-000459-Nw; Thu, 06 Jul 2023 12:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qHRk9-00044K-ED
 for qemu-arm@nongnu.org; Thu, 06 Jul 2023 12:22:09 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qHRk7-0001JG-1r
 for qemu-arm@nongnu.org; Thu, 06 Jul 2023 12:22:08 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-51e29ede885so1202610a12.3
 for <qemu-arm@nongnu.org>; Thu, 06 Jul 2023 09:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688660525; x=1691252525;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=60VnKutnwUJ/tJULxRdIf7si6nQAVpGcUbqvFWN9TWU=;
 b=jnCc4yoG4CMuRhBayiVVH7FeCkWLzZQqPFV7V4RtCGIXwcx4DXQlojE/uR+0etI9zV
 r9qC5u3XCKdVgqsCid9g8Jt3E8TrlAaVMmdVAasE16BhkUnM0MDNmkpup56vh3SDzYOG
 gPpmysyTqqogwts/722rR8GTXhB6MCzGvkP7AOmwFcMmnNn5EOmd/SfkpphSbMD+nVMA
 S856hSDTgHzuFbdw5i8oQrzUvvqUGnKl2PMp2MV8ez0iEeUAsz7CymAkpxFAF9qo7UZB
 5Sz5NFqKhYRAjOAs/ZKxHYmxJ+e5p3gV6v+qohzW6l5VDnVOAo3Om/s9/WpIjZ8lwGlM
 K5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688660525; x=1691252525;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=60VnKutnwUJ/tJULxRdIf7si6nQAVpGcUbqvFWN9TWU=;
 b=D4T/7nE8SSarn1qTHjHaelttnJMI8FkPs8Kt9qlgTG0z45EBcBWuCeqDE2EQJaOuII
 AIrJbfIDSd8paAY/Z9zIvCDvRZ5K5W/8uFDle6h4QqvNGXv08e4t2BtIiCXvS/kjsNOB
 HCRWbo25KUWtPCdJa0qw4k1lr3SBF13HxtqWYHEwpWl+AbmQobsaIP3L10TRvhEMSB4+
 PJ/Etez7VhlXpnfS0VKftkJKF/3jm2KE8H8IDOrGXIUiFflHPd/1RTwqA7K5aAEWtDFc
 upxM0+6OEqSmnqaqjqvAL+3tP2HRupahy2re9R+cQeX9wa8jq1+T8IUrdW0SXCozrPwC
 Q9qQ==
X-Gm-Message-State: ABy/qLacn1Wn7RZ9JVvdT7SujSS5sTN4D6VqjkPFm93SLkaRKNObPmjk
 PhqhoVHdgBgTm08nTTkYFDkkcW+ToEsOHZtwg6muUg==
X-Received: by 2002:aa7:cd6a:0:b0:51e:1643:5ad0 with SMTP id
 ca10-20020aa7cd6a000000b0051e16435ad0mr1732423edb.8.1688660525474; Thu, 06
 Jul 2023 09:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230706140850.3007762-2-jean-philippe@linaro.org>
 <CAFEAcA8h-VXZkD0SBrjOYg-FFVk5AW0RrAs4AL4w6RXWZzWUsQ@mail.gmail.com>
 <20230706152543.GB2570588@myrica>
 <CAFEAcA8crpS3SBoCsmxaj4isMcGYrExOTDU=m5u8-gOkrrjERA@mail.gmail.com>
 <20230706161016.GC2570588@myrica>
In-Reply-To: <20230706161016.GC2570588@myrica>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jul 2023 17:21:54 +0100
Message-ID: <CAFEAcA9VsCfa4_PY+HLkER02jzwEEhX20rVCtVXTp4SgDLeHSQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix ptw parameters in S1_ptw_translate() for
 debug contexts
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: OhSsIwbEzSvx

On Thu, 6 Jul 2023 at 17:10, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> On Thu, Jul 06, 2023 at 04:42:02PM +0100, Peter Maydell wrote:
> > > > Do you have a repro case for this bug? Did it work
> > > > before commit fe4a5472ccd6 ?
> > >
> > > Yes I bisected to fe4a5472ccd6 by trying to run TF-A, following
> > > instructions here:
> > > https://github.com/ARM-software/arm-trusted-firmware/blob/master/docs/plat/qemu.rst
> > >
> > > Building TF-A (HEAD 8e31faa05):
> > > make -j CROSS_COMPILE=aarch64-linux-gnu- BL33=edk2/Build/ArmVirtQemuKernel-AARCH64/DEBUG_GCC5/FV/QEMU_EFI.fd PLAT=qemu DEBUG=1 LOG_LEVEL=40 all fip
> > >
> > > Installing it to QEMU runtime dir:
> > > ln -sf tf-a/build/qemu/debug/bl1.bin build/qemu-cca/run/
> > > ln -sf tf-a/build/qemu/debug/bl2.bin build/qemu-cca/run/
> > > ln -sf tf-a/build/qemu/debug/bl31.bin build/qemu-cca/run/
> > > ln -sf edk2/Build/ArmVirtQemuKernel-AARCH64/DEBUG_GCC5/FV/QEMU_EFI.fd build/qemu-cca/run/bl33.bin
> >
> > Could you put the necessary binary blobs up somewhere, to save
> > me trying to rebuild TF-A ?
>
> Uploaded to:
> https://jpbrucker.net/tmp/2023-07-06-repro-qemu-tfa.tar.gz

Thanks, I've got that and can repro the failure. I probably won't
be able to get a patch sorted before Monday, I'm afraid.

-- PMM
