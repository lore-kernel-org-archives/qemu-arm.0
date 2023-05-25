Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp376912ejb;
        Thu, 25 May 2023 04:49:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5mUyLWRCQabSmlxtKen0SB5mUa1rnlxX4KKFsK+mK1C0Ecg47W/4n+VBP6j7yyxKuSeADb
X-Received: by 2002:a37:352:0:b0:75b:23a0:dec1 with SMTP id 79-20020a370352000000b0075b23a0dec1mr9739815qkd.63.1685015393389;
        Thu, 25 May 2023 04:49:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685015393; cv=none;
        d=google.com; s=arc-20160816;
        b=YvOHbWXdZSsPQ0PCi6y6Bib95qiOd5RJVxNYnlboW2/xKLYdnjiBiVb/hMMp0Xj/1v
         +Qnch/z2J2u0YkQiutnyf0OBfWtaeiX2K0mmqhULUvCwsZr2CYvQullqz3ppW1WCR2oJ
         3xHoKcxuebwPERNLTNn8e6tYm6JedyUKXBQdyLq3/3O0IKPUApRDhoJW5IDvAZkNCucp
         9LZxUmvVcKZNbCvmo0Yk+u+QFnW8NBptPZFJX6boZJndLb0cjRIQg3rjV3oEwoMiFHj8
         ooQrrU9s2SfszwIRea9Xo4JGILGiLQ7avdfKjTyve97tfczsNSan+Od4jjl5Hvw6i1mo
         CcUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=4dgPC8uTDwa1MM9V27R2UndeI639Y0bPbns0a3kp1FE=;
        b=GIH3ieNRy+YYZZyDXmN3G1SehlZDYlbj1roONEMBoxzWxaEwkNHOH2BI7frotelNje
         wcJOC9OtMlFW+wKCCscLjl6SrENGqdYNEXhGzMdkhAMdKVMOPwDV1sOtOjxzSN7KfMAa
         4DLpEaLYGopBcFr0NHVyCF6QNi1bxm+SFokWuswn3jSZtb+1SMj09t9n/+JETPYUEHUo
         KB9+xLjw9K8dPstExapRO3Z8yDRY/h6ebKyM2XX/2fO4l2ZB7jPcBRT/wyV/+2t6ijpA
         SLjEv1h0yX70eWqSW4FBayeQFAjfteYh9OjKePaUwiq/alMffnRraPkvkNBLI19WrGac
         rU0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JO+G0pwg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o23-20020a05620a15d700b007469d22164fsi409063qkm.206.2023.05.25.04.49.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 04:49:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JO+G0pwg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q29T4-000759-Sl; Thu, 25 May 2023 07:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q29T3-00074s-Qs
 for qemu-devel@nongnu.org; Thu, 25 May 2023 07:49:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q29T2-00051J-0d
 for qemu-devel@nongnu.org; Thu, 25 May 2023 07:49:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685015355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4dgPC8uTDwa1MM9V27R2UndeI639Y0bPbns0a3kp1FE=;
 b=JO+G0pwgz0ECU+kwGD7wlAc1qBL69IVfDSalWlR9QcBjvd4UwvOeK6K1/P63F8XMNTPhKk
 pYsSSSHOY7vWTLPMeGUJA2Bd+Wu9mVFMARnuebftDl8BQqRcIpuZt6BhGS68pmWkfvZnEr
 JW1/NgmcGE1Al/UBjbgleLiG4cJHlTM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-Nec68Q94NY69ED3509M1fg-1; Thu, 25 May 2023 07:49:13 -0400
X-MC-Unique: Nec68Q94NY69ED3509M1fg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3078b9943d6so812786f8f.1
 for <qemu-devel@nongnu.org>; Thu, 25 May 2023 04:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685015352; x=1687607352;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4dgPC8uTDwa1MM9V27R2UndeI639Y0bPbns0a3kp1FE=;
 b=le3uaQ/hlLNO8mLTTh08JTr/BJmte1x3zWfJCAr2f/tS6/OFq+eI7xQmSN4mn9xuks
 oh7+vAPbsSBk8+RcsDEZMXug3RcMWgAyRepuuYdQse29iUki6eGcHle6Jvz5nDjFRwIX
 96Q7b+pyw1gah910iL+AhqvM62a4GyqceXElXVCaba1ZtqD7bMVpjWAWQG0dzNSiWbS7
 cTkjFt8xHxBfHndt8uIBpa3xd0r6zd5pusfS+66M0zksRZKjENkXgW1sOROYyvgpfW9n
 eotVCrJidTk5Ky0P7RZX2oUN4oSwEoWZaeekXmu/2watrsJxXBWwcyxYDWoDXIky9oya
 MQag==
X-Gm-Message-State: AC+VfDysRVMbO3SEkL29YoS4qeJlQjckyVHcmv06IbCLd68Ij9UCD6GF
 CYUn/fYquYcIireWtfobU3AT/s2VcEI8kBNDV5s1owf/4ydk01ehCXdk8T3Ts109rmx2/ZzBQ3Z
 6ofXekwb4VVckon0=
X-Received: by 2002:adf:f58f:0:b0:306:30e8:eb34 with SMTP id
 f15-20020adff58f000000b0030630e8eb34mr1782166wro.48.1685015352308; 
 Thu, 25 May 2023 04:49:12 -0700 (PDT)
X-Received: by 2002:adf:f58f:0:b0:306:30e8:eb34 with SMTP id
 f15-20020adff58f000000b0030630e8eb34mr1782150wro.48.1685015351977; 
 Thu, 25 May 2023 04:49:11 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-30.web.vodafone.de.
 [109.43.177.30]) by smtp.gmail.com with ESMTPSA id
 g14-20020a5d540e000000b00307a86a4bcesm1581644wrv.35.2023.05.25.04.49.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 May 2023 04:49:11 -0700 (PDT)
Message-ID: <cab14b32-5419-45be-1ec0-a34d228349c6@redhat.com>
Date: Thu, 25 May 2023 13:49:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] docs: sbsa: correct graphics card name
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
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
 <87675164-50ce-a387-12a8-f965b450eb28@ilande.co.uk>
 <CAFEAcA8O2WF2JjJ5k5L9e6yn1fh8n23cpkAbxuLSkNguaUumWw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA8O2WF2JjJ5k5L9e6yn1fh8n23cpkAbxuLSkNguaUumWw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.091, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4RnyJeQefrd3

On 25/05/2023 13.39, Peter Maydell wrote:
> On Thu, 25 May 2023 at 12:06, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>>
>> On 25/05/2023 11:44, Peter Maydell wrote:
>>
>>> On Thu, 25 May 2023 at 11:32, Thomas Huth <thuth@redhat.com> wrote:
>>>
>>>> So there needs to be at least some logic dealing with vga_interface_type if
>>>> we want to be able to select a different graphics card for this machine.
>>>> Then why not go the full way and use pci_vga_init() here, too? ... that's
>>>> certainly the least confusing way for the users.
>>>
>>> Is it? From an Arm perspective, having "-vga" do anything
>>> at all is pretty confusing: it's a rather PC-centric option name.
>>> (Also pretty noticeable for the Sparc TCX/CG3 framebuffers,
>>> which are not VGA in any way.)
>>
>> Right. From the SPARC perspective it was added to allow the user to select either the
>> TCX (default) or CG3 framebuffers from the command line.
>>
>> However I guess that shouldn't be needed anymore now that mc->default_display exists.
>> Presumably there is now some kind of -global sun4m.default_display=cg3 command line
>> option that could set the machine default_display property value instead?
> 
> Maybe. Handling builtin default devices remains kind of awkward.
> But for this Arm board they're all just PCI cards, so the
> only thing we really need is a way to say "don't create that
> default device"...

I wonder whether we could deprecate and finally remove "-vga" ... there is 
also the "graphics" machine property that is used by some boards instead, so 
maybe we could use that as a replacement for "-vga none" everywhere (and use 
"-device xxx" as replacement for "vga xxx" of course). Thoughts?

  Thomas

