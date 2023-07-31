Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2144330ejb;
        Mon, 31 Jul 2023 05:40:21 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHOEowyZOLs340P7qPbCAAYIN7cBuFDpYkyqBrUglS4hGLFFS2RWqbgkvc1Qd+zEvF2YWOU
X-Received: by 2002:a05:620a:1407:b0:766:f9a5:c80e with SMTP id d7-20020a05620a140700b00766f9a5c80emr8389728qkj.61.1690807221669;
        Mon, 31 Jul 2023 05:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690807221; cv=none;
        d=google.com; s=arc-20160816;
        b=SpjTFnonqsi3ZrTrOZLMY/vES5sfWxb7XzTdYhRcmC5jlxin0egSL69oWlNu0MxvSZ
         jyy4rLb6hHZpSaPRrLPt6m2Zf5CamGyzyFhHw5NHCUbV8N4YVp/aZqUKGDz79pLUCyRi
         wEKjgOqB13stq5Am0AyyGYbLDVjPPXpHJwEU/ru+JDF49mxA9reKmh9FVLRSsEIk6CTt
         EIb8akq+K3JyK3O5tsPGxO4CQwgWf1g6cXkm0CoOExu7hEjIyYAXJI59oe/9Ms37Pc6/
         ++bBOIWc4kXo63j8q0nDAA0TRgLWdxG4446u3udNueQnQTTS14+JTLRUb+MhjWOnj2WQ
         C4KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/XiD5kf5yxuft+dYYppI1TYu3hyIMtw7QNRYgFpVgTo=;
        fh=9+CIGCKWA35TCscf0rf2Scy5gYJA/xM176rhnppIfRw=;
        b=VbJwKzPqBX7xN1Q934mo4XlZ15Un3HK1JYbw5kJBA2rRk2Nwl8JQPnqR5QxA2tRFL3
         6QXEsIvHSnf8axcp8nYWiiECM9tiiPOMwI9PHMwuxsjLQs0JfoFabFgSf+vV6NNFO23u
         YU1eKZ2IjFJK84EXHAYR5Z6CW5Wcsd+2BU9BlY3TFxRYrTrR1klMJBwUv/eRwCOABu6K
         vDjFIZY+xd7caiZrRj9lhmlCjtC/kofMJz4jjBki0fM5H0MNHwdzJ8zQpngrKbFOkUPf
         Snzs4D16e63IC296E5EWU/m0LD3ZlczMOUQfo8MnGGUn2oOxDazAUZm5H0NByGDtCjvV
         qWaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j+MnGbvF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay15-20020a05620a178f00b00767da13c9bcsi5684587qkb.446.2023.07.31.05.40.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Jul 2023 05:40:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j+MnGbvF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qQSBg-0007LD-CW; Mon, 31 Jul 2023 08:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qQSBf-0007Kh-8c
 for qemu-arm@nongnu.org; Mon, 31 Jul 2023 08:39:47 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qQSBd-0001ud-HG
 for qemu-arm@nongnu.org; Mon, 31 Jul 2023 08:39:47 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-522ab301692so3979237a12.2
 for <qemu-arm@nongnu.org>; Mon, 31 Jul 2023 05:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690807184; x=1691411984;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/XiD5kf5yxuft+dYYppI1TYu3hyIMtw7QNRYgFpVgTo=;
 b=j+MnGbvFwgOYCDYHck1BKz7teqZ/SZgv6MSXarJjXhdoEj9aXX1lfMyjaWbGJQHWF0
 c/nkBzx79mimAh4DtTvtTKwq5lAj8ed6okFV2w+YL9B7q72Opa+Z3ZuJiBDetpDFNy39
 hSHz1efnm7aGxHsR9ZDMqItmzfNchnIp26oeBCdZ55ZUk6C3O4bBhmgKLiC+fspFZq0n
 BdV+MztQV/iZcvtNCs+gfTWVu1iFnCZHVX9jeqElYh9XdXyr8oz0gRWw4IZUhpM0g7Zu
 3qSDQIkeaEnFBJryVowF1qMTkVRBTerpB9xWHITvqQ7AfLepO42HVJAX9DjFS7H5EnXQ
 O4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690807184; x=1691411984;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/XiD5kf5yxuft+dYYppI1TYu3hyIMtw7QNRYgFpVgTo=;
 b=Tsesd5vLR7BLbUompzfo9N3dC7XdYeGHZfBAcMLhvsR3rilFNqCREzNj1vSHhC3oYc
 OciZng5I1yDhu98eTG4O2L+IKXOtbX7OM+6JxiGsRBkYUKQeMrOOpqFNd3VS+mpkwiH2
 JIoADyzeMPFv45arHyn6E7RnqqMXSbcOgwG467POulj6/7miQyZBOT7rVOFQRuvL9jCy
 qieCjrtFDAxjFuqBj9mM3X/byIsg+3vqemXqIkHamdqhkMe2Z2oZHLOJsdVIthgX1Zjb
 otOgZydnJjJfubQdxkOKmlTYzOp44Kf+92HmpY64uk6auPAitMk6u6BHwaVfMLBwhA8t
 2dfg==
X-Gm-Message-State: ABy/qLbObRsLmKfK/8ysJRC4rx06h1c2wI5CA/2ti6ckBgOIcNbRhHlr
 Luj1qFCNjIoq4CNTKpxKz5zXZU3cay6JMIfUr6Yz6w==
X-Received: by 2002:a05:6402:1208:b0:51e:1af0:3a90 with SMTP id
 c8-20020a056402120800b0051e1af03a90mr8538827edw.37.1690807183801; Mon, 31 Jul
 2023 05:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230730234840.1989974-1-gshan@redhat.com>
 <af597a7c-5580-ffc5-d435-dd7e0ccc63d2@redhat.com>
In-Reply-To: <af597a7c-5580-ffc5-d435-dd7e0ccc63d2@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Jul 2023 13:39:32 +0100
Message-ID: <CAFEAcA8Uc7S4oBzKi_9AGCEkNdeZX1U73bvit6RmQo8_A7QLoA@mail.gmail.com>
Subject: Re: [PATCH] kvm: Fix crash by initializing kvm_state early
To: David Hildenbrand <david@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 pbonzini@redhat.com, philmd@linaro.org, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZaHz26DDQHG2

On Mon, 31 Jul 2023 at 08:18, David Hildenbrand <david@redhat.com> wrote:
>
> On 31.07.23 01:48, Gavin Shan wrote:
> > Runs into core dump on arm64 and the backtrace extracted from the
> > core dump is shown as below. It's caused by accessing @kvm_state which
> > isn't initialized at that point due to commit 176d073029 ("hw/arm/virt:
> > Use machine_memory_devices_init()"), where the machine's memory region
> > is added ealier than before.
>
> s/ealier/earlier/
>
> >
> >      main
> >      qemu_init
> >      configure_accelerators
> >      qemu_opts_foreach
> >      do_configure_accelerator
> >      accel_init_machine
> >      kvm_init
> >      virt_kvm_type
> >      virt_set_memmap
> >      machine_memory_devices_init
> >      memory_region_add_subregion
> >      memory_region_add_subregion_common
> >      memory_region_update_container_subregions
> >      memory_region_transaction_begin
> >      qemu_flush_coalesced_mmio_buffer
> >      kvm_flush_coalesced_mmio_buffer
> >
> > Fix it by initializing @kvm_state early. With this applied, no crash
> > is observed on arm64.

> As an alternative, we might simply do nothing in
> kvm_flush_coalesced_mmio_buffer(), in case kvm_state is not setup yet.
> We don't have any notifier registered in that case.

Yes, this seems better I think -- conceptually kvm_init()
probably ought to first set up the accelerator state and
then set kvm_state last, so that other code that looks
at the kvm_state global either sees NULL or else a
completely valid state, not a possibly half-initialised
one. (We should probably also NULL the global in the
error-exit path, though I imagine we're about to exit
in that case.)

Is somebody able to write/test a patch for that today?
Ideally we'd fix this for tomorrow's rc...

thanks
-- PMM
