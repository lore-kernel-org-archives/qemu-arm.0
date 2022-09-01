Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp389378ejh;
        Thu, 1 Sep 2022 08:01:54 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4zcLc2pv38hKiPnCiIL/aqAvkmdFFp8ak08Ju8w07t9jCqLJFPPCmWK9wwMgr5MDsrLHeh
X-Received: by 2002:a05:620a:4489:b0:6bb:8e2b:a51f with SMTP id x9-20020a05620a448900b006bb8e2ba51fmr19051949qkp.217.1662044513804;
        Thu, 01 Sep 2022 08:01:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662044513; cv=none;
        d=google.com; s=arc-20160816;
        b=oXh6NOyKv08TZdtgg5b09QtqYq8nQ5+CnyuuWbnWZZ8bor6JHQHUFqgeDk/YZdi7qO
         wIQzX6DucO3Emux1bBbSgdnQ3WVjeK2ogcG6qzxbwHcavt5MtE7ARhLZwOe95eG3oO5g
         4xkhat7ZXXvkXjS1YvmI7QsOE2cMrn6XXRYNcKX40r0T2+IJIWDrZcyeCrUQjPu5S+2d
         /AqI+cZYMfCRwQkZRRb1Jq/GeSGzjJKYTzV8hJrAlfWS/EPK+I0D8x85uppUYxu9cXBC
         J4dkZUpbEhgI98kWnhpvGN4oeOyxJz+aDCxMDTRoFbgvCAfNEqbcfPGkR8CU5wOvjdWw
         8iag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=OgCHwfXoVgRL+SmzB8hEajq34UrKRayOSy2P3ivNm28=;
        b=C2b5Tmq5VJbUsWde4ssYHMfhlfddr0Rn2nJO/ZcbPmg0d3dH3AeuGHTBbUecxex69Q
         SInxMWwf3F2cPgV4xW8BDa08OXSw/AZ8k8fd1PeQtYUiMY1Hx+yZYlu73nxdj/YPctgi
         uzBqwlsqmOz5Uu7nJ9Eph3sqfGTwAk/nu7xKTVXfurBR7E4RQbUBLxg/muhfnrCXZ8DV
         w6gat0fklaOSqvCATs0bYyycDheWNS3Z6XhXJzLdDRq2eTnhoU52CORsKU0feXwYcj0x
         cxEnRsXLShbQ98fWbtV4ejkL9rFFFsxca17lA3FGonzmofkUfMnZCceUE/BQUTZmDvBw
         VXRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aiEvYoIw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w17-20020a05620a0e9100b006b94021cf04si8235365qkm.366.2022.09.01.08.01.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Sep 2022 08:01:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aiEvYoIw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oTlhZ-0005hi-9O
	for alex.bennee@linaro.org; Thu, 01 Sep 2022 11:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oTlh9-0005fN-7C
 for qemu-arm@nongnu.org; Thu, 01 Sep 2022 11:01:27 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oTlh5-0003bn-16
 for qemu-arm@nongnu.org; Thu, 01 Sep 2022 11:01:26 -0400
Received: by mail-wr1-x434.google.com with SMTP id n17so22737365wrm.4
 for <qemu-arm@nongnu.org>; Thu, 01 Sep 2022 08:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=OgCHwfXoVgRL+SmzB8hEajq34UrKRayOSy2P3ivNm28=;
 b=aiEvYoIwReHj3+E7PHR2ZBqGYv5fmz6674WH8keK5PsfRAJvzAcmJlCcfX2JwXJaJ/
 M4f5nn8Hnya0008c2HhhwJX+0xv6FodsqNq93pwRdA9oYpGgJ3lJhCXQySgBmEn2kzv1
 /glYFrovjjAXG/K6dbLYgGMZvaYMlG71hPe+RKJf9RLzky5BhE+pTRy4+riSglhFim8b
 GvUsQBPF2jj06IHKt1rpaX3zza0dq6anDmMochz213k0Uccf0KEcXL4snZfuaukIWLc/
 r4UohYE3vjHhsWXUKFx3zjcA1yniStTYilgjnbjtJZPLjDlO4fiTPl8mX9hJvBarNRYt
 pnHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=OgCHwfXoVgRL+SmzB8hEajq34UrKRayOSy2P3ivNm28=;
 b=NHFrfyZ5HsZfnNYlmzySzII58PBMcFDcKxXG33t8A5fxYHSkLoAnNw96dJ4nh/BPL1
 nJ7H8/7VncEIWsT8Sp7ZxFCX3YBmgnmBGeFGISTAqkacO3n5wCx8LQn+20ejYmW6Vto7
 Tykb1Wd8LgKytPaYS2QH7nnzarKanZ9XyM2wyg+NXSeuOY3y7y4SNHvCtwGY2TCLIZ60
 wr4b7i/uXMutO4rQFcMdjgclLlGd74jRj/cpIIdBerwyzJ9H/kE5CxMrS16hfNbsyzpP
 MHpFyXLofb/ftt50PCsumuUG56L9311l0zd1RO3Zy9Kn4JyiS8Z0qOQS3DHzqbiW4E/X
 146A==
X-Gm-Message-State: ACgBeo0hKcbZlbpacB/oA1u0SQKhC68DAQKPtIreoo7JavEMpn6K1a+K
 t2S0B4sZKYhAHTuZSqbwU2Awiw==
X-Received: by 2002:adf:e74d:0:b0:226:d514:8c29 with SMTP id
 c13-20020adfe74d000000b00226d5148c29mr12930651wrn.664.1662044481355; 
 Thu, 01 Sep 2022 08:01:21 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168]) by smtp.gmail.com with ESMTPSA id
 z7-20020a05600c0a0700b003a5c1e916c8sm14148840wmp.1.2022.09.01.08.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 08:01:21 -0700 (PDT)
Date: Thu, 1 Sep 2022 16:01:18 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com
Subject: Re: [PATCH 09/10] hw/arm/virt: Fix devicetree warnings about the
 SMMU node
Message-ID: <YxDJPlKkCjxxRC2q@myrica>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
 <20220824155113.286730-10-jean-philippe@linaro.org>
 <CAFEAcA96dPtH2tAotFCdkR1CzZHU6bAnNyUXqKUrNh++5Ecd+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA96dPtH2tAotFCdkR1CzZHU6bAnNyUXqKUrNh++5Ecd+Q@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mAc48C9X/PSw

On Wed, Aug 24, 2022 at 08:45:05PM +0100, Peter Maydell wrote:
> On Wed, 24 Aug 2022 at 16:51, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > dt-validate reports three issues in the SMMU device-tree node:
> >
> >   smmuv3@9050000: $nodename:0: 'smmuv3@9050000' does not match '^iommu@[0-9a-f]*'
> >   smmuv3@9050000: interrupt-names: 'oneOf' conditional failed, one must be fixed:
> >         ['eventq', 'priq', 'cmdq-sync', 'gerror'] is too long
> >         'combined' was expected
> >         'gerror' was expected
> >         'gerror' is not one of ['cmdq-sync', 'priq']
> >   smmuv3@9050000: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
> >   From schema: linux/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> >
> > Fix them by:
> > * changing the node name
> > * reordering the IRQs
> > * removing the clock properties which are not expected for the SMMU node
> 
> Why does dt-validate insist on a fixed interrupt order here?

I think the binding can be relaxed, since the driver must always look at
interrupt-names and can't assume a specific order (given that all except
gerror are now optional).

Thanks,
Jean
