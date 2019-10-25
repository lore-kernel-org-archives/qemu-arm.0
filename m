Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp3859359wrq;
        Fri, 25 Oct 2019 07:06:24 -0700 (PDT)
X-Received: by 2002:a9d:5f16:: with SMTP id f22mr3067870oti.78.1572012383969;
        Fri, 25 Oct 2019 07:06:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572012383; cv=none;
        d=google.com; s=arc-20160816;
        b=YgI4DCIjexTKxgYVYGlR9ziD0CfT3ysE61r4eNLr9R1RM0KZ5OSsUdr446xfRl4ciu
         AfAUY7TnMSVSRcJR2YOvidYOrFVvoz4XX8ew+maS5AeKm/YU4C9Als4nR2yOSzlwe6q9
         T5n7PbInKBLLvDxN/S8LZyd4Kse6sScP/Hkv95Tb0QReU+4ucN7A205oa/GYkwun59LH
         OCVDXARWg4HWDC+mBfRvH82BloQ8fPBq6fF48VTY2+Hfd3noFnjrZxtRCLhGHjDHJGSr
         /xdaMSB5dfnz9klVr5LMfG0OLRhbl1YK+sUng/brgaP2Cfgm8eZzGegYGUNhxJF9IwKk
         UFCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gJ/czhl8wcTGR+TDLiE7xOgw7ak8Anrg/+q15fXKPG4=;
        b=uCvYdZI9/lUshR1auZBJ14kkNeYbK44vvTRu0m4XKIu4PbfEk3fsQWHrUEBwGBipPe
         JKKVQWSfdowmuuwnIpxs0cKGpe9uCpsm7ZlE8oyN9vLaT0G6+ts0Utg1zvX1wts4GMVA
         +q6t5QHMO6MVRd3Be7yIyRlIqvjRTWB8bJP+rVRiy5E1XnyU71CJAsvKuTHDB1o8enRt
         my6y6oXYXmHnuXM5UXkPeyAn/srnbSaBbgeYVLv1hJvY5JhSaEEvbrA8px2aNKmHkF4Q
         xmPNQg1LOsjQw2jhxG4/RMrrUXJV50gjEGHPOvwjAvS/Sfsm0svIR2AcWjon7oZ4cjq8
         Ckhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XhskgYdI;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z11sor1211593otb.83.2019.10.25.07.06.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2019 07:06:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XhskgYdI;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gJ/czhl8wcTGR+TDLiE7xOgw7ak8Anrg/+q15fXKPG4=;
        b=XhskgYdIzSF8HQ22mXBsBqJhPZCOmKSLuZaUwhwnhev/N9c6bSUHaIBTiTlaSUGQ+T
         FuxPNwXMgs8MxxBwlQRCjRGXpMPsynoWkJnv6BZkZ5ROxstgip/EXbBDfgJnw3cZFr0c
         eYq1WTOhcUdiDAwB9vrH6LDxBrJ5OSxqEkJhdqBWgrdSFea73F1HNKsibRmdIqi22y+G
         oO3n8PFOL1GJdzUBVMQ1VcdrywqQ6IzbaRNYQC4BZk4+wQpRwbV0lpU+MHABHkYGOToK
         TBgYpSO/p61ZMVZESI1sBwJx4kBoQAg+WxH5xs5ki/mXY76nBw4V2G/hzuiDs8r8Twi3
         kPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gJ/czhl8wcTGR+TDLiE7xOgw7ak8Anrg/+q15fXKPG4=;
        b=YQCoQc6UqwhWdD8aA0GV/hszLyOmJZGYF/Ip/2ovsWihPzxy/qaPzwN7ZGCNFxJTWv
         fkRv9XOcNAwAhsz8pEb8GdXYJbVmmAYqwBucSbXxRzyp/l1vk15ydh28/ID58V3vgLwb
         CemWM6IUdjUMQBDcd27HWT7/WxelXCP6wT5AtSjWw/vuP/g2lNK43f/vvDHubspah0BH
         PYWRsVf0swOGlFhBjs7kiRcTAbI+U2SHZ1ig60iGigS9Lz4AjwESLvFs+cL3jTOZ4Zqj
         m2QiorELlIsDnTfpQrZvhMO+PbovoqNFfvcMeuvAlGvyvIoiL1+ixmmBbaM8dy7utP2t
         SHCg==
X-Gm-Message-State: APjAAAUVNMM8MJLk2rr8e4a1aNk2h9cdnmP7z7ZHznO9aTMkTCc7Kzlj
	GNZI/ZIEyYupVJfGHce8WPMDPoYhzgNU+yYvpeYrvMC0
X-Google-Smtp-Source: APXvYqwarya0gnCIlCeWY5d/v0i9HIHOu8TI5Kaag1GIkYJGEz/ntZEeWtH54Mbaxn+EPmlEzwDYCzumuOaob4yWvQo=
X-Received: by 2002:a9d:30c1:: with SMTP id r1mr3070845otg.91.1572012383418;
 Fri, 25 Oct 2019 07:06:23 -0700 (PDT)
MIME-Version: 1.0
References: <20191024121808.9612-1-drjones@redhat.com> <CAFEAcA9ehcuktCTGR0xpTvZegUkr99H62F_fiT7RY_L_dqgN4g@mail.gmail.com>
 <CAFEAcA981jAU6F9RRWBuzg+_5JDrd-ip-L_awtzdZFqKmewMvA@mail.gmail.com> <20191025135159.44siz7g3szpz23og@kamzik.brq.redhat.com>
In-Reply-To: <20191025135159.44siz7g3szpz23og@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Oct 2019 15:06:12 +0100
Message-ID: <CAFEAcA9ZdrAgMhdfUxz0OJnM-dF9XGwR-+FeqnyJAsrntGgL_A@mail.gmail.com>
Subject: Re: [PATCH v7 0/9] target/arm/kvm: enable SVE in guests
To: Andrew Jones <drjones@redhat.com>
Cc: m.mizuma@jp.fujitsu.com, Beata Michalska <beata.michalska@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Dave P Martin <Dave.Martin@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: ZEmaSyOq8nK2

On Fri, 25 Oct 2019 at 14:52, Andrew Jones <drjones@redhat.com> wrote:
>
> On Fri, Oct 25, 2019 at 01:06:26PM +0100, Peter Maydell wrote:
> > Fails 'make check' on my aarch32-compile-in-chroot-on-aarch64
> > machine:
>
> Are there easy-to-follow instructions for setting this environment up
> somewhere?

It's an ancient setup, so not really. But it's just an
Ubuntu 32-bit chroot inside an Ubuntu 64-bit host. I use
schroot to manage it.



> I guess the problem is how we're determining if KVM is available, which
> is like this
>
> int main(int argc, char **argv)
> {
>     bool kvm_available = false;
>
>     if (!access("/dev/kvm",  R_OK | W_OK)) {
> #if defined(HOST_AARCH64)
>         kvm_available = g_str_equal(qtest_get_arch(), "aarch64");
> #elif defined(HOST_ARM)
>         kvm_available = g_str_equal(qtest_get_arch(), "arm");
> #endif
>     }

> So we need /dev/kvm and the QEMU binary arch type (qemu-system-arm in
> this case) needs to match the host arch type. The problem is that
> HOST_<type> doesn't imply anything about the actual host arch type.
> <type> comes from the configure $ARCH variable, which for 'arm'
> comes from the $cpu variable, which for 'arm' comes from whether or
> not the compiler defines __arm__, and cross compilers certainly do.
> I guess we'd have the same problem in an aarch32-compile-in-chroot-on-
> <any-other-type> environment, if a cross compiler is used for the
> compiling. I should change the KVM available check to something that
> uses the actual host arch type. I assume the following works, but
> I don't know if I'm allowed to use uname() in these tests, and, if
> not, then I don't know what the right way to get the actual host
> type is.

This all feels like it's trying to do the wrong thing, ie
replicate the logic within QEMU that decides whether to use
KVM or not. Some possible other approaches:

 * If you want to know whether you can run the qemu binary
   with -accel kvm, then just try that and see if it succeeds.
 * Or use '-accel kvm:tcg' and make the test work so that it
   will pass for both KVM and TCG
 * Or use QMP to query what accelerators are available, assuming
   there's a QMP command for that

thanks
-- PMM
