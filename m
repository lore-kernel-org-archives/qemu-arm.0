Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5870868wrm;
        Tue, 15 Oct 2019 07:53:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwiDaxMeevZ39KpFvc/UsL/jMLy0wBTsA6AlGdFHmXGGr4X/hbKXs1IrXR2xYG56aJtHXH1
X-Received: by 2002:aa7:d2cf:: with SMTP id k15mr32090456edr.208.1571151193651;
        Tue, 15 Oct 2019 07:53:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571151193; cv=none;
        d=google.com; s=arc-20160816;
        b=N2z8kbjnGVVi8JPy7BRDoSARdQCRsH0qrMuJ5sr0SLJpoOlfEoWvXTZOK/dPtJP1dW
         NeqNFwKbppqTKTLrb13FA2lex9+mGZ8u3U4JlSw0rm9kLn3KE2w4yDDH1SqQUc+2IHSt
         2gEUdBGVxEGQzdkOInhQ/pm5oUvq8szrmmGwKjsnLlK5atitbfwm/iV9nnbysoc0eS9P
         rNXh0PMiupMWLwgrprPAqD8p+jWMYjHY8mOH4gz3TsVS/Ds1aNXrFO+PPVHmSSdQsdwt
         4nMUp/9/MlJeE9e5vu8hEEb+L4lZ1bvKJVpbe7c98GRbWsPP8JhZR7wANFMI3zvzbRFZ
         v2dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pJHLxWBHfbqmvzOZUSxQLaGo5BYoxOcdXmYT8MESVjw=;
        b=X/CqwPo2P8qkYXT0je8on/REOH9u73SOESL4JnYe1UqamY3dDQy+8qlUftAZZbokH8
         qvDdZbnhOGkO3oZL36Sc9EUMOtGh80ETAEacSNa/49Z89geVmBCuExd6sMAku0FlqR1w
         +gYi1ufvvYnQ90ERO4ZHVKb3m/wdbikZqbiG8aCCf7Na7BkNEBMxnfb2Y8bM3Mo792Eb
         zYL5Lv6nOLUxIIYbQjyNLn7IzgQHu2M8aUWwuSQcI+Tzss2WAMwhVL5y3ek0ix5PR9bQ
         gG06E0W0z/9iW2mSVrjgtpbgq0SlmMVTeYPpxm72Get496DGUeN0GXGl47WKb0tQO8y/
         LbOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xub1vEGE;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id g23si13160350ejk.186.2019.10.15.07.53.13;
        Tue, 15 Oct 2019 07:53:13 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xub1vEGE;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732931AbfJOOxL (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Tue, 15 Oct 2019 10:53:11 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41096 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732539AbfJOOxL (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 15 Oct 2019 10:53:11 -0400
Received: by mail-oi1-f194.google.com with SMTP id w65so17047719oiw.8
        for <kvm@vger.kernel.org>; Tue, 15 Oct 2019 07:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pJHLxWBHfbqmvzOZUSxQLaGo5BYoxOcdXmYT8MESVjw=;
        b=xub1vEGEH9eORcaWMny1wqHLHVDX8S+d+vqaqqeWA5aKqQSbiX7OrCIGAthe6hu1/d
         Mrp97VpPtfEgTqcvJ62iH5fRPmM3VcGoRg/OBifl4WEPwpYj64dGvu8B6yBHQ82l5neY
         eaEnn00p8ynrcNEPceCCijGcb42XzIddNsoN6st0PvBxXwPKwN/36BY7RG6KBgSmNy6p
         7/IzPL33RNCtbClPxUtV7wBEfETxpz57wORrtVJodn0AlQ+9IEfAc2E46iFBGz54CXva
         puTcYU/tgOJ3lLl32zPvdBjNWrRTFQjp+D+CFZksw41S9zGnVWzuT5WBCdW7khas7YPq
         B/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pJHLxWBHfbqmvzOZUSxQLaGo5BYoxOcdXmYT8MESVjw=;
        b=EdPo28xbp7Dk0sd2pXAnr6NSbWXjDZXI25dw7jQFA5FesYY5y2jun1Cbgz3b2iqxLP
         LzL91bXkAsjWLhI1VhWt3EWBvMK0D3Ymff+6aAhVDog2jYBnwfD7+3ClMTyQKMb+0Lkd
         RmjDLYbbKNW+uOCewbrp2gQPWis4om9S/6Ia+X03WC+2BuWGXcQqsh4hl/3kdYOJAxeT
         2szbsHHCYiex+tyStPJOJBAvFcqsr3TSlAV0/R/gZYtglHYuI3opibkD5lxb9mSL12BB
         sFKmcuuXZhsiEsiQz18wFzfe43kHb8L2Coqb+JlQ/SdB5Qn28+3zzqMERH/GCtwbWONq
         Usiw==
X-Gm-Message-State: APjAAAWPvTUNVQAgBL1SFevtUZzXPp8SxYKDqYgo8nmHn0C1bH5VVUCX
        SJMYsHDB9a3SKe4nyOsmhBVTi3mxP3YpcNHQuMCmqg==
X-Received: by 2002:a54:4e83:: with SMTP id c3mr29597998oiy.170.1571151190401;
 Tue, 15 Oct 2019 07:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20191015140140.34748-1-zhengxiang9@huawei.com> <20191015140140.34748-4-zhengxiang9@huawei.com>
In-Reply-To: <20191015140140.34748-4-zhengxiang9@huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Tue, 15 Oct 2019 15:52:59 +0100
Message-ID: <CAFEAcA9CWPKF5XibFtZRwavVj4PboGoaM5368Omje6qrOjV3AQ@mail.gmail.com>
Subject: Re: [PATCH v19 3/5] ACPI: Add APEI GHES table generation support
To:     Xiang Zheng <zhengxiang9@huawei.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        Laszlo Ersek <lersek@redhat.com>,
        James Morse <james.morse@arm.com>,
        gengdongjiu <gengdongjiu@huawei.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        "xuwei (O)" <xuwei5@huawei.com>, kvm-devel <kvm@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>, Linuxarm <linuxarm@huawei.com>,
        wanghaibin.wang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 1dz6MLV8RL7/

On Tue, 15 Oct 2019 at 15:02, Xiang Zheng <zhengxiang9@huawei.com> wrote:
>
> From: Dongjiu Geng <gengdongjiu@huawei.com>
>
> This patch implements APEI GHES Table generation via fw_cfg blobs. Now
> it only supports ARMv8 SEA, a type of GHESv2 error source. Afterwards,
> we can extend the supported types if needed. For the CPER section,
> currently it is memory section because kernel mainly wants userspace to
> handle the memory errors.
>
> This patch follows the spec ACPI 6.2 to build the Hardware Error Source
> table. For more detailed information, please refer to document:
> docs/specs/acpi_hest_ghes.rst
>
> Suggested-by: Laszlo Ersek <lersek@redhat.com>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>

> +    /* Error Status Address */
> +    build_append_gas(table_data, AML_SYSTEM_MEMORY, 0x40, 0,
> +                     4 /* QWord access */, 0);

Hi; this doesn't seem to compile with clang:

/home/petmay01/linaro/qemu-from-laptop/qemu/hw/acpi/acpi_ghes.c:330:34:
error: implicit conversion from
      enumeration type 'AmlRegionSpace' to different enumeration type
'AmlAddressSpace'
      [-Werror,-Wenum-conversion]
    build_append_gas(table_data, AML_SYSTEM_MEMORY, 0x40, 0,
    ~~~~~~~~~~~~~~~~             ^~~~~~~~~~~~~~~~~
/home/petmay01/linaro/qemu-from-laptop/qemu/hw/acpi/acpi_ghes.c:351:34:
error: implicit conversion from
      enumeration type 'AmlRegionSpace' to different enumeration type
'AmlAddressSpace'
      [-Werror,-Wenum-conversion]
    build_append_gas(table_data, AML_SYSTEM_MEMORY, 0x40, 0,
    ~~~~~~~~~~~~~~~~             ^~~~~~~~~~~~~~~~~
2 errors generated.

Should these be AML_AS_SYSTEM_MEMORY, or should the build_append_gas()
function be taking an AmlRegionSpace rather than an AmlAddressSpace ?

thanks
-- PMM
