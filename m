Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp471782lft;
        Thu, 30 Jun 2022 09:09:38 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tfGdl8Zl0tl1TKrJzgNJoXuwJnuZmNPTSMrJg33AI6maD4JIFpeBjGL9ry/U+0xC0FBfdg
X-Received: by 2002:aa7:92d2:0:b0:51b:4d60:6475 with SMTP id k18-20020aa792d2000000b0051b4d606475mr15126604pfa.73.1656605377836;
        Thu, 30 Jun 2022 09:09:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656605377; cv=none;
        d=google.com; s=arc-20160816;
        b=YmfuBlO2RGA5wTgKKq3ANIIrGk8KAIwSIKCS8ne7C4H80hFqswS2xX17fIc3UM8Km1
         mf2ZQA6oA5EIUolZij89WkW83+SSV0baM+ZJrAj0LBlWvQyxVWqcfBMif/BO0/5bDjLC
         /4/smu06hYEk80lZy4GYVX/HEcXiLVZhzkyCYmywtqJcBlacPbnmsVAvq8vGA0zaUcjS
         RN5gUyl1f/4UBlOHPwUL8f8dTp4LI0PBzOBoenwz2llodPb/4bIvOKy9vvdJega198Z0
         ltrTE98m//zxLtjLthYBBsuye50e+vXLALmeMwziEQVDmcXpcFSw2I/oBoxUQzLnrUJA
         MGGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:mime-version:message-id:date:user-agent
         :references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=dONI6L1250ENwLum9Ra5Xa01f9sLBJUmUKlzObKu5nU=;
        b=J/FOiir+6Ombv8d+BUnsrDMbyMpnC9idSg30GrKsjXKXEG3Keo+Jb+ktYHrF517ug8
         beR/KM6Fo2KRbdcyuiHEL0nyhEKgBiGzO4/t1GnXFCrjrzcJXYDSYp41FYYM9Na37OMV
         jEWMWBriW9wzRmsXOoiUAdiaG1RHoo2lZtkGt8weUbFtrrikFZDxpV9kQyjS5GyKmGQe
         04LyVlmuwvJOkP+gdu8q2PCjiAkGkAoxPmKzMHjfTrjycSiuKT3iPZcyECLuSOJHMEi/
         QijQNDNJB+clzk91JoaIER5mstFMiu/ouSVRSZ5NOOovCTsE+FQhqLEUBWAsHIGI5o0x
         qZjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YWmFTm4Y;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id y24-20020a1709027c9800b0016b82ffe551si13565302pll.204.2022.06.30.09.09.37;
        Thu, 30 Jun 2022 09:09:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YWmFTm4Y;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235736AbiF3QJg (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 3 others); Thu, 30 Jun 2022 12:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235603AbiF3QJd (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 30 Jun 2022 12:09:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E87142409D
        for <kvm@vger.kernel.org>; Thu, 30 Jun 2022 09:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656605371;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dONI6L1250ENwLum9Ra5Xa01f9sLBJUmUKlzObKu5nU=;
        b=YWmFTm4YhotrteQ2+HO7MfVBEVQAi/zFXzXqj04vDdTURbPJMPS7C4DVt8qjg82N4fT5uQ
        k2++oCrx/HAifV7w3vkEoldyaTnWJ1be7HedTYSAufJeEs7TxzTS0GPM5dq6u0zpodt838
        BkQkrOJ/llNXdRAKTyV1aY0aQBaNy28=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-M93uYDPNNYqkKI8zA5tluw-1; Thu, 30 Jun 2022 12:09:28 -0400
X-MC-Unique: M93uYDPNNYqkKI8zA5tluw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94BD63C0ED4C;
        Thu, 30 Jun 2022 16:09:24 +0000 (UTC)
Received: from localhost (unknown [10.39.195.64])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 49FA940CF8EF;
        Thu, 30 Jun 2022 16:09:24 +0000 (UTC)
From:   Cornelia Huck <cohuck@redhat.com>
To:     Eric Auger <eauger@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Thomas Huth <thuth@redhat.com>,
        Laurent Vivier <lvivier@redhat.com>
Cc:     Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
        qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] arm: enable MTE for QEMU + kvm
In-Reply-To: <b684d1e6-2d8f-5d08-aae0-b085a722575b@redhat.com>
Organization: Red Hat GmbH
References: <20220512131146.78457-1-cohuck@redhat.com>
 <4bb7b5e4-ceb4-d2d8-e03a-f7059e5158d6@redhat.com>
 <87a6agsg9t.fsf@redhat.com>
 <b684d1e6-2d8f-5d08-aae0-b085a722575b@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date:   Thu, 30 Jun 2022 18:09:22 +0200
Message-ID: <87lete2kwd.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: FThVk3JiFngb

On Wed, Jun 29 2022, Eric Auger <eauger@redhat.com> wrote:

> Hi Connie,
>
> On 6/13/22 18:02, Cornelia Huck wrote:
>> On Fri, Jun 10 2022, Eric Auger <eauger@redhat.com> wrote:
>> 
>>> Hi Connie,
>>>
>>> On 5/12/22 15:11, Cornelia Huck wrote:
>>>> This series enables MTE for kvm guests, if the kernel supports it.
>>>> Lightly tested while running under the simulator (the arm64/mte/
>>>> kselftests pass... if you wait patiently :)
>>>>
>>>> A new cpu property "mte" (defaulting to on if possible) is introduced;
>>>> for tcg, you still need to enable mte at the machine as well.
>>> isn't the property set to off by default when kvm is enabled (because of
>>> the migration blocker).
>> 
>> Oh, I had changed that around several times, and it seems I ended up
>> being confused when I wrote this cover letter... I wonder what the best
>> state would be (assuming that I don't manage to implement it soonish,
>> but it seems we still would need kernel changes as by the discussion in
>> that other patch series.)
> Having mte=off by default along with KVM, until the migration gets
> supported, looks OK to me. Does it prevent you from having it set to
> another value by default with TCG (depending on the virt machine
> tag_memory option)?
>
> 		tag_memory=on	tag_memory=off
> KVM CPU mte=off	invalid		mte=off
> KVM CPU mte=on	invalid		mte=on
> TCG CPU mte=off	invalid		mte=off
> TCG CPU mte=on	mte=on		invalid
>
> default value:
> KVM mte = off until migration gets supported
> TCG mte = machine.tag_memory

With OnOffAuto, I currently have:

valid for tcg: cpu.mte=on, tag_memory=on (result: mte on)
               cpu.mte=off, tag_memory either on or off (result: mte off)
               cpu.mte unspecified, tag_memory either on or off (result:
               mte==tag_memory)
valid for kvm: tag_memory always off
               cpu.mte=off (result: mte off)
               cpu.mte=on if mte supported in kvm (result: mte on)
               cpu.mte unspecified (result: mte on if kvm supports it;
               this I can flip)
all other combinations: error
