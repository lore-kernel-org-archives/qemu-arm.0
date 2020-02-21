Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1867191lfg;
        Fri, 21 Feb 2020 06:28:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqxCsQCmlTPxycvTI58WSNsI/17fqDBsLinmlj5w3xRI/8CKDwg6yiSHvEQbfDXvWJMyhm06
X-Received: by 2002:a37:bc6:: with SMTP id 189mr32587831qkl.459.1582295314201;
        Fri, 21 Feb 2020 06:28:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582295314; cv=none;
        d=google.com; s=arc-20160816;
        b=GnAv2WbausFbMVIo0DswwlvceB/4lXF9jpXG/nO013PtyGiV/dBWZbOBFeNUFMSwRZ
         ZrgIz29SOhxTjgOpDu6NS2DA/AmndPlQN8jdgDGwGa5RkWhpRU6lErYdd4v716778uKZ
         OqYQncsJUh5RuQAdjo5U8n86Pf0Sfyg8qOg9Mb349CmmEjCTvMMpmzR7dm3sb64IfRo7
         2neynLDl3qBjIN9UmUMtR0UBKiI1Yium5kNWUekMvOAc80vjUXf3fwIW4AGb4mIhWqVD
         3Vx9LS61SO6WiK8r8SJpcGTi2K3fdRO+pHNpGy5o243tMX/8VcImWvkqn/VmnIO9r7Sa
         FCCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gOOjDSokGK2bCgDj0ql5Xh2E0DCjU6rwL/YmDNbmj4Q=;
        b=ei5tks/MTHTfpsLfx/Nk+0KhtvUvl+02YQycCSUcKTTxJZvVhak6hB1qLkcQfS9HUr
         i22BjJLffz079fXezCg8/LuUkdsVKQV0TkVHKvCDOsMUrwLAwppMwCY39op3rF3QyPMh
         gX6y1bfjS2+aM4CYg5JnQOoZ/1ezDe8WT1Qny3t8LUwtXzhCpTYIK2rrm+yXJl9GIEA0
         iWAY/u8wjCz78vjaH0bu0mrheFlg3bD03ycEoZMD8QqbLtjgvhMsbc9dshzQJlm76lI3
         bQvA9d2VZye3+BIaycKJo2CUrkKS/lViemk/PAY0WOHJr9Bp/r38CtOpPS/YTDHl4Veu
         9DXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cEuv6GA6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g21si1495606qtm.365.2020.02.21.06.28.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2020 06:28:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cEuv6GA6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j59I9-0001yg-MJ
	for alex.bennee@linaro.org; Fri, 21 Feb 2020 09:28:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48177)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j59HL-0001NE-Vv
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 09:27:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j59HL-0006pD-3Z
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 09:27:43 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:43773)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j59HK-0006oY-Vk
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 09:27:43 -0500
Received: by mail-oi1-x244.google.com with SMTP id p125so1707113oif.10
 for <qemu-arm@nongnu.org>; Fri, 21 Feb 2020 06:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gOOjDSokGK2bCgDj0ql5Xh2E0DCjU6rwL/YmDNbmj4Q=;
 b=cEuv6GA66jmFY/oRWZz1IMvzPhVIvmW5rdQUYcYd+b+m5Gap27PWHu53eBTsfC6t5K
 eLePIBpZny3d+boV7iwyMpHmE0hRRtGD5ujkGtSE4i2CTHcY1XDVm+Qg3JzYhHnBi/fO
 JEORDSkCC6KWhpKu/yeQSZtGx+A+SJgwkw+dSO1V56VUX5i7to6Aw8purWEUocoDd6rL
 6Ta66jZHDBYG7OYXOQUWJE2lYuA7nhwBwUMIV6Zc1cOmNfy0Qes9HY4oSi/0LYkizcT3
 rLAaXnAGQLRZdZ0RAGwe/5uRli5j4QdW8w9CbCQLKo+dKKMzngUecw0B2vANA3wvvDJT
 9apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gOOjDSokGK2bCgDj0ql5Xh2E0DCjU6rwL/YmDNbmj4Q=;
 b=sKz8oCSw3sTKpzVL0cozTLUY+DrLXapik+sT1pjmQAk2jnzI/khjHV3pOnx3uiXDPU
 8s7GrChFJaA05wdf41j+1aHWdOJb6t/ZhxpHEb/BrTgKWjPMs48bk13C7mKtqNvZ+db9
 hF83aBOdr0vRnrZvgRz49mVyvIBUBGZfN60+rNIsxu4ylTZbqnypLbGU5IeBQvFft/V6
 Yd3pmcE3bDcH8KpMT9Pic5vku3F1/txUrldxtwKSqN66hQiCBgC8jQptdZTAVHYa3zVS
 ixUFsh6SASvnjp0zhaNN9rQiNkIoyJav1kkIZii7rbOZUNz+WxOeo2shN+z2x99FBQN2
 hhew==
X-Gm-Message-State: APjAAAWD969zIQF3BgEUetBDpw8OQ63J8Tr4zeHyw+NjOg3ubPyV7pui
 ofYjSeleN8WGjNQmMMM68dgn5Eo1i6zNppvfhsBOZg==
X-Received: by 2002:a54:4f16:: with SMTP id e22mr2259550oiy.170.1582295261855; 
 Fri, 21 Feb 2020 06:27:41 -0800 (PST)
MIME-Version: 1.0
References: <20200214132745.23392-1-eric.auger@redhat.com>
In-Reply-To: <20200214132745.23392-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Feb 2020 14:27:30 +0000
Message-ID: <CAFEAcA-U9b7GVXOd0QDw526JChoD3gRhVBzLcSy++PQzHbVzFg@mail.gmail.com>
Subject: Re: [PATCH v16 00/10] VIRTIO-IOMMU device
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, tnowicki@marvell.com,
 Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, bharatb.linux@gmail.com,
 qemu-arm <qemu-arm@nongnu.org>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zRl9CD6AcXfN

On Fri, 14 Feb 2020 at 13:28, Eric Auger <eric.auger@redhat.com> wrote:
>
> This series implements the QEMU virtio-iommu device.
>
> This matches the v0.12 spec (voted) and the corresponding
> virtio-iommu driver upstreamed in 5.3. All kernel dependencies
> are resolved for DT integration. The virtio-iommu can be
> instantiated in ARM virt using:
>
> "-device virtio-iommu-pci".
>
> Non DT mode is not yet supported as it has non resolved kernel
> dependencies [1].
>
> This feature targets 5.0.
>
> Integration with vhost devices and vfio devices is not part
> of this series. Please follow Bharat's respins [2].

I think everything here has reviewed-by tags now -- does
anybody still want more time to review it, and what
is the preference for how it goes into master?

thanks
-- PMM
