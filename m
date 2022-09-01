Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp385900ejh;
        Thu, 1 Sep 2022 07:56:04 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5zsRpj9p2l5hy7HOBrbSlvRcEtq89zHchTJHkg3fr5frdCuhMJNHr6nKAy/m+LuH8fkHK5
X-Received: by 2002:a05:622a:212:b0:344:56ad:3529 with SMTP id b18-20020a05622a021200b0034456ad3529mr24363013qtx.584.1662044164073;
        Thu, 01 Sep 2022 07:56:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662044164; cv=none;
        d=google.com; s=arc-20160816;
        b=NZlJLvq+GpvmzPJbFWUMnMNUWbXCqoFfAwvgr30VFvHrvEtLMxxvU3rUuG4otbyZt5
         AyH9qEDFqFtRLqaDJxvApsTg0Gbfjg5YYjo4ErBNVAvsAcSvR617g/BGuYMgab3XmWjd
         edYntxfJQNsZpemPRgX27gaM+72kXESoGtNUVp/SsIEiY2yb2lOgX08x3wLLmyLGDEpo
         4zj2mD08LHuCYGu4wPPc+uy/neJTHylT/Uv9mSVLrfhgx/PpxNHq727Wc8p0Ko4TfjES
         UpO1GgOl7jgmJGiRZWp1sTDrXvaAlYb6Zq/7Uy+JDKblCrK73i7i+BztFZa7+/OUQu2L
         sqWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=5uqJA5bkdeIRNpbJqifZuVvgLe4a26sOSkLM0qolaoo=;
        b=V6xtGHzbmt7/8n4EDBJuxx9qN94sBBBLkvnI1hwC6mrgIkQXtUTZizqNiKGzGiHrxH
         zU5u5EidvIKIpd/KKxPQn84EtFw5Ood7QUk3Y/o8gqMbBhVclx5f1bPRMbzh03y5uXW2
         EZE3mWvs28HctOtLKO5HP2tskV7k25/bvRXyM49pg7vjTjp+Y3V9ntdQnJ7KppsjS0y9
         FZ75nsZM/6l+8af11xYowVXQmwu1/k7LtoozOlvQ9yFKWkOIj8GzleOKTMvFn3Dqk4Hr
         zHBAKlzRLYzxaAO/K9Iay4T/AFvLVDvm6IPCvbgrv0tFEwBhCtMwP3dkL+bG3dvY5Lxw
         N/Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F6L+83M4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3-20020a05620a0f0300b006c09a4488a0si646114qkl.305.2022.09.01.07.56.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Sep 2022 07:56:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F6L+83M4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oTlbv-0004K2-Hd
	for alex.bennee@linaro.org; Thu, 01 Sep 2022 10:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oTlbD-0004IB-Co
 for qemu-arm@nongnu.org; Thu, 01 Sep 2022 10:55:19 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:43927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oTlbB-0002TY-L3
 for qemu-arm@nongnu.org; Thu, 01 Sep 2022 10:55:19 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 ay39-20020a05600c1e2700b003a5503a80cfso1634142wmb.2
 for <qemu-arm@nongnu.org>; Thu, 01 Sep 2022 07:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=5uqJA5bkdeIRNpbJqifZuVvgLe4a26sOSkLM0qolaoo=;
 b=F6L+83M4BbJnz3IN9L54sNPL09/lnlxbOrE43DdZvTuK9rfgZMsTxnQXTAyTJ7CLY1
 +ooPaqnxqe8oBN9q0KULeZB/7FRMVpr4XIJrqnRIX939HrbAWHXYVYUIzpaJV0br1ZdQ
 QGTucSkK2rfja0ljjWvTurNVByfYeXZKwq/MBJ/qVK7UjKEuKfVbD86Mc0YtMuc15XrC
 +Vve6zEOmKWLHxmMSZb5ueefl/o690vTIDP/ZUYSqKw3uCPnPCwLNw1a9JFCCN4dHmTA
 7eb1ZNDzTsR4ZaBMM6w0DuuB4QStwBKD3YvDcXskszZp1vBX3/1YOCdySZjqO6xgXM3P
 Zg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=5uqJA5bkdeIRNpbJqifZuVvgLe4a26sOSkLM0qolaoo=;
 b=LZ9ZaEWFjDHkWWVDFLNg+qD0+5B9XuIrU/u3h4G/MnVl6T//CQ0YD0sw9e6w80FiKJ
 16b+8lakD7PfAHRAdwur+i03LYRKnZrxegxliDmP6APBRRv/2jkizL7b/6DqdV+Cs/o3
 ch8gMfUvhymFLRqE/V42zeNz8H8K3RvJP5uwt9EKkBjVzNSs2IYozpQtiKECgRfY6FVH
 wgaTregGP5tRVpyXI8ufJ47IXJpmUgTDPKIkbeoxTB1ju41qzWiUw5zuCX25HTdh23zX
 ChQ/+7YU8hwlreL28GUiyciYUvTJlUm0SGpEjrQ5D30gMPYn+Tk78bf7fag5sUKIy7WD
 qAhg==
X-Gm-Message-State: ACgBeo0Paar4pXM89qNOcHAMn+o69DeQlOn9zwTbiDNW1XSS0Ok+hGhG
 IeUADJdk/2MjlHS2N3dSzg+toA==
X-Received: by 2002:a05:600c:3790:b0:3a5:435d:b2d3 with SMTP id
 o16-20020a05600c379000b003a5435db2d3mr5622929wmr.134.1662044116140; 
 Thu, 01 Sep 2022 07:55:16 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168]) by smtp.gmail.com with ESMTPSA id
 d14-20020a05600c34ce00b003a5f54e3bbbsm5756577wmq.38.2022.09.01.07.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 07:55:15 -0700 (PDT)
Date: Thu, 1 Sep 2022 15:55:13 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com
Subject: Re: [PATCH 03/10] hw/arm/virt: Fix devicetree warnings about the GIC
 node
Message-ID: <YxDH0b9xCrrHGh/5@myrica>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
 <20220824155113.286730-4-jean-philippe@linaro.org>
 <CAFEAcA-mnwzLChUp3_DP0Wz+et9sbv5mMowZn_tf7PPSkfWuSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-mnwzLChUp3_DP0Wz+et9sbv5mMowZn_tf7PPSkfWuSQ@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x329.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aQwBCRCG3AM6

On Wed, Aug 24, 2022 at 08:36:33PM +0100, Peter Maydell wrote:
> On Wed, 24 Aug 2022 at 16:51, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > Fix three dt-validate warnings about the GIC node due to invalid names
> > and missing property:
> >
> >   intc@8000000: $nodename:0: 'intc@8000000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
> >   intc@8000000: 'its@8080000' does not match any of the regexes: '^(msi-controller|gic-its|interrupt-controller)@[0-9a-f]+$', '^gic-its@', '^interrupt-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
> >
> >   interrupt-controller@8000000: msi-controller@8080000: '#msi-cells' is a required property
> >   From schema: linux/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
> 
> Why is dt-validate complaining about the node names? Surely
> anything looking for the ITS in the DT should be looking for
> it by the "compatible" string ?

The device-tree specification, in 2.2.2 Generic Name Recommendation [1],
provides the node names. Given that the guest will look at compatible
strings, changing the name is safe.

Thanks,
Jean

[1] http://devicetree-org.github.io/devicetree-specification/index.html#generic-names-recommendation 
