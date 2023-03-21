Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp4081142ejb;
        Tue, 21 Mar 2023 06:46:02 -0700 (PDT)
X-Google-Smtp-Source: AK7set8vrEIKSzWdU4DKoYKqd4AWwNdVAdfRntkkhFzvGIK0AsAH4HbHwSlMLyE0ipR2rRXLTnDp
X-Received: by 2002:ac8:7dcf:0:b0:3d8:fd72:b4a3 with SMTP id c15-20020ac87dcf000000b003d8fd72b4a3mr4072952qte.65.1679406362639;
        Tue, 21 Mar 2023 06:46:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679406362; cv=none;
        d=google.com; s=arc-20160816;
        b=suXStj3OXwOPkGiuIyKbVCWyXqyp6aGwD8h8vR2rtIW3hYiKZOlxQBnSWa6dIuihvg
         aaV/s+oQbddAXzu7QCMqzEYnm7++SWZ64XJQ8aQXmfs2hQuMg260aTk19jEgF4yDkzha
         /L1PcN6/bgcDamrEWTFC+D3ubdZ0A3Aj5gW7rziZNcY/v+5hUtyQJhUZxYzq/hwD4/MQ
         JTWaBT8OXREALaL0QPdNpfvK5tHBoJfC+ksTJKGIqjnLqLjEZVJIU31gFNkKGrrezjAv
         lGAku+iTVGLvJ2mF3jBbZy9U1aArkOJ9l2vEQwIE3tZjTZrc5i4eKzFDNqmP8EJjqu0s
         EH3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=BdbwfzBWRr6BZiOyaVRLLqLIOYDy4EK3PvbS00YnxdY=;
        b=aFIU2Abcm7WrEXXKY123MeVR0rKIGm0s7d/k5ruLHhi35quRRf30/fcNjfByzr6v27
         EyIbq4sffI9/j23OFLEfEqBEAPinAiSF3Y1+wMUv+G3rfqMHTTC6sThhyvcLAMquEcVe
         qM8QlHIEvh2HH/xOqB5BK6r3XeVnTiNZH3bZynF5LDnLALFChJ5TM1+yILHlVkM35zOw
         gcg/WRLI+RNGnm7wwVWtHrkDoUrysjZu2hH78nLgcGe3hab4b5yZVt7TEQndP/8pyhuv
         z4j5w8Xh6/K45JuiZs4kbN6BM2bHB8ycBR1xYPyudrH0UMVgDLKuQBUp2rVqksYx7O3P
         W3pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XedWV8Uy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b17-20020a05622a021100b003e3857e8bcesi793273qtx.444.2023.03.21.06.46.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Mar 2023 06:46:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XedWV8Uy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pecJH-0006Ss-94; Tue, 21 Mar 2023 09:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pecJE-0006Sb-44
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:45:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pecJC-0000PY-FI
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:45:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679406349;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BdbwfzBWRr6BZiOyaVRLLqLIOYDy4EK3PvbS00YnxdY=;
 b=XedWV8UySY/ZAZRhDRJpfXyPnBFcNxwMzcC/5xtkOaE9plzDiJRx27S3qn5SrsyOQfBrpS
 oS34sEpn0MfBnQyO1lQuSmf3pgXstXRtr3DxXOW65pwSSpQvKkM+eXkLXumCxnSR6wNncU
 DrXGJ6/w5EKdd6Qoc7ESEr2NO2p1xCc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-Nlm-FEYcOharPJ5tEYMWrQ-1; Tue, 21 Mar 2023 09:45:47 -0400
X-MC-Unique: Nlm-FEYcOharPJ5tEYMWrQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 j16-20020a05600c1c1000b003edfa11fa91so2417629wms.3
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 06:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679406346;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BdbwfzBWRr6BZiOyaVRLLqLIOYDy4EK3PvbS00YnxdY=;
 b=FvH1ui7E94qf2tCpVWw77OOlxRUA1QRR+HSb/AEhpEdugdG10zlfksgjdmfd95OO21
 VuJ7XxhKxP3FCDPKAt7w+mIJAZl6ZPJV4dGHQEhh+IRfyElUbvhaBeZ62uG0rqOQLCSd
 HfN26jPjfE03nn5BcZupMiCmlGJxOlO3oxG3P8wV0l2qqR3MgWBYWGOuk48Gtuthr1Lh
 +s8eSa14HV8lcvbdHJRe5ljm8jCUTXNtapO8m6VGMC5tkA1pHFPO9kNxCNfS8TS3oMvx
 HP+Fm5Zo9DZsiLZl/sUrYsmP6oMCdGU5k66nZt8xOLBlpCC83wonbu4eaECOEvopnCmQ
 CscQ==
X-Gm-Message-State: AO0yUKVk1FK8Jq9d6yZDiOdF5OLmDM/NKTkH2ae7EjRBaVVM34RObpkd
 tpP3FUJe9q4//xIeO0FPK+yzGNFA0FKbKaY9mS7t2Wg7rfvGGTbHgUVFYqQf2MhGFuLyCp+tq8W
 GtuK6Q7bullYNtAo=
X-Received: by 2002:a05:600c:b43:b0:3ed:af6b:7faa with SMTP id
 k3-20020a05600c0b4300b003edaf6b7faamr2319965wmr.17.1679406346515; 
 Tue, 21 Mar 2023 06:45:46 -0700 (PDT)
X-Received: by 2002:a05:600c:b43:b0:3ed:af6b:7faa with SMTP id
 k3-20020a05600c0b4300b003edaf6b7faamr2319941wmr.17.1679406346218; 
 Tue, 21 Mar 2023 06:45:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 x33-20020a05600c18a100b003ede3f5c81fsm7376526wmp.41.2023.03.21.06.45.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 06:45:45 -0700 (PDT)
Message-ID: <c4e60ae8-35a3-d02e-a224-0f3a21dd516a@redhat.com>
Date: Tue, 21 Mar 2023 14:45:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v2 10/11] hw/arm/smmuv3: Populate OAS based on CPU
 PARANGE
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org,
 jean-philippe@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-11-smostafa@google.com>
 <6e6810c3-c01a-5a2f-4fed-64c9391e22ba@redhat.com>
 <ZBmruj7OME3Pfbh1@google.com>
 <d2e9d8d5-1cf6-67fe-e780-41038fcaa376@redhat.com>
 <CAFEAcA_NZiby7=DWaDBu7b5Dbo5sXF9N7T-0_wskZ46FR9Esxw@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA_NZiby7=DWaDBu7b5Dbo5sXF9N7T-0_wskZ46FR9Esxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nMp/3dDGEFwF

Hi Peter,

On 3/21/23 14:34, Peter Maydell wrote:
> thout having read much of the context, but why
> would we need to migrate the ID registers? They are constant, read-only,
> so they will be the same value on both source and destination.
this series modifies the values of IDR[5] (oas).  So my understanding is
the guest is likely to behave differently on src and dst, depending on
the qemu version, no?

Thanks

Eric

