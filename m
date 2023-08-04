Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1915243ejb;
        Fri, 4 Aug 2023 10:41:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsPt60G+Py1p2517gvAPDMW5y7z0nG4ywKnxKcv8zPgvJ5KTGmYaaCkbtmjSeQWYxNjtZ8
X-Received: by 2002:a17:90a:3d0a:b0:263:129e:80ac with SMTP id h10-20020a17090a3d0a00b00263129e80acmr2143486pjc.38.1691170884707;
        Fri, 04 Aug 2023 10:41:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691170884; cv=none;
        d=google.com; s=arc-20160816;
        b=atO34ChPSclDj7jmtaTpyPp5CDsl+zSLEQtLUfB7G/r66QNaHvf4mGTIYpT+uRwNuk
         Sm+eAufmmxzFUno4Up8XwEYINTCkPNH1tWB2WfSri7pMNkZyOpnYM+V3esJ0jLw8vNap
         WxmYCHQDPBAHhKoHfsRE8jeJkYknA0zc0tsqCfKUu1PjrQGrgYPgw74Gp2/OaZyUO1rp
         UcmoMTQ5S1jC1zestFrxjh5e1zDw5l1Myh7rIXuFpAkkrzWcZ2TXh6sT/X/6T5JyIw/6
         DDeLN5+mSpTD+TF+xW0P7OoxsmTxgSfwqyMQsbIE5tHzSmcLifzLxQMtsX47aY8ZKQcx
         tJEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=I8DSE+JTnwjzGTqhdGV+2N88MKsz3oqj5aY2BVsl1Lk=;
        fh=XsubhDhda3Jy2jwSl6ul4B/gOYNpncuz9O4UsSnbTZg=;
        b=ikxzsf0cqok5V08t0k0Jr1fHT67CaqJKlFRqLB9HXRE+nal3c/qXn6u4UDsYYeBAh3
         HmAda4qeCDBwQxpFH2MtBJ0rVPqn8Bh2zCLTc/ESb1CmG1sVtzavK7d0sEPgIWzqjmkL
         1ac5ZcPzHH0DnzHWgniV3xsOSMZ928Es2/xaOZ6abQiUPgKG9+lb8uu/aC62VtnvhLGD
         zTGANDSkRr/K3+7pNNec4Mv7EMc5LEAEVfa7NnDYmrErPR2l92riqAlvJIdRjlyJ8Wrp
         eChEBvxpKll0OYlBp6jkZyjt6/7jWgABA79HPK7V0nRKl0VeXwUdgmajlEFNlgbbkXpF
         s6Xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yDu0lAlR;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id om1-20020a17090b3a8100b002610f13639asi5465918pjb.91.2023.08.04.10.41.24;
        Fri, 04 Aug 2023 10:41:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yDu0lAlR;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbjHDRlX (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Fri, 4 Aug 2023 13:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjHDRlV (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 4 Aug 2023 13:41:21 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DC9949F3
        for <kvm@vger.kernel.org>; Fri,  4 Aug 2023 10:41:20 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-51e2a6a3768so2973069a12.0
        for <kvm@vger.kernel.org>; Fri, 04 Aug 2023 10:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691170879; x=1691775679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8DSE+JTnwjzGTqhdGV+2N88MKsz3oqj5aY2BVsl1Lk=;
        b=yDu0lAlRP9QhH6w7lpEZy0Z/JoK1YN+Hu8QtFuf8oZYei9IvlPEKk7Ui/swbqmVCat
         jVEUfLn9xTPCuAlOfC0s4Xp5v6zAkKACZXhYtuRx1RaQNCjUri+r/iu2s9lMXoqiU6Li
         JPosLjVjzaTMcEUZN61NkPP2x4FXyi0T8IHwyf+lW13yfRS6y7cklIjwMNbYtumyK9A3
         ZPw3c1Gv3mztlK5OvD4KQ3pjPfF8SVf9xYQzKZZlr7hAIOlNqSncVe4Hf0ebnU8phs8x
         AIiPRb0nn8REDlRX+WxZu0iVorJUnUjYZg7ITAuCF1Ch8RUAABZVg9ZThewZPXV259NP
         pHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691170879; x=1691775679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I8DSE+JTnwjzGTqhdGV+2N88MKsz3oqj5aY2BVsl1Lk=;
        b=glkwh6iwLmg6lE7+llLTuEDKqA92mKq/Qp2C2IEhXGUzyzMCc0t291V5xhDHVdBXxV
         0pqNMM8xzmHyAYuh1yZn2usAKerNLcJOnImOql3SuvxiIYm+v/hxjk6Vcox2Q0TAEuVM
         5uSDc4dUKZUgIHfGkqS/5OPlLYC7o8jw/zQ7TTyjZ0XdkAD1oLcBYMFi1QMreNAP/flH
         7Orcrv7cYSXIeiyLEdXbawNR3kEFnbOKvfoqUak1a/0x+wrwTt0CmoZLIJQ9BjPJ571Z
         qbVLNwDEoIKjcdvPnrkitXZc/DgHBgdn64WGnPnnLrd1/roK/uZJOWx/XwfIf+AOHJ5z
         sRUg==
X-Gm-Message-State: AOJu0YwfLLzt/5DWIeOPzSmXR1qhwkMPSyq/R9B2wNDYJS17s0nl6p4r
        9MOkr8iNL/O4hRLWhTsrmr3V6BWjyGV63pkLzIUZ5Q==
X-Received: by 2002:aa7:d79a:0:b0:522:3aae:c69b with SMTP id
 s26-20020aa7d79a000000b005223aaec69bmr2076403edq.20.1691170878931; Fri, 04
 Aug 2023 10:41:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230727073134.134102-1-akihiko.odaki@daynix.com>
In-Reply-To: <20230727073134.134102-1-akihiko.odaki@daynix.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Fri, 4 Aug 2023 18:41:07 +0100
Message-ID: <CAFEAcA9zGqkWL2zf_z-CuWEnrGxCHmO_i=_9CY347b8zCC2AuA@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] accel/kvm: Specify default IPA size for arm64
To:     Akihiko Odaki <akihiko.odaki@daynix.com>
Cc:     qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: IuSEMKc+lf9n

On Thu, 27 Jul 2023 at 08:31, Akihiko Odaki <akihiko.odaki@daynix.com> wrot=
e:
>
> Some Arm systems such as Apple Silicon Macs have IPA size smaller than th=
e
> default used by KVM. Introduce our own default IPA size that fits on such=
 a
> system.
>
> When reviewing this series, Philippe Mathieu-Daud=C3=A9 found the error h=
andling
> around KVM type decision logic is flawed so I added a few patches for fix=
ing
> the error handling path.
>
> V4 -> V5: Fixed KVM type error handling
> V3 -> V4: Removed an inclusion of kvm_mips.h that is no longer needed.
> V2 -> V3: Changed to use the maximum IPA size as the default.
> V1 -> V2: Introduced an arch hook

Applied to target-arm-for-8.2 with an extra doc comment in patch 1;
thanks.

-- PMM
