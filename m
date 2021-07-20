Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp4707553lfc;
        Tue, 20 Jul 2021 04:25:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBkg7MDiPUNvH4NaC6TcIK8U40aCjq6WhwGdXYG93mex3D+sf3z8cZzk0FM8AXX+n8hJTB
X-Received: by 2002:a05:6102:2259:: with SMTP id e25mr9636984vsb.4.1626780332318;
        Tue, 20 Jul 2021 04:25:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626780332; cv=none;
        d=google.com; s=arc-20160816;
        b=OhrjvVehyGOIw73mvTAmEXOKdQOuMnlcJyq4tZc3dh2zrA79KOkmXfoup1vO2+PWE9
         +AHXqDuJsmQBD+WcdxVa/QkAwCpWyn6S2t6P0dP/9KwCbmEkFQLQL+YI5DUZhiu0PM//
         nWchJ4cTTci/bBMwBCz4Q0Y6KZpLFBzaDv2lpCpuLoHpnS7QAJhNUsqUbnIx5Q00bRqB
         X0dyskMMmG0Al1z64e3NdET58HBSlv34+P3OH4brqzdNqhXAcWrYJvyL/eODJklBEzh/
         czin1VTLfrxORghYC2xAJ00PP+las3sCT0VTYi+cecORag0mPcVUku9ifk0e30k72JJ/
         RVhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=NIGmNb/O1ANuIWDglBDjPw549fxXaik6yyKDAD0bx+A=;
        b=nmQikW4T9eTUrTzpT3l7P0yZmk7yvSvlXC6pgAJcbrDkdBzBCwAT5Kp789Zlj3209r
         KKMHWFqlxkVERDqx6RqPe/IrAnXTlSHH9jrQVVhv4xDwDdyhoj5+thCKsxXABUS55UIC
         1TPhixVMl0/FRs6DfmKJO5GC5tQsWzmIrXj+5HcVWHcZZNVrd6f3VjplkPKq135pDIGl
         GOpp65w1x7vAmihl3tYNVmLRIonNP8W9aWhG9QQzqX6J5IVVok9smIOVv96XxzWqAZs3
         eNkAaQEFPFs2Z7mq9VDuAQwv7b0dlh/HjbqMZ0HlynPMWzjn4TFNvUDEnuujPlUDlDt/
         44yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ArOi/4Zs";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a15si18688341vsl.22.2021.07.20.04.25.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jul 2021 04:25:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ArOi/4Zs";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m5nsR-0005Fe-KB
	for alex.bennee@linaro.org; Tue, 20 Jul 2021 07:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5ns3-0005FJ-6E
 for qemu-arm@nongnu.org; Tue, 20 Jul 2021 07:25:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5nrz-0008S2-VM
 for qemu-arm@nongnu.org; Tue, 20 Jul 2021 07:25:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626780302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NIGmNb/O1ANuIWDglBDjPw549fxXaik6yyKDAD0bx+A=;
 b=ArOi/4ZsI/vt+rp4vXPUDk16QR0lqtfuyBrUPmWXvURJ+P/3M55tCkQxQ7MoKLKcGNSdbf
 NXbHwBsHzHTtZAfRzkaLOkQ96N5XOpi0D9bjK9NVoP9Ek0v2Y14ipqmIc8UWOVX27tkhrQ
 QpGR24YQSP6U1J0McpidNKMoIwy4zcg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-s_J3SpIgP72eN1GEVAyk5Q-1; Tue, 20 Jul 2021 07:25:00 -0400
X-MC-Unique: s_J3SpIgP72eN1GEVAyk5Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 r9-20020a5d49890000b02901524df25ad7so506536wrq.8
 for <qemu-arm@nongnu.org>; Tue, 20 Jul 2021 04:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NIGmNb/O1ANuIWDglBDjPw549fxXaik6yyKDAD0bx+A=;
 b=PTXyuB7zvvAwMSLH99oRnqQBxDsl57XPQIsCNRKcAP4FIz4bQg3Hzbz/tyT8FAF6o1
 GTJ2lAXFJ57l2Z7D0+xTz4nj/N2H+jjCkRxyXihchb+yFCAqHeJlvq8/+bbipc4w2y32
 8EhsR51lO1axL/0gF1Z9SxNVFkYVW9UpgjhSMopEovIMotcvQxEcSStOOBqdYq8nsj24
 C+cGzXcVFAnojzMEa5P2t4B8ccANhloOJloB3QfqSYGrGMbbtD9cWrNUioWl8u9zsIbP
 m+8WpdTXkhYaF7xACpXEfN1ebYJxyASM8pjMU9TjO3Ynm0rOWH+rh9QZGCCgUb64ek14
 uo4w==
X-Gm-Message-State: AOAM533wwg9f4s2jUyB9BblvsRw0fjcUJFOhDdbLUlt0TFVbL2xev3V3
 4uDDpaPn3i1UUkJrHAEJU2urLIzE/Z+v5vV2ipqkAQwu6yfds/brnc70AwQHgrrP+iWJwwHbiuA
 JfDdLpCI4MfJq
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr15506390wmj.154.1626780298924; 
 Tue, 20 Jul 2021 04:24:58 -0700 (PDT)
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr15506377wmj.154.1626780298747; 
 Tue, 20 Jul 2021 04:24:58 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id z13sm23963201wro.79.2021.07.20.04.24.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 04:24:58 -0700 (PDT)
Subject: Re: [PATCH 0/4] Add support for Fujitsu A64FX processor
To: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>,
 'Peter Maydell' <peter.maydell@linaro.org>
References: <1626413223-32264-1-git-send-email-ishii.shuuichir@fujitsu.com>
 <CAFEAcA_xMdsLtsyX3aV+JKoLuNiaR3zHmv1NXwVUkWRSAbQuAA@mail.gmail.com>
 <TYCPR01MB61601256BD8311CE6D2A6767E9E29@TYCPR01MB6160.jpnprd01.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <324188bb-3837-318f-4542-1a1762bc6943@redhat.com>
Date: Tue, 20 Jul 2021 13:24:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <TYCPR01MB61601256BD8311CE6D2A6767E9E29@TYCPR01MB6160.jpnprd01.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JHjrHxl3FLGk

Hi Ishii,

On 7/20/21 9:34 AM, ishii.shuuichir@fujitsu.com wrote:
> Hi, peter
> Thank you for your comment.
> 
>> Hi; it looks like something with your outgoing email setup still disagrees
>> with QEMU's mailing list server :-(  As far as I can tell these emails didn't
>> make it to the list, so only people on the direct-cc list will have
>> seen them :-(
> 
> As you said, it seems that I am not listed in the mail server again.
> When I contacted the server administrator before, 
> the server administrator took care of it so that my e-mail address would not be judged as spam mail, 
> but I am in the process of contacting the server administrator again.

Meanwhile you can send your series via sourcehut: https://sr.ht/

> If the mail server is able to list it correctly,
> should we resubmit the V1 patch series to list it properly?
> Or, since there are patches that have already been commented on,
> should I post them as a V2 patch series that reflects those comments?
> 
> Best regards.
> 
>> -----Original Message-----
>> From: Peter Maydell <peter.maydell@linaro.org>
>> Sent: Monday, July 19, 2021 9:49 PM
>> To: Ishii, Shuuichirou/石井 周一郎 <ishii.shuuichir@fujitsu.com>
>> Cc: Thomas Huth <thuth@redhat.com>; Laurent Vivier <lvivier@redhat.com>;
>> Paolo Bonzini <pbonzini@redhat.com>; qemu-arm <qemu-arm@nongnu.org>;
>> QEMU Developers <qemu-devel@nongnu.org>
>> Subject: Re: [PATCH 0/4] Add support for Fujitsu A64FX processor
>>
>> On Fri, 16 Jul 2021 at 06:27, Shuuichirou Ishii
>> <ishii.shuuichir@fujitsu.com> wrote:
>>>
>>> Hello, everyone.
>>
>> Hi; it looks like something with your outgoing email setup still disagrees
>> with QEMU's mailing list server :-(  As far as I can tell these emails didn't
>> make it to the list, so only people on the direct-cc list will have
>> seen them :-(
>>
>> thanks
>> -- PMM

