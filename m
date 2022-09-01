Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp388367ejh;
        Thu, 1 Sep 2022 08:00:44 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7kfLjq2fhnRQUwExRjv9iCVuzMqUHTJFQz7LGR0nDJaH3hXaQN8Ph6Ksy5lvfY+ruQnf+t
X-Received: by 2002:a05:620a:2805:b0:6bc:5d4a:9618 with SMTP id f5-20020a05620a280500b006bc5d4a9618mr20114625qkp.116.1662044444689;
        Thu, 01 Sep 2022 08:00:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662044444; cv=none;
        d=google.com; s=arc-20160816;
        b=NG/YxJd5OXiM8k/Mi5YLHPqqZ96ljsSgw3iXzqZjyfynUcWyDcXOUxLj/ufXs1mZa9
         qjj9HJ3ZhTNHLMtbcifsRBK0uRKm1/KLJA44CPukM0qAttzTXKp3PgMzBm8Mxu8Mo9q3
         dhCkKx6RyLBx6iM0ZR15rPLQiFB2gcMhZrf0NaR1gOuXEVh744LRihKwDO7xEfdMwd62
         zZwOCI3urGu7gZAqxwUmsWPI3jMS45EGRttfa/C+zRCjfQIHaoCt62hauLC++Vlqfl8V
         6oa27e2/Rx7kiR1xg84wuxVloNV4rxs0HpQE3UvW4AqSEy5NWHxKoo5jVU0K/AGvF0Yt
         Hggw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=g+pf+qp46Ey6IRDWCznSNjxBcysXDKvdrVAdcHjC9ak=;
        b=eC+315ldPyBCJi3VWQiNgtA5t4RL2x0g3AcQzAmtEEu5TWzBtXYiM+OQQUaZldWYkL
         GRgBK8DPFZndVp+1UBcShBJ0KEmR+DC1G85OQ4bWN9UXtWNQVC1iDi6LaVQgB5wyF7l4
         +Gedkslxq8DUAIh7FvSbw/3PfxtJNyHSY4eoEe4IeYWbek+CHNkQOCmopreEV15EhGyk
         jDV4uzrw3JN+dW53P0VeoOXwIoBlrQiRncI+TiEndd9nbGwCJ3oAEnOjm2SqwKosgf5P
         a0ySrzh2LpA7D34Z++rPmZBCIexKNRFXp4GsUwt7wMFdzbCdRyDnz/jdBW+Uf7oVRwGV
         tDtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GQD1O68x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14-20020ad45c4e000000b004973124202bsi9446199qva.567.2022.09.01.08.00.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Sep 2022 08:00:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GQD1O68x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oTlgS-0003y8-2r
	for alex.bennee@linaro.org; Thu, 01 Sep 2022 11:00:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oTlfl-0003uo-Sd
 for qemu-arm@nongnu.org; Thu, 01 Sep 2022 11:00:02 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:41496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oTlfk-0003Fq-1p
 for qemu-arm@nongnu.org; Thu, 01 Sep 2022 11:00:01 -0400
Received: by mail-wr1-x429.google.com with SMTP id v16so20008043wrm.8
 for <qemu-arm@nongnu.org>; Thu, 01 Sep 2022 07:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=g+pf+qp46Ey6IRDWCznSNjxBcysXDKvdrVAdcHjC9ak=;
 b=GQD1O68x7Tk8TQ0nldf8uyNctsMSMywFlLvoLjerqwpxiXCebmtoBVn+nlgHsbknO2
 up0wFgs17PQsbIU4RsPKXbnWMxdJxs3TgFn8PCyFPapvg+JW+VPA/q7I8FZoe59nRs48
 2ATDjEgULgQwtGn6zqVjywOHG9gEJZtjE3EW2Up7/p/rYepE4SSnGsmUE4OHA14EmckB
 hGWMsIvxJZugF3a/d/rYJRqJxNmYb5/CNVzlUBZOi7Q1FQzKEGPk2aCl7mWd+PjvBD3D
 FWWp7aRfCCVcOYZwB8jGbrQTiyRR8FlEBkxRI0dsmXOlns7YDxgPQwgalbQC3Q1vSGsf
 13LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=g+pf+qp46Ey6IRDWCznSNjxBcysXDKvdrVAdcHjC9ak=;
 b=0M+SlOX5EZpF7COk/RdcPJ0qU2JAFIsi9iEGgLrA483fLwJtCB6reFaqr/ZWaR2ba8
 2DP7nJQk1/khYNRW42zUv3zQwpiln5jLqduOO2zc6JaAx4GHpMJ2pPK9PmIKNjdbrU8j
 TzQn8nep2ygAm68vwOyfCZZ/tUfDyil0zQHzaS/cDnIOWi8BNc1unQ8bhBnimpJ2KWkD
 SO2r4nhoxpiL5OVki9oxAa6X5PNCva5YFm1kvCHt5X1P+k/y8Kyq0u3+JS0d30VF1tXL
 P6LISH/CE14EH0E7NNiCt/kbLhBuQddX4athgVNaxgy9AgPVTfzcVAinm/Nu2iSeU5AT
 wMLQ==
X-Gm-Message-State: ACgBeo1IqNDiZImyhpDPRsU1JUqCSj5WYjft1p6wlpbAh8zAL8Hng/Hb
 QqVtpULJ22dr6eSQU8VXZJXmuA==
X-Received: by 2002:a05:6000:1805:b0:226:8c06:768e with SMTP id
 m5-20020a056000180500b002268c06768emr14713888wrh.646.1662044398551; 
 Thu, 01 Sep 2022 07:59:58 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168]) by smtp.gmail.com with ESMTPSA id
 h4-20020a05600c350400b003a54f49c1c8sm7704858wmq.12.2022.09.01.07.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 07:59:58 -0700 (PDT)
Date: Thu, 1 Sep 2022 15:59:55 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com
Subject: Re: [PATCH 08/10] hw/arm/virt: Fix devicetree warnings about the
 GPIO node
Message-ID: <YxDI67Pwc6AMNKXm@myrica>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
 <20220824155113.286730-9-jean-philippe@linaro.org>
 <CAFEAcA-8wCHuj6tZN0VB1boaOy50TtwpyUMziFgk2G4++Ay16A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-8wCHuj6tZN0VB1boaOy50TtwpyUMziFgk2G4++Ay16A@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x429.google.com
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
X-TUID: FBLopeZTMvJR

On Wed, Aug 24, 2022 at 08:48:26PM +0100, Peter Maydell wrote:
> On Wed, 24 Aug 2022 at 16:51, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > The GPIO devicetree node is missing "interrupt-controller" and
> > "#interrupt-cells" properties:
> >
> >   pl061@9030000: 'interrupt-controller' is a required property
> >   From schema: linux/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
> >   pl061@9030000: '#interrupt-cells' is a required property
> >   From schema: linux/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
> 
> Why? This is a GPIO controller, not an interrupt controller.
> It seems wrong to be advertising in the dtb that it is.

pl061 can be used as an interrupt controller, and I think it's wired that
way, with GPIO key acting as an interrupt source. I'll add this to the
commit message.

Thanks,
Jean
