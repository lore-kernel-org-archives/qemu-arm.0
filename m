Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp346168ejb;
        Thu, 25 May 2023 03:53:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7/N0yL4t/AInFgyAbaRNB+JIVrwPdBVYA60lH8BOme0ehykUmyJo0wM/K5gE7r66hQLIvN
X-Received: by 2002:ac8:5bcd:0:b0:3f5:3b4b:b2bb with SMTP id b13-20020ac85bcd000000b003f53b4bb2bbmr29578941qtb.41.1685012032145;
        Thu, 25 May 2023 03:53:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685012032; cv=none;
        d=google.com; s=arc-20160816;
        b=bDNp7zsWbjCexphp972K9lrXEnZ3IXbBi0tqqQNYIg4tTKQuXCCcZz7Bmla2MPrGOT
         DBx/ooj7PByNJZmH/hIkOmT53uIUpB0ABnJMly7bkH6djzz52AULNRPzcVCecVrPaXM0
         peAEHyqlUE3z0GiC15auInfhtYvHqAGbRP7U3sfq6AFgFZLx+AhoGLJpMwP2nd+UaayO
         96PzYUHCn0kM7GD+LxLbS/5gt+cp9hvKN0/TcSQa14CUUixTc1b61elheSqFWrRFXLoc
         mGu6bUoho9DJ0AO9sS5wgLJIALBVPLNvzjOBRXO02FLPQsVZGuwVSbBDlCgfS8V9zWSj
         BnWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ZnD8TLnfdVimAE24poFoFTZQzPKGMmP0oSTcue1NNUU=;
        b=DXwagUWpQvHhkUrdC3h065TAtUCUolnm0AEMRlB8BJWXnQPy1QMn7nIA2q+noe58xm
         mDkrSQgwwQ9SNBmLpoX0o7luI7JtLn9d/iW9I6iybaf5qESA2g8L/2hj0K8g0lTEKtPE
         ScompzCt95QRk1Ii5ZL66VSXl00z7T2gy1hMbgbyXXVpqbTIfh2aEz0w+IfrFCtCwtB/
         41vPHgHVsNPn4uarQ1Z4KD9SgavoWMBo6z8uhByCoR8aMQwrxCET0S54Rji0v/qKi/kp
         qEX8HEFtSJbcsjuV51tWoRF/xWUAEBmI+NEyGpSJY7oJOO/b5A/BJVJ9dAD1u6Kc9Ohd
         gXCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fcvMhet9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jt15-20020a05621427ef00b006237b7ba84bsi369810qvb.219.2023.05.25.03.53.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 03:53:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fcvMhet9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q28b9-0003i3-So; Thu, 25 May 2023 06:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q28b6-0003f8-88
 for qemu-arm@nongnu.org; Thu, 25 May 2023 06:53:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q28b4-0007CY-G0
 for qemu-arm@nongnu.org; Thu, 25 May 2023 06:53:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685012009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZnD8TLnfdVimAE24poFoFTZQzPKGMmP0oSTcue1NNUU=;
 b=fcvMhet9YaFs0adFBcrj2EM4d1dti9J3HT6Y5Za2uFcYfUXln8k0KY7QJSC1+juzz3iOos
 w3I2jFjO47eLyLY/TX1RB5WwckiddaI/9Wk9kfKbYy0zU2E7qzqe0t9/lTFsGjh/CdJviQ
 R52DeckM372OVwd+VN1rJy+hWsOCfmo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-TYz76HsSMjCC6s_Zx7N6Dw-1; Thu, 25 May 2023 06:53:28 -0400
X-MC-Unique: TYz76HsSMjCC6s_Zx7N6Dw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f6038dc351so1867815e9.3
 for <qemu-arm@nongnu.org>; Thu, 25 May 2023 03:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685012001; x=1687604001;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZnD8TLnfdVimAE24poFoFTZQzPKGMmP0oSTcue1NNUU=;
 b=LrSiOoCheD0qWPw29gOBgo1WmeeKiTc0972t8vj1N55eSWSQIlaRxCqsI+PkGLzFLt
 2vQ+NZQRVqXTiyMW1jNb+jZ1m214fjjfXd1Ssxpv6L66fBFfsvxYQz22HSiyo7dA1ZrV
 MrCVHgO9BroD2ex0h+LPN5CpqQq42L2ecGFxQpALRxQ0fFrNidHBnLZYw4j4VOy6jp/X
 lsuSLVhfDVcrh6x2Ndo/SikEsbV2qeajXRiW9+qOWT9WdbbStVF8aL74YJ0J/Tc2y4TW
 /jRhAlmevSoInBKbemZ8jjXSk9hdHxfRvjlKr/M2ms7CYv7afJ+SxfESFGIVvo+EaEV9
 bi/w==
X-Gm-Message-State: AC+VfDxrWxOqYFdLVcZn5JPykNm7K3exsZh64RHCFf/4VFCxbN7qBSNC
 bg/v7Fg1dQADbB7fUWWacWWxLXQfUb7LB5JmWUyIAqIduHWr237lr6qrqGtSpmdqxgT8VqlTu4Y
 XQuGU/+2gp6az
X-Received: by 2002:a05:600c:3641:b0:3f4:24c8:f7c6 with SMTP id
 y1-20020a05600c364100b003f424c8f7c6mr1980217wmq.16.1685012001832; 
 Thu, 25 May 2023 03:53:21 -0700 (PDT)
X-Received: by 2002:a05:600c:3641:b0:3f4:24c8:f7c6 with SMTP id
 y1-20020a05600c364100b003f424c8f7c6mr1980206wmq.16.1685012001455; 
 Thu, 25 May 2023 03:53:21 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-30.web.vodafone.de.
 [109.43.177.30]) by smtp.gmail.com with ESMTPSA id
 p23-20020a05600c205700b003f42314832fsm1714288wmg.18.2023.05.25.03.53.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 May 2023 03:53:20 -0700 (PDT)
Message-ID: <6d3d5c10-bd55-cd01-ad30-edaf54d39cc6@redhat.com>
Date: Thu, 25 May 2023 12:53:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] docs: sbsa: correct graphics card name
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
 <e6444d41-62ba-2381-3b26-78e75c2da56e@redhat.com>
 <CAFEAcA-BX6n3YWy+PtSED=Jex9waiez4vxqBK0+Ob3hT-SZmPg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA-BX6n3YWy+PtSED=Jex9waiez4vxqBK0+Ob3hT-SZmPg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.091, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: w0b+duiDSW2p

On 25/05/2023 12.44, Peter Maydell wrote:
> On Thu, 25 May 2023 at 11:32, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 25/05/2023 12.05, Peter Maydell wrote:
>>> On Tue, 23 May 2023 at 19:41, Thomas Huth <thuth@redhat.com> wrote:
>>>>
>>>> On 23/05/2023 19.30, Marcin Juszkiewicz wrote:
>>>> ...
>>>>>> (is there a reason why it can't be disabled with "-vga none" or
>>>>>> "-nodefaults"?)
>>>>>
>>>>> That's something I need to check how it should be done.
>>>>
>>>> Other boards set mc->default_display in their ...class_init
>>>> function and then use pci_vga_init() (or vga_interface_type)
>>>> to instantiate their default display adapter ... however, that
>>>> does not seem to support the bochs adapter yet (see
>>>> vga_interfaces[] in softmmu/vl.c).
>>>>
>>>> Not sure whether it's worth the effort to extend vga_interfaces[]
>>>> in vl.c
>>>
>>> Isn't that a legacy-command-line-option thing? I feel like
>>> the recommended way to select a different graphics card
>>> these days would be to use -device my-pci-vga-card ...
>>
>> "-vga" is kind of legacy, indeed, but currently the sbsa-ref hard-codes the
>> graphics card to be always available, so if you add a "-device
>> something-vga-card" on the command line, you'd get two graphic cards on your
>> machine, even if you use -nodefaults.
> 
> At least some boards do "only create the default graphics
> type if vga_interface_type != VGA_NONE".
> 
> Mostly what I would like here is consistency. But also, we
> haven't added a new item to the '-vga' option list since
> 2014, which makes me strongly suspect it's legacy and we
> should only be keeping it for backwards compatibility.
> 
>> So there needs to be at least some logic dealing with vga_interface_type if
>> we want to be able to select a different graphics card for this machine.
>> Then why not go the full way and use pci_vga_init() here, too? ... that's
>> certainly the least confusing way for the users.
> 
> Is it? From an Arm perspective, having "-vga" do anything
> at all is pretty confusing: it's a rather PC-centric option name.
> (Also pretty noticeable for the Sparc TCX/CG3 framebuffers,
> which are not VGA in any way.)

Ok, if this is rather an oddity on arm, then it's maybe better to do the 
"vga_interface_type != VGA_NONE" check instead.

  Thomas


