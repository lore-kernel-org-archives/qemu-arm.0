Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp336895ejb;
        Thu, 25 May 2023 03:33:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7szRECr7DPuius0nnbyCJmf+pWRmubrAbZ/HYsbpqpqUzf/T6n5iUs5JZn78jqPE0JJcAU
X-Received: by 2002:a05:6214:1949:b0:625:aa49:c344 with SMTP id q9-20020a056214194900b00625aa49c344mr772605qvk.56.1685010792871;
        Thu, 25 May 2023 03:33:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685010792; cv=none;
        d=google.com; s=arc-20160816;
        b=jZcm8bGVmQM1x61tPbeDTZFVh3BdZZqwMtYeutkHHphG6aJdNyz9TSnLs/rJci7PRM
         R0ydLx9TA10WjOdMVeMnGBrQkM9jN/tQIvZrAM5hz1A29Y3t4cjoq+YHlFEB4E8ZWOSs
         Y4afmZg6xrXnl/uJtbOGH4zZIK344QY8p8l4GjQs/YKNgeLS07JOQM0swjVpM8WOBWcm
         vbAvPZX0N8QHO76MwaKRyUHQ9boTZB3q20NoDBWB2Eii/rCNRYP9lMfoZJjNsNI6U6pC
         9lyx1qd13rmZIiKdXtxJhvLUxy59B1UerQJ2BU/df4IVwzaQMuiqw3Ii2fQAAPC8Oh20
         MyvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:subject:from:references:cc:to
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=FEVH6DkacaJgwWC+8//bto37GWwtp2WGKa4EBgcBcjo=;
        b=wGky763Tc1mpZa/k2WX5xTshxW+3EpxxcjO/aPYAKCmEICjbTMBfT0QTx5YOHx3rsV
         1aejo4p1AkwLl2wAPJHG/GbXwiAxQZ2Ib4NOO6zQ+n2hbsnD2lLAv+8XEko9EV8IgLkk
         IJwozDhwKSL5i7oqZuAugmcjvcGQzBIaPk8Z187NCP9bkcQG0EEamMlcfZxqIi3dv/HR
         N07AxQN6bHGkfdyPzWfrDkfUlWUuy1qyW8S2whjukxcG4JWyTkCOBxv2T9oEr9Bfyq9Q
         T3nhcB5ZTaOQqxQlnMagrVATtsWPswlgHvERHRdpkxgLLimyR6/cy4vMGAXlr9+j6XpW
         3W+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eMfRiuWX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pn12-20020a056214130c00b005e3cb6966afsi344433qvb.597.2023.05.25.03.33.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 03:33:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eMfRiuWX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q28HF-0002XB-B4; Thu, 25 May 2023 06:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q28HE-0002T7-DT
 for qemu-arm@nongnu.org; Thu, 25 May 2023 06:33:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q28HC-0001zM-1R
 for qemu-arm@nongnu.org; Thu, 25 May 2023 06:33:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685010777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FEVH6DkacaJgwWC+8//bto37GWwtp2WGKa4EBgcBcjo=;
 b=eMfRiuWXBvCNuQqcGUYBaj1UKrjtlWnRGtZk7Xtghp+xFFq9X/7mVqiI7vzJUybtLJPAze
 T14ZnqNTcDxpSSDB0LQTQNKnmERidpxySiLcllPgTZstQrZOpnLJcbpxa/DrAOrNTqh+0Z
 ONKovkWHVWc88TL0EjDVDOaXpmiZVdE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-b41YmxOoOEylbzmmxfFggQ-1; Thu, 25 May 2023 06:32:53 -0400
X-MC-Unique: b41YmxOoOEylbzmmxfFggQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f608ea691fso2640485e9.3
 for <qemu-arm@nongnu.org>; Thu, 25 May 2023 03:32:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685010772; x=1687602772;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FEVH6DkacaJgwWC+8//bto37GWwtp2WGKa4EBgcBcjo=;
 b=MPNqPuzviSpKOepLT7Rv4Tcq01z4qbEtRvKRwZRPskNBvtD6CrUpKmGGCDCEsxk7Nq
 Z36iZu7T3W9bBn8HxtES49rUQJT37iV3UH/3DJq51uG7JV6/oXxDwY/RSgznK+pv3/dF
 FGg1fo2JALGqJUIUkxB1Iy2Q9v/K/Bl68c18YLoUawg8yr5mCxyIe9xU0bgCg/AFRGoA
 Rduw3HKP92bukP9qipGJYCv8ukJ/WPV/KdBXVwpTas8vE5pkdJURbORd6DV2NnUGLFg4
 tNnob9xKreICzq/wUnQ9Fn8xERNDQBNM20QuU5NHu3a6qsRalpYoYj+4F3CAeQg0dcpy
 EFIw==
X-Gm-Message-State: AC+VfDwNy/CkhOS9CI9Fa5ldgzsg0OAAUx3J3ZYcls06w6oAc+V+EM8B
 xQsKIdRSbzXqccJCsXQbgc5ifuna0XjOcW75rFg82zX8AQh0JVf31ZrnsrOQkrdvBmv7BU0hnlg
 ukQU6ZNp/XQIU
X-Received: by 2002:a05:600c:2157:b0:3f4:1cd8:3e99 with SMTP id
 v23-20020a05600c215700b003f41cd83e99mr2224081wml.28.1685010772556; 
 Thu, 25 May 2023 03:32:52 -0700 (PDT)
X-Received: by 2002:a05:600c:2157:b0:3f4:1cd8:3e99 with SMTP id
 v23-20020a05600c215700b003f41cd83e99mr2224069wml.28.1685010772265; 
 Thu, 25 May 2023 03:32:52 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-30.web.vodafone.de.
 [109.43.177.30]) by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c378b00b003f195d540d9sm5320647wmr.14.2023.05.25.03.32.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 May 2023 03:32:51 -0700 (PDT)
Message-ID: <e6444d41-62ba-2381-3b26-78e75c2da56e@redhat.com>
Date: Thu, 25 May 2023 12:32:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>
References: <CAFEAcA9GamGybSzd8FKBtmZ2qMgjRFy6D=Vhu1y0dL8m9Sa80w@mail.gmail.com>
 <20230523155644.678524-1-marcin.juszkiewicz@linaro.org>
 <e682f6d5-acbe-7910-54ef-4d75c88a3d28@redhat.com>
 <4101dedc-91d7-1735-4655-81082931b79d@linaro.org>
 <49fa8502-70f9-cdc4-1058-9d4202400db6@redhat.com>
 <CAFEAcA8OUP9vnJwRxcT7AUWPD5ANhc17ETgePYPe2=-N_ZvCsw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/2] docs: sbsa: correct graphics card name
In-Reply-To: <CAFEAcA8OUP9vnJwRxcT7AUWPD5ANhc17ETgePYPe2=-N_ZvCsw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.107, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-TUID: kOHYyRirajAY

On 25/05/2023 12.05, Peter Maydell wrote:
> On Tue, 23 May 2023 at 19:41, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 23/05/2023 19.30, Marcin Juszkiewicz wrote:
>> ...
>>>> (is there a reason why it can't be disabled with "-vga none" or
>>>> "-nodefaults"?)
>>>
>>> That's something I need to check how it should be done.
>>
>> Other boards set mc->default_display in their ...class_init
>> function and then use pci_vga_init() (or vga_interface_type)
>> to instantiate their default display adapter ... however, that
>> does not seem to support the bochs adapter yet (see
>> vga_interfaces[] in softmmu/vl.c).
>>
>> Not sure whether it's worth the effort to extend vga_interfaces[]
>> in vl.c
> 
> Isn't that a legacy-command-line-option thing? I feel like
> the recommended way to select a different graphics card
> these days would be to use -device my-pci-vga-card ...

"-vga" is kind of legacy, indeed, but currently the sbsa-ref hard-codes the 
graphics card to be always available, so if you add a "-device 
something-vga-card" on the command line, you'd get two graphic cards on your 
machine, even if you use -nodefaults.

So there needs to be at least some logic dealing with vga_interface_type if 
we want to be able to select a different graphics card for this machine. 
Then why not go the full way and use pci_vga_init() here, too? ... that's 
certainly the least confusing way for the users.

  Thomas


