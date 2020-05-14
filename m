Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1266515lfb;
        Thu, 14 May 2020 04:12:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyzMgKdhj+SdEE2rBZwWRfzGdjzvpme62u7P1occPksG2RPFPvP0n+eK5pDplw8iAUhiY6
X-Received: by 2002:a17:906:5681:: with SMTP id am1mr1541100ejc.376.1589454722214;
        Thu, 14 May 2020 04:12:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589454722; cv=none;
        d=google.com; s=arc-20160816;
        b=Q9X8mDSrCa96w8JzvpQixxo4NlUDS/4dGvATYdUXj0IVQ4LGSnzbRtfv6Vk8ntLsPB
         VxcGYh6m+a41IAJsh13YLBGJagL5LkTvfoxA43KS2LWycG38eAv2OK6KbJZq6UawMpvj
         erNPb7kSm0p6bOGZrBQZas2r3XopTZuH9+7WnDnT2B2w7Ak7ksluRhDSsXnA3HqcnlSX
         CuMaUjDeImcepoiuLKLMhL/6JKEKwI0pEmxbG3fb3KGzAgraN7S1d3KGXOmxDpxMMbF5
         43qjcQkwPQU8qYwRPzBlfEfbRQZgJ56BaI7gupFvKHTYIrPI9Ii6/wX4fFzEAexgZYUV
         KShw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kmgi+cXn2gA4xTq/eWQ2tj3BWMUlW5Uh0vA4ZY02OgQ=;
        b=zYSHPhQePjvgmGmdmTwaGtQg0q5OUlirYNkx1LvOl/fdogM35Y9sr9X8jIi7FgF7tO
         DVtreJLn3FcInGQjDds/9Dgyrm5V+8iltat4ploDErb20U809etTzglY8db/hupDwBdn
         Jj6IjbdZmwIVOgl6Z9Jlqa9Bcjj+CXAiiJErTUZUeJwsD9Bw33VmKtuA41NHTi6SIu5P
         11AcDUxIBwVOQJ5DkiwQgeCDF8fq6XHUrNMwQHtBp4WDktvIDB7HCAiTJTwsXGxNRXVi
         lifXkUoxsK8Qdc+JNbMjsw9jorzC7/6+Kgw0h7RcMuEhvE/m2QNl8ZF0Ym/8ahE4LX+0
         fmkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yOD9BEP+;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id cz15si1410130edb.381.2020.05.14.04.12.02;
        Thu, 14 May 2020 04:12:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yOD9BEP+;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbgENLMB (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 14 May 2020 07:12:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726166AbgENLMA (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 14 May 2020 07:12:00 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 584B7C061A0C
        for <kvm@vger.kernel.org>; Thu, 14 May 2020 04:12:00 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id z25so1972863otq.13
        for <kvm@vger.kernel.org>; Thu, 14 May 2020 04:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kmgi+cXn2gA4xTq/eWQ2tj3BWMUlW5Uh0vA4ZY02OgQ=;
        b=yOD9BEP+L4vp0L0QbU0583eI/64Vtdb+Vt8GUEIqlZjLC8UQDZhgu8acs5q0pZmY3R
         o00lLwlujnB8dGEB7NYufCm/qVRyh3bBTKmFL6YAs6DfZWjM/RacaQTLetZ2d2iekcMh
         2wpjzSe+4GJ3LYuag1nA+wWtaJoJR07cfnIvUkpUs5BPpQInS7+j5u99dKm6/cj4rr4V
         86qn8/Ne8n7JS2qc9+6xJwquyiClpVEjianf1m5fU45slKhjr8pxYlZNUCNzD3rr7fIb
         b3UB20VZ1tVEnjBF6i/bND/paxzBEFewoe71UUmQ5NCH65A/Qdh4zsyyxBVxwVIFZoDq
         MYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kmgi+cXn2gA4xTq/eWQ2tj3BWMUlW5Uh0vA4ZY02OgQ=;
        b=TFWGQKtUV2B/T+Y7l0xnXaQSZcsDgkYBj1sfXH/oSDS+7C5N+CNo1nghDe1YvMgpEi
         S3uv0nfuQflwRDXqnKABqtDwi+u7JdvEduBU+zBTnU3LIuW/3NQJ2IGdZIW6/o4MuElI
         Uu3dZyYfEM5ROsZBLqhf8TYVT92JdbS4Ykj7gZqhtDWiloofWfqMQNoiw7G91xJPjr/4
         GVmSrW0iEkFOXi7f3BP3IGr+Lfe/fXXMWo24czdWCkFfuTrIw1m4MweijtBLl8VuDvDx
         z1b+YctBgoEltiqM8g0njhayAnJkRZkukbyt/AxpfHDl9gaKsl748tfaZAOObfDWzcxO
         0DPQ==
X-Gm-Message-State: AOAM533WTPecQfW0jqqbhHNHKUtdp93TLLl6fykdfORyT9ONUVAk8Q1Y
        c9hXylx1smETNUVhHADLmjIzk7pu6LIGEv0vqbVb2Q==
X-Received: by 2002:a05:6830:1e4e:: with SMTP id e14mr3006788otj.91.1589454719798;
 Thu, 14 May 2020 04:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200512030609.19593-1-gengdongjiu@huawei.com> <20200512030609.19593-2-gengdongjiu@huawei.com>
In-Reply-To: <20200512030609.19593-2-gengdongjiu@huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Thu, 14 May 2020 12:11:48 +0100
Message-ID: <CAFEAcA9RBWDM4gwputTLmePuL9FJ7Xv5x1uqyFHoru21S4GkeA@mail.gmail.com>
Subject: Re: [PATCH v27 01/10] acpi: nvdimm: change NVDIMM_UUID_LE to a common macro
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     Igor Mammedov <imammedo@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        Fam Zheng <fam@euphon.net>,
        Richard Henderson <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        kvm-devel <kvm@vger.kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
        Zheng Xiang <zhengxiang9@huawei.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linuxarm <linuxarm@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: /lJ0Dz1/dQAz

On Tue, 12 May 2020 at 04:03, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
>
> The little end UUID is used in many places, so make
> NVDIMM_UUID_LE to a common macro to convert the UUID
> to a little end array.
>
> Reviewed-by: Xiang Zheng <zhengxiang9@huawei.com>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
