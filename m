Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp164321ejb;
        Fri, 6 Oct 2023 00:50:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHId0z7TB79R7PrEwAOnkOiPMB3IlS4UZKd5Ush3C0bBCpnBoU4MRm4qLu3Mxa0ujzd9yKw
X-Received: by 2002:a25:df51:0:b0:d1c:bb1d:238a with SMTP id w78-20020a25df51000000b00d1cbb1d238amr7434536ybg.52.1696578613843;
        Fri, 06 Oct 2023 00:50:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696578613; cv=none;
        d=google.com; s=arc-20160816;
        b=Qc7LYlxmzZSXnSrxOWyrIIpcxg0KILATFo2782/OEcb+Zp8QQPehKuwUp0dYmZ3nl4
         P7CncbjjaiHBS1V4pfujjkziXwlA6eaqF4HyzYIBKDo4FQOzYy2LsFMhrFIKo1EFsJaz
         hgy4WuOezO/509r5PAzdICxvG79Cj9UlTY9cuxmwcURTCh8DGbZCmYDChE19XuwZCZVQ
         p8IxeNo66TidIh8lHBaj5uUCgPdDI/k7vchRl4j9idadlFbk2BhvtREi5O2lw1KQpqmJ
         vihcQy86sEB5nkEmpk08xFQ+UuCatSj1fVLS+5Gk/7ozR7IKPjTsgku6VMf3EtqlnpsT
         laAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=LEsJSqn4HI/DGEa8E15sUB8uaMU3fLg021YYdNgr6eI=;
        fh=LyES3u+zNQxkA479oPRojeKWGCc/pkeq6dlM1GPWinI=;
        b=j0uuLk00yGzf61Y3r3lOKlawg0V/lKdLsiI4aCkTQYbsskQ7nJ/aJaGtwYqlF+9D9B
         gNygCGt+bf3UUswyUSz7jWkt+zyRv3JDQvklrLaUVlvprtCgMu8JHrb5g+KZRnIpJ0Af
         gMzHMlqffNLIrZ1dq7g+02MfEF1gft85qE+VIIPbtAj8aD1TNgS9UXeKiWogI+XhOcdS
         KB7QcYRg0Ttx7fTfMJ1NazM/OjnnO1FPQ6WptkLxlQO/uWj74cGx2Cu0RcXjGR8XtS/P
         0f0VIDF1TmVqv3EKR8Tbc6js0RaoOhCZjI0lCvn6tbBqp1Ves4kviMsrVHJ9Way9DUMU
         INgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JQOgwjNZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10-20020a0ce14a000000b0065d124684b0si1993628qvl.340.2023.10.06.00.50.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Oct 2023 00:50:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JQOgwjNZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qofas-0003kj-9g; Fri, 06 Oct 2023 03:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qofaq-0003kU-CC
 for qemu-arm@nongnu.org; Fri, 06 Oct 2023 03:49:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qofan-00070q-I9
 for qemu-arm@nongnu.org; Fri, 06 Oct 2023 03:49:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696578588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LEsJSqn4HI/DGEa8E15sUB8uaMU3fLg021YYdNgr6eI=;
 b=JQOgwjNZ5WDUBy/xcRmxVPLiLVFXKjMweJrn7ctaRwfdGoCc09whrPM+eFRKFL2kY0H2s9
 rKOkc7b677IoZ3Qp28mvZb8zxrokr7nV/bY1NiJ40vWO6iiWFb16kGX1iDzgvdCnxlbeoN
 UxZbXeMp+LRtIlmjRQKqRXDJkMOh10I=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-jY68GxzRO-Ww4lngdiCDNg-1; Fri, 06 Oct 2023 03:49:45 -0400
X-MC-Unique: jY68GxzRO-Ww4lngdiCDNg-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-5a1eb48d346so27717047b3.3
 for <qemu-arm@nongnu.org>; Fri, 06 Oct 2023 00:49:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696578585; x=1697183385;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LEsJSqn4HI/DGEa8E15sUB8uaMU3fLg021YYdNgr6eI=;
 b=NGTfyFgKGnokcc663PkyG7rXdeUSR5qznEg8jVrYczjF00o8BfMQ6PMKa62J81a7rP
 JcZMrgKrcFxNmtlWpmpFL4oTdpxfldPoMlAX9j/sSe/MsTmMc2jDuEbq9dLfZ3bRvsu8
 HvK80fUrxkGUwn+FHrNHeOUQNX0qEjCD+y6Ibr7eVaHkSVyJqVlvt/edZXCyo5iEJUyR
 N6AR0UM7fbBCaNm8FuX3s4rwk9IF9ZpGQrwma14yV9rg1M81HaAJgWcsmY8qsGoM1esy
 9RQIMo2vHR55WjdhnES7H9g/oGrRmv5uHCyIUjW9E/+N585PqflabWsRSiwzYZcZQeZs
 lCuw==
X-Gm-Message-State: AOJu0YxZaOVBNlikUt/jBljFSGtNKBHbGUYhNEm2YeHsiD55vkPLTXHd
 W/P+2mMBhuWBxHYoW0txODR0Aw1lnKwlbL/ksmqmfX06aWoY6mGlMhi90yMNsWz/yQ/1U3RiFxL
 dtqCqDgzJOWuG
X-Received: by 2002:a0d:c787:0:b0:59f:7fb9:621a with SMTP id
 j129-20020a0dc787000000b0059f7fb9621amr7960598ywd.22.1696578585349; 
 Fri, 06 Oct 2023 00:49:45 -0700 (PDT)
X-Received: by 2002:a0d:c787:0:b0:59f:7fb9:621a with SMTP id
 j129-20020a0dc787000000b0059f7fb9621amr7960581ywd.22.1696578585022; 
 Fri, 06 Oct 2023 00:49:45 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a0ce544000000b0065b0d9b4ee7sm1177576qvm.20.2023.10.06.00.49.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Oct 2023 00:49:44 -0700 (PDT)
Message-ID: <86091688-84a1-330c-faf0-2a76d96a536f@redhat.com>
Date: Fri, 6 Oct 2023 09:49:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 00/13] misc: Rename 'softmmu' -> 'system'
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
References: <20231004090629.37473-1-philmd@linaro.org>
 <ZR1bjpEi5HdFp2xj@redhat.com>
 <85be2979-c0ca-3eb4-dae9-bbabf256c201@redhat.com>
 <00b2ec16-162e-9204-3a04-f45e0edeeb15@suse.de>
 <CABgObfZBTZZvcSPcMSRLWscyEz7B-2h9g28FJx7t7Ggux6E9cA@mail.gmail.com>
 <ZR1uWXEqcyPxsV3g@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ZR1uWXEqcyPxsV3g@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.219, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: yznuw7jrjIUb

On 04/10/2023 15.53, Daniel P. Berrangé wrote:
> On Wed, Oct 04, 2023 at 03:49:31PM +0200, Paolo Bonzini wrote:
>> On Wed, Oct 4, 2023 at 3:41 PM Claudio Fontana <cfontana@suse.de> wrote:
>>>
>>> On 10/4/23 14:37, Thomas Huth wrote:
>>>> On 04/10/2023 14.33, Daniel P. Berrangé wrote:
>>>>> Am I mis-understanding what you mean by 'finishes' here, as
>>>>> I see many references to softmmu remaining
>>>>> In particular under configs/
>>>>>
>>>>> I was also hoping it meant that we'd be changing configure
>>>>> to allow
>>>>>
>>>>>       configure --target-list=x86_64-system
>>>>>       configure --target-list=x86_64-vm
>>>>>
>>>>> for less typing
>>>>
>>>> Maybe we should also bikeshed about the naming first... "system" is a quite
>>>> overloaded word in this context already, and "vm" sounds rather like
>>>> hardware-accelerated stuff ... what about using something like "sysemu"? Or
>>>> "fullsys" for "full system emulation" (in contrast to "user space"-only
>>>> emulation)?
>>
>> I agree that changing other remnants should be done right
>> after this patch, for example $softmmu in configure. Changing
>> all targets is a very large and very user-visible change, it is
>> required but it should be planned very well.
>>
>> As to the actual target names, I think system is the only
>> consistent choice since we have --enable/--disable-system
>> (as pointed out by Claudio) and qemu-system-*.  sysemu
>> may make a little more sense in the codebase (we have
>> include/sysemu after all), but maybe that ship has sailed
>> since we have many occurrences of "system", for example
>> system_ss and other related sourcesets.
> 
> Yep, I agree with that view now, lets stick with 'system'.

Ok, convinced, seems like 'system' is likely still the best choice.

  Thomas

