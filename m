Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5957425lfb;
        Thu, 10 Dec 2020 06:35:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRXiA0xIUKvq4OPJ6ytxXKgSfVi/wpFM8St88WV8JoW7tafSyNmcbR3d7va8bLN3spCbcr
X-Received: by 2002:a25:e0c3:: with SMTP id x186mr11890203ybg.431.1607610930371;
        Thu, 10 Dec 2020 06:35:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607610930; cv=none;
        d=google.com; s=arc-20160816;
        b=RcQhPGi5bQHOuxJ4lLqw1jncbROyXjQJwxByv52RNC6bNTxZoTwfm1N2gytIt3lu0N
         eznefAB2Ba/kSiasa3aQVpybpYexPNnVMmSRavJJ71tdieJHQa6CvJNHr+RyVj0VhYLu
         zMmqxFoXYElLG+d4j89Tf2llM6pjo7gQPJu+Ugr/0hWYmh8Ax04LVnXWfqpT9KJjifCf
         4ol1nHPxlwmwdeCuS/2p9iM21x0hDw3i3k/NRPFkXZI3QcanPNTiIvzQE2donG5GFe0z
         5iLy2YINYhQE6/Wxuwz2xCF8+oO8Sr0uW2UR0+Wpb90iatXO7OGN5yeL/KTlxUT4gr2O
         +WRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=1iJnxtvgCJ39eWBsSfprAe1n+FbeGJcCIfWwLPok5fk=;
        b=ozWi2QFU4B8vW/jszi8/ri8PfhIL3BygZnOUhSZQ832+mGdAdXMo7T0Ddb5ji4gOCa
         OhkjwqaIU5RQWXSvkpXLcB7YIDhV2QM++n2gWdshZw0OCHJhNWfMUASBiCvmqqGs+LYa
         n3GAL2q2xRPOMwb1NJ86V0T+lWLAe4thq5SVraok7b5Rl7zi8bp/u6laly4bmiS2WuQ4
         ok2C4C9LDp1blow8luSMDvkuh2PMUY10mwG71Yydn+bUC7vfs7zLzaqC6zQUSJYwV5l7
         e3R514kAuvayxmBXwVQGrXjx5cxWptHLYrrHkVDnzJPiXbVP9NS5Za8J3ym36vitjdL1
         Gcyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Yyye2moY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c1si3947632ybi.98.2020.12.10.06.35.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Dec 2020 06:35:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Yyye2moY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1knN2W-00060Z-N7
	for alex.bennee@linaro.org; Thu, 10 Dec 2020 09:35:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knN25-0005zF-Ii
 for qemu-arm@nongnu.org; Thu, 10 Dec 2020 09:35:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knN24-0001h5-1Y
 for qemu-arm@nongnu.org; Thu, 10 Dec 2020 09:35:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607610896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1iJnxtvgCJ39eWBsSfprAe1n+FbeGJcCIfWwLPok5fk=;
 b=Yyye2moYE9CZPUVdqN+WHMZMxMfDtbT90d+x+Hl4s5zFtKuYh6pSRgPjR74PsS24hdZmCV
 75RPpdPV7GNKWigCV+uiA+rNYJjZnCXe/dNtKdf+R2lOdv44cyd/xhFfoZthnVxB1FA7A/
 gYPw+zH5V/LedLwNnuwFWdFnsQwy3Jo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-mZZubWnqNWiOafwBDJ0IsQ-1; Thu, 10 Dec 2020 09:34:54 -0500
X-MC-Unique: mZZubWnqNWiOafwBDJ0IsQ-1
Received: by mail-wr1-f69.google.com with SMTP id v1so2005030wri.16
 for <qemu-arm@nongnu.org>; Thu, 10 Dec 2020 06:34:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1iJnxtvgCJ39eWBsSfprAe1n+FbeGJcCIfWwLPok5fk=;
 b=jUPdt1wLdIpHr+aA1jRPP2zbRpvwd+8/IT9hEbUR7koFd/CKaMbK86khBe1ei9Ljl6
 z4mOALOZBf+oyn/I+Yn0UM88sRwbS/YMJt3H6Sy1UQO4axd7eMOFYxuT07aUJwcXnvOU
 S4gEK2pyt0uuJZzIW/7s39ie5dXJ+BEkGMxwYhBqbiWnPgwLOmT8V6c0HB1ZBWY5LAhp
 SoE00H7mIseK59Qp5J7smSIkuNmWc19XyjAb80k0gm6LOq1y2U475VrNj/lpBfKfZpSX
 MR5B3QTDE/qUYnaevnLOwYZpTlgJuU/lV2nsPmmmkp2N6U7A6n0+b6XaS9T7iBbffXDJ
 mdYw==
X-Gm-Message-State: AOAM532ANZd9HE/5kRvfKdFGvJTA3FF7UP7AgBpP98lo0fX9YH10MVdt
 N2oSfYFAPWYALAi1unH2f+wPQmePf62RWhvRNkcMz0WTWgSBxkBGMMVvW2Q1cEGtSj30qm9WGHj
 H3xgvQclUExZM
X-Received: by 2002:adf:c648:: with SMTP id u8mr8613015wrg.215.1607610893492; 
 Thu, 10 Dec 2020 06:34:53 -0800 (PST)
X-Received: by 2002:adf:c648:: with SMTP id u8mr8612994wrg.215.1607610893357; 
 Thu, 10 Dec 2020 06:34:53 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id b9sm9513717wmd.32.2020.12.10.06.34.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 06:34:52 -0800 (PST)
Subject: Re: [PATCH v3 08/13] audio: remove GNUC & MSVC check
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-9-marcandre.lureau@redhat.com>
 <a162ec7c-4dc3-5784-866e-dc95f6919b1f@redhat.com>
 <CAFEAcA_xbEm+DmP5hixtkzWJK1fi8X7wZh+eGKmDneZv_=-xbA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ac25b79a-c22a-04ab-f125-873710ef9f6d@redhat.com>
Date: Thu, 10 Dec 2020 15:34:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_xbEm+DmP5hixtkzWJK1fi8X7wZh+eGKmDneZv_=-xbA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fNAehlOHLOZf

On 12/10/20 3:27 PM, Peter Maydell wrote:
> On Thu, 10 Dec 2020 at 14:26, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> On 12/10/20 2:47 PM, marcandre.lureau@redhat.com wrote:
>>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>
>>> QEMU requires either GCC or Clang, which both advertize __GNUC__.
>>> Drop MSVC fallback path.
>>>
>>> Note: I intentionally left further cleanups for a later work.
>>>
>>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>> ---
>>>  audio/audio.c | 8 +-------
>>>  1 file changed, 1 insertion(+), 7 deletions(-)
>>>
>>> diff --git a/audio/audio.c b/audio/audio.c
>>> index 46578e4a58..d7a00294de 100644
>>> --- a/audio/audio.c
>>> +++ b/audio/audio.c
>>> @@ -122,13 +122,7 @@ int audio_bug (const char *funcname, int cond)
>>>
>>>  #if defined AUDIO_BREAKPOINT_ON_BUG
>>>  #  if defined HOST_I386
>>> -#    if defined __GNUC__
>>> -        __asm__ ("int3");
>>> -#    elif defined _MSC_VER
>>> -        _asm _emit 0xcc;
>>> -#    else
>>> -        abort ();
>>> -#    endif
>>> +      __asm__ ("int3");
>>
>> This was 15 years ago... Why not simply use abort() today?
> 
> That's what I suggested when I looked at this patch in
> the previous version of the patchset, yes...

Ah, I went back to read v2 thread. Actually I even prefer
Gerd's suggestion to remove this dead code.

Regards,

Phil.

