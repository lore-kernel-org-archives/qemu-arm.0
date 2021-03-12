Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1200133lfg;
        Fri, 12 Mar 2021 04:50:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWzQixE2RulOtCqipfGAq+rF/rGsSIq/WWwoWb54kyjhYOs+BPmkAxOIXalS/XARfjlDn1
X-Received: by 2002:a05:6e02:ca1:: with SMTP id 1mr2509272ilg.242.1615553417720;
        Fri, 12 Mar 2021 04:50:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615553417; cv=none;
        d=google.com; s=arc-20160816;
        b=Kc3o5jJv6Q0dFiVw3QrxNhfTwlWhqgVM5yNCimTn1aYFUjVM1+Ydv53v+/uCyOQr3M
         PWvfR0+zNeuAeWx9dQHiZ2eLI3H2XnGN6xOUbFwPTU/lf4YUQlNqOYBuDjD0b/lLPmJd
         Xq7HeWhsniaDdbkDrOm7d7DFFS82iCyosUG9rKejxHo3tnT/d/ostxSydf9jML1oDKzS
         K+I1+oWHH9k3meqQzg5efE3VtAa8JvsSg3OxVIRtKOsw7phFWzdVd/FFmh1XkFoKZ1L5
         7yTt3NmVhAnOdaaXXygT9d0efiu3fnACAtPeUAXF5l4nCsxjZ0kvbFmzyDI3lFaklVKf
         3tDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rkuq+qbQ+xQQUmcf97+8M3mc/Oami6+rdxnQxUjRSco=;
        b=rYjbmuDyxSx1wKLHh/1ylV9Tun77QAZEZppkUn0g4hibaLBG1MYcyKozgnwsYVMnY7
         Tw3J4Wo3D4eRpm394iMN8Kc/8a2EAHpn7K9h7pMRWZtuRy+b2twpt+o3mheop6iAwNI0
         Zs8e6/brlaHPgYw8lm81yQOTMnrM/jUzehPx91vqqvFKWWJ3BfQJ4qJ+pmQOo7HX+aug
         g9rYBd0LOwKuDnc5Z8YbaMo8nITVGHbaZLAkksttOPgzk+R+V6rM6GrWjmnpa7HS+fnt
         a4zqUDfq87ojLprAE2M4PIKyQvqgIRmeL0+9a829LepgoDNozCYvZ85UbbNn5o1EUH4x
         VO1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y74vs+gS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k16si5674463ili.91.2021.03.12.04.50.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Mar 2021 04:50:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y74vs+gS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKhFA-00021x-PC
	for alex.bennee@linaro.org; Fri, 12 Mar 2021 07:50:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKhD4-0000Cq-Ja
 for qemu-arm@nongnu.org; Fri, 12 Mar 2021 07:48:06 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:45055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKhD1-00065c-ME
 for qemu-arm@nongnu.org; Fri, 12 Mar 2021 07:48:06 -0500
Received: by mail-ed1-x52e.google.com with SMTP id j3so7780779edp.11
 for <qemu-arm@nongnu.org>; Fri, 12 Mar 2021 04:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rkuq+qbQ+xQQUmcf97+8M3mc/Oami6+rdxnQxUjRSco=;
 b=Y74vs+gS2W3hkJdNo0wjqrYLUPw+cGzV0xEjn+16mG6q8yMMUWWjTKA7jcO6OEm4hd
 snQrWRdexHyTKi6dwzqegWvCAE0ieIaUtW9b4gfDgGPFDXWdnUqJKCM/jKmnUYPB984v
 AcRLjm7nTgjcO57Jr3FU0OAvfjGytAPrb04RWT8f5+XFKs1ljvlerJnx2iLj4DPwtSrv
 cOm4OsYGh4JUyb/GAKgc0II3a1Jw5sGmzlYuxGSItL8LbEFXExL5lmnBdGJnymghpqez
 oWLmBHJgVCkFuqwbpI5izL50OHQhDz5pgqT8/md3RgPsTUmv3FHDJ0/d/AFxVCaco7ao
 YU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rkuq+qbQ+xQQUmcf97+8M3mc/Oami6+rdxnQxUjRSco=;
 b=RbI0eKzXH/F09zVOOsxghJKEgMCxUEfu4y5wizN9Lksy7dttFHEHSIB5Qd/v08b1Po
 ceJaITOHCrTGyZxHopZQJSJmsBlp/IegGyEpJlStBToFYYUslyBY+w7/phZxiPmY5+LK
 eTs589Tph2eqQRhxZcvHhFTOfoy3XZGsgxMltFTlztcdCyRRfC1Qj1HexJV+xhIEf+DD
 BYdXpGBBo6fWgBOsusn8GOxPFXkzF9xJ1YKjIel83hzwCNV9tqrHuh653e92rchCq2Ci
 bnPqm77IxIoQsZ0l+ssNflQQxbg4oLkxUNH+SN6PN//MIsysrnckYlYPZ5rHvOIVlbv5
 ZMBQ==
X-Gm-Message-State: AOAM532vjOSYAg0MgH80I1Y/f6JB5zhUi5UDmR3E3o42kKMkKlwnhXek
 P0UST964y/pRUONjiN743vCi72jXUuIIULQRIzgSvg==
X-Received: by 2002:aa7:d686:: with SMTP id d6mr14259970edr.146.1615553282084; 
 Fri, 12 Mar 2021 04:48:02 -0800 (PST)
MIME-Version: 1.0
References: <20210310135218.255205-1-drjones@redhat.com>
In-Reply-To: <20210310135218.255205-1-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Mar 2021 12:47:43 +0000
Message-ID: <CAFEAcA__Lm7D8SWKMB8bkUggeoyNFpUZ8-jfYFJa_yjOWmMY3w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hw/arm/virt: KVM: Set IPA limit when possible
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marc Zyngier <maz@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oJeRf32rQdx4

On Wed, 10 Mar 2021 at 13:52, Andrew Jones <drjones@redhat.com> wrote:
>
> This series fixes IPA limit setting for mach-virt KVM guests. The
> first patch restores the setting of IPA limits for values greater
> than 40 (the default) when necessary. The second patch ensures values
> less than 40 may also be used. The default KVM type=0 (which means
> an IPA limit of 40) is still used for legacy KVM, since it must be.
>
> I tested this with a KVM that supports KVM_CAP_ARM_VM_IPA_SIZE and
> with a KVM that does not. mach-virt's memory map didn't allow me
> to test with less than 40 on the KVM_CAP_ARM_VM_IPA_SIZE supporting
> host, but a quick VM fd opening test seemed to prove KVM would be
> happy with that. Testing was done with a typical Linux guest and also
> with kvm-unit-tests.
>
> I caught the bug that the first patch fixes by instrumenting QEMU
> to observe which IPA limit was getting selected, and then seeing
> that QEMU wasn't actually running mach-virt's kvm_type method at
> all!



Applied to target-arm.next, thanks.

-- PMM
